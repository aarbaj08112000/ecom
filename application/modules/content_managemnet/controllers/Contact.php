<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Contact extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Contact_model');
    }

    /**
     * Display contact list
     */
    public function index() {
        $data['contacts'] = $this->Contact_model->get_contacts();
        $this->smarty->loadView('contact.tpl', $data, 'Yes', 'Yes');
    }

    /**
     * Update contact status (AJAX)
     */
    public function update_status() {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        }

        $contact_id = $this->input->post('contact_id');
        $status = $this->input->post('status');

        $data = [
            'status' => $status
        ];

        if ($this->Contact_model->update_contact($data, $contact_id)) {
            echo json_encode(['success' => 1, 'msg' => 'Status updated successfully.']);
        } else {
            echo json_encode(['success' => 0, 'msg' => 'Failed to update status.']);
        }
    }

    /**
     * Delete contact (AJAX)
     */
    public function delete_contact() {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        }

        $contact_id = $this->input->post('contact_id');

        if ($this->Contact_model->delete_contact($contact_id)) {
            echo json_encode(['success' => 1, 'msg' => 'Contact record deleted successfully.']);
        } else {
            echo json_encode(['success' => 0, 'msg' => 'Failed to delete record.']);
        }
    }
}
