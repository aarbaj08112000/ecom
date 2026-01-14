<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Delivery_partners_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_delivery_partners($search = null) {
        $this->db->select('*');
        $this->db->from('delivery_partners');
        $this->db->where('is_delete', 0);
        
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('partner_name', $search);
            $this->db->or_like('contact_person', $search);
            $this->db->or_like('email', $search);
            $this->db->group_end();
        }
        
        $this->db->order_by('added_date', 'DESC');
        $query = $this->db->get();
        return is_object($query) ? $query->result_array() : [];
    }

    public function add_delivery_partner($data) {
        $this->db->insert('delivery_partners', $data);
        return $this->db->insert_id();
    }

    public function update_delivery_partner($id, $data) {
        $this->db->where('id', $id);
        $this->db->update('delivery_partners', $data);
        return $this->db->affected_rows() >= 0;
    }

    public function get_delivery_partner_by_id($id) {
        $this->db->where('id', $id);
        $this->db->where('is_delete', 0);
        $query = $this->db->get('delivery_partners');
        return is_object($query) ? $query->row_array() : [];
    }
}
