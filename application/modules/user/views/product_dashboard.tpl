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

  /* Inventory Health List */
  .inventory-list-item {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 12px 0;
      border-bottom: 1px dashed #e2e8f0;
  }
  .inventory-list-item:last-child { border-bottom: none; }
  .inventory-dot {
      width: 10px;
      height: 10px;
      border-radius: 50%;
      margin-right: 12px;
  }
  
  /* Status Badge & Pills */
  .status-badge {
    padding: 6px 12px;
    border-radius: 30px;
    font-size: 0.8rem;
    font-weight: 600;
  }
  .status-active { background: rgba(16, 185, 129, 0.1); color: #059669; }
  .status-pending { background: rgba(245, 158, 11, 0.1); color: #d97706; }
  .status-inactive { background: rgba(100, 116, 139, 0.1); color: #64748b; }
  .status-blocked { background: rgba(239, 68, 68, 0.1); color: #ef4444; }

  /* Timeline / Activity */
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
    overflow: hidden;
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
            <h2 class="fw-bold mb-1">Product Dashboard</h2>
            <p class="text-muted mb-0">Manage your <span class="fw-bold text-primary">Catalog</span> with real-time insights</p>
        </div>
        <div class="d-flex gap-3 mt-3 mt-md-0">
             <a href="dashboard" class="btn btn-outline-primary d-flex align-items-center gap-2 px-4 py-2 rounded-pill">
                <i class="ti ti-layout-dashboard"></i> Overview
            </a>
            <a href="sales_dashboard" class="btn btn-outline-primary d-flex align-items-center gap-2 px-4 py-2 rounded-pill">
                <i class="ti ti-chart-bar"></i> Sales
            </a>
            <a href="product_list" class="btn btn-primary d-flex align-items-center gap-2 px-4 py-2 rounded-pill shadow-sm">
                <i class="ti ti-plus"></i> Add Product
            </a>
        </div>
    </div>

    <!-- KPI Stats -->
    <div class="row g-4 mb-4">
        <!-- Total Products -->
        <div class="col-xl-3 col-md-6 animate-up delay-1">
            <div class="modern-card">
                <div class="d-flex justify-content-between">
                    <div>
                        <div class="card-subtitle mb-1">Total Products</div>
                        <div class="kpi-value"><%$total_products|number_format%></div>
                        <div class="trend-badge trend-up">
                            <i class="ti ti-box"></i> Live Catalog
                        </div>
                    </div>
                    <div class="icon-box bg-grad-primary">
                        <i class="ti ti-box"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Active Products -->
        <div class="col-xl-3 col-md-6 animate-up delay-2">
            <div class="modern-card">
                <div class="d-flex justify-content-between">
                    <div>
                        <div class="card-subtitle mb-1">Active Products</div>
                        <div class="kpi-value"><%$active_products|number_format%></div>
                         <small class="text-muted"><%if $total_products > 0%><%($active_products/$total_products*100)|round%><%else%>0<%/if%>% of inventory</small>
                    </div>
                    <div class="icon-box bg-grad-success">
                        <i class="ti ti-check"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Low Stock -->
        <div class="col-xl-3 col-md-6 animate-up delay-3">
            <div class="modern-card">
                <div class="d-flex justify-content-between">
                    <div>
                        <div class="card-subtitle mb-1">Low Stock</div>
                        <div class="kpi-value warning-text" style="color:#f59e0b"><%$low_stock%></div>
                        <div class="trend-badge trend-down">
                           <i class="ti ti-alert-triangle"></i> Needs Action
                        </div>
                    </div>
                     <div class="icon-box bg-grad-warning">
                        <i class="ti ti-alert-circle"></i>
                    </div>
                </div>
            </div>
        </div>

         <!-- Out of Stock -->
        <div class="col-xl-3 col-md-6 animate-up delay-4">
            <div class="modern-card">
                <div class="d-flex justify-content-between">
                    <div>
                        <div class="card-subtitle mb-1">Out of Stock</div>
                        <div class="kpi-value text-danger"><%$out_of_stock%></div>
                         <small class="text-muted">Restock required</small>
                    </div>
                    <div class="icon-box bg-white text-danger border border-danger shadow-sm">
                        <i class="ti ti-x"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Charts Section -->
    <div class="row g-4 mb-4">
        <div class="col-lg-7 animate-up delay-2">
            <div class="modern-card h-100">
                <div class="card-header-clean">
                    <h5 class="card-title-modern">Product Trends (Units Sold)</h5>
                </div>
                <div class="chart-container-wrapper">
                    <canvas id="productTrendChart"></canvas>
                </div>
            </div>
        </div>
        <div class="col-lg-5 animate-up delay-3">
             <div class="modern-card h-100">
                <div class="card-header-clean">
                    <h5 class="card-title-modern">Inventory by Category</h5>
                </div>
                <div class="chart-container-wrapper" style="height: 300px; display: flex; align-items: center; justify-content: center;">
                    <canvas id="inventoryCategoryChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- Bottom Lists -->
    <div class="row g-4 mb-5">
        
        <!-- Inventory Health -->
        <div class="col-lg-4 animate-up delay-3">
            <div class="modern-card h-100">
                <div class="card-header-clean">
                    <h5 class="card-title-modern">Inventory Health</h5>
                </div>
                <div>
                   <div class="inventory-list-item">
                       <div class="d-flex align-items-center">
                           <div class="inventory-dot bg-success"></div>
                           <span>Healthy Stock</span>
                       </div>
                       <span class="fw-bold"><%$healthy_percentage%>%</span>
                   </div>
                    <div class="inventory-list-item">
                       <div class="d-flex align-items-center">
                           <div class="inventory-dot bg-warning"></div>
                           <span>Low Stock</span>
                       </div>
                       <span class="fw-bold"><%$low_stock_percentage%>%</span>
                   </div>
                    <div class="inventory-list-item">
                       <div class="d-flex align-items-center">
                           <div class="inventory-dot bg-danger"></div>
                           <span>Out of Stock</span>
                       </div>
                       <span class="fw-bold"><%$out_of_stock_percentage%>%</span>
                   </div>
                </div>
                <div class="mt-4 pt-3 border-top">
                    <button class="btn btn-sm btn-outline-primary w-100">View Low Stock Report</button>
                </div>
            </div>
        </div>

         <!-- Top Selling Table -->
        <div class="col-lg-4 animate-up delay-4">
            <div class="modern-card h-100">
                <div class="card-header-clean">
                    <h5 class="card-title-modern">Best Sellers</h5>
                     <a href="#" class="text-primary text-decoration-none small fw-bold">View All</a>
                </div>
                <table class="table modern-table table-borderless mb-0">
                    <thead style="display:none;"><tr><th>Product</th><th>Sales</th></tr></thead>
                    <tbody>
                        <%foreach from=$top_selling_products item=product%>
                        <tr>
                            <td>
                                <div class="d-flex align-items-center gap-3">
                                    <div class="rounded-3 bg-light d-flex align-items-center justify-content-center" style="width:40px;height:40px;overflow:hidden;">
                                        <i class="ti ti-package text-muted"></i>
                                    </div> 
                                    <div><div class="fw-bold text-truncate" style="max-width:150px;"><%$product.product_name%></div><small class="text-muted"><%$product.category_name%></small></div>
                                </div>
                            </td>
                            <td class="text-end">
                                <div class="fw-bold"><%$product.units_sold%> Sold</div>
                                <div class="small text-success">₹<%$product.total_revenue|number_format:0%></div>
                            </td>
                        </tr>
                        <%foreachelse%>
                        <tr>
                            <td colspan="2" class="text-center text-muted">No sales data yet</td>
                        </tr>
                        <%/foreach%>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Recently Added -->
         <div class="col-lg-4 animate-up delay-4">
            <div class="modern-card h-100">
                <div class="card-header-clean">
                    <h5 class="card-title-modern">Recently Added</h5>
                </div>
                <div class="ps-1">
                    <%if $recent_products%>
                        <%foreach from=$recent_products item=p%>
                            <div class="activity-item">
                                <div class="activity-icon bg-light">
                                    <%if $p.cover_image%>
                                        <div class="w-100 h-100 rounded-circle" style="background-image:url('<%$base_url%>public/uploads/products/<%$p.id%>/<%$p.cover_image%>');background-size:cover;background-position:center;"></div>
                                    <%else%>
                                        <i class="ti ti-package text-primary"></i>
                                    <%/if%>
                                </div>
                                <div class="activity-content">
                                    <div class="activity-title d-flex justify-content-between">
                                        <span class="text-truncate" style="max-width:140px;"><%$p.name%></span>
                                        <a href="<%$base_url%>product_details?id=<%$p.id%>" class="text-muted"><i class="ti ti-chevron-right"></i></a>
                                    </div>
                                    <div class="activity-time">Added <%$p.added_date|date_format:"%b %d, %H:%I"%></div>
                                </div>
                            </div>
                        <%/foreach%>
                    <%else%>
                        <div class="text-center text-muted py-3">No products added recently</div>
                    <%/if%>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- CHART JS -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    
    // --- PRODUCT TREND LINE CHART ---
    const ctxProd = document.getElementById('productTrendChart').getContext('2d');
    const trendData = <%$product_trend_json|default:'[]'%>;
    
    // Gradient
    let prodGradient = ctxProd.createLinearGradient(0, 0, 0, 400);
    prodGradient.addColorStop(0, 'rgba(16, 185, 129, 0.25)'); // Emerald
    prodGradient.addColorStop(1, 'rgba(16, 185, 129, 0.01)');

    new Chart(ctxProd, {
        type: 'line',
        data: {
            labels: trendData.map(item => item.month),
            datasets: [{
                label: "Units Sold",
                data: trendData.map(item => item.units_sold),
                borderColor: '#10b981',
                backgroundColor: prodGradient,
                borderWidth: 3,
                tension: 0.4,
                fill: true,
                pointBackgroundColor: '#ffffff',
                pointBorderColor: '#10b981',
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

    // --- INVENTORY CATEGORY BAR CHART ---
    const ctxCat = document.getElementById('inventoryCategoryChart').getContext('2d');
    const catData = <%$category_inventory_json|default:'[]'%>;

    new Chart(ctxCat, {
        type: 'bar',
        data: {
            labels: catData.map(item => item.category_name),
            datasets: [{
                label: 'Items',
                data: catData.map(item => item.product_count),
                backgroundColor: [
                    '#4361ee',
                    '#3a0ca3',
                    '#4cc9f0',
                    '#f72585',
                    '#4895ef'
                ],
                borderRadius: 6,
                borderSkipped: false
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { display: false }
            },
             scales: {
                y: {
                    beginAtZero: true,
                    grid: { display:false, drawBorder: false },
                    ticks: { display: false }
                },
                x: {
                    grid: { display: false, drawBorder: false }
                }
            }
        }
    });

});
</script>
