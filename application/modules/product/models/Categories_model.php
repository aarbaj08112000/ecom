<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Categories_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

	public function add_categories($insert_data = array()){
        $this->db->insert("categories", $insert_data);
        $insert_id = $this->db->insert_id();
        return  $insert_id;
    }

    public function update_categories($update_data = array(),$category_id = 0){
        $this->db->where('category_id', $category_id);
        $this->db->update('categories', $update_data);
        $affected_rows = $this->db->affected_rows() == 0 ? 1 : $this->db->affected_rows();
        return $affected_rows;
    }

    public function get_categories() {
        $this->db->select('c.category_id, c.category_name, c.parent_category_id, c.status, 
                           p.category_name as parent_name'); 
        $this->db->from('categories as c');
        $this->db->join('categories as p', 'c.parent_category_id = p.category_id', 'left'); 
        $this->db->where("c.status", 'Active');
        $this->db->where("c.is_delete", '0');
        
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }

    /**
     * Get categories for DataTables
     */
    public function get_categories_datatable($params) {
        $this->db->select('c.category_id, c.category_name, c.parent_category_id, c.status, p.category_name as parent_name');
        $this->db->from('categories as c');
        $this->db->join('categories as p', 'c.parent_category_id = p.category_id', 'left');
        $this->db->where('c.is_delete', '0');

        // Search
        if (!empty($params['search'])) {
            $this->db->group_start();
            $this->db->like('c.category_name', $params['search']);
            $this->db->group_end();
        }

        // Order
        if (!empty($params['order_column']) && !empty($params['order_dir'])) {
            $this->db->order_by($params['order_column'], $params['order_dir']);
        } else {
            $this->db->order_by('c.category_id', 'DESC');
        }

        // Pagination
        if (isset($params['start']) && isset($params['length'])) {
            $this->db->limit($params['length'], $params['start']);
        }

        $result_obj = $this->db->get();
        return is_object($result_obj) ? $result_obj->result_array() : [];
    }

    /**
     * Get total category count
     */
    public function get_categories_count($search = '') {
        $this->db->from('categories as c');
        $this->db->where('c.is_delete', '0');

        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('c.category_name', $search);
            $this->db->group_end();
        }

        return $this->db->count_all_results();
    }
}
