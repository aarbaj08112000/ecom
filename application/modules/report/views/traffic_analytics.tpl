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
    --radius-lg: 20px;
    --radius-md: 12px;
    --shadow-soft: 0 10px 40px -10px rgba(0,64,128,0.07);
    --shadow-hover: 0 20px 60px -15px rgba(0,64,128,0.15);
  }

  body {
    background-color: #f1f5f9;
    font-family: 'Public Sans', sans-serif;
    color: var(--dark);
  }

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

  .card-header-clean {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1.5rem;
  }
  
  .card-title-modern {
    font-size: 1.1rem;
    font-weight: 700;
    color: var(--dark);
    margin: 0;
  }

  .kpi-value {
    font-size: 1.75rem;
    font-weight: 800;
    color: var(--dark);
    margin-bottom: 0.25rem;
  }

  .icon-box {
    width: 48px;
    height: 48px;
    border-radius: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.25rem;
  }

  .bg-grad-primary { background: linear-gradient(135deg, #4361ee, #4895ef); color: white; }
  .bg-grad-success { background: linear-gradient(135deg, #10b981, #34d399); color: white; }
  .bg-grad-warning { background: linear-gradient(135deg, #f72585, #b5179e); color: white; }
  .bg-grad-info { background: linear-gradient(135deg, #3a0ca3, #4361ee); color: white; }

  .modern-table thead th {
    background-color: #f8fafc;
    color: var(--muted);
    font-weight: 600;
    font-size: 0.8rem;
    text-transform: uppercase;
    padding: 12px 16px;
    border-bottom: 2px solid #e2e8f0;
  }
  .modern-table tbody td {
    padding: 14px 16px;
    border-bottom: 1px solid #f1f5f9;
    font-size: 0.9rem;
  }

  .chart-container {
    position: relative;
    height: 300px;
    width: 100%;
  }

  @keyframes fadeInUp {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
  }
  .animate-up { animation: fadeInUp 0.6s ease-out forwards; opacity: 0; }
  .delay-1 { animation-delay: 0.1s; }
  .delay-2 { animation-delay: 0.2s; }
  .delay-3 { animation-delay: 0.3s; }
</style>

<div class="container-fluid py-4">
    
    <!-- Header -->
    <div class="d-flex flex-column flex-md-row align-items-md-center justify-content-between mb-5 animate-up">
        <div>
            <h2 class="fw-bold mb-1">Traffic Analytics</h2>
            <p class="text-muted mb-0">Monitor your website traffic and visitor behavior</p>
        </div>
        <div class="d-flex gap-3 mt-3 mt-md-0">
            <button class="btn btn-outline-primary d-flex align-items-center gap-2 px-4 py-2 rounded-pill" onclick="location.reload()">
                <i class="ti ti-refresh"></i> Refresh
            </button>
            <a href="product_dashboard" class="btn btn-primary d-flex align-items-center gap-2 px-4 py-2 rounded-pill shadow-sm">
                <i class="ti ti-arrow-left"></i> Back to Dashboard
            </a>
        </div>
    </div>

    <!-- KPI Stats -->
    <div class="row g-4 mb-4">
        <div class="col-xl-3 col-md-6 animate-up delay-1">
            <div class="modern-card">
                <div class="d-flex justify-content-between">
                    <div>
                        <div class="text-muted small mb-1">Total Page Views</div>
                        <div class="kpi-value"><%($kpi.total_views|number_format)|default:0%></div>
                        <div class="badge bg-label-primary">Lifetime</div>
                    </div>
                    <div class="icon-box bg-grad-primary">
                        <i class="ti ti-eye"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6 animate-up delay-1">
            <div class="modern-card">
                <div class="d-flex justify-content-between">
                    <div>
                        <div class="text-muted small mb-1">Unique Visitors</div>
                        <div class="kpi-value"><%($kpi.unique_visitors|number_format)|default:0%></div>
                        <div class="badge bg-label-info">By IP Address</div>
                    </div>
                    <div class="icon-box bg-grad-info">
                        <i class="ti ti-users"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6 animate-up delay-2">
            <div class="modern-card">
                <div class="d-flex justify-content-between">
                    <div>
                        <div class="text-muted small mb-1">Views Today</div>
                        <div class="kpi-value"><%($kpi.views_today|number_format)|default:0%></div>
                        <div class="badge bg-label-success">Active</div>
                    </div>
                    <div class="icon-box bg-grad-success">
                        <i class="ti ti-calendar-event"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6 animate-up delay-2">
            <div class="modern-card">
                <div class="d-flex justify-content-between">
                    <div>
                        <div class="text-muted small mb-1">Most Popular Page</div>
                        <div class="fw-bold text-truncate mt-2" style="max-width: 150px;"><%($kpi.top_page.request_uri)|default:'/'%></div>
                        <small class="text-muted"><%($kpi.top_page.views|number_format)|default:0%> views</small>
                    </div>
                    <div class="icon-box bg-grad-warning">
                        <i class="ti ti-trending-up"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Charts Section -->
    <div class="row g-4 mb-4">
        <div class="col-lg-8 animate-up delay-3">
            <div class="modern-card h-100">
                <div class="card-header-clean">
                    <h5 class="card-title-modern">Traffic Trends (Last 30 Days)</h5>
                </div>
                <div class="chart-container">
                    <canvas id="trafficTrendChart"></canvas>
                </div>
            </div>
        </div>
        <div class="col-lg-4 animate-up delay-3">
             <div class="modern-card h-100">
                <div class="card-header-clean">
                    <h5 class="card-title-modern">Device Distribution</h5>
                </div>
                <div class="chart-container">
                    <canvas id="deviceDistChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- Top Pages Table -->
    <div class="row g-4 mb-5">
        <div class="col-12 animate-up delay-4">
            <div class="modern-card">
                <div class="card-header-clean">
                    <h5 class="card-title-modern">Most Visited Pages</h5>
                </div>
                <div class="table-responsive">
                    <table class="table modern-table table-borderless">
                        <thead>
                            <tr>
                                <th>Page URI</th>
                                <th class="text-center">Total Views</th>
                                <th class="text-center">Unique Visitors</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%foreach from=$top_pages item=page%>
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="icon-box bg-light text-primary" style="width:32px;height:32px;font-size:0.9rem;">
                                            <i class="ti ti-link"></i>
                                        </div>
                                        <span class="text-dark fw-semibold"><%$page.request_uri%></span>
                                    </div>
                                </td>
                                <td class="text-center fw-bold"><%$page.views|number_format%></td>
                                <td class="text-center text-muted"><%$page.unique_visitors|number_format%></td>
                            </tr>
                            <%foreachelse%>
                            <tr>
                                <td colspan="3" class="text-center py-4 text-muted">No traffic data recorded yet</td>
                            </tr>
                            <%/foreach%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<%$base_url%>public/js/admin_panel/traffic_analytics.js"></script>
