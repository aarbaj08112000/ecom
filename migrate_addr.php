<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Address_migration extends CI_Controller {

    public function index() {
        $this->load->dbforge();

        $fields = array(
            'mobile' => array(
                'type' => 'VARCHAR',
                'constraint' => '20',
                'after' => 'user_id'
            )
        );

        // Check if table exists
        if ($this->db->table_exists('customer_address')) {
            // Check if column exists
            if (!$this->db->field_exists('mobile', 'customer_address')) {
                 $this->dbforge->add_column('customer_address', $fields);
                 echo "Mobile column added to customer_address table.";
            } else {
                 echo "Mobile column already exists.";
            }
        } else {
            // Create table if not exists (fallback)
            echo "Table customer_address does not exist. Please check.";
        }
    }
}
