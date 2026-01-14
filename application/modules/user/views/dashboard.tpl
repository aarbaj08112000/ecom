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

  .text-gradient {
    background: linear-gradient(135deg, var(--primary), var(--warning));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
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
  .status-partial { background: rgba(59, 130, 246, 0.1); color: #2563eb; }

  /* Timeline */
  .activity-item {
    display: flex;
    gap: 15px;
    margin-bottom: 20px;
    position: relative;
  }
  .activity-item:last-child { margin-bottom: 0; }
  .activity-item::before {
    content: '';
    position: absolute;
    left: 20px;
    top: 35px;
    bottom: -25px;
    width: 2px;
    background: #f1f5f9;
    z-index: 0;
  }
  .activity-item:last-child::before { display: none; }
  
  .activity-icon {
    width: 42px;
    height: 42px;
    border-radius: 50%;
    background: #fff;
    border: 2px solid #f1f5f9;
    display: flex;
    align-items: center;
    justify-content: center;
    color: var(--primary);
    position: relative;
    z-index: 1;
    font-size: 1.1rem;
    flex-shrink: 0;
  }
  
  .activity-content { flex: 1; }
  .activity-title { font-weight: 600; font-size: 0.95rem; color: var(--dark); margin-bottom: 2px; }
  .activity-time { font-size: 0.8rem; color: var(--muted); }

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

  /* Quick Actions */
  .quick-action-btn {
    display: flex;
    align-items: center;
    gap: 12px;
    background: #f8fafc;
    padding: 12px 16px;
    border-radius: 12px;
    color: var(--dark);
    font-weight: 600;
    transition: all 0.2s;
    border: 1px solid transparent;
    cursor: pointer;
    margin-bottom: 10px;
  }
  .quick-action-btn:hover {
    background: white;
    border-color: var(--primary);
    color: var(--primary);
    box-shadow: 0 4px 12px rgba(67, 97, 238, 0.1);
    transform: translateX(5px);
  }
  .quick-action-btn i { font-size: 1.2rem; }

  /* Chart Containers */
  .chart-container-wrapper {
      position: relative;
      height: 320px;
      width: 100%;
  }
</style>

<div class="container-fluid py-4">
    
    <!-- Welcome Header -->
    <div class="d-flex flex-column flex-md-row align-items-md-center justify-content-between mb-5 animate-up">
        <div>
            <h2 class="fw-bold mb-1">Dashboard</h2>
            <p class="text-muted mb-0">Welcome back, <span class="fw-bold text-primary">Admin</span>!</p>
        </div>
        <div class="d-flex gap-3 mt-3 mt-md-0">
            <a href="sales_dashboard" class="btn btn-outline-primary d-flex align-items-center gap-2 px-4 py-2 rounded-pill">
                <i class="ti ti-chart-bar"></i> Sales
            </a>
            <a href="product_dashboard" class="btn btn-primary d-flex align-items-center gap-2 px-4 py-2 rounded-pill shadow-sm">
                <i class="ti ti-box"></i> Products
            </a>
        </div>
    </div>

    <!-- KPI Stats Row -->
    <div class="row g-4 mb-4">
        <!-- Revenue -->
        <div class="col-xl-3 col-md-6 animate-up delay-1">
            <div class="modern-card">
                <div class="d-flex justify-content-between">
                    <div>
                        <div class="card-subtitle mb-1">Total Revenue</div>
                        <div class="kpi-value">₹<%$total_revenue|number_format:0%></div>
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
                            <i class="ti ti-arrow-up-right"></i> --
                        </div>
                    </div>
                    <div class="icon-box bg-grad-info">
                        <i class="ti ti-shopping-cart"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Customers -->
        <div class="col-xl-3 col-md-6 animate-up delay-3">
            <div class="modern-card">
                <div class="d-flex justify-content-between">
                    <div>
                        <div class="card-subtitle mb-1">Total Customers</div>
                        <div class="kpi-value"><%$total_customers|number_format:0%></div>
                        <div class="trend-badge trend-up">
                           <i class="ti ti-users"></i> --
                        </div>
                    </div>
                    <div class="icon-box bg-grad-success">
                        <i class="ti ti-user-plus"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Conversion -->
        <div class="col-xl-3 col-md-6 animate-up delay-4">
            <div class="modern-card">
                <div class="d-flex justify-content-between">
                    <div>
                        <div class="card-subtitle mb-1">Conversion Rate</div>
                        <div class="kpi-value"><%$conversion_rate%>%</div>
                        <div class="trend-badge trend-up">
                            <i class="ti ti-trending-up"></i> --
                        </div>
                    </div>
                    <div class="icon-box bg-grad-warning">
                        <i class="ti ti-activity-heartbeat"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Charts Row -->
    <div class="row g-4 mb-4">
        <div class="col-lg-8 animate-up delay-2">
            <div class="modern-card h-100">
                <div class="card-header-clean">
                    <h5 class="card-title-modern">Revenue Analytics</h5>
                    <button class="btn btn-sm btn-light rounded-pill px-3"><i class="ti ti-calendar me-1"></i> This Year</button>
                </div>
                <div class="chart-container-wrapper">
                    <canvas id="revenueChart"></canvas>
                </div>
            </div>
        </div>
        <div class="col-lg-4 animate-up delay-3">
            <div class="modern-card h-100">
                <div class="card-header-clean">
                    <h5 class="card-title-modern">Order Sources</h5>
                    <button class="btn btn-sm btn-light rounded-circle"><i class="ti ti-dots-vertical"></i></button>
                </div>
                <div class="chart-container-wrapper" style="height: 280px; display: flex; align-items: center; justify-content: center;">
                    <canvas id="sourceChart"></canvas>
                </div>
                <div class="mt-4 text-center">
                    <small class="text-muted">Total Traffic: <strong class="text-dark">15,450</strong> Visits</small>
                </div>
            </div>
        </div>
    </div>

    <!-- Bottom Section: Transactions & Activity -->
    <div class="row g-4">
        <!-- Recent Orders -->
        <div class="col-lg-8 animate-up delay-3">
            <div class="modern-card">
                <div class="card-header-clean">
                    <h5 class="card-title-modern">Recent Orders</h5>
                    <a href="orders" class="text-primary text-decoration-none fw-bold" style="font-size: 0.9rem;">View All</a>
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
                            <%if $recent_orders%>
                                <%foreach from=$recent_orders item=order%>
                                    <tr>
                                        <td class="fw-bold">#<%$order.order_id%></td>
                                        <td>
                                            <div class="d-flex align-items-center gap-2">
                                                <div class="avatar-xs bg-light rounded-circle text-center fw-bold text-primary" style="width:30px;height:30px;line-height:30px;"><%$order.customer_name|substr:0:1|upper%></div>
                                                <%$order.customer_name%>
                                            </div>
                                        </td>
                                        <td><%$order.order_date|date_format:"%b %d, %Y"%></td>
                                        <td class="fw-bold">₹<%$order.total_amount|number_format:0%></td>
                                        <td>
                                            <%if $order.payment_status eq 'Paid'%>
                                                <span class="status-badge status-active">Paid</span>
                                            <%elseif $order.payment_status eq 'Pending'%>
                                                <span class="status-badge status-pending">Pending</span>
                                            <%elseif $order.payment_status eq 'Unpaid'%>
                                                <span class="status-badge status-inactive">Unpaid</span>
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

        <!-- Right Column: Quick Actions & Timeline -->
        <div class="col-lg-4 animate-up delay-4">
            
            <!-- Quick Actions -->
            <div class="modern-card mb-4">
                 <div class="card-header-clean mb-3">
                    <h5 class="card-title-modern">Quick Actions</h5>
                </div>
                <div>
                     <a href="add_product" class="quick-action-btn text-decoration-none">
                         <i class="ti ti-plus text-primary"></i> 
                         <span>Add New Product</span>
                     </a>
                     <a href="orders" class="quick-action-btn text-decoration-none">
                         <i class="ti ti-file-invoice text-success"></i> 
                         <span>View Orders</span>
                     </a>
                     <a href="customer_list" class="quick-action-btn text-decoration-none">
                         <i class="ti ti-user-plus text-info"></i> 
                         <span>View Customers</span>
                     </a>
                </div>
            </div>

            <!-- Activity -->
            <div class="modern-card">
                <div class="card-header-clean">
                    <h5 class="card-title-modern">Latest Activity</h5>
                </div>
                <div class="ps-1">
                    <%if $latest_activity%>
                        <%foreach from=$latest_activity item=activity%>
                            <div class="activity-item">
                                <div class="activity-icon bg-light text-<%$activity.color%>"><i class="<%$activity.icon%>"></i></div>
                                <div class="activity-content">
                                    <div class="activity-title"><%$activity.title%></div>
                                    <div class="activity-time"><%$activity.time%></div>
                                </div>
                            </div>
                        <%/foreach%>
                    <%else%>
                        <div class="text-center text-muted py-3">No recent activity</div>
                    <%/if%>
                </div>
            </div>

        </div>
    </div>

</div>

<!-- CHART JS & INIT -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    
    // Global Defaults
    Chart.defaults.font.family = "'Public Sans', sans-serif";
    Chart.defaults.color = '#64748b';
    Chart.defaults.scale.grid.color = 'rgba(226, 232, 240, 0.6)';

    // --- REVENUE CHART ---
    const ctxRevenue = document.getElementById('revenueChart').getContext('2d');
    
    // Parse monthly revenue data from PHP
    const monthlyRevenueData = <%$monthly_revenue_json|default:'[]'%>;
    
    // Prepare chart data
    const monthLabels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    const revenueValues = new Array(12).fill(0);
    
    // Map database data to chart
    monthlyRevenueData.forEach(item => {
        const monthIndex = monthLabels.findIndex(m => m === item.month);
        if (monthIndex !== -1) {
            revenueValues[monthIndex] = parseFloat(item.revenue) || 0;
        }
    });
    
    // Gradient
    let gradientEx = ctxRevenue.createLinearGradient(0, 0, 0, 400);
    gradientEx.addColorStop(0, 'rgba(67, 97, 238, 0.35)');
    gradientEx.addColorStop(1, 'rgba(67, 97, 238, 0.01)');

    new Chart(ctxRevenue, {
        type: 'line',
        data: {
            labels: monthLabels,
            datasets: [{
                label: 'Revenue (₹)',
                data: revenueValues,
                borderColor: '#4361ee',
                backgroundColor: gradientEx,
                borderWidth: 3,
                tension: 0.4,
                fill: true,
                pointBackgroundColor: '#ffffff',
                pointBorderColor: '#4361ee',
                pointBorderWidth: 2,
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
                    titleColor: '#fff',
                    bodyColor: '#cbd5e1',
                    padding: 10,
                    cornerRadius: 8,
                    displayColors: false
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    border: { display: false },
                    grid: { borderDash: [4, 4] }
                },
                x: {
                    border: { display: false },
                    grid: { display: false }
                }
            }
        }
    });

    // --- SOURCE CHART ---
    const ctxSource = document.getElementById('sourceChart').getContext('2d');
    
    // Parse order sources data from PHP
    const orderSourcesData = <%$order_sources_json|default:'[]'%>;
    
    // Prepare chart data
    const sourceLabels = [];
    const sourceCounts = [];
    const sourceColors = ['#4361ee', '#4cc9f0', '#f72585', '#10b981', '#f59e0b'];
    
    orderSourcesData.forEach((item, index) => {
        sourceLabels.push(item.order_source || 'Unknown');
        sourceCounts.push(parseInt(item.count) || 0);
    });
    
    // If no data, show placeholder
    if (sourceLabels.length === 0) {
        sourceLabels.push('No Data');
        sourceCounts.push(1);
    }
    
    new Chart(ctxSource, {
        type: 'doughnut',
        data: {
            labels: sourceLabels,
            datasets: [{
                data: sourceCounts,
                backgroundColor: sourceColors.slice(0, sourceLabels.length),
                borderWidth: 0,
                hoverOffset: 4
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            cutout: '75%',
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
