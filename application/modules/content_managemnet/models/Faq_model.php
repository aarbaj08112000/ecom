<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Faq_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }
	public function add_faq($insert_data = array()){
        $this->db->insert("faq", $insert_data);
        $insert_id = $this->db->insert_id();
        return  $insert_id;
    }
	public function get_faq(){
        $this->db->select('f.*');
        $this->db->from('faq as f');
        $this->db->where("f.is_delete",'0');
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function update_faq($update_data = array(),$faq_id = 0){
       
        $this->db->where('faq_id', $faq_id);
        $this->db->update('faq', $update_data);
        $affected_rows = $this->db->affected_rows() == 0 ? 1 : $this->db->affected_rows();
       
        return $affected_rows;
    }
}
