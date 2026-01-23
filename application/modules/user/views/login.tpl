<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
      <title>Login | <%$config['admin_company_name']%></title>
      <meta name="description" content="" />
      <link rel="icon" type="image/x-icon" href="<%base_url()%><%$config['company_fav_icon']%>" />
      <link rel="preconnect" href="https://fonts.googleapis.com" />
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
      <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />
      <link rel="stylesheet" href="<%$base_url%>public/assets/vendor/fonts/boxicons.css" />
      <link rel="stylesheet" href="<%$base_url%>public/assets/vendor/css/core.css" class="template-customizer-core-css" />
      <link rel="stylesheet" href="<%$base_url%>public/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
      <link rel="stylesheet" href="<%$base_url%>public/assets/css/demo.css" />
      <link rel="stylesheet" href="<%$base_url%>public/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
      <link rel="stylesheet" href="<%$base_url%>public/assets/vendor/css/pages/page-auth.css" />
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
      <link rel="stylesheet" href="<%$base_url%>public/assets/css/admin-theme.css"> 
      <link rel="stylesheet" href="<%$base_url%>public/css/toaster/custom_toaster.css" />
      <!-- Animation Library -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

      <style>
        body {
            background-color: #f8f9fa;
            overflow-x: hidden;
            font-family: 'Public Sans', sans-serif;
            padding-top: 0 !important; /* Explicitly remove top padding */
        }
        .login-split-screen {
            min-height: 100vh;
        }
        .login-brand-col {
            background: linear-gradient(135deg, #7367f0 0%, #a49cf4 100%);
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            overflow: hidden;
        }
        /* Consolidated Curve Divider Styles */
        .wave-divider {
            position: absolute;
            top: 0;
            left: -1px;
            bottom: 0;
            width: 200px; /* Wide enough for a smooth curve */
            z-index: 5;
            pointer-events: none;
        }
        .wave-divider svg {
            width: 100%;
            height: 100%;
            display: block;
        }
        .wave-divider svg path {
             fill: #f8f9fa; /* Seamless blend with form background */
        }
        
        .login-form-col {
            background: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            z-index: 10;
        }
        .login-card {
            width: 100%;
            max-width: 440px;
            padding: 3rem;
            position: relative;
            z-index: 20;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08); /* Modern soft shadow */
        }
        
        /* Premium Pill Inputs */
        .input-group-pill {
            border-radius: 8px;
            background: #ffffff;
            border: 1px solid #d9dee3;
            transition: all 0.3s ease;
        }
        .input-group-pill:focus-within {
            box-shadow: 0 0.25rem 1rem rgba(115, 103, 240, 0.1);
            border-color: #7367f0;
            background: #ffffff;
        }
        .input-group-pill .form-control {
            border: none;
            box-shadow: none;
            background: transparent;
            font-size: 1rem;
            padding: 10px 15px;
            font-weight: 400;
            color: #566a7f;
        }
        .input-group-pill .input-group-text {
            background: transparent;
            border: none;
            color: #7367f0;
        }

        /* Gradient Button */
        .btn-pill {
            border-radius: 8px;
            padding: 10px 2rem;
            letter-spacing: 0.5px;
            background: #7367f0 !important;
            border: none;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
            box-shadow: 0 0.125rem 0.25rem rgba(115, 103, 240, 0.4);
            color: #fff !important;
        }
        .btn-pill:hover {
            transform: translateY(-1px);
            box-shadow: 0 0.5rem 1rem rgba(115, 103, 240, 0.4);
            background: #685dd8 !important;
            color: #fff !important;
        }

        .sc-image-wrapper {
            width: 350px;
            height: 350px;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto;
            border: 2px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            position: relative;
            overflow: hidden;
        }
        .sc-image-wrapper img {
            max-width: 90%;
            max-height: 90%;
            border-radius: 50%;
            background-color: white; 
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }
        
        .login-brand-col {
            background: linear-gradient(135deg, #7367f0 0%, #696cff 100%);
        }

        .floating-anim {
            animation: float 6s ease-in-out infinite;
        }
        @keyframes float {
            0% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-10px) rotate(1deg); }
            100% { transform: translateY(0px) rotate(0deg); }
        }

        .error-msg {
            color: #ff3e1d;
            font-size: 0.85rem;
            margin-top: 5px;
            margin-left: 5px;
            font-weight: 500;
        }
        
        .hover-scale {
            transition: transform 0.2s;
            display: inline-block;
        }
        .hover-scale:hover {
            transform: scale(1.02);
            color: #7367f0 !important;
        }
        
        /* Loader Styles */
        .main-loader-box {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(5px);
            z-index: 9999;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .loader-div {
            border: 4px solid #f3f3f3;
            border-top: 4px solid #7367f0;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            animation: spin 1s linear infinite;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
      </style>
   </head>
   <body>
      <div class="main-wrap main-wrap--white main-loader-box" style="display: none;">
          <div class="loader-div"></div>
      </div>
      
      <div class="outer-div-box"></div>
      
      <div class="container-fluid p-0">
          <div class="row g-0 login-split-screen">
              
              <!-- Left Form Column -->
              <div class="col-lg-5 login-form-col">
                  <div class="login-card animate__animated animate__fadeInLeft">
                      
                      <div class="text-center mb-5">
                          <h2 class="fw-bold mb-2 text-dark" style="color: #7367f0 !important;">Hello!</h2>
                          <p class="text-muted fs-5">Sign in to your account</p>
                      </div>

                      <!-- Login Form -->
                      <div id="login_div">
                        <form id="formAuthentication" action="javascript:void(0)" method="POST" autocomplete="off">
                            <div class="mb-4">
                                <div class="input-group input-group-pill">
                                    <span class="input-group-text ps-4"><i class="ti ti-mail fs-4"></i></span>
                                    <input type="text" name="email" id="login_name" class="form-control" placeholder="Email Address">
                                </div>
                                <div class="error-msg" id="login_nameErr"></div>
                            </div>

                            <div class="mb-4">
                                <div class="input-group input-group-pill">
                                    <span class="input-group-text ps-4"><i class="ti ti-lock fs-4"></i></span>
                                    <input type="password" name="password" id="password" class="form-control" placeholder="Password">
                                    <span class="input-group-text pe-4 cursor-pointer text-muted" id="pwd_show_hide_btn"><i class="ti ti-eye"></i></span>
                                </div>
                                <div class="error-msg" id="passwordErr"></div>
                            </div>

                            <div class="mb-4 d-flex justify-content-between align-items-center px-2">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="remember_me" name="remember_me" value="Yes" style="border-color: #7367f0;">
                                    <label class="form-check-label text-muted small" for="remember_me">
                                        Remember me
                                    </label>
                                </div>
                                <a href="javascript:void(0)" onclick="toggleForms('forgot')" class="small text-primary text-decoration-none fw-bold" style="color: #7367f0 !important;">Forgot Password?</a>
                            </div>

                            <button type="submit" id="loginBtn" class="btn btn-primary btn-login btn-pill w-100 shadow text-white fw-bold">
                                SIGN IN
                            </button>
                        </form>
                      </div>

                      <!-- Forgot Password Form (Hidden initially) -->
                      <div id="forgot_div" style="display: none;">
                          <div class="mb-4 text-center">
                              <h3 class="fw-bold mb-2" style="color: #7367f0;">Reset Password</h3>
                              <p class="text-muted small mb-4">Enter your username/email to receive reset instructions.</p>
                          </div>

                          <form id="formRestePassword" action="javascript:void(0)" method="POST">
                              <div class="mb-4">
                                  <div class="input-group input-group-pill">
                                      <span class="input-group-text ps-4"><i class="ti ti-mail fs-4"></i></span>
                                      <input type="text" name="username" id="username" class="form-control" placeholder="Enter your username">
                                  </div>
                                  <div class="error-msg" id="usernameErr"></div>
                              </div>
                              
                              <button type="submit" class="btn btn-primary btn-login btn-pill w-100 shadow text-white fw-bold mb-3">
                                  SEND RESET LINK
                              </button>
                              
                              <div class="text-center">
                                  <a href="javascript:void(0)" onclick="toggleForms('login')" class="text-muted text-decoration-none small fw-bold hover-scale"><i class="ti ti-arrow-left me-1"></i> Back to Login</a>
                              </div>
                          </form>
                      </div>

                      <div class="mt-5 text-center text-muted small opacity-50">
                          &copy; 2026 Copyright Code crafter infotech
                      </div>

                  </div>
              </div>

              <!-- Right Brand Column -->
              <div class="col-lg-7 d-none d-lg-flex login-brand-col">
                  <!-- Circular Curve Divider -->
                  <div class="wave-divider">
                     <svg viewBox="0 0 100 100" preserveAspectRatio="none">
                         <!-- Concave white shape creates a convex purple bulge from the right -->
                         <path d="M100,0 C20,0 20,100 100,100 L0,100 L0,0 Z" fill="#f8f9fa"/>
                     </svg>
                  </div>
                  
                  <div class="brand-content position-relative z-1 text-center animate__animated animate__fadeInRight">
                      <!-- Circular Image Container -->
                      <div class="sc-image-wrapper mb-4 floating-anim">
                        <img src="<%$base_url%>public/assets/images/login_ecom_illustration.png" alt="Craftology" class="img-fluid">
                      </div>
                      <h2 class="display-5 fw-bold text-white mb-2">Welcome Back!</h2>
                      <p class="text-white opacity-90 fs-5 px-5">Manage your artfully crafted inventory with elegance.</p>
                  </div>
              </div>

          </div>
      </div>

      <!-- Scripts -->
      <script src="<%$base_url%>public/js/admin/plugin/jquery.min.js"></script>
      <script src="<%$base_url%>public/assets/vendor/libs/popper/popper.js"></script>
      <script src="<%$base_url%>public/assets/vendor/js/bootstrap.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.20.0/jquery.validate.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
      <script type="text/javascript">
         var base_url = <%$base_url|@json_encode%>;
      </script>
      <script src="<%$base_url%>public/js/toaster/custom_toaster.js"></script>
      <!-- Included login.js for validation logic -->
      <script src="<%$base_url%>public/js/login.js"></script>
      
      <script>
        // Direct handling of form toggles to ensure functionality
        function toggleForms(target) {
            $(".error-msg").html(""); // Clear errors
            if (target === 'forgot') {
                $("#login_div").hide(); 
                $("#forgot_div").fadeIn(300);
            } else {
                $("#forgot_div").hide();
                $("#login_div").fadeIn(300);
            }
        }

        // Independent Password Toggle
        $(document).on('click', '#pwd_show_hide_btn', function() {
            var input = $('#password');
            var icon = $(this).find('i');
            if (input.attr('type') === 'password') {
                input.attr('type', 'text');
                icon.removeClass('ti-eye').addClass('ti-eye-off');
            } else {
                input.attr('type', 'password');
                icon.removeClass('ti-eye-off').addClass('ti-eye');
            }
        });
      </script>
   </body>
</html>