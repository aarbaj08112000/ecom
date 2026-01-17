<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Wishlist extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->helper('url');
        $this->load->library('session');
        $this->load->model('Wishlist_model');
        
        // Ensure user is logged in
        if (!$this->session->userdata('is_customer_logged_in')) {
            if ($this->input->is_ajax_request()) {
                echo json_encode(['success' => 0, 'message' => 'Please login to continue', 'redirect' => base_url('shop/login')]);
                exit;
            } else {
                redirect(base_url('shop/login'));
            }
        }
    }

    public function index() {
        $customer_id = $this->session->userdata('customer_id');
        $data['title'] = 'My Wishlist';
        $data['page'] = 'wishlist';
        
        // Fetch wishlist items
        $data['wishlist_items'] = $this->Wishlist_model->get_user_wishlist($customer_id);
        
        $this->smarty->view('wishlist/index.tpl', $data);
    }

    public function add() {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        }

        $customer_id = $this->session->userdata('customer_id');
        $product_id = $this->input->post('product_id');

        if (!$product_id) {
            echo json_encode(['success' => 0, 'message' => 'Invalid product']);
            return;
        }

        // Check if already exists
        if ($this->Wishlist_model->check_exists($customer_id, $product_id)) {
            echo json_encode(['success' => 0, 'message' => 'Product already in wishlist']);
            return;
        }

        $data = [
            'user_id' => $customer_id,
            'product_id' => $product_id,
            'added_date' => date('Y-m-d H:i:s'),
            'status' => 'Active',
            'is_delete' => '0'
        ];

        if ($this->Wishlist_model->add_to_wishlist($data)) {
            echo json_encode(['success' => 1, 'message' => 'Product added to wishlist']);
        } else {
            echo json_encode(['success' => 0, 'message' => 'Failed to add product']);
        }
    }

    public function remove() {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        }

        $customer_id = $this->session->userdata('customer_id');
        $product_id = $this->input->post('product_id');

        if (!$product_id) {
            echo json_encode(['success' => 0, 'message' => 'Invalid product']);
            return;
        }

        if ($this->Wishlist_model->remove_from_wishlist($customer_id, $product_id)) {
            echo json_encode(['success' => 1, 'message' => 'Product removed from wishlist']);
        } else {
            echo json_encode(['success' => 0, 'message' => 'Failed to remove product']);
        }
    }
}
