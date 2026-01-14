<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Transactions_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    /**
     * Get transactions for DataTables with server-side processing
     */
    public function get_transactions_datatable($params) {
        $this->db->select('p.*, c.customer_name, o.order_id as display_order_id');
        $this->db->from('payments as p');
        $this->db->join('orders as o', 'o.order_id = p.order_id', 'left');
        $this->db->join('customer_master as c', 'c.id = o.user_id', 'left');
        
        // Search
        if (!empty($params['search'])) {
            $this->db->group_start();
            $this->db->like('p.transaction_id', $params['search']);
            $this->db->or_like('c.customer_name', $params['search']);
            $this->db->or_like('o.order_id', $params['search']);
            $this->db->group_end();
        }
        
        // Order
        if (!empty($params['order_column']) && !empty($params['order_dir'])) {
            $this->db->order_by($params['order_column'], $params['order_dir']);
        } else {
            $this->db->order_by('p.payment_id', 'DESC');
        }
        
        // Pagination
        if (isset($params['start']) && isset($params['length'])) {
            $this->db->limit($params['length'], $params['start']);
        }
        
        $result_obj = $this->db->get();
        return is_object($result_obj) ? $result_obj->result_array() : [];
    }

    public function get_total_transactions() {
        return $this->db->count_all('payments');
    }

    public function get_filtered_transactions($params) {
        $this->db->from('payments as p');
        $this->db->join('orders as o', 'o.order_id = p.order_id', 'left');
        $this->db->join('customer_master as c', 'c.id = o.user_id', 'left');
        if (!empty($params['search'])) {
            $this->db->group_start();
            $this->db->like('p.transaction_id', $params['search']);
            $this->db->or_like('c.customer_name', $params['search']);
            $this->db->or_like('o.order_id', $params['search']);
            $this->db->group_end();
        }
        return $this->db->count_all_results();
    }
}
