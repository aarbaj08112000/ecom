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
}
