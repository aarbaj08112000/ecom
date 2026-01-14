<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Address_model extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->table = 'customer_address';
    }

    public function get_user_addresses($customer_id) {
        $this->db->where('customer_id', $customer_id);
        $this->db->where('is_delete', '0');
        $this->db->order_by('address_id', 'DESC');
        $query = $this->db->get($this->table);
        return $query->result();
    }

    public function add_address($data) {
        return $this->db->insert($this->table, $data);
    }

    public function update_address($id, $data) {
        $this->db->where('address_id', $id);
        return $this->db->update($this->table, $data);
    }

    public function delete_address($customer_id, $id) {
        $this->db->where('address_id', $id);
        $this->db->where('customer_id', $customer_id);
        return $this->db->update($this->table, ['is_delete' => '1']);
    }

    public function get_address_by_id($id, $customer_id) {
        $this->db->where('address_id', $id);
        $this->db->where('customer_id', $customer_id);
        $this->db->where('is_delete', '0');
        $query = $this->db->get($this->table);
        return $query->row();
    }
}
