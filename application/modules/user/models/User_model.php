<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }
	public function getClientData(){
        $this->db->select('u.*');
        $this->db->from('client as u');
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function getUserData(){
        $this->db->select('u.*');
        $this->db->from('userinfo as u');
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function getUserDataById($id){
        $this->db->select('u.*');
        $this->db->from('userinfo as u');
        $this->db->where('id', $id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function insertUser($insert_date = array()){
        $this->db->insert("userinfo", $insert_date);
        $insert_id = $this->db->insert_id();
        return  $insert_id;
    }
    public function updateUserData($update_date = array(),$user_id = 0){
        $this->db->where('id', $user_id);
        $this->db->update('userinfo', $update_date);
        $affected_rows = $this->db->affected_rows() == 0 ? 1 : $this->db->affected_rows();
        return $affected_rows;
    }

	public function getGroupData($group_id = 0){
        $this->db->select('g.*');
        $this->db->from('group_master as g');
        if($group_id > 0){
             $this->db->where("g.group_master_id",$group_id);
        }
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
}
