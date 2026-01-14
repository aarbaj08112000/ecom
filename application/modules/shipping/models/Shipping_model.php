<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Shipping_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_shipping_methods($search = null) {
        $this->db->select('*');
        $this->db->from('shipping_methods');
        $this->db->where('is_delete', 0);
        
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('method_name', $search);
            $this->db->or_like('carrier', $search);
            $this->db->group_end();
        }
        
        $this->db->order_by('added_date', 'DESC');
        $query = $this->db->get();
        return is_object($query) ? $query->result_array() : [];
    }

    public function add_shipping_method($data) {
        $this->db->insert('shipping_methods', $data);
        return $this->db->insert_id();
    }

    public function update_shipping_method($id, $data) {
        $this->db->where('id', $id);
        $this->db->update('shipping_methods', $data);
        return $this->db->affected_rows() >= 0;
    }

    public function get_shipping_method_by_id($id) {
        $this->db->where('id', $id);
        $this->db->where('is_delete', 0);
        $query = $this->db->get('shipping_methods');
        return is_object($query) ? $query->row_array() : [];
    }
}
