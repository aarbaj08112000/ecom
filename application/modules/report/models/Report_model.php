<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Report_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }
    public function get_sales_report_datatable($params) {
        $this->db->select('oi.order_item_id as id, o.order_id as invoice_no, cm.customer_name, cm.customer_code, o.added_date as order_date, oi.product_name_at_order as product_name, c.category_name, oi.quantity, oi.price as rate, (oi.quantity * oi.price) as total_amount, oi.discount_amount as discount, oi.tax_amount as tax, oi.final_price as net_amount, o.payment_status, o.order_status');
        $this->db->from('order_items as oi');
        $this->db->join('orders as o', 'o.order_id = oi.order_id', 'left');
        $this->db->join('customer_master as cm', 'cm.id = o.user_id', 'left');
        $this->db->join('products as p', 'p.id = oi.product_id', 'left');
        $this->db->join('categories as c', 'c.category_id = p.category_id', 'left');
        
        // Search
        if (!empty($params['search'])) {
            $this->db->group_start();
            $this->db->like('o.order_id', $params['search']);
            $this->db->or_like('cm.customer_name', $params['search']);
            $this->db->or_like('oi.product_name_at_order', $params['search']);
            $this->db->group_end();
        }
        
        // Order
        if (!empty($params['order_column']) && !empty($params['order_dir'])) {
            $this->db->order_by($params['order_column'], $params['order_dir']);
        } else {
            $this->db->order_by('oi.order_item_id', 'DESC');
        }
        
        // Pagination
        if (isset($params['start']) && isset($params['length'])) {
            $this->db->limit($params['length'], $params['start']);
        }
        
        $result_obj = $this->db->get();
        return is_object($result_obj) ? $result_obj->result_array() : [];
    }

    public function get_total_sales_report_count() {
        return $this->db->count_all('order_items');
    }

    public function get_filtered_sales_report_count($params) {
        $this->db->from('order_items as oi');
        $this->db->join('orders as o', 'o.order_id = oi.order_id', 'left');
        $this->db->join('customer_master as cm', 'cm.id = o.user_id', 'left');
        $this->db->join('products as p', 'p.id = oi.product_id', 'left');
        
        if (!empty($params['search'])) {
            $this->db->group_start();
            $this->db->like('o.order_id', $params['search']);
            $this->db->or_like('cm.customer_name', $params['search']);
            $this->db->or_like('oi.product_name_at_order', $params['search']);
            $this->db->group_end();
        }
        return $this->db->count_all_results();
    }
    public function get_order_details($order_id) {
        $this->db->select('o.*, cm.customer_name, cm.mobile_no as customer_mobile, cm.email as customer_email');
        $this->db->from('orders as o');
        $this->db->join('customer_master as cm', 'cm.id = o.user_id', 'left');
        $this->db->where('o.order_id', $order_id);
        $query = $this->db->get();
        return $query->row_array();
    }

    public function get_order_items_details($order_id) {
        $this->db->select('oi.*, c.category_name');
        $this->db->from('order_items as oi');
        $this->db->join('products as p', 'p.id = oi.product_id', 'left');
        $this->db->join('categories as c', 'c.category_id = p.category_id', 'left');
        $this->db->where('oi.order_id', $order_id);
        $query = $this->db->get();
        return $query->result_array();
    }

    public function get_order_payment_details($order_id) {
        $this->db->select('p.*');
        $this->db->from('payments as p');
        $this->db->where('p.order_id', $order_id);
        $this->db->order_by('p.payment_id', 'DESC');
        $query = $this->db->get();
        return $query->row_array();
    }

    public function get_product_performance_datatable($params) {
        // Optimized to avoid heavy sorting if not needed/possible or just rely on indexes
        // The main issue is ORDER BY qty_sold DESC which is a SUM()
        // We can't easily optimize this without a summary table, but we can index the foreign keys to make the JOINs faster.
        
        $this->db->select('p.id, p.name as product_name, c.category_name, p.status, 
                           IFNULL(COUNT(DISTINCT oi.order_id), 0) as total_orders, 
                           IFNULL(SUM(oi.quantity), 0) as qty_sold, 
                           IFNULL(SUM(oi.final_price), 0.00) as total_revenue,
                           "0" as return_qty, "0.00" as return_percentage');
        $this->db->from('products as p');
        $this->db->join('categories as c', 'c.category_id = p.category_id', 'left');
        $this->db->join('order_items as oi', 'oi.product_id = p.id', 'left');
        $this->db->where('p.is_delete', '0');
        
        $this->db->group_by('p.id');
        
        // Search
        if (!empty($params['search'])) {
            $this->db->group_start();
            $this->db->like('p.name', $params['search']);
            $this->db->or_like('c.category_name', $params['search']);
            $this->db->group_end();
        }
        
        // Order
        // Note: Ordering by calculated fields (total_orders, qty_sold) requires full table scan + filesort.
        // Indexes on p.category_id and oi.product_id will help the JOINs.
        if (!empty($params['order_column']) && !empty($params['order_dir'])) {
            $this->db->order_by($params['order_column'], $params['order_dir']);
        } else {
            $this->db->order_by('qty_sold', 'DESC');
        }
        
        // Pagination
        if (isset($params['start']) && isset($params['length'])) {
            $this->db->limit($params['length'], $params['start']);
        }
        
        $result_obj = $this->db->get();
        return is_object($result_obj) ? $result_obj->result_array() : [];
    }

    public function get_total_products_count() {
        $this->db->where('is_delete', '0');
        return $this->db->count_all_results('products');
    }

    public function get_filtered_products_count($params) {
        $this->db->from('products as p');
        $this->db->join('categories as c', 'c.category_id = p.category_id', 'left');
        $this->db->where('p.is_delete', '0');
        
        if (!empty($params['search'])) {
            $this->db->group_start();
            $this->db->like('p.name', $params['search']);
            $this->db->or_like('c.category_name', $params['search']);
            $this->db->group_end();
        }
        return $this->db->count_all_results();
    }

    public function get_product_info($product_id) {
        $this->db->select('p.*, c.category_name');
        $this->db->from('products as p');
        $this->db->join('categories as c', 'c.category_id = p.category_id', 'left');
        $this->db->where('p.id', $product_id);
        $query = $this->db->get();
        return $query->row_array();
    }

    public function get_product_stats($product_id) {
        $this->db->select('IFNULL(COUNT(DISTINCT oi.order_id), 0) as total_orders, 
                           IFNULL(SUM(oi.quantity), 0) as qty_sold, 
                           IFNULL(SUM(oi.final_price), 0.00) as total_revenue');
        $this->db->from('order_items as oi');
        $this->db->where('oi.product_id', $product_id);
        $query = $this->db->get();
        return $query->row_array();
    }

    public function get_product_sales_history($product_id) {
        $this->db->select('oi.order_id, o.added_date as order_date, cm.customer_name, oi.quantity, oi.price, oi.final_price');
        $this->db->from('order_items as oi');
        $this->db->join('orders as o', 'o.order_id = oi.order_id', 'left');
        $this->db->join('customer_master as cm', 'cm.id = o.user_id', 'left');
        $this->db->where('oi.product_id', $product_id);
        $this->db->order_by('o.added_date', 'DESC');
        $this->db->limit(10); // Last 10 orders
        $query = $this->db->get();
        return $query->result_array();
    }

    public function get_low_stock_report_datatable($params) {
        $this->db->select('p.id, p.name as product_name, c.category_name, p.stock_quantity, p.price, p.status, pi.image_path as cover_image');
        $this->db->from('products as p');
        $this->db->join('categories as c', 'c.category_id = p.category_id', 'left');
        $this->db->join('product_images as pi', 'pi.product_id = p.id AND pi.is_cover = "1" AND pi.is_delete = "0"', 'left');
        $this->db->where('p.is_delete', '0');
        $this->db->where('p.stock_quantity <=', 10);
        $this->db->where('p.stock_quantity >', 0);
        
        // Search
        if (!empty($params['search'])) {
            $this->db->group_start();
            $this->db->like('p.name', $params['search']);
            $this->db->or_like('c.category_name', $params['search']);
            $this->db->group_end();
        }
        
        // Order
        if (!empty($params['order_column']) && !empty($params['order_dir'])) {
            $this->db->order_by($params['order_column'], $params['order_dir']);
        } else {
            $this->db->order_by('p.stock_quantity', 'ASC');
        }
        
        // Pagination
        if (isset($params['start']) && isset($params['length'])) {
            $this->db->limit($params['length'], $params['start']);
        }
        
        $result_obj = $this->db->get();
        return is_object($result_obj) ? $result_obj->result_array() : [];
    }

    public function get_total_low_stock_count() {
        $this->db->where('is_delete', '0');
        $this->db->where('stock_quantity <=', 10);
        $this->db->where('stock_quantity >', 0);
        return $this->db->count_all_results('products');
    }

    public function get_filtered_low_stock_count($params) {
        $this->db->from('products as p');
        $this->db->join('categories as c', 'c.category_id = p.category_id', 'left');
        $this->db->where('p.is_delete', '0');
        $this->db->where('p.stock_quantity <=', 10);
        $this->db->where('p.stock_quantity >', 0);
        
        if (!empty($params['search'])) {
            $this->db->group_start();
            $this->db->like('p.name', $params['search']);
            $this->db->or_like('c.category_name', $params['search']);
            $this->db->group_end();
        }
        return $this->db->count_all_results();
    }

    /* Traffic Analytics Methods */

    public function get_traffic_kpis() {
        $stats = [];
        
        // Total Page Views
        $stats['total_views'] = $this->db->count_all('traffic_logs');
        
        // Unique Visitors (by IP)
        $this->db->select('COUNT(DISTINCT ip_address) as unique_visitors');
        $query = $this->db->get('traffic_logs');
        $stats['unique_visitors'] = $query->row()->unique_visitors;
        
        // Views today
        $this->db->where('DATE(timestamp)', date('Y-m-d'));
        $stats['views_today'] = $this->db->count_all_results('traffic_logs');
        
        // Top Page views
        $this->db->select('request_uri, COUNT(*) as views');
        $this->db->group_by('request_uri');
        $this->db->order_by('views', 'DESC');
        $this->db->limit(1);
        $query = $this->db->get('traffic_logs');
        $stats['top_page'] = $query->row_array();
        
        return $stats;
    }

    public function get_daily_traffic($days = 30) {
        $this->db->select('DATE(timestamp) as date, COUNT(*) as views, COUNT(DISTINCT ip_address) as unique_visitors');
        $this->db->where('timestamp >', date('Y-m-d H:i:s', strtotime("-$days days")));
        $this->db->group_by('DATE(timestamp)');
        $this->db->order_by('DATE(timestamp)', 'ASC');
        $query = $this->db->get('traffic_logs');
        return $query->result_array();
    }

    public function get_top_pages($limit = 10) {
        $this->db->select('request_uri, COUNT(*) as views, COUNT(DISTINCT ip_address) as unique_visitors');
        $this->db->group_by('request_uri');
        $this->db->order_by('views', 'DESC');
        $this->db->limit($limit);
        $query = $this->db->get('traffic_logs');
        return $query->result_array();
    }

    public function get_device_stats() {
        $this->db->select('device_type, COUNT(*) as count');
        $this->db->group_by('device_type');
        $query = $this->db->get('traffic_logs');
        return $query->result_array();
    }
}
