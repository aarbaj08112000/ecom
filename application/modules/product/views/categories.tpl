
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
        <%* <button class="btn btn-seconday" type="button" id="downloadCSVBtn" title="Download CSV"><i class="ti ti-file-type-csv"></i></button>
        <button class="btn btn-seconday" type="button" id="downloadPDFBtn" title="Download PDF"><i class="ti ti-file-type-pdf"></i></button>
        <button class="btn btn-seconday filter-icon" type="button"><i class="ti ti-filter" ></i></i></button>
        <button class="btn btn-seconday" type="button"><i class="ti ti-refresh reset-filter"></i></button> *%>
        
        <button type="button" class="btn btn-seconday" data-bs-toggle="modal" data-bs-target="#addCategories" title="Add process">
       <i class="ti ti-plus"></i>
        </button>
       

      </div>
      <div class="modal fade" id="addCategories" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog  modal-dialog-centered" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Add Categories</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">

                  </button>
               </div>
               <form action="<%base_url('add_categories')%>" method="POST" enctype="multipart/form-data" id="addCategories" class="addCategories custom-form">
               <div class="modal-body">
                  <div class="form-group">
                  </div>
                  <div class="form-group">
                  	<label for="on click url">Category Name<span class="text-danger">*</span></label> <br>
                  	<input  type="text" name="category_name" placeholder="Enter Category Name" class="form-control required-input" value="" >
                  </div>
                  

				   <div class="form-group">
                  		<label for="on click url">Parent Categories</label> <br>
                  	 	<select name="parent_category_id" class="form-control select2 required-input" id="parent_category_id">
                         <option value="" disabled selected>Select Parent Category</option>  
                         <%foreach from=$categories item=val %>
		                	<option value="<%$val['category_id'] %>"><%$val['category_name'] %></option>
                         <%/foreach%>
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

      <!-- Main content -->
      <div class="card p-0 mt-4 w-100">
        <div class="">

          <div class="table-responsive text-nowrap">
            <table width="100%" border="1" cellspacing="0" cellpadding="0" class="table table-striped" style="border-collapse: collapse;" border-color="#e1e1e1" id="categories">
              <thead>
                 <tr>
                    <!-- <th>Sr No</th> -->
                    <th>Category Name</th>
                    <th>Parent Category</th>
                    <th>Status</th>
                    <th>Action</th>
                 </tr>
              </thead>
              <tbody>
              <%if ($categories) %>
                      <%assign var='i' value= 1 %>
                      <%foreach from=$categories item=val %>
                     <tr>
                        <!-- <td><%$i %></td> -->
                        <td><%$val['category_name'] %></td>
                        <td><%if $val['parent_name'] != '' %><%$val['parent_name'] %><%else %> -- <%/if %></td>


                        <td>
                            <span class="status-badge <%if $val['status'] == 'Active' %>status-active<%else %>status-inactive<%/if %>">
                                <%$val['status'] %>
                            </span>
                        </td>
                        <td>
                          
                        	<a type="button" class="" data-bs-toggle="modal" data-bs-target="#updateGroup<%$i %>" title="Edit">
					       		<i class="ti ti-edit edit-part" ></i>
					        </a>
                       <span class="delete_data" title="Delete Record" data-id="<%$val['category_id']%>"><i class="ti ti-trash"></i>
                       </span>
                        	
                        	<div class="modal fade" id="updateGroup<%$i %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						         <div class="modal-dialog  modal-dialog-centered" role="document">
						            <div class="modal-content">
						               <div class="modal-header">
						                  <h5 class="modal-title" id="exampleModalLabel">Update Categories</h5>
						                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">

						                  </button>
						               </div>
						               <form action="<%base_url('update_categories')%>" method="POST" enctype="multipart/form-data" id="update_categories<%$i %>" class="update_categories update_categories<%$i %> custom-form">
						               	<input type="hidden" name="category_id" value="<%$val['category_id']%>">
						               <div class="modal-body">
						                  <div class="form-group">
						                  </div>
						                  <div class="form-group">
						                  	<label for="on click url">Category Name<span class="text-danger">*</span></label> <br>
						                  	<input  type="text" name="category_name" placeholder="Enter Category Name" class="form-control required-input" value="<%$val['category_name'] %>" >
						                  </div>
						                  <div class="form-group">
						                  	<label for="on click url">Parent Category</label> <br>
                                       <select name="parent_category_id" class="form-control select2 " id="parent_category_id">
                                       <option value="" disabled selected>Select Parent Category</option>  
                                       <%foreach from=$categories item=p_val %>
                                           <option value="<%$p_val['category_id'] %>" <%if $p_val['category_id'] eq $val['parent_category_id']%>selected<%/if%>>
                                               <%$p_val['category_name'] %>
                                           </option>
                                       <%/foreach%>
                                   </select>
                                   
			
                                         </div>

										   <div class="form-group">
						                  		<label for="on click url">Status<span class="text-danger">*</span></label> <br>
						                  	 	<select name="status" class="form-control select2 required-input" id="status">
								                	<option value="Active" <%if $val['status'] eq 'Active'%>selected<%/if%>>Active</option>
								                	<option value="Inactive" <%if $val['status'] eq 'Inactive'%>selected<%/if%>>Inactive</option>
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
                        </td>
                        
                     </tr>
                  <%assign var='i' value=$i+1 %>
                  <%/foreach%>
                  <%/if%>
              
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

    <script src="<%$base_url%>public/js/admin_panel/categories.js">"></script>
