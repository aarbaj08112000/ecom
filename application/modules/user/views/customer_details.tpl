   
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
      border-left: 4px solid #dc3545;
      padding-left: 10px;
    }
    .table thead {
      background: #dc3545;
      color: #fff;
    }
    .badge-active {
      background: #28a745;
      font-size: 12px;
    }
    .badge-inactive {
      background: #dc3545;
      font-size: 12px;
    }
  </style>
<div class="content-wrapper">
  <!-- Content -->

  <div class="container-xxl flex-grow-1 container-p-y">
 

    <nav aria-label="breadcrumb">
      <div class="sub-header-left pull-left breadcrumb">
        <h1>
           Customer
          <a hijacked="yes" href="javascript:void(0)" class="backlisting-link" title="Back to Issue Request Listing" >
            <i class="ti ti-chevrons-right" ></i>
            <em >Customer</em></a>
          </h1>
          <br>
          <span >Customer Details</span>
        </div>
      </nav>
      <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
         <a href="<%base_url('customer_edit/')%><%$customer['id']%>" class="btn btn-primary" title="Edit Profile">
            <i class="ti ti-edit me-1"></i> Edit Profile
         </a>
         <a href="<%base_url('customer_list')%>"  class="btn btn-seconday" title="Back To Customer Listing">
            <i class="ti ti-arrow-left"></i>
        </a>
        </div>
      <!-- Main content -->
<div class="container">

  <!-- Customer Info -->
  <div class="section-card">
  <div class="section-title">Customer Information</div>

  <div class="row align-items-center">
    
   <div class="col-md-3 text-center">
      <%if $customer['profile_image'] %>
          <img src="<%$base_url%>public/images/customers/<%$customer['profile_image']%>" 
               alt="Customer Photo" width="140" height="140" class="rounded-circle border shadow-sm" style="object-fit: cover;">
      <%else%>
          <img src="https://ui-avatars.com/api/?name=<%$customer['customer_name']|urlencode%>&background=random&color=fff&size=140" 
               alt="Customer Photo" width="140" height="140" class="rounded-circle border shadow-sm">
      <%/if%>
    </div>
    <!-- LEFT SIDE: CUSTOMER INFO -->
    <div class="col-md-9">
      <div class="row mb-2">
        <div class="col-md-4"><strong>Customer Code:</strong> <%$customer['customer_code']%></div>
        <div class="col-md-4"><strong>Name:</strong> <%$customer['customer_name']%></div>
        <div class="col-md-3"><strong>Status:</strong> <span class="badge <%if $customer['status'] == 'Active'%>badge-active<%else%>badge-inactive<%/if%>"><%$customer['status']%></span></div>
      </div>

      <div class="row mb-2">
        <div class="col-md-4"><strong>Mobile:</strong> <%$customer['mobile_no']%></div>
        <div class="col-md-4"><strong>Email:</strong> <%$customer['email']%></div>
      </div>

      <div class="row mb-2">
        <div class="col-md-4"><strong>GST No:</strong> <%$customer['gst_no']%></div>
        <div class="col-md-4"><strong>PAN No:</strong> <%$customer['pan_no']%></div>
      </div>
    </div>

  </div>
</div>


  <!-- Address List -->
  <div class="section-card">
    <div class="section-title">Address Details</div>
    <table class="table table-bordered table-striped">
      <thead>
        <tr>
          <th>#</th>
          <th>Address</th>
          <th>City</th>
          <th>State</th>
          <th>Pincode</th>
          <th>Type</th>
          <th>Status</th>
        </tr>
      </thead>
      <tbody>
        <%if count($addresses) > 0%>
          <%foreach from=$addresses item=addr name=addr_loop%>
          <tr>
            <td><%$smarty.foreach.addr_loop.iteration%></td>
            <td><%$addr['address']%></td>
            <td><%$addr['city']%></td>
            <td><%$addr['state']%></td>
            <td><%$addr['pincode']%></td>
            <td><span class="badge <%if $addr['address_type'] == 'Billing'%>bg-primary<%else%>bg-info<%/if%>"><%$addr['address_type']%></span></td>
            <td><span class="badge <%if $addr['status'] == 'Active'%>badge-active<%else%>badge-inactive<%/if%>"><%$addr['status']%></span></td>
          </tr>
          <%/foreach%>
        <%else%>
          <tr>
            <td colspan="7" class="text-center">No addresses found.</td>
          </tr>
        <%/if%>
      </tbody>
    </table>
  </div>

  <!-- Bank List -->
  <div class="section-card mb-4">
    <div class="section-title">Bank Details</div>
    <table class="table table-bordered table-striped">
      <thead>
        <tr>
          <th>#</th>
          <th>Bank Name</th>
          <th>Account No</th>
          <th>IFSC</th>
          <th>Branch</th>
          <th>Status</th>
        </tr>
      </thead>
      <tbody>
        <%if count($banks) > 0%>
          <%foreach from=$banks item=bank name=bank_loop%>
          <tr>
            <td><%$smarty.foreach.bank_loop.iteration%></td>
            <td><%$bank['bank_name']%></td>
            <td><%$bank['account_no']%></td>
            <td><%$bank['ifsc_code']%></td>
            <td><%$bank['branch_name']%></td>
            <td><span class="badge <%if $bank['status'] == 'Active'%>badge-active<%else%>badge-inactive<%/if%>"><%$bank['status']%></span></td>
          </tr>
          <%/foreach%>
        <%else%>
          <tr>
            <td colspan="6" class="text-center">No bank details found.</td>
          </tr>
        <%/if%>
      </tbody>
    </table>
  </div>

  <!-- Internal Reviews Section -->
  <div class="section-card mb-5">
    <div class="section-title">Internal Feedback & Reviews</div>
    <div class="table-responsive">
        <table class="table table-hover border">
            <thead class="bg-light">
                <tr>
                    <th style="width: 150px;">Rating</th>
                    <th>Comment</th>
                    <th>Reviewer</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <%if count($internal_reviews) > 0%>
                    <%foreach from=$internal_reviews item=rev%>
                    <tr>
                        <td class="text-warning">
                            <%for $i=1 to 5%>
                                <%if $i <= $rev['rating']%>
                                    <i class="ti ti-star-filled"></i>
                                <%else%>
                                    <i class="ti ti-star"></i>
                                <%/if%>
                            <%/for%>
                        </td>
                        <td>
                            <div class="text-wrap" style="min-width: 250px;">
                                <%$rev['comment']%>
                            </div>
                        </td>
                        <td><span class="badge bg-label-secondary text-capitalize"><%$rev['reviewer_type']%></span></td>
                        <td><small class="text-muted"><%$rev['created_at']|date_format:"%d %b %Y, %H:%M"%></small></td>
                    </tr>
                    <%/foreach%>
                <%/else%>
                    <tr>
                        <td colspan="4" class="text-center text-muted py-4">
                            <i class="ti ti-message-off fs-1 d-block mb-2"></i>
                            No internal reviews found for this customer.
                        </td>
                    </tr>
                <%/if%>
            </tbody>
        </table>
    </div>
  </div>

</div>



      <!-- /.col -->


    </div>


    <script type="text/javascript">
    var base_url = <%$base_url|@json_encode%>
    </script>

    <script src="<%$base_url%>public/js/admin_panel/brands.js">"></script>
