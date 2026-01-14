<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Coupons_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }
	public function add_coupons($insert_data = array()){
        $this->db->insert("coupons", $insert_data);
        $insert_id = $this->db->insert_id();
        return  $insert_id;
    }
	public function get_coupons(){
        $this->db->select('c.*');
        $this->db->from('coupons as c');
        $this->db->where("c.is_delete",'0');
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function update_coupons($update_data = array(),$coupons_id = 0){
       
        $this->db->where('coupons_id', $coupons_id);
        $this->db->update('coupons', $update_data);
        $affected_rows = $this->db->affected_rows() == 0 ? 1 : $this->db->affected_rows();
       
        return $affected_rows;
    }
}
