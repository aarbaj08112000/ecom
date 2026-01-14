
<div class="content-wrapper">
  <!-- Content -->

  <div class="container-xxl flex-grow-1 container-p-y">
 

    <nav aria-label="breadcrumb">
      <div class="sub-header-left pull-left breadcrumb">
        <h1>
           Content Management
          <a hijacked="yes" href="javascript:void(0)" class="backlisting-link" title="Back to Issue Request Listing" >
            <i class="ti ti-chevrons-right" ></i>
            <em >Testimonials</em></a>
          </h1>
          <br>
          <span >Testimonials</span>
        </div>
      </nav>

      <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
        <%* <button class="btn btn-seconday" type="button" id="downloadCSVBtn" title="Download CSV"><i class="ti ti-file-type-csv"></i></button>
        <button class="btn btn-seconday" type="button" id="downloadPDFBtn" title="Download PDF"><i class="ti ti-file-type-pdf"></i></button>
        <button class="btn btn-seconday filter-icon" type="button"><i class="ti ti-filter" ></i></i></button>
        <button class="btn btn-seconday" type="button"><i class="ti ti-refresh reset-filter"></i></button> *%>
        
        <button type="button" class="btn btn-seconday" data-bs-toggle="modal" data-bs-target="#addTestimonials" title="Add Testimonials">
            <i class="ti ti-plus"></i>
        </button>
    
      </div>
      <div class="modal fade" id="addTestimonials" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog  modal-dialog-centered" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Add Testimonials</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">

                  </button>
               </div>
               <form action="<%base_url('add_testimonials')%>" method="POST" enctype="multipart/form-data" id="add_testimonials" class="add_testimonials custom-form">
               <div class="modal-body">
                 
                  <div class="form-group">
                  	<label for="on click url">Name<span class="text-danger">*</span></label> <br>
                  	<input  type="text" name="name" placeholder="Enter Name" class="form-control required-input"  >
                  </div>
                  <div class="form-group">
                  	<label for="on click url">Designation<span class="text-danger">*</span></label> <br>
                  	<input  type="text" name="designation" placeholder="Enter designation" class="form-control required-input"  >
                  </div>
                  <div class="form-group">
                  	<label for="on click url">Message<span class="text-danger">*</span></label> <br>
                  	<textarea class="form-control required-input" id="message" name="message" placeholder="Enter message"></textarea>
                  </div>

                  <div class="form-group">
                        <label for="on click url">Image<span class="text-danger">*</span></label> <br>
                        <input  type="file" name="image" placeholder="Enter image" class="form-control required-input" value="" >
                    </div>

                    <div class="form-group">
                    <label for="on click url">Rating<span class="text-danger">*</span></label> <br>
                    <select name="rating" class="form-control required-input">
                    <option value="">Select Rating</option>
                    <option value="1">1 ⭐</option>
                    <option value="2">2 ⭐⭐</option>
                    <option value="3">3 ⭐⭐⭐</option>
                    <option value="4">4 ⭐⭐⭐⭐</option>
                    <option value="5">5 ⭐⭐⭐⭐⭐</option>
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
            <table width="100%" border="1" cellspacing="0" cellpadding="0" class="table table-striped" style="border-collapse: collapse;" border-color="#e1e1e1" id="attributes">
              <thead class="table-dark">
                 <tr>
                    <!-- <th>Sr No</th> -->
                    <th>Image </th>
                    <th>Name </th>
                    <th>Designation</th>
                    <th>Message</th>
                    <th>Rating</th>
                    <th>Status</th>
                    <th>Action</th>
                 </tr>
              </thead>
              <tbody>
              <%if ($testimonials) %>
                      <%assign var='i' value= 1 %>
                      <%foreach from=$testimonials item=val %>
                     <tr>
                        <!-- <td><%$i %></td> -->
                        <td><img src="<%base_url()%>public/uploads/testimonials/<%$val['image'] %>" atr="<%$val['image'] %>" width="50" height="50">
                        </td>
                        <td><%$val['name'] %></td>
                        <td><%$val['designation'] %></td>
                        <td><%$val['message'] %></td>
                        <td><%$val['rating'] %></td>
                       
                        <td>
                            <%if $val['status'] eq 'Active'%>
                                <span class="status-badge status-active">Active</span>
                            <%else%>
                                <span class="status-badge status-inactive">Inactive</span>
                            <%/if%>
                        </td>


                        <td>
                          
                        	<a type="button" class="" data-bs-toggle="modal" data-bs-target="#updateGroup<%$i %>" title="Edit">
                                 <i class="ti ti-edit edit-part" ></i>
                           </a>
                           <span class="delete_data" title="Delete Record" data-id="<%$val['testimonials_id']%>"><i class="ti ti-trash"></i>
                           </span>
                        	
                        	<div class="modal fade" id="updateGroup<%$i %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						         <div class="modal-dialog  modal-dialog-centered" role="document">
						            <div class="modal-content">
						               <div class="modal-header">
						                  <h5 class="modal-title" id="exampleModalLabel">Update Testimonials</h5>
						                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">

						                  </button>
						               </div>
						               <form action="<%base_url('update_testimonials')%>" method="POST" enctype="multipart/form-data" id="update_testimonials<%$i %>" class="update_testimonials update_testimonials<%$i %> custom-form">
						               	<input type="hidden" name="testimonials_id" value="<%$val['testimonials_id']%>">
						               <div class="modal-body">
						                
                                    <div class="form-group">
                                       <label for="on click url">Name<span class="text-danger">*</span></label> <br>
                                       <input  type="text" name="name" placeholder="Enter Name" class="form-control required-input" value="<%$val['name'] %>" >
                                    </div>
                                    <div class="form-group">
                                       <label for="on click url">Designation<span class="text-danger">*</span></label> <br>
                                       <input  type="text" name="designation" placeholder="Enter designation" class="form-control required-input" value="<%$val['designation'] %>" >
                                    </div>
                                    <div class="form-group">
                                       <label for="on click url">Message<span class="text-danger">*</span></label> <br>
                                       <textarea class="form-control required-input" id="message" name="message" placeholder="Enter message"><%$val['message'] %></textarea>
                                    </div>

                                    <div class="form-group">
                                          <label for="on click url">Image</label> <br>
                                          <input  type="file" name="image" placeholder="Enter image" class="form-control "  >
                                          <input  type="hidden" name="hidden_image" placeholder="Enter image" class="form-control required-input" value="<%$val['image'] %>" >
                                    </div>

                                    <div class="form-group">
                                    <label for="on click url">Rating<span class="text-danger">*</span></label> <br>
                                    <select name="rating" class="form-control required-input">
                                    <option value="">Select Rating</option>
                                    <option value="1" <%if $val['rating'] eq '1'%>selected<%/if%>>1 ⭐</option>
                                    <option value="2" <%if $val['rating'] eq '2'%>selected<%/if%>>2 ⭐⭐</option>
                                    <option value="3" <%if $val['rating'] eq '3'%>selected<%/if%>>3 ⭐⭐⭐</option>
                                    <option value="4" <%if $val['rating'] eq '4'%>selected<%/if%>>4 ⭐⭐⭐⭐</option>
                                    <option value="5" <%if $val['rating'] eq '5'%>selected<%/if%>>5 ⭐⭐⭐⭐⭐</option>
                                 </select>
                                 </div>
                                 
						              
										   <div class="form-group">
						                  		<label for="on click url">Status</label> <br>
						                  	 	<select name="status" class="form-control select2 " id="status">
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

    <script src="<%$base_url%>public/js/admin_panel/testimonials.js">"></script>
