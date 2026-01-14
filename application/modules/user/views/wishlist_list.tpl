
<div class="content-wrapper">
  <!-- Content -->

  <div class="container-xxl flex-grow-1 container-p-y">
    <nav aria-label="breadcrumb">
      <div class="sub-header-left pull-left breadcrumb">
        <h1>
           Wishlist
          <a hijacked="yes" href="javascript:void(0)" class="backlisting-link" title="Back to Dashboard" >
            <i class="ti ti-chevrons-right" ></i>
            <em >Customers</em></a>
          </h1>
          <br>
          <span >Wishlist Management</span>
        </div>
      </nav>

      <div class="w-100">
            <input type="text" name="reason" placeholder="Filter Search" class="form-control serarch-filter-input m-3 me-0" id="serarch-filter-input">
        </div>

      <!-- Main content -->
      <div class="card p-0 mt-4 w-100">
        <div class="card-datatable table-responsive">
          <table class="table table-striped" id="wishlist_table">
            <thead class="table-light">
               <tr>
                  <th>Product Image</th>
                  <th>Product Name</th>
                  <th>User Name</th>
                  <th>User Email</th>
                  <th>Price</th>
                  <th>Added Date</th>
                  <th>Status</th>
               </tr>
            </thead>
            <tbody>
              <!-- DataTables will populate this -->
            </tbody>
           </table>
        </div>
      </div>

      <div class="content-backdrop fade"></div>
    </div>

    <script type="text/javascript">
    var base_url = <%$base_url|@json_encode%>
    </script>

    <script src="<%$base_url%>public/js/admin_panel/wishlist.js"></script>
