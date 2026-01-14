<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Dashboard extends MY_Controller {
	public function __construct() {
        parent::__construct();
        $this->load->model('Dashboard_model');
    }
	public function index() {
		$data['base_url'] = base_url();
		$this->smarty->loadView('login.tpl',$data,'No','No');
	}

	public function dashboard(){
		$data['base_url'] = base_url();
		
		// Fetch KPI data
		$data['total_revenue'] = $this->Dashboard_model->get_total_revenue();
		$data['total_orders'] = $this->Dashboard_model->get_total_orders();
		$data['total_customers'] = $this->Dashboard_model->get_total_customers();
		$data['conversion_rate'] = $this->Dashboard_model->get_conversion_rate();
		
		// Fetch chart data
		$monthly_revenue = $this->Dashboard_model->get_monthly_revenue();
		$data['monthly_revenue_json'] = json_encode($monthly_revenue);
		
		$order_sources = $this->Dashboard_model->get_order_sources();
		$data['order_sources_json'] = json_encode($order_sources);
		
		// Fetch recent orders
		$data['recent_orders'] = $this->Dashboard_model->get_recent_orders(4);
		
		// Fetch latest activity
		$data['latest_activity'] = $this->Dashboard_model->get_latest_activity(3);
		
		$this->smarty->loadView('dashboard.tpl',$data,'Yes','Yes');
	}
	public function sales_dashboard(){
		$data['base_url'] = base_url();
		
		// Fetch Sales KPIs
		$data['total_sales'] = $this->Dashboard_model->get_total_revenue();
		$data['total_orders'] = $this->Dashboard_model->get_total_orders();
		$data['avg_order_value'] = $this->Dashboard_model->get_average_order_value();
		$data['returns_count'] = $this->Dashboard_model->get_returns_count();
		
		// Fetch chart data
		$monthly_sales = $this->Dashboard_model->get_monthly_sales();
		$data['monthly_sales_json'] = json_encode($monthly_sales);
		
		$sales_by_category = $this->Dashboard_model->get_sales_by_category();
		$data['sales_by_category_json'] = json_encode($sales_by_category);
		
		// Fetch top selling products
		$data['top_products'] = $this->Dashboard_model->get_top_selling_products(4);
		
		// Fetch payment methods breakdown
		$data['payment_methods'] = $this->Dashboard_model->get_payment_methods_breakdown();
		
		// Fetch recent sales orders
		$data['recent_sales_orders'] = $this->Dashboard_model->get_recent_sales_orders(5);
		
		$this->smarty->loadView('sales_dashboard.tpl',$data,'Yes','Yes');
	}
	public function product_dashboard(){
		$data['base_url'] = base_url();
		
		// Fetch Product KPIs
		$data['total_products'] = $this->Dashboard_model->get_total_products_count();
		$data['active_products'] = $this->Dashboard_model->get_active_products_count();
		$data['low_stock'] = $this->Dashboard_model->get_low_stock_products_count();
		$data['out_of_stock'] = $this->Dashboard_model->get_out_of_stock_products_count();
		
		// Calculate Inventory Health Percentages
		if ($data['total_products'] > 0) {
			$data['low_stock_percentage'] = round(($data['low_stock'] / $data['total_products']) * 100);
			$data['out_of_stock_percentage'] = round(($data['out_of_stock'] / $data['total_products']) * 100);
			$data['healthy_percentage'] = 100 - $data['low_stock_percentage'] - $data['out_of_stock_percentage'];
		} else {
			$data['healthy_percentage'] = 0;
			$data['low_stock_percentage'] = 0;
			$data['out_of_stock_percentage'] = 0;
		}

		// Fetch Chart Data
		$product_trends = $this->Dashboard_model->get_product_trend_data();
		$data['product_trend_json'] = json_encode($product_trends);
		
		$inventory_by_category = $this->Dashboard_model->get_inventory_by_category();
		$data['category_inventory_json'] = json_encode($inventory_by_category);
		
		// Fetch Table Data
		$data['top_selling_products'] = $this->Dashboard_model->get_top_selling_products(3);
		$data['recent_products'] = $this->Dashboard_model->get_recent_products(3);
		
		$this->smarty->loadView('product_dashboard.tpl',$data,'Yes','Yes');
	}
}

