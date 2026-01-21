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
                        
                        <div class="mb-4">
                            <label class="form-label small fw-bold text-muted">Estimate Shipping</label>
                            <div class="input-group">
                                <input type="text" id="pincode-check" class="form-control form-control-sm border-0 bg-light" placeholder="Enter Pincode" maxlength="6">
                                <button class="btn btn-dark btn-sm px-3" onclick="checkShipping()">Check</button>
                            </div>
                            <div id="shipping-msg" class="small mt-1"></div>
                        </div>

                        <div class="d-flex justify-content-between mb-2">
                            <span class="text-muted">Subtotal</span>
                            <span class="fw-bold"><%$config.currency_symbol%><span id="cart-subtotal"><%$total%></span></span>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span class="text-muted">Shipping</span>
                            <span id="shipping-charge-text" class="fw-bold"><%$config.currency_symbol%>0.00</span>
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

<script>
function checkShipping() {
    const pincode = $('#pincode-check').val();
    if (!pincode || pincode.length < 5) {
        $('#shipping-msg').html('<span class="text-danger small">Invalid pincode</span>');
        return;
    }

    $('#shipping-msg').html('<span class="text-muted small">Checking...</span>');

    $.ajax({
        url: '<%base_url("shop/cart/get_shipping_charge")%>',
        type: 'POST',
        data: { pincode: pincode },
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                const charge = parseFloat(response.shipping_charge);
                if (charge === 0) {
                    $('#shipping-charge-text').text('Free').addClass('text-success');
                    $('#shipping-msg').html('<span class="text-success small">Free Shipping applied!</span>');
                } else {
                    $('#shipping-charge-text').text('<%$config.currency_symbol%>' + charge.toFixed(2)).removeClass('text-success');
                    $('#shipping-msg').html(`<span class="text-success small">Serviceable! Est: ${response.estimated_days}</span>`);
                }
                
                // Update Total
                const subtotal = parseFloat($('#cart-subtotal').text());
                const total = subtotal + charge;
                $('#cart-total').text(total.toFixed(2));
            } else {
                $('#shipping-msg').html(`<span class="text-danger small">${response.message}</span>`);
                $('#shipping-charge-text').text('<%$config.currency_symbol%>0.00');
                
                // Reset Total to subtotal if not serviceable
                const subtotal = parseFloat($('#cart-subtotal').text());
                $('#cart-total').text(subtotal.toFixed(2));
            }
        },
        error: function() {
            $('#shipping-msg').html('<span class="text-danger small">Error checking shipping</span>');
        }
    });
}

function updateCartQty(cartId, change) {
    const qtyInput = $('#qty-' + cartId);
    let newQty = parseInt(qtyInput.val()) + change;
    if (newQty < 1) return;

    $.ajax({
        url: '<%base_url("shop/cart/update")%>',
        type: 'POST',
        data: { cart_id: cartId, quantity: newQty },
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                qtyInput.val(newQty);
                const price = $('#item-total-' + cartId).data('price');
                $('#item-total-' + cartId).text((price * newQty).toFixed(2));
                
                refreshCartTotals();
            } else {
                if (typeof toaster === 'function') {
                    toaster('error', response.message);
                } else {
                    alert(response.message);
                }
            }
        }
    });
}

function refreshCartTotals() {
    let subtotal = 0;
    $('.item-total').each(function() {
        subtotal += parseFloat($(this).text());
    });
    $('#cart-subtotal').text(subtotal.toFixed(2));
    
    // If pincode was already checked, re-check to update total and possibly shipping discount
    if ($('#pincode-check').val().length >= 5) {
        checkShipping();
    } else {
        $('#cart-total').text(subtotal.toFixed(2));
    }
}

function removeFromCart(cartId) {
    if(!confirm('Are you sure you want to remove this item?')) return;
    
    $.ajax({
        url: '<%base_url("shop/cart/remove")%>',
        type: 'POST',
        data: { cart_id: cartId },
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                $('#cart-row-' + cartId).fadeOut(300, function() {
                    $(this).remove();
                    refreshCartTotals();
                    if ($('.item-total').length === 0) {
                        location.reload();
                    }
                });
            }
        }
    });
}
</script>

<%include file="layout/footer.tpl"%>
