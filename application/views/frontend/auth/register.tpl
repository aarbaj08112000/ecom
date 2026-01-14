<%include file="layout/header.tpl"%>

<div class="d-flex align-items-center justify-content-center py-5" style="min-height: 85vh; background: url('https://www.transparenttextures.com/patterns/creampaper.png'), linear-gradient(135deg, #fdfbf7 0%, #f4f1de 100%);">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12">
                <div class="card border-0 shadow-lg rounded-5 overflow-hidden">
                    <div class="row g-0">
                         <!-- Form Side -->
                        <div class="col-lg-6 bg-white p-5 order-lg-1 order-2">
                             <div class="p-lg-4">
                                <div class="text-center mb-5">
                                   <div class="bg-secondary-subtle text-secondary rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                                       <i class="ti ti-user-plus fs-2"></i>
                                   </div>
                                   <h2 class="fw-bold text-dark" style="font-family: var(--font-heading);">Join Craftology</h2>
                                   <p class="text-muted">Create an account to unlock exclusive patterns & offers</p>
                                </div>
                                
                                <form id="registerForm">
                                     <div class="form-floating mb-3">
                                        <input type="text" class="form-control bg-light border-0 rounded-3" id="customer_name" name="customer_name" placeholder="John Doe">
                                        <label for="customer_name">Full Name</label>
                                        <div id="customer_nameErr" class="text-danger small mt-1"></div>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="email" class="form-control bg-light border-0 rounded-3" id="email" name="email" placeholder="name@example.com">
                                        <label for="email">Email address</label>
                                        <div id="emailErr" class="text-danger small mt-1"></div>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control bg-light border-0 rounded-3" id="password" name="password" placeholder="Password">
                                        <label for="password">Password</label>
                                        <div id="passwordErr" class="text-danger small mt-1"></div>
                                    </div>
                                    
                                    <button type="submit" id="registerBtn" class="btn btn-primary w-100 rounded-pill py-3 fw-bold btn-animate shadow-sm mb-4">Create Account</button>
                                    
                                    <div class="text-center">
                                        <p class="text-muted mb-0">Already a member? <a href="<%base_url('shop/login')%>" class="text-primary fw-bold text-decoration-none">Sign In</a></p>
                                    </div>
                                </form>
                            </div>
                        </div>
                        
                        <!-- Image Side -->
                        <div class="col-lg-6 d-none d-lg-block position-relative order-lg-2 order-1">
                             <img src="https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?q=80&w=800&auto=format&fit=crop" class="img-fluid h-100 w-100 object-fit-cover" alt="Register">
                             <div class="position-absolute top-0 start-0 w-100 h-100 bg-secondary opacity-25"></div>
                             <div class="position-absolute bottom-0 start-0 w-100 p-5 text-white text-end">
                                 <h2 class="fw-bold display-6 mb-2" style="font-family: var(--font-heading);">Join the Family</h2>
                                 <p class="lead small mb-0 opacity-90">Sign up today to track orders and save your favorites.</p>
                             </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%include file="layout/footer.tpl"%>
