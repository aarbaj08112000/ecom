
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
          <span >Customer List</span>
        </div>
      </nav>

      <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
        <%* <button class="btn btn-seconday" type="button" id="downloadCSVBtn" title="Download CSV"><i class="ti ti-file-type-csv"></i></button>
        <button class="btn btn-seconday" type="button" id="downloadPDFBtn" title="Download PDF"><i class="ti ti-file-type-pdf"></i></button>
        <button class="btn btn-seconday filter-icon" type="button"><i class="ti ti-filter" ></i></i></button>
        <button class="btn btn-seconday" type="button"><i class="ti ti-refresh reset-filter"></i></button>  *%>
       

      </div>
    
      <div class="w-100">
            <input type="text" name="reason" placeholder="Filter Search" class="form-control serarch-filter-input m-3 me-0" id="serarch-filter-input" fdprocessedid="bxkoib">
        </div>

       <!-- Main content -->
       <div class="card p-0 mt-4 w-100">
         <div class="card-datatable table-responsive">
           <table class="table table-striped" id="customer-list-table">
               <thead class="table-light">
                 <tr>
                    <!-- <th>Sr No</th> -->
                    <th>Image</th>
                    <th>customer code</th>
                    <th>customer name</th>
                    <th>Mobile Number</th>
                    <th>Email</th>
                    <th>GST No.</th>
                    <th>PAN No.</th>
                    <th>Status</th>
                    <th>Total Order</th>
                    <th class="text-center">Action</th>
                 </tr>
              </thead>
              <tbody>
                <!-- DataTables will populate this dynamically -->
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

    <script src="<%$base_url%>public/js/admin_panel/customer_list.js"></script>
