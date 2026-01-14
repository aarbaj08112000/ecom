<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>

<style>
  :root {
    --primary: #4361ee;
    --primary-light: #4895ef;
    --secondary: #3f37c9;
    --success: #4cc9f0;
    --info: #4895ef;
    --warning: #f72585;
    --dark: #0f172a;
    --muted: #64748b;
    --light: #f8fafc;
    --card-bg: #ffffff;
    --glass-border: rgba(255, 255, 255, 0.6);
    --radius-lg: 20px;
    --radius-md: 12px;
    --shadow-soft: 0 10px 40px -10px rgba(0,64,128,0.07);
    --shadow-hover: 0 20px 60px -15px rgba(0,64,128,0.15);
  }

  /* Base & Typography */
  body {
    background-color: #f1f5f9; /* Slate 100 */
    font-family: 'Public Sans', sans-serif;
    color: var(--dark);
  }

  /* Cards with Glassmorphism feel */
  .modern-card {
    background: var(--card-bg);
    border-radius: var(--radius-lg);
    border: 1px solid rgba(255,255,255,0.8);
    box-shadow: var(--shadow-soft);
    padding: 1.5rem;
    position: relative;
    overflow: hidden;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  }
  
  .modern-card:hover {
    transform: translateY(-5px);
    box-shadow: var(--shadow-hover);
  }

  /* Decorative Background Blobs for Cards */
  .modern-card::before {
    content: '';
    position: absolute;
    top: -50%;
    right: -50%;
    width: 200px;
    height: 200px;
    background: radial-gradient(circle, var(--primary-light) 0%, rgba(255,255,255,0) 70%);
    opacity: 0.1;
    border-radius: 50%;
    z-index: 0;
    pointer-events: none;
  }

  .card-header-clean {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1.5rem;
    position: relative;
    z-index: 1;
  }
  
  .card-title-modern {
    font-size: 1.1rem;
    font-weight: 700;
    color: var(--dark);
    margin: 0;
  }

  .card-subtitle {
     font-size: 0.85rem;
     color: var(--muted);
     font-weight: 500;
  }

  /* KPI Value Styling */
  .kpi-value {
    font-size: 1.75rem;
    font-weight: 800;
    color: var(--dark);
    margin-bottom: 0.25rem;
    position: relative;
    z-index: 1;
  }

  .trend-badge {
    padding: 4px 10px;
    border-radius: 30px;
    font-size: 0.75rem;
    font-weight: 600;
    display: inline-flex;
    align-items: center;
    gap: 4px;
  }
  .trend-up { background: rgba(16, 185, 129, 0.1); color: #10b981; }
  .trend-down { background: rgba(239, 68, 68, 0.1); color: #ef4444; }

  /* Icon Box */
  .icon-box {
    width: 48px;
    height: 48px;
    border-radius: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.25rem;
    transition: transform 0.3s ease;
  }
  .modern-card:hover .icon-box {
    transform: scale(1.1) rotate(5deg);
  }

  /* Gradients for Icons */
  .bg-grad-primary { background: linear-gradient(135deg, #4361ee, #4895ef); color: white; box-shadow: 0 4px 12px rgba(67, 97, 238, 0.3); }
  .bg-grad-success { background: linear-gradient(135deg, #10b981, #34d399); color: white; box-shadow: 0 4px 12px rgba(16, 185, 129, 0.3); }
  .bg-grad-warning { background: linear-gradient(135deg, #f72585, #b5179e); color: white; box-shadow: 0 4px 12px rgba(247, 37, 133, 0.3); }
  .bg-grad-info { background: linear-gradient(135deg, #3a0ca3, #4361ee); color: white; box-shadow: 0 4px 12px rgba(58, 12, 163, 0.3); }
  .bg-grad-purple { background: linear-gradient(135deg, #7209b7, #b5179e); color: white; box-shadow: 0 4px 12px rgba(114, 9, 183, 0.3); }

  /* Table Styling */
  .modern-table thead th {
    background-color: #f8fafc;
    color: var(--muted);
    font-weight: 600;
    font-size: 0.8rem;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    border-bottom: 2px solid #e2e8f0;
    padding: 12px 16px;
  }
  .modern-table tbody td {
    padding: 16px;
    vertical-align: middle;
    border-bottom: 1px solid #f1f5f9;
    color: #334155;
    font-size: 0.95rem;
  }
  .modern-table tbody tr:hover {
    background-color: #f8fafc;
  }
  .status-pill {
    padding: 6px 12px;
    border-radius: 30px;
    font-size: 0.8rem;
    font-weight: 600;
  }
  .status-paid { background: rgba(16, 185, 129, 0.1); color: #059669; }
  .status-pending { background: rgba(245, 158, 11, 0.1); color: #d97706; }
  .status-failed { background: rgba(239, 68, 68, 0.1); color: #ef4444; }

  /* Sales Funnel */
  .funnel-step {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: #f8fafc;
    padding: 14px 18px;
    border-radius: 12px;
    margin-bottom: 12px;
    border-left: 4px solid var(--primary);
    transition: transform 0.2s;
  }
  .funnel-step:hover {
      transform: translateX(5px);
      background: white;
      box-shadow: 0 4px 12px rgba(0,0,0,0.05);
  }
  .funnel-step:nth-child(2) { border-color: var(--primary-light); }
  .funnel-step:nth-child(3) { border-color: var(--success); }
  .funnel-step:nth-child(4) { border-color: var(--warning); }
  
  .funnel-label { font-weight: 600; color: var(--dark); font-size: 0.95rem; }
  .funnel-value { font-weight: 700; color: var(--primary); font-size: 1rem; }

  /* Top Selling List */
  .top-product-item {
      padding: 14px 0;
      border-bottom: 1px dashed #e2e8f0;
      display: flex;
      justify-content: space-between;
      align-items: center;
  }
  .top-product-item:last-child { border-bottom: none; }
  
  /* Animations */
  @keyframes fadeInUp {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
  }
  .animate-up { animation: fadeInUp 0.6s ease-out forwards; opacity: 0; }
  .delay-1 { animation-delay: 0.1s; }
  .delay-2 { animation-delay: 0.2s; }
  .delay-3 { animation-delay: 0.3s; }
  .delay-4 { animation-delay: 0.4s; }

  /* Chart Containers */
  .chart-container-wrapper {
      position: relative;
      height: 350px;
      width: 100%;
  }
</style>

<div class="container-fluid py-4">
    
    <!-- Header -->
    <div class="d-flex flex-column flex-md-row align-items-md-center justify-content-between mb-5 animate-up">
        <div>
            <h2 class="fw-bold mb-1">Sales Analytics</h2>
            <p class="text-muted mb-0">Detailed performance report & insights</p>
        </div>
        <div class="d-flex gap-3 mt-3 mt-md-0">
             <a href="dashboard" class="btn btn-outline-primary d-flex align-items-center gap-2 px-4 py-2 rounded-pill">
                <i class="ti ti-layout-dashboard"></i> Overview
            </a>
            <a href="product_dashboard" class="btn btn-primary d-flex align-items-center gap-2 px-4 py-2 rounded-pill shadow-sm">
                <i class="ti ti-box"></i> Products
            </a>
        </div>
    </div>

    <!-- KPI Stats -->
    <div class="row g-4 mb-4">
        <!-- Total Sales -->
        <div class="col-xl-3 col-md-6 animate-up delay-1">
            <div class="modern-card">
                <div class="d-flex justify-content-between">
                    <div>
                        <div class="card-subtitle mb-1">Total Sales</div>
                        <div class="kpi-value">₹<%$total_sales|number_format:0%></div>
                        <div class="trend-badge trend-up">
                            <i class="ti ti-trending-up"></i> --
                        </div>
                    </div>
                    <div class="icon-box bg-grad-primary">
                        <i class="ti ti-currency-rupee"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Orders -->
        <div class="col-xl-3 col-md-6 animate-up delay-2">
            <div class="modern-card">
                <div class="d-flex justify-content-between">
                    <div>
                        <div class="card-subtitle mb-1">Total Orders</div>
                        <div class="kpi-value"><%$total_orders|number_format:0%></div>
                        <div class="trend-badge trend-up">
                            <i class="ti ti-shopping-cart"></i> --
                        </div>
                    </div>
                    <div class="icon-box bg-grad-info">
                        <i class="ti ti-shopping-cart-plus"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Avg Order Value -->
        <div class="col-xl-3 col-md-6 animate-up delay-3">
            <div class="modern-card">
                <div class="d-flex justify-content-between">
                    <div>
                        <div class="card-subtitle mb-1">Avg. Order Value</div>
                        <div class="kpi-value">₹<%$avg_order_value|number_format:0%></div>
                        <div class="trend-badge trend-up">
                           <i class="ti ti-chart-bar"></i> --
                        </div>
                    </div>
                    <div class="icon-box bg-grad-success">
                        <i class="ti ti-chart-line"></i>
                    </div>
                </div>
            </div>
        </div>

         <!-- Returns -->
        <div class="col-xl-3 col-md-6 animate-up delay-4">
            <div class="modern-card">
                <div class="d-flex justify-content-between">
                    <div>
                        <div class="card-subtitle mb-1">Returns</div>
                        <div class="kpi-value"><%$returns_count%></div>
                        <div class="trend-badge trend-down">
                            <i class="ti ti-alert-circle"></i> --
                        </div>
                    </div>
                    <div class="icon-box bg-grad-warning">
                        <i class="ti ti-rotate-clockwise"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Charts Section -->
    <div class="row g-4 mb-4">
        <div class="col-lg-8 animate-up delay-2">
            <div class="modern-card h-100">
                <div class="card-header-clean">
                    <h5 class="card-title-modern">Monthly Sales Trends</h5>
                     <div class="btn-group">
                        <button class="btn btn-sm btn-outline-light text-dark active">Monthly</button>
                        <button class="btn btn-sm btn-outline-light text-dark">Weekly</button>
                    </div>
                </div>
                <div class="chart-container-wrapper">
                    <canvas id="salesTrendsChart"></canvas>
                </div>
            </div>
        </div>
        <div class="col-lg-4 animate-up delay-3">
             <div class="modern-card h-100">
                <div class="card-header-clean">
                    <h5 class="card-title-modern">Sales by Category</h5>
                </div>
                <div class="chart-container-wrapper" style="height: 300px; display: flex; align-items: center; justify-content: center;">
                    <canvas id="categoryChart"></canvas>
                </div>
                 <div class="mt-4 text-center">
                    <small class="text-muted">Top Category: <strong class="text-dark">Electronics (42%)</strong></small>
                </div>
            </div>
        </div>
    </div>

    <!-- Insights Row -->
    <div class="row g-4">
        
        <!-- Top Products -->
        <div class="col-lg-4 animate-up delay-3">
            <div class="modern-card h-100">
                <div class="card-header-clean">
                    <h5 class="card-title-modern">Top Selling Products</h5>
                </div>
                <div>
                    <%if $top_products%>
                        <%foreach from=$top_products item=product%>
                            <div class="top-product-item">
                                <div>
                                    <div class="fw-bold"><%$product.product_name%></div>
                                    <small class="text-muted"><%$product.category_name|default:'Uncategorized'%> · <%$product.units_sold%> Sold</small>
                                </div>
                                <div class="fw-bold text-dark">₹<%$product.total_revenue|number_format:0%></div>
                            </div>
                        <%/foreach%>
                    <%else%>
                        <div class="text-center text-muted py-3">No data available</div>
                    <%/if%>
                </div>
            </div>
        </div>

        <!-- Sales Funnel -->
        <div class="col-lg-4 animate-up delay-4">
             <div class="modern-card h-100">
                <div class="card-header-clean">
                    <h5 class="card-title-modern">Sales Funnel</h5>
                </div>
                <div>
                    <div class="funnel-step">
                        <span class="funnel-label">Total Visits</span>
                        <span class="funnel-value">45,200</span>
                    </div>
                    <div class="funnel-step">
                        <span class="funnel-label">Add to Cart</span>
                        <span class="funnel-value">12,800</span>
                    </div>
                     <div class="funnel-step">
                        <span class="funnel-label">Checkout Started</span>
                        <span class="funnel-value">3,900</span>
                    </div>
                     <div class="funnel-step">
                        <span class="funnel-label">Completed Orders</span>
                        <span class="funnel-value">3,240</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Payment Methods -->
         <div class="col-lg-4 animate-up delay-4">
             <div class="modern-card h-100">
                <div class="card-header-clean">
                    <h5 class="card-title-modern">Payment Methods</h5>
                </div>
                <div>
                    <%if $payment_methods%>
                        <%foreach from=$payment_methods item=method%>
                            <div class="d-flex align-items-center justify-content-between mb-3 p-3 bg-light rounded-3">
                                <div class="d-flex align-items-center gap-3">
                                    <div class="icon-box bg-white text-primary shadow-sm" style="width: 40px; height: 40px; font-size: 1rem;">
                                        <%if $method.payment_method eq 'UPI' or $method.payment_method eq 'Razorpay'%>
                                            <i class="ti ti-brand-google-play"></i>
                                        <%elseif $method.payment_method eq 'Credit Card' or $method.payment_method eq 'Debit Card' or $method.payment_method eq 'PayPal'%>
                                            <i class="ti ti-credit-card"></i>
                                        <%else%>
                                            <i class="ti ti-cash"></i>
                                        <%/if%>
                                    </div>
                                    <div>
                                        <div class="fw-bold"><%$method.payment_method%></div>
                                        <small class="text-muted"><%$method.count%> orders</small>
                                    </div>
                                </div>
                                <div class="fw-bold fs-5"><%$method.percentage%>%</div>
                            </div>
                        <%/foreach%>
                    <%else%>
                        <div class="text-center text-muted py-3">No data available</div>
                    <%/if%>
                </div>
        </div>
    </div>

     <!-- Recent Sales Orders -->
    <div class="row mt-4 animate-up delay-4">
        <div class="col-12">
            <div class="modern-card">
                 <div class="card-header-clean">
                    <h5 class="card-title-modern">Recent Sales Orders</h5>
                     <button class="btn btn-sm btn-light">View All</button>
                </div>
                <div class="table-responsive">
                    <table class="table modern-table table-borderless">
                         <thead>
                            <tr>
                                <th>Invoice</th>
                                <th>Customer</th>
                                <th>Date</th>
                                <th>Amount</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                         <tbody>
                            <%if $recent_sales_orders%>
                                <%foreach from=$recent_sales_orders item=order%>
                                    <tr>
                                        <td class="fw-bold">#<%$order.order_id%></td>
                                        <td><%$order.customer_name|default:'N/A'%></td>
                                        <td><%$order.order_date|date_format:"%b %d, %Y"%></td>
                                        <td class="fw-bold">₹<%$order.total_amount|number_format:0%></td>
                                        <td>
                                            <%if $order.payment_status eq 'Paid'%>
                                                <span class="status-badge status-active">Paid</span>
                                            <%elseif $order.payment_status eq 'Pending'%>
                                                <span class="status-badge status-pending">Pending</span>
                                            <%elseif $order.payment_status eq 'Failed'%>
                                                <span class="status-badge status-blocked">Failed</span>
                                            <%else%>
                                                <span class="status-badge status-processing"><%$order.payment_status%></span>
                                            <%/if%>
                                        </td>
                                    </tr>
                                <%/foreach%>
                            <%else%>
                                <tr>
                                    <td colspan="5" class="text-center text-muted">No recent orders</td>
                                </tr>
                            <%/if%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- CHART JS -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    
    // Parse data from PHP
    const monthlySalesData = <%$monthly_sales_json|default:'[]'%>;
    const salesByCategoryData = <%$sales_by_category_json|default:'[]'%>;
    
    // --- SALES TREND CHART ---
    const ctxTrends = document.getElementById('salesTrendsChart').getContext('2d');
    
    // Prepare chart data
    const monthLabels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    const salesValues = new Array(12).fill(0);
    
    // Map database data to chart
    monthlySalesData.forEach(item => {
        const monthIndex = monthLabels.findIndex(m => m === item.month);
        if (monthIndex !== -1) {
            salesValues[monthIndex] = parseFloat(item.revenue) || 0;
        }
    });
    
    // Gradient
    let valGradient = ctxTrends.createLinearGradient(0, 0, 0, 400);
    valGradient.addColorStop(0, 'rgba(99, 102, 241, 0.35)'); // Indigo
    valGradient.addColorStop(1, 'rgba(99, 102, 241, 0.01)');

    new Chart(ctxTrends, {
        type: 'line',
        data: {
            labels: monthLabels,
            datasets: [{
                label: 'Sales (₹)',
                data: salesValues,
                borderColor: '#6366f1',
                backgroundColor: valGradient,
                borderWidth: 3,
                tension: 0.35,
                fill: true,
                pointBackgroundColor: '#ffffff',
                pointBorderColor: '#6366f1',
                pointRadius: 4,
                pointHoverRadius: 6
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { display: false },
                tooltip: {
                    backgroundColor: '#0f172a',
                    padding: 10,
                    cornerRadius: 8,
                    displayColors: false
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    border: { display: false },
                    grid: { borderDash: [4, 4], color: 'rgba(226, 232, 240, 0.6)' }
                },
                x: {
                    border: { display: false },
                    grid: { display: false }
                }
            }
        }
    });

    // --- CATEGORY CHART ---
    const ctxCategory = document.getElementById('categoryChart').getContext('2d');
    
    // Prepare category chart data
    const categoryLabels = [];
    const categorySales = [];
    const categoryColors = ['#6366f1', '#06b6d4', '#f59e0b', '#ef4444', '#10b981', '#8b5cf6'];
    
    salesByCategoryData.forEach((item, index) => {
        categoryLabels.push(item.category_name || 'Unknown');
        categorySales.push(parseFloat(item.total_sales) || 0);
    });
    
    // If no data, show placeholder
    if (categoryLabels.length === 0) {
        categoryLabels.push('No Data');
        categorySales.push(1);
    }
    
    new Chart(ctxCategory, {
        type: 'doughnut',
        data: {
            labels: categoryLabels,
            datasets: [{
                data: categorySales,
                backgroundColor: categoryColors.slice(0, categoryLabels.length),
                borderWidth: 0,
                hoverOffset: 4
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            cutout: '72%',
             plugins: {
                legend: {
                    position: 'bottom',
                    labels: {
                        usePointStyle: true,
                        padding: 20
                    }
                }
            }
        }
    });

});
</script>
