<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Testimonials extends MY_Controller {
	public function __construct() {
        parent::__construct();
        $this->load->model('Testimonials_model');
    }
	public function index() {
		$data['base_url'] = base_url();
		$this->smarty->loadView('login.tpl',$data,'No','No');
	}
	/* add update user module */
	
	public function testimonials()
	{
		$data['testimonials'] = $this->Testimonials_model->get_testimonials();
		$this->smarty->loadView('testimonials.tpl', $data,'Yes','Yes');
	}

	public function add_testimonials()
	{
		// pr($_POST);
		// pr($_FILES,1);
		$ret_arr = [];
		$msg = '';
		$success = 1;

		$config['upload_path'] = './public/uploads/testimonials/'; 
		$config['allowed_types'] = 'jpg|jpeg|png|gif';
		$config['max_size'] = 2048;
		$config['encrypt_name'] = TRUE;

		$this->load->library('upload', $config);

		if (!$this->upload->do_upload('image')) {
			$ret_arr['msg'] = $this->upload->display_errors();
			$ret_arr['success'] = 0;
			echo json_encode($ret_arr);
			return; 
		}

		$upload_data = $this->upload->data();
		$image_path = $upload_data['file_name'];

		$data = [
			'name' => $this->input->post("name"),
			'designation' => $this->input->post("designation"),
			'message' => $this->input->post("message"),
			'rating' => $this->input->post("rating"),
			'image' => $image_path,
			'added_date' => date("Y-m-d H:i:s"),
			'added_by' => $this->session->userdata('user_id'),
		];

		$insert_query = $this->Testimonials_model->add_testimonials($data);

		if ($insert_query) {
			$msg = 'Testimonials added successfully.';
		} else {
			$msg = 'Error occurred while adding the testimonials. Please try again.';
			$success = 0;
		}

		$ret_arr['msg'] = $msg;
		$ret_arr['success'] = $success;
		echo json_encode($ret_arr);
	}

public function update_testimonials()
{
	// pr($_POST);
    $ret_arr = [];
    $msg = '';
    $success = 1;
    
    $testimonials_id = $this->input->post("testimonials_id");
    $hidden_brand_image = $this->input->post("hidden_image"); 
    
    $image_path = $hidden_brand_image; 

    if (!empty($_FILES['brand_image']['name'])) {
       
        $config['upload_path'] = './public/uploads/testimonials/';
        $config['allowed_types'] = 'jpg|jpeg|png|gif';
        $config['max_size'] = 2048;
        $config['encrypt_name'] = TRUE;

        $this->load->library('upload', $config);

        if ($this->upload->do_upload('image')) {
          
            $upload_data = $this->upload->data();
            $image_path = $upload_data['file_name'];

            if (!empty($hidden_brand_image) && file_exists($hidden_brand_image)) {
                unlink($hidden_brand_image);
            }
        } 
    }

    $data = [
        'name' => $this->input->post("name"),
		'designation' => $this->input->post("designation"),
		'message' => $this->input->post("message"),
		'rating' => $this->input->post("rating"),
		'image' => $image_path,
        'update_date' => date("Y-m-d H:i:s"),
        'update_by' => $this->session->userdata('user_id'),
        'status' => $this->input->post("status"),
    ];

    $update_query = $this->Testimonials_model->update_testimonials($data, $testimonials_id);
	// pr($this->db->last_query());
    if ($update_query) {
        $msg = 'Testimonials updated successfully.';
    } else {
        $msg = 'Error occurred while updating the testimonials. Please try again.';
        $success = 0;
    }

    $ret_arr['msg'] = $msg;
    $ret_arr['success'] = $success;
    echo json_encode($ret_arr);
}

public function delete_testimonials()
{
   
    $ret_arr = [];
    $msg = '';
    $success = 1;
	$testimonials_id = $this->input->post("testimonials_id");
    $data = array(
        'is_delete'  => "1",
        'update_date'=> date("Y-m-d H:i:s"),
        'update_by'=> $this->session->userdata('user_id'),
        
    );
    $update_query = $this->Testimonials_model->update_testimonials($data, $testimonials_id);
   
    if ($update_query) {
        $msg = 'Testimonials delete successfully.';
    } else {
        $msg = 'Error occurred while delete the Testimonials. Please try again.';
        $success = 0;
    }
    $ret_arr['msg'] = $msg;
    $ret_arr['success'] = $success;
    echo json_encode($ret_arr);
}
	
	
	
}

