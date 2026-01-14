<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Report extends MY_Controller {
	public function __construct() {
        parent::__construct();
        $this->load->model('Report_model');
        // Manually set template dir to avoid issues with regex routes in MY_Controller
        $this->smarty->setTemplateDir(APPPATH . 'modules/report/views/');
    }
	public function index() {
		$data['base_url'] = base_url();
		$this->smarty->loadView('login.tpl',$data,'No','No');
	}
	/* add update user module */
	
	public function sales_report()
{
    $data['base_url'] = base_url();
    $data['sales_list'] = []; // Initialized as empty for DataTable
    $this->smarty->loadView('sales_report.tpl', $data, 'Yes', 'Yes');
}

public function get_sales_report_ajax() {
    $params = [
        'draw' => intval($this->input->post('draw')),
        'start' => intval($this->input->post('start')),
        'length' => intval($this->input->post('length')),
        'search' => $this->input->post('search')['value'],
        'order_column' => $this->input->post('columns')[$this->input->post('order')[0]['column']]['data'],
        'order_dir' => $this->input->post('order')[0]['dir']
    ];

    $sales_data = $this->Report_model->get_sales_report_datatable($params);
    $total_records = $this->Report_model->get_total_sales_report_count();
    $filtered_records = $this->Report_model->get_filtered_sales_report_count($params);

    $response = [
        "draw" => $params['draw'],
        "recordsTotal" => $total_records,
        "recordsFiltered" => $filtered_records,
        "data" => $sales_data
    ];

    echo json_encode($response);
}


	public function sales_view()
{
    $order_id = $this->input->get('id');

    if (!$order_id) {
        redirect('sales_report');
    }

    $order_details = $this->Report_model->get_order_details($order_id);
    if (!$order_details) {
        redirect('sales_report');
    }

    $order_items = $this->Report_model->get_order_items_details($order_id);
    $payment_details = $this->Report_model->get_order_payment_details($order_id);

    // Prepare data for view
    $data['sale'] = [
        'id' => $order_details['order_id'],
        'invoice_no' => $order_details['order_id'],
        'date' => date('d-m-Y', strtotime($order_details['added_date'])),
        'customer_name' => $order_details['customer_name'],
        'customer_mobile' => $order_details['customer_mobile'],
        'customer_email' => $order_details['customer_email'],
        'status' => ucfirst($order_details['payment_status']),
        'total_amount' => $order_details['total_amount'],
        'net_amount' => $order_details['net_amount'],
        'paid_amount' => isset($payment_details['amount']) ? $payment_details['amount'] : 0, 
        'pending_amount' => $order_details['net_amount'] - (isset($payment_details['amount']) ? $payment_details['amount'] : 0),
        'payment_mode' => isset($payment_details['payment_method']) ? $payment_details['payment_method'] : $order_details['payment_method'],
        'transaction_id' => isset($payment_details['transaction_id']) ? $payment_details['transaction_id'] : '-',
        'payment_date' => isset($payment_details['paid_date']) ? date('d-m-Y', strtotime($payment_details['paid_date'])) : '-',
        'remarks' => $order_details['order_status'], 
        'products' => []
    ];

    foreach ($order_items as $item) {
        $data['sale']['products'][] = [
            'name' => $item['product_name_at_order'],
            'category' => $item['category_name'],
            'qty' => $item['quantity'],
            'rate' => $item['price'],
            'total' => $item['final_price']
        ];
    }

    $data['base_url'] = base_url();
    $this->smarty->loadView('sales_view.tpl', $data, 'Yes', 'Yes');
}

    public function product_performance_report()
	{
        $data['base_url'] = base_url();
        $data['products'] = []; // Handled by DataTable
		$this->smarty->loadView('product_performance_report.tpl', $data,'Yes','Yes');
	}

    public function get_product_performance_ajax() {
        $params = [
            'draw' => intval($this->input->post('draw')),
            'start' => intval($this->input->post('start')),
            'length' => intval($this->input->post('length')),
            'search' => $this->input->post('search')['value'],
            'order_column' => $this->input->post('columns')[$this->input->post('order')[0]['column']]['data'],
            'order_dir' => $this->input->post('order')[0]['dir']
        ];

        $performance_data = $this->Report_model->get_product_performance_datatable($params);
        $total_records = $this->Report_model->get_total_products_count();
        $filtered_records = $this->Report_model->get_filtered_products_count($params);

        $response = [
            "draw" => $params['draw'],
            "recordsTotal" => $total_records,
            "recordsFiltered" => $filtered_records,
            "data" => $performance_data
        ];

        echo json_encode($response);
    }

    public function product_performance_details() {
        $id = $this->input->get('id');
        if (!$id) {
            redirect('product_performance_report');
        }

        $product_info = $this->Report_model->get_product_info($id);
        if (!$product_info) {
            redirect('product_performance_report');
        }

        $stats = $this->Report_model->get_product_stats($id);
        $history = $this->Report_model->get_product_sales_history($id);

        $data['product'] = $product_info;
        $data['stats'] = $stats;
        $data['history'] = $history;
        $data['base_url'] = base_url();

        $this->smarty->loadView('product_performance_details.tpl', $data, 'Yes', 'Yes');
    }

    public function low_stock_report()
    {
        $data['base_url'] = base_url();
        $this->smarty->loadView('low_stock_report.tpl', $data, 'Yes', 'Yes');
    }

    public function get_low_stock_ajax() {
        $params = [
            'draw' => intval($this->input->post('draw')),
            'start' => intval($this->input->post('start')),
            'length' => intval($this->input->post('length')),
            'search' => $this->input->post('search')['value'],
            'order_column' => $this->input->post('columns')[$this->input->post('order')[0]['column']]['data'],
            'order_dir' => $this->input->post('order')[0]['dir']
        ];

        $low_stock_data = $this->Report_model->get_low_stock_report_datatable($params);
        
        $data = [];
        foreach ($low_stock_data as $row) {
            $image_path = '';
            if (!empty($row['cover_image'])) {
                $image_path = $row['id'] . '/' . $row['cover_image'];
            }
            $row['image'] = $image_path;
            $data[] = $row;
        }

        $total_records = $this->Report_model->get_total_low_stock_count();
        $filtered_records = $this->Report_model->get_filtered_low_stock_count($params);

        $response = [
            "draw" => $params['draw'],
            "recordsTotal" => $total_records,
            "recordsFiltered" => $filtered_records,
            "data" => $data
        ];

        echo json_encode($response);
    }

    /* Traffic Analytics */

    public function traffic_analytics() {
        $data['base_url'] = base_url();
        $data['kpi'] = $this->Report_model->get_traffic_kpis();
        $data['top_pages'] = $this->Report_model->get_top_pages(10);
        $this->smarty->loadView('traffic_analytics.tpl', $data, 'Yes', 'Yes');
    }

    public function get_traffic_chart_data() {
        $daily_traffic = $this->Report_model->get_daily_traffic(30);
        $device_stats = $this->Report_model->get_device_stats();
        
        $response = [
            'success' => 1,
            'daily' => $daily_traffic,
            'devices' => $device_stats
        ];
        
        echo json_encode($response);
    }
}

