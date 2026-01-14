<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Orders_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    /**
     * Get orders for DataTables with server-side processing
     */
    public function get_orders_datatable($params) {
        $this->db->select('o.order_id, o.user_id, o.total_amount, o.net_amount, o.order_status, o.payment_status, o.payment_method, o.added_date, c.customer_name');
        $this->db->from('orders as o');
        $this->db->join('customer_master as c', 'c.id = o.user_id', 'left');
        
        // Search
        if (!empty($params['search'])) {
            $this->db->group_start();
            $this->db->like('o.order_id', $params['search']);
            $this->db->or_like('c.customer_name', $params['search']);
            $this->db->group_end();
        }
        
        // Order
        if (!empty($params['order_column']) && !empty($params['order_dir'])) {
            $this->db->order_by($params['order_column'], $params['order_dir']);
        } else {
            $this->db->order_by('o.order_id', 'DESC');
        }
        
        // Pagination
        if (isset($params['start']) && isset($params['length'])) {
            $this->db->limit($params['length'], $params['start']);
        }
        
        $result_obj = $this->db->get();
        return is_object($result_obj) ? $result_obj->result_array() : [];
    }

    public function get_total_orders() {
        return $this->db->count_all('orders');
    }

    public function get_filtered_orders($params) {
        $this->db->from('orders as o');
        $this->db->join('customer_master as c', 'c.id = o.user_id', 'left');
        if (!empty($params['search'])) {
            $this->db->group_start();
            $this->db->like('o.order_id', $params['search']);
            $this->db->or_like('c.customer_name', $params['search']);
            $this->db->group_end();
        }
        return $this->db->count_all_results();
    }

    public function get_order_by_id($order_id) {
        $this->db->select('o.*, c.customer_name, c.email, c.mobile_no, c.customer_code, c.gst_no, c.pan_no');
        $this->db->from('orders as o');
        $this->db->join('customer_master as c', 'c.id = o.user_id', 'left');
        $this->db->where('o.order_id', $order_id);
        $query = $this->db->get();
        return $query->row_array();
    }

    public function get_order_items($order_id) {
        $this->db->where('order_id', $order_id);
        $query = $this->db->get('order_items');
        return $query->result_array();
    }

    public function get_payment_details($order_id) {
        $this->db->where('order_id', $order_id);
        $query = $this->db->get('payments');
        return $query->row_array();
    }
}
