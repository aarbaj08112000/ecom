<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Delivery_partners extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Delivery_partners_model');
    }

    public function index() {
        $this->delivery_partners();
    }

    public function delivery_partners() {
        $data['base_url'] = base_url();
        $data['partners'] = $this->Delivery_partners_model->get_delivery_partners();
        $this->smarty->loadView('delivery_partners.tpl', $data, 'Yes', 'Yes');
    }

    public function save_delivery_partner() {
        $id = $this->input->post('id');
        $data = [
            'partner_name' => $this->input->post('partner_name'),
            'contact_person' => $this->input->post('contact_person'),
            'email' => $this->input->post('email'),
            'phone' => $this->input->post('phone'),
            'tracking_url_format' => $this->input->post('tracking_url_format'),
            'status' => $this->input->post('status') ? $this->input->post('status') : 'Active',
        ];

        if ($id) {
            $data['updated_date'] = date('Y-m-d H:i:s');
            $data['updated_by'] = $this->session->userdata('user_id');
            $result = $this->Delivery_partners_model->update_delivery_partner($id, $data);
            $message = "Delivery partner updated successfully.";
        } else {
            $data['added_date'] = date('Y-m-d H:i:s');
            $data['added_by'] = $this->session->userdata('user_id');
            $result = $this->Delivery_partners_model->add_delivery_partner($data);
            $message = "Delivery partner added successfully.";
        }

        if ($result) {
            echo json_encode(['success' => 1, 'messages' => $message]);
        } else {
            echo json_encode(['success' => 0, 'messages' => "Something went wrong."]);
        }
    }

    public function get_delivery_partner($id) {
        $partner = $this->Delivery_partners_model->get_delivery_partner_by_id($id);
        echo json_encode($partner);
    }

    public function delete_delivery_partner() {
        $id = $this->input->post('id');
        $data = [
            'is_delete' => 1,
            'updated_date' => date('Y-m-d H:i:s'),
            'updated_by' => $this->session->userdata('user_id')
        ];
        $result = $this->Delivery_partners_model->update_delivery_partner($id, $data);
        if ($result) {
            echo json_encode(['success' => 1, 'messages' => "Delivery partner deleted successfully."]);
        } else {
            echo json_encode(['success' => 0, 'messages' => "Failed to delete delivery partner."]);
        }
    }
}
