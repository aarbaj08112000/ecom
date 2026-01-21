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
        
        // Fetch customer details for settings tab
        $data['customer'] = $this->Account_model->get_customer_details($customer_id);
        
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

    public function update_settings() {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        }
        
        $this->load->model('Account_model');
        $customer_id = $this->session->userdata('customer_id');
        
        // Prepare data array
        $data = [];
        
        // Customer name is required
        $customer_name = trim($this->input->post('customer_name'));
        if (empty($customer_name)) {
            echo json_encode(['success' => 0, 'message' => 'Customer name is required.']);
            return;
        }
        $data['customer_name'] = $customer_name;
        
        // Optional fields
        if ($this->input->post('mobile_no')) {
            $data['mobile_no'] = $this->input->post('mobile_no');
        }
        if ($this->input->post('gst_no')) {
            $data['gst_no'] = $this->input->post('gst_no');
        }
        if ($this->input->post('pan_no')) {
            $data['pan_no'] = $this->input->post('pan_no');
        }
        if ($this->input->post('dob')) {
            $data['dob'] = $this->input->post('dob');
        }
        if ($this->input->post('gender')) {
            $data['gender'] = $this->input->post('gender');
        }
        if ($this->input->post('identity_details')) {
            $data['identity_details'] = $this->input->post('identity_details');
        }
        
        // Handle password change
        $current_password = $this->input->post('current_password');
        $new_password = $this->input->post('new_password');
        $confirm_password = $this->input->post('confirm_password');
        
        if (!empty($new_password) || !empty($confirm_password)) {
            // Verify all password fields are filled
            if (empty($current_password)) {
                echo json_encode(['success' => 0, 'message' => 'Current password is required to change password.']);
                return;
            }
            if (empty($new_password)) {
                echo json_encode(['success' => 0, 'message' => 'New password is required.']);
                return;
            }
            if (empty($confirm_password)) {
                echo json_encode(['success' => 0, 'message' => 'Please confirm your new password.']);
                return;
            }
            
            // Verify passwords match
            if ($new_password !== $confirm_password) {
                echo json_encode(['success' => 0, 'message' => 'New password and confirm password do not match.']);
                return;
            }
            
            // Verify current password
            if (!$this->Account_model->verify_password($customer_id, $current_password)) {
                echo json_encode(['success' => 0, 'message' => 'Current password is incorrect.']);
                return;
            }
            
            // Hash new password
            $data['password'] = password_hash($new_password, PASSWORD_DEFAULT);
        }
        
        // Handle profile image upload
        if (isset($_FILES['profile_image']) && $_FILES['profile_image']['error'] == 0) {
            $config['upload_path'] = './public/frontend/img/profiles/';
            $config['allowed_types'] = 'jpg|jpeg|png|gif';
            $config['max_size'] = 2048; // 2MB
            $config['encrypt_name'] = TRUE;
            
            // Create directory if it doesn't exist
            if (!is_dir($config['upload_path'])) {
                mkdir($config['upload_path'], 0777, true);
            }
            
            $this->load->library('upload', $config);
            
            if ($this->upload->do_upload('profile_image')) {
                $upload_data = $this->upload->data();
                $data['profile_image'] = $upload_data['file_name'];
            } else {
                echo json_encode(['success' => 0, 'message' => $this->upload->display_errors('', '')]);
                return;
            }
        }
        
        // Update customer settings
        if ($this->Account_model->update_customer_settings($customer_id, $data)) {
            // Update session customer name if changed
            if (isset($data['customer_name'])) {
                $this->session->set_userdata('customer_name', $data['customer_name']);
            }
            
            echo json_encode(['success' => 1, 'message' => 'Settings updated successfully!']);
        } else {
            echo json_encode(['success' => 0, 'message' => 'Failed to update settings. Please try again.']);
        }
    }

    /**
     * AJAX endpoint to get order details
     */
    public function get_order_details($order_id) {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        }
        
        $customer_id = $this->session->userdata('customer_id');
        $this->load->model('Account_model');
        
        $order = $this->Account_model->get_order_details($order_id, $customer_id);
        
        if ($order) {
            echo json_encode(['success' => 1, 'data' => $order]);
        } else {
            echo json_encode(['success' => 0, 'message' => 'Order not found or access denied.']);
        }
    }

    /**
     * AJAX endpoint to cancel an order
     */
    public function cancel_order() {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        }

        $order_id = $this->input->post('order_id');
        $reason = $this->input->post('reason');
        $customer_id = $this->session->userdata('customer_id');

        if (empty($order_id)) {
            echo json_encode(['success' => 0, 'message' => 'Order ID is required.']);
            return;
        }

        $this->load->model('Account_model');
        $order = $this->Account_model->get_order_details($order_id, $customer_id);

        if (!$order) {
            echo json_encode(['success' => 0, 'message' => 'Order not found.']);
            return;
        }

        // Only allow cancellation if status is pending or processing
        $allowed_status = ['pending', 'processing'];
        if (!in_array(strtolower($order->order_status), $allowed_status)) {
            echo json_encode(['success' => 0, 'message' => 'Order cannot be cancelled in its current status.']);
            return;
        }

        if ($this->Account_model->cancel_order($order_id, $customer_id, $reason)) {
            echo json_encode(['success' => 1, 'message' => 'Order cancelled successfully!']);
        } else {
            echo json_encode(['success' => 0, 'message' => 'Failed to cancel order. Please try again.']);
        }
    }

    /**
     * AJAX endpoint to submit a return/refund request
     */
    public function submit_return_request() {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        }

        $order_id = $this->input->post('order_id');
        $reason = $this->input->post('reason');
        $customer_id = $this->session->userdata('customer_id');

        if (empty($order_id)) {
            echo json_encode(['success' => 0, 'message' => 'Order ID is required.']);
            return;
        }

        $this->load->model('Account_model');
        $order = $this->Account_model->get_order_details($order_id, $customer_id);

        if (!$order) {
            echo json_encode(['success' => 0, 'message' => 'Order not found.']);
            return;
        }

        // Only allow return if status is delivered
        if (strtolower($order->order_status) !== 'delivered') {
            echo json_encode(['success' => 0, 'message' => 'Returns are only allowed for delivered orders.']);
            return;
        }

        // Check if already requested
        $this->db->where('order_id', $order_id);
        $this->db->where_in('refund_status', ['Requested', 'Processing', 'Completed']);
        $existing = $this->db->get('refunds')->row();
        
        if ($existing) {
            echo json_encode(['success' => 0, 'message' => 'A return/refund request has already been submitted for this order.']);
            return;
        }

        // Get payment details
        $payment = $this->Account_model->get_payment_by_order($order_id);
        $payment_id = $payment ? $payment->payment_id : 0;

        $refund_data = [
            'order_id' => $order_id,
            'payment_id' => $payment_id,
            'refund_amount' => $order->total_amount,
            'refund_status' => 'Requested',
            'reason' => $reason,
            'added_date' => date('Y-m-d H:i:s')
        ];

        if ($this->Account_model->submit_refund_request($refund_data)) {
            echo json_encode(['success' => 1, 'message' => 'Return request submitted successfully!']);
        } else {
            echo json_encode(['success' => 0, 'message' => 'Failed to submit return request. Please try again.']);
        }
    }
}
