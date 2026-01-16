<%include file="layout/header.tpl"%>

<!-- Product Details Page - Amazon/Flipkart Style Layout -->
<div class="bg-light" style="background-image: radial-gradient(#e5989b 0.5px, transparent 0.5px), radial-gradient(#e5989b 0.5px, #fdfbf7 0.5px); background-size: 20px 20px; background-position: 0 0, 10px 10px;">
    
    <div class="container py-5">
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="mb-4" data-aos="fade-down">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="<%base_url('shop')%>" class="text-primary">Home</a></li>
                <li class="breadcrumb-item"><a href="<%base_url('shop/products')%>" class="text-primary">Products</a></li>
                <li class="breadcrumb-item active" aria-current="page"><%$product->name%></li>
            </ol>
        </nav>

        <div class="row g-5 mb-5">
            <!-- Product Images Gallery - Simplified Zoom -->
            <div class="col-lg-6">
                <div class="row g-3" data-aos="fade-right">
                    <!-- Thumbnail Gallery - LEFT SIDE -->
                    <div class="col-auto">
                        <div class="d-flex flex-column gap-3">
                            <%foreach $product->images as $index => $img%>
                            <div class="thumb-container p-2 bg-white shadow-sm cursor-pointer border-2 <%if $index === 0%>border-primary<%else%>border-transparent<%/if%>" 
                                 style="width: 80px; height: 80px; border-radius: 12px; transition: all 0.3s ease;"
                                 onclick="changeMainImage('<%base_url('public/uploads/products/')%><%$product->id%>/<%$img["image_path"]%>', this)">
                                <img src="<%base_url('public/uploads/products/')%><%$product->id%>/<%$img["image_path"]%>" 
                                     class="img-fluid w-100 h-100" 
                                     style="object-fit: cover; border-radius: 8px;" 
                                     alt="thumbnail"
                                     onerror="this.src='https://placehold.co/200x200/e2e8f0/84a98c?text=thumb';">
                            </div>
                            <%/foreach%>
                        </div>
                    </div>
                    
                    <!-- Main Image - RIGHT SIDE -->
                    <div class="col">
                        <!-- Main Image Container -->
                        <div class="main-image-container position-relative bg-white shadow-sm" 
                             style="height: 500px; border-radius: 24px; overflow: hidden;"
                             id="imageZoomWrapper">
                            <div class="image-inner p-4 w-100 h-100" id="imageInner">
                                <img id="mainProductImg" 
                                     src="<%base_url('public/uploads/products/')%><%$product->id%>/<%$product->images[0]["image_path"]%>" 
                                     class="img-fluid w-100 h-100" 
                                     style="object-fit: contain; border-radius: 16px;" 
                                     alt="<%$product->name%>"
                                     onerror="this.src='https://placehold.co/800x800/e2e8f0/84a98c?text=Craft';">
                            </div>
                            
                            <!-- Wishlist & Share Buttons -->
                            <div class="position-absolute top-0 end-0 m-3 d-flex flex-column gap-2" style="z-index: 100;">
                                <button class="btn btn-white rounded-circle shadow-sm" style="width: 45px; height: 45px;" title="Add to Wishlist">
                                    <i class="ti ti-heart"></i>
                                </button>
                                <button class="btn btn-white rounded-circle shadow-sm" style="width: 45px; height: 45px;" title="Share" onclick="openShareModal()">
                                    <i class="ti ti-share"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Enhanced Product Info -->
            <div class="col-lg-6">
                <div data-aos="fade-left">
                    <!-- Product Title & Category -->
                    <div class="mb-3">
                        <span class="badge bg-primary-subtle text-primary px-3 py-2 rounded-pill mb-3"><%$product->category_name%></span>
                        <h1 class="fw-bold mb-0" style="font-family: var(--font-heading); font-size: 2.5rem; line-height: 1.2;">
                            <%$product->name%>
                        </h1>
                    </div>
                    
                    <!-- Rating & Reviews -->
                    <div class="d-flex align-items-center gap-3 mb-4 pb-4 border-bottom">
                        <div class="d-flex text-warning fs-5">
                            <%for $i=1 to 5%>
                                <i class="ti <%if $i <= $product->rating%>ti-star-filled text-warning<%else%>ti-star text-muted<%/if%>"></i>
                            <%/for%>
                        </div>
                        <span class="text-muted"><%$product->rating%> / 5.0</span>
                        <span class="text-muted">|</span>
                        <a href="#reviews" class="text-primary text-decoration-none"><%$product->reviews_count%> Reviews</a>
                        <span class="badge bg-success-subtle text-success px-3 py-2 rounded-pill ms-auto">
                            <i class="ti ti-check me-1"></i> In Stock
                        </span>
                    </div>

                    <!-- Price Section -->
                    <div class="price-section mb-4 pb-4 border-bottom">
                        <div class="d-flex align-items-baseline gap-3 mb-2">
                            <span class="display-5 fw-bold text-primary">₹<%$product->price|number_format:2%></span>
                            <%if isset($product->price_before_discount) && $product->price_before_discount > $product->price%>
                                <span class="h4 text-muted text-decoration-line-through">₹<%$product->price_before_discount|number_format:2%></span>
                                <span class="badge bg-danger px-3 py-2">
                                    Save ₹<%($product->price_before_discount - $product->price)|number_format:2%>
                                </span>
                            <%/if%>
                        </div>
                        <small class="text-muted">Tax included. Shipping calculated at checkout.</small>
                    </div>

                    <!-- Description -->
                    <div class="mb-4">
                        <p class="text-secondary lead mb-0"><%$product->detail%></p>
                    </div>

                    <!-- Quantity & Add to Cart -->
                    <div class="card border-0 shadow-sm rounded-4 p-4 mb-4" style="background: linear-gradient(135deg, rgba(132, 169, 140, 0.05), rgba(229, 152, 155, 0.05));">
                        <div class="row g-3 align-items-center">
                            <div class="col-auto">
                                <label class="fw-bold mb-2 d-block">Quantity:</label>
                                <div class="quantity-selector d-flex align-items-center gap-2">
                                    <button class="btn btn-outline-primary rounded-circle" style="width: 40px; height: 40px;" onclick="updateQuantity(-1)">
                                        <i class="ti ti-minus"></i>
                                    </button>
                                    <input type="number" id="productQty" class="form-control text-center fw-bold border-0 bg-white" value="1" min="1" max="10" style="width: 60px;" readonly>
                                    <button class="btn btn-outline-primary rounded-circle" style="width: 40px; height: 40px;" onclick="updateQuantity(1)">
                                        <i class="ti ti-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col">
                                <button class="btn btn-primary btn-lg w-100 rounded-pill shadow-lg py-3 fw-bold" style="transition: all 0.3s ease;">
                                    <i class="ti ti-shopping-cart me-2"></i> Add to Cart
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Features Grid -->
                    <div class="row g-3">
                        <div class="col-6">
                            <div class="card border-0 shadow-sm rounded-4 p-3 h-100" style="transition: all 0.3s ease;">
                                <div class="d-flex gap-3 align-items-start">
                                    <div class="bg-primary-subtle text-primary p-3 rounded-circle">
                                        <i class="ti ti-truck fs-4"></i>
                                    </div>
                                    <div>
                                        <h6 class="fw-bold mb-1">Free Delivery</h6>
                                        <small class="text-muted">Orders over $50</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="card border-0 shadow-sm rounded-4 p-3 h-100" style="transition: all 0.3s ease;">
                                <div class="d-flex gap-3 align-items-start">
                                    <div class="bg-success-subtle text-success p-3 rounded-circle">
                                        <i class="ti ti-shield-check fs-4"></i>
                                    </div>
                                    <div>
                                        <h6 class="fw-bold mb-1">Handmade Quality</h6>
                                        <small class="text-muted">Crafted with care</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="card border-0 shadow-sm rounded-4 p-3 h-100" style="transition: all 0.3s ease;">
                                <div class="d-flex gap-3 align-items-start">
                                    <div class="bg-warning-subtle text-warning p-3 rounded-circle">
                                        <i class="ti ti-refresh fs-4"></i>
                                    </div>
                                    <div>
                                        <h6 class="fw-bold mb-1">Easy Returns</h6>
                                        <small class="text-muted">30-day policy</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="card border-0 shadow-sm rounded-4 p-3 h-100" style="transition: all 0.3s ease;">
                                <div class="d-flex gap-3 align-items-start">
                                    <div class="bg-info-subtle text-info p-3 rounded-circle">
                                        <i class="ti ti-message-circle fs-4"></i>
                                    </div>
                                    <div>
                                        <h6 class="fw-bold mb-1">24/7 Support</h6>
                                        <small class="text-muted">We're here to help</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Product Details Tabs -->
        <div class="card border-0 shadow-sm rounded-4 mb-5" data-aos="fade-up">
            <div class="card-body p-4">
                <ul class="nav nav-pills mb-4" id="productTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active rounded-pill px-4" id="description-tab" data-bs-toggle="pill" data-bs-target="#description" type="button">
                            Description
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link rounded-pill px-4" id="specifications-tab" data-bs-toggle="pill" data-bs-target="#specifications" type="button">
                            Specifications
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link rounded-pill px-4" id="reviews-tab" data-bs-toggle="pill" data-bs-target="#reviews" type="button">
                            Reviews (<%$product->reviews_count%>)
                        </button>
                    </li>
                </ul>
                <div class="tab-content" id="productTabsContent">
                    <div class="tab-pane fade show active" id="description" role="tabpanel">
                        <p class="text-secondary mb-3"><%$product->detail%></p>
                        <p class="text-secondary">Each piece is lovingly handcrafted by skilled artisans, making every item unique. The attention to detail and quality craftsmanship ensures you receive a product that's not just beautiful, but built to last.</p>
                    </div>
                    <div class="tab-pane fade" id="specifications" role="tabpanel">
                        <%if !empty($product->attributes)%>
                        <table class="table table-borderless">
                            <%foreach $product->attributes as $attr%>
                            <tr><td class="fw-bold" style="width: 200px;"><%$attr['attribute_name']%>:</td><td><%$attr['attribute_value']%></td></tr>
                            <%/foreach%>
                        </table>
                        <%else%>
                            <p class="text-muted">No specifications listed for this product.</p>
                        <%/if%>
                    </div>
                    <div class="tab-pane fade" id="reviews" role="tabpanel">
                        <%if !empty($product->reviews)%>
                            <div class="reviews-list mt-4">
                                <%foreach $product->reviews as $review%>
                                    <div class="review-item mb-4 pb-4 border-bottom">
                                        <div class="d-flex justify-content-between align-items-center mb-2">
                                            <h6 class="fw-bold mb-0"><%$review['reviewer_name']%></h6>
                                            <small class="text-muted"><%$review['added_date']|date_format:"%b %e, %Y"%></small>
                                        </div>
                                        <div class="text-warning mb-2">
                                            <!-- <span class="small text-muted me-2">(R: <%$review['rating']%>)</span> -->
                                            <i class="ti ti-star-filled text-success" title="Static Test"></i>
                                           <%assign var=rating value=$review['rating']|intval%>

                                            <%for $star=1 to 5%>
                                                <i class="ti <%if $rating >= $star%>ti-star text-warning<%else%>ti-star text-muted<%/if%>"></i>
                                            <%/for%>

                                        </div>
                                        <p class="text-secondary mb-0"><%$review['comment']%></p>
                                    </div>
                                <%/foreach%>
                            </div>
                            <div class="text-center mt-4">
                                <button class="btn btn-outline-primary rounded-pill px-4" onclick="openReviewModal()">Write a Review</button>
                            </div>
                        <%else%>
                            <div class="text-center text-muted py-5">
                                <i class="ti ti-message-circle fs-1 mb-3 d-block"></i>
                                <p>No reviews yet. Be the first to review this product!</p>
                                <button class="btn btn-primary rounded-pill px-4 mt-2" onclick="openReviewModal()">Write a Review</button>
                            </div>
                        <%/if%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Share Modal -->
