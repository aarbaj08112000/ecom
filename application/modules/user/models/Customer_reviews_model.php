<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Customer_reviews_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_reviews_paged($start, $length, $search, $order_col, $order_dir)
    {
        $this->db->select('cr.*, cm.customer_name');
        $this->db->from('customer_reviews cr');
        $this->db->join('customer_master cm', 'cr.customer_id = cm.id');
        $this->db->where('cr.is_delete', '0');

        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('cm.customer_name', $search);
            $this->db->or_like('cr.comment', $search);
            $this->db->or_like('cr.reviewer_type', $search);
            $this->db->group_end();
        }

        $this->db->order_by($order_col, $order_dir);
        $this->db->limit($length, $start);
        $query = $this->db->get();
        return $query->result_array();
    }

    public function get_total_reviews()
    {
        $this->db->where('is_delete', '0');
        return $this->db->count_all_results('customer_reviews');
    }

    public function get_filtered_reviews_count($search)
    {
        $this->db->from('customer_reviews cr');
        $this->db->join('customer_master cm', 'cr.customer_id = cm.id');
        $this->db->where('cr.is_delete', '0');

        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('cm.customer_name', $search);
            $this->db->or_like('cr.comment', $search);
            $this->db->or_like('cr.reviewer_type', $search);
            $this->db->group_end();
        }

        return $this->db->count_all_results();
    }

    public function get_reviews_by_customer($customer_id)
    {
        $this->db->select('*');
        $this->db->from('customer_reviews');
        $this->db->where('customer_id', $customer_id);
        $this->db->where('is_delete', '0');
        $this->db->order_by('created_at', 'DESC');
        return $this->db->get()->result_array();
    }

    public function insert_review($data)
    {
        return $this->db->insert('customer_reviews', $data);
    }

    public function update_review($id, $data)
    {
        $this->db->where('id', $id);
        return $this->db->update('customer_reviews', $data);
    }

    public function delete_review($id)
    {
        $this->db->where('id', $id);
        return $this->db->update('customer_reviews', array('is_delete' => '1'));
    }

    public function update_status($id, $status)
    {
        $this->db->where('id', $id);
        return $this->db->update('customer_reviews', array('status' => $status));
    }

    public function get_review_by_id($id)
    {
        return $this->db->get_where('customer_reviews', array('id' => $id))->row_array();
    }
}
