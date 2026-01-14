<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Brands extends MY_Controller {
	public function __construct() {
        parent::__construct();
        $this->load->model('Brands_model');
    }
	public function index() {
		$data['base_url'] = base_url();
		$this->smarty->loadView('login.tpl',$data,'No','No');
	}
	
	
	public function brands()
	{
		$data['brands'] = $this->Brands_model->get_brands();
		$this->smarty->loadView('brands.tpl', $data,'Yes','Yes');
	}

	public function add_brands()
{
    $ret_arr = [];
    $msg = '';
    $success = 1;

    $config['upload_path'] = './public/uploads/brands/'; 
    if (!is_dir($config['upload_path'])) {
        mkdir($config['upload_path'], 0777, true);
    }
    $config['allowed_types'] = 'jpg|jpeg|png|gif';
    $config['max_size'] = 2048;
    $config['encrypt_name'] = TRUE;

    $this->load->library('upload', $config);

    if (!$this->upload->do_upload('brand_image')) {
        $ret_arr['msg'] = $this->upload->display_errors();
        $ret_arr['success'] = 0;
        echo json_encode($ret_arr);
        return; 
    }

    $upload_data = $this->upload->data();
    $image_path = $upload_data['file_name'];

    $data = [
        'brand_name' => $this->input->post("brand_name"),
        'brand_image' => $image_path,
        'added_date' => date("Y-m-d H:i:s"),
        'added_by' => $this->session->userdata('user_id'),
    ];

    $insert_query = $this->Brands_model->add_brands($data);

    if ($insert_query) {
        $msg = 'Brand added successfully.';
    } else {
        $msg = 'Error occurred while adding the brand. Please try again.';
        $success = 0;
    }

    $ret_arr['msg'] = $msg;
    $ret_arr['success'] = $success;
    echo json_encode($ret_arr);
}

public function update_brands()
{
    $ret_arr = [];
    $msg = '';
    $success = 1;
    
    $brand_id = $this->input->post("brand_id");
    $hidden_brand_image = $this->input->post("hidden_brand_image"); 
    
    $image_path = $hidden_brand_image; 

    if (!empty($_FILES['brand_image']['name'])) {
       
        $config['upload_path'] = './public/uploads/brands/';
        if (!is_dir($config['upload_path'])) {
            mkdir($config['upload_path'], 0777, true);
        }
        $config['allowed_types'] = 'jpg|jpeg|png|gif';
        $config['max_size'] = 2048;
        $config['encrypt_name'] = TRUE;

        $this->load->library('upload', $config);

        if ($this->upload->do_upload('brand_image')) {
          
            $upload_data = $this->upload->data();
            $image_path = $upload_data['file_name'];

            if (!empty($hidden_brand_image)) {
                $old_path = './public/uploads/brands/' . $hidden_brand_image;
                if (file_exists($old_path) && is_file($old_path)) {
                    unlink($old_path);
                }
            }
        } else {
            $ret_arr['msg'] = $this->upload->display_errors();
            $ret_arr['success'] = 0;
            echo json_encode($ret_arr);
            return;
        }
    }

    $data = [
        'brand_name' => $this->input->post("brand_name"),
        'brand_image' => $image_path,
        'update_date' => date("Y-m-d H:i:s"),
        'update_by' => $this->session->userdata('user_id'),
        'status' => $this->input->post("status"),
    ];

    $update_query = $this->Brands_model->update_brands($data, $brand_id);

    if ($update_query) {
        $msg = 'Brand updated successfully.';
    } else {
        $msg = 'Error occurred while updating the brand. Please try again.';
        $success = 0;
    }

    $ret_arr['msg'] = $msg;
    $ret_arr['success'] = $success;
    echo json_encode($ret_arr);
}

	
public function delete_brands()
{
    // pr($_POST);
    $ret_arr = [];
    $msg = '';
    $success = 1;
    $brand_id = $this->input->post("brand_id");
    $data = array(
        'is_delete'  => "1",
        'update_date'=> date("Y-m-d H:i:s"),
        'update_by'=> $this->session->userdata('user_id'),
        
    );
    $update_query = $this->Brands_model->update_brands($data,$brand_id);
    // pr($this->db->last_query());
    if ($update_query) {
        $msg = 'Brand delete successfully.';
    } else {
        $msg = 'Error occurred while delete the Brand. Please try again.';
        $success = 0;
    }
    $ret_arr['msg'] = $msg;
    $ret_arr['success'] = $success;
    echo json_encode($ret_arr);
}
	
	
}

