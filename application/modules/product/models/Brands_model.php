<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Brands_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function add_brands($insert_data = array()){
        $this->db->insert("brands", $insert_data);
        $insert_id = $this->db->insert_id();
        return  $insert_id;
    }
	public function get_brands(){
        $this->db->select('b.*');
        $this->db->from('brands as b');
        $this->db->where("b.is_delete",'0');
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function update_brands($update_data = array(),$brand_id = 0){
       
        $this->db->where('brand_id', $brand_id);
        $this->db->update('brands', $update_data);
        $affected_rows = $this->db->affected_rows() == 0 ? 1 : $this->db->affected_rows();
       
        return $affected_rows;
    }
}
