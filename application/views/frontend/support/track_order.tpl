<%include file="layout/header.tpl"%>

<!-- Track Order Page -->
<div class="bg-light py-5" style="min-height: 80vh; background-image: radial-gradient(#e5989b 0.5px, transparent 0.5px), radial-gradient(#e5989b 0.5px, #fdfbf7 0.5px); background-size: 20px 20px;">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="text-center mb-5" data-aos="fade-down">
                     <div class="bg-white rounded-circle shadow-sm d-inline-flex p-3 mb-3 text-primary">
                        <i class="ti ti-truck-delivery fs-1"></i>
                    </div>
                    <h2 class="fw-bold mb-3" style="font-family: var(--font-heading);">Track Your Order</h2>
                    <p class="text-muted">Enter your order ID and email to see the current status of your shipment.</p>
                </div>
                
                <div class="card border-0 shadow-lg rounded-4 overflow-hidden" data-aos="fade-up">
                    <div class="card-body p-5">
                        <form>
                            <div class="mb-4">
                                <label class="form-label small fw-bold text-uppercase text-muted letter-spacing-1">Order ID</label>
                                <input type="text" class="form-control bg-light border-0 py-3 rounded-3" placeholder="e.g. #10234">
                            </div>
                            <div class="mb-4">
                                <label class="form-label small fw-bold text-uppercase text-muted letter-spacing-1">Billing Email</label>
                                <input type="email" class="form-control bg-light border-0 py-3 rounded-3" placeholder="hello@example.com">
                            </div>
                            <button class="btn btn-primary w-100 py-3 rounded-pill fw-bold shadow-sm btn-animate">Track Order</button>
                        </form>
                    </div>
                </div>
                
                <div class="text-center mt-4">
                    <p class="text-muted small">Need help? <a href="<%base_url('shop/contact')%>" class="text-primary fw-bold">Contact Support</a></p>
                </div>
            </div>
        </div>
    </div>
</div>

<%include file="layout/footer.tpl"%>
