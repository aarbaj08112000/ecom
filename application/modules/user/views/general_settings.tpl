    <div class="container-xxl flex-grow-1 container-p-y">
    <nav aria-label="breadcrumb">
      <div class="sub-header-left pull-left breadcrumb">
        <h1>
          Settings
          <a hijacked="yes" href="javascript:void(0)" class="backlisting-link" title="Back to Issue Request Listing" >
            <i class="ti ti-chevrons-right" ></i>
            <em >Manage Settings</em></a>
          </h1>
          <br>
          <span >General Settings</span>
        </div>
      </nav>

    <div class="row mt-4">
        <div class="col-12">
            <div class="nav-align-top mb-4">
                <ul class="nav nav-pills mb-3" role="tablist">
                    <%foreach from=$grouped_settings key=group item=settings name=groups%>
                        <li class="nav-item">
                            <button type="button" class="nav-link <%if $smarty.foreach.groups.first%>active<%/if%>" role="tab" data-bs-toggle="tab" data-bs-target="#tab-<%($group|replace:' ':'-'|replace:'&':''|lower)%>" aria-controls="tab-<%($group|replace:' ':'-'|replace:'&':''|lower)%>" aria-selected="<%if $smarty.foreach.groups.first%>true<%else%>false<%/if%>">
                                <%$group%>
                            </button>
                        </li>
                    <%/foreach%>
                </ul>
                <div class="tab-content p-0 bg-transparent shadow-none">
                    <%foreach from=$grouped_settings key=group item=settings name=contents%>
                        <div class="tab-pane fade <%if $smarty.foreach.contents.first%>show active<%/if%>" id="tab-<%($group|replace:' ':'-'|replace:'&':''|lower)%>" role="tabpanel">
                            <div class="row g-4">
                                <%foreach from=$settings item=setting%>
                                    <div class="col-md-6 col-lg-4">
                                        <div class="card h-100 shadow-sm border-0 setting-card" data-name="<%$setting['name']%>" data-type="<%$setting['type']%>" data-title="<%$setting['title']%>">
                                            <div class="card-body p-4">
                                                <div class="d-flex justify-content-between align-items-center mb-2">
                                                    <h6 class="setting-title mb-0"><%$setting['title']%></h6>
                                                    <%if $user_role == 'Super Admin' || $setting['is_edit'] == 'Yes'%>
                                                        <button class="btn btn-icon btn-sm rounded-circle edit-setting-btn edit-setting" title="Edit">
                                                            <i class="ti ti-pencil fs-5"></i>
                                                        </button>
                                                    <%/if%>
                                                </div>
                                                <p class="setting-description small text-muted mb-3"><%$setting['description']%></p>
                                                
                                                <div class="setting-value-container rounded-3 p-3 bg-white border">
                                                    <%if $setting['type'] == 'file'%>
                                                        <div class="d-flex align-items-center justify-content-center h-100" style="min-height: 100px;">
                                                            <%if $setting['value']%>
                                                                <%assign var="file_parts" value=explode('.', $setting['value'])%>
                                                                <%assign var="file_ext" value=$file_parts|@end|lower%>
                                                                <%if $file_ext == 'pdf' || $file_ext == 'doc' || $file_ext == 'docx'%>
                                                                    <div class="text-center">
                                                                        <i class="ti ti-file-text fs-1 text-primary mb-1 d-block"></i>
                                                                        <a href="<%$base_url%><%$setting['value']%>" target="_blank" class="btn btn-sm btn-outline-primary rounded-pill px-3 py-1 mt-1">
                                                                            <i class="ti ti-eye me-1"></i>View Document
                                                                        </a>
                                                                    </div>
                                                                <%else%>
                                                                    <img src="<%$base_url%><%$setting['value']%>" alt="<%$setting['title']%>" class="img-fluid rounded shadow-sm" style="max-height: 80px; object-fit: contain;">
                                                                <%/if%>
                                                            <%else%>
                                                                <div class="text-center">
                                                                    <i class="ti ti-photo-off fs-2 text-light mb-1 d-block"></i>
                                                                    <span class="text-muted small italic">No file</span>
                                                                </div>
                                                            <%/if%>
                                                        </div>
                                                    <%elseif $setting['type'] == 'check_box'%>
                                                        <div class="d-flex align-items-center gap-2">
                                                            <span class="status-indicator <%if $setting['value'] == 'Yes'%>bg-success<%else%>bg-danger<%/if%>"></span>
                                                            <span class="fw-semibold text-dark"><%$setting['value']%></span>
                                                        </div>
                                                    <%elseif $setting['type'] == 'textarea'%>
                                                        <div class="setting-text-value text-muted small" style="max-height: 100px; overflow-y: auto;">
                                                            <%$setting['value']%>
                                                        </div>
                                                    <%else%>
                                                        <div class="setting-text-value fw-medium text-dark text-break"><%$setting['value']%></div>
                                                    <%/if%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <%/foreach%>
                            </div>
                        </div>
                    <%/foreach%>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Edit Setting Modal -->
