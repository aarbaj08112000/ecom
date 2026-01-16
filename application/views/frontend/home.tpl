<%include file="layout/header.tpl"%>

<!-- 1. HERO SLIDER -->
<div class="swiper hero-slider mb-5">
    <div class="swiper-wrapper">
        <%if !empty($banners)%>
            <%foreach $banners as $banner%>
                <!-- Dynamic Slide -->
                <div class="swiper-slide position-relative" style="height: 600px;">
                    <img src="<%base_url()%>public/uploads/banner/<%$banner['banner_image']%>" class="w-100 h-100 object-fit-cover" alt="Banner" onerror="this.src='https://placehold.co/1920x600/e2e8f0/84a98c?text=Handmade+Craft';">
                    <div class="position-absolute top-0 start-0 w-100 h-100 bg-dark bg-opacity-25 d-flex align-items-center justify-content-center text-center">
                        <div class="text-white px-4">
                            <h1 class="display-3 fw-bold mb-3 d-none d-md-block" style="font-family: var(--font-heading);">Handmade with Love, <br>Crafted Just for You</h1>
                             <h1 class="display-5 fw-bold mb-3 d-md-none" style="font-family: var(--font-heading);">Handmade with Love</h1>
                            <p class="lead mb-4 opacity-90">Discover unique resin art, crochet treasures, and personalized gifts.</p>
                            <a href="<%base_url('shop/products')%>" class="btn btn-light rounded-pill px-5 py-3 fw-bold btn-animate shadow-lg">Explore Crafts</a>
                        </div>
                    </div>
                </div>
            <%/foreach%>
        <%else%>
            <!-- Fallback Slide 1 -->
            <div class="swiper-slide position-relative" style="height: 600px;">
                <img src="https://images.unsplash.com/photo-1459749411177-33450b2ccac6?q=80&w=1920&fit=crop" class="w-100 h-100 object-fit-cover" alt="Handmade Crafts" onerror="this.src='https://placehold.co/1920x600/e2e8f0/84a98c?text=Handmade+Craft';">
                <div class="position-absolute top-0 start-0 w-100 h-100 bg-dark bg-opacity-25 d-flex align-items-center justify-content-center text-center">
                    <div class="text-white px-4">
                        <h1 class="display-3 fw-bold mb-3 d-none d-md-block" style="font-family: var(--font-heading);">Handmade with Love, <br>Crafted Just for You</h1>
                         <h1 class="display-5 fw-bold mb-3 d-md-none" style="font-family: var(--font-heading);">Handmade with Love</h1>
                        <p class="lead mb-4 opacity-90">Discover unique resin art, crochet treasures, and personalized gifts.</p>
                        <a href="<%base_url('shop/products')%>" class="btn btn-light rounded-pill px-5 py-3 fw-bold btn-animate shadow-lg">Explore Crafts</a>
                    </div>
                </div>
            </div>
            <!-- Fallback Slide 2 -->
            <div class="swiper-slide position-relative" style="height: 600px;">
                <img src="https://images.unsplash.com/photo-1615486511484-92e172cc4fe0?q=80&w=1920&fit=crop" class="w-100 h-100 object-fit-cover" alt="Resin Art" onerror="this.src='https://placehold.co/1920x600/e2e8f0/84a98c?text=Resin+Art';">
                 <div class="position-absolute top-0 start-0 w-100 h-100 bg-dark bg-opacity-25 d-flex align-items-center justify-content-center text-center">
                    <div class="text-white px-4">
                        <h1 class="display-3 fw-bold mb-3 d-none d-md-block" style="font-family: var(--font-heading);">Unique Resin & <br>Crochet Creations</h1>
                        <h1 class="display-5 fw-bold mb-3 d-md-none" style="font-family: var(--font-heading);">Unique Creations</h1>
                        <p class="lead mb-4 opacity-90">Add a touch of elegance to your home with our handmade decor.</p>
                        <a href="<%base_url('shop/products')%>" class="btn btn-outline-light rounded-pill px-5 py-3 fw-bold btn-animate">Shop Now</a>
                    </div>
                </div>
            </div>
        <%/if%>
    </div>
    <div class="swiper-pagination"></div>
    <div class="swiper-button-prev d-none d-md-flex text-white" style="text-shadow: 0 2px 4px rgba(0,0,0,0.3);"></div>
    <div class="swiper-button-next d-none d-md-flex text-white" style="text-shadow: 0 2px 4px rgba(0,0,0,0.3);"></div>
