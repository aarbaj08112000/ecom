<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Customer_reviews extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Customer_reviews_model');
        $this->load->model('Customer_model');
    }

    public function customer_reviews_list() {
        $data['base_url'] = base_url();
        $data['customers'] = $this->Customer_model->getCustomerData();
        $this->smarty->loadView('customer_reviews_list.tpl', $data, 'Yes', 'Yes');
    }

    public function get_reviews_ajax() {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search_value = $this->input->post('search')['value'] ?? '';
        $order_column_index = $this->input->post('order')[0]['column'] ?? 0;
        $order_dir = $this->input->post('order')[0]['dir'] ?? 'desc';

        $columns = ['cr.id', 'cm.customer_name', 'cr.rating', 'cr.comment', 'cr.reviewer_type', 'cr.status', 'cr.created_at'];
        $order_column = $columns[$order_column_index] ?? 'cr.id';

        $reviews = $this->Customer_reviews_model->get_reviews_paged($start, $length, $search_value, $order_column, $order_dir);
        $total_records = $this->Customer_reviews_model->get_total_reviews();
        $filtered_records = $this->Customer_reviews_model->get_filtered_reviews_count($search_value);

        $data = [];
        $base_url = base_url();

        foreach ($reviews as $val) {
            // Rating Stars
            $rating_html = '<div class="text-warning">';
            for ($i = 1; $i <= 5; $i++) {
                if ($i <= $val['rating']) {
                    $rating_html .= '<i class="ti ti-star-filled"></i>';
                } else {
                    $rating_html .= '<i class="ti ti-star"></i>';
                }
            }
            $rating_html .= '</div>';

            // Reviewer Type Badge
            $reviewer_badge = ucfirst($val['reviewer_type']);

            // Status Toggle
            $status_checked = ($val['status'] == 'Active') ? 'checked' : '';
            $status_html = '
                <div class="form-check form-switch d-flex justify-content-center">
                    <input class="form-check-input status-toggle" type="checkbox" data-id="'.$val['id'].'" '.$status_checked.'>
                </div>';

            // Action Buttons
            $action_html = '
                <div class="d-flex align-items-center justify-content-center gap-2">
                    <a href="javascript:void(0);" class="text-primary edit-review" data-id="'.$val['id'].'" title="Edit">
                        <i class="ti ti-edit"></i>
                    </a>
                    <a href="javascript:void(0);" class="text-danger delete-review" data-id="'.$val['id'].'" title="Delete">
                        <i class="ti ti-trash"></i>
                    </a>
                </div>';

            $data[] = [
                'customer_name' => $val['customer_name'],
                'rating' => $rating_html,
                'comment' => '<span class="text-truncate d-inline-block" style="max-width: 200px;" title="'.$val['comment'].'">'.$val['comment'].'</span>',
                'reviewer_type' => $reviewer_badge,
                'status' => $status_html,
                'created_at' => date('d M Y, H:i', strtotime($val['created_at'])),
                'action' => $action_html
            ];
        }

        $response = [
            'draw' => intval($draw),
            'recordsTotal' => $total_records,
            'recordsFiltered' => $filtered_records,
            'data' => $data
        ];

        echo json_encode($response);
    }

    public function save_review() {
        $id = $this->input->post('review_id');
        $data = array(
            'customer_id'   => $this->input->post('customer_id'),
            'reviewer_type' => $this->input->post('reviewer_type'),
            'rating'        => $this->input->post('rating'),
            'comment'       => $this->input->post('comment'),
            'status'        => $this->input->post('status') ?: 'Active'
        );

        if ($id) {
            $result = $this->Customer_reviews_model->update_review($id, $data);
            $msg = 'Review updated successfully.';
        } else {
            $result = $this->Customer_reviews_model->insert_review($data);
            $msg = 'Review added successfully.';
        }

        if ($result) {
            echo json_encode(array('success' => 1, 'msg' => $msg));
        } else {
            echo json_encode(array('success' => 0, 'msg' => 'Failed to save review.'));
        }
    }

    public function delete_review() {
        $id = $this->input->post('id');
        if ($this->Customer_reviews_model->delete_review($id)) {
            echo json_encode(array('success' => 1, 'msg' => 'Review deleted successfully.'));
        } else {
            echo json_encode(array('success' => 0, 'msg' => 'Failed to delete review.'));
        }
    }

    public function update_review_status() {
        $id = $this->input->post('id');
        $status = $this->input->post('status');
        if ($this->Customer_reviews_model->update_status($id, $status)) {
            echo json_encode(array('success' => 1, 'msg' => 'Status updated successfully.'));
        } else {
            echo json_encode(array('success' => 0, 'msg' => 'Failed to update status.'));
        }
    }

    public function get_review_details() {
        $id = $this->input->post('id');
        $review = $this->Customer_reviews_model->get_review_by_id($id);
        if ($review) {
            echo json_encode(array('success' => 1, 'data' => $review));
        } else {
            echo json_encode(array('success' => 0, 'msg' => 'Review not found.'));
        }
    }
}