<div class="modal fade" id="shareModal" tabindex="-1" aria-labelledby="shareModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg rounded-4">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title fw-bold" id="shareModalLabel">Share this product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-4">
                <p class="text-muted small mb-4">Share <%$product->name%> with your friends</p>
                
                <!-- Social Share Buttons -->
                <div class="d-grid gap-3 mb-4">
                    <button class="btn btn-outline-primary d-flex align-items-center justify-content-center gap-2 py-3 rounded-3" onclick="shareOnFacebook()">
                        <i class="ti ti-brand-facebook fs-5"></i>
                        <span class="fw-bold">Share on Facebook</span>
                    </button>
                    <button class="btn btn-outline-info d-flex align-items-center justify-content-center gap-2 py-3 rounded-3" onclick="shareOnTwitter()">
                        <i class="ti ti-brand-twitter fs-5"></i>
                        <span class="fw-bold">Share on Twitter</span>
                    </button>
                    <button class="btn btn-outline-success d-flex align-items-center justify-content-center gap-2 py-3 rounded-3" onclick="shareOnWhatsApp()">
                        <i class="ti ti-brand-whatsapp fs-5"></i>
                        <span class="fw-bold">Share on WhatsApp</span>
                    </button>
                </div>
                
                <!-- Copy Link -->
                <div class="border-top pt-4">
                    <label class="form-label small fw-bold text-uppercase text-muted mb-2">Or copy link</label>
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 py-3" id="productUrl" value="<%current_url()%>" readonly>
                        <button class="btn btn-primary px-4" type="button" onclick="copyProductLink()">
                            <i class="ti ti-copy me-1"></i> Copy
                        </button>
                    </div>
                    <small class="text-success d-none" id="copySuccess">
                        <i class="ti ti-check me-1"></i> Link copied to clipboard!
                    </small>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Review Modal -->
