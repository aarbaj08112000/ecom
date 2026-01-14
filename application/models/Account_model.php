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
}