</div>

<div class="container py-5">
    
    <!-- 2. CATEGORIES SECTION -->
    <div class="row mb-5 text-center">
        <div class="col-12">
             <p class="text-primary fw-bold small text-uppercase mb-2">Collections</p>
             <h2 class="fw-bold display-6 mb-4" style="font-family: var(--font-heading);">Shop by Category</h2>
        </div>
    </div>
    
    <div class="row g-4 mb-5 pb-5">
        <!-- Resin Art -->
        <div class="col-md-4 col-6">
            <a href="#" class="text-decoration-none">
                <div class="category-card position-relative rounded-4 overflow-hidden shadow-sm h-100 group" style="min-height: 280px;">
                    <img src="https://images.unsplash.com/photo-1595188735235-c30997195c47?q=80&w=600&auto=format&fit=crop" class="img-fluid w-100 h-100 object-fit-cover transition-scale" alt="Resin Art" onerror="this.src='https://placehold.co/600x600/e2e8f0/84a98c?text=Resin+Art';">
                    <div class="position-absolute bottom-0 start-0 w-100 bg-gradient-to-t p-4 text-center">
                        <h5 class="fw-bold mb-0 text-white" style="font-family: var(--font-heading);">Resin Art</h5>
                    </div>
                </div>
            </a>
        </div>
        <!-- Crochet -->
         <div class="col-md-4 col-6">
             <a href="#" class="text-decoration-none">
                <div class="category-card position-relative rounded-4 overflow-hidden shadow-sm h-100 group" style="min-height: 280px;">
                    <img src="https://images.unsplash.com/photo-1584992236310-6eddd724a4c5?q=80&w=600&auto=format&fit=crop" class="img-fluid w-100 h-100 object-fit-cover transition-scale" alt="Crochet" onerror="this.src='https://placehold.co/600x600/e2e8f0/84a98c?text=Crochet';">
                    <div class="position-absolute bottom-0 start-0 w-100 bg-gradient-to-t p-4 text-center">
                        <h5 class="fw-bold mb-0 text-white" style="font-family: var(--font-heading);">Crochet</h5>
                    </div>
                </div>
            </a>
        </div>
        <!-- Custom Gifts -->
         <div class="col-md-4 col-6">
             <a href="#" class="text-decoration-none">
                <div class="category-card position-relative rounded-4 overflow-hidden shadow-sm h-100 group" style="min-height: 280px;">
                    <img src="https://images.unsplash.com/photo-1549465220-1a8b9238cd48?q=80&w=600&auto=format&fit=crop" class="img-fluid w-100 h-100 object-fit-cover transition-scale" alt="Custom Gifts" onerror="this.src='https://placehold.co/600x600/e2e8f0/84a98c?text=Custom+Gifts';">
                    <div class="position-absolute bottom-0 start-0 w-100 bg-gradient-to-t p-4 text-center">
                        <h5 class="fw-bold mb-0 text-white" style="font-family: var(--font-heading);">Custom Gifts</h5>
                    </div>
                </div>
            </a>
        </div>
         <!-- Home Decor -->
         <div class="col-md-4 col-6">
             <a href="#" class="text-decoration-none">
                  <div class="category-card position-relative rounded-4 overflow-hidden shadow-sm h-100 group" style="min-height: 280px;">
                    <img src="https://images.unsplash.com/photo-1513519245088-0e12902e5a38?q=80&w=600&auto=format&fit=crop" class="img-fluid w-100 h-100 object-fit-cover transition-scale" alt="Home Décor" onerror="this.src='https://placehold.co/600x600/e2e8f0/84a98c?text=Home+Decor';">
                    <div class="position-absolute bottom-0 start-0 w-100 bg-gradient-to-t p-4 text-center">
                        <h5 class="fw-bold mb-0 text-white" style="font-family: var(--font-heading);">Home Décor</h5>
                    </div>
                </div>
            </a>
        </div>
         <!-- Jewellery -->
         <div class="col-md-4 col-6">
             <a href="#" class="text-decoration-none">
                  <div class="category-card position-relative rounded-4 overflow-hidden shadow-sm h-100 group" style="min-height: 280px;">
                    <img src="https://images.unsplash.com/photo-1573408301185-9146fe634ad0?q=80&w=600&auto=format&fit=crop" class="img-fluid w-100 h-100 object-fit-cover transition-scale" alt="Jewellery" onerror="this.src='https://placehold.co/600x600/e2e8f0/84a98c?text=Jewellery';">
                    <div class="position-absolute bottom-0 start-0 w-100 bg-gradient-to-t p-4 text-center">
                        <h5 class="fw-bold mb-0 text-white" style="font-family: var(--font-heading);">Jewellery</h5>
                    </div>
                </div>
            </a>
        </div>
         <!-- Festive -->
         <div class="col-md-4 col-6">
             <a href="#" class="text-decoration-none">
                  <div class="category-card position-relative rounded-4 overflow-hidden shadow-sm h-100 group" style="min-height: 280px;">
                    <img src="https://images.unsplash.com/photo-1512760678229-373b9409848d?q=80&w=600&auto=format&fit=crop" class="img-fluid w-100 h-100 object-fit-cover transition-scale" alt="Festive" onerror="this.src='https://placehold.co/600x600/e2e8f0/84a98c?text=Festive';">
                    <div class="position-absolute bottom-0 start-0 w-100 bg-gradient-to-t p-4 text-center">
                         <h5 class="fw-bold mb-0 text-white" style="font-family: var(--font-heading);">Festive Specials</h5>
                    </div>
                </div>
            </a>
        </div>
    </div>
    
    <!-- 3. BEST SELLERS SECTION -->
    <div class="d-flex justify-content-between align-items-end mb-4">
        <div>
            <p class="text-primary fw-bold small text-uppercase mb-2">Customer Favorites</p>
            <h2 class="fw-bold display-6 mb-0" style="font-family: var(--font-heading);">Best Sellers</h2>
        </div>
        <a href="<%base_url('shop/products')%>" class="btn btn-outline-primary rounded-pill px-4 d-none d-md-block">View All</a>
    </div>
    
    <div class="row g-4 mb-5 pb-4">
        <%if isset($best_sellers) && !empty($best_sellers)%>
            <%foreach $best_sellers as $product%>
            <div class="col-lg-3 col-6">
                <div class="card h-100 border-0 shadow-sm rounded-4 product-card overflow-hidden">
                    <div class="position-relative overflow-hidden">
                         <span class="badge bg-warning position-absolute top-0 start-0 m-3 z-3">Best Seller</span>
                        <img src="<%$product->image%>" class="card-img-top object-fit-cover" alt="<%$product->name%>" style="height: 280px;" onerror="this.src='https://placehold.co/600x600/e2e8f0/84a98c?text=Craft';">
                        <!-- Hover Action -->
                        <div class="product-action position-absolute bottom-0 start-0 w-100 p-3 d-flex gap-2 justify-content-center translate-y-100 transition-up">
                            <button class="btn btn-white rounded-circle shadow-sm" data-bs-toggle="tooltip" title="Quick View"><i class="ti ti-eye"></i></button>
                            <button class="btn btn-primary rounded-circle shadow-sm" data-bs-toggle="tooltip" title="Add to Cart"><i class="ti ti-shopping-cart-plus"></i></button>
                        </div>
                    </div>
                    <div class="card-body text-center">
                        <div class="text-warning small mb-2"><i class="ti ti-star-filled"></i> <i class="ti ti-star-filled"></i> <i class="ti ti-star-filled"></i> <i class="ti ti-star-filled"></i> <i class="ti ti-star-filled"></i></div>
                        <h6 class="fw-bold mb-1" style="font-family: var(--font-heading);"><%$product->name%></h6>
                        <p class="text-primary fw-bold mb-0">$<%$product->price|number_format:2%></p>
                    </div>
                </div>
            </div>
            <%/foreach%>
        <%/if%>
    </div>
    