<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg rounded-4">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title fw-bold" id="reviewModalLabel">Write a Review</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-4">
                <form id="reviewForm">
                    <input type="hidden" id="reviewProductId" name="product_id" value="<%$product->id%>">
                    <!-- Star Rating -->
                    <div class="mb-4">
                        <label class="form-label fw-bold">Your Rating <span class="text-danger">*</span></label>
                        <div class="star-rating d-flex gap-2 fs-3">
                            <i class="ti ti-star star-icon" data-rating="1" onclick="setRating(1)"></i>
                            <i class="ti ti-star star-icon" data-rating="2" onclick="setRating(2)"></i>
                            <i class="ti ti-star star-icon" data-rating="3" onclick="setRating(3)"></i>
                            <i class="ti ti-star star-icon" data-rating="4" onclick="setRating(4)"></i>
                            <i class="ti ti-star star-icon" data-rating="5" onclick="setRating(5)"></i>
                        </div>
                        <input type="hidden" id="ratingValue" name="rating" value="0">
                    </div>
                    
                    <!-- Name -->
                    <div class="mb-3">
                        <label for="reviewName" class="form-label fw-bold">Your Name <span class="text-danger">*</span></label>
                        <input type="text" class="form-control bg-light border-0 py-3 rounded-3" id="reviewName" name="name" required>
                    </div>
                    
                    <!-- Email -->
                    <div class="mb-3">
                        <label for="reviewEmail" class="form-label fw-bold">Email <span class="text-danger">*</span></label>
                        <input type="email" class="form-control bg-light border-0 py-3 rounded-3" id="reviewEmail" name="email" required>
                    </div>
                    
                    <!-- Review Text -->
                    <div class="mb-4">
                        <label for="reviewText" class="form-label fw-bold">Your Review <span class="text-danger">*</span></label>
                        <textarea class="form-control bg-light border-0 rounded-3" id="reviewText" name="review" rows="4" placeholder="Share your experience with this product..." required></textarea>
                    </div>
                    
                    <!-- Submit Button -->
                    <button type="submit" class="btn btn-primary w-100 py-3 rounded-pill fw-bold">Submit Review</button>
                </form>
            </div>
        </div>
    </div>
