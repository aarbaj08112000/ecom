<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->helper('url');
    }

    public function login() {
        $this->load->helper('cookie');
        $data['title'] = 'Login | Craftology';
        $data['page'] = 'login';
        
        $data['remembered_email'] = get_cookie('remember_email');
        
        $this->smarty->view('auth/login.tpl', $data);
    }

    public function register() {
        $data['title'] = 'Register | Craftology';
        $data['page'] = 'register';
        
        $this->smarty->view('auth/register.tpl', $data);
    }

    public function forgot_password() {
        $data['title'] = 'Forgot Password | Craftology';
        $data['page'] = 'forgot_password';
        
        $this->smarty->view('auth/forgot_password.tpl', $data);
    }

    public function register_action() {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        }

        $this->load->library('form_validation');
        $this->form_validation->set_rules('customer_name', 'Full Name', 'trim|required|min_length[3]');
        $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
        $this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[6]');

        if ($this->form_validation->run() == FALSE) {
            echo json_encode(['success' => 0, 'messages' => strip_tags(validation_errors())]);
            return;
        }

        $name = $this->input->post('customer_name');
        $email = $this->input->post('email');
        $password = $this->input->post('password');

        // Check if email already exists in customer_master
        $this->db->where('email', $email);
        $exists = $this->db->get('customer_master')->row();

        if ($exists) {
            echo json_encode(['success' => 0, 'messages' => 'Email already registered.']);
            return;
        }

        // Generate Customer Code
        $last_customer = $this->db->select('customer_code')->order_by('id', 'DESC')->limit(1)->get('customer_master')->row();
        $new_code = 'CUST001';
        if ($last_customer) {
            $num = (int) substr($last_customer->customer_code, 4);
            $new_code = 'CUST' . str_pad($num + 1, 3, '0', STR_PAD_LEFT);
        }

        // Insert into customer_master
        $customer_data = [
            'customer_code' => $new_code,
            'customer_name' => $name,
            'email' => $email,
            'password' => password_hash($password, PASSWORD_BCRYPT),
            'status' => 'Active',
            'added_date' => date('Y-m-d H:i:s'),
            'added_by' => 0,
            'is_delete' => '0'
        ];

        if ($this->db->insert('customer_master', $customer_data)) {
            echo json_encode(['success' => 1, 'messages' => 'Registration successful! You can now login.']);
        } else {
            echo json_encode(['success' => 0, 'messages' => 'Failed to register. Please try again.']);
        }
    }

    public function login_action() {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        }

        $this->load->library('form_validation');
        $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
        $this->form_validation->set_rules('password', 'Password', 'trim|required');

        if ($this->form_validation->run() == FALSE) {
            echo json_encode(['success' => 0, 'messages' => strip_tags(validation_errors())]);
            return;
        }

        $email = $this->input->post('email');
        $password = $this->input->post('password');

        // Check customer_master
        $this->db->where('email', $email);
        $this->db->where('is_delete', '0');
        $customer = $this->db->get('customer_master')->row();

        if ($customer && password_verify($password, $customer->password)) {
            if ($customer->status != 'Active') {
                echo json_encode(['success' => 0, 'messages' => 'Your account is ' . $customer->status . '. Please contact support.']);
                return;
            }

            // Set Session
            $session_data = [
                'customer_id' => $customer->id,
                'customer_name' => $customer->customer_name,
                'customer_email' => $customer->email,
                'is_customer_logged_in' => TRUE
            ];
            $this->session->set_userdata($session_data);

            // Remember Me logic
            $this->load->helper('cookie');
            if ($this->input->post('remember')) {
                set_cookie('remember_email', $email, 86400 * 30); // 30 days
            } else {
                delete_cookie('remember_email');
            }

            echo json_encode(['success' => 1, 'messages' => 'Login successful! Redirecting...', 'redirect' => base_url('shop')]);
        } else {
            echo json_encode(['success' => 0, 'messages' => 'Invalid email or password.']);
        }
    }

    public function forgot_password_action() {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        }

        $this->load->library('form_validation');
        $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');

        if ($this->form_validation->run() == FALSE) {
            echo json_encode(['success' => 0, 'messages' => strip_tags(validation_errors())]);
            return;
        }

        $email = $this->input->post('email');

        // Check customer_master
        $this->db->where('email', $email);
        $this->db->where('is_delete', '0');
        $customer = $this->db->get('customer_master')->row();

        if ($customer) {
            // Here you would typically generate a token and send an email.
            // For now, we'll simulate success.
            echo json_encode(['success' => 1, 'messages' => 'If this email is registered, you will receive a password reset link shortly.']);
        } else {
            // Security best practice: don't reveal if email exists, but here we might want to be helpful for UX if the user requests it.
            // Usually, we return the same success message even if it doesn't exist.
            echo json_encode(['success' => 1, 'messages' => 'If this email is registered, you will receive a password reset link shortly.']);
        }
    }

    public function logout() {
        $this->load->helper('cookie');
        
        $session_data = [
            'customer_id',
            'customer_name',
            'customer_email',
            'is_customer_logged_in'
        ];
        $this->session->unset_userdata($session_data);
        
        redirect(base_url('shop/login'));
    }
}
