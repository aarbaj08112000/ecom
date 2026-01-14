<%include file="layout/header.tpl"%>

<div class="bg-light py-5" style="min-height: 80vh; background-image: radial-gradient(#e5989b 0.5px, transparent 0.5px), radial-gradient(#e5989b 0.5px, #fdfbf7 0.5px); background-size: 20px 20px; background-position: 0 0, 10px 10px;">
    <div class="container">
    <div class="row g-4 justify-content-center">
            <!-- Sidebar Navigation -->
            <div class="col-lg-3">
                <div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-4" data-aos="fade-up">
                    <div class="card-body p-4 text-center bg-white position-relative">
                        <div class="position-absolute top-0 start-0 w-100 h-100 bg-primary opacity-10"></div>
                        <div class="position-relative z-1">
                            <%if isset($customer->profile_image) && $customer->profile_image%>
                                <img src="<%base_url('public/frontend/img/profiles/')%><%$customer->profile_image%>" class="rounded-circle shadow-lg mb-3 border border-4 border-white mx-auto" style="width: 100px; height: 100px; object-fit: cover; display: block;" onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">
                                <div class="rounded-circle shadow-lg mb-3 border border-4 border-white mx-auto d-none align-items-center justify-content-center bg-primary text-white" style="width: 100px; height: 100px; font-size: 2.5rem; font-weight: bold;">
                                    <%if isset($customer_name)%><%$customer_name|substr:0:1|upper%><%else%>U<%/if%>
                                </div>
                            <%else%>
                                <div class="rounded-circle shadow-lg mb-3 border border-4 border-white mx-auto d-flex align-items-center justify-content-center bg-primary text-white" style="width: 100px; height: 100px; font-size: 2.5rem; font-weight: bold;">
                                    <%if isset($customer_name)%><%$customer_name|substr:0:1|upper%><%else%>U<%/if%>
                                </div>
                            <%/if%>
                            <h5 class="fw-bold mb-1" style="font-family: var(--font-heading);"><%if isset($customer_name)%><%$customer_name%><%else%>User<%/if%></h5>
                            <p class="small text-muted mb-0"><i class="ti ti-star-filled text-warning"></i> Welcome back!</p>
                        </div>
                    </div>
                    <div class="list-group list-group-flush py-2 bg-white" id="accountTabs" role="tablist">
                        <a class="list-group-item list-group-item-action border-0 px-4 py-3 active fw-bold border-start border-4 border-primary align-items-center d-flex transition cursor-pointer" id="dashboard-tab-link" data-bs-toggle="list" href="#dashboard-tab" role="tab" aria-controls="dashboard-tab">
                            <i class="ti ti-layout-dashboard me-3 fs-5"></i> Dashboard
                        </a>
                        <a class="list-group-item list-group-item-action border-0 px-4 py-3 fw-medium text-muted hover-bg-light border-start border-4 border-transparent align-items-center d-flex transition cursor-pointer" id="orders-tab-link" data-bs-toggle="list" href="#orders-tab" role="tab" aria-controls="orders-tab">
                            <i class="ti ti-package me-3 fs-5"></i> My Orders
                        </a>
                        <a class="list-group-item list-group-item-action border-0 px-4 py-3 fw-medium text-muted hover-bg-light border-start border-4 border-transparent align-items-center d-flex transition cursor-pointer" id="wishlist-tab-link" data-bs-toggle="list" href="#wishlist-tab" role="tab" aria-controls="wishlist-tab">
                            <i class="ti ti-heart me-3 fs-5"></i> Wishlist
                        </a>
                        <a class="list-group-item list-group-item-action border-0 px-4 py-3 fw-medium text-muted hover-bg-light border-start border-4 border-transparent align-items-center d-flex transition cursor-pointer" id="address-tab-link" data-bs-toggle="list" href="#address-tab" role="tab" aria-controls="address-tab">
                            <i class="ti ti-map-pin me-3 fs-5"></i> Addresses
                        </a>
                        <a class="list-group-item list-group-item-action border-0 px-4 py-3 fw-medium text-muted hover-bg-light border-start border-4 border-transparent align-items-center d-flex transition cursor-pointer" id="settings-tab-link" data-bs-toggle="list" href="#settings-tab" role="tab" aria-controls="settings-tab">
                            <i class="ti ti-settings me-3 fs-5"></i> Settings
                        </a>
                         <a href="<%base_url('shop/logout')%>" class="list-group-item list-group-item-action border-0 px-4 py-3 fw-medium text-danger hover-bg-light align-items-center d-flex transition">
                            <i class="ti ti-logout me-3 fs-5"></i> Log Out
                        </a>
                    </div>
                </div>
            </div>
            
            <!-- Dashboard Content -->
            <div class="col-lg-9">
                <div class="tab-content" id="accountTabsContent">
                    
                    <!-- Dashboard Tab -->
                    <div class="tab-pane fade show active" id="dashboard-tab" role="tabpanel" aria-labelledby="dashboard-tab-link">
                        <!-- Welcome Section -->
                        <div class="d-flex justify-content-between align-items-center mb-4" data-aos="fade-down">
                            <div>
                                <h2 class="fw-bold mb-0 text-capitalize" style="font-family: var(--font-heading);">Hello, <%if isset($customer_name)%><%$customer_name%><%else%>User<%/if%>! 👋</h2>
                                <p class="text-muted mb-0">Here's what's happening with your creative journey today.</p>
                            </div>
                            <button class="btn btn-primary rounded-pill px-4 shadow-sm btn-animate" onclick="window.location.href='<%base_url('shop/products')%>'">
                                <i class="ti ti-shopping-cart-plus me-2"></i> Continue Shopping
                            </button>
                        </div>

                        <!-- Stats Cards (Compact Height) -->
                        <div class="row g-3 mb-5">
                            <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                                <div class="card border-0 shadow-sm rounded-4 bg-primary text-white h-100 overflow-hidden position-relative">
                                    <div class="position-absolute end-0 bottom-0 opacity-25 translate-x-10 translate-y-10">
                                        <i class="ti ti-shopping-bag" style="font-size: 6rem;"></i>
                                    </div>
                                    <div class="card-body p-3 position-relative z-1">
                                        <div class="d-flex align-items-center gap-3 mb-2">
                                            <div class="bg-white bg-opacity-25 rounded-circle p-1 d-flex"><i class="ti ti-shopping-bag fs-5"></i></div>
                                            <h6 class="mb-0 opacity-75 fw-bold text-uppercase small letter-spacing-1">Total Orders</h6>
                                        </div>
                                        <h3 class="fw-bold mb-0 fs-2"><%if isset($stats->total_orders)%><%$stats->total_orders%><%else%>0<%/if%></h3>
                                    </div>
                                </div>
                            </div>
                             <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                                <div class="card border-0 shadow-sm rounded-4 bg-white h-100 overflow-hidden position-relative">
                                     <div class="card-body p-3">
                                        <div class="d-flex align-items-center gap-3 mb-2">
                                             <div class="bg-warning-subtle text-warning rounded-circle p-1 d-flex"><i class="ti ti-truck-delivery fs-5"></i></div>
                                            <h6 class="mb-0 text-muted fw-bold text-uppercase small letter-spacing-1">Processing</h6>
                                        </div>
                                        <h3 class="fw-bold mb-0 fs-2 text-dark"><%if isset($stats->processing_orders)%><%$stats->processing_orders%><%else%>0<%/if%></h3>
                                    </div>
                                </div>
                            </div>
                             <div class="col-md-4" data-aos="fade-up" data-aos-delay="300">
                                <div class="card border-0 shadow-sm rounded-4 bg-secondary text-white h-100 overflow-hidden position-relative">
                                     <div class="position-absolute end-0 bottom-0 opacity-25 translate-x-10 translate-y-10">
                                        <i class="ti ti-wallet" style="font-size: 6rem;"></i>
                                    </div>
                                     <div class="card-body p-3 position-relative z-1">
                                        <div class="d-flex align-items-center gap-3 mb-2">
                                             <div class="bg-white bg-opacity-25 rounded-circle p-1 d-flex"><i class="ti ti-wallet fs-5"></i></div>
                                            <h6 class="mb-0 opacity-75 fw-bold text-uppercase small letter-spacing-1">Total Spent</h6>
                                        </div>
                                        <h3 class="fw-bold mb-0 fs-2">$<%if isset($stats->total_spent)%><%$stats->total_spent%><%else%>0<%/if%></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Recent Orders Summary -->
                        <div class="card border-0 shadow-sm rounded-4 overflow-hidden" data-aos="fade-up" data-aos-delay="400">
                             <div class="card-header bg-white border-0 p-4 d-flex justify-content-between align-items-center">
                                <h5 class="fw-bold mb-0" style="font-family: var(--font-heading);">Recent Orders</h5>
                                <button onclick="document.getElementById('orders-tab-link').click()" class="btn btn-sm btn-outline-primary rounded-pill px-3">View All</button>
                             </div>
                            <div class="table-responsive">
                                 <table class="table table-hover align-middle mb-0">
                                     <thead class="bg-light small fw-bold text-uppercase text-secondary letter-spacing-1">
                                         <tr>
                                             <th class="ps-4 py-3">Product</th>
                                             <th class="py-3">Order Info</th>
                                             <th class="py-3">Status</th>
                                             <th class="pe-4 py-3 text-end">Action</th>
                                         </tr>
                                     </thead>
                                     <tbody>
                                         <%if !empty($orders)%>
                                             <%foreach $orders as $order%>
                                             <tr>
                                                 <td class="ps-4 py-3">
                                                     <div class="d-flex align-items-center gap-3">
                                                         <div class="bg-light rounded-3 d-flex align-items-center justify-content-center" style="width: 50px; height: 50px;">
                                                            <i class="ti ti-box fs-4 text-secondary"></i>
                                                         </div>
                                                         <div>
                                                             <h6 class="fw-bold mb-0 text-dark">#<%$order->order_id%></h6>
                                                             <p class="small text-muted mb-0"><%$order->items_count%> Items</p>
                                                         </div>
                                                     </div>
                                                 </td>
                                                 <td>
                                                     <div class="small text-muted"><i class="ti ti-calendar me-1"></i> <%$order->added_date|date_format:"%b %d, %Y"%></div>
                                                     <span class="fw-bold text-dark small">$<%$order->total_amount%></span>
                                                 </td>
                                                 <td>
                                                     <%if $order->order_status == 'Delivered'%>
                                                        <span class="badge bg-success-subtle text-success border border-success-subtle rounded-pill px-2 py-1 small"><i class="ti ti-check me-1"></i> Delivered</span>
                                                     <%elseif $order->order_status == 'Processing'%>
                                                        <span class="badge bg-primary-subtle text-primary border border-primary-subtle rounded-pill px-2 py-1 small"><i class="ti ti-package me-1"></i> Processing</span>
                                                     <%elseif $order->order_status == 'Confirmed'%>
                                                        <span class="badge bg-info-subtle text-info border border-info-subtle rounded-pill px-2 py-1 small"><i class="ti ti-check me-1"></i> Confirmed</span>
                                                     <%elseif $order->order_status == 'Cancelled'%>
                                                        <span class="badge bg-danger-subtle text-danger border border-danger-subtle rounded-pill px-2 py-1 small"><i class="ti ti-x me-1"></i> Cancelled</span>
                                                     <%else%>
                                                        <span class="badge bg-warning-subtle text-warning border border-warning-subtle rounded-pill px-2 py-1 small"><i class="ti ti-loader me-1"></i> <%$order->order_status%></span>
                                                     <%/if%>
                                                 </td>
                                                  <td class="pe-4 text-end">
                                                      <button class="btn btn-white btn-sm shadow-sm rounded-circle icon-btn-sm" onclick="viewOrderDetails(<%$order->order_id%>)" title="View Details"><i class="ti ti-eye"></i></button>
                                                  </td>
                                             </tr>
                                             <%/foreach%>
                                         <%else%>
                                            <tr>
                                                <td colspan="4" class="text-center py-5">
                                                    <div class="mb-3">
                                                        <div class="bg-light rounded-circle d-inline-flex align-items-center justify-content-center" style="width: 80px; height: 80px;">
                                                            <i class="ti ti-shopping-cart-off fs-1 text-muted opacity-50"></i>
                                                        </div>
                                                    </div>
                                                    <h5 class="fw-bold text-muted">No orders yet</h5>
                                                    <p class="text-muted small mb-3">Looks like you haven't placed an order yet.</p>
                                                    <button class="btn btn-primary rounded-pill px-4" onclick="window.location.href='<%base_url('shop')%>'">Start Shopping</button>
                                                </td>
                                            </tr>
                                         <%/if%>
                                     </tbody>
                                 </table>
                            </div>
                        </div>
                    </div>

                    <!-- Orders Tab -->
                    <div class="tab-pane fade" id="orders-tab" role="tabpanel" aria-labelledby="orders-tab-link">
                         <h4 class="fw-bold mb-4" style="font-family: var(--font-heading);">My Orders</h4>
                         <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                            <div class="table-responsive">
                                 <table class="table table-hover align-middle mb-0">
                                     <thead class="bg-light small fw-bold text-uppercase text-secondary letter-spacing-1">
                                         <tr>
                                             <th class="ps-4 py-3">Order ID</th>
                                             <th class="py-3">Date</th>
                                             <th class="py-3">Amount</th>
                                             <th class="py-3">Status</th>
                                             <th class="pe-4 py-3 text-end">Action</th>
                                         </tr>
                                     </thead>
                                     <tbody>
                                         <%if !empty($my_orders)%>
                                             <%foreach $my_orders as $order%>
                                             <tr>
                                                 <td class="ps-4 fw-bold text-primary">#<%$order->order_id%></td>
                                                 <td class="text-muted"><%$order->added_date|date_format:"%b %d, %Y"%></td>
                                                 <td class="fw-bold">$<%$order->total_amount%></td>
                                                 <td>
                                                     <%if $order->order_status == 'Delivered'%>
                                                        <span class="badge bg-success-subtle text-success border border-success-subtle rounded-pill px-3 py-2">Delivered</span>
                                                     <%elseif $order->order_status == 'Processing'%>
                                                        <span class="badge bg-primary-subtle text-primary border border-primary-subtle rounded-pill px-3 py-2">Processing</span>
                                                     <%elseif $order->order_status == 'Confirmed'%>
                                                        <span class="badge bg-info-subtle text-info border border-info-subtle rounded-pill px-3 py-2">Confirmed</span>
                                                      <%elseif $order->order_status == 'Cancelled'%>
                                                        <span class="badge bg-danger-subtle text-danger border border-danger-subtle rounded-pill px-3 py-2">Cancelled</span>
                                                     <%else%>
                                                        <span class="badge bg-warning-subtle text-warning border border-warning-subtle rounded-pill px-3 py-2"><%$order->order_status%></span>
                                                     <%/if%>
                                                 </td>
                                                  <td class="pe-4 text-end">
                                                      <button class="btn btn-white btn-sm shadow-sm rounded-circle icon-btn-sm me-2" onclick="viewOrderDetails(<%$order->order_id%>)" title="View Details"><i class="ti ti-eye"></i></button>
                                                      <button class="btn btn-outline-primary btn-sm rounded-pill px-3" onclick="window.location.href='<%base_url('shop/track-order')%>'">Track Order</button>
                                                  </td>
                                             </tr>
                                             <%/foreach%>
                                         <%else%>
                                            <tr>
                                                <td colspan="5" class="text-center py-5">
                                                    <div class="mb-3">
                                                        <div class="bg-light rounded-circle d-inline-flex align-items-center justify-content-center" style="width: 80px; height: 80px;">
                                                            <i class="ti ti-package fs-1 text-muted opacity-50"></i>
                                                        </div>
                                                    </div>
                                                    <h5 class="fw-bold text-muted">No order history</h5>
                                                    <p class="text-muted small mb-3">You haven't placed any orders yet.</p>
                                                    <button class="btn btn-primary rounded-pill px-4" onclick="window.location.href='<%base_url('shop')%>'">Shop Now</button>
                                                </td>
                                            </tr>
                                         <%/if%>
                                     </tbody>
                                 </table>
                            </div>
                        </div>
                    </div>

                    <!-- Wishlist Tab -->
                    <div class="tab-pane fade" id="wishlist-tab" role="tabpanel" aria-labelledby="wishlist-tab-link">
                        <h4 class="fw-bold mb-4" style="font-family: var(--font-heading);">My Wishlist</h4>
                        <div class="row g-4">
                            <%if !empty($wishlist)%>
                                <%foreach $wishlist as $item%>
                                <div class="col-md-6" data-aos="fade-up">
                                    <div class="card border-0 shadow-sm rounded-4 overflow-hidden h-100">
                                        <div class="row g-0 h-100">
                                            <div class="col-4">
                                                <img src="<%base_url('public/')%><%$item->image_path%>" class="img-fluid h-100 object-fit-cover" alt="<%$item->name%>" onerror="this.src='https://placehold.co/200x200';">
                                            </div>
                                            <div class="col-8">
                                                <div class="card-body h-100 d-flex flex-column justify-content-center">
                                                    <h6 class="fw-bold mb-1 line-clamp-1"><%$item->name%></h6>
                                                    <p class="text-primary fw-bold mb-2">$<%$item->price%></p>
                                                    <div class="d-flex gap-2 mt-auto">
                                                        <button class="btn btn-sm btn-primary rounded-pill px-3 flex-fill">Add to Cart</button>
                                                        <button class="btn btn-sm btn-outline-danger rounded-circle icon-btn-sm"><i class="ti ti-trash"></i></button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%/foreach%>
                            <%else%>
                                <div class="col-12 text-center py-5">
                                    <div class="mb-3">
                                        <div class="bg-light rounded-circle d-inline-flex align-items-center justify-content-center" style="width: 80px; height: 80px;">
                                            <i class="ti ti-heart-off fs-1 text-muted opacity-50"></i>
                                        </div>
                                    </div>
                                    <h5 class="fw-bold text-muted">Your wishlist is empty</h5>
                                    <p class="text-muted small mb-3">Add items you love to your wishlist to keep track of them.</p>
                                    <button class="btn btn-primary rounded-pill px-4" onclick="window.location.href='<%base_url('shop')%>'">Start Shopping</button>
                                </div>
                            <%/if%>
                        </div>
                    </div>

                    <!-- Address Tab -->
                    <div class="tab-pane fade" id="address-tab" role="tabpanel" aria-labelledby="address-tab-link">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                             <h4 class="fw-bold mb-0" style="font-family: var(--font-heading);">Saved Addresses</h4>
                             <button class="btn btn-primary rounded-pill px-4 shadow-sm" onclick="openAddressModal()"><i class="ti ti-plus me-2"></i> Add New</button>
                        </div>
                        <div class="row g-4">
                            <%if !empty($addresses)%>
                                <%foreach $addresses as $addr%>
                                <div class="col-md-6">
                                    <div class="card border-primary border-2 shadow-sm rounded-4 p-4 h-100 bg-primary-subtle position-relative">
                                        <%if isset($addr->address_type) && $addr->address_type == 'Billing'%>
                                        <span class="badge bg-secondary position-absolute top-0 end-0 m-3">Billing</span>
                                        <%else%>
                                        <span class="badge bg-primary position-absolute top-0 end-0 m-3">Shipping</span>
                                        <%/if%>
                                        <h5 class="fw-bold mb-3"><i class="ti ti-map-pin me-2"></i> <%$addr->receiver_name%></h5>
                                        <p class="text-muted small mb-3">
                                            <%$addr->address%><br>
                                            <%$addr->city%>, <%$addr->state%> - <%$addr->pincode%>
                                        </p>
                                        <p class="mb-3 small"><i class="ti ti-phone me-1"></i> <%$addr->mobile_number%></p>
                                        <div class="d-flex gap-2">
                                            <button class="btn btn-sm btn-white rounded-pill px-3 shadow-sm" onclick="editAddress(<%$addr->address_id%>)">Edit</button>
                                            <button class="btn btn-sm btn-white rounded-pill px-3 shadow-sm text-danger" onclick="deleteAddress(<%$addr->address_id%>)">Delete</button>
                                        </div>
                                    </div>
                                </div>
                                <%/foreach%>
                            <%else%>
                                <div class="col-12 text-center py-5">
                                    <div class="mb-3">
                                        <div class="bg-light rounded-circle d-inline-flex align-items-center justify-content-center" style="width: 80px; height: 80px;">
                                            <i class="ti ti-map-pin-off fs-1 text-muted opacity-50"></i>
                                        </div>
                                    </div>
                                    <h5 class="fw-bold text-muted">No addresses saved</h5>
                                    <p class="text-muted small mb-3">Add an address for faster checkout.</p>
                                    <button class="btn btn-primary rounded-pill px-4" onclick="openAddressModal()">Add Address</button>
                                </div>
                            <%/if%>
                        </div>
                    </div>

                    <!-- Settings Tab -->
                    <div class="tab-pane fade" id="settings-tab" role="tabpanel" aria-labelledby="settings-tab-link">
                         <h4 class="fw-bold mb-4" style="font-family: var(--font-heading);">Account Settings</h4>
                         <div class="card border-0 shadow-sm rounded-4">
                             <div class="card-body p-4">
                                 <form id="settingsForm" method="POST" action="javascript:void(0);" enctype="multipart/form-data">
                                     <div class="row g-3">
                                         <!-- Customer Code (readonly) -->
                                         <div class="col-md-6">
                                             <label class="form-label small fw-bold text-uppercase text-muted">Customer Code</label>
                                             <input type="text" class="form-control bg-light border-0 py-3 rounded-3" value="<%if isset($customer->customer_code)%><%$customer->customer_code%><%/if%>" readonly>
                                         </div>
                                         
                                         <!-- Email (readonly) -->
                                         <div class="col-md-6">
                                             <label class="form-label small fw-bold text-uppercase text-muted">Email Address</label>
                                             <input type="email" class="form-control bg-light border-0 py-3 rounded-3" value="<%if isset($customer->email)%><%$customer->email%><%/if%>" readonly>
                                         </div>
                                         
                                         <!-- Customer Name -->
                                         <div class="col-md-6">
                                             <label class="form-label small fw-bold text-uppercase text-muted">Full Name <span class="text-danger">*</span></label>
                                             <input type="text" name="customer_name" id="customer_name" class="form-control bg-light border-0 py-3 rounded-3" value="<%if isset($customer->customer_name)%><%$customer->customer_name%><%/if%>">
                                         </div>
                                         
                                         <!-- Mobile Number -->
                                         <div class="col-md-6">
                                             <label class="form-label small fw-bold text-uppercase text-muted">Mobile Number</label>
                                             <input type="text" name="mobile_no" id="mobile_no" class="form-control bg-light border-0 py-3 rounded-3" value="<%if isset($customer->mobile_no)%><%$customer->mobile_no%><%/if%>">
                                         </div>
                                         
                                         <!-- Profile Image -->
                                         <div class="col-12">
                                             <label class="form-label small fw-bold text-uppercase text-muted">Profile Image</label>
                                             <input type="file" name="profile_image" id="profile_image" class="form-control bg-light border-0 py-2 rounded-3" accept="image/*">
                                             <small class="text-muted">Max file size: 2MB. Allowed types: JPG, JPEG, PNG, GIF</small>
                                             <%if isset($customer->profile_image) && $customer->profile_image%>
                                                 <div class="mt-2">
                                                     <img src="<%base_url('public/frontend/img/profiles/')%><%$customer->profile_image%>" alt="Current Profile" class="rounded-circle" style="width: 60px; height: 60px; object-fit: cover;">
                                                 </div>
                                             <%/if%>
                                         </div>
                                         
                                         <!-- GST Number -->
                                         <div class="col-md-6">
                                             <label class="form-label small fw-bold text-uppercase text-muted">GST Number</label>
                                             <input type="text" name="gst_no" id="gst_no" class="form-control bg-light border-0 py-3 rounded-3" value="<%if isset($customer->gst_no)%><%$customer->gst_no%><%/if%>">
                                         </div>
                                         
                                         <!-- PAN Number -->
                                         <div class="col-md-6">
                                             <label class="form-label small fw-bold text-uppercase text-muted">PAN Number</label>
                                             <input type="text" name="pan_no" id="pan_no" class="form-control bg-light border-0 py-3 rounded-3" value="<%if isset($customer->pan_no)%><%$customer->pan_no%><%/if%>" autocomplete="off">
                                         </div>
                                         
                                         <!-- Date of Birth -->
                                         <div class="col-md-6">
                                             <label class="form-label small fw-bold text-uppercase text-muted">Date of Birth</label>
                                             <input type="date" name="dob" id="dob" class="form-control bg-light border-0 py-3 rounded-3" value="<%if isset($customer->dob)%><%$customer->dob%><%/if%>">
                                         </div>
                                         
                                         <!-- Gender -->
                                         <div class="col-md-6">
                                             <label class="form-label small fw-bold text-uppercase text-muted">Gender</label>
                                             <select name="gender" id="gender" class="form-select bg-light border-0 py-3 rounded-3">
                                                 <option value="">Select Gender</option>
                                                 <option value="Male" <%if isset($customer->gender) && $customer->gender == 'Male'%>selected<%/if%>>Male</option>
                                                 <option value="Female" <%if isset($customer->gender) && $customer->gender == 'Female'%>selected<%/if%>>Female</option>
                                                 <option value="Other" <%if isset($customer->gender) && $customer->gender == 'Other'%>selected<%/if%>>Other</option>
                                             </select>
                                         </div>
                                         
                                         <!-- Identity Details -->
                                         <div class="col-12">
                                             <label class="form-label small fw-bold text-uppercase text-muted">Identity Details</label>
                                             <textarea name="identity_details" id="identity_details" class="form-control bg-light border-0 py-3 rounded-3" rows="3"><%if isset($customer->identity_details)%><%$customer->identity_details%><%/if%></textarea>
                                         </div>
                                         
                                         <div class="col-12 mt-3">
                                             <hr>
                                             <h6 class="fw-bold text-muted mb-3">Change Password (Optional)</h6>
                                         </div>
                                         
                                         <!-- Current Password -->
                                         <div class="col-12">
                                             <label class="form-label small fw-bold text-uppercase text-muted">Current Password</label>
                                             <input type="password" name="current_password" id="current_password" class="form-control bg-light border-0 py-3 rounded-3" placeholder="Enter current password" autocomplete="current-password">
                                         </div>
                                         
                                         <!-- New Password -->
                                         <div class="col-md-6">
                                             <label class="form-label small fw-bold text-uppercase text-muted">New Password</label>
                                             <input type="password" name="new_password" id="new_password" class="form-control bg-light border-0 py-3 rounded-3" placeholder="Enter new password" autocomplete="new-password">
                                         </div>
                                         
                                         <!-- Confirm Password -->
                                         <div class="col-md-6">
                                             <label class="form-label small fw-bold text-uppercase text-muted">Confirm Password</label>
                                             <input type="password" name="confirm_password" id="confirm_password" class="form-control bg-light border-0 py-3 rounded-3" placeholder="Confirm new password" autocomplete="new-password">
                                         </div>
                                         
                                         <div class="col-12 mt-4">
                                             <button type="submit" class="btn btn-primary rounded-pill px-5 py-2 fw-bold shadow-sm">Save Changes</button>
                                         </div>
                                     </div>
                                 </form>
                              </div>
                          </div>
                     </div>
                     
                     <!-- Order Details Tab (Hidden from menu) -->
                     <div class="tab-pane fade" id="order-details-tab" role="tabpanel">
                         <div class="mb-4 d-flex align-items-center gap-3">
                             <button class="btn btn-outline-secondary rounded-circle icon-btn-sm" onclick="backToDashboard()" title="Back">
                                 <i class="ti ti-arrow-left"></i>
                             </button>
                             <h4 class="fw-bold mb-0" style="font-family: var(--font-heading);">Order Details</h4>
                         </div>
                         
                         <div id="order-details-content">
                             <!-- Loading state -->
                             <div class="text-center py-5">
                                 <i class="ti ti-loader fs-1 text-primary"></i>
                                 <p class="text-muted mt-2">Loading order details...</p>
                             </div>
                         </div>
                     </div>
                     
                </div>
            </div>
        </div>
    </div>
