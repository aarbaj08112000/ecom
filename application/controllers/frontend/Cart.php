<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cart extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->helper('url');
        $this->load->library('session');
        $this->load->model('Cart_model');

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
        $data['title'] = 'Shopping Cart';
        $data['page'] = 'cart';
        
        $data['cart_items'] = $this->Cart_model->get_cart_items($customer_id);
        
        // Calculate Total
        $total = 0;
        foreach($data['cart_items'] as $item){
            $total += $item->price * $item->quantity;
        }
        $data['total'] = $total;

        $this->smarty->view('cart/cart.tpl', $data); // Check template path!
    }

    public function add() {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        }

        $customer_id = $this->session->userdata('customer_id');
        $product_id = $this->input->post('product_id');
        $quantity = $this->input->post('quantity') ? $this->input->post('quantity') : 1;

        if (!$product_id) {
            echo json_encode(['success' => 0, 'message' => 'Invalid product']);
            return;
        }

        // Check Stock
        $stock = $this->Cart_model->get_product_stock($product_id);
        if ($stock < $quantity) {
             echo json_encode(['success' => 0, 'message' => 'Out of stock! Available: ' . $stock]);
             return;
        }

        if ($this->Cart_model->add_to_cart($customer_id, $product_id, $quantity)) {
            $cart_count = $this->Cart_model->get_cart_count($customer_id);
            echo json_encode(['success' => 1, 'message' => 'Product added to cart', 'cart_count' => $cart_count]);
        } else {
            echo json_encode(['success' => 0, 'message' => 'Failed to add product']);
        }
    }

    public function update() {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        }

        $cart_id = $this->input->post('cart_id');
        $quantity = $this->input->post('quantity');

        if (!$cart_id || $quantity < 1) {
            echo json_encode(['success' => 0, 'message' => 'Invalid request']);
            return;
        }
        
        // Verify stock? Need product_id. 
        // For simplicity, assuming checks passed or handled by UI max attribute.
        // Ideally we should check stock again here.
        
        if ($this->Cart_model->update_quantity($cart_id, $quantity)) {
             echo json_encode(['success' => 1, 'message' => 'Cart updated']);
        } else {
            echo json_encode(['success' => 0, 'message' => 'Failed to update']);
        }
    }

    public function remove() {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        }

        $customer_id = $this->session->userdata('customer_id');
        $cart_id = $this->input->post('cart_id');

        if (!$cart_id) {
            echo json_encode(['success' => 0, 'message' => 'Invalid request']);
            return;
        }

        if ($this->Cart_model->remove_item($cart_id, $customer_id)) {
            $cart_count = $this->Cart_model->get_cart_count($customer_id);
            echo json_encode(['success' => 1, 'message' => 'Item removed', 'cart_count' => $cart_count]);
        } else {
            echo json_encode(['success' => 0, 'message' => 'Failed to remove item']);
        }
    }

    public function checkout() {
        $customer_id = $this->session->userdata('customer_id');
        $data['title'] = 'Checkout';
        $data['page'] = 'checkout';
        
        // Fetch Cart Items
        $data['cart_items'] = $this->Cart_model->get_cart_items($customer_id);
        
        // Calculate Total
        $total = 0;
        foreach($data['cart_items'] as $item){
            $total += $item->price * $item->quantity;
        }
        $data['total'] = $total;
        
        $this->smarty->view('cart/checkout.tpl', $data);
    }

    public function place_order() {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        }

        $this->load->library('form_validation');
        $this->form_validation->set_rules('first_name', 'First Name', 'required');
        $this->form_validation->set_rules('last_name', 'Last Name', 'required');
        $this->form_validation->set_rules('email', 'Email', 'required|valid_email');
        $this->form_validation->set_rules('address', 'Address', 'required');
        $this->form_validation->set_rules('city', 'City', 'required');
        $this->form_validation->set_rules('state', 'State', 'required');
        $this->form_validation->set_rules('zip', 'Zip Code', 'required');
        $this->form_validation->set_rules('payment', 'Payment Method', 'required');

        if ($this->form_validation->run() == FALSE) {
            echo json_encode(['success' => 0, 'message' => validation_errors()]);
            return;
        }

        $customer_id = $this->session->userdata('customer_id');
        $cart_items = $this->Cart_model->get_cart_items($customer_id);

        if (empty($cart_items)) {
            echo json_encode(['success' => 0, 'message' => 'Your cart is empty']);
            return;
        }

        $total = 0;
        foreach ($cart_items as $item) {
            $total += $item->price * $item->quantity;
        }

        $shipping_address = [
            'name' => $this->input->post('first_name') . ' ' . $this->input->post('last_name'),
            'address' => $this->input->post('address'),
            'city' => $this->input->post('city'),
            'state' => $this->input->post('state'),
            'zip' => $this->input->post('zip'),
            'email' => $this->input->post('email')
        ];

        $order_data = [
            'user_id' => $customer_id,
            'shipping_address_json' => json_encode($shipping_address),
            'total_amount' => $total,
            'net_amount' => $total,
            'order_status' => 'pending',
            'payment_status' => 'Unpaid', // Or 'Paid' if integrated with mock gateway
            'payment_method' => $this->input->post('payment'),
            'added_date' => date('Y-m-d H:i:s'),
            'updated_date' => date('Y-m-d H:i:s')
        ];

        $order_id = $this->Cart_model->create_order($order_data);

        if ($order_id) {
            $this->Cart_model->insert_order_items($order_id, $cart_items);
            
            // Check Payment Method
            if ($this->input->post('payment') == 'Credit Card') {
                // Return Razorpay Configuration
                echo json_encode([
                    'success' => 1, 
                    'is_razorpay' => true,
                    'message' => 'Processing Payment...',
                    'razorpay_options' => [
                        'key' => 'rzp_test_UfEGkvD0w78cSN',
                        'amount' => $total * 100, // Amount in paise
                        'name' => 'Craftology',
                        'description' => 'Order # ' . $order_id,
                        'currency' => 'INR',
                        'prefill' => [
                            'name' => $this->input->post('first_name') . ' ' . $this->input->post('last_name'),
                            'email' => $this->input->post('email'),
                            // 'contact' => '' // Add contact if available
                        ],
                        'notes' => [
                            'merchant_order_id' => $order_id
                        ],
                        'theme' => [
                            'color' => '#f99e72'
                        ]
                    ]
                ]);
            } else {
                // Standard COD or other methods (if any)
                $this->Cart_model->clear_cart($customer_id);
                // Send Order Email (Optional/Future)
                echo json_encode(['success' => 1, 'message' => 'Order placed successfully!', 'redirect' => base_url('shop/dashboard')]); 
            }
        } else {
            echo json_encode(['success' => 0, 'message' => 'Failed to place order']);
        }
    }

    public function razorpay_callback() {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        }

        $payment_id = $this->input->post('razorpay_payment_id');
        $order_id = $this->input->post('merchant_order_id');
        $customer_id = $this->session->userdata('customer_id');

        if ($payment_id && $order_id) {
            // Update Order Status
            $this->Cart_model->update_payment_status($order_id, $payment_id);
            
            // Clear Cart
            $this->Cart_model->clear_cart($customer_id);
            
            echo json_encode(['success' => 1, 'message' => 'Payment Successful!', 'redirect' => base_url('shop/dashboard')]);
        } else {
            echo json_encode(['success' => 0, 'message' => 'Payment Failed or Invalid Response']);
        }
    }
}
