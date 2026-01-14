<style>
    .status-badge {
    width: 150px !important;
    }
</style>
<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">
        <nav aria-label="breadcrumb">
            <div class="sub-header-left pull-left breadcrumb">
                <h1>
                    Shipping & Delivery
                    <a href="javascript:void(0)" class="backlisting-link">
                        <i class="ti ti-chevrons-right"></i>
                        <em>Order Tracking</em>
                    </a>
                </h1>
                <br>
                <span>Manage Order Tracking Shipments</span>
            </div>
        </nav>

        <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
            <button class="btn btn-seconday" type="button" id="downloadCSVBtn" title="Download CSV"><i class="ti ti-file-type-csv"></i></button>
            <button class="btn btn-seconday" type="button" id="downloadPDFBtn" title="Download PDF"><i class="ti ti-file-type-pdf"></i></button>
            <button type="button" class="btn btn-seconday" data-bs-toggle="modal" data-bs-target="#createTrackingModal" title="Add Tracking Order">
                <i class="ti ti-plus"></i>
            </button>
        </div>

        <div class="w-100 mt-4">
            <input type="text" placeholder="Filter Search" class="form-control serarch-filter-input m-3 me-0" id="serarch-filter-input">
        </div>

        <!-- Order Tracking Table -->
        <div class="card p-0 mt-4 w-100">
            <div class="card-body p-0">
                <div class="table-responsive text-nowrap">
                    <table class="table table-striped w-100" id="orderTrackingTable" border="1" cellspacing="0" cellpadding="0" style="border-collapse: collapse;" border-color="#e1e1e1">
                        <thead class="table-dark">
                            <tr>
                                <th>Order ID</th>
                                <th>Tracking Number</th>
                                <th>Carrier</th>
                                <th class="text-center">Status</th>
                                <th>Last Location</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%if $trackings%>
                                <%foreach from=$trackings item=val%>
                                    <tr>
                                        <td><strong><%$val.order_id%></strong></td>
                                        <td><%$val.tracking_number%></td>
                                        <td><%$val.carrier_name%></td>
                                        <td class="text-center">
                                            <%if $val.current_status eq 'Delivered'%>
                                                <span class="status-badge status-delivered">Delivered</span>
                                            <%elseif $val.current_status eq 'Returned'%>
                                                <span class="status-badge status-returned">Returned</span>
                                            <%elseif $val.current_status eq 'In Transit'%>
                                                <span class="status-badge status-shipped">In Transit</span>
                                            <%elseif $val.current_status eq 'Out for Delivery'%>
                                                <span class="status-badge status-pending">Out for Delivery</span>
                                            <%else%>
                                                <span class="status-badge status-processing"><%$val.current_status%></span>
                                            <%/if%>
                                        </td>
                                        <td><%$val.last_location%></td>
                                        <td>
                                            <div class="dropdown">
                                                <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="ti ti-dots-vertical"></i></button>
                                                <div class="dropdown-menu">
                                                    <a class="dropdown-item edit_tracking" href="javascript:void(0);" data-id="<%$val.id%>"><i class="ti ti-pencil me-1"></i> Edit Status</a>
                                                    <a class="dropdown-item delete_tracking" href="javascript:void(0);" data-id="<%$val.id%>"><i class="ti ti-trash me-1"></i> Delete</a>
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

        <!-- Create/Edit Tracking Modal -->
        <div class="modal fade" id="createTrackingModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Order Tracking</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="trackingForm">
                        <input type="hidden" name="id" id="tracking_id">
                        <div class="modal-body">
                            <div class="row g-3">
                                <div class="col-12">
                                    <label class="form-label">Order ID</label>
                                    <input type="text" name="order_id" id="orderId" class="form-control" placeholder="e.g. ORD-2024-001" required />
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Tracking Number</label>
                                    <input type="text" name="tracking_number" id="trackingNumber" class="form-control" placeholder="e.g. 123456789" required />
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Carrier Name</label>
                                    <input type="text" name="carrier_name" id="carrierName" class="form-control" placeholder="e.g. FedEx, DHL" />
                                </div>
                                <div class="col-md-12">
                                    <label class="form-label">Current Status</label>
                                    <select name="current_status" id="currentStatus" class="form-select">
                                        <option value="Dispatched">Dispatched</option>
                                        <option value="In Transit">In Transit</option>
                                        <option value="Out for Delivery">Out for Delivery</option>
                                        <option value="Delivered">Delivered</option>
                                        <option value="Returned">Returned</option>
                                    </select>
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Last Location</label>
                                    <input type="text" name="last_location" id="lastLocation" class="form-control" placeholder="e.g. Warehouse A, New York" />
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Estimated Delivery Date</label>
                                    <input type="date" name="estimated_delivery" id="estimatedDelivery" class="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" id="saveTrackingBtn">Save Changes</button>
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
<script src="<%$base_url%>public/js/admin_panel/shipping/order_tracking.js"></script>