</div>

<style>
.icon-btn-sm {
    width: 32px;
    height: 32px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
}
.letter-spacing-1 {
    letter-spacing: 1px;
}
.hover-bg-light:hover {
    background-color: var(--light) !important;
    color: var(--primary) !important;
}
</style>


<!-- Address Modal -->
<div class="modal fade" id="addressModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg rounded-4">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title fw-bold" id="addressModalTitle">Add New Address</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-4">
                <form id="addressForm">
                    <input type="hidden" name="address_id" id="address_id">
                    <div class="row g-3">
                        <div class="col-12">
                            <label class="form-label small fw-bold text-muted uppercase">Receiver Name</label>
                            <input type="text" class="form-control bg-light border-0 rounded-3 py-2" name="receiver_name" id="addr_receiver_name" required>
                        </div>
                        <div class="col-12">
                            <label class="form-label small fw-bold text-muted uppercase">Mobile Number</label>
                            <input type="text" class="form-control bg-light border-0 rounded-3 py-2" name="mobile" id="addr_mobile" required>
                        </div>
                        <div class="col-12">
                            <label class="form-label small fw-bold text-muted uppercase">Address</label>
                            <textarea class="form-control bg-light border-0 rounded-3 py-2" name="street" id="addr_street" rows="2" required></textarea>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label small fw-bold text-muted uppercase">City</label>
                            <input type="text" class="form-control bg-light border-0 rounded-3 py-2" name="city" id="addr_city" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label small fw-bold text-muted uppercase">State</label>
                            <input type="text" class="form-control bg-light border-0 rounded-3 py-2" name="state" id="addr_state" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label small fw-bold text-muted uppercase">Pincode</label>
                            <input type="text" class="form-control bg-light border-0 rounded-3 py-2" name="zip" id="addr_zip" required>
                        </div>
                        <div class="col-12 mt-4">
                            <button type="submit" class="btn btn-primary w-100 rounded-pill py-2 fw-bold">Save Address</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%include file="layout/footer.tpl"%>
