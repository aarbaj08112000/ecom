<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Login extends MY_Controller {
	public function __construct() {
        parent::__construct();
        $this->load->model('Login_model');
    }
	public function index() {
		if ($this->checkSession()) {
			redirect(base_url("dashboard"));
		}
		$data['base_url'] = base_url();
		$this->smarty->loadView('login.tpl',$data,'No','No');
	}
	public function logout()
	{

		$user_data = array();
		$this->session->set_userdata($user_data);
		unset($_SESSION["userdata"]);
		session_destroy();
		redirect(base_url("secure_admin/login"));
	}
	public function signin()
	{
		$login_attempt_count = $this->config->item("admin_login_attempt");
		$this->form_validation->set_rules('email', ' Email', 'trim|required|min_length[3]');
		$this->form_validation->set_rules('password', ' Password', 'trim|required|min_length[3]');

		if ($this->form_validation->run() == FALSE) {
			$return_arr['success'] = 0;
			$return_arr['messages'] = validation_errors();
			echo json_encode($return_arr);
			exit;
		}

		$email = trim($this->input->post('email'));
		$password = trim($this->input->post('password'));
		
		// First, try to get user by email to handle hashing
		$result = $this->Login_model->get_user_by_email($email);	
		
		$success = 0;
		$messages = "Invalid credentials!";
		$redirect_url = "";

		if (!empty($result)) {
			// Check if user is blocked
			if ($result['status'] === 'Block' || $result['login_attempt'] >= $login_attempt_count) {
				$return_arr['success'] = 0;
				$return_arr['messages'] = "User is blocked due to too many failed attempts.";
				echo json_encode($return_arr);
				exit;
			}

			$is_authenticated = false;
			$needs_migration = false;

			// Support both legacy plain-text and hashed passwords
			$db_password = trim($result['user_password']);
			
			if (password_verify($password, $db_password)) {
				$is_authenticated = true;
			} else if ($password === $db_password) {
				$is_authenticated = true;
				$needs_migration = true;
			}

			if ($is_authenticated) {
				// Migrate to hash if needed
				if ($needs_migration) {
					$update_data = ['user_password' => password_hash($password, PASSWORD_BCRYPT)];
					$this->Login_model->updateUserData($update_data, $result['id']);
				}

				// Reset login attempts
				$this->Login_model->updateUserData(['login_attempt' => 0], $result['id']);

				$user_data = array(
					'user_id' => $result['id'],
					'user_email' => $result['user_email'],
					'user_login' => true,
					'user_name' => $result['user_name'],
					'type' => isset($result['type']) ? $result['type'] : 'Admin', // Fallback to Admin if type missing
					'role' => $result['user_role'],
					'groups' => $result['groups']
				);
				$this->session->set_userdata($user_data);

				$group_rights = $this->Login_model->getGroupRightData($result['groups'],"");
				$this->session->set_userdata('group_rights_arr', base64_encode(json_encode($group_rights)));
				
				$return_arr['redirect_url'] = "dashboard";
				$return_arr['success'] = 1;
				$return_arr['messages'] = "Logged in successfully";
				echo json_encode($return_arr);
				exit;
			} else {
				// Failed password, increment attempt
				$login_attempt = $result['login_attempt'] + 1;
				$update_data = ['login_attempt' => $login_attempt];
				
				if ($login_attempt >= $login_attempt_count) {
					$update_data['status'] = "Block";
					$return_arr['messages'] = "User temporary blocked due to 3 failed attempts!";
				} else {
					$return_arr['messages'] = "Invalid credentials! Attempt " . $login_attempt . " of " . $login_attempt_count;
				}
				
				$this->Login_model->updateUserData($update_data, $result['id']);
				$return_arr['success'] = 0;
				echo json_encode($return_arr);
				exit;
			}
		}

		$return_arr['success'] = 0;
		$return_arr['messages'] = "Invalid credentials!";
		echo json_encode($return_arr);
		exit;
	}
	public function reset_password(){
		$username = $this->input->post('username');
		$result = $this->Login_model->get_user_exist_check($username);	
		if(is_valid_array($result)){
	        $success = 1;
			$messages = "Password sent successfully";
			$user_id = $result['id'];
			$email_data = [
				"time_stramp" => time(),
				"user_id" => $user_id,
				"email_name" => "Reset Password ",
				"email_subject" => "Reset Password Of ".$this->config->item("admin_company_name")
			];
			$this->email_sender($email_data,$result['user_email'],"forgot_password");
		}else{
			$success = 0;
			$messages = "User not exist";
		}
		$return_arr['success']=$success;
		$return_arr['messages']=$messages;
		echo json_encode($return_arr);
		exit;
		
	}
	public function reset_password_action(){
		$post_data = $this->input->post();
		$update_data = array(
	        'user_password' => $post_data['password']
	    );
	    $result = $this->Login_model->updateUserData($update_data, $post_data['user_id']);
	    $success = 0;
		$messages = "Password not reset";
	    if($result > 0){
	    	$success = 1;
			$messages = "Password reset successful!";
	    }
	    $return_arr['redirect_url'] = "secure_admin/login";
		$return_arr['success']=$success;
		$return_arr['messages']=$messages;
		echo json_encode($return_arr);
		exit;
	}
	public function forgot_password($timestamp="",$user_id){
		$current_time = time();
		$time_difference = $current_time - $timestamp;
		$expiry_time = $this->config->item("password_link_expiry")*60;
		$expired_link = "Yes";
		if ($time_difference <= $expiry_time) {
		    $expired_link = "No";
		}
		$data['base_url'] = base_url();
		$data['user_id'] = $user_id;
		$data['expired_link'] = $expired_link;
		$this->smarty->setTemplateDir(APPPATH.'modules/user/views/');
		$this->smarty->loadView('forgot_password.tpl',$data,'No','No');
	}
	public function site_map(){
		$data['base_url'] = base_url();
		$data['sitemap'] = true;
		$data['site_path'] = $this->config->item("site_path")."views/templates/quick_menu.tpl";
		$this->smarty->loadView('site_map.tpl',$data,'Yes','Yes');
	}
	public function page_not_found(){
		$data['base_url'] = base_url();
		$data['sitemap'] = false;
		$this->smarty->loadView('page_not_found.tpl',$data,'Yes','Yes');
	}
	public function inprogress_page(){
		$data['base_url'] = base_url();
		$data['sitemap'] = false;
		$this->smarty->loadView('inprogress_page.tpl',$data,'Yes','Yes');
	}
	

	


	public function change_password() {
		if (!$this->checkSession()) {
			redirect(base_url("secure_admin/login"));
		}
		$data['base_url'] = base_url();
		$this->smarty->loadView('change_password.tpl', $data, 'Yes', 'Yes');
	}

	public function update_password_action() {
		if (!$this->checkSession()) {
			$return_arr['success'] = 0;
			$return_arr['messages'] = "Session expired, please login again.";
			echo json_encode($return_arr);
			exit;
		}

		$this->form_validation->set_rules('current_password', 'Current Password', 'trim|required');
		$this->form_validation->set_rules('new_password', 'New Password', 'trim|required|min_length[8]');
		$this->form_validation->set_rules('confirm_password', 'Confirm Password', 'trim|required|matches[new_password]');

		if ($this->form_validation->run() == FALSE) {
			$return_arr['success'] = 0;
			$return_arr['messages'] = validation_errors();
			echo json_encode($return_arr);
			exit;
		}

		$user_id = $this->session->userdata('user_id');
		$current_password = $this->input->post('current_password');
		$new_password = $this->input->post('new_password');

		$user = $this->Login_model->get_user_by_id($user_id);

		if (empty($user)) {
			$return_arr['success'] = 0;
			$return_arr['messages'] = "User not found.";
			echo json_encode($return_arr);
			exit;
		}

		// Verify current password
		$is_valid = false;
		if (password_get_info($user['user_password'])['algo'] !== 0) {
			if (password_verify($current_password, $user['user_password'])) {
				$is_valid = true;
			}
		} else {
			if ($current_password === $user['user_password']) {
				$is_valid = true;
			}
		}

		if (!$is_valid) {
			$return_arr['success'] = 0;
			$return_arr['messages'] = "Incorrect current password.";
			echo json_encode($return_arr);
			exit;
		}

		$update_data = [
			'user_password' => password_hash($new_password, PASSWORD_BCRYPT)
		];

		if ($this->Login_model->updateUserData($update_data, $user_id)) {
			$return_arr['success'] = 1;
			$return_arr['messages'] = "Password updated successfully.";
		} else {
			$return_arr['success'] = 0;
			$return_arr['messages'] = "Failed to update password.";
		}

		echo json_encode($return_arr);
		exit;
	}
}

