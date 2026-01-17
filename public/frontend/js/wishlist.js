function addToWishlist(productId, buttonElement) {
    if (!productId) return;

    // Immediate UI Feedback (Optimistic UI)
    let icon = null;
    let btn = null;
    if (buttonElement) {
        btn = $(buttonElement);
        icon = btn.find('i');
        // Toggle heart class logic: Active is "text-danger" on "ti-heart"
        if (!icon.hasClass('text-danger')) {
            // Adding to wishlist
            icon.addClass('text-danger');
            btn.attr('title', 'Remove wishlist');
        } else {
            // If already filled/red, remove it
            removeFromWishlist(productId, buttonElement);
            return;
        }
    }

    $.ajax({
        url: base_url + 'shop/wishlist/add',
        type: 'POST',
        data: {
            product_id: productId,
            csrf_test_name: getCookie('csrf_cookie_name')
        },
        dataType: 'json',
        success: function (response) {
            if (response.success) {
                toaster('success', response.message);
            } else {
                if (response.redirect) {
                    window.location.href = response.redirect;
                    return;
                }

                // If it's "Product already in wishlist", treating it as success/synced state
                // We keep the icon active (we already set it optimistically)
                if (response.message === 'Product already in wishlist') {
                    // Suppress warning message but keep UI active
                } else {
                    // Actual error, revert UI
                    if (buttonElement && icon) {
                        icon.removeClass('text-danger');
                        btn.attr('title', 'Add wishlist');
                    }
                    toaster('error', response.message);
                }
            }
        },
        error: function () {
            // Revert
            if (buttonElement && icon) {
                icon.removeClass('text-danger');
                btn.attr('title', 'Add wishlist');
            }
            toaster('error', 'Something went wrong. Please try again.');
        },
        complete: function () {
            if (buttonElement) {
                buttonElement.disabled = false;
            }
        }
    });
}

function removeFromWishlist(productId, buttonElement) {
    if (!productId) return;

    // If triggered from product page button (toggle), don't confirm
    if (buttonElement) {
        performRemove(productId, buttonElement);
        return;
    }

    // Explicit remove (trash icon/removal button on wishlist page) - Confirm
    if (typeof Swal !== 'undefined') {
        Swal.fire({
            title: 'Are you sure?',
            text: "Do you want to remove this item from your wishlist?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, remove it!'
        }).then((result) => {
            if (result.isConfirmed) {
                performRemove(productId);
            }
        });
    } else {
        if (confirm('Are you sure you want to remove this item?')) {
            performRemove(productId);
        }
    }
}

function performRemove(productId, buttonElement) {
    console.log('Attempting to remove product:', productId);
    $.ajax({
        url: base_url + 'shop/wishlist/remove',
        type: 'POST',
        data: {
            product_id: productId,
            csrf_test_name: getCookie('csrf_cookie_name')
        },
        dataType: 'json',
        success: function (response) {
            console.log('Remove response:', response);

            if (response.success) {
                toaster("success", response.message);

                // Debug selector
                var selector = '#wishlist-container-' + productId;
                console.log('Targeting selector:', selector);
                console.log('Element found:', $(selector).length);

                // If on Wishlist Page (container exists), remove item from DOM
                if ($(selector).length > 0) {
                    $(selector).fadeOut(300, function () {
                        $(this).remove();
                        // Check if wishlist is empty
                        if ($('.wishlist-item-container').length === 0) {
                            location.reload(); // Reload to show empty state
                        }
                    });
                }

                // If on Product Page (toggle button provided), revert icon
                if (buttonElement) {
                    $(buttonElement).find('i').removeClass('text-danger');
                    $(buttonElement).attr('title', 'Add wishlist');
                }

            } else {
                toaster('error', response.message);
            }
        },
        error: function (xhr, status, error) {
            console.error('Remove error:', error);
            toaster('error', 'Something went wrong. Please try again.');
        }
    });
}

// Helper to get cookie value (standard CodeIgniter CSRF handling)
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
