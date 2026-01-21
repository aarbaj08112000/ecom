<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Orders extends MY_Controller {
	public function __construct() {
        parent::__construct();
        $this->load->model('Orders_model');
    }
	public function index() {
		$this->orders();
	}

	public function orders() {
		$data['base_url'] = base_url();
		$this->smarty->loadView('orders.tpl', $data, 'Yes', 'Yes');
	}

	/**
	 * AJAX handler for Orders DataTable
	 */
	public function get_orders_ajax() {
		$params = [
			'draw' => intval($this->input->post('draw')),
			'start' => intval($this->input->post('start')),
			'length' => intval($this->input->post('length')),
			'search' => $this->input->post('search')['value'],
			'order_column' => $this->input->post('columns')[$this->input->post('order')[0]['column']]['data'],
			'order_dir' => $this->input->post('order')[0]['dir']
		];

		$orders = $this->Orders_model->get_orders_datatable($params);
		$total_records = $this->Orders_model->get_total_orders();
		$filtered_records = $this->Orders_model->get_filtered_orders($params);

		$data = [];
		foreach ($orders as $order) {
			$data[] = [
				'order_id' => $order['order_id'],
				'customer_name' => $order['customer_name'] ?: 'Guest',
				'total_amount' => '₹' . number_format($order['total_amount'], 2),
				'net_amount' => '₹' . number_format($order['net_amount'], 2),
				'order_status' => $order['order_status'],
				'payment_status' => $order['payment_status'] ?: 'Unpaid',
				'payment_method' => ucfirst(str_replace('_', ' ', $order['payment_method'])),
				'added_date' => date('d M Y, h:i A', strtotime($order['added_date'])),
				'action' => '
					<div class="d-flex gap-2">
						<a href="' . base_url('orders/order_details?id=' . urlencode(base64_encode($order['order_id']))) . '" class="" title="View Details">
							<i class="ti ti-eye"></i>
						</a>
						<a href="javascript:void(0)" class=" update-status" data-id="' . $order['order_id'] . '" data-status="' . $order['order_status'] . '" title="Update Status">
							<i class="ti ti-edit"></i>
						</a>
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

	public function order_details() {
		$order_id = $this->input->get('id');
		if (!$order_id) {
			redirect('orders');
		}

		$order_id = base64_decode($order_id);

		$order = $this->Orders_model->get_order_by_id($order_id);
		if (!$order) {
			redirect('orders');
		}

		$data['order'] = $order;
		$data['items'] = $this->Orders_model->get_order_items($order_id);
		$data['payment'] = $this->Orders_model->get_payment_details($order_id);
		$data['base_url'] = base_url();
		
		// Decode address if JSON
		$data['shipping_address'] = json_decode($order['shipping_address_json'], true);

		$this->smarty->loadView('order_details.tpl', $data, 'Yes', 'Yes');
	}


}

