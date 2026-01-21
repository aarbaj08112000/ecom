<?php
defined('BASEPATH') or exit('No direct script access allowed');

/* Frontend Store Routes */
$route['shop'] = 'frontend/Home/index';
$route['shop/products'] = 'frontend/Product/index';
$route['shop/product/(:num)'] = 'frontend/Product/details/$1';
$route['shop/product/submit_review'] = 'frontend/Product/submit_review';
$route['shop/cart'] = 'frontend/Cart/index';
$route['shop/cart/add'] = 'frontend/Cart/add';
$route['shop/cart/update'] = 'frontend/Cart/update';
$route['shop/cart/remove'] = 'frontend/Cart/remove';
$route['shop/checkout'] = 'frontend/Cart/checkout';
$route['shop/cart/place_order'] = 'frontend/Cart/place_order';
$route['shop/cart/get_shipping_charge'] = 'frontend/Cart/get_shipping_charge';
$route['shop/cart/apply-coupon'] = 'frontend/Cart/apply_coupon';
$route['shop/cart/razorpay_callback'] = 'frontend/Cart/razorpay_callback';
$route['shop/login'] = 'frontend/Auth/login';
$route['shop/login-action'] = 'frontend/Auth/login_action';
$route['shop/register'] = 'frontend/Auth/register';
$route['shop/register-action'] = 'frontend/Auth/register_action';
$route['shop/logout'] = 'frontend/Auth/logout';
$route['shop/save-address'] = 'frontend/Account/save_address';
$route['shop/delete-address'] = 'frontend/Account/delete_address';
$route['shop/get-address/(:num)'] = 'frontend/Account/get_address/$1';
$route['shop/update-settings'] = 'frontend/Account/update_settings';
$route['shop/get-order-details/(:num)'] = 'frontend/Account/get_order_details/$1';
$route['shop/cancel-order'] = 'frontend/Account/cancel_order';
$route['shop/return-order'] = 'frontend/Account/submit_return_request';
$route['shop/forgot-password'] = 'frontend/Auth/forgot_password';
$route['shop/forgot-password-action'] = 'frontend/Auth/forgot_password_action';
$route['shop/dashboard'] = 'frontend/Account/index';
$route['shop/contact'] = 'frontend/Home/contact';
$route['shop/submit-contact'] = 'frontend/Home/submit_contact';
$route['shop/wishlist'] = 'frontend/Wishlist/index';
$route['shop/wishlist/add'] = 'frontend/Wishlist/add';
$route['shop/wishlist/remove'] = 'frontend/Wishlist/remove';

// Support Routes
$route['shop/track-order'] = 'frontend/Support/track_order';
$route['shop/shipping-policy'] = 'frontend/Support/shipping_policy';
$route['shop/returns'] = 'frontend/Support/returns';
$route['shop/faqs'] = 'frontend/Support/faqs';
$route['shop/privacy-policy'] = 'frontend/Support/privacy_policy';
$route['shop/about'] = 'frontend/Home/about';

#------------ Login -----------------------------
$route['default_controller'] = 'frontend/Home/index';
// $route['login'] = 'LogonDashboard/login';
/* login & forgot password */
$route['secure_admin/login'] = 'user/login/index';
$route['secure_admin/signin'] = 'user/login/signin';
$route['secure_admin/reset_password'] = 'user/login/reset_password';
$route['secure_admin'] = 'user/login/index';
$route['change_password'] = 'user/login/change_password';
$route['forgot_password/(:any)/(:any)'] = 'user/login/forgot_password/$1/$2';
$route['secure_admin/logout'] = 'user/login/logout';
$route['logout'] = 'user/login/logout';
$route['page_not_found'] = 'user/login/page_not_found';
$route['inprogress_page'] = 'user/login/inprogress_page';

