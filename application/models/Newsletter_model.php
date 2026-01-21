<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Newsletter_model extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->table = 'newsletter_subscriptions';
    }

    /**
     * Subscribe an email to the newsletter
     */
    public function subscribe($email) {
        // Check if already exists
        $this->db->where('email', $email);
        $query = $this->db->get($this->table);
        $exists = $query->row();

        if ($exists) {
            if ($exists->status == 'Active') {
                return ['success' => false, 'message' => 'You are already subscribed!'];
            } else {
                // Re-activate
                $this->db->where('id', $exists->id);
                $this->db->update($this->table, ['status' => 'Active', 'added_date' => date('Y-m-d H:i:s')]);
                return ['success' => true, 'message' => 'Thank you for re-subscribing!'];
            }
        }

        $data = [
            'email' => $email,
            'status' => 'Active',
            'added_date' => date('Y-m-d H:i:s')
        ];

        if ($this->db->insert($this->table, $data)) {
            return ['success' => true, 'message' => 'Thank you for subscribing to our newsletter!'];
        }

        return ['success' => false, 'message' => 'Something went wrong. Please try again.'];
    }
}
