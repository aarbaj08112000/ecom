<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }
     public function get_categories(){
        $this->db->select('c.*');
        $this->db->from('categories as c');
        $this->db->where("c.status",'Active');
        $this->db->where("c.is_delete",'0');
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function get_brands(){
        $this->db->select('b.*');
        $this->db->from('brands as b');
        $this->db->where("b.status",'Active');
        $this->db->where("b.is_delete",'0');
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function get_attribute(){
        $this->db->select('a.*');
        $this->db->from('attribute as a');
        $this->db->where("a.status",'Active');
        $this->db->where("a.is_delete",'0');
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }

    /**
     * Insert product data
     * @param array $data Product data
     * @return int|bool Product ID on success, false on failure
     */
    public function insert_product($data){
        $this->db->insert('products', $data);
        if($this->db->affected_rows() > 0){
            return $this->db->insert_id();
        }
        return false;
    }

    /**
     * Insert multiple product images
     * @param array $data Array of image data
     * @return bool Success status
     */
    public function insert_product_images($data){
        if(empty($data)){
            return true;
        }
        $this->db->insert_batch('product_images', $data);
        return $this->db->affected_rows() > 0;
    }

    /**
     * Insert multiple product attributes
     * @param array $data Array of attribute data
     * @return bool Success status
     */
    public function insert_product_attributes($data){
        if(empty($data)){
            return true;
        }
        $this->db->insert_batch('product_attributes', $data);
        return $this->db->affected_rows() > 0;
    }

    /**
     * Get product by ID
     * @param int $product_id Product ID
     * @return array Product data
     */
    public function get_product_by_id($product_id){
        $this->db->select('p.*');
        $this->db->from('products as p');
        $this->db->where('p.id', $product_id);
        $this->db->where('p.is_delete', '0');
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    }

    /**
     * Get product images
     * @param int $product_id Product ID
     * @return array Array of product images
     */
    public function get_product_images($product_id){
        $this->db->select('pi.*');
        $this->db->from('product_images as pi');
        $this->db->where('pi.product_id', $product_id);
        $this->db->where('pi.is_delete', '0');
        $this->db->order_by('pi.is_cover', 'DESC');
        $this->db->order_by('pi.display_order', 'ASC');
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }

    /**
     * Get product attributes
     * @param int $product_id Product ID
     * @return array Array of product attributes
     */
    public function get_product_attributes($product_id){
        $this->db->select('pa.*, a.attribute_name');
        $this->db->from('product_attributes as pa');
        $this->db->join('attribute as a', 'a.attribute_id = pa.attribute_id', 'left');
        $this->db->where('pa.product_id', $product_id);
        $this->db->where('pa.is_delete', '0');
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }

    /**
     * Get products for DataTables with server-side processing
     * @param array $params DataTables parameters (start, length, search, order)
     * @return array Products data
     */
    public function get_products_datatable($params){
        $this->db->select('p.id, p.name, p.detail, p.price, p.discount_percentage, p.is_gst_applicable, p.gst_percentage, p.stock_quantity, p.status, pi.image_path as cover_image');
        $this->db->from('products as p');
        $this->db->join('product_images as pi', 'pi.product_id = p.id AND pi.is_cover = "1"', 'left');
        $this->db->where('p.is_delete', '0');
        
        // Search
        if (!empty($params['search'])) {
            $this->db->group_start();
            $this->db->like('p.name', $params['search']);
            $this->db->or_like('p.detail', $params['search']);
            $this->db->group_end();
        }
        
        // Order
        if (!empty($params['order_column']) && !empty($params['order_dir'])) {
            $this->db->order_by($params['order_column'], $params['order_dir']);
        } else {
            $this->db->order_by('p.id', 'DESC');
        }
        
        // Pagination
        if (isset($params['start']) && isset($params['length'])) {
            $this->db->limit($params['length'], $params['start']);
        }
        
        $result_obj = $this->db->get();
        return is_object($result_obj) ? $result_obj->result_array() : [];
    }

    /**
     * Get total count of products (for DataTables)
     * @param string $search Search term
     * @return int Total count
     */
    public function get_products_count($search = ''){
        $this->db->from('products as p');
        $this->db->where('p.is_delete', '0');
        
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('p.name', $search);
            $this->db->or_like('p.detail', $search);
            $this->db->group_end();
        }
        
        return $this->db->count_all_results();
    }
    /**
     * Update product data
     * @param int $id Product ID
     * @param array $data Product data
     * @return bool True on success, false on failure
     */
    public function update_product($id, $data){
        $this->db->where('id', $id);
        $this->db->update('products', $data);
        return $this->db->affected_rows() >= 0;
    }

    /**
     * Delete all attributes for a product
     * @param int $product_id Product ID
     * @return bool Success status
     */
    public function delete_product_attributes($product_id){
        $this->db->where('product_id', $product_id);
        $this->db->delete('product_attributes');
        return true; // Always return true even if no rows deleted
    }

    /**
     * Delete a specific product image
     * @param int $image_id Image ID
     * @return bool Success status
     */
    public function delete_image($image_id){
        $this->db->where('image_id', $image_id);
        return $this->db->delete('product_images');
    }

    /**
     * Reset cover image for a product (set all is_cover to 0)
     * @param int $product_id Product ID
     * @return bool Success status
     */
    public function reset_cover_image($product_id){
        $this->db->where('product_id', $product_id);
        return $this->db->update('product_images', ['is_cover' => '0']);
    }

    /**
     * Set a specific image as cover
     * @param int $image_id Image ID
     * @return bool Success status
     */
    public function set_cover_image($image_id){
        $this->db->where('image_id', $image_id);
        return $this->db->update('product_images', ['is_cover' => '1']);
    }
}

