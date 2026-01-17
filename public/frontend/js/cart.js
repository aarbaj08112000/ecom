/**
 * Cart Functionality
 * Handles add to cart, update quantity, and remove item operations.
 * Uses SweetAlert2 for notifications.
 */

// Add to Cart
function addToCart(event, productId, quantity = 1, fromDetails = false) {
    if (event) event.preventDefault();

    // If called from details page, get quantity from input
    if (fromDetails) {
        const qtyInput = document.getElementById('productQty');
        if (qtyInput) {
            quantity = parseInt(qtyInput.value);
        }
    }

    const btn = event ? event.currentTarget : null;
    let originalHtml = '';

    if (btn) {
        originalHtml = btn.innerHTML;
        btn.disabled = true;
        // Show loading state differently based on button type
        if (btn.classList.contains('icon-btn')) {
            btn.innerHTML = '<i class="ti ti-loader animate-spin"></i>';
        } else {
            btn.innerHTML = '<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span>Loading...';
        }
    }

    $.ajax({
        url: base_url + 'shop/cart/add',
        type: 'POST',
        data: {
            product_id: productId,
            quantity: quantity,
            csrf_token_name: getCookie('csrf_cookie_name') // Assuming CSRF protection might be enabled, though not explicitly seen. Standard CI practice.
        },
        dataType: 'json',
        success: function (response) {
            if (response.success) {
                // Update badge
                updateCartBadge(response.cart_count);

                // Show success message
                toaster('success', response.message);

            } else {
                if (response.redirect) {
                    window.location.href = response.redirect;
                } else {
                    toaster('error', response.message);
                }
            }
        },
        error: function (xhr, status, error) {
            console.error(error);
            toaster('error', 'Something went wrong. Please try again.');
        },
        complete: function () {
            if (btn) {
                btn.disabled = false;
                btn.innerHTML = originalHtml;
            }
        }
    });
}

// Update Cart Quantity
function updateCartQty(cartId, change) {
    const qtyInput = document.getElementById(`qty-${cartId}`);
    if (!qtyInput) return;

    let currentQty = parseInt(qtyInput.value);
    let newQty = currentQty + change;

    if (newQty < 1) return; // Prevent 0 or negative

    // Optimistic UI update
    qtyInput.value = newQty;

    $.ajax({
        url: base_url + 'shop/cart/update',
        type: 'POST',
        data: {
            cart_id: cartId,
            quantity: newQty
        },
        dataType: 'json',
        success: function (response) {
            if (response.success) {
                // Update item total and cart totals
                // Note: The controller currently returns simple success. 
                // Ideally it should return new totals. 
                // We will manually calculate for now or reload if complex.
                // For better UX, let's recalculate based on data attributes.

                updateCartTotals();

            } else {
                // Revert on failure
                qtyInput.value = currentQty;
                toaster('error', response.message);
            }
        },
        error: function () {
            qtyInput.value = currentQty;
        }
    });
}

// Remove from Cart
function removeFromCart(cartId) {
    Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#84a98c',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: base_url + 'shop/cart/remove',
                type: 'POST',
                data: { cart_id: cartId },
                dataType: 'json',
                success: function (response) {
                    if (response.success) {
                        $(`#cart-row-${cartId}`).fadeOut(300, function () {
                            $(this).remove();
                            updateCartBadge(response.cart_count);
                            updateCartTotals();

                            // Check if empty
                            if ($('.last-border-0').length === 0) {
                                location.reload(); // Reload to show empty state
                            }
                        });

                        toaster('success', response.message);
                    } else {
                        toaster('error', response.message);
                    }
                }
            });
        }
    });
}

// Helper: Update Totals (Frontend Calculation)
function updateCartTotals() {
    let subtotal = 0;

    // Iterate over visible rows
    $('.item-total').each(function () {
        const id = $(this).attr('id').replace('item-total-', '');
        const price = parseFloat($(this).data('price'));
        const qty = parseInt($(`#qty-${id}`).val());
        const itemTotal = price * qty;

        // Update item total display
        $(this).text(itemTotal.toFixed(2)); // Assuming 2 decimals

        subtotal += itemTotal;
    });

    const tax = 0.00; // Fixed for now, or fetch from hidden input
    const grandTotal = subtotal + tax;

    // Update Summary
    $('#cart-subtotal').text(subtotal.toFixed(2));
    $('#cart-total').text(grandTotal.toFixed(2));
}

// Helper: Update Badge
function updateCartBadge(count) {
    const badge = $('#header-cart-count');
    if (badge.length) {
        badge.text(count);
        // Animate
        badge.addClass('animate-bounce');
        setTimeout(() => badge.removeClass('animate-bounce'), 1000);
    }
}

// Helper: Get Cookie (for CSRF if needed)
function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = jQuery.trim(cookies[i]);
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}