<script>
function openAddressModal() {
    $('#addressForm').validate().resetForm();
    $('#addressForm')[0].reset();
    $('#address_id').val('');
    $('#addressModalTitle').text('Add New Address');
    $('#addressModal').modal('show');
}

function editAddress(id) {
    $.ajax({
        url: '<%base_url("shop/get-address/")%>' + id,
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            if(data.error) {
                toaster('error', data.error);
                return;
            }
            $('#addressForm').validate().resetForm();
            $('#address_id').val(data.address_id);
            $('#addr_receiver_name').val(data.receiver_name);
            $('#addr_mobile').val(data.mobile_number);
            $('#addr_street').val(data.address);
            $('#addr_city').val(data.city);
            $('#addr_state').val(data.state);
            $('#addr_zip').val(data.pincode);
            
            $('#addressModalTitle').text('Edit Address');
            $('#addressModal').modal('show');
        },
        error: function() {
            toaster('error', 'Failed to fetch address details.');
        }
    });
}

function deleteAddress(id) {
    Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: '<%base_url("shop/delete-address")%>',
                type: 'POST',
                data: {id: id},
                dataType: 'json',
                success: function(response) {
                    if(response.success) {
                        Swal.fire({
                            title: 'Deleted!',
                            text: response.message,
                            icon: 'success',
                            timer: 1500,
                            showConfirmButton: false
                        }).then(() => {
                             location.reload();
                        });
                    } else {
                         Swal.fire(
                            'Error!',
                            response.message,
                            'error'
                        );
                    }
                },
                error: function() {
                     Swal.fire(
                        'Error!',
                        'An error occurred while deleting.',
                        'error'
                    );
                }
            });
        }
    });
}