</div>

<!-- 5. CUSTOM ORDER BANNER -->
<section class="py-5 position-relative overflow-hidden mb-5">
    <img src="https://images.unsplash.com/photo-1544816155-12df9643f363?q=80&w=1920&fit=crop" class="position-absolute top-0 start-0 w-100 h-100 object-fit-cover" alt="Custom Orders" onerror="this.src='https://placehold.co/1920x800/e2e8f0/84a98c?text=Custom+Orders';">
    <div class="position-absolute top-0 start-0 w-100 h-100 bg-primary opacity-75"></div>
    <div class="container position-relative py-5 text-center text-white">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <i class="ti ti-wand fs-1 mb-3 d-inline-block"></i>
                <h2 class="display-5 fw-bold mb-3" style="font-family: var(--font-heading);">Want something personal?</h2>
                <p class="lead mb-4 fw-light opacity-90">We create handmade crafts just for you. From custom nameplates to personalized gift hampers, let's bring your idea to life.</p>
                <a href="<%base_url('shop/contact')%>" class="btn btn-light text-primary rounded-pill px-5 py-3 fw-bold shadow-lg btn-animate">Customize Now</a>
            </div>
        </div>
    </div>
</section>


<div class="container py-5">
    
    <!-- 4. NEW ARRIVALS -->
    <div class="d-flex justify-content-between align-items-end mb-4">
        <div>
            <p class="text-primary fw-bold small text-uppercase mb-2">Fresh from the Studio</p>
            <h2 class="fw-bold display-6 mb-0" style="font-family: var(--font-heading);">New Arrivals</h2>
        </div>
         <a href="<%base_url('shop/products')%>" class="btn btn-outline-primary rounded-pill px-4 d-none d-md-block">View All</a>
    </div>
    
     <div class="row g-4 mb-5 pb-5">
        <%if isset($new_arrivals) && !empty($new_arrivals)%>
            <%foreach $new_arrivals as $product%>
            <div class="col-lg-3 col-6">
                <div class="card h-100 border-0 shadow-sm rounded-4 product-card overflow-hidden aos-init" data-aos="fade-up">
                    <div class="position-relative overflow-hidden">
                        <span class="badge bg-info position-absolute top-0 start-0 m-3 z-3">New</span>
                        <img src="<%$product->image%>" class="card-img-top object-fit-cover" alt="<%$product->name%>" style="height: 280px;" onerror="this.src='https://placehold.co/600x600/e2e8f0/84a98c?text=Craft';">
                         <div class="product-action position-absolute bottom-0 start-0 w-100 p-3 d-flex gap-2 justify-content-center translate-y-100 transition-up">
                            <button class="btn btn-white rounded-circle shadow-sm"><i class="ti ti-eye"></i></button>
                            <button class="btn btn-primary rounded-circle shadow-sm"><i class="ti ti-shopping-cart-plus"></i></button>
                        </div>
                    </div>
                    <div class="card-body text-center">
                        <h6 class="fw-bold mb-1" style="font-family: var(--font-heading);"><%$product->name%></h6>
                        <p class="text-primary fw-bold mb-0">$<%$product->price|number_format:2%></p>
                    </div>
                </div>
            </div>
            <%/foreach%>
        <%/if%>
    </div>
    
    <!-- 6. TRUST SECTION -->
    <div class="row g-4 py-5 mb-5 border-top border-bottom" style="border-color: rgba(132, 169, 140, 0.2) !important;">
        <div class="col-md-3 col-6 text-center">
            <div class="mb-3 text-primary"><i class="ti ti-heart-handshake fs-1"></i></div>
            <h6 class="fw-bold">100% Handmade</h6>
            <p class="small text-muted mb-0">Crafted with love & passion</p>
        </div>
        <div class="col-md-3 col-6 text-center">
            <div class="mb-3 text-primary"><i class="ti ti-diamond fs-1"></i></div>
            <h6 class="fw-bold">Unique Designs</h6>
             <p class="small text-muted mb-0">One-of-a-kind treasures</p>
        </div>
        <div class="col-md-3 col-6 text-center">
             <div class="mb-3 text-primary"><i class="ti ti-gift fs-1"></i></div>
            <h6 class="fw-bold">Perfect for Gifting</h6>
            <p class="small text-muted mb-0">Memorable & personalized</p>
        </div>
         <div class="col-md-3 col-6 text-center">
             <div class="mb-3 text-primary"><i class="ti ti-map-pin fs-1"></i></div>
            <h6 class="fw-bold">Made in India</h6>
            <p class="small text-muted mb-0">Supporting local artisans</p>
        </div>
    </div>
    
    <!-- 7. GALLERY SECTION -->
    <div class="text-center mb-5">
        <h2 class="fw-bold display-6 mb-2" style="font-family: var(--font-heading);">Share the Joy</h2>
        <p class="text-muted">Real crafts, real smiles. Follow us @Craftology</p>
    </div>
    
    <div class="row g-2 mb-5">
        <!-- Big Square Left -->
        <div class="col-lg-4 col-md-6">
            <div class="ratio ratio-1x1 rounded-4 overflow-hidden position-relative group">
                <%if isset($gallery[0])%>
                    <img src="<%base_url()%>public/uploads/gallery/<%$gallery[0]['gallery_image']%>" class="object-fit-cover w-100 h-100 transition-scale" alt="Gallery 1">
                <%else%>
                    <img src="https://images.unsplash.com/photo-1629196914168-3a958801e540?q=80&w=800&fit=crop" class="object-fit-cover w-100 h-100 transition-scale" alt="Gallery 1" onerror="this.src='https://placehold.co/800x800/e2e8f0/84a98c?text=Gallery+1';">
                <%/if%>
                <div class="position-absolute top-0 start-0 w-100 h-100 bg-dark bg-opacity-25 opacity-0 group-hover-opacity transition-all d-flex align-items-center justify-content-center">
                    <i class="ti ti-brand-instagram text-white fs-1"></i>
                </div>
            </div>
        </div>
        
        <!-- Middle Column -->
         <div class="col-lg-4 col-md-6">
             <div class="row g-2 h-100">
                 <!-- Small Square Middle Left -->
                 <div class="col-6">
                      <div class="ratio ratio-1x1 rounded-4 overflow-hidden position-relative group">
                        <%if isset($gallery[1])%>
                            <img src="<%base_url()%>public/uploads/gallery/<%$gallery[1]['gallery_image']%>" class="object-fit-cover w-100 h-100 transition-scale" alt="Gallery 2">
                        <%else%>
                            <img src="https://images.unsplash.com/photo-1572295283584-6997b8304915?q=80&w=800&fit=crop" class="object-fit-cover w-100 h-100 transition-scale" alt="Gallery 2" onerror="this.src='https://placehold.co/800x800/e2e8f0/84a98c?text=Gallery+2';">
                        <%/if%>
                         <div class="position-absolute top-0 start-0 w-100 h-100 bg-dark bg-opacity-25 opacity-0 group-hover-opacity transition-all d-flex align-items-center justify-content-center">
                            <i class="ti ti-brand-instagram text-white fs-1"></i>
                        </div>
                    </div>
                 </div>
                 <!-- Small Square Middle Right -->
                 <div class="col-6">
                      <div class="ratio ratio-1x1 rounded-4 overflow-hidden position-relative group">
                        <%if isset($gallery[2])%>
                            <img src="<%base_url()%>public/uploads/gallery/<%$gallery[2]['gallery_image']%>" class="object-fit-cover w-100 h-100 transition-scale" alt="Gallery 3">
                        <%else%>
                            <img src="https://images.unsplash.com/photo-1601633513364-7729f220310e?q=80&w=800&fit=crop" class="object-fit-cover w-100 h-100 transition-scale" alt="Gallery 3" onerror="this.src='https://placehold.co/800x800/e2e8f0/84a98c?text=Gallery+3';">
                        <%/if%>
                         <div class="position-absolute top-0 start-0 w-100 h-100 bg-dark bg-opacity-25 opacity-0 group-hover-opacity transition-all d-flex align-items-center justify-content-center">
                            <i class="ti ti-brand-instagram text-white fs-1"></i>
                        </div>
                    </div>
                 </div>
                 <!-- Horizontal Rectangle Middle Bottom -->
                 <div class="col-12">
                      <div class="ratio ratio-21x9 rounded-4 overflow-hidden position-relative group">
                        <%if isset($gallery[3])%>
                            <img src="<%base_url()%>public/uploads/gallery/<%$gallery[3]['gallery_image']%>" class="object-fit-cover w-100 h-100 transition-scale" alt="Gallery 4">
                        <%else%>
                            <img src="https://images.unsplash.com/photo-1603673397940-1bc7d0cb0056?q=80&w=800&fit=crop" class="object-fit-cover w-100 h-100 transition-scale" alt="Gallery 4" onerror="this.src='https://placehold.co/800x800/e2e8f0/84a98c?text=Gallery+4';">
                        <%/if%>
                         <div class="position-absolute top-0 start-0 w-100 h-100 bg-dark bg-opacity-25 opacity-0 group-hover-opacity transition-all d-flex align-items-center justify-content-center">
                            <i class="ti ti-brand-instagram text-white fs-1"></i>
                        </div>
                    </div>
                 </div>
             </div>
        </div>
        
        <!-- Big Square Right (Desktop Only) -->
         <div class="col-lg-4 col-md-12 d-none d-lg-block">
             <div class="ratio ratio-1x1 rounded-4 overflow-hidden position-relative group">
                <%if isset($gallery[4])%>
                    <img src="<%base_url()%>public/uploads/gallery/<%$gallery[4]['gallery_image']%>" class="object-fit-cover w-100 h-100 transition-scale" alt="Gallery 5">
                <%else%>
                    <img src="https://images.unsplash.com/photo-1616880017122-ce5ea5040f7f?q=80&w=800&fit=crop" class="object-fit-cover w-100 h-100 transition-scale" alt="Gallery 5" onerror="this.src='https://placehold.co/800x800/e2e8f0/84a98c?text=Gallery+5';">
                <%/if%>
                <div class="position-absolute top-0 start-0 w-100 h-100 bg-dark bg-opacity-25 opacity-0 group-hover-opacity transition-all d-flex align-items-center justify-content-center">
                    <i class="ti ti-brand-instagram text-white fs-1"></i>
                </div>
            </div>
        </div>
    </div>
    
     <!-- 8. REVIEWS SECTION -->
     <div class="bg-light rounded-5 p-5 position-relative overflow-hidden">
         <div class="position-absolute top-0 start-0 w-100 h-100 opacity-10" style="background: url('https://www.transparenttextures.com/patterns/creampaper.png');"></div>
         <div class="text-center position-relative z-1">
             <i class="ti ti-quote text-primary opacity-25" style="font-size: 4rem;"></i>
             <h2 class="fw-bold mb-5" style="font-family: var(--font-heading);">What Our Family Says</h2>
             
             <div class="swiper reviews-slider">
                 <div class="swiper-wrapper">
                    <%if !empty($testimonials)%>
                        <%foreach from=$testimonials item=val %>
                         <div class="swiper-slide px-5 mb-4">
                             <p class="lead fst-italic mb-4">"<%$val['message']%>"</p>
                             <h6 class="fw-bold text-dark"><%$val['name']%></h6>
                             <p class="small text-muted"><%$val['designation']%></p>
                         </div>
                        <%/foreach%>
                    <%else%>
                         <div class="swiper-slide px-5">
                             <p class="lead fst-italic mb-4">"Absolutely stunning resin clock! The packing was so safe and the handwritten note made my day. Will definitely order again."</p>
                             <h6 class="fw-bold text-dark">Priya Sharma</h6>
                             <p class="small text-muted">Mumbai</p>
                         </div>
                         <div class="swiper-slide px-5">
                             <p class="lead fst-italic mb-4">"The crochet bunny is adorable. My niece hasn't put it down since her birthday. Detail is amazing!"</p>
                             <h6 class="fw-bold text-dark">Anjali Mehta</h6>
                             <p class="small text-muted">Delhi</p>
                         </div>
                         <div class="swiper-slide px-5">
                             <p class="lead fst-italic mb-4">"Ordered a custom nameplate and it turned out better than I imagined. Very professional service."</p>
                             <h6 class="fw-bold text-dark">Rahul Verma</h6>
                             <p class="small text-muted">Bangalore</p>
                         </div>
                    <%/if%>
                 </div>
                 <div class="swiper-pagination mt-4"></div>
             </div>
         </div>
     </div>
    
</div>

<style>
/* Gradient Overlay for Categories */
.bg-gradient-to-t {
    background: linear-gradient(to top, rgba(0,0,0,0.7) 0%, rgba(0,0,0,0) 100%);
}
.group:hover .transition-scale {
    transform: scale(1.1);
}
.transition-scale {
    transition: transform 0.6s ease;
}
.group-hover-opacity:hover {
    opacity: 1 !important;
}
.translate-y-100 {
    transform: translateY(100%);
}
.product-card:hover .translate-y-100 {
    transform: translateY(0);
}
.transition-up {
    transition: transform 0.3s ease;
}
</style>

<%include file="layout/footer.tpl"%>
