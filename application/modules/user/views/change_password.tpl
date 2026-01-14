<div class="container-fluid py-4">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-white border-bottom-0 pt-4 px-4">
                    <h4 class="mb-0 fw-bold"><i class="las la-key me-2 text-primary"></i>Change Password</h4>
                    <p class="text-muted small mb-0">Ensure your account is using a long, random password to stay secure.</p>
                </div>
                <div class="card-body p-4">
                    <form id="formChangePassword" method="POST">
                        <div class="mb-3">
                            <label class="form-label" for="current_password">Current Password</label>
                            <div class="input-group input-group-merge">
                                <span class="input-group-text"><i class="las la-lock"></i></span>
                                <input type="password" class="form-control" id="current_password" name="current_password" placeholder="············" required />
                                <span class="input-group-text cursor-pointer toggle-password" data-target="#current_password"><i class="las la-eye"></i></span>
                            </div>
                            <div id="current_passwordErr" class="error-msg"></div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label" for="new_password">New Password</label>
                            <div class="input-group input-group-merge">
                                <span class="input-group-text"><i class="las la-shield-alt"></i></span>
                                <input type="password" class="form-control" id="new_password" name="new_password" placeholder="············" required />
                                <span class="input-group-text cursor-pointer toggle-password" data-target="#new_password"><i class="las la-eye"></i></span>
                            </div>
                            <div id="new_passwordErr" class="error-msg"></div>
                            <div class="form-text small">Password must be at least 8 characters long.</div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label" for="confirm_password">Confirm New Password</label>
                            <div class="input-group input-group-merge">
                                <span class="input-group-text"><i class="las la-check-circle"></i></span>
                                <input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="············" required />
                                <span class="input-group-text cursor-pointer toggle-password" data-target="#confirm_password"><i class="las la-eye"></i></span>
                            </div>
                            <div id="confirm_passwordErr" class="error-msg"></div>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary py-2 fw-semibold shadow-sm hover-scale">
                                <i class="las la-save me-1"></i> Update Password
                            </button>
                            <a href="<%base_url('dashboard')%>" class="btn btn-outline-secondary py-2 border-0">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .error-msg {
        color: #ea5455;
        font-size: 0.85rem;
        margin-top: 5px;
    }
    .hover-scale {
        transition: transform 0.2s;
    }
    .hover-scale:hover {
        transform: translateY(-2px);
    }
    .cursor-pointer {
        cursor: pointer;
    }
</style>

<script type="text/javascript" src="<%base_url()%>public/js/change_password.js"></script>
