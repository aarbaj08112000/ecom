
<div class="content-wrapper">
  <!-- Content -->

  <div class="container-xxl flex-grow-1 container-p-y">
 

    <nav aria-label="breadcrumb">
      <div class="sub-header-left pull-left breadcrumb">
        <h1>
           Manage Product
          <a hijacked="yes" href="javascript:void(0)" class="backlisting-link" title="Back to Issue Request Listing" >
            <i class="ti ti-chevrons-right" ></i>
            <em >Categories</em></a>
          </h1>
          <br>
          <span >Categories</span>
        </div>
      </nav>

      <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
        <a href="javascript:void(0)" id="downloadCSVBtn" class="btn btn-seconday" title="Download CSV"><i class="ti ti-file-type-csv"></i></a>
        <a href="javascript:void(0)" id="downloadPDFBtn" class="btn btn-seconday" title="Download PDF"><i class="ti ti-file-type-pdf"></i></a>
        
        <button type="button" class="btn btn-seconday" data-bs-toggle="modal" data-bs-target="#addCategoriesModal" title="Add Category">
          <i class="ti ti-plus"></i>
        </button>
      </div>

      <!-- Add Category Modal -->
      <div class="modal fade" id="addCategoriesModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="addModalLabel">Add Category</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <form action="<%base_url('add_categories')%>" method="POST" id="addCategoriesForm" class="addCategories custom-form">
               <div class="modal-body">
                  <div class="form-group mb-3">
                  	<label>Category Name<span class="text-danger">*</span></label>
                  	<input type="text" name="category_name" placeholder="Enter Category Name" class="form-control required-input">
                  </div>
                  
				   <div class="form-group mb-3">
                  		<label>Parent Category</label>
                  	 	<select name="parent_category_id" class="form-control select2" id="parent_category_id">
                         <option value="">Select Parent Category</option>  
                         <%foreach from=$categories item=val %>
		                	<option value="<%$val['category_id'] %>"><%$val['category_name'] %></option>
                         <%/foreach%>
		             	</select>
                  	</div>
               </div>
               <div class="modal-footer">
                 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                 <button type="submit" class="btn btn-primary">Save changes</button>
               </div>
               </form>
            </div>
         </div>
      </div>

      <!-- Update Category Modal -->
      <div class="modal fade" id="updateCategoriesModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="updateModalLabel">Update Category</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <form action="<%base_url('update_categories')%>" method="POST" id="updateCategoriesForm" class="update_categories custom-form">
                  <input type="hidden" name="category_id" id="edit_category_id">
                  <div class="modal-body">
                     <div class="form-group mb-3">
                        <label>Category Name<span class="text-danger">*</span></label>
                        <input type="text" name="category_name" id="edit_category_name" placeholder="Enter Category Name" class="form-control required-input">
                     </div>
                     <div class="form-group mb-3">
                        <label>Parent Category</label>
                        <select name="parent_category_id" class="form-control select2" id="edit_parent_category_id">
                           <option value="">Select Parent Category</option>  
                           <%foreach from=$categories item=p_val %>
                               <option value="<%$p_val['category_id'] %>"><%$p_val['category_name'] %></option>
                           <%/foreach%>
                        </select>
                     </div>
                     <div class="form-group mb-3">
                        <label>Status<span class="text-danger">*</span></label>
                        <select name="status" class="form-control select2 required-input" id="edit_status">
                           <option value="Active">Active</option>
                           <option value="Inactive">Inactive</option>
                        </select>
                     </div>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                     <button type="submit" class="btn btn-primary">Save changes</button>
                  </div>
               </form>
            </div>
         </div>
      </div>

      <div class="w-100">
          <input type="text" placeholder="Search categories..." class="form-control serarch-filter-input mt-3 mb-3" id="serarch-filter-input">
      </div>

      <!-- Main content -->
      <div class="card p-0 mt-4 w-100">
          <div class="table-responsive text-nowrap">
            <table width="100%" border="1" cellspacing="0" cellpadding="0" class="table table-striped" id="categories">
              <thead>
                 <tr>
                    <th>Category Name</th>
                    <th>Parent Category</th>
                    <th>Status</th>
                    <th width="100">Action</th>
                 </tr>
              </thead>
              <tbody>
                <!-- DataTables will populate this dynamically -->
              </tbody>
           </table>
          </div>
      </div>
      <!-- /.col -->

      <div class="content-backdrop fade"></div>
    </div>


    <script type="text/javascript">
    var base_url = <%$base_url|@json_encode%>
    </script>

    <script src="<%$base_url%>public/js/admin_panel/categories.js"></script>
