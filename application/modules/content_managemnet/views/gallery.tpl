
<div class="content-wrapper">
  <!-- Content -->

  <div class="container-xxl flex-grow-1 container-p-y">
    <nav aria-label="breadcrumb">
      <div class="sub-header-left pull-left breadcrumb">
        <h1>
          Content Management
          <a hijacked="yes" href="javascript:void(0)" class="backlisting-link" title="Gallery Master" >
            <i class="ti ti-chevrons-right" ></i>
            <em >Gallery Master</em></a>
          </h1>
          <br>
          <span >Gallery</span>
        </div>
      </nav>

      <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
        <button type="button" class="btn btn-seconday" data-bs-toggle="modal" data-bs-target="#addGallery" title="Add Image">
          <i class="ti ti-plus"></i>
        </button>
      </div>

      <!-- Add Gallery Modal -->
      <div class="modal fade" id="addGallery" tabindex="-1" role="dialog" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title">Add Image to Gallery</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <form action="<%base_url('add_gallery')%>" method="POST" enctype="multipart/form-data" id="add_gallery" class="add_gallery custom-form">
               <div class="modal-body">
                  <div class="form-group mb-3">
                  	<label for="gallery_image">Gallery Image<span class="text-danger">*</span></label>
                  	<input type="file" name="gallery_image" class="form-control required-input" accept="image/*">
                    <small class="text-muted">Recommended size: 800x600px or similar.</small>
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

      <div class="w-100 mb-4">
          <input type="text" placeholder="Filter Search" class="form-control serarch-filter-input mb-2 mt-2" id="serarch-filter-input">
      </div>

      <!-- Main content -->
      <div class="card mt-4 w-100">
        <div class="table-responsive text-nowrap">
          <table width="100%" border="1" cellspacing="0" cellpadding="0" class="table table-striped" id="gallery_table">
            <thead class="table-dark">
               <tr>
                  <th>Image</th>
                  <th>Status</th>
                  <th>Added Date</th>
                  <th>Action</th>
               </tr>
            </thead>
            <tbody>
            <%if $gallery%>
                <%assign var='i' value= 1 %>
                <%foreach from=$gallery item=val %>
                   <tr>
                      <td>
                        <img src="<%base_url()%>public/uploads/gallery/<%$val['gallery_image'] %>" alt="Gallery Image" class="rounded shadow-sm" width="150" style="object-fit: cover; aspect-ratio: 16/9;">
                      </td>
                      <td>
                          <%if $val['status'] eq 'Active'%>
                              <span class="status-badge status-active">Active</span>
                          <%else%>
                              <span class="status-badge status-inactive">Inactive</span>
                          <%/if%>
                      </td>
                      <td class="small text-muted"><%$val['added_date']|date_format:"%d-%m-%Y %H:%M"%></td>
                      <td>
                        <a type="button" class="btn btn-sm btn-icon edit-btn" data-bs-toggle="modal" data-bs-target="#updateGallery<%$i %>" title="Edit">
                          <i class="ti ti-edit text-primary"></i>
                        </a>
                        <span class="btn btn-sm btn-icon delete_gallery_data" title="Delete" data-id="<%$val['gallery_id']%>">
                          <i class="ti ti-trash text-danger"></i>
                        </span>
                        
                        <!-- Update Gallery Modal -->
                        <div class="modal fade" id="updateGallery<%$i %>" tabindex="-1" role="dialog" aria-hidden="true">
                          <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title">Update Gallery Image</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                              </div>
                              <form action="<%base_url('update_gallery')%>" method="POST" enctype="multipart/form-data" id="update_gallery<%$i %>" class="update_gallery update_gallery<%$i %> custom-form">
                                <input type="hidden" name="gallery_id" value="<%$val['gallery_id']%>">
                                <input type="hidden" name="hidden_gallery_image" value="<%$val['gallery_image']%>">
                                <div class="modal-body">
                                  <div class="form-group mb-3 text-center">
                                    <label class="d-block text-start mb-2">Current Image</label>
                                    <img src="<%base_url()%>public/uploads/gallery/<%$val['gallery_image'] %>" alt="Gallery Image" class="img-fluid rounded mb-3 border" style="max-height: 150px;">
                                    <input type="file" name="gallery_image" class="form-control" accept="image/*">
                                  </div>
                                  <div class="form-group mb-3">
                                    <label for="status">Status</label>
                                    <select name="status" class="form-control select2">
                                      <option value="Active" <%if $val['status'] eq 'Active'%>selected<%/if%>>Active</option>
                                      <option value="Inactive" <%if $val['status'] eq 'Inactive'%>selected<%/if%>>Inactive</option>
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
                      </td>
                   </tr>
                   <%assign var='i' value=$i+1 %>
                <%/foreach%>
            <%/if%>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <script type="text/javascript">
    var base_url = <%$base_url|@json_encode%>
    </script>
    <script src="<%$base_url%>public/js/admin_panel/gallery.js"></script>