$(document).ready(function() {
    $('#addressForm').validate({
        rules: {
            receiver_name: "required",
            mobile: {
                required: true,
                digits: true,
                minlength: 10,
                maxlength: 10
            },
            street: "required",
            city: "required",
            state: "required",
            zip: {
                required: true,
                digits: true,
                minlength: 6,
                maxlength: 6
            }
        },
        messages: {
            receiver_name: "Please enter receiver name",
            mobile: {
                required: "Please enter mobile number",
                digits: "Please enter valid digits",
                minlength: "Mobile number must be 10 digits",
                maxlength: "Mobile number must be 10 digits"
            },
            street: "Please enter address",
            city: "Please enter city",
            state: "Please enter state",
            zip: {
                required: "Please enter pincode",
                digits: "Please enter valid digits",
                minlength: "Pincode must be 6 digits",
                maxlength: "Pincode must be 6 digits"
            }
        },
        errorElement: 'div',
        errorClass: 'text-danger small mt-1',
        submitHandler: function(form) {
            $.ajax({
                url: '<%base_url("shop/save-address")%>',
                type: 'POST',
                data: $(form).serialize(),
                dataType: 'json',
                success: function(response) {
                    toaster(response.success ? 'success' : 'error', response.message);
                    if(response.success) {
                        $('#addressModal').modal('hide');
                        setTimeout(function(){ location.reload(); }, 1500);
                    }
                },
                error: function() {
                    toaster('error', 'An error occurred while saving.');
                }
            });
            return false;
        }
    });
    
    // Add custom validation method for file extensions
    $.validator.addMethod("extension", function(value, element, param) {
        if (this.optional(element)) {
            return true;
        }
        param = typeof param === "string" ? param.replace(/,/g, "|") : "png|jpe?g|gif";
        return value.match(new RegExp("\\.(" + param + ")$", "i"));
    }, "Please upload a valid image file (JPG, JPEG, PNG, GIF)");
    
    // Settings Form Validation and Submission
    $('#settingsForm').validate({
        rules: {
            customer_name: {
                required: true,
                minlength: 2
            },
            mobile_no: {
                required: true,
                digits: true,
                minlength: 10,
                maxlength: 10
            },
            gst_no: {
                maxlength: 15
            },
            pan_no: {
                maxlength: 10
            },
            profile_image: {
                extension: "jpg|jpeg|png|gif"
            },
            new_password: {
                minlength: 6
            },
            confirm_password: {
                equalTo: "#new_password"
            }
        },
        messages: {
            customer_name: {
                required: "Please enter your full name",
                minlength: "Name must be at least 2 characters"
            },
            mobile_no: {
                required: "Please enter mobile number",
                digits: "Please enter valid digits",
                minlength: "Mobile number must be 10 digits",
                maxlength: "Mobile number must be 10 digits"
            },
            gst_no: {
                maxlength: "GST number cannot exceed 15 characters"
            },
            pan_no: {
                maxlength: "PAN number must be 10 characters"
            },
            profile_image: {
                extension: "Please upload a valid image file (JPG, JPEG, PNG, GIF)"
            },
            new_password: {
                minlength: "Password must be at least 6 characters"
            },
            confirm_password: {
                equalTo: "Passwords do not match"
            }
        },
        errorElement: 'div',
        errorClass: 'text-danger small mt-1',
        submitHandler: function(form) {
            var formData = new FormData(form);
            
            $.ajax({
                url: '<%base_url("shop/update-settings")%>',
                type: 'POST',
                data: formData,
                dataType: 'json',
                processData: false,
                contentType: false,
                success: function(response) {
                    if(response.success) {
                        toaster('success', response.message);
                        // Clear password fields after successful update
                        $('#current_password, #new_password, #confirm_password').val('');
                        // Reload page after 1.5 seconds to show updated data
                        setTimeout(function(){ location.reload(); }, 1500);
                    } else {
                        toaster('error', response.message);
                    }
                },
                error: function() {
                    toaster('error', 'An error occurred while updating settings.');
                }
            });
            return false;
        }
    });
});

