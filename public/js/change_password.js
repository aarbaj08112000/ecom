$(document).ready(function ($) {
    $("#formChangePassword").validate({
        rules: {
            current_password: {
                required: true
            },
            new_password: {
                required: true,
                minlength: 8
            },
            confirm_password: {
                required: true,
                matches: "#new_password"
            }
        },
        messages: {
            current_password: {
                required: "Please enter your current password"
            },
            new_password: {
                required: "Please enter a new password",
                minlength: "Your password must be at least 8 characters long"
            },
            confirm_password: {
                required: "Please confirm your new password",
                matches: "Passwords do not match"
            }
        },
        errorElement: "div",
        errorPlacement: function (error, element) {
            var element_id = element[0]['id'];
            error.appendTo(`#${element_id}Err`);
        },
        submitHandler: function (form) {
            var formdata = new FormData(form);
            $.ajax({
                beforeSend: function () {
                    $(".main-loader-box").show();
                },
                url: base_url + "user/Login/update_password_action",
                data: formdata,
                processData: false,
                contentType: false,
                cache: false,
                type: "post",
                success: function (result) {
                    $(".main-loader-box").fadeOut();
                    var data = JSON.parse(result);
                    if (data.success == 1) {
                        toaster("success", data.messages);
                        setTimeout(function () {
                            window.location.href = base_url + "dashboard";
                        }, 2000);
                    } else {
                        toaster("error", data.messages);
                    }
                },
                error: function () {
                    $(".main-loader-box").fadeOut();
                    toaster("error", "Something went wrong. Please try again.");
                }
            });
        }
    });

    // Password visibility toggle
    $(".toggle-password").click(function () {
        var target = $(this).data("target");
        var input = $(target);
        var icon = $(this).find("i");

        if (input.attr("type") === "password") {
            input.attr("type", "text");
            icon.removeClass("la-eye").addClass("la-eye-slash");
        } else {
            input.attr("type", "password");
            icon.removeClass("la-eye-slash").addClass("la-eye");
        }
    });

    // Custom method for confirm password check if not provided by default
    if ($.validator && !$.validator.methods.matches) {
        $.validator.addMethod("matches", function (value, element, param) {
            var target = $(param);
            return value === target.val();
        }, "Values do not match");
    }
});
