<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Settings extends MY_Controller {

    public function __construct() {
        parent::__construct();
        if (!$this->checkSession()) {
            redirect(base_url("secure_admin/login"));
        }
        $this->load->model('Settings_model');
    }

    public function index() {
        $role = $this->session->userdata('role');
        $settings = $this->Settings_model->get_settings($role);
        
        // Group settings
        $grouped_settings = [
            'Admin Settings' => [],
            'Frontend Settings' => [],
            'Company Info' => [],
            'Social Media' => [],
            'Email & SMTP' => [],
            'Other' => []
        ];

        $company_info_keys = ['company_description', 'contact_location', 'contact_phone', 'google_map_location', 'company_email'];
        $smtp_keys = ['email_notification_enable', 'password_link_expiry'];

        foreach ($settings as $setting) {
            $name = $setting['name'];
            if (strpos($name, 'admin_') === 0) {
                $grouped_settings['Admin Settings'][] = $setting;
            } elseif (strpos($name, 'frontend_') === 0) {
                $grouped_settings['Frontend Settings'][] = $setting;
            } elseif (in_array($name, $company_info_keys)) {
                $grouped_settings['Company Info'][] = $setting;
            } elseif (strpos($name, 'social_') === 0) {
                $grouped_settings['Social Media'][] = $setting;
            } elseif (strpos($name, 'smtp_') === 0 || in_array($name, $smtp_keys)) {
                $grouped_settings['Email & SMTP'][] = $setting;
            } else {
                $grouped_settings['Other'][] = $setting;
            }
        }

        $data['base_url'] = base_url();
        $data['grouped_settings'] = $grouped_settings;
        $data['user_role'] = $role;
        
        $this->smarty->loadView('general_settings.tpl', $data, 'Yes', 'Yes');
    }

    public function update_setting() {
        $role = $this->session->userdata('role');
        $name = $this->input->post('name');
        $type = $this->input->post('type');
        
        // Security check for non-Super Admins
        if ($role !== 'Super Admin') {
            $setting = $this->Settings_model->get_setting_by_name($name);
            if (!$setting || $setting['is_edit'] !== 'Yes') {
                echo json_encode(['success' => 0, 'messages' => 'Access denied.']);
                return;
            }
        }

        $value = $this->input->post('value');

        if ($type === 'file') {
            if (!empty($_FILES['value']['name'])) {
                $config['upload_path'] = './public/uploads/config_setting/';
                $config['allowed_types'] = 'gif|jpg|png|jpeg|ico|svg|pdf|docx|doc';
                $config['encrypt_name'] = TRUE;

                if (!is_dir($config['upload_path'])) {
                    mkdir($config['upload_path'], 0777, true);
                }

                $this->load->library('upload', $config);

                if ($this->upload->do_upload('value')) {
                    $upload_data = $this->upload->data();
                    $new_file = 'public/uploads/config_setting/' . $upload_data['file_name'];
                    
                    // Cleanup old file
                    $old_setting = $this->Settings_model->get_setting_by_name($name);
                    if ($old_setting && !empty($old_setting['value'])) {
                        $old_file_path = './' . $old_setting['value'];
                        if (file_exists($old_file_path)) {
                            unlink($old_file_path);
                        }
                    }
                    
                    $value = $new_file;
                } else {
                    echo json_encode(['success' => 0, 'messages' => $this->upload->display_errors()]);
                    return;
                }
            } else {
                // If it's a file type but no file was uploaded, don't update
                echo json_encode(['success' => 0, 'messages' => 'No file selected.']);
                return;
            }
        }

        if ($this->Settings_model->update_setting($name, $value)) {
            echo json_encode(['success' => 1, 'messages' => 'Setting updated successfully.']);
        } else {
            echo json_encode(['success' => 0, 'messages' => 'Failed to update setting.']);
        }
    }
}
