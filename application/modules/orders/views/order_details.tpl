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
    margin-bottom: 25px;
  }
  .section-title {
    font-size: 18px;
    font-weight: 600;
    margin-bottom: 15px;
    color: #333;
    border-left: 4px solid #dc3545;
    padding-left: 10px;
  }
  .table thead {
    background: #dc3545;
    color: #fff;
  }
  .badge-success { background:#28a745; }
  .badge-danger { background:#dc3545; }
  .badge-warning { background:#ffc107; }
</style>

<div class="content-wrapper">

  <div class="container flex-grow-1 container-p-y">

    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb">
      <div class="sub-header-left pull-left breadcrumb">
        <h1>
          Orders
          <a href="javascript:void(0)" class="backlisting-link">
            <i class="ti ti-chevrons-right"></i>
            <em>Order Details</em>
          </a>
        </h1>
        <span>Complete Order Overview</span>
      </div>
    </nav>

    <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-4">
      <a href="<%base_url('orders')%>" class="btn btn-secondary">
        <i class="ti ti-arrow-left"></i>
      </a>

      <!-- View Invoice -->
      <a href="<%base_url('invoice_view')%>?id=<%$order.order_id|@base64_encode|urlencode%>" class="btn btn-primary">
        <i class="ti ti-file-invoice"></i> View Invoice
      </a>
    </div>

    <!-- ORDER DETAILS -->
    <div class="container px-0">

      <!-- ORDER INFORMATION -->
      <div class="section-card">
        <div class="section-title">Order Information</div>

        <div class="row mb-2">
          <div class="col-md-4"><strong>Order ID:</strong> <%$order.order_id%></div>
          <div class="col-md-4"><strong>Date:</strong> <%$order.added_date|date_format:"%d %b %Y, %I:%M %p"%></div>
          <div class="col-md-4"><strong>Status:</strong> 
            <%assign var="o_status" value=$order.order_status|lower%>
            <span class="badge bg-label-<%if $o_status eq 'delivered'%>success<%elseif $o_status eq 'shipped'%>info<%elseif $o_status eq 'processing'%>primary<%elseif $o_status eq 'cancelled'%>danger<%else%>warning<%/if%>">
                <%$order.order_status|ucfirst%>
            </span>
          </div>
        </div>

        <div class="row mb-2">
          <div class="col-md-4"><strong>Payment Method:</strong> <%$order.payment_method|replace:'_':' '|ucfirst%></div>
          <div class="col-md-4"><strong>Payment Status:</strong> 
            <%assign var="p_status" value=$order.payment_status|lower%>
            <span class="badge bg-label-<%if $p_status eq 'paid' or $p_status eq 'completed'%>success<%elseif $p_status eq 'failed'%>danger<%elseif $p_status eq 'refunded'%>info<%else%>warning<%/if%>">
                <%$order.payment_status|default:'Unpaid'|ucfirst%>
            </span>
          </div>
          <div class="col-md-4"><strong>Transaction ID:</strong> <%$payment.transaction_id|default:'N/A'%></div>
        </div>
      </div>


      <!-- CUSTOMER INFORMATION -->
      <div class="section-card">
        <div class="section-title">Customer Information</div>

        <div class="row mb-1">
          <div class="col-md-4"><strong>Name:</strong> <%$order.customer_name|default:'Guest'%></div>
          <div class="col-md-4"><strong>Mobile:</strong> <%$order.mobile_no|default:'N/A'%></div>
          <div class="col-md-4"><strong>Email:</strong> <%$order.email|default:'N/A'%></div>
        </div>

        <div class="row">
          <div class="col-md-4"><strong>Customer Code:</strong> <%$order.customer_code|default:'N/A'%></div>
          <div class="col-md-4"><strong>GST No:</strong> <%$order.gst_no|default:'N/A'%></div>
          <div class="col-md-4"><strong>PAN:</strong> <%$order.pan_no|default:'N/A'%></div>
        </div>
      </div>


      <!-- SHIPPING INFORMATION -->
      <div class="section-card">
        <div class="section-title">Shipping Details</div>
        <%if $shipping_address %>
            <div class="row mb-2">
              <div class="col-md-6"><strong>Address:</strong> <%$shipping_address.address%></div>
              <div class="col-md-3"><strong>City:</strong> <%$shipping_address.city%></div>
              <div class="col-md-3"><strong>Pincode:</strong> <%$shipping_address.zip%></div>
            </div>

            <div class="row">
              <div class="col-md-4"><strong>State:</strong> <%$shipping_address.state%></div>
              <div class="col-md-4"><strong>Type:</strong> Shipping Address</div>
            </div>
        <%else %>
            <p class="text-muted">No shipping address recorded for this order.</p>
        <%/if %>
      </div>


      <!-- ITEM LIST -->
      <div class="section-card">
        <div class="section-title">Order Items</div>

        <table class="table table-bordered table-striped">
          <thead>
            <tr>
              <th>#</th>
              <th>Product</th>
              <th>Qty</th>
              <th>Price</th>
              <th>Discount</th>
              <th>Tax</th>
              <th>Total</th>
            </tr>
          </thead>

          <tbody>
            <%foreach from=$items item=item name=foo %>
            <tr>
              <td><%$smarty.foreach.foo.iteration%></td>
              <td><%$item.product_name_at_order%></td>
              <td><%$item.quantity%></td>
              <td>₹<%$item.price|number_format:2%></td>
              <td>₹<%$item.discount_amount|number_format:2%></td>
              <td>₹<%$item.tax_amount|number_format:2%></td>
              <td>₹<%$item.final_price|number_format:2%></td>
            </tr>
            <%/foreach %>
          </tbody>
        </table>
      </div>


      <!-- TRANSACTION DETAILS (NEW PAYMENT SUMMARY) -->
      <div class="section-card">
        <div class="section-title">Payment Summary</div>
        <%if $payment %>
            <div class="row mb-2">
              <div class="col-md-4"><strong>Payment Mode:</strong> <%$payment.payment_method|replace:'_':' '|ucfirst%></div>
              <div class="col-md-4"><strong>Payment Status:</strong> 
                <%assign var="p_status" value=$payment.payment_status|lower%>
                <span class="badge bg-label-<%if $p_status eq 'completed' or $p_status eq 'paid'%>success<%elseif $p_status eq 'failed'%>danger<%else%>warning<%/if%>">
                    <%$payment.payment_status|ucfirst%>
                </span>
              </div>
              <div class="col-md-4"><strong>Paid Date:</strong> <%$payment.paid_date|date_format:"%d %b %Y, %I:%M %p"|default:'N/A'%></div>
            </div>

            <div class="row">
              <div class="col-md-4"><strong>Transaction ID:</strong> <%$payment.transaction_id|default:($payment.gateway_transaction_id|default:'N/A')%></div>
              <div class="col-md-4"><strong>Paid Amount:</strong> <span class="text-success fw-bold">₹<%$payment.amount|number_format:2%></span></div>
              <div class="col-md-4"><strong>Gateway:</strong> <%$payment.payment_gateway|default:'N/A'%></div>
            </div>
        <%else %>
            <div class="row">
                <div class="col-12 text-muted">
                    <i class="ti ti-info-circle me-1"></i> No detailed transaction record found. Defaulting to Order payment method: <strong><%$order.payment_method|replace:'_':' '|ucfirst%></strong>
                </div>
            </div>
        <%/if %>
      </div>

      <!-- ORDER TOTALS -->
      <div class="section-card mb-5">
        <div class="section-title">Order Pricing Summary</div>

        <div class="row mb-1">
          <div class="col-md-4"><strong>Subtotal:</strong> ₹<%$order.total_amount|number_format:2%></div>
          <div class="col-md-4"><strong>Tax Total:</strong> ₹<%$order.tax_amount|number_format:2%></div>
          <div class="col-md-4"><strong>Discount:</strong> ₹<%$order.discount_amount|number_format:2%></div>
        </div>

        <div class="row">
          <div class="col-md-4"><strong>Shipping:</strong> ₹<%$order.shipping_charge|number_format:2%></div>
          <div class="col-md-4"><strong>Grand Total:</strong> 
            <span class="text-success fw-bold">₹<%$order.net_amount|number_format:2%></span>
          </div>
          <div class="col-md-4"><strong>Payment Status:</strong> <%$order.payment_status|default:'Unpaid'%></div>
        </div>
      </div>

    </div>
  </div>
</div>

<script type="text/javascript">
var base_url = <%$base_url|@json_encode%>
</script>
