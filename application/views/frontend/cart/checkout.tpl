<%include file="layout/header.tpl"%>

<div class="bg-light py-5">
    <div class="container">
        
        <div class="row g-5">
            <div class="col-lg-8">
                 <h4 class="fw-bold mb-4">Details</h4>
                 
                 <div class="card border-0 shadow-sm rounded-4 mb-4">
                     <div class="card-body p-4">
                         <div class="row g-3">
                             <div class="col-md-6">
                                 <label class="form-label small fw-bold text-muted">First Name</label>
                                 <input type="text" class="form-control bg-light border-0 py-2">
                             </div>
                             <div class="col-md-6">
                                 <label class="form-label small fw-bold text-muted">Last Name</label>
                                 <input type="text" class="form-control bg-light border-0 py-2">
                             </div>
                              <div class="col-12">
                                 <label class="form-label small fw-bold text-muted">Email Address</label>
                                 <input type="email" class="form-control bg-light border-0 py-2">
                             </div>
                              <div class="col-12">
                                 <label class="form-label small fw-bold text-muted">Address</label>
                                 <input type="text" class="form-control bg-light border-0 py-2 mb-2" placeholder="Street, House No.">
                                 <input type="text" class="form-control bg-light border-0 py-2" placeholder="Apartment, Suite (Optional)">
                             </div>
                              <div class="col-md-5">
                                 <label class="form-label small fw-bold text-muted">City</label>
                                 <input type="text" class="form-control bg-light border-0 py-2">
                             </div>
                              <div class="col-md-4">
                                 <label class="form-label small fw-bold text-muted">State</label>
                                 <select class="form-select bg-light border-0 py-2">
                                     <option>Select</option>
                                     <option>California</option>
                                     <option>Texas</option>
                                 </select>
                             </div>
                              <div class="col-md-3">
                                 <label class="form-label small fw-bold text-muted">Zip</label>
                                 <input type="text" class="form-control bg-light border-0 py-2">
                             </div>
                         </div>
                     </div>
                 </div>
                 
                 <h4 class="fw-bold mb-4">Payment</h4>
                  <div class="card border-0 shadow-sm rounded-4">
                     <div class="card-body p-4">
                         <div class="form-check mb-3 p-3 border rounded-3 bg-light-subtle">
                             <input class="form-check-input" type="radio" name="payment" id="card" checked>
                             <label class="form-check-label d-flex justify-content-between w-100" for="card">
                                 <span class="fw-bold">Credit/Debit Card</span>
                                 <span><i class="ti ti-brand-visa fs-4"></i> <i class="ti ti-brand-mastercard fs-4"></i></span>
                             </label>
                             <div class="mt-3 row g-3">
                                 <div class="col-12"><input type="text" class="form-control" placeholder="Card Number"></div>
                                 <div class="col-6"><input type="text" class="form-control" placeholder="MM/YY"></div>
                                 <div class="col-6"><input type="text" class="form-control" placeholder="CVC"></div>
                             </div>
                         </div>
                         <div class="form-check p-3 border rounded-3">
                             <input class="form-check-input" type="radio" name="payment" id="paypal">
                             <label class="form-check-label fw-bold" for="paypal">PayPal</label>
                         </div>
                     </div>
                 </div>
                 
            </div>
            
            <div class="col-lg-4">
                <div class="card border-0 shadow-sm rounded-4 position-sticky" style="top: 100px;">
                    <div class="card-body p-4">
                        <h5 class="fw-bold mb-4">Your Order</h5>
                         <div class="d-flex align-items-center gap-3 mb-3">
                            <div class="position-relative">
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">1</span>
                                <img src="https://images.unsplash.com/photo-1595188735235-c30997195c47?q=80&w=200&auto=format&fit=crop" class="rounded-2 border" style="width: 60px; height: 60px; object-fit: cover;">
                            </div>
                            <div class="flex-grow-1">
                                <div class="fw-bold small" style="font-family: var(--font-heading);">Ocean Resin Geode Art</div>
                                <div class="text-muted small">$120.00</div>
                            </div>
                        </div>
                        <div class="d-flex align-items-center gap-3 mb-4">
                             <div class="position-relative">
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">2</span>
                                <img src="https://images.unsplash.com/photo-1616699000030-802dc672c57a?q=80&w=200&auto=format&fit=crop" class="rounded-2 border" style="width: 60px; height: 60px; object-fit: cover;">
                            </div>
                             <div class="flex-grow-1">
                                <div class="fw-bold small" style="font-family: var(--font-heading);">Handmade Crochet Bunny</div>
                                <div class="text-muted small">$90.00</div>
                            </div>
                        </div>
                        
                         <div class="d-flex justify-content-between mb-2 pt-3 border-top">
                             <span class="text-muted">Subtotal</span>
                            <span class="fw-bold">$218.00</span>
                        </div>
                        <div class="d-flex justify-content-between mb-4">
                             <span class="text-muted">Total</span>
                            <span class="fw-bold fs-4 text-primary">$228.00</span>
                        </div>
                        
                        <button class="btn btn-primary w-100 rounded-pill py-3 shadow fw-bold">Pay $228.00</button>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</div>

<%include file="layout/footer.tpl"%>
