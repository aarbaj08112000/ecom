
<div class="content-wrapper">
  <!-- Content -->

  <div class="container-xxl flex-grow-1 container-p-y">
 

    <nav aria-label="breadcrumb">
      <div class="sub-header-left pull-left breadcrumb">
        <h1>
           Reports & Analytics
          <a hijacked="yes" href="javascript:void(0)" class="backlisting-link" title="Back to Issue Request Listing" >
            <i class="ti ti-chevrons-right" ></i>
            <em >Reports & Analytics</em></a>
          </h1>
          <br>
          <span >Product Performance Report</span>
        </div>
      </nav>

      <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
        <button class="btn btn-seconday" type="button" id="downloadCSVBtn" title="Download CSV"><i class="ti ti-file-type-csv"></i></button>
        <button class="btn btn-seconday" type="button" id="downloadPDFBtn" title="Download PDF"><i class="ti ti-file-type-pdf"></i></button>
       <%*  <button class="btn btn-seconday filter-icon" type="button"><i class="ti ti-filter" ></i></i></button>
        <button class="btn btn-seconday" type="button"><i class="ti ti-refresh reset-filter"></i></button>  *%>
       

      </div>
    
      <div class="w-100">
            <input type="text" name="reason" placeholder="Filter Search" class="form-control serarch-filter-input m-3 me-0" id="serarch-filter-input" fdprocessedid="bxkoib">
        </div>

      <!-- Main content -->
      <div class="card p-0 mt-4 w-100">
        <div class="">

          <div class="table-responsive text-nowrap">
            <table class="table table-striped align-middle" id="sales_report" style="border-collapse: collapse;">
            
             <thead class="table-dark">
                <tr>
                    <th>#</th>
                    <th>Product</th>
                    <th>Category</th>
                    <th>Total Orders</th>
                    <th>Qty Sold</th>
                    <th>Revenue (₹)</th>
                    <th>Return Qty</th>
                    <th>Return %</th>
                    <th>Status</th>
                    <th class="text-center">Action</th>
                </tr>
            </thead>

                <tbody id="product_performance_body">
                </tbody>

            </table>
            </div>

        </div>
        <!--/ Responsive Table -->
      </div>
      <!-- /.col -->

      <div class="content-backdrop fade"></div>
    </div>

    <script type="text/javascript">
    var base_url = <%$base_url|@json_encode%>
    </script>

    <script src="<%$base_url%>public/js/admin_panel/product_performance_report.js"></script>
