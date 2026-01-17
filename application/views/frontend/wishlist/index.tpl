<%include file="layout/header.tpl"%>

<!-- Wishlist Page - Matches Product Grid Layout -->
<div class="bg-light" style="background-image: radial-gradient(#e5989b 0.5px, transparent 0.5px), radial-gradient(#e5989b 0.5px, #fdfbf7 0.5px); background-size: 20px 20px; background-position: 0 0, 10px 10px;">
    
    <div class="container py-5">
        <!-- Breadcrumb & Header -->
        <div class="mb-5 text-center" data-aos="fade-down">
            <nav aria-label="breadcrumb" class="d-flex justify-content-center mb-3">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<%base_url('shop')%>" class="text-primary text-decoration-none">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Wishlist</li>
                </ol>
            </nav>
            <h1 class="fw-bold display-5" style="font-family: var(--font-heading);">My Wishlist</h1>
        </div>

        <div class="row g-4" id="wishlist-container">
            <%if !empty($wishlist_items)%>
                <%foreach $wishlist_items as $item%>
                    <div class="col-xl-3 col-lg-4 col-md-6 wishlist-item-container" id="wishlist-container-<%$item->product_id%>" data-aos="fade-up">
                        <div class="product-card card h-100 border-0 shadow-sm rounded-4 overflow-hidden position-relative wishlist-item" style="transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);">
                            
                            <!-- Image Container -->
                            <div class="position-relative overflow-hidden bg-white" style="height: 280px;">
                                <!-- Hover Actions (Matches Product Grid) -->
                                <div class="product-actions position-absolute top-50 start-50 translate-middle d-flex gap-2 z-2" style="opacity: 0; transition: opacity 0.3s ease;">
                                    
                                    <!-- Add to Cart -->
                                    <button class="btn btn-white rounded-circle shadow icon-btn" title="Add to Cart" style="width: 45px; height: 45px;" onclick="addToCart(event, <%$item->product_id%>)">
                                        <i class="ti ti-shopping-cart"></i>
                                    </button>
                                    
                                    <!-- Quick View / Link -->
                                    <a href="<%base_url('shop/product/'|cat:$item->product_id)%>" class="btn btn-white rounded-circle shadow icon-btn" title="View Details" style="width: 45px; height: 45px;">
                                        <i class="ti ti-eye"></i>
                                    </a>
                                    
                                    <!-- Remove from Wishlist (Filled Heart) -->
                                    <button class="btn btn-white rounded-circle shadow icon-btn" 
                                            onclick="removeFromWishlist(<%$item->product_id%>)" 
                                            title="Remove from Wishlist"
                                            style="width: 45px; height: 45px;">
                                        <i class="ti ti-heart text-danger"></i>
                                    </button>
                                </div>
                                
                                <!-- Product Image -->
                                <img src="<%base_url('public/uploads/products/')%><%$item->product_id%>/<%$item->image_path%>" 
                                     class="w-100 h-100 p-3" 
                                     style="object-fit: cover; transition: transform 0.5s cubic-bezier(0.4, 0, 0.2, 1);" 
                                     alt="<%$item->name%>"
                                     onerror="this.src='https://placehold.co/600x600/e2e8f0/84a98c?text=Product';">
                            </div>
                            
                            <!-- Card Body -->
                            <div class="card-body p-4">
                                <div class="small text-primary mb-2 fw-semibold">Product</div>
                                <h5 class="card-title fw-bold mb-2" style="font-size: 1.1rem; line-height: 1.4;">
                                    <a href="<%base_url('shop/product/'|cat:$item->product_id)%>" class="text-dark text-decoration-none hover-primary">
                                        <%$item->name%>
                                    </a>
                                </h5>
                                
                                <!-- Price & Action -->
                                <div class="d-flex align-items-center justify-content-between mt-3">
                                    <div class="d-flex align-items-baseline gap-2">
                                        <span class="fw-bold text-primary" style="font-size: 1.4rem;"><%$config.currency_symbol%><%$item->price|number_format:2%></span>
                                    </div>
                                    <button class="btn btn-primary btn-sm rounded-pill px-3 shadow-sm" onclick="addToCart(event, <%$item->product_id%>)" style="transition: all 0.3s ease;">
                                        <i class="ti ti-shopping-cart me-1"></i> Add
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                <%/foreach%>
            <%else%>
                <div class="col-12 text-center py-5">
                    <div class="mb-4" data-aos="zoom-in">
                        <div class="bg-white rounded-circle p-4 d-inline-block shadow-sm">
                            <i class="ti ti-heart-broken fs-1 text-muted opacity-50" style="font-size: 4rem !important;"></i>
                        </div>
                    </div>
                    <h3 class="fw-bold mb-3">Your wishlist is empty</h3>
                    <p class="text-muted mb-4 lead">Looks like you haven't saved any items yet.</p>
                    <a href="<%base_url('shop/products')%>" class="btn btn-primary btn-lg rounded-pill px-5 shadow-lg">
                        Start Shopping
                    </a>
                </div>
            <%/if%>
        </div>
    </div>
</div>

<style>
/* Reusing styles from details and product grid */
.product-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1) !important;
}
.product-card:hover img {
    transform: scale(1.05);
}
.product-card:hover .product-actions {
    opacity: 1 !important;
}
.hover-primary:hover {
    color: var(--primary) !important;
}
.icon-btn:hover {
    background-color: var(--primary) !important;
    color: white !important;
}
</style>

<%include file="layout/footer.tpl"%>
