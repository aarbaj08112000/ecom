<div id="menu_overlay" class="menu_overlay home-page-boxes <%if $sitemap%>open site-map-contain<%/if%>">
    <style>
        .quick-menu-overlay {
            background-color: #f8fafb;
            color: #5d596c;
            font-family: 'Public Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
        }
        .quick-menu-header {
            background: #fff;
            padding: 1.5rem 2.5rem;
            border-bottom: 1px solid #dbdade;
            position: sticky;
            top: 0;
            z-index: 10;
        }
        .quick-menu-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: #444050;
            margin: 0;
            display: flex;
            align-items: center;
        }
        .quick-menu-title i {
            font-size: 1.75rem;
            margin-right: 0.75rem;
            color: #7367f0;
        }
        .quick-menu-section-card {
            border: 1px solid #dbdade;
            border-radius: 0.5rem;
            background: #fff;
            height: 100%;
            transition: all 0.2s ease-in-out;
            box-shadow: 0 2px 4px rgba(165, 163, 174, 0.1);
        }
        .quick-menu-section-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 0.5rem 1rem rgba(165, 163, 174, 0.15);
            border-color: #7367f0;
        }
        .quick-menu-section-header {
            padding: 1rem 1.25rem;
            border-bottom: 1px solid #dbdade;
            display: flex;
            align-items: center;
            background: rgba(115, 103, 240, 0.05);
            border-top-left-radius: 0.5rem;
            border-top-right-radius: 0.5rem;
        }
        .quick-menu-section-header h5 {
            margin: 0;
            font-weight: 600;
            font-size: 1rem;
            color: #444050;
        }
        .quick-menu-section-header i {
            font-size: 1.25rem;
            margin-right: 0.5rem;
            color: #7367f0;
        }
        .quick-menu-list {
            list-style: none;
            padding: 0.75rem 0;
            margin: 0;
        }
        .quick-menu-link {
            display: flex;
            align-items: center;
            padding: 0.5rem 1.25rem;
            color: #5d596c;
            text-decoration: none;
            transition: all 0.2s;
            font-size: 0.9375rem;
        }
        .quick-menu-link:hover {
            background-color: rgba(115, 103, 240, 0.08);
            color: #7367f0;
            padding-left: 1.5rem;
        }
        .quick-menu-link i {
            font-size: 1.125rem;
            margin-right: 0.75rem;
            width: 20px;
            text-align: center;
        }
        .close-quick-menu {
            cursor: pointer;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            transition: background 0.2s;
            color: #a1acb8;
        }
        .close-quick-menu:hover {
            background: rgba(161, 172, 184, 0.1);
            color: #5d596c;
        }
        .quick-menu-grid {
            padding: 2.5rem;
        }
    </style>

    <div class="quick-menu-overlay">
        <div class="quick-menu-header">
            <div class="d-flex justify-content-between align-items-center">
                <h3 class="quick-menu-title">
                    <i class="ti ti-layout-grid-add"></i>
                    Admin Quick Menu
                </h3>
                <div class="d-flex align-items-center">
                    <a href="dashboard" class="btn btn-primary ">
                        <i class="ti ti-home me-1"></i> Dashboard
                    </a>
                    <div class="close-quick-menu quick-menu-bar hide ms-3">
                        <i class="ti ti-x fs-2"></i>
                    </div>
                </div>
            </div>
        </div>

        <div id="scrollable_content" class="scrollable-content">
            <div class="quick-menu-grid container-fluid">
                <div class="row g-4">
                    <!-- Dashboard & Analytics -->
                    <div class="col-xl-3 col-lg-4 col-md-6">
                        <div class="quick-menu-section-card">
                            <div class="quick-menu-section-header">
                                <i class="ti ti-chart-pie"></i>
                                <h5>Dashboards</h5>
                            </div>
                            <ul class="quick-menu-list">
                                <li><a href="dashboard" class="quick-menu-link"><i class="ti ti-smart-home"></i> Main Analytics</a></li>
                                <li><a href="sales_dashboard" class="quick-menu-link"><i class="ti ti-trending-up"></i> Sales Dashboard</a></li>
                                <li><a href="product_dashboard" class="quick-menu-link"><i class="ti ti-package-import"></i> Product Dashboard</a></li>
                            </ul>
                        </div>
                    </div>

                    <!-- Products -->
                    <div class="col-xl-3 col-lg-4 col-md-6">
                        <div class="quick-menu-section-card">
                            <div class="quick-menu-section-header">
                                <i class="ti ti-brand-producthunt"></i>
                                <h5>Product Catalog</h5>
                            </div>
                            <ul class="quick-menu-list">
                                <li><a href="product_list" class="quick-menu-link"><i class="ti ti-box"></i> Manage Products</a></li>
                                <li><a href="categories" class="quick-menu-link"><i class="ti ti-category"></i> Categories</a></li>
                                <li><a href="brands" class="quick-menu-link"><i class="ti ti-award"></i> Brands</a></li>
                                <li><a href="attributes" class="quick-menu-link"><i class="ti ti-list-details"></i> Attributes</a></li>
                                <li><a href="reviews" class="quick-menu-link"><i class="ti ti-star"></i> Reviews & Ratings</a></li>
                            </ul>
                        </div>
                    </div>

                    <!-- Sales & Orders -->
                    <div class="col-xl-3 col-lg-4 col-md-6">
                        <div class="quick-menu-section-card">
                            <div class="quick-menu-section-header">
                                <i class="ti ti-shopping-cart"></i>
                                <h5>Orders & Sales</h5>
                            </div>
                            <ul class="quick-menu-list">
                                <li><a href="orders" class="quick-menu-link"><i class="ti ti-receipt"></i> Orders List</a></li>
                                <li><a href="transactions" class="quick-menu-link"><i class="ti ti-coin"></i> Transactions</a></li>
                                <li><a href="refunds" class="quick-menu-link"><i class="ti ti-refresh-dot"></i> Refunds</a></li>
                                <li><a href="coupons" class="quick-menu-link"><i class="ti ti-tag"></i> Coupons & Discounts</a></li>
                            </ul>
                        </div>
                    </div>

                    <!-- Customers -->
                    <div class="col-xl-3 col-lg-4 col-md-6">
                        <div class="quick-menu-section-card">
                            <div class="quick-menu-section-header">
                                <i class="ti ti-users"></i>
                                <h5>Customer Management</h5>
                            </div>
                            <ul class="quick-menu-list">
                                <li><a href="customer_list" class="quick-menu-link"><i class="ti ti-users-group"></i> Customer List</a></li>
                                <li><a href="customer_reviews" class="quick-menu-link"><i class="ti ti-message-star"></i> Customer Reviews</a></li>
                                <li><a href="wishlist_list" class="quick-menu-link"><i class="ti ti-heart"></i> Wishlist Management</a></li>
                            </ul>
                        </div>
                    </div>

                    <!-- Shipping -->
                    <div class="col-xl-3 col-lg-4 col-md-6">
                        <div class="quick-menu-section-card">
                            <div class="quick-menu-section-header">
                                <i class="ti ti-truck"></i>
                                <h5>Shipping & Logistics</h5>
                            </div>
                            <ul class="quick-menu-list">
                                <li><a href="shipping_methods" class="quick-menu-link"><i class="ti ti-settings-automation"></i> Shipping Methods</a></li>
                                <li><a href="delivery_partners" class="quick-menu-link"><i class="ti ti-truck-delivery"></i> Delivery Partners</a></li>
                                <li><a href="order_tracking" class="quick-menu-link"><i class="ti ti-map-pin"></i> Order Tracking</a></li>
                            </ul>
                        </div>
                    </div>

                    <!-- Content (CMS) -->
                    <div class="col-xl-3 col-lg-4 col-md-6">
                        <div class="quick-menu-section-card">
                            <div class="quick-menu-section-header">
                                <i class="ti ti-file-text"></i>
                                <h5>Content Management</h5>
                            </div>
                            <ul class="quick-menu-list">
                                <li><a href="banner" class="quick-menu-link"><i class="ti ti-photo"></i> Banners & Sliders</a></li>
                                <li><a href="blog" class="quick-menu-link"><i class="ti ti-news"></i> Blog Management</a></li>
                                <li><a href="gallery" class="quick-menu-link"><i class="ti ti-layout-grid"></i> Gallery Master</a></li>
                                <li><a href="faq" class="quick-menu-link"><i class="ti ti-help-circle"></i> FAQ Management</a></li>
                                <li><a href="testimonials" class="quick-menu-link"><i class="ti ti-quote"></i> Testimonials</a></li>
                                <li><a href="contact_us" class="quick-menu-link"><i class="ti ti-address-book"></i> Contact Leads</a></li>
                            </ul>
                        </div>
                    </div>

                    <!-- Marketing & Reports -->
                    <div class="col-xl-3 col-lg-4 col-md-6">
                        <div class="quick-menu-section-card">
                            <div class="quick-menu-section-header">
                                <i class="ti ti-report-analytics"></i>
                                <h5>Reports & Marketing</h5>
                            </div>
                            <ul class="quick-menu-list">
                                <li><a href="sales_report" class="quick-menu-link"><i class="ti ti-report-money"></i> Sales Reports</a></li>
                                <li><a href="traffic_analytics" class="quick-menu-link"><i class="ti ti-chart-line"></i> Traffic Analytics</a></li>
                                <li><a href="low_stock_report" class="quick-menu-link"><i class="ti ti-alert-triangle"></i> Low Stock Alerts</a></li>
                                <li><a href="email_marketing" class="quick-menu-link"><i class="ti ti-mail"></i> Email Marketing</a></li>
                            </ul>
                        </div>
                    </div>

                    <!-- System & Settings -->
                    <div class="col-xl-3 col-lg-4 col-md-6">
                        <div class="quick-menu-section-card">
                            <div class="quick-menu-section-header">
                                <i class="ti ti-settings"></i>
                                <h5>System Settings</h5>
                            </div>
                            <ul class="quick-menu-list">
                                <li><a href="user_list" class="quick-menu-link"><i class="ti ti-user-shield"></i> User Management</a></li>
                                <li><a href="group_master" class="quick-menu-link"><i class="ti ti-lock-access"></i> Roles & Groups</a></li>
                                <li><a href="general_settings" class="quick-menu-link"><i class="ti ti-settings-cog"></i> General Settings</a></li>
                                <li><a href="change_password" class="quick-menu-link"><i class="ti ti-key"></i> Reset Password</a></li>
                                <li><a href="secure_admin/logout" class="quick-menu-link text-danger"><i class="ti ti-logout"></i> Sign Out</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>