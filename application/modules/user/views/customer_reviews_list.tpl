<div class="content-wrapper">
   <div class="container-xxl flex-grow-1 container-p-y">
      <nav aria-label="breadcrumb">
         <div class="sub-header-left pull-left breadcrumb">
            <h1>
               Customer
               <a hijacked="yes" href="javascript:void(0)" class="backlisting-link" title="Back to Customer Listing">
               <i class="ti ti-chevrons-right"></i>
               <em>Customer Reviews</em></a>
            </h1>
            <br>
            <span>Internal Feedback</span>
         </div>
      </nav>

      <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
         <button type="button" class="btn btn-seconday" id="add-review-btn" title="Add Customer Review">
            <i class="ti ti-plus"></i>
         </button>
      </div>

      <div class="w-100">
         <input type="text" name="reason" placeholder="Filter Search" class="form-control serarch-filter-input m-3 me-0" id="review-search-filter">
      </div>

      <div class="card p-0 mt-4 w-100">
         <div class="card-datatable table-responsive">
            <table class="table table-striped" id="reviews-list-table">
               <thead class="table-light">
                  <tr>
                     <th>Customer Name</th>
                     <th>Rating</th>
                     <th>Comment</th>
                     <th>Reviewer Type</th>
                     <th class="text-center">Status</th>
                     <th>Created Date</th>
                     <th class="text-center">Action</th>
                  </tr>
               </thead>
               <tbody>
                  <!-- DataTables populate -->
               </tbody>
            </table>
         </div>
      </div>
   </div>
</div>

<!-- Add/Edit Review Modal -->
<div class="modal fade" id="reviewModal" tabindex="-1" aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="modalTitle">Add Customer Review</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <form id="reviewForm" method="POST" action="<%base_url('save_customer_review')%>">
            <input type="hidden" name="review_id" id="review_id">
            <div class="modal-body">
               <div class="mb-3">
                  <label class="form-label">Select Customer <span class="text-danger">*</span></label>
                  <select name="customer_id" id="customer_id" class="form-select required-input">
                     <option value="">Choose Customer...</option>
                     <%foreach from=$customers item=cust%>
                        <option value="<%$cust['id']%>"><%$cust['customer_name']%> (<%$cust['customer_code']%>)</option>
                     <%/foreach%>
                  </select>
               </div>
               <div class="mb-3">
                  <label class="form-label">Reviewer Type <span class="text-danger">*</span></label>
                  <select name="reviewer_type" id="reviewer_type" class="form-select required-input">
                     <option value="admin">Admin</option>
                     <option value="staff">Staff</option>
                     <option value="system">System</option>
                  </select>
               </div>
               <div class="mb-3">
                  <label class="form-label">Rating <span class="text-danger">*</span></label>
                  <div class="rating-input d-flex gap-2 fs-3 text-warning">
                     <i class="ti ti-star star-btn" data-value="1"></i>
                     <i class="ti ti-star star-btn" data-value="2"></i>
                     <i class="ti ti-star star-btn" data-value="3"></i>
                     <i class="ti ti-star star-btn" data-value="4"></i>
                     <i class="ti ti-star star-btn" data-value="5"></i>
                  </div>
                  <input type="hidden" name="rating" id="rating_value" class="required-input" value="">
               </div>
               <div class="mb-3">
                  <label class="form-label">Comment <span class="text-danger">*</span></label>
                  <textarea name="comment" id="comment" class="form-control required-input" rows="4" placeholder="Enter internal feedback..."></textarea>
               </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
               <button type="submit" class="btn btn-primary" id="save-review-btn">Save Review</button>
            </div>
         </form>
      </div>
   </div>
</div>

<script type="text/javascript">
   var base_url = <%$base_url|@json_encode%>;
</script>
<script src="<%$base_url%>public/js/admin_panel/customer_reviews.js"></script>

<style>
   .star-btn { cursor: pointer; transition: transform 0.2s; }
   .star-btn:hover { transform: scale(1.2); }
   .star-btn.active { color: #ffab00 !important; }
</style>