</div>

<style>
/* Simplified Image Zoom - Transform Based */
.main-image-container {
    border-radius: 24px !important;
    cursor: zoom-in;
}

.image-inner {
    position: relative;
    overflow: hidden;
}

#mainProductImg {
    transform-origin: center center;
    transition: transform 0.1s ease-out;
}

.main-image-container:hover #mainProductImg {
    transform: scale(2.5);
    cursor: crosshair;
}

/* Thumbnail Hover */
.thumb-container {
    cursor: pointer;
    transition: all 0.3s ease;
}

.thumb-container:hover {
    transform: translateX(5px);
    box-shadow: 0 8px 20px rgba(132, 169, 140, 0.3) !important;
}

.thumb-container.active,
.thumb-container.border-primary {
    border-color: var(--primary) !important;
    box-shadow: 0 4px 12px rgba(132, 169, 140, 0.4) !important;
}

/* Star Rating */
.star-rating .star-icon {
    cursor: pointer;
    color: #ddd;
    transition: all 0.2s ease;
}

.star-rating .star-icon:hover,
.star-rating .star-icon.active {
    color: #ffc107;
    transform: scale(1.2);
}

/* Feature Cards Hover */
.row .card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15) !important;
}

/* Quantity Buttons */
.quantity-selector button:hover {
    background-color: var(--primary);
    color: white;
    transform: scale(1.1);
}

