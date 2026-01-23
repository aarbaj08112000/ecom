      
<!DOCTYPE html>
<html
   lang="en"
   class="light-style layout-menu-fixed layout-menu-collapsed  layout-navbar-fixed "
   dir="ltr"
   data-theme="theme-default"
   data-assets-path="<%$base_url%>public/assets/"
   data-template="vertical-menu-template-free"
   >
   <head>
      <meta charset="utf-8" />
      <meta
         name="viewport"
         content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
         />
      <title><%$config['admin_company_name']%></title>
      <meta name="description" content="" />
      <base href="<%base_url()%>">
      <!-- Favicon -->
      <link rel="icon" type="image/x-icon" href="<%base_url()%><%$config['admin_company_fav_icon']%>" />
      <!-- Fonts -->
      <link rel="preconnect" href="https://fonts.googleapis.com" />
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
      <link
         href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
         rel="stylesheet"
         />
      <!-- Icons. Uncomment required icon fonts -->
      <link rel="stylesheet" href="<%$base_url%>public/assets/vendor/fonts/boxicons.css" />

      <!-- lineawesome --->
      <link rel="stylesheet" href="<%$base_url%>public/css/line-awesome/1.3.0/css/line-awesome.css">
      <link rel="stylesheet" href="<%$base_url%>public/css/line-awesome/1.3.0/css/line-awesome.min.css">

      <!-- lineawesome --->

      <!-- tabler css -->
      <link rel="stylesheet" href="<%$base_url%>public/css/plugin/tabler_css/tabler_icons.css">
      <!-- Core CSS -->
      <link rel="stylesheet" href="<%$base_url%>public/assets/vendor/css/core.css" class="template-customizer-core-css" />
      <link rel="stylesheet" href="<%$base_url%>public/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
      <link rel="stylesheet" href="<%$base_url%>public/assets/css/theme.css" />
      <!-- Vendors CSS -->
      <link rel="stylesheet" href="<%$base_url%>public/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
      <link rel="stylesheet" href="<%$base_url%>public/assets/vendor/libs/apex-charts/apex-charts.css" />
      <link rel="stylesheet" href="<%$base_url%>public/css/common.css" />
      <link rel="stylesheet" href="<%$base_url%>public/assets/css/admin-theme.css" />
      <!-- Admin Global Color Configuration -->
      <link rel="stylesheet" href="<%$base_url%>public/assets/css/admin-theme-colors.css" />
      <!-- Page CSS -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
      <!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css"> -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
      <!-- <link rel="stylesheet" type="text/css" href="<%$base_url%>public/css/data_table/select.dataTables.min.css"> -->
      <!-- <link rel="stylesheet" type="text/css" href="<%$base_url%>public/css/data_table/jquery.dataTables.min.css"> -->
      <link rel="stylesheet" type="text/css" href="<%$base_url%>public/css/data_table/searchPanes.dataTables.min.css">
      <!-- Helpers -->
      <!-- <script src="<%$base_url%>public/assets/vendor/js/helpers.js"></script> -->
      <script src="<%$base_url%>public/assets/js/config.js"></script>
      <script src="<%$base_url%>public/assets/vendor/js/bootstrap.js"></script>
      <script src="<%$base_url%>public/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
      <script src="<%$base_url%>public/js/admin/plugin/jquery.min.js"></script>
      <script src="<%$base_url%>public/js/admin/plugin/jquery.validate.js"></script>
      <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
      <script src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js"></script>
      <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js"></script>
      <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.print.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.70/pdfmake.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.70/vfs_fonts.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
      <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/fixedcolumns/3.3.3/js/dataTables.fixedColumns.min.js"></script>
      <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
      <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedcolumns/3.3.3/css/fixedColumns.dataTables.min.css">
      <link rel="stylesheet" type="text/css" href="<%$base_url%>public/css/data_table/datatable.css">
      <!-- select2 -->
      <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
      <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
      <!-- toastr -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
      <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
      <!-- toastr -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
      <!-- date picker  -->
      <!-- <script src="https://cdn.jsdelivr.net/npm/moment/min/moment.min.js"></script>
         <script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
         <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"> -->
      <script type="text/javascript" src="<%base_url()%>public/plugin/datepicker/moment.min.js"></script>
      <script type="text/javascript" src="<%base_url()%>public/plugin/datepicker/daterangepicker.min.js"></script>
      <link rel="stylesheet" type="text/css" href="<%base_url()%>public/plugin/datepicker/daterangepicker.css" />
      <script type="text/javascript">
         var theme_color = "#ea1c31";
      </script>
    <!-- toaster -->
      <link rel="stylesheet" href="public/css/toaster/custom_toaster.css" />
      <link rel="stylesheet" href="public/css/fontawesome/font_awesome.css">
     <!-- toaster -->
     <script type="text/javascript">
        var default_page_view_type = <%json_decode($config['default_page_view_type'])|@json_encode%>;
     </script>
     <script type="text/javascript" src="<%base_url()%>public/js/admin/grid_structure.js"></script>
     <script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
     <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

   </head>
   <body>
      <!-- Layout wrapper -->
      <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container outer-div-box">
      <!-- Menu -->
      <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme ">
         <div class="app-brand demo ps-3">
            <a href="javascript:void(0)" class="app-brand-link">
            <span class="app-brand-logo demo">
               <img src="<%base_url()%><%$config['admin_company_logo']%>" alt="" width="100">
            </span>
             <i class="ti ti-x fs-3 close-vertical-btn" id="close-vertical-btn" title="Close"></i>
            </a>
            <a href="javascript:void(0);" class="layout-menu-toggle hide layout-menu-toggle-popup menu-link text-large ms-auto d-block">
            <i class="bx bx-chevron-right bx-sm align-middle"></i>
            </a>
         </div>
         <div class="menu-inner-shadow"></div>
         <ul class="menu-inner py-1">
            <!-- Dashboard -->
             <li class="menu-item">
               <a href="dashboard" class="menu-link">
                   <!-- <i class="menu-icon tf-icons bx bx-home-circle"></i> -->
                  <i class=" menu-icon ti ti-home"></i>
                  <div data-i18n="Analytics">Dashboard</div>
               </a>
            </li>
            <!-- Layouts -->
            <li class="menu-item <%if $smarty.server.REQUEST_URI|strstr:'product_list' || $smarty.server.REQUEST_URI|strstr:'categories' || $smarty.server.REQUEST_URI|strstr:'brands' || $smarty.server.REQUEST_URI|strstr:'attributes' || $smarty.server.REQUEST_URI|strstr:'reviews'%>active open<%/if%>">
               <a href="javascript:void(0);" class="menu-link menu-toggle">
               <i class=" menu-icon ti ti-shopping-cart"></i>
                  <div data-i18n="Layouts">Product</div>
               </a>
               <ul class="menu-sub">
                  <li class="menu-item">
                     <a href="product_list" class="menu-link">
                     <i class=" menu-icon ti ti-brand-producthunt"></i><div data-i18n="Without menu">Manage Products</div>
                     </a>
                  </li>
                  <li class="menu-item">
                     <a href="categories" class="menu-link">
                     <i class="menu-icon ti ti-category"></i>
                        <div data-i18n="Without navbar">Categories</div>
                     </a>
                  </li>
                  <li class="menu-item">
                     <a href="brands" class="menu-link">
                     <i class="menu-icon ti ti-certificate"></i>
                        <div data-i18n="Without navbar">Brands</div>
                     </a>
                  </li>
                  <li class="menu-item">
                     <a href="attributes" class="menu-link">
                     <i class="menu-icon ti ti-a-b-2"></i>
                        <div data-i18n="Without navbar">Attributes</div>
                     </a>
                  </li>
                  <li class="menu-item">
                     <a href="reviews" class="menu-link">
                     <i class="menu-icon ti ti-star"></i>
                        <div data-i18n="Without navbar">Reviews & Ratings</div>
                     </a>
                  </li>
                 
               </ul>
            </li> 
            
            
            <li class="menu-item <%if $smarty.server.REQUEST_URI|strstr:'/orders'%>active open<%/if%>">
             <a href="javascript:void(0);" class="menu-link menu-toggle">
            
                <i class="menu-icon ti ti-truck-delivery"></i>
                <div data-i18n="Layouts">Orders</div>
             </a>
            <ul class="menu-sub">
               <li class="menu-item">
                  <a href="orders" class="menu-link">
                  <i class="menu-icon ti ti-truck"></i></i> <div data-i18n="Without menu">Orders</div>
                  </a>
               </li>
               
            </ul>
         </li> 
          

         <li class="menu-item <%if $smarty.server.REQUEST_URI|strstr:'customer_list' || $smarty.server.REQUEST_URI|strstr:'customer_reviews' || $smarty.server.REQUEST_URI|strstr:'wishlist_list'%>active open<%/if%>">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
               
               <i class="menu-icon ti ti-users"></i>
               <div data-i18n="Layouts">Customers</div>
            </a>
            <ul class="menu-sub">
               <li class="menu-item">
                  <a href="customer_list" class="menu-link">
                  <i class="menu-icon ti ti-users-group"></i></i> <div data-i18n="Without menu">Customers List</div>
                  </a>
               </li>
               <li class="menu-item">
                  <a href="customer_reviews" class="menu-link">
                    <i class="menu-icon ti ti-shopping-cart-star"></i> <div data-i18n="Without menu">Customer Reviews</div>
                  </a>
               </li>
               <li class="menu-item">
                  <a href="wishlist_list" class="menu-link">
                    <i class="menu-icon ti ti-heart"></i> <div data-i18n="Without menu">Wishlist</div>
                  </a>
               </li>
               
            </ul>
         </li> 

         <li class="menu-item <%if $smarty.server.REQUEST_URI|strstr:'coupons' || $smarty.server.REQUEST_URI|strstr:'email_marketing'%>active open<%/if%>">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
               <i class="menu-icon ti ti-ad-circle"></i>
               <div data-i18n="Layouts">Marketing & Promotions</div>
            </a>
            <ul class="menu-sub">
               <li class="menu-item">
                  <a href="coupons" class="menu-link">
                    <i class="menu-icon ti ti-discount"></i> <div data-i18n="Without menu">Coupons & Discounts</div>
                  </a>
               </li>
               <li class="menu-item">
                  <a href="email_marketing" class="menu-link">
                    <i class="menu-icon ti ti-mail"></i> <div data-i18n="Without menu">Email Marketing</div>
                  </a>
               </li>
               
            </ul>
         </li> 

         <li class="menu-item <%if $smarty.server.REQUEST_URI|strstr:'transactions' || $smarty.server.REQUEST_URI|strstr:'refunds'%>active open<%/if%>">
         <a href="javascript:void(0);" class="menu-link menu-toggle">
            <i class="menu-icon ti ti-receipt-rupee"></i>
            <div data-i18n="Layouts">Payments</div>
         </a>
         <ul class="menu-sub">
            <li class="menu-item">
               <a href="transactions" class="menu-link">
                 <i class="menu-icon ti ti-coin-rupee"></i> <div data-i18n="Without menu">Transactions</div>
               </a>
            </li>
            <li class="menu-item">
               <a href="refunds" class="menu-link">
                 <i class="menu-icon ti ti-credit-card-refund"></i> <div data-i18n="Without menu">Refunds</div>
               </a>
            </li>
            
         </ul>
      </li> 

      <li class="menu-item <%if $smarty.server.REQUEST_URI|strstr:'shipping_methods' || $smarty.server.REQUEST_URI|strstr:'delivery_partners' || $smarty.server.REQUEST_URI|strstr:'order_tracking'%>active open<%/if%>">
      <a href="javascript:void(0);" class="menu-link menu-toggle">
         <i class="menu-icon ti ti-building-store"></i>
         <div data-i18n="Layouts">Shipping & Delivery</div>
      </a>
      <ul class="menu-sub">
         <li class="menu-item">
            <a href="shipping_methods" class="menu-link">
            <i class=" menu-icon ti ti-paper-bag"></i> <div data-i18n="Without menu">Shipping Methods</div>
            </a>
         </li>
         <li class="menu-item">
            <a href="delivery_partners" class="menu-link">
              <i class="menu-icon ti ti-truck-delivery"></i> <div data-i18n="Without menu">Delivery Partners
              </div>
            </a>
         </li>
        
         <li class="menu-item">
            <a href="order_tracking" class="menu-link">
              <i class="menu-icon ti ti-trending-up"></i> <div data-i18n="Without menu">Tracking Orders</div>
            </a>
         </li>
         
      </ul>
   </li> 

   <li class="menu-item <%if $smarty.server.REQUEST_URI|strstr:'banner' || $smarty.server.REQUEST_URI|strstr:'gallery' || $smarty.server.REQUEST_URI|strstr:'blog' || $smarty.server.REQUEST_URI|strstr:'faq' || $smarty.server.REQUEST_URI|strstr:'testimonials' || $smarty.server.REQUEST_URI|strstr:'contact_us'%>active open<%/if%>">
      <a href="javascript:void(0);" class="menu-link menu-toggle">
         <i class="menu-icon ti ti-message-plus"></i>
         <div data-i18n="Layouts">Content Management</div>
      </a>
      <ul class="menu-sub">
         <li class="menu-item">
            <a href="banner" class="menu-link">
              <i class="menu-icon ti ti-slideshow"></i> <div data-i18n="Without menu">Banners & Sliders</div>
            </a>
         </li>
         <li class="menu-item">
            <a href="gallery" class="menu-link">
              <i class="menu-icon ti ti-photo"></i> <div data-i18n="Without menu">Gallery Master</div>
            </a>
         </li>
         <li class="menu-item">
            <a href="blog" class="menu-link">
              <i class="menu-icon ti ti-blockquote"></i> <div data-i18n="Without menu">Blog Management
              </div>
            </a>
         </li>
        
         <li class="menu-item">
            <a href="faq" class="menu-link">
              <i class="menu-icon ti ti-help-octagon"></i> <div data-i18n="Without menu">FAQ Management</div>
            </a>
         </li>

         
         <li class="menu-item">
            <a href="testimonials" class="menu-link">
              <i class="menu-icon ti ti-message-question"></i> <div data-i18n="Without menu">Testimonials</div>
            </a>
         </li>

         <li class="menu-item">
            <a href="contact_us" class="menu-link">
              <i class="menu-icon ti ti-address-book"></i> <div data-i18n="Without menu">Contact Us</div>
            </a>
         </li>
         
      </ul>
   </li> 

   
   <li class="menu-item <%if $smarty.server.REQUEST_URI|strstr:'sales_report' || $smarty.server.REQUEST_URI|strstr:'product_performance_report' || $smarty.server.REQUEST_URI|strstr:'low_stock_report' || $smarty.server.REQUEST_URI|strstr:'traffic_analytics'%>active open<%/if%>">
      <a href="javascript:void(0);" class="menu-link menu-toggle">
         <i class="menu-icon ti ti-report"></i>
         <div data-i18n="Layouts">Reports & Analytics</div>
      </a>
      <ul class="menu-sub">
         <li class="menu-item">
            <a href="sales_report" class="menu-link">
              <i class="menu-icon ti ti-report-money"></i> <div data-i18n="Without menu">Sales Reports</div>
            </a>
         </li>
         <li class="menu-item">
            <a href="product_performance_report" class="menu-link">
              <i class="menu-icon ti ti-brand-speedtest"></i> <div data-i18n="Without menu">Product Performance
              </div>
            </a>
         </li>
            <li class="menu-item">
               <a href="low_stock_report" class="menu-link">
                 <i class="menu-icon ti ti-alert-triangle"></i> <div data-i18n="Without menu">Low Stock Report</div>
               </a>
            </li>
            <li class="menu-item">
               <a href="traffic_analytics" class="menu-link">
                 <i class="menu-icon ti ti-chart-line"></i> <div data-i18n="Without menu">Traffic Analytics</div>
               </a>
            </li>
        
         <li class="menu-item">
            <a href="customer_list" class="menu-link">
              <i class="menu-icon ti ti-user-square"></i> <div data-i18n="Without menu">Customer Reports</div>
            </a>
         </li>
         
      </ul>
   </li> 
            
            <li class="menu-item <%if $smarty.server.REQUEST_URI|strstr:'user_list' || $smarty.server.REQUEST_URI|strstr:'role_management'%>active open<%/if%>">
               <a href="javascript:void(0);" class="menu-link menu-toggle">
               
               <i class="menu-icon ti ti-users-plus"></i>
                  <div data-i18n="Authentications">User Management</div>
               </a>
               <ul class="menu-sub">
                  <li class="menu-item">
                     <a href="<%$base_url%>user_list" class="menu-link" >
                        <i class="menu-icon tf-icons bx bx-user-circle"></i><div data-i18n="Basic">User</div>
                     </a>
                  </li>
                  <li class="menu-item">
                     <a href="<%$base_url%>role_management" class="menu-link" >
                        <i class="menu-icon ti ti-shield-lock"></i><div data-i18n="Basic">Role Management</div>
                     </a>
                  </li>
               </ul>
            </li>
            
            <li class="menu-item <%if $smarty.server.REQUEST_URI|strstr:'general_settings'%>active open<%/if%>">
      <a href="javascript:void(0);" class="menu-link menu-toggle">
         <i class="menu-icon ti ti-settings"></i>
         <div data-i18n="Layouts">Settings</div>
      </a>
      <ul class="menu-sub">
         <li class="menu-item">
            <a href="general_settings" class="menu-link">
              <i class="menu-icon ti ti-settings-plus"></i> <div data-i18n="Without menu">General Settings</div>
            </a>
         </li>
        
         
      </ul>
   </li> 
            
           
         </ul>
      </aside>
      <div class="main-wrap main-wrap--white main-loader-box" style="display: none;">
         <div class="loader-div"></div>
      </div>
      <!-- / Menu -->
      <!-- Layout container -->
      <div class="layout-page">
      <!-- Navbar -->
      <!-- / Navbar -->

      <nav class="navbar navbar-expand-lg bg-navbar-theme navbar-classic">
         <div class="container-fluid">
            <a href="sitemap" class="app-brand-link navbar-brand">
            <span class="app-brand-logo demo">
            <img src="<%base_url()%><%$config['admin_company_logo']%>" alt="" width="100" title="<%$config['admin_company_name']%>">
            </span>
            <!-- <span class="stat-cards-info__num fw-bolder ms-2 pt-1">AROM</span> -->
            </a>

            <!-- for horizontal menu bar  -->

            <%if $config['admin_menu_type'] eq 'horizontal'%>
            <p class="horizontal-line-header" style="
    border-left: 1px solid gray;
    padding: 0px;
    margin: 0px;
    height: 38px;
    padding-right: 4px;
