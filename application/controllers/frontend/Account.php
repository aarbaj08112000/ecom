<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Account extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->helper('url');
        $this->load->library('session');
        
        if (!$this->session->userdata('is_customer_logged_in')) {
            redirect(base_url('shop/login'));
        }
    }

    public function index() {
        $data['title'] = 'My Account';
        $data['page'] = 'dashboard';
        
        $this->load->model('Account_model');
        $customer_id = $this->session->userdata('customer_id');
        
        // Fetch real data
        $data['stats'] = $this->Account_model->get_customer_stats($customer_id);
        $data['orders'] = $this->Account_model->get_recent_orders($customer_id, 5);
        $data['my_orders'] = $this->Account_model->get_all_orders($customer_id);
        
        // Wishlist Model Loading (keeping existing)
        $this->load->model('Wishlist_model');
        $data['wishlist'] = $this->Wishlist_model->get_user_wishlist($customer_id);

        // Address Mocks
        $this->load->model('Address_model');
        $data['addresses'] = $this->Address_model->get_user_addresses($customer_id);
        
        $this->smarty->view('account/dashboard.tpl', $data);
    }
    
    public function save_address() {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        }
        
        $customer_id = $this->session->userdata('customer_id');
        $address_id = $this->input->post('address_id');
        
        $data = [
            'customer_id' => $customer_id,
            'receiver_name' => $this->input->post('receiver_name'),
            'mobile_number' => $this->input->post('mobile'), 
            'address' => $this->input->post('street'),
            'city' => $this->input->post('city'),
            'state' => $this->input->post('state'),
            'pincode' => $this->input->post('zip'),
            'address_type' => 'Shipping', // Default
            'status' => 'Active'
        ];
        
        $this->load->model('Address_model');
        
        if ($address_id) {
            // Update
            $result = $this->Address_model->update_address($address_id, $data);
            $msg = 'Address updated successfully!';
        } else {
            // Add
            $result = $this->Address_model->add_address($data);
            $msg = 'Address added successfully!';
        }
        
        if ($result) {
            echo json_encode(['success' => 1, 'message' => $msg]);
        } else {
            echo json_encode(['success' => 0, 'message' => 'Something went wrong. Please try again.']);
        }
    }

    public function get_address($id) {
        $customer_id = $this->session->userdata('customer_id');
        $this->load->model('Address_model');
        $address = $this->Address_model->get_address_by_id($id, $customer_id);
        if($address) {
             // Map DB columns to form fields if needed, or JS handles it
             // Let's send raw and handle mapping in JS
             echo json_encode($address);
        } else {
             echo json_encode(['error' => 'Address not found']);
        }
    }
    
    public function delete_address() {
        $customer_id = $this->session->userdata('customer_id');
        $id = $this->input->post('id');
        $this->load->model('Address_model');
        
        if($this->Address_model->delete_address($customer_id, $id)){
             echo json_encode(['success' => 1, 'message' => 'Address deleted successfully!']);
        } else {
             echo json_encode(['success' => 0, 'message' => 'Could not delete address. It may not exist.']);
        }
    }
}
