<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends MY_Controller {

    public function __construct() {
        parent::__construct();
        // Load necessary models/libraries here
        $this->load->helper('url');
    }

    public function index() {
        $data['title'] = 'Home';
        $data['page'] = 'home';
        
        $data['best_sellers'] = $this->_get_best_sellers();
        $data['new_arrivals'] = $this->_get_new_arrivals();
        
        $this->smarty->view('home.tpl', $data);
    }

    private function _get_best_sellers() {
        return [
            (object)['id'=>1, 'name'=>'Ocean Resin Clock', 'price'=>120.00, 'image'=>'https://images.unsplash.com/photo-1595188735235-c30997195c47?q=80&w=600', 'rating'=>4.9],
            (object)['id'=>2, 'name'=>'Crochet Sunflower', 'price'=>45.00, 'image'=>'https://images.unsplash.com/photo-1616699000030-802dc672c57a?q=80&w=600', 'rating'=>5.0],
            (object)['id'=>3, 'name'=>'Custom Name Frame', 'price'=>85.00, 'image'=>'https://images.unsplash.com/photo-1549465220-1a8b9238cd48?q=80&w=600', 'rating'=>4.8],
            (object)['id'=>4, 'name'=>'Macrame Mirror', 'price'=>70.00, 'image'=>'https://images.unsplash.com/photo-1513519245088-0e12902e5a38?q=80&w=600', 'rating'=>4.7]
        ];
    }

    private function _get_new_arrivals() {
        return [
            (object)['id'=>5, 'name'=>'Resin Earrings', 'price'=>25.00, 'image'=>'https://images.unsplash.com/photo-1573408301185-9146fe634ad0?q=80&w=600', 'rating'=>4.9],
            (object)['id'=>6, 'name'=>'Diwali Toran', 'price'=>40.00, 'image'=>'https://images.unsplash.com/photo-1512760678229-373b9409848d?q=80&w=600', 'rating'=>4.6],
            (object)['id'=>7, 'name'=>'Baby Booties', 'price'=>30.00, 'image'=>'https://images.unsplash.com/photo-1619420658402-9a674d8122d2?q=80&w=600', 'rating'=>5.0],
            (object)['id'=>8, 'name'=>'Resin Coasters', 'price'=>35.00, 'image'=>'https://images.unsplash.com/photo-1678201297593-57790b4bf72d?q=80&w=600', 'rating'=>4.8]
        ];
    }

    public function contact() {
        $data['title'] = 'Contact Us';
        $data['page'] = 'contact';
        
        $this->smarty->view('contact.tpl', $data);
    }

    public function about() {
        $data['title'] = 'About Us | Craftology';
        $data['page'] = 'about';
        
        $this->smarty->view('about.tpl', $data);
    }

    /**
     * AJAX endpoint to handle contact form submission
     */
    public function submit_contact() {
        // Verify AJAX request
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        }

        // Load model
        $this->load->model('Contact_model');

        // Get POST data
        $name = $this->input->post('contact_name');
        $email = $this->input->post('contact_email');
        $subject = $this->input->post('contact_subject');
        $message = $this->input->post('contact_message');

        // Server-side validation
        if (empty($name) || strlen($name) < 2) {
            echo json_encode(['success' => 0, 'message' => 'Please enter a valid name (minimum 2 characters).']);
            return;
        }

        if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
            echo json_encode(['success' => 0, 'message' => 'Please enter a valid email address.']);
            return;
        }

        if (empty($subject)) {
            echo json_encode(['success' => 0, 'message' => 'Please select a subject.']);
            return;
        }

        if (empty($message) || strlen($message) < 10) {
            echo json_encode(['success' => 0, 'message' => 'Please enter a message (minimum 10 characters).']);
            return;
        }

        // Prepare data
        $data = [
            'name' => $name,
            'email' => $email,
            'subject' => $subject,
            'message' => $message
        ];

        // Save to database
        if ($this->Contact_model->save_contact($data)) {
            echo json_encode([
                'success' => 1, 
                'message' => 'Thank you for contacting us! We will get back to you soon.'
            ]);
        } else {
            echo json_encode([
                'success' => 0, 
                'message' => 'Failed to send your message. Please try again later.'
            ]);
        }
    }
}
