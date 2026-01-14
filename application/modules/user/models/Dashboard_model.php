<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    // Get total revenue from orders
    public function get_total_revenue() {
        $this->db->select_sum('total_amount');
        $query = $this->db->get('orders');
        $result = $query->row();
        return $result->total_amount ? $result->total_amount : 0;
    }

    // Get total orders count
    public function get_total_orders() {
        return $this->db->count_all('orders');
    }

    // Get total customers count
    public function get_total_customers() {
        return $this->db->count_all('customer_master');
    }

    // Get conversion rate (orders / customers * 100)
    public function get_conversion_rate() {
        $total_customers = $this->get_total_customers();
        $total_orders = $this->get_total_orders();
        
        if ($total_customers > 0) {
            return round(($total_orders / $total_customers) * 100, 2);
        }
        return 0;
    }

    // Get monthly revenue for chart (last 12 months)
    public function get_monthly_revenue() {
        $twelve_months_ago = date('Y-m-d', strtotime('-12 months'));
        $sql = "SELECT DATE_FORMAT(added_date, '%b') as month, 
                       SUM(total_amount) as revenue 
                FROM orders 
                WHERE added_date >= ? 
                GROUP BY DATE_FORMAT(added_date, '%Y-%m')
                ORDER BY DATE_FORMAT(added_date, '%Y-%m') ASC";
        $query = $this->db->query($sql, array($twelve_months_ago));
        return $query->result_array();
    }

    // Get order sources distribution
    public function get_order_sources() {
        $this->db->select('payment_method as order_source, COUNT(*) as count');
        $this->db->group_by('payment_method');
        $query = $this->db->get('orders');
        return $query->result_array();
    }

    // Get recent orders with customer details
    public function get_recent_orders($limit = 4) {
        $this->db->select('o.order_id, o.total_amount, o.added_date as order_date, o.payment_status, c.customer_name, c.email');
        $this->db->from('orders o');
        $this->db->join('customer_master c', 'c.id = o.user_id', 'left');
        $this->db->order_by('o.added_date', 'DESC');
        $this->db->limit($limit);
        $query = $this->db->get();
        return $query->result_array();
    }

    // Get latest activity (recent orders, low stock alerts, new customers)
    public function get_latest_activity($limit = 3) {
        $activities = [];
        
        // Recent orders
        $this->db->select('order_id, added_date');
        $this->db->order_by('added_date', 'DESC');
        $this->db->limit($limit);
        $recent_orders = $this->db->get('orders')->result_array();
        
        foreach ($recent_orders as $order) {
            $activities[] = [
                'type' => 'order',
                'title' => 'New Order #' . $order['order_id'],
                'time' => $this->time_elapsed_string($order['added_date']),
                'timestamp' => strtotime($order['added_date']),
                'icon' => 'ti-shopping-cart',
                'color' => 'primary'
            ];
        }
        
        // Recent customers
        $this->db->select('customer_name, added_date');
        $this->db->order_by('added_date', 'DESC');
        $this->db->limit($limit);
        $recent_customers = $this->db->get('customer_master')->result_array();
        
        foreach ($recent_customers as $customer) {
            $activities[] = [
                'type' => 'customer',
                'title' => 'New Customer: ' . $customer['customer_name'],
                'time' => $this->time_elapsed_string($customer['added_date']),
                'timestamp' => strtotime($customer['added_date']),
                'icon' => 'ti-user-check',
                'color' => 'success'
            ];
        }
        
        // Sort by timestamp (most recent first)
        usort($activities, function($a, $b) {
            return $b['timestamp'] - $a['timestamp'];
        });
        
        // Return only the requested limit
        return array_slice($activities, 0, $limit);
    }

    // Helper function to calculate time elapsed
    private function time_elapsed_string($datetime) {
        $now = new DateTime;
        $ago = new DateTime($datetime);
        $diff = $now->diff($ago);

        if ($diff->d > 0) {
            return $diff->d . ' day' . ($diff->d > 1 ? 's' : '') . ' ago';
        } elseif ($diff->h > 0) {
            return $diff->h . ' hour' . ($diff->h > 1 ? 's' : '') . ' ago';
        } elseif ($diff->i > 0) {
            return $diff->i . ' minute' . ($diff->i > 1 ? 's' : '') . ' ago';
        } else {
            return 'Just now';
        }
    }

    // ==================== SALES DASHBOARD METHODS ====================
    
    // Get average order value
    public function get_average_order_value() {
        $total_revenue = $this->get_total_revenue();
        $total_orders = $this->get_total_orders();
        
        if ($total_orders > 0) {
            return round($total_revenue / $total_orders, 2);
        }
        return 0;
    }

    // Get returns/cancelled orders count
    public function get_returns_count() {
        $this->db->where_in('order_status', array('cancelled', 'returned'));
        return $this->db->count_all_results('orders');
    }

    // Get monthly sales for chart (same as revenue but returns both labels and values)
    public function get_monthly_sales() {
        return $this->get_monthly_revenue();
    }

    // Get sales by category for pie chart
    public function get_sales_by_category() {
        $sql = "SELECT c.category_name, SUM(oi.final_price) as total_sales
                FROM order_items oi
                JOIN products p ON p.id = oi.product_id
                JOIN categories c ON c.category_id = p.category_id
                GROUP BY c.category_id, c.category_name
                ORDER BY total_sales DESC";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    // Get top selling products
    public function get_top_selling_products($limit = 4) {
        $sql = "SELECT p.name as product_name, c.category_name, 
                       COUNT(oi.order_item_id) as units_sold,
                       SUM(oi.final_price) as total_revenue
                FROM order_items oi
                JOIN products p ON p.id = oi.product_id
                LEFT JOIN categories c ON c.category_id = p.category_id
                GROUP BY p.id, p.name, c.category_name
                ORDER BY total_revenue DESC
                LIMIT ?";
        $query = $this->db->query($sql, array($limit));
        return $query->result_array();
    }

    // Get payment methods breakdown
    public function get_payment_methods_breakdown() {
        $sql = "SELECT payment_method, 
                       COUNT(*) as count,
                       ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders)), 1) as percentage
                FROM orders
                WHERE payment_method IS NOT NULL
                GROUP BY payment_method
                ORDER BY count DESC";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    // Get recent sales orders
    public function get_recent_sales_orders($limit = 5) {
        return $this->get_recent_orders($limit);
    }

    // ==================== PRODUCT DASHBOARD METHODS ====================

    // Get total products (non-deleted)
    public function get_total_products_count() {
        $this->db->where('is_delete', '0');
        return $this->db->count_all_results('products');
    }

    // Get active products
    public function get_active_products_count() {
        $this->db->where('is_delete', '0');
        $this->db->where('status', 'Active');
        return $this->db->count_all_results('products');
    }

    // Get low stock products count (<= 10)
    public function get_low_stock_products_count($threshold = 10) {
        $this->db->where('is_delete', '0');
        $this->db->where('stock_quantity <=', $threshold);
        $this->db->where('stock_quantity >', 0);
        return $this->db->count_all_results('products');
    }

    // Get out of stock products count
    public function get_out_of_stock_products_count() {
        $this->db->where('is_delete', '0');
        $this->db->where('stock_quantity', 0);
        return $this->db->count_all_results('products');
    }

    // Get product trend data (units sold per month)
    public function get_product_trend_data() {
        $twelve_months_ago = date('Y-m-d', strtotime('-12 months'));
        $sql = "SELECT DATE_FORMAT(o.added_date, '%b') as month, 
                       SUM(oi.quantity) as units_sold 
                FROM order_items oi
                JOIN orders o ON o.order_id = oi.order_id
                WHERE o.added_date >= ? 
                GROUP BY DATE_FORMAT(o.added_date, '%Y-%m')
                ORDER BY DATE_FORMAT(o.added_date, '%Y-%m') ASC";
        $query = $this->db->query($sql, array($twelve_months_ago));
        return $query->result_array();
    }

    // Get inventory by category
    public function get_inventory_by_category() {
        $sql = "SELECT c.category_name, COUNT(p.id) as product_count
                FROM categories c
                LEFT JOIN products p ON p.category_id = c.category_id AND p.is_delete = '0'
                WHERE c.is_delete = '0' AND c.status = 'Active'
                GROUP BY c.category_id, c.category_name
                ORDER BY product_count DESC";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    // Get recently added products
    public function get_recent_products($limit = 3) {
        $this->db->select('p.id, p.name, p.added_date, pi.image_path as cover_image');
        $this->db->from('products p');
        $this->db->join('product_images pi', 'pi.product_id = p.id AND pi.is_cover = "1"', 'left');
        $this->db->where('p.is_delete', '0');
        $this->db->order_by('p.added_date', 'DESC');
        $this->db->limit($limit);
        $query = $this->db->get();
        return $query->result_array();
    }
}
