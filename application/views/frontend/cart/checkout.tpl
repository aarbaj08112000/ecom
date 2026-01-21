<%include file="layout/header.tpl"%>

<div class="bg-light py-5">
    <div class="container">
        
        <form id="checkoutForm">
        <div class="row g-5">
            <div class="col-lg-8">
                 <h4 class="fw-bold mb-4">Details</h4>
                 
                 <%if $has_details%>
                 <div id="savedAddressCard" class="card border-0 shadow-sm rounded-4 mb-4 bg-light-subtle">
                    <div class="card-body p-4">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                             <h6 class="fw-bold mb-0 text-primary"><i class="ti ti-map-pin me-2"></i>Delivery Address</h6>
                             <button type="button" class="btn btn-sm btn-link text-decoration-none fw-bold" id="changeAddressBtn">Edit Address</button>
                        </div>
                        <p class="mb-0 small text-muted">
                            <strong class="text-dark fs-6"><%$prefill->first_name%> <%$prefill->last_name%></strong><br>
                            <span class="d-block mt-2">
                            <%$prefill->address%><br>
                            <%$prefill->city%>, <%$prefill->state%> - <%$prefill->zip%>
                            </span>
                            <span class="d-block mt-2"><i class="ti ti-mail me-1"></i> <%$prefill->email%></span>
                        </p>
                    </div>
                </div>
                <%/if%>

                 <div class="card border-0 shadow-sm rounded-4 mb-4" id="shippingFormWrapper" <%if $has_details%>style="display:none;"<%/if%>>
                     <div class="card-body p-4">
                         <div class="row g-3">
                             <div class="col-md-6">
                                 <label class="form-label small fw-bold text-muted">First Name</label>
                                 <input type="text" name="first_name" class="form-control bg-light border-0 py-2" value="<%$prefill->first_name%>" required>
                             </div>
                             <div class="col-md-6">
                                 <label class="form-label small fw-bold text-muted">Last Name</label>
                                 <input type="text" name="last_name" class="form-control bg-light border-0 py-2" value="<%$prefill->last_name%>" required>
                             </div>
                              <div class="col-md-6">
                                 <label class="form-label small fw-bold text-muted">Email Address</label>
                                 <input type="email" name="email" class="form-control bg-light border-0 py-2" value="<%$prefill->email%>" required>
                             </div>
                             <div class="col-md-6">
                                 <label class="form-label small fw-bold text-muted">Mobile Number</label>
                                 <input type="text" name="mobile" class="form-control bg-light border-0 py-2" value="<%$prefill->mobile%>" required>
                             </div>
                              <div class="col-12">
                                 <label class="form-label small fw-bold text-muted">Address</label>
                                 <input type="text" name="address" class="form-control bg-light border-0 py-2 mb-2" placeholder="Street, House No." value="<%$prefill->address%>" required>
                             </div>
                              <div class="col-md-5">
                                 <label class="form-label small fw-bold text-muted">City</label>
                                 <input type="text" name="city" class="form-control bg-light border-0 py-2" value="<%$prefill->city%>" required>
                             </div>
                              <div class="col-md-4">
                                 <label class="form-label small fw-bold text-muted">State</label>
                                 <select name="state" class="form-select bg-light border-0 py-2" id="stateSelect" required>
                                     <option value="">Select</option>
                                     <option value="Maharashtra">Maharashtra</option>
                                     <option value="Gujarat">Gujarat</option>
                                     <option value="Karnataka">Karnataka</option>
                                     <option value="Delhi">Delhi</option>
                                 </select>
                             </div>
                              <div class="col-md-3">
                                 <label class="form-label small fw-bold text-muted">Zip</label>
                                 <input type="text" name="zip" id="zipInput" class="form-control bg-light border-0 py-2" value="<%$prefill->zip%>" maxlength="6" required>
                                  <div id="pincode-status" class="small mt-1"></div>
                             </div>
                         </div>
                     </div>
                 </div>
                 
                 <h4 class="fw-bold mb-4">Payment</h4>
                  <div class="card border-0 shadow-sm rounded-4">
                     <div class="card-body p-4">
                         <div class="form-check mb-3 p-3 border rounded-3 bg-light-subtle">
                             <input class="form-check-input" type="radio" name="payment" id="card" value="Credit Card" checked>
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
                             <input class="form-check-input" type="radio" name="payment" id="paypal" value="PayPal">
                             <label class="form-check-label fw-bold" for="paypal">PayPal</label>
                         </div>
                     </div>
                 </div>
                 
            </div>
            
            <div class="col-lg-4">
                <div class="card border-0 shadow-sm rounded-4 position-sticky" style="top: 100px;">
                    <div class="card-body p-4">
                        <h5 class="fw-bold mb-4">Your Order</h5>
                        <%if !empty($cart_items)%>
                            <%foreach $cart_items as $item%>
                            <div class="d-flex align-items-center gap-3 mb-3">
                                <div class="position-relative">
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary"><%$item->quantity%></span>
                                    <img src="<%base_url('public/uploads/products/')%><%$item->product_id%>/<%$item->image%>" class="rounded-2 border" style="width: 60px; height: 60px; object-fit: cover;">
                                </div>
                                <div class="flex-grow-1">
                                    <div class="fw-bold small" style="font-family: var(--font-heading);"><%$item->name%></div>
                                    <div class="text-muted small"><%$config.currency_symbol%><%$item->price * $item->quantity%></div>
                                </div>
                            </div>
                            <%/foreach%>
                        <%else%>
                            <p class="text-muted text-center">Your cart is empty.</p>
                        <%/if%>
                        
                         <div class="mb-3">
                             <label class="form-label small fw-bold text-muted">Have a coupon?</label>
                             <div class="input-group" id="couponInputGroup">
                                 <input type="text" id="couponCode" name="coupon_code" class="form-control form-control-sm border-0 bg-light-subtle" placeholder="Enter coupon">
                                 <button type="button" id="applyCouponBtn" class="btn btn-dark btn-sm px-3">Apply</button>
                                 <button type="button" id="removeCouponBtn" class="btn btn-outline-danger btn-sm px-3" style="display:none;">Remove</button>
                             </div>
                             <div id="couponMsg" class="small mt-1"></div>
                             <input type="hidden" name="applied_coupon_id" id="appliedCouponId" value="">
                             <input type="hidden" name="discount_amount" id="discountAmountInput" value="0">
                         </div>

                         <div class="d-flex justify-content-between mb-2 pt-3 border-top">
                             <span class="text-muted">Subtotal</span>
                             <span class="fw-bold"><%$config.currency_symbol%><span id="order-subtotal"><%$total%></span></span>
                         </div>
                         <div id="discountBlock" class="d-flex justify-content-between mb-2 text-success" style="display:none !important;">
                             <span class="small fw-bold">Discount</span>
                             <span class="fw-bold">-<%$config.currency_symbol%><span id="discountValueDisplay">0.00</span></span>
                         </div>
                         <div class="d-flex justify-content-between mb-2">
                             <span class="text-muted">Shipping</span>
                            <span class="fw-bold" id="checkout-shipping-text"><%$config.currency_symbol%>0.00</span>
                        </div>
                        <div class="d-flex justify-content-between mb-4">
                             <span class="text-muted">Total</span>
                            <span class="fw-bold fs-4 text-primary"><%$config.currency_symbol%><span id="checkout-total"><%$total%></span></span>
                        </div>
                        
                        <button type="submit" class="btn btn-primary w-100 rounded-pill py-3 shadow fw-bold" id="placeOrderBtn" <%if empty($cart_items)%>disabled<%/if%>>Pay <%$config.currency_symbol%><span id="btn-total"><%$total%></span></button>
                    </div>
                </div>
            </div>
        </div>
        </form>
        
    </div>
