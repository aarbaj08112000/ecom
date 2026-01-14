<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Attributes extends MY_Controller {
	public function __construct() {
        parent::__construct();
        $this->load->model('Attributes_model');
    }
	public function index() {
		$data['base_url'] = base_url();
		$this->smarty->loadView('login.tpl',$data,'No','No');
	}
	
	
	public function attributes()
	{
		$data['attribute'] = $this->Attributes_model->get_attribute();
		$this->smarty->loadView('attributes.tpl', $data,'Yes','Yes');
	}

	public function add_attributes()
{
    $ret_arr = [];
    $msg = '';
    $success = 1;
    $attribute = $this->Attributes_model->get_attribute();
    $attr_code = "ATTR0-".count($attribute)+1;
    $data = [
        'attribute_name' => $this->input->post("attribute_name"),
        'attribute_code' => $attr_code,
        'added_date' => date("Y-m-d H:i:s"),
        'added_by' => $this->session->userdata('user_id'),
    ];

    $insert_query = $this->Attributes_model->add_attributes($data);

    if ($insert_query) {
        $msg = 'Attribute added successfully.';
    } else {
        $msg = 'Error occurred while adding the Attribute. Please try again.';
        $success = 0;
    }

    $ret_arr['msg'] = $msg;
    $ret_arr['success'] = $success;
    echo json_encode($ret_arr);
}

public function update_attributes()
{
    $ret_arr = [];
    $msg = '';
    $success = 1;
    
    $attribute_id = $this->input->post("attribute_id");
   
    $data = [
        'attribute_name' => $this->input->post("attribute_name"),
        'update_date' => date("Y-m-d H:i:s"),
        'update_by' => $this->session->userdata('user_id'),
        'status' => $this->input->post("status"),
    ];

    $update_query = $this->Attributes_model->update_attributes($data, $attribute_id);

    if ($update_query) {
        $msg = 'Attribute updated successfully.';
    } else {
        $msg = 'Error occurred while updating the Attribute. Please try again.';
        $success = 0;
    }

    $ret_arr['msg'] = $msg;
    $ret_arr['success'] = $success;
    echo json_encode($ret_arr);
}

public function delete_attributes()
{
    // pr($_POST);
    $ret_arr = [];
    $msg = '';
    $success = 1;
    $attribute_id = $this->input->post("attribute_id");
    $data = array(
        'is_delete'  => "1",
        'update_date'=> date("Y-m-d H:i:s"),
        'update_by'=> $this->session->userdata('user_id'),
        
    );
    $update_query = $this->Attributes_model->update_attributes($data,$attribute_id);
    // pr($this->db->last_query());
    if ($update_query) {
        $msg = 'Attribute delete successfully.';
    } else {
        $msg = 'Error occurred while delete the Attribute. Please try again.';
        $success = 0;
    }
    $ret_arr['msg'] = $msg;
    $ret_arr['success'] = $success;
    echo json_encode($ret_arr);
}

	
	
}

