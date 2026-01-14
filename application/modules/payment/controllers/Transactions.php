<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Transactions extends MY_Controller {
	public function __construct() {
        parent::__construct();
        $this->load->model('Transactions_model');
    }
	public function index() {
		$this->transactions();
	}

	public function transactions() {
		$data['base_url'] = base_url();
		$this->smarty->loadView('transactions.tpl', $data, 'Yes', 'Yes');
	}

	/**
	 * AJAX handler for Transactions DataTable
	 */
	public function get_transactions_ajax() {
		$params = [
			'draw' => intval($this->input->post('draw')),
			'start' => intval($this->input->post('start')),
			'length' => intval($this->input->post('length')),
			'search' => $this->input->post('search')['value'],
			'order_column' => $this->input->post('columns')[$this->input->post('order')[0]['column']]['data'],
			'order_dir' => $this->input->post('order')[0]['dir']
		];

		$transactions = $this->Transactions_model->get_transactions_datatable($params);
		$total_records = $this->Transactions_model->get_total_transactions();
		$filtered_records = $this->Transactions_model->get_filtered_transactions($params);

		$data = [];
		foreach ($transactions as $t) {
			$data[] = [
				'payment_id' => $t['payment_id'],
				'transaction_id' => $t['transaction_id'] ?: 'N/A',
				'customer_name' => $t['customer_name'] ?: 'Guest',
				'amount' => '₹' . number_format($t['amount'], 2),
				'payment_method' => ucfirst(str_replace('_', ' ', $t['payment_method'])),
				'paid_date' => $t['added_date'] ? date('d M Y, h:i A', strtotime($t['added_date'])) : 'Pending',
				'payment_status' => $t['payment_status'],
				'action' => '
					<a href="' . base_url('orders/order_details?id=' . $t['order_id']) . '" class="text-center" title="View Order">
						<i class="ti ti-eye"></i>
					</a>'
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