// Order Details Functions
function viewOrderDetails(orderId) {
    // Hide all tabs
    $('.tab-pane').removeClass('show active');
    
    // Show order details tab
    $('#order-details-tab').addClass('show active');
    
    // Remove active state from sidebar
    $('.list-group-item').removeClass('active border-primary').addClass('text-muted border-transparent');
    
    // Load order data
    loadOrderData(orderId);
}

function loadOrderData(orderId) {
    // Show loading state
    $('#order-details-content').html(`
        <div class="text-center py-5">
            <i class="ti ti-loader fs-1 text-primary"></i>
            <p class="text-muted mt-2">Loading order details...</p>
        </div>
    `);
    
    // AJAX call to fetch order details
    $.ajax({
        url: base_url + 'shop/get-order-details/' + orderId,
        type: 'GET',
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                renderOrderDetails(response.data);
            } else {
                $('#order-details-content').html(`
                    <div class="text-center py-5">
                        <i class="ti ti-alert-circle fs-1 text-danger"></i>
                        <p class="text-danger mt-2">${response.message}</p>
                        <button class="btn btn-primary rounded-pill px-4 mt-3" onclick="backToDashboard()">Back to Dashboard</button>
                    </div>
                `);
            }
        },
        error: function() {
            $('#order-details-content').html(`
                <div class="text-center py-5">
                    <i class="ti ti-alert-circle fs-1 text-danger"></i>
                    <p class="text-danger mt-2">Failed to load order details</p>
                    <button class="btn btn-primary rounded-pill px-4 mt-3" onclick="backToDashboard()">Back to Dashboard</button>
                </div>
            `);
        }
    });
}

