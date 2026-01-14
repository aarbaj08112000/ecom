<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Shipping extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Shipping_model');
    }

    public function index() {
        $this->shipping_methods();
    }

    public function shipping_methods() {
        $data['base_url'] = base_url();
        $data['methods'] = $this->Shipping_model->get_shipping_methods();
        $this->smarty->loadView('shipping_methods.tpl', $data, 'Yes', 'Yes');
    }

    public function save_shipping_method() {
        $id = $this->input->post('id');
        $data = [
            'method_name' => $this->input->post('method_name'),
            'carrier' => $this->input->post('carrier'),
            'shipping_fee' => $this->input->post('shipping_fee'),
            'min_delivery_days' => $this->input->post('min_delivery_days'),
            'max_delivery_days' => $this->input->post('max_delivery_days'),
            'status' => $this->input->post('status') ? $this->input->post('status') : 'Active',
        ];

        if ($id) {
            $data['updated_date'] = date('Y-m-d H:i:s');
            $data['updated_by'] = $this->session->userdata('user_id');
            $result = $this->Shipping_model->update_shipping_method($id, $data);
            $message = "Shipping method updated successfully.";
        } else {
            $data['added_date'] = date('Y-m-d H:i:s');
            $data['added_by'] = $this->session->userdata('user_id');
            $result = $this->Shipping_model->add_shipping_method($data);
            $message = "Shipping method added successfully.";
        }

        if ($result) {
            echo json_encode(['success' => 1, 'messages' => $message]);
        } else {
            echo json_encode(['success' => 0, 'messages' => "Something went wrong."]);
        }
    }

    public function get_shipping_method($id) {
        $method = $this->Shipping_model->get_shipping_method_by_id($id);
        echo json_encode($method);
    }

    public function delete_shipping_method() {
        $id = $this->input->post('id');
        $data = [
            'is_delete' => 1,
            'updated_date' => date('Y-m-d H:i:s'),
            'updated_by' => $this->session->userdata('user_id')
        ];
        $result = $this->Shipping_model->update_shipping_method($id, $data);
        if ($result) {
            echo json_encode(['success' => 1, 'messages' => "Shipping method deleted successfully."]);
        } else {
            echo json_encode(['success' => 0, 'messages' => "Failed to delete shipping method."]);
        }
    }
}
