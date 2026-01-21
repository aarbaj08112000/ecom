<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Wishlist extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Wishlist_model');
    }

    /**
     * Display all wishlist items in the admin panel
     */
    public function wishlist_list() {
        $data['base_url'] = base_url();
        // $data['wishlist_items'] = $this->Wishlist_model->get_all_wishlists(); // No longer needed for server-side
        $this->smarty->loadView('wishlist_list.tpl', $data, 'Yes', 'Yes');
    }

    /**
     * AJAX handler for Wishlist DataTable
     */
    public function wishlist_list_ajax() {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length') ?? 10;
        $search = $this->input->post('search')['value'] ?? '';
        $order_idx = $this->input->post('order')[0]['column'] ?? 5; // Default to added_date if possible
        $order_dir = $this->input->post('order')[0]['dir'] ?? 'desc';
        $column_data = $this->input->post('columns')[$order_idx]['data'] ?? 'added_date';
        
        $order_column_mapping = [
            'image_path' => 'p.id',
            'product_name' => 'p.name',
            'user_name' => 'u.customer_name',
            'user_email' => 'u.email',
            'price' => 'p.price',
            'added_date' => 'w.added_date',
            'status' => 'w.status'
        ];
        
        $order_column = $order_column_mapping[$column_data] ?? 'w.added_date';

        $wishlists = $this->Wishlist_model->get_wishlist_datatable(
            $start, 
            $length, 
            $search, 
            $order_column, 
            $order_dir
        );
        
        $total_records = $this->Wishlist_model->get_wishlist_count();
        $filtered_records = $this->Wishlist_model->get_wishlist_filtered_count($search);

        $data = [];
        foreach ($wishlists as $row) {
            // Construct correct image path: public/uploads/products/{product_id}/cover.png
            $image_url = 'public/uploads/products/' . $row['product_id'] . '/cover.png';
            
            $data[] = [
                'image_path' => $image_url,
                'product_name' => $row['product_name'],
                'user_name' => $row['customer_name'],
                'user_email' => $row['email'],
                'price' => '₹' . number_format($row['price'], 2),
                'added_date' => date('d M Y, h:i A', strtotime($row['added_date'])),
                'status' => $row['status']
            ];
        }

        echo json_encode([
            "draw" => intval($draw),
            "recordsTotal" => $total_records,
            "recordsFiltered" => $filtered_records,
            "data" => $data
        ]);
    }
}