/* Add to Cart Button Hover */
.btn-primary.btn-lg:hover {
    transform: translateY(-3px);
    box-shadow: 0 15px 35px rgba(132, 169, 140, 0.4) !important;
}

/* Nav Pills Styling */
.nav-pills .nav-link {
    color: var(--dark);
    transition: all 0.3s ease;
}

.nav-pills .nav-link:hover {
    background-color: rgba(132, 169, 140, 0.1);
}

.nav-pills .nav-link.active {
    background-color: var(--primary);
    color: white;
}
</style>

<script>
// Simplified Image Zoom with Mouse Tracking
document.addEventListener('DOMContentLoaded', function() {
    const wrapper = document.getElementById('imageZoomWrapper');
    const img = document.getElementById('mainProductImg');
    
    if (!wrapper || !img) return;
    
    wrapper.addEventListener('mousemove', function(e) {
        const rect = wrapper.getBoundingClientRect();
        const x = e.clientX - rect.left;
        const y = e.clientY - rect.top;
        
        // Calculate percentage position
        const xPercent = (x / rect.width) * 100;
        const yPercent = (y / rect.height) * 100;
        
        // Update transform origin to follow mouse
        img.style.transformOrigin = `${xPercent}% ${yPercent}%`;
    });
    
    wrapper.addEventListener('mouseleave', function() {
        // Reset to center when mouse leaves
        img.style.transformOrigin = 'center center';
    });
});

// Share Functionality
function openShareModal() {
    const shareModal = new bootstrap.Modal(document.getElementById('shareModal'));
    shareModal.show();
}

function shareOnFacebook() {
    const url = encodeURIComponent(window.location.href);
    window.open(`https://www.facebook.com/sharer/sharer.php?u=${url}`, '_blank', 'width=600,height=400');
}

function shareOnTwitter() {
    const url = encodeURIComponent(window.location.href);
    const text = encodeURIComponent(document.querySelector('h1').textContent);
    window.open(`https://twitter.com/intent/tweet?url=${url}&text=${text}`, '_blank', 'width=600,height=400');
}

function shareOnWhatsApp() {
    const url = encodeURIComponent(window.location.href);
    const text = encodeURIComponent(document.querySelector('h1').textContent);
    window.open(`https://wa.me/?text=${text} ${url}`, '_blank');
}

