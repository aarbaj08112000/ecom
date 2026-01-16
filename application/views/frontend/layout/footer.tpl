</div> <!-- End Main Wrapper -->

<footer class="bg-dark text-white pt-5 pb-3 mt-5">
    <div class="container">
        <div class="row g-4 mb-5">
            <!-- Brand -->
            <div class="col-lg-3">
                <h4 class="fw-bold mb-3 d-flex align-items-center gap-2">
                    <%if isset($config['frontend_company_logo']) && $config['frontend_company_logo'] != ''%>
                        <img src="<%base_url()%><%$config['frontend_company_logo']%>" alt="Logo" style="max-height: 32px; filter: brightness(0) invert(1);">
                    <%else%>
                        <div class="bg-white text-dark rounded-circle d-flex align-items-center justify-content-center" style="width:32px;height:32px">
                            <i class="ti ti-brush" style="font-size:1.2rem; color: var(--primary);"></i>
                        </div>
                        <span style="font-family: var(--font-heading);">Craftology</span>
                    <%/if%>
                </h4>
                <p class="text-white-50 small mb-4"><%if isset($config['company_description']) && $config['company_description'] != ''%><%$config['company_description']%><%else%>Handcrafted with love. Discover unique resin art, crochet treasures, and personalized gifts made just for you.<%/if%></p>
                <div class="d-flex gap-2">
                    <%if isset($config['social_facebook']) && $config['social_facebook'] != ''%>
                        <a href="<%$config['social_facebook']%>" target="_blank" class="social-btn"><i class="ti ti-brand-facebook"></i></a>
                    <%/if%>
                    <%if isset($config['social_instagram']) && $config['social_instagram'] != ''%>
                        <a href="<%$config['social_instagram']%>" target="_blank" class="social-btn"><i class="ti ti-brand-instagram"></i></a>
                    <%/if%>
                    <%if isset($config['social_whatsapp']) && $config['social_whatsapp'] != ''%>
                        <a href="https://wa.me/<%$config['social_whatsapp']%>" target="_blank" class="social-btn"><i class="ti ti-brand-whatsapp"></i></a>
                    <%/if%>
                    <%if isset($config['social_linkedin']) && $config['social_linkedin'] != ''%>
                        <a href="<%$config['social_linkedin']%>" target="_blank" class="social-btn"><i class="ti ti-brand-linkedin"></i></a>
                    <%/if%>
                    <%if isset($config['company_email']) && $config['company_email'] != ''%>
                        <a href="mailto:<%$config['company_email']%>" class="social-btn" title="<%$config['company_email']%>"><i class="ti ti-mail"></i></a>
                    <%/if%>
                </div>
            </div>
            
            <!-- Shop -->
            <div class="col-lg-2 col-6">
                <h6 class="fw-bold mb-3">Shop</h6>
                <ul class="list-unstyled text-white-50 footer-link-list small">
                    <li><a href="<%base_url('shop')%>">New Arrivals</a></li>
                    <li><a href="<%base_url('shop')%>">Best Sellers</a></li>
                </ul>
            </div>
            
            <!-- Support -->
            <div class="col-lg-2 col-6">
                <h6 class="fw-bold mb-3">Support</h6>
                <ul class="list-unstyled text-white-50 footer-link-list small">
                    <li><a href="<%base_url('shop/track-order')%>">Track Order</a></li>
                    <li><a href="<%base_url('shop/shipping-policy')%>">Shipping Policy</a></li>
                    <li><a href="<%base_url('shop/returns')%>">Returns & Refunds</a></li>
                    <li><a href="<%base_url('shop/faqs')%>">FAQs</a></li>
                    <li><a href="<%base_url('shop/privacy-policy')%>">Privacy Policy</a></li>
                </ul>
            </div>
            
            <!-- Community -->
             <div class="col-lg-2 col-6">
                <h6 class="fw-bold mb-3">Community</h6>
                <ul class="list-unstyled text-white-50 footer-link-list small">
                    <li><a href="#">Customer Stories</a></li>
                    <li><a href="#">Reviews</a></li>
                    <li><a href="#">Craft Journal</a></li>
                    <li><a href="#">Gallery</a></li>
                </ul>
            </div>
            
            <!-- Newsletter -->
            <div class="col-lg-3 col-6">
                <h6 class="fw-bold mb-3">Newsletter</h6>
                <p class="text-white-50 small">Subscribe for crafting tips and exclusive deals.</p>
                <div class="input-group">
                    <input type="text" class="form-control rounded-start-pill border-0 form-control-sm" placeholder="Email address">
                    <button class="btn btn-primary rounded-end-pill px-3 btn-sm">Join</button>
                </div>
            </div>
        </div>
        
        <div class="border-top border-secondary pt-3 text-center text-white-50 small">
            &copy; <%$smarty.now|date_format:"%Y"%> Craftology. All rights reserved. Made with <i class="ti ti-heart text-white mx-1"></i> for Art Lovers.
        </div>
    </div>
</footer>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.20.0/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="<%base_url('public/js/toaster/custom_toaster.js')%>"></script>
<script src="<%base_url('public/frontend/js/main.js')%>"></script>
<%if isset($page) && ($page == 'register' || $page == 'login' || $page == 'forgot_password')%>
<script src="<%base_url('public/frontend/js/auth.js')%>"></script>
<%/if%>
<script>
    AOS.init({
        duration: 800,
        once: true,
        offset: 100
    });
</script>
<!-- Quick View Modal -->
<div class="modal fade" id="quickViewModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content glass-modal rounded-4 border-0 overflow-hidden">
            <div class="modal-body p-0">
                <div class="row g-0">
                    <div class="col-md-6 bg-light d-flex align-items-center justify-content-center p-4">
                        <img src="https://images.unsplash.com/photo-1595188735235-c30997195c47?q=80&w=600&auto=format&fit=crop" class="img-fluid rounded-3 shadow-sm" alt="Product">
                    </div>
                    <div class="col-md-6 p-4 p-lg-5">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <span class="badge bg-primary-subtle text-primary rounded-pill px-3 py-1">New Arrival</span>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <h3 class="fw-bold mb-2">Detailed Product Name</h3>
                        <div class="d-flex align-items-center gap-2 mb-4">
                            <span class="h4 fw-bold text-dark mb-0">$129.00</span>
                            <span class="text-decoration-line-through text-muted small">$159.00</span>
                        </div>
                        <p class="text-muted small mb-4">Experience premium quality with our latest collection. Designed for comfort and style.</p>
                        
                        <div class="d-grid gap-2">
                             <a href="<%base_url('shop/product/1')%>" class="btn btn-dark rounded-pill py-3 fw-bold">View Full Details</a>
                             <button type="button" class="btn btn-outline-dark rounded-pill py-3 fw-bold" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
