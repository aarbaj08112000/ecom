<style>
  body {
    background: #f4f7f6;
    font-family: 'Inter', system-ui, -apple-system, sans-serif;
  }
  .header-card {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 16px;
    padding: 30px;
    color: white;
    margin-bottom: 24px;
    box-shadow: 0 10px 20px rgba(0,0,0,0.1);
  }
  .stat-card {
    background: white;
    border-radius: 12px;
    padding: 24px;
    border: none;
    box-shadow: 0 4px 6px rgba(0,0,0,0.05);
    transition: transform 0.2s;
  }
  .stat-card:hover {
    transform: translateY(-5px);
  }
  .stat-title {
    color: #8898aa;
    text-transform: uppercase;
    font-size: 13px;
    font-weight: 600;
    letter-spacing: 0.025em;
  }
  .stat-value {
    font-size: 24px;
    font-weight: 700;
    color: #32325d;
    margin-top: 4px;
  }
  .table-card {
    background: white;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0,0,0,0.05);
  }
  .table thead th {
    background: #f6f9fc;
    border-bottom: 2px solid #e9ecef;
    color: #8898aa;
    font-weight: 600;
    text-transform: uppercase;
    font-size: 12px;
    padding: 16px;
  }
  .table td {
    padding: 16px;
    vertical-align: middle;
    color: #525f7f;
  }
  .badge-active { background: #2dce89; color: white; }
  .badge-inactive { background: #f5365c; color: white; }
</style>

<div class="content-wrapper">
  <div class="container-xxl flex-grow-1 container-p-y">
    
    <!-- Header / Breadcrumbs -->
    <nav aria-label="breadcrumb">
      <div class="sub-header-left pull-left breadcrumb">
        <h1>
           Reports & Analytics
          <a hijacked="yes" href="javascript:void(0)" class="backlisting-link" title="Back" >
            <i class="ti ti-chevrons-right" ></i>
            <em >Product Performance Report</em></a>
          </h1>
          <br>
          <span >Performance Details</span>
        </div>
      </nav>

    <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-4">
        <a href="<%$base_url%>product_performance_report" class="btn btn-primary d-flex align-items-center">
            <i class="ti ti-arrow-left me-2"></i> Back to Listing
        </a>
    </div>

    <!-- Product Profile -->
    <div class="header-card d-flex align-items-center">
        <div class="me-4">
            <%if $product.image%>
                <img src="<%$base_url%>public/uploads/products/<%$product.id%>/<%$product.image%>" class="rounded" width="100" height="100" style="object-fit: cover; border: 3px solid rgba(255,255,255,0.3)">
            <%else%>
                <div class="rounded d-flex align-items-center justify-content-center" style="width: 100px; height: 100px; background: rgba(255,255,255,0.2); border: 2px dashed rgba(255,255,255,0.5)">
                    <i class="ti ti-package fs-1"></i>
                </div>
            <%/if%>
        </div>
        <div>
            <h2 class="mb-1 text-white"><%$product.name%></h2>
            <div class="d-flex align-items-center">
                <span class="status-badge <%if $product.status == 'Active'%>status-active<%else%>status-inactive<%/if%> me-2">
                    <%$product.status%>
                </span>
                <span class="opacity-75"><%$product.category_name%></span>
            </div>
            <p class="mt-2 mb-0 opacity-75 fs-6"><%$product.detail|truncate:150%></p>
        </div>
    </div>

    <!-- Metrics row -->
    <div class="row mb-5">
        <div class="col-md-4">
            <div class="stat-card">
                <div class="d-flex align-items-center mb-2">
                    <div class="bg-label-primary p-2 rounded me-3">
                        <i class="ti ti-currency-rupee fs-3"></i>
                    </div>
                    <div class="stat-title">Total Revenue</div>
                </div>
                <div class="stat-value">₹<%$stats.total_revenue|number_format:2%></div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="stat-card">
                <div class="d-flex align-items-center mb-2">
                    <div class="bg-label-success p-2 rounded me-3">
                        <i class="ti ti-shopping-cart fs-3"></i>
                    </div>
                    <div class="stat-title">Units Sold</div>
                </div>
                <div class="stat-value"><%$stats.qty_sold%> <small class="text-muted fw-normal">Units</small></div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="stat-card">
                <div class="d-flex align-items-center mb-2">
                    <div class="bg-label-info p-2 rounded me-3">
                        <i class="ti ti-package fs-3"></i>
                    </div>
                    <div class="stat-title">Total Orders</div>
                </div>
                <div class="stat-value"><%$stats.total_orders%> <small class="text-muted fw-normal">Orders</small></div>
            </div>
        </div>
    </div>

    <!-- Sales History -->
    <div class="table-card">
        <div class="p-4 border-bottom d-flex justify-content-between align-items-center">
            <h4 class="mb-0">Recent Sales History</h4>
            <span class="badge bg-label-info">Showing last 10 transactions</span>
        </div>
        <div class="table-responsive">
            <table class="table table-hover mb-0">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Date</th>
                        <th>Customer</th>
                        <th class="text-center">Qty</th>
                        <th class="text-end">Rate</th>
                        <th class="text-end">Total</th>
                    </tr>
                </thead>
                <tbody>
                    <%foreach from=$history item=h%>
                    <tr>
                        <td><strong>#<%$h.order_id%></strong></td>
                        <td><%$h.order_date|date_format:"%d %b %Y"%></td>
                        <td><%$h.customer_name%></td>
                        <td class="text-center"><%$h.quantity%></td>
                        <td class="text-end">₹<%$h.price|number_format:2%></td>
                        <td class="text-end"><strong>₹<%$h.final_price|number_format:2%></strong></td>
                    </tr>
                    <%foreachelse%>
                    <tr>
                        <td colspan="6" class="text-center py-5">
                            <i class="ti ti-alert-circle fs-1 text-muted d-block mb-3"></i>
                            <span class="text-muted">No sales records found for this product yet.</span>
                        </td>
                    </tr>
                    <%/foreach%>
                </tbody>
            </table>
        </div>
    </div>

  </div>
</div>
