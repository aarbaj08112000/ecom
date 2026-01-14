<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Order_tracking_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_order_tracking($search = null) {
        $this->db->select('*');
        $this->db->from('order_tracking');
        $this->db->where('is_delete', 0);
        
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('order_id', $search);
            $this->db->or_like('tracking_number', $search);
            $this->db->or_like('carrier_name', $search);
            $this->db->group_end();
        }
        
        $this->db->order_by('added_date', 'DESC');
        $query = $this->db->get();
        return is_object($query) ? $query->result_array() : [];
    }

    public function add_order_tracking($data) {
        $this->db->insert('order_tracking', $data);
        return $this->db->insert_id();
    }

    public function update_order_tracking($id, $data) {
        $this->db->where('id', $id);
        $this->db->update('order_tracking', $data);
        return $this->db->affected_rows() >= 0;
    }

    public function get_order_tracking_by_id($id) {
        $this->db->where('id', $id);
        $this->db->where('is_delete', 0);
        $query = $this->db->get('order_tracking');
        return is_object($query) ? $query->row_array() : [];
    }
}