function copyProductLink() {
    const urlInput = document.getElementById('productUrl');
    urlInput.select();
    urlInput.setSelectionRange(0, 99999); // For mobile devices
    
    navigator.clipboard.writeText(urlInput.value).then(() => {
        // Show success message
        const successMsg = document.getElementById('copySuccess');
        successMsg.classList.remove('d-none');
        
        // Hide after 3 seconds
        setTimeout(() => {
            successMsg.classList.add('d-none');
        }, 3000);
    });
}

// Review Functionality

function openReviewModal() {
    const reviewModal = new bootstrap.Modal(document.getElementById('reviewModal'));
    reviewModal.show();
}

function setRating(rating) {
    const input = document.getElementById('ratingValue');
    if(input) input.value = rating;
    
    // Update star icons - Scoped to modal
    const stars = document.querySelectorAll('#reviewModal .star-icon');
    stars.forEach((star, index) => {
        if (index < rating) {
            star.classList.remove('ti-star');
            star.classList.add('ti-star-filled', 'active', 'text-warning');
        } else {
            star.classList.remove('ti-star-filled', 'active', 'text-warning');
            star.classList.add('ti-star');
        }
    });
}

// Handle review form submission
document.addEventListener('DOMContentLoaded', function() {
    const reviewForm = document.getElementById('reviewForm');
    if (reviewForm) {
        reviewForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            const ratingVal = parseInt(document.getElementById('ratingValue').value || 0);
            
            if (ratingVal === 0) {
                Swal.fire({
                    icon: 'warning',
                    title: 'Oops...',
                    text: 'Please select a star rating',
                    confirmButtonColor: '#84a98c'
                });
                return;
            }
            
            const submitBtn = reviewForm.querySelector('button[type="submit"]');
            const originalBtnText = submitBtn.innerHTML;
            
            // Disable button and show loading state
            submitBtn.disabled = true;
            submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span>Submitting...';
            
            const formData = new FormData(reviewForm);
            
            fetch('<%base_url()%>shop/product/submit_review', {
                method: 'POST',
                body: formData,
                headers: {
                    'X-Requested-With': 'XMLHttpRequest'
                }
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text: data.message,
                        confirmButtonColor: '#84a98c'
                    });
                    
                    // Close modal and reset form
                    const modal = bootstrap.Modal.getInstance(document.getElementById('reviewModal'));
                    modal.hide();
                    reviewForm.reset();
                    setRating(0);
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        html: data.message,
                        confirmButtonColor: '#84a98c'
                    });
                }
            })
            .catch(error => {
                console.error('Error:', error);
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'An unexpected error occurred. Please try again later.',
                    confirmButtonColor: '#84a98c'
                });
            })
            .finally(() => {
                // Restore button state
                submitBtn.disabled = false;
                submitBtn.innerHTML = originalBtnText;
            });
        });
    }
});

// Change Main Image Function
function changeMainImage(imageSrc, thumbElement) {
    const mainImg = document.getElementById('mainProductImg');
    
    // Fade out
    mainImg.style.opacity = '0';
    mainImg.style.transition = 'opacity 0.2s ease';
    
    setTimeout(() => {
        mainImg.src = imageSrc;
        
        // Wait for image to load
        mainImg.onload = function() {
            mainImg.style.opacity = '1';
        };
    }, 200);
    
    // Update active thumbnail
    document.querySelectorAll('.thumb-container').forEach(thumb => {
        thumb.classList.remove('active', 'border-primary');
        thumb.classList.add('border-transparent');
    });
    thumbElement.classList.add('active', 'border-primary');
    thumbElement.classList.remove('border-transparent');
}

// Update Quantity
function updateQuantity(change) {
    const qtyInput = document.getElementById('productQty');
    let currentQty = parseInt(qtyInput.value);
    let newQty = currentQty + change;
    
    if (newQty >= 1 && newQty <= 10) {
        qtyInput.value = newQty;
        
        // Add animation
        qtyInput.style.transform = 'scale(1.2)';
        qtyInput.style.transition = 'transform 0.2s ease';
        setTimeout(() => {
            qtyInput.style.transform = 'scale(1)';
        }, 200);
    }
}
</script>

<%include file="layout/footer.tpl"%>