<div class="modal fade" id="editSettingModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg">
            <div class="modal-header bg-light border-bottom">
                <h5 class="modal-title fw-bold text-dark" id="modalSettingTitle">Edit Setting</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="editSettingForm" enctype="multipart/form-data">
                <div class="modal-body p-4">
                    <input type="hidden" name="name" id="settingName">
                    <input type="hidden" name="type" id="settingType">
                    
                    <div id="dynamicInputContainer">
                        <!-- Dynamic fields will be rendered here -->
                    </div>
                </div>
                <div class="modal-footer bg-light border-top p-3">
                    <button type="button" class="btn btn-label-secondary px-4" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary px-4" id="saveSettingBtn">
                        <span class="spinner-border spinner-border-sm d-none me-2" role="status" aria-hidden="true"></span>
                        Save Changes
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="<%$base_url%>public/js/admin/general_settings.js"></script>

<style>
:root {
    --card-hover-y: -8px;
    --setting-title-color: #2f2b3d;
}

.setting-card {
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    background: #fff;
    border: 1px solid rgba(0,0,0,0.05) !important;
}

.setting-card:hover {
    transform: translateY(var(--card-hover-y));
    box-shadow: 0 12px 24px -8px rgba(0, 0, 0, 0.15) !important;
}

.setting-title {
    color: var(--setting-title-color);
    font-weight: 600;
    font-size: 1.05rem;
    letter-spacing: -0.01em;
}

.setting-description {
    line-height: 1.4;
}

.edit-setting-btn {
    background: #f8f9fa;
    color: #6c757d;
    border: 1px solid #e9ecef;
    transition: all 0.2s;
}

.edit-setting-btn:hover {
    background: #696cff;
    color: #fff;
    border-color: #696cff;
}

.setting-value-container {
    background-color: #fdfdfd !important;
    min-height: 60px;
}

.status-indicator {
    width: 10px;
    height: 10px;
    border-radius: 50%;
    display: inline-block;
}

.nav-pills .nav-link {
    color: #6c757d;
    padding: 0.6rem 1.25rem;
    font-weight: 500;
    border: 1px solid transparent;
}

.nav-pills .nav-link.active {
    background-color: #696cff !important;
    box-shadow: 0 4px 8px -2px rgba(105, 108, 255, 0.4);
}

.nav-pills .nav-link:not(.active):hover {
    background-color: #f8f9fa;
    color: #696cff;
}

/* Scrollbar styling for textareas */
.setting-text-value::-webkit-scrollbar {
    width: 6px;
}
.setting-text-value::-webkit-scrollbar-track {
    background: #f1f1f1;
    border-radius: 10px;
}
.setting-text-value::-webkit-scrollbar-thumb {
    background: #ddd;
    border-radius: 10px;
}
.setting-text-value::-webkit-scrollbar-thumb:hover {
    background: #ccc;
}
</style>
