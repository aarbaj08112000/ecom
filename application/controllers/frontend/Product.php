<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->helper('url');
    }

    public function index() {
        // Load Models
        $this->load->model('product/Categories_model');
        $this->load->model('product/Product_model');

        // Get Filters from URL/POST
        $filters = [
            'categories' => $this->input->get('categories'),
            'min_price' => $this->input->get('min_price'),
            'max_price' => $this->input->get('max_price'),
            'sort' => $this->input->get('sort', TRUE) ?: 'default',
            'search' => $this->input->get('search', TRUE)
        ];

        // Process categories if it's a comma-separated string
        if (!empty($filters['categories']) && is_string($filters['categories'])) {
            $filters['categories'] = explode(',', $filters['categories']);
        }

        // Fetch Data
        $data['products'] = $this->Product_model->get_filtered_products($filters);
        $data['total_products'] = count($data['products']);
        $data['categories'] = $this->Categories_model->get_categories();
        $data['active_filters'] = $filters;
        
        $data['title'] = 'Shop Collection';
        $data['page'] = 'product_list';

        // Handle AJAX Request for filtering
        if ($this->input->is_ajax_request()) {
            $html = $this->smarty->fetch('product/product_grid.tpl', $data);
            echo json_encode([
                'status' => 'success',
                'html' => $html,
                'total_products' => $data['total_products'],
                'showing_text' => 'Showing 1-' . ($data['total_products'] > 12 ? 12 : $data['total_products']) . ' of ' . $data['total_products']
            ]);
            return;
        }
        
        $this->smarty->view('product/list.tpl', $data);
    }

    public function details($id = null) {
        if(!$id) redirect('shop');

        $this->load->model('product/Product_model');
        $product_data = $this->Product_model->get_product_by_id($id);
        
        if(empty($product_data)) redirect('shop/products');

        $data['title'] = $product_data['name'];
        $data['page'] = 'product_details';
        
        // Prepare product object for view consistency
        $data['product'] = (object)$product_data;
        $data['product']->images = $this->Product_model->get_product_images($id);
        $data['product']->attributes = $this->Product_model->get_product_attributes($id);
        
        // Fetch Dynamic Reviews
        $data['product']->reviews = $this->Product_model->get_product_reviews($id);
        $data['product']->reviews_count = count($data['product']->reviews);

        $this->smarty->view('product/details.tpl', $data);
    }
    
    private function _get_mock_products() {
        // Mock Products: Diverse Art & Craft Collection
        $products = [
            (object)[
                'id' => 1, 
                'name' => 'Pearl Ocean Resin Wall Clock', 
                'price' => 120.00, 
                'old_price' => 150.00, 
                'category' => 'Resin Art', 
                'rating' => 4.9, 
                'image' => 'https://images.unsplash.com/photo-1595188735235-c30997195c47?q=80&w=600&auto=format&fit=crop'
            ],
            (object)[
                'id' => 2, 
                'name' => 'Handmade Crochet Sunflower Bouquet', 
                'price' => 45.00, 
                'old_price' => 0, 
                'category' => 'Crochet', 
                'rating' => 5.0, 
                'image' => 'https://images.unsplash.com/photo-1616699000030-802dc672c57a?q=80&w=600&auto=format&fit=crop'
            ],
            (object)[
                'id' => 3, 
                'name' => 'Personalized Couple Name Frame', 
                'price' => 85.00, 
                'old_price' => 99.00, 
                'category' => 'Customized Gifts', 
                'rating' => 4.9, 
                'image' => 'https://images.unsplash.com/photo-1549465220-1a8b9238cd48?q=80&w=600&auto=format&fit=crop'
            ],
            (object)[
                'id' => 4, 
                'name' => 'Boho Macrame Wall Mirror', 
                'price' => 70.00, 
                'old_price' => 85.00, 
                'category' => 'Home Décor', 
                'rating' => 4.7, 
                'image' => 'https://images.unsplash.com/photo-1513519245088-0e12902e5a38?q=80&w=600&auto=format&fit=crop'
            ],
            (object)[
                'id' => 5, 
                'name' => 'Pressed Flower Resin Earrings', 
                'price' => 25.00, 
                'old_price' => 35.00, 
                'category' => 'Jewellery', 
                'rating' => 4.8, 
                'image' => 'https://images.unsplash.com/photo-1573408301185-9146fe634ad0?q=80&w=600&auto=format&fit=crop'
            ],
             (object)[
                'id' => 6, 
                'name' => 'Festive Diwali Toran Handcrafted', 
                'price' => 40.00, 
                'old_price' => 55.00, 
                'category' => 'Festive Specials', 
                'rating' => 4.8, 
                'image' => 'https://images.unsplash.com/photo-1512760678229-373b9409848d?q=80&w=600&auto=format&fit=crop'
            ],
            (object)[
                'id' => 7, 
                'name' => 'Pastel Crochet Baby Booties', 
                'price' => 30.00, 
                'old_price' => 0, 
                'category' => 'Crochet', 
                'rating' => 5.0, 
                'image' => 'https://images.unsplash.com/photo-1619420658402-9a674d8122d2?q=80&w=600&auto=format&fit=crop'
            ],
            (object)[
                'id' => 8, 
                'name' => 'Custom Resin Name Plate', 
                'price' => 65.00, 
                'old_price' => 80.00, 
                'category' => 'Resin Art', 
                'rating' => 4.7, 
                'image' => 'https://images.unsplash.com/photo-1678201297593-57790b4bf72d?q=80&w=600&auto=format&fit=crop'
            ]
        ];
        return $products;
    }
    
    public function submit_review() {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        }

        $this->load->library('form_validation');

        $this->form_validation->set_rules('product_id', 'Product ID', 'required|numeric');
        $this->form_validation->set_rules('rating', 'Rating', 'required|numeric|greater_than[0]|less_than_equal_to[5]');
        $this->form_validation->set_rules('name', 'Name', 'required|trim|max_length[100]');
        $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email|max_length[150]');
        $this->form_validation->set_rules('review', 'Review', 'required|trim|min_length[10]|max_length[1000]');

        if ($this->form_validation->run() == FALSE) {
            $response = [
                'status' => 'error',
                'message' => validation_errors()
            ];
        } else {
            $this->load->model('product/Product_model');
            
            $data = [
                'product_id' => $this->input->post('product_id'),
                'reviewer_name' => $this->input->post('name'),
                'email' => $this->input->post('email'),
                'rating' => $this->input->post('rating'),
                'comment' => $this->input->post('review'),
                'status' => 'Pending',
                'added_date' => date('Y-m-d H:i:s'),
                'is_delete' => '0'
            ];

            if ($this->Product_model->add_product_review($data)) {
                $response = [
                    'status' => 'success',
                    'message' => 'Thank you for your review! It will be published after moderation.'
                ];
            } else {
                $response = [
                    'status' => 'error',
                    'message' => 'Something went wrong. Please try again later.'
                ];
            }
        }

        echo json_encode($response);
    }

    private function _get_mock_product($id) {
        return (object)[
            'id' => $id,
            'name' => 'Handcrafted Resin Masterpiece',
            'description' => 'Each piece is lovingly handcrafted with premium resin and pigments, creating a unique ocean-inspired design that brings tranquility to your space.',
            'price' => 299,
            'old_price' => 399,
            'images' => [
                'https://images.unsplash.com/photo-1595188735235-c30997195c47?q=80&w=800&auto=format&fit=crop', // Resin Main
                'https://images.unsplash.com/photo-1616699000030-802dc672c57a?q=80&w=800&auto=format&fit=crop', // Crochet
                'https://images.unsplash.com/photo-1513519245088-0e12902e5a38?q=80&w=800&auto=format&fit=crop', // Decor
                'https://images.unsplash.com/photo-1549465220-1a8b9238cd48?q=80&w=800&auto=format&fit=crop'  // Gift
            ],
            'rating' => 4.8,
            'reviews_count' => 124,
            'sku' => 'PRD-'.$id.'-2025',
            'stock' => 15
        ];
    }
}
