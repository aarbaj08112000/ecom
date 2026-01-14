<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Attributes_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function add_attributes($insert_data = array()){
        $this->db->insert("attribute", $insert_data);
        $insert_id = $this->db->insert_id();
        return  $insert_id;
    }
	public function get_attribute(){
        $this->db->select('a.*');
        $this->db->from('attribute as a');
        $this->db->where("a.is_delete",'0');
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function update_attributes($update_data = array(),$attribute_id = 0){
       
        $this->db->where('attribute_id', $attribute_id);
        $this->db->update('attribute', $update_data);
        $affected_rows = $this->db->affected_rows() == 0 ? 1 : $this->db->affected_rows();
       
        return $affected_rows;
    }
}
