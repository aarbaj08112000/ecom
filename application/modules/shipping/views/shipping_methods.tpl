<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">
        <nav aria-label="breadcrumb">
            <div class="sub-header-left pull-left breadcrumb">
                <h1>
                    Shipping & Delivery
                    <a href="javascript:void(0)" class="backlisting-link">
                        <i class="ti ti-chevrons-right"></i>
                        <em>Shipping Methods</em>
                    </a>
                </h1>
                <br>
                <span>Manage Shipping Methods</span>
            </div>
        </nav>

        <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
            <button class="btn btn-seconday" type="button" id="downloadCSVBtn" title="Download CSV"><i class="ti ti-file-type-csv"></i></button>
            <button class="btn btn-seconday" type="button" id="downloadPDFBtn" title="Download PDF"><i class="ti ti-file-type-pdf"></i></button>
            <button type="button" class="btn btn-seconday" data-bs-toggle="modal" data-bs-target="#createShippingMethod" title="Add Shipping Method">
                <i class="ti ti-plus"></i>
            </button>
        </div>

        <div class="w-100 mt-4">
            <input type="text" name="reason" placeholder="Filter Search" class="form-control serarch-filter-input m-3 me-0" id="serarch-filter-input">
        </div>

        <!-- Shipping Methods Table -->
        <div class="card p-0 mt-4 w-100">
            <div class="card-body p-0">
                <div class="table-responsive text-nowrap">
                    <table class="table table-striped w-100" id="shippingMethodsTable" border="1" cellspacing="0" cellpadding="0" style="border-collapse: collapse;" border-color="#e1e1e1">
                        <thead class="table-dark">
                            <tr>
                                <th>Method Name</th>
                                <th>Carrier</th>
                                <th>Shipping Fee</th>
                                <th>Delivery Days</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%if $methods%>
                                <%foreach from=$methods item=val%>
                                    <tr>
                                        <td><strong><%$val.method_name%></strong></td>
                                        <td><%$val.carrier%></td>
                                        <td><%if $val.shipping_fee > 0%>$ <%$val.shipping_fee|number_format:2%><%else%>Free<%/if%></td>
                                        <td><%$val.min_delivery_days%> - <%$val.max_delivery_days%> Days</td>
                                        <td>
                                            <%if $val.status eq 'Active'%>
                                                <span class="status-badge status-active">Active</span>
                                            <%else%>
                                                <span class="status-badge status-inactive">Inactive</span>
                                            <%/if%>
                                        </td>
                                        <td>
                                            <div class="dropdown">
                                                <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="ti ti-dots-vertical"></i></button>
                                                <div class="dropdown-menu">
                                                    <a class="dropdown-item edit_method" href="javascript:void(0);" data-id="<%$val.id%>"><i class="ti ti-pencil me-1"></i> Edit</a>
                                                    <a class="dropdown-item delete_method" href="javascript:void(0);" data-id="<%$val.id%>"><i class="ti ti-trash me-1"></i> Delete</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                <%/foreach%>
                            <%/if%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Create/Edit Shipping Method Modal -->
        <div class="modal fade" id="createShippingMethod" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Shipping Method</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="shippingMethodForm">
                        <input type="hidden" name="id" id="method_id">
                        <div class="modal-body">
                            <div class="row g-3">
                                <div class="col-12">
                                    <label class="form-label" for="methodName">Method Name</label>
                                    <input type="text" name="method_name" id="methodName" class="form-control" placeholder="e.g. Standard Shipping" required />
                                </div>
                                <div class="col-12">
                                    <label class="form-label" for="carrier">Carrier</label>
                                    <input type="text" name="carrier" id="carrier" class="form-control" placeholder="e.g. FedEx, DHL" required />
                                </div>
                                <div class="col-12">
                                    <label class="form-label" for="shippingFee">Shipping Fee ($)</label>
                                    <input type="number" step="0.01" name="shipping_fee" id="shippingFee" class="form-control" placeholder="0.00" required />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label" for="minDays">Min Delivery Days</label>
                                    <input type="number" name="min_delivery_days" id="minDays" class="form-control" placeholder="3" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label" for="maxDays">Max Delivery Days</label>
                                    <input type="number" name="max_delivery_days" id="maxDays" class="form-control" placeholder="5" />
                                </div>
                                <div class="col-12">
                                    <label class="form-label" for="methodStatus">Status</label>
                                    <select name="status" id="methodStatus" class="form-select">
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" id="saveMethodBtn">Save Changes</button>
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
<script src="<%$base_url%>public/js/admin_panel/shipping/shipping_methods.js"></script>
