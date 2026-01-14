<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
      <title>Reset Password | <%$config['company_name']%></title>
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
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

      <style>
        body {
            background-color: #ffffff;
            overflow-x: hidden;
            font-family: 'Public Sans', sans-serif;
            padding-top: 0 !important; /* Explicitly remove top padding */
        }
        .login-split-screen {
            min-height: 100vh;
        }
        .login-brand-col {
            background: linear-gradient(135deg, #ff3e1d 0%, #ff6b4a 100%);
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            overflow: hidden;
        }
        .wave-divider {
            position: absolute;
            top: 0;
            left: -1px;
            bottom: 0;
            width: 120px;
            z-index: 2;
            pointer-events: none;
        }
        .wave-divider svg {
            width: 100%;
            height: 100%;
            display: block;
            fill: #ffffff;
        }
        
        .login-form-col {
            background: #ffffff;
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
        }
        .input-group-pill {
            border-radius: 50px;
            background: #f8f9fa;
            border: 1px solid #e9ecef;
            transition: all 0.3s ease;
        }
        .input-group-pill:focus-within {
            box-shadow: 0 5px 20px rgba(255, 62, 29, 0.15);
            border-color: #ff3e1d;
            background: #ffffff;
        }
        .input-group-pill .form-control {
            border: none;
            box-shadow: none;
            background: transparent;
            font-size: 0.95rem;
            padding: 12px 15px;
            font-weight: 500;
        }
        .input-group-pill .input-group-text {
            background: transparent;
            border: none;
            color: #ff3e1d;
        }
        .btn-pill {
            border-radius: 50px;
            padding: 12px 2rem;
            letter-spacing: 0.5px;
            background: linear-gradient(90deg, #ff3e1d, #ff6b4a);
            border: none;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
        }
        .btn-pill:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(255, 62, 29, 0.4);
            background: linear-gradient(90deg, #ff2000, #ff5530);
        }
        .floating-anim {
            animation: float 6s ease-in-out infinite;
        }
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-15px); }
            100% { transform: translateY(0px); }
        }
        .error-msg {
            color: #ea5455;
            font-size: 0.85rem;
            margin-top: 5px;
            margin-left: 15px;
            font-weight: 500;
        }
        .hover-scale {
            transition: transform 0.2s;
            display: inline-block;
        }
        .hover-scale:hover {
            transform: scale(1.05);
            color: #ff3e1d !important;
        }
      </style>
   </head>
   <body>
      <div class="outer-div-box"></div>
      
      <div class="container-fluid p-0">
          <div class="row g-0 login-split-screen">
              
              <!-- Left Form Column -->
              <div class="col-lg-6 login-form-col">
                  <div class="login-card animate__animated animate__fadeInLeft">
                      
                      <div class="text-center mb-5">
                          <h2 class="fw-bold mb-2 text-dark" style="color: #ff3e1d !important;">Recovery</h2>
                          <p class="text-muted fs-5">Reset your password</p>
                      </div>

                      <%if $expired_link eq 'No' %>
                        <form id="formRestePassword" action="javascript:void(0)" method="POST" autocomplete="off">
                            <input type="hidden" name="user_id" value="<%$user_id%>">
                            
                            <div class="mb-4">
                                <div class="input-group input-group-pill">
                                    <span class="input-group-text ps-4"><i class="ti ti-lock fs-4"></i></span>
                                    <input type="password" name="password" id="password" class="form-control" placeholder="New Password">
                                    <span class="input-group-text pe-4 cursor-pointer text-muted" id="pwd_show_hide_btn"><i class="ti ti-eye"></i></span>
                                </div>
                                <div class="error-msg" id="passwordErr"></div>
                            </div>

                            <div class="mb-4">
                                <div class="input-group input-group-pill">
                                    <span class="input-group-text ps-4"><i class="ti ti-lock fs-4"></i></span>
                                    <input type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="Confirm Password">
                                </div>
                                <div class="error-msg" id="confirm_passwordErr"></div>
                            </div>

                            <button type="submit" id="loginBtn" class="btn btn-primary btn-login btn-pill w-100 shadow text-white fw-bold">
                                RESET PASSWORD
                            </button>
                        </form>
                      <%else%>
                         <div class="alert alert-warning text-center rounded-3 shadow-sm border-0">
                            <i class="ti ti-alert-circle display-4 mb-2 d-block text-warning"></i>
                            <h4 class="alert-heading fw-bold">Link Expired</h4>
                            <p class="mb-0">This reset link is no longer valid.</p>
                         </div>
                         <div class="text-center mt-4">
                            <a href="<%$base_url%>login" class="btn btn-pill btn-outline-primary fw-bold px-4">Request New Link</a>
                         </div>
                      <%/if%>

                      <div class="mt-4 text-center">
                          <a href="<%$base_url%>login" class="text-muted text-decoration-none small fw-bold hover-scale"><i class="ti ti-arrow-left me-1"></i> Back to Login</a>
                      </div>

                      <div class="mt-5 text-center text-muted small opacity-50">
                          &copy; <%$smarty.now|date_format:"%Y"%> <%$config['company_name']%>
                      </div>

                  </div>
              </div>

              <!-- Right Brand Column -->
              <div class="col-lg-6 d-none d-lg-flex login-brand-col">
                  <!-- Improved Wave SVG -->
                  <div class="wave-divider">
                     <svg viewBox="0 0 100 100" preserveAspectRatio="none">
                         <!-- Smooth curve -->
                         <path d="M0,0 C30,20 60,80 0,100 Z" fill="#ffffff"/> 
                     </svg>
                  </div>
                  
                  <div class="brand-content position-relative z-1 text-center animate__animated animate__fadeInRight">
                      <img src="<%$base_url%>public/assets/images/forgot_password.png" alt="Secure" class="img-fluid mb-4 floating-anim" style="max-height: 350px; filter: drop-shadow(0 20px 40px rgba(0,0,0,0.2));">
                      <h2 class="display-5 fw-bold text-white mb-2">Secure Access</h2>
                      <p class="text-white opacity-90 fs-5 px-5">Restoring your access securely and quickly.</p>
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
      <script src="public/js/toaster/custom_toaster.js"></script>
      <script src="<%$base_url%>public/js/forgot_password.js"></script>
      
      <script>
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