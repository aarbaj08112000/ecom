
<style>
.badge-status {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 100px;       /* FIXED WIDTH */
    padding: 6px 0;     /* SAME HEIGHT */
    font-size: 13px;
    border-radius: 20px;
    text-align: center;
}

</style>
<div class="content-wrapper">
  <!-- Content -->

  <div class="container-xxl flex-grow-1 container-p-y">
 

    <nav aria-label="breadcrumb">
      <div class="sub-header-left pull-left breadcrumb">
        <h1>
          Product
          <a hijacked="yes" href="javascript:void(0)" class="backlisting-link" title="Back to Issue Request Listing" >
            <i class="ti ti-chevrons-right" ></i>
            <em >Manage Product</em></a>
          </h1>
          <br>
          <span >Product Listing</span>
        </div>
      </nav>

      <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
         <button class="btn btn-seconday" type="button" id="downloadCSVBtn" title="Download CSV"><i class="ti ti-file-type-csv"></i></button>
        <button class="btn btn-seconday" type="button" id="downloadPDFBtn" title="Download PDF"><i class="ti ti-file-type-pdf"></i></button>
        <%*<button class="btn btn-seconday filter-icon" type="button"><i class="ti ti-filter" ></i></i></button>
        <button class="btn btn-seconday" type="button"><i class="ti ti-refresh reset-filter"></i></button> 
        
      *%>
        
        <a href="add_product" ><button type="button" class="btn btn-seconday"  title="Add Product">
        <i class="ti ti-plus"></i></button></a>
        

       

      </div>
     
      <div class="w-100">
            <input type="text" name="reason" placeholder="Filter Search" class="form-control serarch-filter-input m-3 me-0" id="serarch-filter-input" fdprocessedid="bxkoib">
        </div>

      <!-- Main content -->
      <div class="card p-0 mt-4 w-100">
        <div class="">

          <div class="table-responsive text-nowrap">
        <table width="100%" border="1" cellspacing="0" cellpadding="0" class="table table-striped" style="border-collapse: collapse;" border-color="#e1e1e1" id="process">
         <thead class="table-light">
            <tr>
                  <th width="80">Image</th>
                  <th>Product Name</th>
                  <th>Description</th>
                  <th>Stock</th>
                  <th>Unit</th>
                  <th>Price</th>
                  <th>Status</th>
                  <th width="140">Action</th>
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

    <script src="<%$base_url%>public/js/admin_panel/product_list.js"></script>
