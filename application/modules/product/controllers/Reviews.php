<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reviews extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Reviews_model');
    }

    /**
     * Display the reviews listing page
     */
    public function reviews() {
        $data['products'] = $this->Reviews_model->get_products();
        $this->smarty->loadView('reviews.tpl', $data, 'Yes', 'Yes');
    }

    /**
     * AJAX handler for DataTables
     */
    public function reviews_list_ajax() {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search_value = $this->input->post('search')['value'] ?? '';
        
        $order_column_index = $this->input->post('order')[0]['column'] ?? 0;
        $order_dir = $this->input->post('order')[0]['dir'] ?? 'desc';
        
        // Column mapping (0=product, 1=reviewer, 2=rating, 3=comment, 4=status, 5=date, 6=action)
        $columns = ['p.name', 'r.reviewer_name', 'r.rating', 'r.comment', 'r.status', 'r.added_date'];
        $order_column = $columns[$order_column_index] ?? 'r.added_date';
        
        // Filtering parameters from request
        $product_filter = $this->input->post('product_filter');
        $rating_filter = $this->input->post('rating_filter');
        $status_filter = $this->input->post('status_filter');

        $params = [
            'start' => $start,
            'length' => $length,
            'search' => $search_value,
            'order_column' => $order_column,
            'order_dir' => $order_dir,
            'product_filter' => $product_filter,
            'rating_filter' => $rating_filter,
            'status_filter' => $status_filter
        ];
        
        $reviews = $this->Reviews_model->get_reviews_datatable($params);
        $total_records = $this->Reviews_model->get_reviews_count();
        $filtered_records = $this->Reviews_model->get_reviews_count($params);
        
        $data = [];
        foreach ($reviews as $review) {
            $data[] = [
                'review_id' => $review['review_id'],
                'product_name' => $review['product_name'],
                'reviewer_name' => $review['reviewer_name'],
                'email' => $review['email'],
                'rating' => $review['rating'],
                'comment' => $review['comment'],
                'status' => $review['status'],
                'added_date' => date('d M Y, H:i', strtotime($review['added_date']))
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

    /**
     * Update review status (Approve/Reject)
     */
    public function update_review_status() {
        $review_id = $this->input->post('review_id');
        $status = $this->input->post('status');

        if (!$review_id || !in_array($status, ['Approved', 'Rejected'])) {
            echo json_encode(['success' => 0, 'msg' => 'Invalid parameters.']);
            return;
        }

        if ($this->Reviews_model->update_status($review_id, $status)) {
            echo json_encode(['success' => 1, 'msg' => "Review $status successfully."]);
        } else {
            echo json_encode(['success' => 0, 'msg' => 'Failed to update status.']);
        }
    }

    /**
     * Soft delete review
     */
    public function delete_review() {
        $review_id = $this->input->post('review_id');

        if (!$review_id) {
            echo json_encode(['success' => 0, 'msg' => 'Invalid request.']);
            return;
        }

        if ($this->Reviews_model->delete_review($review_id)) {
            echo json_encode(['success' => 1, 'msg' => 'Review deleted successfully.']);
        } else {
            echo json_encode(['success' => 0, 'msg' => 'Failed to delete review.']);
        }
    }


}
