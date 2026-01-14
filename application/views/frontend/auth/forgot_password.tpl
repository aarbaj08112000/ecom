<%include file="layout/header.tpl"%>

<div class="d-flex align-items-center justify-content-center py-5" style="min-height: 85vh; background: url('https://www.transparenttextures.com/patterns/creampaper.png'), linear-gradient(135deg, #fdfbf7 0%, #f4f1de 100%);">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-5 col-lg-6 col-md-8">
                <div class="card border-0 shadow-lg rounded-5 overflow-hidden">
                    <div class="card-body p-5 bg-white text-center">
                        <div class="bg-warning-subtle text-warning rounded-circle d-inline-flex align-items-center justify-content-center mb-4" style="width: 70px; height: 70px;">
                            <i class="ti ti-lock-open fs-2"></i>
                        </div>
                        <h2 class="fw-bold text-dark mb-2" style="font-family: var(--font-heading);">Forgot Password?</h2>
                        <p class="text-muted mb-4">Don't worry, it happens! Enter your email and we'll send you a reset link.</p>
                        
                        <form id="forgotPasswordForm">
                            <div class="form-floating mb-4">
                                <input type="email" class="form-control bg-light border-0 rounded-3" id="email" name="email" placeholder="name@example.com">
                                <label for="email">Email address</label>
                                <div id="emailErr" class="text-danger small mt-1 text-start"></div>
                            </div>
                            
                            <button type="submit" id="forgotPasswordBtn" class="btn btn-warning w-100 rounded-pill py-3 fw-bold text-white shadow-sm mb-4 btn-animate">Send Reset Link</button>
                            
                            <a href="<%base_url('shop/login')%>" class="text-muted small text-decoration-none"><i class="ti ti-arrow-left me-1"></i> Back to Login</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%include file="layout/footer.tpl"%>
