<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Categories extends MY_Controller {
	public function __construct() {
        parent::__construct();
        $this->load->model('Categories_model');
    }
	public function index() {
		$data['base_url'] = base_url();
		$this->smarty->loadView('login.tpl',$data,'No','No');
	}
	/* add update user module */
	
	public function categories()
	{ 
		$data['categories'] = $this->Categories_model->get_categories();
		// pr($data);
		$this->smarty->loadView('categories.tpl', $data,'Yes','Yes');
	}
	

	public function add_categories()
	{
		$ret_arr = [];
		$msg = '';
		$success = 1;
		$data = array(
			'category_name'       => $this->input->post("category_name"),
			'parent_category_id'  => $this->input->post("parent_category_id"),
			'added_date'          => date("Y-m-d H:i:s"),
			'added_by'            => $this->session->userdata('user_id'),
		);
		$insert_query = $this->Categories_model->add_categories($data);
		
		if ($insert_query) {
			$msg = 'Category added successfully.';
		} else {
			$msg = 'Error occurred while adding the category. Please try again.';
			$success = 0;
		}
		$ret_arr['msg'] = $msg;
		$ret_arr['success'] = $success;
		echo json_encode($ret_arr);
	}

	public function update_categories()
	{
		ini_set('display_errors', '1');
		ini_set('display_startup_errors', '1');
		error_reporting(E_ALL);
		$ret_arr = [];
		$msg = '';
		$success = 1;
		$category_id = $this->input->post("category_id");
		$data = array(
			'category_name'       => $this->input->post("category_name"),
			'parent_category_id'  => $this->input->post("parent_category_id"),
			'updated_date'          => date("Y-m-d H:i:s"),
			'updated_by'            => $this->session->userdata('user_id'),
			'status'            => $this->input->post("status"),
		);

		$update_query = $this->Categories_model->update_categories($data,$category_id);
		// pr($this->db->last_query());
		if ($update_query) {
			$msg = 'Category update successfully.';
		} else {
			$msg = 'Error occurred while updating the category. Please try again.';
			$success = 0;
		}
		$ret_arr['msg'] = $msg;
		$ret_arr['success'] = $success;
		echo json_encode($ret_arr);
	}
	public function delete_category()
	{
		pr($_POST);
		$ret_arr = [];
		$msg = '';
		$success = 1;
		$category_id = $this->input->post("category_id");
		$data = array(
			'is_delete'  => 1,
			'updated_date'=> date("Y-m-d H:i:s"),
			'updated_by'=> $this->session->userdata('user_id'),
			
		);
		$update_query = $this->Categories_model->update_categories($data,$category_id);
		pr($this->db->last_query());
		if ($update_query) {
			$msg = 'Category delete successfully.';
		} else {
			$msg = 'Error occurred while updating the delete. Please try again.';
			$success = 0;
		}
		$ret_arr['msg'] = $msg;
		$ret_arr['success'] = $success;
		echo json_encode($ret_arr);
	}
	
	
}

