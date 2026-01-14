<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Refunds_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    /**
     * Get refunds for DataTables with server-side processing
     */
    public function get_refunds_datatable($params) {
        $this->db->select('r.*, c.customer_name, o.order_id as display_order_id, p.transaction_id');
        $this->db->from('refunds as r');
        $this->db->join('orders as o', 'o.order_id = r.order_id', 'left');
        $this->db->join('payments as p', 'p.payment_id = r.payment_id', 'left');
        $this->db->join('customer_master as c', 'c.id = o.user_id', 'left');
        
        // Search
        if (!empty($params['search'])) {
            $this->db->group_start();
            $this->db->like('r.gateway_refund_id', $params['search']);
            $this->db->or_like('c.customer_name', $params['search']);
            $this->db->or_like('o.order_id', $params['search']);
            $this->db->group_end();
        }
        
        // Order
        if (!empty($params['order_column']) && !empty($params['order_dir'])) {
            $this->db->order_by($params['order_column'], $params['order_dir']);
        } else {
            $this->db->order_by('r.id', 'DESC');
        }
        
        // Pagination
        if (isset($params['start']) && isset($params['length'])) {
            $this->db->limit($params['length'], $params['start']);
        }
        
        $result_obj = $this->db->get();
        return is_object($result_obj) ? $result_obj->result_array() : [];
    }

    public function get_total_refunds() {
        return $this->db->count_all('refunds');
    }

    public function get_filtered_refunds($params) {
        $this->db->from('refunds as r');
        $this->db->join('orders as o', 'o.order_id = r.order_id', 'left');
        $this->db->join('customer_master as c', 'c.id = o.user_id', 'left');
        if (!empty($params['search'])) {
            $this->db->group_start();
            $this->db->like('r.gateway_refund_id', $params['search']);
            $this->db->or_like('c.customer_name', $params['search']);
            $this->db->or_like('o.order_id', $params['search']);
            $this->db->group_end();
        }
        return $this->db->count_all_results();
    }
}
