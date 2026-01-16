<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Settings_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    /**
     * Fetch settings based on user role.
     * Super Admin gets everything.
     * Admin gets only is_edit = 'Yes'.
     */
    public function get_settings($role) {
        $this->db->select('*');
        $this->db->from('config_setting');
        
        if ($role !== 'Super Admin') {
            $this->db->where('is_edit', 'Yes');
        }
        
        $query = $this->db->get();
        return $query->result_array();
    }

    /**
     * Update a specific configuration setting.
     */
    public function update_setting($name, $value) {
        $this->db->where('name', $name);
        return $this->db->update('config_setting', ['value' => $value]);
    }

    /**
     * Get a specific setting by name.
     */
    public function get_setting_by_name($name) {
        $this->db->where('name', $name);
        return $this->db->get('config_setting')->row_array();
    }
}
