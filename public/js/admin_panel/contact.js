$(document).ready(function () {
    page.init();
});

var table = '';
const page = {
    init: function () {
        this.dataTable();
        this.bindEvents();
    },
    dataTable: function () {
        table = $("#contact_table").DataTable({
            dom: "Bfrtilp",
            buttons: [
                {
                    extend: "csv",
                    text: '<i class="ti ti-file-type-csv"></i>',
                    titleAttr: "Download CSV"
                },
                {
                    extend: "pdf",
                    text: '<i class="ti ti-file-type-pdf"></i>',
                    titleAttr: "Download PDF"
                }
            ],
            order: [[0, "desc"]], // Sort by date descending
            pagingType: "full_numbers"
        });

        $('#serarch-filter-input').on('keyup', function () {
            table.search(this.value).draw();
        });
    },
    bindEvents: function () {
        // Change Status
        $(document).on("change", ".status-change", function () {
            var contact_id = $(this).data("id");
            var status = $(this).val();

            $.ajax({
                url: "update_contact_status",
                type: "POST",
                data: { contact_id: contact_id, status: status },
                dataType: "json",
                success: function (response) {
                    if (response.success == 1) {
                        toaster("success", response.msg);
                    } else {
                        toaster("error", response.msg);
                    }
                },
                error: function () {
                    toaster("error", "Something went wrong.");
                }
            });
        });

        // Delete Contact
        $(document).on("click", ".delete_contact", function () {
            var contact_id = $(this).data("id");

            Swal.fire({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#d33",
                cancelButtonColor: "#3085d6",
                confirmButtonText: "Yes, delete it!"
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: "delete_contact",
                        type: "POST",
                        data: { contact_id: contact_id },
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
}
