<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Testimonials_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }
	public function add_testimonials($insert_data = array()){
        $this->db->insert("testimonials", $insert_data);
        $insert_id = $this->db->insert_id();
        return  $insert_id;
    }
	public function get_testimonials(){
        $this->db->select('t.*');
        $this->db->from('testimonials as t');
        $this->db->where("t.is_delete",'0');
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function update_testimonials($update_data = array(),$testimonials_id = 0){
       
        $this->db->where('testimonials_id', $testimonials_id);
        $this->db->update('testimonials', $update_data);
        $affected_rows = $this->db->affected_rows() == 0 ? 1 : $this->db->affected_rows();
       
        return $affected_rows;
    }
}
