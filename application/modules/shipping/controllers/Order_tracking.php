<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Order_tracking extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Order_tracking_model');
    }

    public function index() {
        $this->order_tracking();
    }

    public function order_tracking() {
        $data['base_url'] = base_url();
        $data['trackings'] = $this->Order_tracking_model->get_order_tracking();
        $this->smarty->loadView('order_tracking.tpl', $data, 'Yes', 'Yes');
    }

    public function save_order_tracking() {
        $id = $this->input->post('id');
        $data = [
            'order_id' => $this->input->post('order_id'),
            'tracking_number' => $this->input->post('tracking_number'),
            'carrier_name' => $this->input->post('carrier_name'),
            'current_status' => $this->input->post('current_status'),
            'last_location' => $this->input->post('last_location'),
            'estimated_delivery' => $this->input->post('estimated_delivery'),
        ];

        if ($id) {
            $data['updated_date'] = date('Y-m-d H:i:s');
            $data['updated_by'] = $this->session->userdata('user_id');
            $result = $this->Order_tracking_model->update_order_tracking($id, $data);
            $message = "Order tracking updated successfully.";
        } else {
            $data['added_date'] = date('Y-m-d H:i:s');
            $data['added_by'] = $this->session->userdata('user_id');
            $result = $this->Order_tracking_model->add_order_tracking($data);
            $message = "Order tracking added successfully.";
        }

        if ($result) {
            echo json_encode(['success' => 1, 'messages' => $message]);
        } else {
            echo json_encode(['success' => 0, 'messages' => "Something went wrong."]);
        }
    }

    public function get_tracking($id) {
        $tracking = $this->Order_tracking_model->get_order_tracking_by_id($id);
        echo json_encode($tracking);
    }

    public function delete_order_tracking() {
        $id = $this->input->post('id');
        $data = [
            'is_delete' => 1,
            'updated_date' => date('Y-m-d H:i:s'),
            'updated_by' => $this->session->userdata('user_id')
        ];
        $result = $this->Order_tracking_model->update_order_tracking($id, $data);
        if ($result) {
            echo json_encode(['success' => 1, 'messages' => "Order tracking deleted successfully."]);
        } else {
            echo json_encode(['success' => 0, 'messages' => "Failed to delete order tracking."]);
        }
    }
}
