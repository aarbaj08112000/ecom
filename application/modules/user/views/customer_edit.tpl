<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">
        <nav aria-label="breadcrumb">
            <div class="sub-header-left pull-left breadcrumb">
                <h1>
                    Customer
                    <a hijacked="yes" href="<%base_url('customer_list')%>" class="backlisting-link" title="Back to Customer Listing">
                        <i class="ti ti-chevrons-right"></i>
                        <em > Edit Customer</em>
                    </a>
                </h1>
                <br>
                <span>Edit Customer Profile</span>
            </div>
        </nav>

        <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
            <a href="<%base_url('customer_details/')%><%$customer['id']|@base64_encode|urlencode%>" class="btn btn-info me-2" title="View Details">
                <i class="ti ti-eye me-1"></i> View Details
            </a>
            <a href="<%base_url('customer_list')%>" class="btn btn-seconday" title="Back To Customer Listing">
                <i class="ti ti-arrow-left me-1"></i> 
            </a>
        </div>

        <div class="row mt-4">
            <div class="col-xl-12">
                <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Edit Customer: <%$customer['customer_name']%> (<%$customer['customer_code']%>)</h5>
                        <small class="text-muted float-end">Complete Profile Update</small>
                    </div>
                </div>

                <div class="nav-align-top mb-4 card">
                    <ul class="nav nav-tabs p-3" role="tablist">
                        <li class="nav-item">
                            <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-profile" aria-controls="navs-profile" aria-selected="true">
                                <i class="ti ti-user-circle me-1"></i> Profile
                            </button>
                        </li>
                        <li class="nav-item">
                            <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-personal" aria-controls="navs-personal" aria-selected="false">
                                <i class="ti ti-id-badge me-1"></i> Personal Info
                            </button>
                        </li>
                        <li class="nav-item">
                            <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-address" aria-controls="navs-address" aria-selected="false">
                                <i class="ti ti-map-pin me-1"></i> Address
                            </button>
                        </li>
                        <li class="nav-item">
                            <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-bank" aria-controls="navs-bank" aria-selected="false">
                                <i class="ti ti-building-bank me-1"></i> Bank Details
                            </button>
                        </li>
                    </ul>

                    <form action="<%base_url('update_full_customer')%>" method="POST" id="editFullCustomerForm" enctype="multipart/form-data">
                        <input type="hidden" name="customer_id" value="<%$customer['id']%>">
                        <div class="tab-content border-top-0">
                            <!-- Profile Tab -->
                            <div class="tab-pane fade show active" id="navs-profile" role="tabpanel">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Customer Name <span class="text-danger">*</span></label>
                                        <input type="text" name="customer_name" class="form-control required-input" value="<%$customer['customer_name']%>">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Email <span class="text-danger">*</span></label>
                                        <input type="email" name="email" class="form-control required-input" value="<%$customer['email']%>">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Mobile Number <span class="text-danger">*</span></label>
                                        <input type="text" name="mobile_no" class="form-control required-input" value="<%$customer['mobile_no']%>">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Status</label>
                                        <select name="status" class="form-select">
                                            <option value="Active" <%if $customer['status'] == 'Active' || $customer['status'] == 'Approved'%>selected<%/if%>>Active</option>
                                            <option value="Inactive" <%if $customer['status'] == 'Inactive' || $customer['status'] == 'Rejected' || $customer['status'] == 'Pending' || $customer['status'] == 'Blocked'%>selected<%/if%>>Inactive</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Profile Image</label>
                                        <input type="file" name="profile_image" class="form-control" id="profile_image_input">
                                        
                                    </div>
                                    <div class="col-md-2 mb-3">
                                       <div class="mt-3 profile-image-container">
                                            <%if $customer['profile_image'] %>
                                                <img src="<%$base_url%>public/images/customers/<%$customer['profile_image']%>" id="profile_image_preview" class="rounded shadow-sm" width="120" height="120" style="object-fit: cover;">
                                            <%else%>
                                                <img src="https://ui-avatars.com/api/?name=<%$customer['customer_name']|urlencode%>&background=random&color=fff" id="profile_image_preview" class="rounded shadow-sm" width="120" height="120">
                                            <%/if%>
                                            <div class="mt-1"><small class="text-muted">Current Profile Preview</small></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Personal Info Tab -->
                            <div class="tab-pane fade" id="navs-personal" role="tabpanel">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Date of Birth</label>
                                        <input type="date" name="dob" class="form-control" value="<%$customer['dob']%>">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Gender</label>
                                        <select name="gender" class="form-select">
                                            <option value="">Select Gender</option>
                                            <option value="Male" <%if $customer['gender'] == 'Male'%>selected<%/if%>>Male</option>
                                            <option value="Female" <%if $customer['gender'] == 'Female'%>selected<%/if%>>Female</option>
                                            <option value="Other" <%if $customer['gender'] == 'Other'%>selected<%/if%>>Other</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">GST Number</label>
                                        <input type="text" name="gst_no" class="form-control" value="<%$customer['gst_no']%>">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">PAN Number</label>
                                        <input type="text" name="pan_no" class="form-control" value="<%$customer['pan_no']%>">
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <label class="form-label">Identity Details (Custom Fields)</label>
                                        <textarea name="identity_details" class="form-control" rows="3"><%$customer['identity_details']%></textarea>
                                    </div>
                                </div>
                            </div>

                            <!-- Address Tab -->
                            <div class="tab-pane fade" id="navs-address" role="tabpanel">
                                <%if count($addresses) > 0 %>
                                    <%assign var="addr" value=$addresses[0] %>
                                    <div class="row">
                                        <div class="col-md-12 mb-3">
                                            <label class="form-label">Full Address</label>
                                            <textarea name="address" class="form-control" rows="2"><%$addr['address']%></textarea>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label class="form-label">City</label>
                                            <input type="text" name="city" class="form-control" value="<%$addr['city']%>">
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label class="form-label">State</label>
                                            <input type="text" name="state" class="form-control" value="<%$addr['state']%>">
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label class="form-label">Pincode</label>
                                            <input type="text" name="pincode" class="form-control" value="<%$addr['pincode']%>">
                                        </div>
                                    </div>
                                <%else%>
                                    <div class="alert alert-info">No address records found. Fields will create a new primary record.</div>
                                    <div class="row">
                                        <div class="col-md-12 mb-3">
                                            <label class="form-label">Full Address</label>
                                            <textarea name="address" class="form-control" rows="2"></textarea>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label class="form-label">City</label>
                                            <input type="text" name="city" class="form-control">
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label class="form-label">State</label>
                                            <input type="text" name="state" class="form-control">
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label class="form-label">Pincode</label>
                                            <input type="text" name="pincode" class="form-control">
                                        </div>
                                    </div>
                                <%/if%>
                            </div>

                            <!-- Bank Tab -->
                            <div class="tab-pane fade" id="navs-bank" role="tabpanel">
                                <%if count($banks) > 0 %>
                                    <%assign var="bank" value=$banks[0] %>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Account Holder Name</label>
                                            <input type="text" name="account_holder_name" class="form-control" value="<%$bank['account_holder_name']%>">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Bank Name</label>
                                            <input type="text" name="bank_name" class="form-control" value="<%$bank['bank_name']%>">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Account Number</label>
                                            <input type="text" name="account_no" class="form-control" value="<%$bank['account_no']%>">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">IFSC Code</label>
                                            <input type="text" name="ifsc_code" class="form-control" value="<%$bank['ifsc_code']%>">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Branch Name</label>
                                            <input type="text" name="branch_name" class="form-control" value="<%$bank['branch_name']%>">
                                        </div>
                                    </div>
                                <%else%>
                                    <div class="alert alert-info">No bank records found. Fields will create a new primary record.</div>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Account Holder Name</label>
                                            <input type="text" name="account_holder_name" class="form-control">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Bank Name</label>
                                            <input type="text" name="bank_name" class="form-control">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Account Number</label>
                                            <input type="text" name="account_no" class="form-control">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">IFSC Code</label>
                                            <input type="text" name="ifsc_code" class="form-control">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Branch Name</label>
                                            <input type="text" name="branch_name" class="form-control">
                                        </div>
                                    </div>
                                <%/if%>
                            </div>

                            <div class="mt-4 text-end">
                                <a href="<%base_url('customer_list')%>" class="btn btn-label-secondary me-2">Cancel</a>
                                <button type="submit" class="btn btn-primary">Save All Changes</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var base_url = <%$base_url|@json_encode%>
</script>
<script src="<%$base_url%>public/js/admin_panel/customer_edit.js"></script>
