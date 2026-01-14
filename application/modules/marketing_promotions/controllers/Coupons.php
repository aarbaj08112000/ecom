<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Coupons extends MY_Controller {
	public function __construct() {
        parent::__construct();
        $this->load->model('Coupons_model');
    }
	public function index() {
		$data['base_url'] = base_url();
		$this->smarty->loadView('login.tpl',$data,'No','No');
	}
	/* add update user module */
	
	public function coupons()
	{
		$data['coupons'] = $this->Coupons_model->get_coupons();
		$this->smarty->loadView('coupons.tpl', $data,'Yes','Yes');
	}
	public function add_coupons()
	{
		$ret_arr = [];
		$msg = '';
		$success = 1;
		
		
		$data = [
			'code' => $this->input->post("code"),
			'discount' => $this->input->post("discount"),
			'discount_type' => $this->input->post("discount_type"),
			'min_order_value' => $this->input->post("min_order_value"),
			'expires_at' => $this->input->post("expires_at"),
			'coupons_status' => $this->input->post("coupons_status"),
			'added_date' => date("Y-m-d H:i:s"),
			'added_by' => $this->session->userdata('user_id'),
			'status' =>"Active",
		];

		$insert_query = $this->Coupons_model->add_coupons($data);

		if ($insert_query) {
			$msg = 'Coupons added successfully.';
		} else {
			$msg = 'Error occurred while adding the Coupons. Please try again.';
			$success = 0;
		}

		$ret_arr['msg'] = $msg;
		$ret_arr['success'] = $success;
		echo json_encode($ret_arr);
	}
	public function update_coupons()
	{
		
		$ret_arr = [];
		$msg = '';
		$success = 1;
		
		$coupons_id = $this->input->post("coupons_id");
	
		$data = [
		//    'code' => $this->input->post("code"),
			'discount' => $this->input->post("discount"),
			'discount_type' => $this->input->post("discount_type"),
			'min_order_value' => $this->input->post("min_order_value"),
			'expires_at' => $this->input->post("expires_at"),
			'coupons_status' => $this->input->post("coupons_status"),
			'update_date' => date("Y-m-d H:i:s"),
			'update_by' => $this->session->userdata('user_id'),
			'status' => $this->input->post("status"),
		];

		$update_query = $this->Coupons_model->update_coupons($data, $coupons_id);

		if ($update_query) {
			$msg = 'Coupons updated successfully.';
		} else {
			$msg = 'Error occurred while updating the Coupons. Please try again.';
			$success = 0;
		}

		$ret_arr['msg'] = $msg;
		$ret_arr['success'] = $success;
		echo json_encode($ret_arr);
	}
	
		
public function delete_coupons()
{
   
    $ret_arr = [];
    $msg = '';
    $success = 1;
	$coupons_id = $this->input->post("coupons_id");
    $data = array(
        'is_delete'  => "1",
        'update_date'=> date("Y-m-d H:i:s"),
        'update_by'=> $this->session->userdata('user_id'),
        
    );
    $update_query = $this->Coupons_model->update_coupons($data, $coupons_id);
   
    if ($update_query) {
        $msg = 'Coupons delete successfully.';
    } else {
        $msg = 'Error occurred while delete the coupons. Please try again.';
        $success = 0;
    }
    $ret_arr['msg'] = $msg;
    $ret_arr['success'] = $success;
    echo json_encode($ret_arr);
}
	
}

