$(document).ready(function ($) {
  $("#formRestePassword").validate({
    rules: {
      password: {
        required: true,
        minlength: 8,
        strongPassword: true
      },
      confirm_password: {
        required: true,
        equalTo: "#password"
      }
    },
    messages: {

      password: {
        required: "Please enter your password",
        minlength: "Your password must be 8 characters",
        strongPassword: "Your password must be strong (include at least one uppercase letter, one lowercase letter, one digit, and one special character)"
      },
      confirm_password: {
        required: "Please enter your confirm password",
        equalTo: "Confirm password and password must be identical"
      }
    },
    errorElement: "div",
    errorPlacement: function (error, element) {
      var element_id = element[0]['id'];
      error.appendTo(`#${element_id}Err`)
    },
    submitHandler: function (form) {
      var formdata = new FormData(form);
      $.ajax({
        url: base_url + "user/Login/reset_password_action",
        data: formdata,
        processData: false,
        contentType: false,
        cache: false,
        type: "post",
        success: function (result) {
          var data = JSON.parse(result);
          if (data.success == 1) {
            toaster("success", data.messages);
            setTimeout(function () {
              window.location.href = base_url + data.redirect_url;
            }, 2000);
          } else {
            toaster("error", data.messages);
          }

        }
      });
    }

  });

  $.validator.addMethod("strongPassword", function (value, element) {
    return this.optional(element) || /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/.test(value);
  }, "Your password must include at least one uppercase letter, one lowercase letter, one digit, and one special character");
});
