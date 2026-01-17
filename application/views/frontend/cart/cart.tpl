<%include file="layout/header.tpl"%>

<div class="bg-light py-5">
    <div class="container">
        <h2 class="fw-bold mb-4">Shopping Cart</h2>
        
        <div class="row g-4">
            <!-- Cart Items -->
            <div class="col-lg-8">
                 <div class="card border-0 shadow-sm rounded-4 mb-3">
                    <div class="card-body p-4">
                        <%if !empty($cart_items)%>
                            <%foreach $cart_items as $item%>
                            <div class="d-flex align-items-center justify-content-between mb-4 pb-4 border-bottom last-border-0" id="cart-row-<%$item->cart_id%>">
                                <div class="d-flex align-items-center gap-3">
                                    <div class="bg-light p-2 rounded-3">
                                        <img src="<%base_url('public/uploads/products/')%><%$item->product_id%>/<%$item->image%>" alt="<%$item->name%>" width="80" class="img-fluid rounded-2 object-fit-cover" onerror="this.onerror=null; this.src='https://placehold.co/150x150?text=No+Image';">
                                    </div>
                                    <div>
                                        <h5 class="fw-bold mb-1"><a href="<%base_url('shop/product/')%><%$item->product_id%>" class="text-decoration-none text-dark"><%$item->name%></a></h5>
                                        <div class="text-muted small"></div>
                                    </div>
                                </div>
                                
                                <div class="d-flex align-items-center gap-5">
                                    <div class="quantity-selector input-group w-auto">
                                        <button class="btn btn-sm btn-outline-light text-dark border" onclick="updateCartQty(<%$item->cart_id%>, -1)">-</button>
                                        <input type="text" class="form-control form-control-sm text-center border-0 bg-light" value="<%$item->quantity%>" style="width: 40px;" readonly id="qty-<%$item->cart_id%>">
                                        <button class="btn btn-sm btn-outline-light text-dark border" onclick="updateCartQty(<%$item->cart_id%>, 1)">+</button>
                                    </div>
                                    <div class="fw-bold fs-5"><%$config.currency_symbol%><span class="item-total" id="item-total-<%$item->cart_id%>" data-price="<%$item->price%>"><%$item->price * $item->quantity%></span></div>
                                    <button class="btn btn-link text-danger p-0" onclick="removeFromCart(<%$item->cart_id%>)"><i class="ti ti-trash"></i></button>
                                </div>
                            </div>
                            <%/foreach%>
                        <%else%>
                            <div class="text-center py-5">
                                <i class="ti ti-shopping-cart-off fs-1 text-muted mb-3"></i>
                                <p class="lead">Your cart is empty.</p>
                            </div>
                        <%/if%>
                        
                         <div class="d-flex justify-content-between align-items-center pt-2">
                            <a href="<%base_url('shop/products')%>" class="text-decoration-none fw-bold"><i class="ti ti-arrow-left me-2"></i> Continue Shopping</a>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Summary -->
            <div class="col-lg-4">
                <div class="card border-0 shadow-sm rounded-4">
                    <div class="card-body p-4">
                        <h5 class="fw-bold mb-4">Order Summary</h5>
                        
                        <div class="d-flex justify-content-between mb-2">
                            <span class="text-muted">Subtotal</span>
                            <span class="fw-bold"><%$config.currency_symbol%><span id="cart-subtotal"><%$total%></span></span>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span class="text-muted">Shipping</span>
                            <span class="text-success">Free</span>
                        </div>
                        <div class="d-flex justify-content-between mb-4">
                             <span class="text-muted">Tax</span>
                             <!-- Fixed tax for now as example or 0 -->
                            <span class="fw-bold"><%$config.currency_symbol%><span id="cart-tax">0.00</span></span>
                        </div>
                        
                        <div class="d-flex justify-content-between mb-4 pt-3 border-top">
                             <span class="fw-bold fs-5">Total</span>
                            <span class="fw-bold fs-4 text-primary"><%$config.currency_symbol%><span id="cart-total"><%$total%></span></span>
                        </div>
                        
                        <a href="<%base_url('shop/checkout')%>" class="btn btn-primary w-100 rounded-pill py-3 shadow fw-bold btn-animate">Proceed to Checkout</a>
                        
                        <div class="mt-4 text-center small text-muted">
                            <i class="ti ti-lock me-1"></i> Secure Checkout
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</div>

<%include file="layout/footer.tpl"%>
