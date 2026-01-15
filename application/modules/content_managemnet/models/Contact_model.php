<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Contact_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    /**
     * Get all contact submissions
     */
    public function get_contacts() {
        $this->db->select('*');
        $this->db->from('contact_us_master');
        $this->db->order_by('added_date', 'DESC');
        $query = $this->db->get();
        return $query->result_array();
    }

    /**
     * Update contact status
     */
    public function update_contact($data, $contact_id) {
        $this->db->where('contact_id', $contact_id);
        return $this->db->update('contact_us_master', $data);
    }

    /**
     * Delete contact record
     */
    public function delete_contact($contact_id) {
        $this->db->where('contact_id', $contact_id);
        return $this->db->delete('contact_us_master');
    }
}
