<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class User extends MY_Controller {
	public function __construct() {
        parent::__construct();
        $this->load->model('User_model');
    }
	public function index() {
		$data['base_url'] = base_url();
		$this->smarty->loadView('login.tpl',$data,'No','No');
	}
	/* add update user module */

	public function user_list()
	{
		$data['client'] = $this->User_model->getClientData();
        $data['groups'] = $this->User_model->getGroupData();
		$data['user_info'] = $this->User_model->getUserData();
		$data['no_data_message'] = NoDataFoundMessage("user");
		$this->smarty->loadView('user_details.tpl', $data,'Yes','Yes');
	}
	public function addUsersData()
	{
		$ret_arr = [];
		$msg ='';
		$success = 1;
        
		$data = array(
			'user_name' => $this->input->post('user_name'),
			'user_email' => $this->input->post('user_email'),
			'user_password' => $this->input->post('user_password'),
			'user_role' => $this->input->post('user_role'),
			'mobile_no' => $this->input->post('mobile_no'),
			'gender' => $this->input->post('gender'),
			'added_date' => date("Y-m-d H:i:s"),
			'added_by' => $this->session->userdata('user_id'),
			"deleted"=>0,
		);

		// Handle Profile Image Upload
		if (!empty($_FILES['user_image']['name'])) {
			$config['upload_path']   = './public/uploads/users/';
			$config['allowed_types'] = 'gif|jpg|png|jpeg';
			$config['encrypt_name']  = TRUE;

			if (!is_dir($config['upload_path'])) {
				mkdir($config['upload_path'], 0777, true);
			}

			$this->load->library('upload', $config);
			if ($this->upload->do_upload('user_image')) {
				$upload_data = $this->upload->data();
				$data['user_image'] = 'public/uploads/users/' . $upload_data['file_name'];
			} else {
				$msg = $this->upload->display_errors();
				$success = 0;
			}
		}

		if ($success == 1) {
			$inser_query = $this->User_model->insertUser($data);
			if ($inser_query) {
				$msg = 'User Added Successfully.';
			} else {
				$msg = 'Error IN User Adding ,try again.';
				$success = 0;
			}
		}

		$ret_arr['msg'] = $msg;
		$ret_arr['success'] = $success;
		echo json_encode($ret_arr);
	}

	public function updateUsersData()
	{
		$ret_arr = [];
		$msg ='';
		$success = 1;
		$id = $this->input->post("user_id");
		$status = $this->input->post('status');

		$data = array(
			'user_name' => $this->input->post('user_name'),
			'mobile_no' => $this->input->post('mobile_no'),
			'gender' => $this->input->post('gender'),
			'status' => $status
		);

		if($status != "Block"){
			$data['login_attempt'] = 0;
		}

		// Handle Profile Image Upload
		if (!empty($_FILES['user_image']['name'])) {
			$config['upload_path']   = './public/uploads/users/';
			$config['allowed_types'] = 'gif|jpg|png|jpeg';
			$config['encrypt_name']  = TRUE;

			if (!is_dir($config['upload_path'])) {
				mkdir($config['upload_path'], 0777, true);
			}

			$this->load->library('upload', $config);
			if ($this->upload->do_upload('user_image')) {
				$upload_data = $this->upload->data();
				$data['user_image'] = 'public/uploads/users/' . $upload_data['file_name'];
				
				// Optional: Delete old image
				$old_data = $this->User_model->getUserDataById($id);
				if(!empty($old_data[0]['user_image']) && file_exists('./'.$old_data[0]['user_image'])){
					unlink('./'.$old_data[0]['user_image']);
				}
			} else {
				$msg = $this->upload->display_errors();
				$success = 1; // Don't block update if only image fails, or maybe yes? Let's say yes for consistency.
				// $success = 0; 
			}
		}

		$result = $this->User_model->updateUserData($data, $id);
		if ($result) {
			$msg = 'User Updated Successfully.';
		} else {
			$msg = 'Error IN User Updating ,try again.';
			$success = 0;
		}

		$ret_arr['messages'] = $msg;
		$ret_arr['success'] = $success;
		echo json_encode($ret_arr);
	}

}