/* admin */
$route['sitemap'] = 'user/login/site_map';
$route['user_list'] = 'user/user/user_list';
$route['group_master'] = 'user/user/groupMaster';
$route['group_menu'] = 'user/user/groupMenu';

// dashboard

$route['dashboard'] = 'user/dashboard/dashboard';
$route['sales_dashboard'] = 'user/dashboard/sales_dashboard';
$route['product_dashboard'] = 'user/dashboard/product_dashboard';

/* customer */

$route['customer_list'] = 'user/customer/customer_list';
$route['customer_details'] = 'user/customer/customer_details';
$route['customer_details/(:num)'] = 'user/customer/customer_details/$1';
$route['update_customer_status'] = 'user/customer/update_customer_status';
$route['update_customer_profile'] = 'user/customer/update_customer_profile';
$route['customer_edit'] = 'user/customer/customer_edit';
$route['customer_edit/(:num)'] = 'user/customer/customer_edit/$1';
$route['update_full_customer'] = 'user/customer/update_full_customer';
$route['delete_customer'] = 'user/customer/delete_customer';
$route['customer_list_ajax'] = 'user/customer/customer_list_ajax';
$route['customer_reviews'] = 'user/customer_reviews/customer_reviews_list';
$route['get_reviews_ajax'] = 'user/customer_reviews/get_reviews_ajax';
$route['save_customer_review'] = 'user/customer_reviews/save_review';
$route['delete_customer_review'] = 'user/customer_reviews/delete_review';
$route['update_customer_review_status'] = 'user/customer_reviews/update_review_status';
$route['get_review_details'] = 'user/customer_reviews/get_review_details';
$route['wishlist_list'] = 'user/wishlist/wishlist_list';

// Product
$route['product_list'] = 'product/product/product_list';
$route['add_product'] = 'product/product/add_product';
$route['save_product_data'] = 'product/product/save_product_data';
$route['product_details'] = 'product/product/product_details';
//categories
$route['categories'] = 'product/categories/categories';
$route['add_categories'] = 'product/categories/add_categories';
$route['update_categories'] = 'product/categories/update_categories';
$route['delete_category'] = 'product/categories/delete_category';
// brands
$route['brands'] = 'product/brands/brands';
$route['add_brands'] = 'product/brands/add_brands';
$route['update_brands'] = 'product/brands/update_brands';
$route['delete_brands'] = 'product/brands/delete_brands';

//attributes
$route['attributes'] = 'product/attributes/attributes';
$route['add_attributes'] = 'product/attributes/add_attributes';
$route['update_attributes'] = 'product/attributes/update_attributes';
$route['delete_attributes'] = 'product/attributes/delete_attributes';

// Reviews
$route['reviews'] = 'product/reviews/reviews';
$route['reviews_list_ajax'] = 'product/reviews/reviews_list_ajax';
$route['update_review_status'] = 'product/reviews/update_review_status';
$route['delete_review'] = 'product/reviews/delete_review';

// Orders
$route['orders'] = 'orders/orders/orders';
$route['orders/get_orders_ajax'] = 'orders/orders/get_orders_ajax';
$route['order_details'] = 'orders/orders/order_details';

// marketing and promotions
$route['coupons'] = 'marketing_promotions/coupons/coupons';
$route['add_coupons'] = 'marketing_promotions/coupons/add_coupons';
$route['update_coupons'] = 'marketing_promotions/coupons/update_coupons';
$route['delete_coupons'] = 'marketing_promotions/coupons/delete_coupons';

$route['email_marketing'] = 'marketing_promotions/email_marketing/email_marketing';
$route['email_marketing_list'] = 'marketing_promotions/email_marketing/get_campaigns_list';
$route['save_campaign'] = 'marketing_promotions/email_marketing/save_campaign';
$route['get_campaign/(:num)'] = 'marketing_promotions/email_marketing/get_campaign/$1';
$route['delete_campaign'] = 'marketing_promotions/email_marketing/delete_campaign';
$route['export_campaigns'] = 'marketing_promotions/email_marketing/export_campaigns';

