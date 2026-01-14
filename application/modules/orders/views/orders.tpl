
<div class="content-wrapper">
  <!-- Content -->

  <div class="container-xxl flex-grow-1 container-p-y">
 

    <nav aria-label="breadcrumb">
      <div class="sub-header-left pull-left breadcrumb">
        <h1>
          Order
          <a hijacked="yes" href="javascript:void(0)" class="backlisting-link" title="Back to Issue Request Listing" >
            <i class="ti ti-chevrons-right" ></i>
            <em >Manage Order</em></a>
          </h1>
          <br>
          <span >Order Listing</span>
        </div>
      </nav>

      <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
      <button class="btn btn-seconday" type="button" id="downloadCSVBtn" title="Download CSV"><i class="ti ti-file-type-csv"></i></button>
        <button class="btn btn-seconday" type="button" id="downloadPDFBtn" title="Download PDF"><i class="ti ti-file-type-pdf"></i></button>
          <%* <button class="btn btn-seconday filter-icon" type="button"><i class="ti ti-filter" ></i></i></button>
        <button class="btn btn-seconday" type="button"><i class="ti ti-refresh reset-filter"></i></button> 
        
      *%>
        
        
        

       

      </div>
      <div class="modal fade" id="addPromo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog  modal-dialog-centered" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Add Group</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">

                  </button>
               </div>
               <form action="<%base_url('user/user/addGroupMaster')%>" method="POST" enctype="multipart/form-data" id="add_group" class="add_group custom-form">
               <div class="modal-body">
                  <div class="form-group">
                  </div>
                  <div class="form-group">
                  	<label for="on click url">Group Name<span class="text-danger">*</span></label> <br>
                  	<input  type="text" name="group_name" placeholder="Enter Group Name" class="form-control required-input" value="" >
                  </div>
                  <div class="form-group">
                  	<label for="on click url">Group Code<span class="text-danger">*</span></label> <br>
                  	<input  type="text" name="group_code" id="group_code" placeholder="Enter Group Code" class="form-control required-input" value="" >
                  </div>

				   <div class="form-group">
                  		<label for="on click url">Status<span class="text-danger">*</span></label> <br>
                  	 	<select name="status" class="form-control select2 required-input" id="status">
		                	<option value="Active">Active</option>
		                	<option value="Inactive">Inactive</option>
		             	</select>
                  	</div>
               </div>
               <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
               <button type="submit" class="btn btn-primary">Save changes</button>
               </form>
               </div>
            </div>
         </div>
      </div>
      <div class="w-100">
            <input type="text" name="reason" placeholder="Filter Search" class="form-control serarch-filter-input m-3 me-0" id="serarch-filter-input" fdprocessedid="bxkoib">
        </div>

      <div class="card p-0 mt-4 w-100">
        <div class="card-datatable table-responsive">
          <table class="table table-striped" id="orders-table">
            <thead class="table-light">
              <tr>
                <th>Order ID</th>
                <th>Customer</th>
                <th>Total</th>
                <th>Net Amount</th>
                <th>Payment</th>
                <th>Status</th>
                <th>Date</th>
                <th width="100">Action</th>
              </tr>
            </thead>
            <tbody>
              <!-- DataTables will populate this -->
            </tbody>
          </table>
        </div>
      </div>
        <!--/ Responsive Table -->
      </div>
      <!-- /.col -->


      <div class="content-backdrop fade"></div>
    </div>
<style>
  .swal2-popup .swal2-title
  {
   padding-top: 25px !important
  }
  .swal2-popup .swal2-select{
    max-width: 80% !important;
  }
</style>

    <script type="text/javascript">
    var base_url = <%$base_url|@json_encode%>
    </script>

    <script src="<%$base_url%>public/js/admin_panel/orders.js"></script>
