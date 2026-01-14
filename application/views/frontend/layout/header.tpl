<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%if isset($title)%><%$title%><%else%>Shop<%/if%></title>
    
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Nunito:wght@300;400;600;700&family=Playfair+Display:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- CSS Libraries -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Tabler Icons (Stable) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/dist/tabler-icons.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    
    <!-- GSAP -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/ScrollTrigger.min.js"></script>
    
    <!-- Lenis Smooth Scroll -->
    <script src="https://unpkg.com/@studio-freight/lenis@1.0.29/dist/lenis.min.js"></script>
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<%base_url('public/frontend/css/style.css')%>">
    <link rel="stylesheet" href="<%base_url('public/css/toaster/custom_toaster.css')%>">
    <script type="text/javascript">
        var base_url = "<%base_url()%>";
    </script>
</head>
<body>
    <div class="outer-div-box"></div>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg fixed-top navbar-glass trans-nav" id="mainNav">
  <div class="container">
    <a class="navbar-brand fw-bold d-flex align-items-center gap-2" href="<%base_url('shop')%>">
      <div class="brand-icon bg-primary text-white rounded-circle d-flex align-items-center justify-content-center" style="width:40px;height:40px">
        <i class="ti ti-brush" style="font-size:1.5rem"></i>
      </div>
      <span class="tracking-tight" style="font-family: var(--font-heading); font-size: 1.5rem;">Craftology</span>
    </a>
    
    <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
      <i class="ti ti-menu-2 fs-2"></i>
    </button>
 
    <div class="collapse navbar-collapse" id="navbarContent">
      <ul class="navbar-nav mx-auto mb-2 mb-lg-0 fw-medium">
        <li class="nav-item"><a class="nav-link <%if isset($page) && $page == 'home'%>active<%/if%>" href="<%base_url('shop')%>">Home</a></li>
        <li class="nav-item dropdown position-static">
            <a class="nav-link d-flex align-items-center gap-1 <%if isset($page) && ($page == 'product_list' || $page == 'product_details')%>active<%/if%>" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Products <i class="ti ti-chevron-down" style="font-size: 0.8rem;"></i>
            </a>
            <div class="dropdown-menu w-100 border-0 shadow-lg rounded-0 rounded-bottom p-4" style="margin-top: 0px;">
                <div class="container">
                    <div class="row g-4">
                        <div class="col-lg-2 col-md-4">
                            <h6 class="dropdown-header text-primary fw-bold text-uppercase ps-0 mb-2">Resin Art</h6>
                            <ul class="list-unstyled">
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Keychains</a></li>
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Name Plates</a></li>
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Photo Frames</a></li>
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Jewellery</a></li>
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Wall Art</a></li>
                            </ul>
                        </div>
                        <div class="col-lg-2 col-md-4">
                            <h6 class="dropdown-header text-primary fw-bold text-uppercase ps-0 mb-2">Crochet</h6>
                            <ul class="list-unstyled">
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Bags & Pouches</a></li>
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Flowers & Bouquets</a></li>
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Soft Toys</a></li>
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Coasters</a></li>
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Wearables</a></li>
                            </ul>
                        </div>
                        <div class="col-lg-2 col-md-4">
                             <h6 class="dropdown-header text-primary fw-bold text-uppercase ps-0 mb-2">Custom Gifts</h6>
                            <ul class="list-unstyled">
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Name Gifts</a></li>
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Couple Gifts</a></li>
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Birthday Gifts</a></li>
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Anniversary Gifts</a></li>
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Baby Gifts</a></li>
                            </ul>
                        </div>
                         <div class="col-lg-2 col-md-4">
                             <h6 class="dropdown-header text-primary fw-bold text-uppercase ps-0 mb-2">Home Décor</h6>
                            <ul class="list-unstyled">
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Wall Hangings</a></li>
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Table Décor</a></li>
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Showpieces</a></li>
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Lamps & Lights</a></li>
                            </ul>
                        </div>
                        <div class="col-lg-2 col-md-4">
                             <h6 class="dropdown-header text-primary fw-bold text-uppercase ps-0 mb-2">Jewellery</h6>
                            <ul class="list-unstyled">
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Resin Jewellery</a></li>
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Crochet Jewellery</a></li>
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Earrings</a></li>
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Bracelets</a></li>
                            </ul>
                        </div>
                         <div class="col-lg-2 col-md-4">
                             <h6 class="dropdown-header text-primary fw-bold text-uppercase ps-0 mb-2">Festive</h6>
                            <ul class="list-unstyled">
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Diwali Décor</a></li>
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Rakhi Gifts</a></li>
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Christmas Crafts</a></li>
                                <li><a class="dropdown-item py-1 ps-3" href="<%base_url('shop/products')%>">Wedding Gifts</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </li>
        <li class="nav-item"><a class="nav-link <%if isset($page) && $page == 'about'%>active<%/if%>" href="<%base_url('shop/about')%>">About</a></li>
        <li class="nav-item"><a class="nav-link <%if isset($page) && $page == 'contact'%>active<%/if%>" href="<%base_url('shop/contact')%>">Contact</a></li>
      </ul>
      
      <div class="d-flex align-items-center gap-3">
        <!-- Search -->
        <a href="#" class="nav-icon-btn"><i class="ti ti-search"></i></a>
        
        <!-- Cart -->
        <a href="<%base_url('shop/cart')%>" class="nav-icon-btn position-relative" title="Cart">
            <i class="ti ti-shopping-cart"></i>
            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-primary" style="font-size:0.6rem">2</span>
        </a>

        <!-- User Account Dropdown -->
        <div class="dropdown">
            <a href="#" class="nav-profile-btn d-flex align-items-center justify-content-center text-decoration-none dropdown-toggle hide-arrow bg-light text-primary" data-bs-toggle="dropdown">
                <i class="ti ti-user"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-end border-0 shadow-lg rounded-3 p-2">
                <%if isset($is_customer_logged_in) && $is_customer_logged_in%>
                    <li><h6 class="dropdown-header">Welcome, <%if isset($customer_name)%><%$customer_name%><%else%>User<%/if%>!</h6></li>
                    <li><a class="dropdown-item rounded-2" href="<%base_url('shop/dashboard')%>"><i class="ti ti-user-circle me-2"></i>My Account</a></li>
                    <li><a class="dropdown-item rounded-2" href="#"><i class="ti ti-package me-2"></i>My Orders</a></li>
                    <li><a class="dropdown-item rounded-2" href="#"><i class="ti ti-heart me-2"></i>Wishlist</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item rounded-2 text-danger" href="<%base_url('shop/logout')%>"><i class="ti ti-logout me-2"></i>Logout</a></li>
                <%else%>
                    <li><h6 class="dropdown-header">Welcome, Guest!</h6></li>
                    <li><a class="dropdown-item rounded-2" href="<%base_url('shop/login')%>"><i class="ti ti-login me-2"></i>Login</a></li>
                    <li><a class="dropdown-item rounded-2" href="<%base_url('shop/register')%>"><i class="ti ti-user-plus me-2"></i>Register</a></li>
                <%/if%>
            </ul>
        </div>
      </div>
    </div>
  </div>
</nav>
<div class="main-wrapper">
