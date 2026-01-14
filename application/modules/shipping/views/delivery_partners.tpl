<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">
        <nav aria-label="breadcrumb">
            <div class="sub-header-left pull-left breadcrumb">
                <h1>
                    Shipping & Delivery
                    <a href="javascript:void(0)" class="backlisting-link">
                        <i class="ti ti-chevrons-right"></i>
                        <em>Delivery Partners</em>
                    </a>
                </h1>
                <br>
                <span>Manage Delivery Partners</span>
            </div>
        </nav>

        <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
            <button class="btn btn-seconday" type="button" id="downloadCSVBtn" title="Download CSV"><i class="ti ti-file-type-csv"></i></button>
            <button class="btn btn-seconday" type="button" id="downloadPDFBtn" title="Download PDF"><i class="ti ti-file-type-pdf"></i></button>
            <button type="button" class="btn btn-seconday" data-bs-toggle="modal" data-bs-target="#createPartnerModal" title="Add Delivery Partner">
                <i class="ti ti-plus"></i>
            </button>
        </div>

        <div class="w-100 mt-4">
            <input type="text" placeholder="Filter Search" class="form-control serarch-filter-input m-3 me-0" id="serarch-filter-input">
        </div>

        <!-- Delivery Partners Table -->
        <div class="card p-0 mt-4 w-100">
            <div class="card-body p-0">
                <div class="table-responsive text-nowrap">
                    <table class="table table-striped w-100" id="deliveryPartnersTable" border="1" cellspacing="0" cellpadding="0" style="border-collapse: collapse;" border-color="#e1e1e1">
                        <thead class="table-dark">
                            <tr>
                                <th>Partner Name</th>
                                <th>Contact Person</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%if $partners%>
                                <%foreach from=$partners item=val%>
                                    <tr>
                                        <td><strong><%$val.partner_name%></strong></td>
                                        <td><%$val.contact_person%></td>
                                        <td><%$val.email%></td>
                                        <td><%$val.phone%></td>
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
                                                    <a class="dropdown-item edit_partner" href="javascript:void(0);" data-id="<%$val.id%>"><i class="ti ti-pencil me-1"></i> Edit</a>
                                                    <a class="dropdown-item delete_partner" href="javascript:void(0);" data-id="<%$val.id%>"><i class="ti ti-trash me-1"></i> Delete</a>
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

        <!-- Create/Edit Partner Modal -->
        <div class="modal fade" id="createPartnerModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Delivery Partner</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="partnerForm">
                        <input type="hidden" name="id" id="partner_id">
                        <div class="modal-body">
                            <div class="row g-3">
                                <div class="col-12">
                                    <label class="form-label">Partner Name</label>
                                    <input type="text" name="partner_name" id="partnerName" class="form-control" placeholder="e.g. FedEx Express" required />
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Contact Person</label>
                                    <input type="text" name="contact_person" id="contactPerson" class="form-control" placeholder="e.g. John Doe" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Email</label>
                                    <input type="email" name="email" id="partnerEmail" class="form-control" placeholder="partner@example.com" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Phone</label>
                                    <input type="text" name="phone" id="partnerPhone" class="form-control" placeholder="+1 555-0000" />
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Tracking URL Format</label>
                                    <input type="text" name="tracking_url_format" id="trackingUrl" class="form-control" placeholder="https://example.com/track?id={tracking_number}" />
                                    <small class="text-muted">Use {tracking_number} as a placeholder</small>
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Status</label>
                                    <select name="status" id="partnerStatus" class="form-select">
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" id="savePartnerBtn">Save Changes</button>
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
<script src="<%$base_url%>public/js/admin_panel/shipping/delivery_partners.js"></script>
