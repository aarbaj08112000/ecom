<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Wishlist_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    /**
     * Get user wishlist with product details
     */
    public function get_user_wishlist($user_id) {
        $this->db->select('w.*, p.name, p.price, pi.image_path');
        $this->db->from('wishlist w');
        $this->db->join('products p', 'p.id = w.product_id', 'left');
        $this->db->join('product_images pi', 'pi.product_id = p.id AND pi.is_cover = "1"', 'left');
        $this->db->where('w.user_id', $user_id);
        $this->db->where('w.is_delete', '0');
        $this->db->where('w.status', 'Active');
        $this->db->order_by('w.added_date', 'DESC');
        
        $query = $this->db->get();
        return $query->result();
    }

    /**
     * Get array of product IDs in user's wishlist
     */
    public function get_wishlisted_product_ids($user_id) {
        $this->db->select('product_id');
        $this->db->from('wishlist');
        $this->db->where('user_id', $user_id);
        $this->db->where('is_delete', '0');
        $this->db->where('status', 'Active');
        $query = $this->db->get();
        
        $result = [];
        foreach ($query->result() as $row) {
            $result[] = $row->product_id;
        }
        return $result;
    }

    /**
     * Get all wishlists for Admin
     */
    public function get_all_wishlists() {
        $this->db->select('w.*, p.name as product_name, p.price, pi.image_path, u.customer_name, u.email');
        $this->db->from('wishlist w');
        $this->db->join('products p', 'p.id = w.product_id', 'left');
        $this->db->join('product_images pi', 'pi.product_id = p.id AND pi.is_cover = "1"', 'left');
        $this->db->join('customer_master u', 'u.id = w.user_id', 'left');
        $this->db->where('w.is_delete', '0');
        $this->db->order_by('w.added_date', 'DESC');
        
        $query = $this->db->get();
        return $query->result_array();
    }

    /**
     * Add item to wishlist
     */
    public function add_to_wishlist($data) {
        return $this->db->insert('wishlist', $data);
    }

    /**
     * Soft delete from wishlist
     */
    public function remove_from_wishlist($user_id, $product_id) {
        $this->db->where('user_id', $user_id);
        $this->db->where('product_id', $product_id);
        return $this->db->update('wishlist', ['is_delete' => '1']);
    }

    /**
     * Check if item exists in wishlist
     */
    public function check_exists($user_id, $product_id) {
        $this->db->where('user_id', $user_id);
        $this->db->where('product_id', $product_id);
        $this->db->where('is_delete', '0');
        return $this->db->count_all_results('wishlist') > 0;
    }

    /**
     * Get wishlist datatable
     */
    public function get_wishlist_datatable($start, $length, $search_value, $order_column, $order_dir) {
        $this->db->select('w.*, p.id as product_id, p.name as product_name, p.price, pi.image_path, u.customer_name, u.email');
        $this->db->from('wishlist w');
        $this->db->join('products p', 'p.id = w.product_id', 'left');
        $this->db->join('product_images pi', 'pi.product_id = p.id AND pi.is_cover = "1"', 'left');
        $this->db->join('customer_master u', 'u.id = w.user_id', 'left');
        $this->db->where('w.is_delete', '0');

        if (!empty($search_value)) {
            $this->db->group_start();
            $this->db->like('p.name', $search_value);
            $this->db->or_like('u.customer_name', $search_value);
            $this->db->or_like('u.email', $search_value);
            $this->db->group_end();
        }

        $this->db->order_by($order_column, $order_dir);
        $this->db->limit($length, $start);
        
        $query = $this->db->get();
        return $query->result_array();
    }

    /**
     * Get total wishlist count
     */
    public function get_wishlist_count() {
        $this->db->where('is_delete', '0');
        return $this->db->count_all_results('wishlist');
    }

    /**
     * Get filtered wishlist count
     */
    public function get_wishlist_filtered_count($search_value) {
        $this->db->select('w.*, p.name as product_name, u.customer_name, u.email');
        $this->db->from('wishlist w');
        $this->db->join('products p', 'p.id = w.product_id', 'left');
        $this->db->join('product_images pi', 'pi.product_id = p.id AND pi.is_cover = "1"', 'left');
        $this->db->join('customer_master u', 'u.id = w.user_id', 'left');
        $this->db->where('w.is_delete', '0');

        if (!empty($search_value)) {
            $this->db->group_start();
            $this->db->like('p.name', $search_value);
            $this->db->or_like('u.customer_name', $search_value);
            $this->db->or_like('u.email', $search_value);
            $this->db->group_end();
        }

        return $this->db->count_all_results();
    }
}
