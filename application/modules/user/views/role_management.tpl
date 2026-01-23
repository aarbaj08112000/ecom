<div class="content-wrapper">
  <!-- Content -->

  <div class="container-xxl flex-grow-1 container-p-y role-management-page">
 

    <nav aria-label="breadcrumb">
      <div class="sub-header-left pull-left breadcrumb">
        <h1>
          User Management
          <a hijacked="yes" href="javascript:void(0)" class="backlisting-link" title="Back to User Management" >
            <i class="ti ti-chevrons-right" ></i>
            <em >Role Management</em></a>
          </h1>
          <br>
          <span >Role Management</span>
        </div>
      </nav>

      <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
        
        <button type="button" class="btn btn-seconday" data-bs-toggle="modal" data-bs-target="#addRoleModal" title="Add Role">
       <i class="ti ti-plus"></i>
        </button>
       

      </div>
      
      <!-- Add Role Modal -->
      <div class="modal fade" id="addRoleModal" tabindex="-1" role="dialog" aria-labelledby="addRoleModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="addRoleModalLabel">Add Role</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">

                  </button>
               </div>
               <form action="<%base_url('user/role/addRole')%>" method="POST" id="add_role_form" class="add_role_form custom-form">
               <div class="modal-body" style="max-height: 70vh; overflow-y: auto;">
                  <div class="row">
                     <div class="col-md-6">
                        <div class="form-group mb-3">
                           <label for="role_name">Role Name<span class="text-danger">*</span></label>
                           <select name="role_name" id="role_name" class="form-control select2 required-input">
                              <option value="">Select Role Name</option>
                              <option value="Super Admin">Super Admin</option>
                              <option value="Admin">Admin</option>
                              <option value="Vendor">Vendor</option>
                           </select>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <div class="form-group mb-3">
                           <label for="role_description">Role Description</label>
                           <input type="text" name="role_description" id="role_description" placeholder="Enter Role Description" class="form-control" value="" >
                        </div>
                     </div>
                     <div class="col-md-6">
                        <div class="form-group mb-3">
                           <label for="status">Status<span class="text-danger">*</span></label>
                           <select name="status" class="form-control select2 required-input" id="status">
                              <option value="Active">Active</option>
                              <option value="Inactive">Inactive</option>
                           </select>
                        </div>
                     </div>
                  </div>

                  <hr class="my-4">

                  <h5 class="mb-3">Assign Permissions</h5>
                  <p class="text-muted mb-4">Select permissions for each module. Check "Select All" to grant all permissions for a module.</p>

                  <!-- Permissions Table -->
                  <div class="table-responsive">
                     <table class="table table-bordered permission-table">
                        <thead class="table-light">
                           <tr>
                              <th style="width: 25%;">Module/Menu</th>
                              <th class="text-center" style="width: 10%;">
                                 <div class="form-check d-flex justify-content-center align-items-center">
                                    <input class="form-check-input select-all-permissions" type="checkbox" id="select_all_add">
                                    <label class="form-check-label ms-2" for="select_all_add">Add</label>
                                 </div>
                              </th>
                              <th class="text-center" style="width: 10%;">
                                 <div class="form-check d-flex justify-content-center align-items-center">
                                    <input class="form-check-input select-all-permissions" type="checkbox" id="select_all_edit">
                                    <label class="form-check-label ms-2" for="select_all_edit">Edit</label>
                                 </div>
                              </th>
                              <th class="text-center" style="width: 10%;">
                                 <div class="form-check d-flex justify-content-center align-items-center">
                                    <input class="form-check-input select-all-permissions" type="checkbox" id="select_all_view">
                                    <label class="form-check-label ms-2" for="select_all_view">View</label>
                                 </div>
                              </th>
                              <th class="text-center" style="width: 10%;">
                                 <div class="form-check d-flex justify-content-center align-items-center">
                                    <input class="form-check-input select-all-permissions" type="checkbox" id="select_all_list">
                                    <label class="form-check-label ms-2" for="select_all_list">List</label>
                                 </div>
                              </th>
                              <th class="text-center" style="width: 10%;">
                                 <div class="form-check d-flex justify-content-center align-items-center">
                                    <input class="form-check-input select-all-permissions" type="checkbox" id="select_all_export">
                                    <label class="form-check-label ms-2" for="select_all_export">Export</label>
                                 </div>
                              </th>
                              <th class="text-center" style="width: 15%;">
                                 <div class="form-check d-flex justify-content-center align-items-center">
                                    <input class="form-check-input select-all-module" type="checkbox" id="select_all_modules">
                                    <label class="form-check-label ms-2" for="select_all_modules">Select All</label>
                                 </div>
                              </th>
                           </tr>
                        </thead>
                        <tbody id="add_permissions_body">
                           <!-- Product Module -->
                           <tr>
                              <td colspan="7" class="table-secondary fw-bold">
                                 <i class="ti ti-shopping-cart me-2"></i>Product Management
                              </td>
                           </tr>
                           <tr data-module="products">
                              <td class="ps-4">Manage Products</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[products][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[products][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[products][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[products][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[products][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="products">
                              </td>
                           </tr>
                           <tr data-module="categories">
                              <td class="ps-4">Categories</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[categories][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[categories][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[categories][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[categories][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[categories][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="categories">
                              </td>
                           </tr>
                           <tr data-module="brands">
                              <td class="ps-4">Brands</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[brands][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[brands][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[brands][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[brands][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[brands][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="brands">
                              </td>
                           </tr>
                           <tr data-module="attributes">
                              <td class="ps-4">Attributes</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[attributes][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[attributes][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[attributes][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[attributes][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[attributes][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="attributes">
                              </td>
                           </tr>
                           <tr data-module="reviews">
                              <td class="ps-4">Reviews & Ratings</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[reviews][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[reviews][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[reviews][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[reviews][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[reviews][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="reviews">
                              </td>
                           </tr>

                           <!-- Orders Module -->
                           <tr>
                              <td colspan="7" class="table-secondary fw-bold">
                                 <i class="ti ti-truck-delivery me-2"></i>Orders Management
                              </td>
                           </tr>
                           <tr data-module="orders">
                              <td class="ps-4">Orders</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[orders][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[orders][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[orders][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[orders][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[orders][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="orders">
                              </td>
                           </tr>

                           <!-- Customers Module -->
                           <tr>
                              <td colspan="7" class="table-secondary fw-bold">
                                 <i class="ti ti-users me-2"></i>Customer Management
                              </td>
                           </tr>
                           <tr data-module="customers">
                              <td class="ps-4">Customers List</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[customers][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[customers][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[customers][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[customers][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[customers][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="customers">
                              </td>
                           </tr>
                           <tr data-module="customer_reviews">
                              <td class="ps-4">Customer Reviews</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[customer_reviews][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[customer_reviews][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[customer_reviews][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[customer_reviews][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[customer_reviews][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="customer_reviews">
                              </td>
                           </tr>
                           <tr data-module="wishlist">
                              <td class="ps-4">Wishlist</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[wishlist][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[wishlist][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[wishlist][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[wishlist][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[wishlist][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="wishlist">
                              </td>
                           </tr>

                           <!-- Marketing Module -->
                           <tr>
                              <td colspan="7" class="table-secondary fw-bold">
                                 <i class="ti ti-ad-circle me-2"></i>Marketing & Promotions
                              </td>
                           </tr>
                           <tr data-module="coupons">
                              <td class="ps-4">Coupons & Discounts</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[coupons][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[coupons][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[coupons][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[coupons][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[coupons][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="coupons">
                              </td>
                           </tr>
                           <tr data-module="email_marketing">
                              <td class="ps-4">Email Marketing</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[email_marketing][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[email_marketing][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[email_marketing][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[email_marketing][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[email_marketing][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="email_marketing">
                              </td>
                           </tr>

                           <!-- Payments Module -->
                           <tr>
                              <td colspan="7" class="table-secondary fw-bold">
                                 <i class="ti ti-receipt-rupee me-2"></i>Payments
                              </td>
                           </tr>
                           <tr data-module="transactions">
                              <td class="ps-4">Transactions</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[transactions][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[transactions][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[transactions][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[transactions][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[transactions][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="transactions">
                              </td>
                           </tr>
                           <tr data-module="refunds">
                              <td class="ps-4">Refunds</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[refunds][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[refunds][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[refunds][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[refunds][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[refunds][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="refunds">
                              </td>
                           </tr>

                           <!-- Content Management Module -->
                           <tr>
                              <td colspan="7" class="table-secondary fw-bold">
                                 <i class="ti ti-message-plus me-2"></i>Content Management
                              </td>
                           </tr>
                           <tr data-module="banners">
                              <td class="ps-4">Banners & Sliders</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[banners][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[banners][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[banners][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[banners][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[banners][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="banners">
                              </td>
                           </tr>
                           <tr data-module="gallery">
                              <td class="ps-4">Gallery Master</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[gallery][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[gallery][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[gallery][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[gallery][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[gallery][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="gallery">
                              </td>
                           </tr>
                           <tr data-module="blog">
                              <td class="ps-4">Blog Management</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[blog][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[blog][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[blog][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[blog][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[blog][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="blog">
                              </td>
                           </tr>
                           <tr data-module="faq">
                              <td class="ps-4">FAQ Management</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[faq][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[faq][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[faq][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[faq][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[faq][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="faq">
                              </td>
                           </tr>
                           <tr data-module="testimonials">
                              <td class="ps-4">Testimonials</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[testimonials][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[testimonials][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[testimonials][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[testimonials][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[testimonials][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="testimonials">
                              </td>
                           </tr>
                           <tr data-module="contact_us">
                              <td class="ps-4">Contact Us</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[contact_us][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[contact_us][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[contact_us][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[contact_us][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[contact_us][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="contact_us">
                              </td>
                           </tr>

                           <!-- Reports Module -->
                           <tr>
                              <td colspan="7" class="table-secondary fw-bold">
                                 <i class="ti ti-report me-2"></i>Reports & Analytics
                              </td>
                           </tr>
                           <tr data-module="sales_report">
                              <td class="ps-4">Sales Reports</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[sales_report][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[sales_report][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[sales_report][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[sales_report][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[sales_report][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="sales_report">
                              </td>
                           </tr>
                           <tr data-module="product_performance">
                              <td class="ps-4">Product Performance</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[product_performance][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[product_performance][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[product_performance][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[product_performance][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[product_performance][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="product_performance">
                              </td>
                           </tr>
                           <tr data-module="traffic_analytics">
                              <td class="ps-4">Traffic Analytics</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[traffic_analytics][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[traffic_analytics][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[traffic_analytics][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[traffic_analytics][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[traffic_analytics][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="traffic_analytics">
                              </td>
                           </tr>

                           <!-- Settings Module -->
                           <tr>
                              <td colspan="7" class="table-secondary fw-bold">
                                 <i class="ti ti-settings me-2"></i>Settings
                              </td>
                           </tr>
                           <tr data-module="general_settings">
                              <td class="ps-4">General Settings</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[general_settings][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[general_settings][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[general_settings][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[general_settings][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[general_settings][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="general_settings">
                              </td>
                           </tr>

                           <!-- User Management Module -->
                           <tr>
                              <td colspan="7" class="table-secondary fw-bold">
                                 <i class="ti ti-users-plus me-2"></i>User Management
                              </td>
                           </tr>
                           <tr data-module="users">
                              <td class="ps-4">Users</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[users][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[users][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[users][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[users][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[users][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="users">
                              </td>
                           </tr>
                           <tr data-module="roles">
                              <td class="ps-4">Role Management</td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox add-permission" type="checkbox" name="permissions[roles][add]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox edit-permission" type="checkbox" name="permissions[roles][edit]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox view-permission" type="checkbox" name="permissions[roles][view]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox list-permission" type="checkbox" name="permissions[roles][list]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input permission-checkbox export-permission" type="checkbox" name="permissions[roles][export]" value="1">
                              </td>
                              <td class="text-center">
                                 <input class="form-check-input module-select-all" type="checkbox" data-module="roles">
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </div>

               </div>
               <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
               <button type="submit" class="btn btn-primary">Save Role</button>
               </div>
               </form>
            </div>
         </div>
      </div>

      <div class="w-100">
          <input type="text" placeholder="Search roles..." class="form-control serarch-filter-input mt-3 mb-3" id="serarch-filter-input">
      </div>

      <!-- Main content -->
      <div class="card p-0 mt-4 w-100">
          <div class="table-responsive text-nowrap">
            <table width="100%" border="1" cellspacing="0" cellpadding="0" class="table table-striped" id="roles_table">
              <thead>
                 <tr>
                    <th>Role Name</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Created Date</th>
                    <th width="100">Action</th>
                 </tr>
              </thead>
              <tbody>
                <!-- DataTables will populate this dynamically -->
              </tbody>
           </table>
          </div>
      </div>

      <!-- Unified Edit Role Modal -->
      <div class="modal fade" id="editRoleModal" tabindex="-1" role="dialog" aria-labelledby="editRoleModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="editRoleModalLabel">Edit Role</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <form action="<%base_url('user/role/updateRole')%>" method="POST" id="edit_role_form" class="edit_role_form custom-form">
                  <input type="hidden" name="role_id" id="edit_role_id">
                  <div class="modal-body" style="max-height: 70vh; overflow-y: auto;">
                     <div class="row">
                        <div class="col-md-6">
                           <div class="form-group mb-3">
                              <label for="edit_role_name">Role Name<span class="text-danger">*</span></label>
                              <select name="role_name" id="edit_role_name" class="form-control select2 required-input">
                                 <option value="">Select Role Name</option>
                                 <option value="Super Admin">Super Admin</option>
                                 <option value="Admin">Admin</option>
                                 <option value="Vendor">Vendor</option>
                              </select>
                           </div>
                        </div>
                        <div class="col-md-6">
                           <div class="form-group mb-3">
                              <label for="edit_role_description">Role Description</label>
                              <input type="text" name="role_description" id="edit_role_description" placeholder="Enter Role Description" class="form-control">
                           </div>
                        </div>
                        <div class="col-md-6">
                           <div class="form-group mb-3">
                              <label for="edit_status">Status<span class="text-danger">*</span></label>
                              <select name="status" id="edit_status" class="form-control select2 required-input">
                                 <option value="Active">Active</option>
                                 <option value="Inactive">Inactive</option>
                              </select>
                           </div>
                        </div>
                     </div>

                     <hr class="my-4">

                     <h5 class="mb-3">Edit Permissions</h5>
                     <p class="text-muted mb-4">Update permissions for this role.</p>

                     <div class="table-responsive">
                        <table class="table table-bordered permission-table">
                           <thead class="table-light">
                              <tr>
                                 <th style="width: 25%;">Module/Menu</th>
                                 <th class="text-center" style="width: 10%;">Add</th>
                                 <th class="text-center" style="width: 10%;">Edit</th>
                                 <th class="text-center" style="width: 10%;">View</th>
                                 <th class="text-center" style="width: 10%;">List</th>
                                 <th class="text-center" style="width: 10%;">Export</th>
                                 <th class="text-center" style="width: 15%;">Select All</th>
                              </tr>
                           </thead>
                           <tbody id="edit_permissions_body">
                              <!-- Permissions table rows will be cloned from Add modal or built dynamically -->
                           </tbody>
                        </table>
                     </div>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                     <button type="submit" class="btn btn-primary">Update Role</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
      <!-- /.col -->


      <div class="content-backdrop fade"></div>
    </div>


    <script type="text/javascript">
    var base_url = <%$base_url|@json_encode%>
    </script>

    <script src="<%$base_url%>public/js/admin/role_management.js"></script>
