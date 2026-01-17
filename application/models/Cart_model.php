<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cart_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    // Get cart items for a user
    public function get_cart_items($user_id) {
        $this->db->select('c.cart_id, c.product_id, c.quantity, p.name, p.price, p.image, p.stock_quantity');
        $this->db->from('cart c');
        $this->db->join('products p', 'c.product_id = p.id');
        $this->db->where('c.user_id', $user_id);
        $this->db->order_by('c.added_date', 'DESC');
        $query = $this->db->get();
        return $query->result();
    }

    // Add item to cart or update quantity if exists (logic moved to controller mostly, but here we can handle db ops)
    // Better: Controller checks existence, calls add or update.
    // Or simpler: Model handles "add or update".
    public function add_to_cart($user_id, $product_id, $quantity = 1) {
        // Check if exists
        $this->db->where('user_id', $user_id);
        $this->db->where('product_id', $product_id);
        $query = $this->db->get('cart');

        if ($query->num_rows() > 0) {
            // Update quantity
            $row = $query->row();
            $new_obj = $row->quantity + $quantity;
            // Check stock? (Optional but good)
            
            $this->db->where('cart_id', $row->cart_id);
            return $this->db->update('cart', ['quantity' => $new_obj]);
        } else {
            // Insert
            $data = [
                'user_id' => $user_id,
                'product_id' => $product_id,
                'quantity' => $quantity
            ];
            return $this->db->insert('cart', $data);
        }
    }

    // Update specific cart item quantity
    public function update_quantity($cart_id, $quantity) {
        $this->db->where('cart_id', $cart_id);
        return $this->db->update('cart', ['quantity' => $quantity]);
    }

    // Remove item from cart
    public function remove_item($cart_id, $user_id) {
        $this->db->where('cart_id', $cart_id);
        $this->db->where('user_id', $user_id); // Safety check
        return $this->db->delete('cart');
    }

    // Get total cart count (for header mostly, but good utility)
    public function get_cart_count($user_id) {
        $this->db->where('user_id', $user_id);
        return $this->db->count_all_results('cart');
    }
    
    // Check product stock
    public function get_product_stock($product_id) {
        $this->db->select('stock_quantity');
        $this->db->where('id', $product_id);
        $query = $this->db->get('products');
        if($query->num_rows() > 0){
             return $query->row()->stock_quantity;
        }
        return 0;
    }
    // Create Order
    public function create_order($data) {
        $this->db->insert('orders', $data);
        return $this->db->insert_id();
    }

    // Insert Order Items
    public function insert_order_items($order_id, $items) {
        $data = [];
        foreach ($items as $item) {
            $data[] = [
                'order_id' => $order_id,
                'product_id' => $item->product_id,
                'quantity' => $item->quantity,
                'price' => $item->price,
                'product_name_at_order' => $item->name,
                // 'sku_at_order' => $item->sku // If SKU exists
            ];
        }
        if (!empty($data)) {
            return $this->db->insert_batch('order_items', $data);
        }
        return false;
    }

    // Clear Cart
    public function clear_cart($user_id) {
        $this->db->where('user_id', $user_id);
        return $this->db->delete('cart');
    }
    // Update Payment Status
    public function update_payment_status($order_id, $payment_id) {
        $this->db->where('order_id', $order_id);
        return $this->db->update('orders', [
            'payment_status' => 'Paid', 
            'payment_method' => 'Credit Card (' . $payment_id . ')',
            'updated_date' => date('Y-m-d H:i:s')
        ]);
    }
}