</div>

<%include file="layout/footer.tpl"%>

<style>
    div.error {
        color: #dc3545;
        font-size: 0.875em;
        margin-top: 0.25rem;
    }
    input.error, select.error {
        border-color: #dc3545 !important;
    }
</style>

<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
    $(document).ready(function() {
        
        // set default state
        var defaultState = "<%$prefill->state%>";
        if(defaultState) {
            $('#stateSelect').val(defaultState);
        }

        // Initial check if zip is present
        if ($('#zipInput').val().length >= 5) {
            updateShipping($('#zipInput').val());
        }

        // Zip Input Listener
        $('#zipInput').on('keyup change', function() {
            const zip = $(this).val();
            if (zip.length >= 5) {
                updateShipping(zip);
            } else {
                $('#pincode-status').html('');
                resetShipping();
            }
        });

        function updateShipping(pincode) {
            $('#pincode-status').html('<span class="text-muted">Checking shipping...</span>');
            $.ajax({
                url: '<%base_url("shop/cart/get_shipping_charge")%>',
                type: 'POST',
                data: { pincode: pincode },
                dataType: 'json',
                success: function(response) {
                    if (response.success) {
                        const charge = parseFloat(response.shipping_charge);
                        $('#checkout-shipping-text').text('<%$config.currency_symbol%>' + charge.toFixed(2));
                        $('#pincode-status').html(`<span class="text-success">✔ Serviceable! Est: ${response.estimated_days}</span>`);
                        
                        const subtotal = parseFloat('<%$total%>');
                        const total = subtotal + charge;
                        $('#checkout-total, #btn-total').text(total.toFixed(2));
                        $('#placeOrderBtn').prop('disabled', false);
                    } else {
                        $('#pincode-status').html(`<span class="text-danger">✖ ${response.message}</span>`);
                        resetShipping();
                        $('#placeOrderBtn').prop('disabled', true);
                    }
                },
                error: function() {
                    $('#pincode-status').html('<span class="text-danger">Error checking shipping</span>');
                }
            });
        }

        function resetShipping() {
            $('#checkout-shipping-text').text('<%$config.currency_symbol%>0.00');
            $('#checkout-total, #btn-total').text(parseFloat('<%$total%>').toFixed(2));
        }
        
        // Toggle Address View
        $('#changeAddressBtn').on('click', function() {
            $('#savedAddressCard').fadeOut('fast', function() {
                $('#shippingFormWrapper').fadeIn('fast');
            });
        });
        
        // Custom method for letters only (optional, but good for names)
        $.validator.addMethod("lettersonly", function(value, element) {
            return this.optional(element) || /^[a-z]+$/i.test(value);
        }, "Letters only please"); 
        
        $('#checkoutForm').validate({
            rules: {
                first_name: {
                    required: true,
                    minlength: 2
                },
                last_name: {
                    required: true,
                    minlength: 2
                },
                email: {
                    required: true,
                    email: true
                },
                address: {
                    required: true,
                    minlength: 5
                },
                city: {
                    required: true
                },
                state: {
                    required: true
                },
                zip: {
                    required: true,
                    digits: true,
                    minlength: 5,
                    maxlength: 6 // adjust as per region
                },
                payment: {
                    required: true
                }
            },
            messages: {
                first_name: {
                    required: "Please enter your first name",
                    minlength: "Your name must consist of at least 2 characters"
                },
                last_name: {
                    required: "Please enter your last name",
                    minlength: "Your name must consist of at least 2 characters"
                },
                email: "Please enter a valid email address",
                address: "Please enter your shipping address",
                city: "Please enter your city",
                state: "Please select your state",
                zip: {
                    required: "Please enter your zip code",
                    digits: "Please enter only numbers"
                },
                payment: "Please select a payment method"
            },
            errorElement: "div", // Use div so it breaks to new line naturally in some layouts, or label
            errorPlacement: function(error, element) {
                if (element.attr("name") == "payment") {
                    error.appendTo(element.closest(".card-body"));
                } else {
                    error.insertAfter(element);
                }
            },
            submitHandler: function(form) {
                // Add validation for shipping serviceable before place order
                if ($('#placeOrderBtn').is(':disabled')) {
                    toaster('error', 'Please select a serviceable pincode.');
                    return false;
                }
                var btn = $('#placeOrderBtn');
                var originalText = btn.html();
                
                btn.html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Processing...').prop('disabled', true);
                
                $.ajax({
                    url: '<%base_url("shop/cart/place_order")%>',
                    type: 'POST',
                    data: $(form).serialize(),
                    dataType: 'json',
                    success: function(response) {
                        if (response.success) {
                            
                            if (response.is_razorpay) {
                                // Razorpay Payment Flow
                                var options = response.razorpay_options;
                                options.handler = function(transaction) {
                                    // Callback to server on success
                                    $.ajax({
                                        url: '<%base_url("shop/cart/razorpay_callback")%>',
                                        type: 'POST',
                                        dataType: 'json',
                                        data: {
                                            razorpay_payment_id: transaction.razorpay_payment_id,
                                            merchant_order_id: response.razorpay_options.notes.merchant_order_id
                                        },
                                        success: function(cbResponse) {
                                            console.log(cbResponse);
                                            if (cbResponse.success) {
                                               toaster('success', cbResponse.message);
                                                setTimeout(function() {
                                                    window.location.href = cbResponse.redirect;
                                                }, 1500); 
                                            } else {
                                                toaster('error', cbResponse.message);
                                                btn.html(originalText).prop('disabled', false);
                                            }
                                        },
                                        error: function() {
                                             toaster('error', 'Payment verification failed.');
                                             btn.html(originalText).prop('disabled', false);
                                        }
                                    });
                                };
                                
                                options.modal = {
                                    ondismiss: function() {
                                        toaster('error', 'Payment Cancelled');
                                        btn.html(originalText).prop('disabled', false);
                                    }
                                };
                                
                                var rzp1 = new Razorpay(options);
                                rzp1.open();
                                
                            } else {
                                // Standard Success (Validation error handled in backend or other method)
                                toaster('success', response.message);
                                setTimeout(function() {
                                    window.location.href = response.redirect;
                                }, 1500);
                            }
                            
                        } else {
                            toaster('error', response.message);
                            btn.html(originalText).prop('disabled', false);
                            // Show form on error so user can fix details
                            if ($('#shippingFormWrapper').is(':hidden')) {
                                $('#savedAddressCard').hide();
                                $('#shippingFormWrapper').fadeIn();
                            }
                        }
                    },
                    error: function() {
                        toaster('error', 'Something went wrong. Please try again.');
                        btn.html(originalText).prop('disabled', false);
                    }
                });
                return false; // Prevent normal form submission
            }
        });

        // Coupon Logic
        $('#applyCouponBtn').on('click', function() {
            if ($('#appliedCouponId').val()) {
                toaster('warning', 'A coupon is already applied. Remove it first to apply another one.');
                return;
            }

            const code = $('#couponCode').val();
            if (!code) {
                toaster('error', 'Please enter coupon code.');
                return;
            }

            const btn = $(this);
            btn.prop('disabled', true).html('<span class="spinner-border spinner-border-sm"></span>');

            $.ajax({
                url: '<%base_url("shop/cart/apply-coupon")%>',
                type: 'POST',
                data: { coupon_code: code },
                dataType: 'json',
                success: function(response) {
                    btn.prop('disabled', false).html('Apply');
                    if (response.success) {
                        $('#appliedCouponId').val(response.coupon_id);
                        $('#discountAmountInput').val(response.discount_amount);
                        $('#discountValueDisplay').text(parseFloat(response.discount_amount).toFixed(2));
                        $('#discountBlock').attr('style', 'display: flex !important');
                        $('#couponMsg').html(`<span class="text-success small">${response.message}</span>`);
                        
                        // UI Adjustments
                        $('#couponCode').prop('readonly', true);
                        $('#applyCouponBtn').hide();
                        $('#removeCouponBtn').show();
                        
                        recalculateFinalTotal();
                    } else {
                        $('#couponMsg').html(`<span class="text-danger small">${response.message}</span>`);
                        resetCoupon();
                    }
                },
                error: function() {
                    btn.prop('disabled', false).html('Apply');
                    toaster('error', 'Error applying coupon.');
                }
            });
        });

        $('#removeCouponBtn').on('click', function() {
            resetCoupon();
            $('#couponCode').val('').prop('readonly', false);
            $('#couponMsg').empty();
            $(this).hide();
            $('#applyCouponBtn').show();
            toaster('info', 'Coupon removed.');
        });

        function resetCoupon() {
            $('#appliedCouponId').val('');
            $('#discountAmountInput').val('0');
            $('#discountBlock').attr('style', 'display: none !important');
            recalculateFinalTotal();
        }

        function recalculateFinalTotal() {
            const subtotal = parseFloat('<%$total%>');
            const discount = parseFloat($('#discountAmountInput').val() || 0);
            const shipping = parseFloat($('#checkout-shipping-text').text().replace(/[^0-9.]/g, '') || 0);
            
            const netTotal = subtotal - discount + shipping;
            $('#checkout-total, #btn-total').text(netTotal.toFixed(2));
        }

        // Wrap existing updateShipping to use recalculate
        const originalUpdateShipping = updateShipping;
        updateShipping = function(pincode) {
             $('#pincode-status').html('<span class="text-muted">Checking shipping...</span>');
             $.ajax({
                url: '<%base_url("shop/cart/get_shipping_charge")%>',
                type: 'POST',
                data: { pincode: pincode },
                dataType: 'json',
                success: function(response) {
                    if (response.success) {
                        const charge = parseFloat(response.shipping_charge);
                        if (charge === 0) {
                            $('#checkout-shipping-text').text('Free').addClass('text-success');
                            $('#pincode-status').html(`<span class="text-success">✔ Free Shipping applied! Est: ${response.estimated_days}</span>`);
                        } else {
                            $('#checkout-shipping-text').text('<%$config.currency_symbol%>' + charge.toFixed(2)).removeClass('text-success');
                            $('#pincode-status').html(`<span class="text-success">✔ Serviceable! Est: ${response.estimated_days}</span>`);
                        }
                        
                        recalculateFinalTotal();
                        $('#placeOrderBtn').prop('disabled', false);
                    } else {
                        $('#pincode-status').html(`<span class="text-danger">✖ ${response.message}</span>`);
                        resetShipping();
                        $('#placeOrderBtn').prop('disabled', true);
                    }
                },
                error: function() {
                    $('#pincode-status').html('<span class="text-danger">Error checking shipping</span>');
                }
            });
        };

        function resetShipping() {
            $('#checkout-shipping-text').text('<%$config.currency_symbol%>0.00');
            recalculateFinalTotal();
        }
    });
</script>