">&nbsp;</p>
            <button class="navbar-toggler collapsed " id="toggle-horizontal-menu-bar" type="button" style="display:block; " title="Menu">
            <span class="ti ti-menu-2 h3"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
               <ul class="navbar-nav">
               </ul>
            </div>
            <%/if%>
           

            <!-- vertical menu bar -->
            <%if $config['admin_menu_type'] eq 'vertical'%>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span> <label>Menu</label>
            </button>
            <%/if%>
            <%if !(strpos($smarty.server.PATH_INFO, "/sitemap") !== false) %>
            <i class="ti ti-category quick-menu-bar login-nav-block-mobile" title="Quick Menu"></i>
            <%/if%>

            <div class="navbar-right-wrap ms-2 d-flex nav-top-wrap navbar-nav login-nav-block login-nav-block-mobile">
               <div class="header_userprofile_blk">
               <img src="https://mrs-production-local.s3.amazonaws.com/profile_images/75d59ba05a7ed79dfd388421b060929bbd00de4b.png" onerror="imageLoadingError(this,'top-profile-image', 'S')" >
               </div>
               <span class="profile-name" >
                <%$session_data['user_name']%>
               <em title="Admin []" ><%$session_data['role']%></em>
               </span>
               <ul class="navbar-right-wrap ms-auto d-flex nav-top-wrap navbar-nav">
                  <li class="ms-2 dropdown">
                     <a class="dropdownUser inactive" id="dropdownUser" aria-expanded="false">
                        <i class="las la-angle-down"></i>
                     </a>
                     <div data-bs-popper="static" class="dropdown-menu dropdown-menu-end  dropdown-menu dropdown-menu-end dropdownUserNav" aria-labelledby="dropdownUser" id="dropdownUserNav">
                        <div data-rr-ui-dropdown-item="" class=" ">
                           <ul class="top-menu ps-0">
                              <li class="top-child-menu">
                                    <a hijacked="yes" href="<%base_url('change_password')%>" title="" class="top-menu-link">
                                        <span class="las la-user"></span>Reset Password
                                    </a>
                              </li>
                              <li class="top-child-menu">
                                    <a hijacked="yes" href="<%base_url('secure_admin/logout')%>" title="" class="top-menu-link">
                                        <span class="las la-sign-in-alt"></span>Sign Out
                                    </a>
                              </li>

                           </ul>
                           <!-- <div class="lh-1 ">
                              <h5 class="mb-1">  <%$session_data['user_name']%></h5>
                              <a class="text-inherit fs-6" href="javascript:void(0)"><%$session_data['user_email']%></a>
                              <h6 class="mt-2">(<%$session_data['clientUnitName']%>)</h6>
                           </div>
                           <div class=" dropdown-divider mt-3 mb-2"></div> -->
                        </div>
                        <!-- <a data-rr-ui-dropdown-item="" class="dropdown-item" role="button" tabindex="0" href="<%base_url('logout')%>"><i class="ti ti-power me-2" ti></i>Sign Out</a> -->
                     </div>
                  </li>
               </ul>
            </div>
            <%if $config['admin_menu_type'] eq 'vertical'%>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
               <ul class="navbar-nav">
                  <!-- <li class="nav-item">
                     <a class="nav-link active" aria-current="page" href="http://localhost/extra_work/erp_converted/dashboard">Dashboard</a>
                  </li> -->
                  <!-- <li class="nav-item">
                     <a class="nav-link" href="http://localhost/extra_work/erp_converted/home_2">Charts</a>
                     </li> -->
                  <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" href="javascript:void(0)" id="navbarDropdownMenuLinkPurchase" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                     User Management
                     </a>
                     <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLinkPurchaseSubmenu">
                        <li>
                           <a href="<%$base_url%>user_list" class="dropdown-item">User</a>
                        </li>
                        <li>
                           <a href="<%$base_url%>role_management" class="dropdown-item">Role Management</a>
                        </li>
                      </ul>
                  </li>
                  <!-- <li class="nav-item">
                     <a href="http://localhost/extra_work/erp_converted/logout" class="nav-link">Logout</a>
                     </li> -->
               </ul>
            </div>
            <%/if%>
            <div class="navbar-right-wrap ms-2 d-flex nav-top-wrap navbar-nav login-nav-block web-login-nav-block">
               <div class="header_userprofile_blk">
               <img src="https://mrs-production-local.s3.amazonaws.com/profile_images/75d59ba05a7ed79dfd388421b060929bbd00de4b.png" onerror="imageLoadingError(this,'top-profile-image', 'S')" >
               </div>
               <span class="profile-name" >
                <%$session_data['user_name']%>
               <em title="Admin []" ><%$session_data['role']%></em>
               </span>
               <ul class="navbar-right-wrap ms-auto d-flex nav-top-wrap navbar-nav">
                  <li class="ms-2 dropdown">
                     <a class="dropdownUser inactive" id="dropdownUser" aria-expanded="false">
                        <i class="las la-angle-down"></i>
                     </a>
                     <div data-bs-popper="static" class="dropdown-menu dropdown-menu-end  dropdown-menu dropdown-menu-end dropdownUserNav" aria-labelledby="dropdownUser" id="dropdownUserNav">
                        <div data-rr-ui-dropdown-item="" class=" ">
                           <ul class="top-menu ps-0">
                              <li class="top-child-menu">
                                    <a hijacked="yes" href="<%base_url('change_password')%>" title="" class="top-menu-link">
                                        <span class="las la-user"></span>Reset Password
                                    </a>
                              </li>
                              <li class="top-child-menu">
                                    <a hijacked="yes" href="<%base_url('secure_admin/logout')%>" title="" class="top-menu-link">
                                        <span class="las la-sign-in-alt"></span>Sign Out
                                    </a>
                              </li>

                           </ul>
                           <!-- <div class="lh-1 ">
                              <h5 class="mb-1">  <%$session_data['user_name']%></h5>
                              <a class="text-inherit fs-6" href="javascript:void(0)"><%$session_data['user_email']%></a>
                              <h6 class="mt-2">(<%$session_data['clientUnitName']%>)</h6>
                           </div>
                           <div class=" dropdown-divider mt-3 mb-2"></div> -->
                        </div>
                        <!-- <a data-rr-ui-dropdown-item="" class="dropdown-item" role="button" tabindex="0" href="<%base_url('logout')%>"><i class="ti ti-power me-2" ti></i>Sign Out</a> -->
                     </div>
                  </li>
               </ul>
            </div>
            <%if !(strpos($smarty.server.PATH_INFO, "/sitemap") !== false) %>
            <div class="menu_show ms-3">
               <i class="ti ti-category quick-menu-bar login-nav-block ms-2" title="Quick Menu"></i>
            </div>
            <%/if%>
         </div>
      </nav>
      <!-- Content wrapper -->
      <div class="content-wrapper">
      <!-- Content -->