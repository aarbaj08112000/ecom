<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Refunds extends MY_Controller {
	public function __construct() {
        parent::__construct();
        $this->load->model('Refunds_model');
    }
	public function index() {
		$this->refunds();
	}

	public function refunds() {
		$data['base_url'] = base_url();
		$this->smarty->loadView('refunds.tpl', $data, 'Yes', 'Yes');
	}

	/**
	 * AJAX handler for Refunds DataTable
	 */
	public function get_refunds_ajax() {
		$params = [
			'draw' => intval($this->input->post('draw')),
			'start' => intval($this->input->post('start')),
			'length' => intval($this->input->post('length')),
			'search' => $this->input->post('search')['value'],
			'order_column' => $this->input->post('columns')[$this->input->post('order')[0]['column']]['data'],
			'order_dir' => $this->input->post('order')[0]['dir']
		];

		$refunds = $this->Refunds_model->get_refunds_datatable($params);
		$total_records = $this->Refunds_model->get_total_refunds();
		$filtered_records = $this->Refunds_model->get_filtered_refunds($params);

		$data = [];
		foreach ($refunds as $r) {
			$data[] = [
				'id' => $r['id'],
				'gateway_refund_id' => $r['gateway_refund_id'] ?: 'N/A',
				'customer_name' => $r['customer_name'] ?: 'Guest',
				'refund_amount' => '₹' . number_format($r['refund_amount'], 2),
				'added_date' => $r['added_date'] ? date('d M Y, h:i A', strtotime($r['added_date'])) : 'N/A',
				'refund_status' => $r['refund_status'],
				'action' => '
					<div class="d-flex gap-2 justify-content-center">
						<a href="' . base_url('orders/order_details?id=' . urlencode(base64_encode($r['order_id']))) . '" class="btn btn-sm btn-icon btn-label-primary" title="View Order">
							<i class="ti ti-eye"></i>
						</a>
						<button type="button" class="btn btn-sm btn-icon btn-label-success approve-refund" data-id="' . $r['id'] . '" title="Approve">
							<i class="ti ti-check"></i>
						</button>
						<button type="button" class="btn btn-sm btn-icon btn-label-danger reject-refund" data-id="' . $r['id'] . '" title="Reject">
							<i class="ti ti-x"></i>
						</button>
					</div>'
			];
		}

		echo json_encode([
			"draw" => $params['draw'],
			"recordsTotal" => $total_records,
			"recordsFiltered" => $filtered_records,
			"data" => $data
		]);
	}
}

