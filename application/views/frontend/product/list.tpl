<%include file="layout/header.tpl"%>

<!-- Products Listing Page - Enhanced -->
<div class="bg-light" style="background-image: radial-gradient(#e5989b 0.5px, transparent 0.5px), radial-gradient(#e5989b 0.5px, #fdfbf7 0.5px); background-size: 20px 20px; background-position: 0 0, 10px 10px;">
    
    <!-- Hero Banner -->
    <div class="py-5 bg-gradient" style="background: linear-gradient(135deg, rgba(132, 169, 140, 0.1), rgba(229, 152, 155, 0.1));">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8" data-aos="fade-right">
                    <nav aria-label="breadcrumb" class="mb-3">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="<%base_url('shop')%>" class="text-primary">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Products</li>
                        </ol>
                    </nav>
                    <h1 class="fw-bold mb-3" style="font-family: var(--font-heading); font-size: 3rem;">Discover Handcrafted Treasures</h1>
                    <p class="text-muted fs-5 mb-0">Explore our curated collection of unique artisan creations</p>
                </div>
                <div class="col-lg-4 text-end d-none d-lg-block" data-aos="fade-left">
                    <div class="d-inline-flex align-items-center gap-3 bg-white rounded-pill shadow-sm px-4 py-3">
                        <i class="ti ti-package fs-3 text-primary"></i>
                        <div class="text-start">
                            <div class="fw-bold" id="hero-total-count"><%$total_products%> Products</div>
                            <small class="text-muted">Handmade with love</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container py-5" id="shop-container" data-base-url="<%base_url()%>">
        <!-- Toolbar -->
        <div class="d-flex justify-content-between align-items-center mb-4" data-aos="fade-down">
            <div class="text-muted" id="showing-text">
                Showing <strong>1-<%if $total_products > 12%>12<%else%><%$total_products%><%/if%></strong> of <strong><%$total_products%></strong> products
            </div>
            
            <div class="d-flex gap-3">
                <select class="form-select border-0 shadow-sm rounded-pill" id="sort-select" style="width: auto;">
                    <option value="default" <%if isset($active_filters['sort']) && $active_filters['sort'] == 'default'%>selected<%/if%>>Sort by: Default</option>
                    <option value="price_low" <%if isset($active_filters['sort']) && $active_filters['sort'] == 'price_low'%>selected<%/if%>>Price: Low to High</option>
                    <option value="price_high" <%if isset($active_filters['sort']) && $active_filters['sort'] == 'price_high'%>selected<%/if%>>Price: High to Low</option>
                    <option value="newest" <%if isset($active_filters['sort']) && $active_filters['sort'] == 'newest'%>selected<%/if%>>Newest First</option>
                    <option value="popularity" <%if isset($active_filters['sort']) && $active_filters['sort'] == 'popularity'%>selected<%/if%>>Best Rating</option>
                </select>
                <button class="btn btn-outline-primary rounded-pill d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#filterOffcanvas">
                    <i class="ti ti-filter me-2"></i> Filters
                </button>
            </div>
        </div>
        
        <div class="row g-4">
            
            <!-- Enhanced Filters Sidebar -->
            <div class="col-lg-3 d-none d-lg-block">
                <div class="card border-0 shadow-sm rounded-4 sticky-top" style="top: 100px; z-index: 900;" data-aos="fade-right">
                    <div class="card-body p-4">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h5 class="fw-bold mb-0">Filters</h5>
                            <button class="btn btn-link text-primary p-0 text-decoration-none small" id="clear-filters-btn">Clear All</button>
                        </div>
                        
                        <div class="mb-4">
                            <h6 class="fw-bold mb-3 small text-uppercase text-muted d-flex align-items-center gap-2">
                                <i class="ti ti-category"></i> Categories
                            </h6>
                            <div class="d-flex flex-column gap-2" id="category-filters">
                                <%if !empty($categories)%>
                                    <%foreach $categories as $index => $cat%>
                                        <%if empty($cat['parent_category_id'])%>
                                            <div class="form-check">
                                                <input class="form-check-input filter-category" type="checkbox" id="cat<%$cat['category_id']%>" value="<%$cat['category_id']%>"
                                                <%if isset($active_filters['categories']) && in_array($cat['category_id'], $active_filters['categories'])%>checked<%/if%>>
                                                <label class="form-check-label" for="cat<%$cat['category_id']%>">
                                                    <%$cat['category_name']%>
                                                </label>
                                            </div>
                                        <%/if%>
                                    <%/foreach%>
                                <%/if%>
                            </div>
                        </div>
                        
                        <hr class="my-4">
                        
                        <!-- Price Range -->
                        <div class="mb-4">
                            <h6 class="fw-bold mb-3 small text-uppercase text-muted d-flex align-items-center gap-2">
                                <i class="ti ti-currency-rupee"></i> Price Range
                            </h6>
                            <input type="range" class="form-range price-range-slider" id="priceRange" min="0" max="5000" step="50" value="<%if isset($active_filters['max_price'])%><%$active_filters['max_price']%><%else%>5000<%/if%>">
                            <div class="d-flex justify-content-between align-items-center mt-3">
                                <div class="price-badge bg-primary-subtle text-primary px-3 py-2 rounded-pill fw-bold">
                                    <small>₹</small><span id="minPrice">0</span>
                                </div>
                                <div class="text-muted small">to</div>
                                <div class="price-badge bg-primary-subtle text-primary px-3 py-2 rounded-pill fw-bold">
                                    <small>₹</small><span id="maxPrice"><%if isset($active_filters['max_price'])%><%$active_filters['max_price']%><%else%>5000<%/if%></span>
                                </div>
                            </div>
                        </div>
                        
                        <hr class="my-4">
                        
                        <button class="btn btn-primary w-100 rounded-pill shadow-sm" id="apply-filters-btn">Apply Filters</button>
                    </div>
                </div>
            </div>
            
            <!-- Enhanced Product Grid -->
            <div class="col-lg-9">
                <div class="row g-4" id="product-grid">
                    <%include file="product/product_grid.tpl"%>
                </div>
                
                <!-- Enhanced Pagination -->
                <div class="mt-5 d-flex justify-content-center" data-aos="fade-up">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li class="page-item disabled">
                                <a class="page-link rounded-pill me-2" href="#" aria-label="Previous">
                                    <i class="ti ti-chevron-left"></i>
                                </a>
                            </li>
                            <li class="page-item active"><a class="page-link rounded-pill mx-1" href="#">1</a></li>
                            <li class="page-item"><a class="page-link rounded-pill mx-1" href="#">2</a></li>
                            <li class="page-item"><a class="page-link rounded-pill mx-1" href="#">3</a></li>
                            <li class="page-item"><a class="page-link rounded-pill mx-1" href="#">4</a></li>
                            <li class="page-item">
                                <a class="page-link rounded-pill ms-2" href="#" aria-label="Next">
                                    <i class="ti ti-chevron-right"></i>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
                
            </div>
            
        </div>
    </div>
