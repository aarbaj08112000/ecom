<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Account_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_customer_stats($customer_id) {
        $stats = [
            'total_orders' => 0,
            'processing_orders' => 0,
            'total_spent' => 0
        ];

        // Total Orders
        $this->db->where('user_id', $customer_id);
        $stats['total_orders'] = $this->db->count_all_results('orders');

        // Processing Orders
        $this->db->where('user_id', $customer_id);
        $this->db->group_start();
        $this->db->where('order_status !=', 'Delivered');
        $this->db->where('order_status !=', 'Cancelled');
        $this->db->group_end();
        $stats['processing_orders'] = $this->db->count_all_results('orders');

        // Total Spent
        $this->db->select_sum('total_amount');
        $this->db->where('user_id', $customer_id);
        $this->db->where('payment_status', 'Success'); // Assuming we only count paid orders
        $query = $this->db->get('orders');
        $result = $query->row();
        $stats['total_spent'] = $result->total_amount ? $result->total_amount : 0;

        return (object)$stats;
    }

    public function get_recent_orders($customer_id, $limit = 5) {
        $this->db->select('order_id, added_date, total_amount, order_status, (SELECT count(order_item_id) FROM order_items WHERE order_id = orders.order_id) as items_count');
        $this->db->from('orders');
        $this->db->where('user_id', $customer_id);
        $this->db->order_by('added_date', 'DESC');
        $this->db->limit($limit);
        $query = $this->db->get();
        return $query->result();
    }

    public function get_all_orders($customer_id) {
        $this->db->select('order_id, added_date, total_amount, order_status');
        $this->db->from('orders');
        $this->db->where('user_id', $customer_id);
        $this->db->order_by('added_date', 'DESC');
        $query = $this->db->get();
        return $query->result();
    }

    /**
     * Get customer details by customer ID
     */
    public function get_customer_details($customer_id) {
        $this->db->select('id, customer_code, customer_name, profile_image, mobile_no, email, gst_no, pan_no, dob, gender, identity_details');
        $this->db->from('customer_master');
        $this->db->where('id', $customer_id);
        $this->db->where('is_delete', '0');
        $query = $this->db->get();
        return $query->row();
    }

    /**
     * Verify customer password
     */
    public function verify_password($customer_id, $password) {
        $this->db->select('password');
        $this->db->from('customer_master');
        $this->db->where('id', $customer_id);
        $this->db->where('is_delete', '0');
        $query = $this->db->get();
        $result = $query->row();
        
        if ($result && $result->password) {
            return password_verify($password, $result->password);
        }
        return false;
    }

    /**
     * Update customer settings
     */
    public function update_customer_settings($customer_id, $data) {
        $this->db->where('id', $customer_id);
        $this->db->where('is_delete', '0');
        
        // Add update metadata
        $data['update_date'] = date('Y-m-d H:i:s');
        $data['update_by'] = $customer_id;
        
        return $this->db->update('customer_master', $data);
    }

    /**
     * Get complete order details with items
     * @param int $order_id
     * @param int $customer_id
     * @return object|null
     */
    public function get_order_details($order_id, $customer_id) {
        // Get order header
        $this->db->select('o.*, c.customer_name, c.email, c.mobile_no');
        $this->db->from('orders o');
        $this->db->join('customer_master c', 'c.id = o.user_id', 'left');
        $this->db->where('o.order_id', $order_id);
        $this->db->where('o.user_id', $customer_id); // Security: ensure order belongs to customer
        $query = $this->db->get();
        
        $order = $query->row();
        
        if (!$order) {
            return null;
        }
        
        // Parse shipping address if it's JSON
        if (!empty($order->shipping_address_json)) {
            $address = json_decode($order->shipping_address_json, true);
            if ($address) {
                $order->formatted_address = ($address['address'] ?? '') . ', ' . ($address['city'] ?? '') . ', ' . ($address['state'] ?? '') . ' - ' . ($address['zip'] ?? '');
            } else {
                $order->formatted_address = $order->shipping_address_json;
            }
        }
        
        // Get order items
        $this->db->select('oi.*, p.name as product_name, p.image as product_image');
        $this->db->from('order_items oi');
        $this->db->join('products p', 'p.id = oi.product_id', 'left');
        $this->db->where('oi.order_id', $order_id);
        $items_query = $this->db->get();
        $order->items = $items_query->result();
        
        return $order;
    }

    /**
     * Cancel an order
     * @param int $order_id
     * @param int $customer_id
     * @param string $reason
     * @return bool
     */
    public function cancel_order($order_id, $customer_id, $reason) {
        // First get current status
        $this->db->select('order_status');
        $this->db->where('order_id', $order_id);
        $this->db->where('user_id', $customer_id);
        $query = $this->db->get('orders');
        $order = $query->row();

        if (!$order) return false;

        // Start transaction
        $this->db->trans_start();

        // Update order status
        $this->db->where('order_id', $order_id);
        $this->db->update('orders', [
            'order_status' => 'cancelled',
            'updated_date' => date('Y-m-d H:i:s')
        ]);

        // Add to history
        $this->db->insert('order_history', [
            'order_id' => $order_id,
            'status_from' => $order->order_status,
            'status_to' => 'cancelled',
            'remarks' => $reason,
            'added_by' => $customer_id,
            'added_date' => date('Y-m-d H:i:s')
        ]);

        $this->db->trans_complete();
        return $this->db->trans_status();
    }

    /**
     * Submit a refund/return request
     * @param array $data
     * @return bool
     */
    public function submit_refund_request($data) {
        return $this->db->insert('refunds', $data);
    }

    /**
     * Get payment details for an order
     * @param int $order_id
     * @return object|null
     */
    public function get_payment_by_order($order_id) {
        $this->db->where('order_id', $order_id);
        $this->db->order_by('payment_id', 'DESC');
        $this->db->limit(1);
        $query = $this->db->get('payments');
        return $query->row();
    }
}
