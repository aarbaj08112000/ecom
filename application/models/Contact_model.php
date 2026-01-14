<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Contact_model extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->database();
    }

    /**
     * Save contact form submission to database
     * 
     * @param array $data Contact form data
     * @return bool Success status
     */
    public function save_contact($data) {
        // Sanitize inputs
        $insert_data = [
            'name' => strip_tags(trim($data['name'])),
            'email' => filter_var(trim($data['email']), FILTER_SANITIZE_EMAIL),
            'subject' => strip_tags(trim($data['subject'])),
            'message' => strip_tags(trim($data['message'])),
            'ip_address' => $this->input->ip_address(),
            'user_agent' => substr($this->input->user_agent(), 0, 255),
            'status' => 'New',
            'added_date' => date('Y-m-d H:i:s')
        ];

        // Validate email format
        if (!filter_var($insert_data['email'], FILTER_VALIDATE_EMAIL)) {
            return false;
        }

        // Insert into database
        return $this->db->insert('contact_us_master', $insert_data);
    }
}
