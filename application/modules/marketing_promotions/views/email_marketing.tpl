
<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">
        <nav aria-label="breadcrumb">
            <div class="sub-header-left pull-left breadcrumb">
                <h1>
                    Marketing & Promotion
                    <a href="javascript:void(0)" class="backlisting-link">
                        <i class="ti ti-chevrons-right"></i>
                        <em>Email Marketing</em>
                    </a>
                </h1>
                <br>
                <span>Email Marketing</span>
            </div>
        </nav>
        <!-- Stats Overview -->
        <div class="row g-4 mb-4">
            <div class="col-sm-6 col-xl-3">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex align-items-start justify-content-between">
                            <div class="content-left">
                                <span>Subscribers</span>
                                <div class="d-flex align-items-center my-2">
                                    <h3 class="mb-0 me-2"><%$stats.total_subscribers|number_format%></h3>
                                    <p class="text-success mb-0">(+12%)</p>
                                </div>
                                <p class="mb-0">Total Subscribers</p>
                            </div>
                            <div class="avatar">
                                <span class="avatar-initial rounded bg-label-primary">
                                    <i class="ti ti-users ti-sm"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-xl-3">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex align-items-start justify-content-between">
                            <div class="content-left">
                                <span>Sent Emails</span>
                                <div class="d-flex align-items-center my-2">
                                    <h3 class="mb-0 me-2"><%$stats.total_sent|number_format%></h3>
                                    <p class="text-success mb-0">(+5%)</p>
                                </div>
                                <p class="mb-0">All Time</p>
                            </div>
                            <div class="avatar">
                                <span class="avatar-initial rounded bg-label-info">
                                    <i class="ti ti-mail-opened ti-sm"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-xl-3">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex align-items-start justify-content-between">
                            <div class="content-left">
                                <span>Total Opens</span>
                                <div class="d-flex align-items-center my-2">
                                    <h3 class="mb-0 me-2"><%$stats.total_opens|number_format%></h3>
                                    <p class="text-success mb-0">
                                        <%if $stats.total_sent > 0%>
                                            (<%math equation="(x/y)*100" x=$stats.total_opens y=$stats.total_sent format="%.1f" %>%)
                                        <%else%>
                                            (0%)
                                        <%/if%>
                                    </p>
                                </div>
                                <p class="mb-0">Avg. Open Rate</p>
                            </div>
                            <div class="avatar">
                                <span class="avatar-initial rounded bg-label-success">
                                    <i class="ti ti-chart-bar ti-sm"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-xl-3">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex align-items-start justify-content-between">
                            <div class="content-left">
                                <span>Total Clicks</span>
                                <div class="d-flex align-items-center my-2">
                                    <h3 class="mb-0 me-2"><%$stats.total_clicks|number_format%></h3>
                                    <p class="text-success mb-0">
                                        <%if $stats.total_sent > 0%>
                                            (<%math equation="(x/y)*100" x=$stats.total_clicks y=$stats.total_sent format="%.1f" %>%)
                                        <%else%>
                                            (0%)
                                        <%/if%>
                                    </p>
                                </div>
                                <p class="mb-0">Avg. Click Rate</p>
                            </div>
                            <div class="avatar">
                                <span class="avatar-initial rounded bg-label-warning">
                                    <i class="ti ti-mouse ti-sm"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
            <button class="btn btn-seconday" type="button" id="downloadCSVBtn" title="Download CSV"><i class="ti ti-file-type-csv"></i></button>
            <button class="btn btn-seconday" type="button" id="downloadPDFBtn" title="Download PDF"><i class="ti ti-file-type-pdf"></i></button>
            <button type="button" class="btn btn-seconday" data-bs-toggle="modal" data-bs-target="#createCampaign" title="Create Campaign">
                <i class="ti ti-plus"></i>
            </button>
        </div>

        <div class="w-100 mt-4">
            <input type="text" name="reason" placeholder="Filter Search" class="form-control serarch-filter-input m-3 me-0" id="serarch-filter-input">
        </div>

        <!-- Recent Campaigns -->
        <div class="card p-0 mt-4 w-100">
            <div class="card-body p-0">
                <div class="table-responsive text-nowrap">
                    <table class="table table-striped w-100" id="campaignsTable" border="1" cellspacing="0" cellpadding="0" style="border-collapse: collapse;" border-color="#e1e1e1">
                        <thead>
                            <tr>
                                <th>Campaign Name</th>
                                <th>Status</th>
                                <th>Audience</th>
                                <th>Sent</th>
                                <th>Opens</th>
                                <th>Clicks</th>
                                <th>Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%if $campaigns%>
                                <%foreach from=$campaigns item=val%>
                                    <tr>
                                        <td><strong><%$val.campaign_name%></strong></td>
                                        <td>
                                            <%if $val.status eq 'Completed' or $val.status eq 'Sent'%>
                                                <span class="status-badge status-delivered">Sent</span>
                                            <%elseif $val.status eq 'Scheduled'%>
                                                <span class="status-badge status-pending">Scheduled</span>
                                            <%else%>
                                                <span class="status-badge status-inactive">Draft</span>
                                            <%/if%>
                                        </td>
                                        <td><%$val.target_audience|capitalize%></td>
                                        <td><%$val.sent_count%></td>
                                        <td><%$val.open_count%></td>
                                        <td><%$val.click_count%></td>
                                        <td>
                                            <%if $val.status eq 'Scheduled' and $val.scheduled_date%>
                                                Scheduled: <%$val.scheduled_date|date_format:"%b %d, %Y"%>
                                            <%else%>
                                                <%$val.added_date|date_format:"%b %d, %Y"%>
                                            <%/if%>
                                        </td>
                                        <td>
                                            <a href="javascript:void(0);" class="edit_campaign" data-id="<%$val.id%>" title="Edit">
                                                <i class="ti ti-edit edit-part"></i>
                                            </a>
                                            <span class="delete_campaign ms-2" data-id="<%$val.id%>" title="Delete" style="cursor:pointer;">
                                                <i class="ti ti-trash text-danger"></i>
                                            </span>
                                        </td>
                                    </tr>
                                <%/foreach%>
                            <%/if%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Create/Edit Campaign Modal -->
        <div class="modal fade" id="createCampaign" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Create New Campaign</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="campaignForm">
                        <input type="hidden" name="id" id="campaign_id">
                        <div class="modal-body">
                            <div class="row g-3">
                                <div class="col-12">
                                    <label class="form-label" for="campaignName">Campaign Name</label>
                                    <input type="text" name="campaign_name" id="campaignName" class="form-control" placeholder="e.g. Winter Sale 2025" required />
                                </div>
                                <div class="col-12">
                                    <label class="form-label" for="emailSubject">Email Subject</label>
                                    <input type="text" name="subject" id="emailSubject" class="form-control" placeholder="The big reveal is here!" required />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label" for="targetAudience">Target Audience</label>
                                    <select name="target_audience" id="targetAudience" class="form-select">
                                        <option value="all">All Subscribers</option>
                                        <option value="customers">Recent Customers</option>
                                        <option value="inactive">Inactive Users</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label" for="scheduledDate">Scheduled Date</label>
                                    <input type="date" name="scheduled_date" id="scheduledDate" class="form-control" />
                                </div>
                                <div class="col-md-12">
                                    <label class="form-label" for="campaignStatus">Status</label>
                                    <select name="status" id="campaignStatus" class="form-select">
                                        <option value="Draft">Draft</option>
                                        <option value="Scheduled">Scheduled</option>
                                        <option value="Sent">Sent</option>
                                    </select>
                                </div>
                                <div class="col-12">
                                    <label class="form-label" for="campaignContent">Campaign Content</label>
                                    <textarea name="content" class="form-control" id="campaignContent" rows="4" placeholder="Enter your email content here..."></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" id="saveCampaignBtn">Save Campaign</button>
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
<script src="<%$base_url%>public/js/admin_panel/email_marketing.js"></script>
