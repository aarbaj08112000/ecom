<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Traffic_hook {

    public function log_activity() {
        $CI =& get_instance();
        
        // Skip analytics for AJAX requests and Admin panel calls if needed
        // For now, let's log everything but identify the URI
        
        $ip_address = $CI->input->ip_address();
        $user_agent = $CI->input->user_agent();
        $request_uri = $_SERVER['REQUEST_URI'];
        $referrer = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '';
        
        // Simple device detection
        $device_type = 'Desktop';
        if ($CI->agent->is_mobile()) {
            $device_type = 'Mobile';
        } elseif ($CI->agent->is_browser()) {
            $device_type = 'Desktop';
        }
        
        // Additional tablet check if needed, but mobile covers most
        
        $data = [
            'ip_address' => $ip_address,
            'user_agent' => $user_agent,
            'request_uri' => $request_uri,
            'referrer' => $referrer,
            'device_type' => $device_type
        ];
        
        $CI->db->insert('traffic_logs', $data);
    }
}
