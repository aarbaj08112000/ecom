<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cart extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->helper('url');
    }

    public function index() {
        $data['title'] = 'Shopping Cart';
        $data['page'] = 'cart';
        
        // Mock Cart Items: Art & Craft
        $data['cart_items'] = [
            (object)[
                'id' => 1, 
                'name' => 'Ocean Resin Geode Art', 
                'price' => 120.00, 
                'qty' => 1, 
                'image' => 'https://images.unsplash.com/photo-1595188735235-c30997195c47?q=80&w=200&auto=format&fit=crop'
            ],
            (object)[
                'id' => 2, 
                'name' => 'Handmade Crochet Bunny', 
                'price' => 45.00, 
                'qty' => 2, 
                'image' => 'https://images.unsplash.com/photo-1616699000030-802dc672c57a?q=80&w=200&auto=format&fit=crop'
            ]
        ];
        
        $this->smarty->view('cart/cart.tpl', $data);
    }

    public function checkout() {
        $data['title'] = 'Checkout';
        $data['page'] = 'checkout';
        
         // Mock Summary
        $data['total'] = 218;
        
        $this->smarty->view('cart/checkout.tpl', $data);
    }
}
