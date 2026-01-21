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

    /**
     * Get shipping charge based on pincode
     * Matches pincode against ranges in shipping_pincode_charge table
     */
    public function get_shipping_charge($pincode, $order_amount = 0) {
        // Global Free Shipping Threshold
        $global_free_threshold = $this->config->item('free_shipping_threshold');
        if ($global_free_threshold > 0 && $order_amount >= $global_free_threshold) {
            return [
                'status' => 'success',
                'charge' => 0.00,
                'is_serviceable' => true,
                'estimated_days' => 'Standard' // Or fetch from a default if needed
            ];
        }

        $this->db->where('pincode_from <=', $pincode);
        $this->db->where('pincode_to >=', $pincode);
        $this->db->where('status', 1);
        $query = $this->db->get('shipping_pincode_charge');
        $charge_info = $query->row();

        if ($charge_info) {
            // Check if order amount qualifies for free shipping (if min_order_amount > 0 and met)
            if ($charge_info->min_order_amount > 0 && $order_amount >= $charge_info->min_order_amount) {
                return [
                    'status' => 'success',
                    'charge' => 0.00,
                    'is_serviceable' => true,
                    'estimated_days' => $charge_info->estimated_days
                ];
            }
            return [
                'status' => 'success',
                'charge' => $charge_info->shipping_charge,
                'is_serviceable' => true,
                'estimated_days' => $charge_info->estimated_days
            ];
        }

        return [
            'status' => 'error',
            'charge' => 0.00,
            'is_serviceable' => false,
            'message' => 'Shipping not available for this pincode.'
        ];
    }

    /**
     * Validate coupon code and calculate discount
     */
    public function validate_coupon($code, $subtotal) {
        $this->db->where('code', $code);
        $this->db->where('coupons_status', 'Active');
        $this->db->where('status', 'Active');
        $this->db->where('is_delete', '0');
        $this->db->group_start();
            $this->db->where('expires_at >=', date('Y-m-d'));
            $this->db->or_where('expires_at IS NULL');
        $this->db->group_end();
        $query = $this->db->get('coupons');
        $coupon = $query->row();

        if (!$coupon) {
            return ['success' => false, 'message' => 'Invalid or expired coupon code.'];
        }

        if ($subtotal < $coupon->min_order_value) {
            return ['success' => false, 'message' => 'Minimum order value for this coupon is ' . $coupon->min_order_value];
        }

        $discount_amount = 0;
        if ($coupon->discount_type === 'Percentage') {
            $discount_amount = ($subtotal * $coupon->discount) / 100;
        } else {
            $discount_amount = $coupon->discount;
        }

        // Ensure discount doesn't exceed subtotal
        if ($discount_amount > $subtotal) {
            $discount_amount = $subtotal;
        }

        return [
            'success' => true,
            'coupon_id' => $coupon->coupons_id,
            'code' => $coupon->code,
            'discount_amount' => $discount_amount,
            'discount_type' => $coupon->discount_type,
            'discount_value' => $coupon->discount
        ];
    }
}
