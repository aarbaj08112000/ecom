<%include file="layout/header.tpl"%>

<div class="d-flex align-items-center justify-content-center py-5" style="min-height: 85vh; background: url('https://www.transparenttextures.com/patterns/creampaper.png'), linear-gradient(135deg, #fdfbf7 0%, #f4f1de 100%);">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12">
                <div class="card border-0 shadow-lg rounded-5 overflow-hidden">
                    <div class="row g-0">
                        <!-- Image Side -->
                        <div class="col-lg-6 d-none d-lg-block position-relative">
                             <img src="https://images.unsplash.com/photo-1497366216548-37526070297c?q=80&w=800&auto=format&fit=crop" class="img-fluid h-100 w-100 object-fit-cover" alt="Login Workspace" onerror="this.src='https://placehold.co/800x1000/e2e8f0/84a98c?text=Login';">
                             <div class="position-absolute top-0 start-0 w-100 h-100 bg-dark opacity-25"></div>
                             <div class="position-absolute bottom-0 start-0 w-100 p-5 text-white">
                                  <h2 class="fw-bold display-6 mb-2" style="font-family: var(--font-heading);">Welcome Back</h2>
                                  <p class="lead small mb-0 opacity-90">Access your account and continue your creative journey.</p>
                             </div>
                        </div>
                        
                        <!-- Form Side -->
                        <div class="col-lg-6 bg-white p-5">
                            <div class="p-lg-4">
                                <div class="text-center mb-5">
                                   <div class="bg-primary-subtle text-primary rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                                       <i class="ti ti-brush fs-2"></i>
                                   </div>
                                   <h2 class="fw-bold text-dark" style="font-family: var(--font-heading);">Welcome Back</h2>
                                   <p class="text-muted">Sign in to continue to Craftology</p>
                                </div>
                                
                                <form id="loginForm">
                                    <div class="form-floating mb-3">
                                        <input type="email" class="form-control bg-light border-0 rounded-3" id="email" name="email" placeholder="name@example.com" value="<%if isset($remembered_email)%><%$remembered_email%><%/if%>">
                                        <label for="email">Email address</label>
                                        <div id="emailErr" class="text-danger small mt-1"></div>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control bg-light border-0 rounded-3" id="password" name="password" placeholder="Password">
                                        <label for="password">Password</label>
                                        <div id="passwordErr" class="text-danger small mt-1"></div>
                                    </div>
                                    
                                    <div class="d-flex justify-content-between align-items-center mb-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="remember" name="remember">
                                            <label class="form-check-label text-muted small" for="remember">Remember me</label>
                                        </div>
                                        <a href="<%base_url('shop/forgot-password')%>" class="text-primary text-decoration-none fw-bold small">Forgot Password?</a>
                                    </div>
                                    
                                    <button type="submit" id="loginBtn" class="btn btn-primary w-100 rounded-pill py-3 fw-bold btn-animate shadow-sm mb-4">Sign In</button>
                                    
                                    <div class="text-center">
                                        <p class="text-muted mb-0">Don't have an account? <a href="<%base_url('shop/register')%>" class="text-primary fw-bold text-decoration-none">Create Account</a></p>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%include file="layout/footer.tpl"%>