function renderOrderDetails(order) {
    // Format date
    const orderDate = new Date(order.added_date);
    const formattedDate = orderDate.toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' });
    
    // Status badge
    let statusBadge = '';
    if (order.order_status === 'Delivered') {
        statusBadge = '<span class="badge bg-success-subtle text-success border border-success-subtle rounded-pill px-3 py-2">Delivered</span>';
    } else if (order.order_status === 'Processing') {
        statusBadge = '<span class="badge bg-primary-subtle text-primary border border-primary-subtle rounded-pill px-3 py-2">Processing</span>';
    } else if (order.order_status === 'Confirmed') {
        statusBadge = '<span class="badge bg-info-subtle text-info border border-info-subtle rounded-pill px-3 py-2">Confirmed</span>';
    } else if (order.order_status === 'Cancelled') {
        statusBadge = '<span class="badge bg-danger-subtle text-danger border border-danger-subtle rounded-pill px-3 py-2">Cancelled</span>';
    } else {
        statusBadge = `<span class="badge bg-warning-subtle text-warning border border-warning-subtle rounded-pill px-3 py-2">${order.order_status}</span>`;
    }
    
    // Build items HTML
    let itemsHTML = '';
    if (order.items && order.items.length > 0) {
        order.items.forEach(item => {
            itemsHTML += `
                <tr>
                    <td class="ps-4 py-3">
                        <div class="d-flex align-items-center gap-3">
                            <div class="bg-light rounded-3 d-flex align-items-center justify-content-center" style="width: 50px; height: 50px; overflow: hidden;">
                                ${item.product_image ? `<img src="${base_url}public/frontend/img/products/${item.product_image}" class="img-fluid" style="object-fit: cover; width: 100%; height: 100%;" onerror="this.innerHTML='<i class=\\'ti ti-box fs-4 text-secondary\\'></i>';">` : '<i class="ti ti-box fs-4 text-secondary"></i>'}
                            </div>
                            <div>
                                <h6 class="fw-bold mb-0">${item.product_name || 'Product'}</h6>
                                <p class="small text-muted mb-0">Qty: ${item.quantity}</p>
                            </div>
                        </div>
                    </td>
                    <td class="text-end fw-bold">$${parseFloat(item.price).toFixed(2)}</td>
                    <td class="pe-4 text-end fw-bold text-primary">$${(parseFloat(item.price) * parseInt(item.quantity)).toFixed(2)}</td>
                </tr>
            `;
        });
    } else {
        itemsHTML = '<tr><td colspan="3" class="text-center py-4 text-muted">No items found</td></tr>';
    }
    
    // Render complete order details
    const html = `
        <div class="row g-4">
            <div class="col-12">
                <div class="card border-0 shadow-sm rounded-4 p-4">
                    <div class="d-flex justify-content-between align-items-start mb-4">
                        <div>
                            <h5 class="fw-bold mb-2">Order #${order.order_id}</h5>
                            <p class="text-muted small mb-0"><i class="ti ti-calendar me-1"></i> Placed on ${formattedDate}</p>
                        </div>
                        <div class="text-end">
                            ${statusBadge}
                            <h4 class="fw-bold text-primary mt-2 mb-0">$${parseFloat(order.total_amount).toFixed(2)}</h4>
                        </div>
                    </div>
                    
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="bg-light small fw-bold text-uppercase text-secondary">
                                <tr>
                                    <th class="ps-4 py-3">Product</th>
                                    <th class="py-3 text-end">Price</th>
                                    <th class="pe-4 py-3 text-end">Subtotal</th>
                                </tr>
                            </thead>
                            <tbody>
                                ${itemsHTML}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6">
                <div class="card border-0 shadow-sm rounded-4 p-4 h-100">
                    <h6 class="fw-bold mb-3"><i class="ti ti-map-pin me-2 text-primary"></i>Shipping Address</h6>
                    <p class="mb-1 fw-bold">${order.customer_name || 'N/A'}</p>
                    <p class="text-muted small mb-1">${order.formatted_address || 'Address not available'}</p>
                    <p class="text-muted small mb-0"><i class="ti ti-phone me-1"></i>${order.mobile_no || 'N/A'}</p>
                </div>
            </div>
            
            <div class="col-md-6">
                <div class="card border-0 shadow-sm rounded-4 p-4 h-100">
                    <h6 class="fw-bold mb-3"><i class="ti ti-credit-card me-2 text-primary"></i>Payment Information</h6>
                    <div class="d-flex justify-content-between mb-2">
                        <span class="text-muted">Payment Method:</span>
                        <span class="fw-bold">${order.payment_method || 'N/A'}</span>
                    </div>
                    <div class="d-flex justify-content-between">
                        <span class="text-muted">Payment Status:</span>
                        <span class="badge ${order.payment_status === 'Success' ? 'bg-success' : 'bg-warning'}">${order.payment_status || 'Pending'}</span>
                    </div>
                </div>
            </div>
        </div>
    `;
    
    $('#order-details-content').html(html);
}

function backToDashboard() {
    // Show dashboard tab
    $('#dashboard-tab-link').click();
}
</script>
