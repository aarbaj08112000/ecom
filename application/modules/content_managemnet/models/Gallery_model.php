<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Gallery_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function add_gallery($insert_data = array()){
        $this->db->insert("gallery_master", $insert_data);
        $insert_id = $this->db->insert_id();
        return  $insert_id;
    }

    public function get_gallery(){
        $this->db->select('g.*');
        $this->db->from('gallery_master as g');
        $this->db->where("g.is_delete",'0');
        $this->db->order_by("g.gallery_id", "DESC");
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }

    public function get_active_gallery($limit = 6){
        $this->db->select('g.*');
        $this->db->from('gallery_master as g');
        $this->db->where("g.is_delete",'0');
        $this->db->where("g.status",'Active');
        $this->db->order_by("g.gallery_id", "DESC");
        if($limit > 0){
            $this->db->limit($limit);
        }
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }

    public function update_gallery($update_data = array(), $gallery_id = 0){
        $this->db->where('gallery_id', $gallery_id);
        $this->db->update('gallery_master', $update_data);
        $affected_rows = $this->db->affected_rows() == 0 ? 1 : $this->db->affected_rows();
        return $affected_rows;
    }
}
