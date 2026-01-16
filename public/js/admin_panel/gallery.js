$(document).ready(function () {
    galleryPage.init();
});

var galleryTable = '';
const galleryPage = {
    init: function () {
        this.initDataTable();
        this.initFormSubmit();
        this.initDelete();
        $(".select2").select2();
    },

    initDataTable: function () {
        galleryTable = $("#gallery_table").DataTable({
            dom: "Bfrtilp",
            buttons: [
                {
                    extend: "csv",
                    text: '<i class="ti ti-file-type-csv"></i>',
                    init: function (api, node, config) {
                        $(node).attr("title", "Download CSV");
                    },
                    filename: "gallery_list"
                },
                {
                    extend: "pdf",
                    text: '<i class="ti ti-file-type-pdf"></i>',
                    init: function (api, node, config) {
                        $(node).attr("title", "Download Pdf");
                    },
                    filename: "gallery_list",
                }
            ],
            order: [[2, 'desc']], // Order by Added Date DESC
            columnDefs: [
                { orderable: false, targets: [0, 3] } // Disable ordering for image and action
            ],
            language: {
                search: "",
                searchPlaceholder: "Search records...",
            },
            pagingType: "full_numbers",
        });

        $('#serarch-filter-input').on('keyup', function () {
            galleryTable.search(this.value).draw();
        });

        // Remove "entries" text and style length menu
        $('.dataTables_length').find('label').contents().filter(function () {
            return this.nodeType === 3; // Filter out text nodes
        }).remove();

        // Fix select2 in datatables length
        setTimeout(function () {
            $(".dataTables_length select").select2({
                minimumResultsForSearch: Infinity,
                width: 'auto'
            });
        }, 500);
    },

    initFormSubmit: function () {
        let that = this;
        $(document).on("submit", ".add_gallery, .update_gallery", function (e) {
            e.preventDefault();
            var $form = $(this);
            var url = $form.attr("action");
            var formId = $form.attr("id");

            // Basic validation
            if (formId === 'add_gallery') {
                let fileInput = $form.find('input[name="gallery_image"]');
                if (!fileInput.val()) {
                    toaster("error", "Please select an image to upload.");
                    return;
                }
            }

            var formData = new FormData(this);
            var $submitBtn = $form.find('button[type="submit"]');
            var originalBtnText = $submitBtn.html();

            $submitBtn.prop('disabled', true).html('<span class="spinner-border spinner-border-sm me-1"></span> Saving...');

            $.ajax({
                type: "POST",
                url: url,
                data: formData,
                processData: false,
                contentType: false,
                dataType: "json",
                success: function (response) {
                    if (response.success == 1) {
                        toaster("success", response.msg);
                        $form.closest(".modal").modal("hide");
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000);
                    } else {
                        toaster("error", response.msg);
                        $submitBtn.prop('disabled', false).html(originalBtnText);
                    }
                },
                error: function () {
                    toaster("error", "Something went wrong. Please try again.");
                    $submitBtn.prop('disabled', false).html(originalBtnText);
                }
            });
        });
    },

    initDelete: function () {
        $(document).on("click", ".delete_gallery_data", function () {
            var gallery_id = $(this).data("id");

            Swal.fire({
                title: "Are you sure?",
                text: "You want to delete this gallery image?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#d33",
                cancelButtonColor: "#3085d6",
                confirmButtonText: "Yes, delete it!"
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: "delete_gallery",
                        type: "POST",
                        data: { gallery_id: gallery_id },
                        dataType: "json",
                        success: function (response) {
                            if (response.success == 1) {
                                Swal.fire("Deleted!", response.msg, "success").then(() => {
                                    location.reload();
                                });
                            } else {
                                Swal.fire("Error!", response.msg, "error");
                            }
                        },
                        error: function () {
                            Swal.fire("Error!", "Something went wrong.", "error");
                        }
                    });
                }
            });
        });
    }
};