</div>

<style>
/* Product Card Hover Effects */
.product-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15) !important;
}

.product-card:hover .product-actions {
    opacity: 1 !important;
}

.product-card:hover img {
    transform: scale(1.1);
}

.hover-primary:hover {
    color: var(--primary) !important;
}

/* Icon Button Hover */
.icon-btn:hover {
    background-color: var(--primary) !important;
    color: white !important;
    transform: scale(1.1);
}

/* Form Check Custom Styling */
.form-check-input:checked {
    background-color: var(--primary);
    border-color: var(--primary);
}

/* Pagination Styling */
.pagination .page-link {
    border: none;
    color: var(--primary);
    font-weight: 600;
    transition: all 0.3s ease;
}

.pagination .page-item.active .page-link {
    background-color: var(--primary);
    color: white;
}

.pagination .page-link:hover {
    background-color: rgba(132, 169, 140, 0.1);
    transform: scale(1.1);
}

/* Price Range Slider Custom Styling */
.price-range-slider {
    height: 6px;
    background: linear-gradient(to right, var(--primary) 0%, var(--primary) 50%, #e9ecef 50%, #e9ecef 100%);
    border-radius: 10px;
    outline: none;
}

.price-range-slider::-webkit-slider-thumb {
    appearance: none;
    width: 20px;
    height: 20px;
    background: var(--primary);
    border: 3px solid white;
    border-radius: 50%;
    cursor: pointer;
    box-shadow: 0 2px 8px rgba(132, 169, 140, 0.4);
    transition: all 0.3s ease;
}

.price-range-slider::-webkit-slider-thumb:hover {
    transform: scale(1.2);
    box-shadow: 0 4px 12px rgba(132, 169, 140, 0.6);
}

.price-range-slider::-moz-range-thumb {
    width: 20px;
    height: 20px;
    background: var(--primary);
    border: 3px solid white;
    border-radius: 50%;
    cursor: pointer;
    box-shadow: 0 2px 8px rgba(132, 169, 140, 0.4);
    transition: all 0.3s ease;
}

.price-range-slider::-moz-range-thumb:hover {
    transform: scale(1.2);
    box-shadow: 0 4px 12px rgba(132, 169, 140, 0.6);
}

.price-badge {
    font-size: 0.95rem;
    letter-spacing: 0.5px;
    box-shadow: 0 2px 8px rgba(132, 169, 140, 0.15);
}
</style>

<%include file="layout/footer.tpl"%>
<script src="<%base_url('public/frontend/js/filter.js')%>"></script>
