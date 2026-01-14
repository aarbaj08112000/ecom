<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Faq extends MY_Controller {
	public function __construct() {
        parent::__construct();
        $this->load->model('Faq_model');
    }
	public function index() {
		$data['base_url'] = base_url();
		$this->smarty->loadView('login.tpl',$data,'No','No');
	}
	/* add update user module */
	
	public function faq()
	{
		$data['faq'] = $this->Faq_model->get_faq();
		$this->smarty->loadView('faq.tpl', $data,'Yes','Yes');
	}
	public function add_faq()
	{
		$ret_arr = [];
		$msg = '';
		$success = 1;
		
		$data = [
			'question' => $this->input->post("question"),
			'answer' => $this->input->post("answer"),
			'added_date' => date("Y-m-d H:i:s"),
			'added_by' => $this->session->userdata('user_id'),
			'status' => "Active",
		];
	
		$insert_query = $this->Faq_model->add_faq($data);
	
		if ($insert_query) {
			$msg = 'FAQ added successfully.';
		} else {
			$msg = 'Error occurred while adding the Faq. Please try again.';
			$success = 0;
		}
	
		$ret_arr['msg'] = $msg;
		$ret_arr['success'] = $success;
		echo json_encode($ret_arr);
	}
	
	public function update_faq()
	{
		$ret_arr = [];
		$msg = '';
		$success = 1;
		
		$faq_id = $this->input->post("faq_id");
	   
		$data = [
			'question' => $this->input->post("question"),
			'answer' => $this->input->post("answer"),
			'update_date' => date("Y-m-d H:i:s"),
			'update_by' => $this->session->userdata('user_id'),
			'status' => $this->input->post("status"),
		];
	
		$update_query = $this->Faq_model->update_faq($data, $faq_id);
	
		if ($update_query) {
			$msg = 'faq updated successfully.';
		} else {
			$msg = 'Error occurred while updating the faq. Please try again.';
			$success = 0;
		}
	
		$ret_arr['msg'] = $msg;
		$ret_arr['success'] = $success;
		echo json_encode($ret_arr);
	}
	
	public function delete_faq()
{
   
    $ret_arr = [];
    $msg = '';
    $success = 1;
	$faq_id = $this->input->post("faq_id");
    $data = array(
        'is_delete'  => "1",
        'update_date'=> date("Y-m-d H:i:s"),
        'update_by'=> $this->session->userdata('user_id'),
        
    );
    $update_query = $this->Faq_model->update_faq($data, $faq_id);
   
    if ($update_query) {
        $msg = 'FAQ delete successfully.';
    } else {
        $msg = 'Error occurred while delete the FAQ. Please try again.';
        $success = 0;
    }
    $ret_arr['msg'] = $msg;
    $ret_arr['success'] = $success;
    echo json_encode($ret_arr);
}
	
}

