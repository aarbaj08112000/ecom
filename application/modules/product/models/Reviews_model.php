<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reviews_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    /**
     * Get reviews for DataTables
     * @param array $params DataTables parameters (start, length, search, order)
     * @return array Reviews data
     */
    public function get_reviews_datatable($params) {
        $this->db->select('r.*, p.name as product_name');
        $this->db->from('product_reviews as r');
        $this->db->join('products as p', 'p.id = r.product_id', 'left');
        $this->db->where('r.is_delete', '0');

        // Search
        if (!empty($params['search'])) {
            $this->db->group_start();
            $this->db->like('r.reviewer_name', $params['search']);
            $this->db->or_like('r.comment', $params['search']);
            $this->db->or_like('p.name', $params['search']);
            $this->db->group_end();
        }

        // Filtering
        if (!empty($params['product_filter'])) {
            $this->db->where('r.product_id', $params['product_filter']);
        }
        if (!empty($params['rating_filter'])) {
            $this->db->where('r.rating', $params['rating_filter']);
        }
        if (!empty($params['status_filter'])) {
            $this->db->where('r.status', $params['status_filter']);
        }

        // Order
        if (!empty($params['order_column']) && !empty($params['order_dir'])) {
            $this->db->order_by($params['order_column'], $params['order_dir']);
        } else {
            $this->db->order_by('r.added_date', 'DESC');
        }

        // Pagination
        if (isset($params['start']) && isset($params['length'])) {
            $this->db->limit($params['length'], $params['start']);
        }

        $result_obj = $this->db->get();
        return is_object($result_obj) ? $result_obj->result_array() : [];
    }

    /**
     * Get total count of reviews
     * @param array $params Filter parameters
     * @return int Total count
     */
    public function get_reviews_count($params = []) {
        $this->db->from('product_reviews as r');
        $this->db->join('products as p', 'p.id = r.product_id', 'left');
        $this->db->where('r.is_delete', '0');

        if (!empty($params['search'])) {
            $this->db->group_start();
            $this->db->like('r.reviewer_name', $params['search']);
            $this->db->or_like('r.comment', $params['search']);
            $this->db->or_like('p.name', $params['search']);
            $this->db->group_end();
        }

        if (!empty($params['product_filter'])) {
            $this->db->where('r.product_id', $params['product_filter']);
        }
        if (!empty($params['rating_filter'])) {
            $this->db->where('r.rating', $params['rating_filter']);
        }
        if (!empty($params['status_filter'])) {
            $this->db->where('r.status', $params['status_filter']);
        }

        return $this->db->count_all_results();
    }

    /**
     * Update review status
     * @param int $review_id
     * @param string $status
     * @return bool
     */
    public function update_status($review_id, $status) {
        $this->db->where('review_id', $review_id);
        return $this->db->update('product_reviews', ['status' => $status]);
    }

    /**
     * Soft delete review
     * @param int $review_id
     * @return bool
     */
    public function delete_review($review_id) {
        $this->db->where('review_id', $review_id);
        return $this->db->update('product_reviews', ['is_delete' => '1']);
    }

    /**
     * Get all products for filtering
     * @return array
     */
    public function get_products() {
        $this->db->select('id, name');
        $this->db->from('products');
        $this->db->where('is_delete', '0');
        return $this->db->get()->result_array();
    }
}
