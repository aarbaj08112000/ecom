$(document).ready(function () {
    customerEdit.init();
});

const customerEdit = {
    init: function () {
        this.handleFormSubmit();
        this.handleImagePreview();
    },

    handleImagePreview: function () {
        $("#profile_image_input").on("change", function () {
            const input = this;
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    $("#profile_image_preview").attr("src", e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        });
    },

    handleFormSubmit: function () {
        const that = this;
        $("#editFullCustomerForm").on("submit", function (e) {
            e.preventDefault();
            const form = $(this);
            const action = form.attr("action");

            if (that.formValidate("editFullCustomerForm")) {
                toaster("error", "Please fill all required fields.");
                return;
            }

            const formData = new FormData(form[0]);

            $.ajax({
                url: action,
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function () {
                    form.find('button[type="submit"]').prop('disabled', true).text('Saving...');
                },
                success: function (response) {
                    const res = JSON.parse(response);
                    if (res.success == 1) {
                        toaster("success", res.msg);
                        setTimeout(function () {
                            window.location.href = base_url + "customer_list";
                        }, 1500);
                    } else {
                        toaster("error", res.msg);
                        form.find('button[type="submit"]').prop('disabled', false).text('Save All Changes');
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Profile Update Error:", status, error, xhr.responseText);
                    toaster("error", "Failed to update profile. Please check console.");
                    form.find('button[type="submit"]').prop('disabled', false).text('Save All Changes');
                }
            });
        });
    },

    formValidate: function (formId) {
        let flag = false;
        $(`#${formId} .required-input`).each(function () {
            const input = $(this);
            if (input.val().trim() === "") {
                flag = true;
                input.addClass("is-invalid");
                if (input.next(".error").length === 0) {
                    input.after('<label class="error text-danger" style="font-size:12px;">This field is required</label>');
                }
            } else {
                input.removeClass("is-invalid");
                input.next(".error").remove();
            }
        });
        return flag;
    }
};
