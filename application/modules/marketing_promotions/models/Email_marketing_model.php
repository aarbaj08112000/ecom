<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Email_marketing_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }
    public function get_campaigns($limit = null, $start = null, $search = null) {
        $this->db->select('*');
        $this->db->from('email_marketing');
        $this->db->where('is_delete', 0);
        
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('campaign_name', $search);
            $this->db->or_like('subject', $search);
            $this->db->group_end();
        }
        
        if ($limit !== null && $start !== null) {
            $this->db->limit($limit, $start);
        }
        
        $this->db->order_by('added_date', 'DESC');
        $query = $this->db->get();
        return is_object($query) ? $query->result_array() : [];
    }

    public function get_campaign_count($search = null) {
        $this->db->from('email_marketing');
        $this->db->where('is_delete', 0);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('campaign_name', $search);
            $this->db->or_like('subject', $search);
            $this->db->group_end();
        }
        return $this->db->count_all_results();
    }

    public function add_campaign($data) {
        $this->db->insert('email_marketing', $data);
        return $this->db->insert_id();
    }

    public function update_campaign($id, $data) {
        $this->db->where('id', $id);
        $this->db->update('email_marketing', $data);
        return $this->db->affected_rows() >= 0;
    }

    public function get_campaign_by_id($id) {
        $this->db->where('id', $id);
        $this->db->where('is_delete', 0);
        $query = $this->db->get('email_marketing');
        return is_object($query) ? $query->row_array() : [];
    }

    public function get_all_campaigns_for_export($search = null) {
        $this->db->select('campaign_name, subject, target_audience, scheduled_date, status, sent_count, open_count, click_count, added_date');
        $this->db->from('email_marketing');
        $this->db->where('is_delete', 0);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('campaign_name', $search);
            $this->db->or_like('subject', $search);
            $this->db->group_end();
        }
        $this->db->order_by('added_date', 'DESC');
        $query = $this->db->get();
        return is_object($query) ? $query->result_array() : [];
    }

    public function get_dashboard_stats() {
        // Mocking subscriber count as there's no subscriber table yet, but we'll fetch others
        $this->db->select_sum('sent_count');
        $this->db->select_sum('open_count');
        $this->db->select_sum('click_count');
        $this->db->where('is_delete', 0);
        $query = $this->db->get('email_marketing');
        $stats = $query->row_array();

        return [
            'total_subscribers' => 10452, // Placeholder
            'total_sent' => $stats['sent_count'] ? $stats['sent_count'] : 0,
            'total_opens' => $stats['open_count'] ? $stats['open_count'] : 0,
            'total_clicks' => $stats['click_count'] ? $stats['click_count'] : 0,
        ];
    }
}
