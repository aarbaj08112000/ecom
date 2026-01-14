$(document).ready(function () {
    // Registration Form Validation
    if ($("#registerForm").length > 0) {
        $("#registerForm").validate({
            rules: {
                customer_name: {
                    required: true,
                    minlength: 3
                },
                email: {
                    required: true,
                    email: true
                },
                password: {
                    required: true,
                    minlength: 6
                }
            },
            messages: {
                customer_name: {
                    required: "Please enter your full name",
                    minlength: "Name must be at least 3 characters"
                },
                email: {
                    required: "Please enter your email",
                    email: "Please enter a valid email address"
                },
                password: {
                    required: "Please provide a password",
                    minlength: "Password must be at least 6 characters"
                }
            },
            errorElement: 'div',
            errorPlacement: function (error, element) {
                var error_id = $(element).attr('id') + 'Err';
                if ($('#' + error_id).length > 0) {
                    error.appendTo('#' + error_id);
                } else {
                    error.insertAfter(element);
                }
            },
            submitHandler: function (form) {
                console.log("Form submitted via AJAX");
                var formData = new FormData(form);
                var submitBtn = $("#registerBtn");

                var ajaxUrl = base_url;
                if (!ajaxUrl.endsWith('/')) ajaxUrl += '/';
                ajaxUrl += "shop/register-action";

                console.log("AJAX URL:", ajaxUrl);

                $.ajax({
                    url: ajaxUrl,
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    dataType: "json",
                    beforeSend: function () {
                        submitBtn.prop('disabled', true).html('<span class="spinner-border spinner-border-sm me-2"></span>Creating Account...');
                    },
                    success: function (response) {
                        if (response.success == 1) {
                            toaster("success", response.messages);
                            setTimeout(function () {
                                window.location.href = base_url + "shop/login";
                            }, 1500);
                        } else {
                            toaster("error", response.messages);
                            submitBtn.prop('disabled', false).html('Create Account');
                        }
                    },
                    error: function () {
                        toaster("error", "Something went wrong. Please try again.");
                        submitBtn.prop('disabled', false).html('Create Account');
                    }
                });
            }
        });
    }

    // Login Form Validation
    if ($("#loginForm").length > 0) {
        $("#loginForm").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
                password: {
                    required: true
                }
            },
            messages: {
                email: {
                    required: "Please enter your email",
                    email: "Please enter a valid email address"
                },
                password: {
                    required: "Please enter your password"
                }
            },
            errorElement: 'div',
            errorPlacement: function (error, element) {
                var error_id = $(element).attr('id') + 'Err';
                if ($('#' + error_id).length > 0) {
                    error.appendTo('#' + error_id);
                } else {
                    error.insertAfter(element);
                }
            },
            submitHandler: function (form) {
                console.log("Login form submitted via AJAX");
                var formData = new FormData(form);
                var submitBtn = $("#loginBtn");

                var ajaxUrl = base_url;
                if (!ajaxUrl.endsWith('/')) ajaxUrl += '/';
                ajaxUrl += "shop/login-action";

                console.log("Login AJAX URL:", ajaxUrl);

                $.ajax({
                    url: ajaxUrl,
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    dataType: "json",
                    beforeSend: function () {
                        submitBtn.prop('disabled', true).html('<span class="spinner-border spinner-border-sm me-2"></span>Signing In...');
                    },
                    success: function (response) {
                        if (response.success == 1) {
                            toaster("success", response.messages);
                            setTimeout(function () {
                                window.location.href = response.redirect;
                            }, 1500);
                        } else {
                            toaster("error", response.messages);
                            submitBtn.prop('disabled', false).html('Sign In');
                        }
                    },
                    error: function () {
                        toaster("error", "Something went wrong. Please try again.");
                        submitBtn.prop('disabled', false).html('Sign In');
                    }
                });
            }
        });
    }

    // Forgot Password Form Validation
    if ($("#forgotPasswordForm").length > 0) {
        $("#forgotPasswordForm").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                }
            },
            messages: {
                email: {
                    required: "Please enter your email",
                    email: "Please enter a valid email address"
                }
            },
            errorElement: 'div',
            errorPlacement: function (error, element) {
                var error_id = $(element).attr('id') + 'Err';
                if ($('#' + error_id).length > 0) {
                    error.appendTo('#' + error_id);
                } else {
                    error.insertAfter(element);
                }
            },
            submitHandler: function (form) {
                console.log("Forgot Password form submitted via AJAX");
                var formData = new FormData(form);
                var submitBtn = $("#forgotPasswordBtn");

                var ajaxUrl = base_url;
                if (!ajaxUrl.endsWith('/')) ajaxUrl += '/';
                ajaxUrl += "shop/forgot-password-action";

                console.log("Forgot Password AJAX URL:", ajaxUrl);

                $.ajax({
                    url: ajaxUrl,
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    dataType: "json",
                    beforeSend: function () {
                        submitBtn.prop('disabled', true).html('<span class="spinner-border spinner-border-sm me-2"></span>Sending Link...');
                    },
                    success: function (response) {
                        if (response.success == 1) {
                            toaster("success", response.messages);
                            // Optionally reset form
                            $("#forgotPasswordForm")[0].reset();
                            submitBtn.prop('disabled', false).html('Send Reset Link');
                        } else {
                            toaster("error", response.messages);
                            submitBtn.prop('disabled', false).html('Send Reset Link');
                        }
                    },
                    error: function () {
                        toaster("error", "Something went wrong. Please try again.");
                        submitBtn.prop('disabled', false).html('Send Reset Link');
                    }
                });
            }
        });
    }
});
