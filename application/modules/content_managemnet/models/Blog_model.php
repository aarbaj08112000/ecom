<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Blog_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }
	
	/**
	 * Insert blog data into database
	 * @param array $data Blog data
	 * @return int|bool Blog ID on success, false on failure
	 */
	public function insert_blog($data){
		$this->db->insert('blogs', $data);
		if($this->db->affected_rows() > 0){
			return $this->db->insert_id();
		}
		return false;
	}

	public function get_all_blogs(){
		$this->db->select('*');
		$this->db->from('blogs');
		$this->db->where('is_delete', '0');
		$query = $this->db->get();
		if($query->num_rows() > 0){
			return $query->result_array();
		}
		return false;
	}

	/**
	 * Get blog by ID
	 * @param int $id Blog ID
	 * @return array|bool Blog data or false
	 */
	public function get_blog_by_id($id){
		$this->db->select('*');
		$this->db->from('blogs');
		$this->db->where('blog_id', $id);
		$this->db->where('is_delete', '0');
		$query = $this->db->get();
		if($query->num_rows() > 0){
			return $query->row_array();
		}
		return false;
	}

	/**
	 * Update blog data
	 * @param int $id Blog ID
	 * @param array $data Blog data
	 * @return bool True on success, false on failure
	 */
	public function update_blog($id, $data){
		$this->db->where('blog_id', $id);
		$this->db->update('blogs', $data);
		if($this->db->affected_rows() >= 0){ // >= 0 because sometimes nothing changes but query is successful
			return true;
		}
		return false;
	}
}