/* Shipping Methods Routes */
$route['shipping_methods'] = 'shipping/Shipping/shipping_methods';
$route['save_shipping_method'] = 'shipping/Shipping/save_shipping_method';
$route['get_shipping_method/(:num)'] = 'shipping/Shipping/get_shipping_method/$1';
$route['delete_shipping_method'] = 'shipping/Shipping/delete_shipping_method';

/* Delivery Partners Routes */
$route['delivery_partners'] = 'shipping/Delivery_partners/delivery_partners';
$route['save_delivery_partner'] = 'shipping/Delivery_partners/save_delivery_partner';
$route['get_delivery_partner/(:num)'] = 'shipping/Delivery_partners/get_delivery_partner/$1';
$route['delete_delivery_partner'] = 'shipping/Delivery_partners/delete_delivery_partner';

/* Order Tracking Routes */
$route['order_tracking'] = 'shipping/Order_tracking/order_tracking';
$route['save_order_tracking'] = 'shipping/Order_tracking/save_order_tracking';
$route['get_tracking/(:num)'] = 'shipping/Order_tracking/get_tracking/$1';
$route['delete_order_tracking'] = 'shipping/Order_tracking/delete_order_tracking';

// Payment
$route['transactions'] = 'payment/transactions/transactions';
$route['payment/get_transactions_ajax'] = 'payment/transactions/get_transactions_ajax';
$route['refunds'] = 'payment/refunds/refunds';
$route['payment/get_refunds_ajax'] = 'payment/refunds/get_refunds_ajax';


//content managemnet
$route['banner'] = 'content_managemnet/banner/banner';
$route['add_banner'] = 'content_managemnet/banner/add_banner';
$route['update_banner'] = 'content_managemnet/banner/update_banner';
$route['delete_banners'] = 'content_managemnet/banner/delete_banners';

// gallery
$route['gallery'] = 'content_managemnet/gallery/gallery';
$route['add_gallery'] = 'content_managemnet/gallery/add_gallery';
$route['update_gallery'] = 'content_managemnet/gallery/update_gallery';
$route['delete_gallery'] = 'content_managemnet/gallery/delete_gallery';


$route['blog'] = 'content_managemnet/blog/blog';
$route['add_blog'] = 'content_managemnet/blog/add_blog';
$route['add_blog_data'] = 'content_managemnet/blog/add_blog_data';

$route['faq'] = 'content_managemnet/faq/faq';
$route['add_faq'] = 'content_managemnet/faq/add_faq';
$route['update_faq'] = 'content_managemnet/faq/update_faq';
$route['delete_faq'] = 'content_managemnet/faq/delete_faq';

$route['testimonials'] = 'content_managemnet/testimonials/testimonials';
$route['add_testimonials'] = 'content_managemnet/testimonials/add_testimonials';
$route['update_testimonials'] = 'content_managemnet/testimonials/update_testimonials';
$route['delete_testimonials'] = 'content_managemnet/testimonials/delete_testimonials';

// Contact Us
$route['contact_us'] = 'content_managemnet/contact/index';
$route['update_contact_status'] = 'content_managemnet/contact/update_status';
$route['delete_contact'] = 'content_managemnet/contact/delete_contact';

// reports
$route['sales_report'] = 'report/report/sales_report';
// $route['sales_view/(:any)'] = 'report/report/sales_view/$1';
$route['sales_view'] = 'report/report/sales_view';
$route['product_performance_report'] = 'report/report/product_performance_report';
$route['product_performance_details'] = 'report/report/product_performance_details';
$route['low_stock_report'] = 'report/report/low_stock_report';
$route['traffic_analytics'] = 'report/report/traffic_analytics';

// General Settings
$route['general_settings'] = 'user/Settings/index';
$route['update_setting'] = 'user/Settings/update_setting';
