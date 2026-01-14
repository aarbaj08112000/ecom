<style>
  body {
    background: #f8f9fa;
    font-family: 'Segoe UI', sans-serif;
  }
  .section-card {
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
    background: #fff;
    padding: 20px;
    margin-bottom: 20px;
  }
  .section-title {
    font-size: 18px;
    font-weight: 600;
    margin-bottom: 15px;
    color: #333;
    border-left: 4px solid #0d6efd;
    padding-left: 10px;
  }
  .table thead {
    background: #0d6efd;
    color: #fff;
  }
  .badge-success {
    background: #28a745;
  }
  .badge-danger {
    background: #dc3545;
  }
  .badge-warning {
    background: #ffc107;
    color: #000;
  }
</style>

<div class="content-wrapper">
  <div class="container-xxl flex-grow-1 container-p-y">

    <nav aria-label="breadcrumb">
      <div class="sub-header-left pull-left breadcrumb">
        <h1>
          Sales
          <a href="javascript:void(0)" class="backlisting-link">
            <i class="ti ti-chevrons-right"></i>
            <em>Details</em>
          </a>
        </h1>
        <br>
        <span>View Sale Information</span>
      </div>
    </nav>

    <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
      <a href="<%base_url('sales_report')%>" class="btn btn-secondary" title="Back To Sales Report">
        <i class="ti ti-arrow-left"></i>
      </a>
    </div>

    <!-- SALE SUMMARY -->
    <div class="section-card">
      <div class="section-title">Sale Summary</div>
      <div class="row mb-2">
        <div class="col-md-4"><strong>Invoice No:</strong> <%$sale.invoice_no%></div>
        <div class="col-md-4"><strong>Date:</strong> <%$sale.date|default:'-'%></div>
        <div class="col-md-4">
          <strong>Status:</strong>
          <%if $sale.status == 'Paid'%>
            <span class="status-badge status-paid">Paid</span>
          <%elseif $sale.status == 'Partial'%>
            <span class="status-badge status-partial-paid">Partial</span>
          <%else%>
            <span class="status-badge status-unpaid">Unpaid</span>
          <%/if%>
        </div>
      </div>

      <div class="row mb-2">
        <div class="col-md-4"><strong>Customer Name:</strong> <%$sale.customer_name%></div>
        <div class="col-md-4"><strong>Mobile:</strong> <%$sale.customer_mobile|default:'-'%></div>
        <div class="col-md-4"><strong>Email:</strong> <%$sale.customer_email|default:'-'%></div>
      </div>

      <div class="row mb-2">
        <div class="col-md-4"><strong>Total Amount:</strong> ₹<%$sale.total_amount|number_format:2%></div>
        <div class="col-md-4"><strong>Paid Amount:</strong> ₹<%$sale.paid_amount|number_format:2%></div>
        <div class="col-md-4"><strong>Pending Amount:</strong> ₹<%$sale.pending_amount|number_format:2%></div>
      </div>
    </div>

    <!-- PRODUCT LIST -->
    <div class="section-card">
      <div class="section-title">Product Details</div>
      <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>#</th>
            <th>Product</th>
            <th>Category</th>
            <th>Qty</th>
            <th>Rate (₹)</th>
            <th>Total (₹)</th>
          </tr>
        </thead>
        <tbody>
          <%foreach from=$sale.products item=product key=k%>
          <tr>
            <td><%$k+1%></td>
            <td><%$product.name%></td>
            <td><%$product.category%></td>
            <td><%$product.qty%></td>
            <td><%$product.rate|number_format:2%></td>
            <td><%$product.total|number_format:2%></td>
          </tr>
          <%foreachelse%>
          <tr>
            <td colspan="6" class="text-center text-muted">No products found</td>
          </tr>
          <%/foreach%>
        </tbody>
      </table>
    </div>

    <!-- PAYMENT INFO -->
    <div class="section-card">
      <div class="section-title">Payment Information</div>
      <div class="row mb-2">
        <div class="col-md-4"><strong>Payment Mode:</strong> <%$sale.payment_mode|default:'-'%></div>
        <div class="col-md-4"><strong>Transaction ID:</strong> <%$sale.transaction_id|default:'-'%></div>
        <div class="col-md-4"><strong>Payment Date:</strong> <%$sale.payment_date|default:'-'%></div>
      </div>
      <div class="row">
        <div class="col-md-12"><strong>Remarks:</strong> <%$sale.remarks|default:'-'%></div>
      </div>
    </div>

  </div>
</div>

<script type="text/javascript">
  var base_url = <%$base_url|@json_encode%>;
</script>
