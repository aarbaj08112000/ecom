<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->helper('url');
    }

    public function index() {
        $data['title'] = 'Shop Collection';
        $data['page'] = 'product_list';
        
        // Mock Data for now
        $data['products'] = $this->_get_mock_products();
        
        $this->smarty->view('product/list.tpl', $data);
    }

    public function details($id = null) {
        if(!$id) redirect('shop');

        $data['title'] = 'Product Details';
        $data['page'] = 'product_details';
        $data['product'] = $this->_get_mock_product($id);

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
