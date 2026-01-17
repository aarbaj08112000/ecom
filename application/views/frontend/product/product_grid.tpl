<%if !empty($products)%>
    <%foreach $products as $index => $p%>
    <div class="col-xl-4 col-md-6 col-sm-6" data-aos="fade-up" data-aos-delay="<%($index % 3) * 100%>">
        <div class="product-card card h-100 border-0 shadow-sm rounded-4 overflow-hidden position-relative" style="transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);">
            <!-- Product Badge -->
            <%if $p->price_before_discount > $p->price%>
            <div class="position-absolute top-0 start-0 m-3 z-3">
                <span class="badge bg-danger rounded-pill px-3 py-2 shadow-sm">
                    -<%((($p->price_before_discount - $p->price) / $p->price_before_discount) * 100)|round%>%
                </span>
            </div>
            <%/if%>
            
            <!-- Image Container -->
            <div class="position-relative overflow-hidden bg-white" style="height: 280px;">
                <!-- Hover Actions -->
                <!-- Hover Actions -->
                <div class="product-actions position-absolute top-50 start-50 translate-middle d-flex gap-2 z-2" style="opacity: 0; transition: opacity 0.3s ease;">
                    <button class="btn btn-white rounded-circle shadow icon-btn" title="Add to Cart" style="width: 45px; height: 45px;" onclick="addToCart(event, <%$p->id%>)">
                        <i class="ti ti-shopping-cart"></i>
                    </button>
                    <a href="<%base_url('shop/product/'|cat:$p->id)%>" class="btn btn-white rounded-circle shadow icon-btn" title="Quick View" style="width: 45px; height: 45px;">
                        <i class="ti ti-eye"></i>
                    </a>
                    <%if isset($is_customer_logged_in) && $is_customer_logged_in%>
                    <button class="btn btn-white rounded-circle shadow icon-btn" title="<%if isset($wishlisted_products) && in_array($p->id, $wishlisted_products)%>Remove wishlist<%else%>Add wishlist<%/if%>" style="width: 45px; height: 45px;" onclick="addToWishlist(<%$p->id%>, this)">
                        <i class="ti <%if isset($wishlisted_products) && in_array($p->id, $wishlisted_products)%>ti-heart text-danger<%else%>ti-heart<%/if%>"></i>
                    </button>
                    <%/if%>
                </div>
                
                <!-- Product Image -->
                <img src="<%base_url('public/uploads/products/')%><%$p->id%>/<%$p->cover_image%>" 
                     class="w-100 h-100 p-3" 
                     style="object-fit: cover; transition: transform 0.5s cubic-bezier(0.4, 0, 0.2, 1);" 
                     alt="<%$p->name%>" 
                     onerror="this.src='https://placehold.co/600x600/e2e8f0/84a98c?text=Craft';">
            </div>
            
            <!-- Card Body -->
            <div class="card-body p-4">
                <div class="small text-primary mb-2 fw-semibold"><%$p->category_name%></div>
                <h5 class="card-title fw-bold mb-2" style="font-size: 1.1rem; line-height: 1.4;">
                    <a href="<%base_url('shop/product/'|cat:$p->id)%>" class="text-dark text-decoration-none hover-primary">
                        <%$p->name%>
                    </a>
                </h5>
                
                <!-- Rating -->
                <div class="d-flex align-items-center gap-2 mb-3">
                    <div class="text-warning">
                        <%for $i=0 to 4%>
                            <i class="ti ti-star<%if isset($p->rating) && $i < $p->rating|floor%>-filled<%/if%>" style="font-size: 0.9rem;"></i>
                        <%/for%>
                    </div>
                    <span class="small text-muted">(<%if isset($p->rating)%><%$p->rating%><%else%>5.0<%/if%>)</span>
                </div>
                
                <!-- Price -->
                <div class="d-flex align-items-center justify-content-between">
                    <div class="d-flex align-items-baseline gap-2">
                        <span class="fw-bold text-primary" style="font-size: 1.4rem;">₹<%$p->price|number_format:2%></span>
                        <%if $p->price_before_discount > $p->price%>
                            <span class="small text-decoration-line-through text-muted">₹<%$p->price_before_discount|number_format:2%></span>
                        <%/if%>
                    </div>
                    <button class="btn btn-primary btn-sm rounded-pill px-3 shadow-sm" style="transition: all 0.3s ease;" onclick="addToCart(event, <%$p->id%>)">
                        <i class="ti ti-shopping-cart me-1"></i> Add
                    </button>
                </div>
            </div>
        </div>
    </div>
    <%/foreach%>
<%else%>
    <div class="col-12 text-center py-5">
        <div class="mb-4">
            <i class="ti ti-search fs-1 text-muted opacity-25" style="font-size: 5rem !important;"></i>
        </div>
        <h3 class="fw-bold">No products found</h3>
        <p class="text-muted">Try adjusting your filters to find what you're looking for.</p>
        <button class="btn btn-primary rounded-pill px-4 mt-3" onclick="resetFilters()">Clear All Filters</button>
    </div>
<%/if%>
