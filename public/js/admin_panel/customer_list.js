$(document).ready(function () {
    customerPage.init();
});

const customerPage = {
    table: null,
    init: function () {
        this.initializeDataTable();
        this.handleStatusChange();
        this.handleDelete();
        this.handleProfileUpdate();
        this.handleSearch();
    },

    initializeDataTable: function () {
        const cleanBaseUrl = base_url.replace(/"/g, '');
        this.table = $('#customer-list-table').DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: cleanBaseUrl + 'customer_list_ajax',
                type: 'POST'
            },
            columns: [
                { data: 'image', orderable: false },
                { data: 'customer_code' },
                { data: 'customer_name' },
                { data: 'mobile_no' },
                { data: 'email' },
                { data: 'gst_no' },
                { data: 'pan_no' },
                { data: 'status', orderable: false },
                { data: 'orders', orderable: false, className: 'text-center' },
                { data: 'action', orderable: false, className: 'text-center' }
            ],
            order: [[2, 'asc']], // Sort by customer name by default
            pagingType: "full_numbers",
            dom: 'Bfrtilp', // Standardized DOM
            scrollY: true,
            bScrollCollapse: true,
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
            language: {
                processing: "Loading customers...",
                emptyTable: "No customers found",
                zeroRecords: "No matching customers found",
                search: "",
                searchPlaceholder: "Search..."
            },
            initComplete: function () {
                $('.dataTables_length').find('label').contents().filter(function () {
                    return this.nodeType === 3;
                }).remove();
                setTimeout(function () {
                    $(".dataTables_length select").select2({
                        minimumResultsForSearch: Infinity
                    });
                }, 100);
            }
        });
    },

    handleSearch: function () {
        const that = this;
        $('#serarch-filter-input').on('keyup', function () {
            that.table.search(this.value).draw();
        });
    },

    handleStatusChange: function () {
        $(document).on("click", ".status-update-link", function (e) {
            e.preventDefault();
            const link = $(this);
            const customerId = link.data("id");
            const newStatus = link.data("status");

            Swal.fire({
                title: "Are you sure?",
                text: `Are you sure you want to change this customer’s status to ${newStatus}?`,
                icon: "question",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, update it!"
            }).then((result) => {
                if (result.isConfirmed) {
                    const cleanBaseUrl = base_url.replace(/"/g, '');
                    const ajaxUrl = cleanBaseUrl.endsWith('/') ? cleanBaseUrl + "update_customer_status" : cleanBaseUrl + "/update_customer_status";
                    $.ajax({
                        url: ajaxUrl,
                        type: "POST",
                        data: {
                            id: customerId,
                            status: newStatus
                        },
                        dataType: "json",
                        success: function (response) {
                            if (response.success == 1) {
                                toaster("success", `Status updated to ${newStatus} successfully.`);
                                // Automatically reload the page as requested
                                setTimeout(() => {
                                    location.reload();
                                }, 1000);
                            } else {
                                toaster("error", response.msg);
                            }
                        },
                        error: function (xhr, status, error) {
                            console.error("AJAX Error:", status, error, xhr.responseText);
                            toaster("error", "Something went wrong. Please check console.");
                        }
                    });
                }
            });
        });
    },

    handleDelete: function () {
        const that = this;
        $(document).on("click", ".delete-customer", function () {
            const btn = $(this);
            const customerId = btn.data("id");

            Swal.fire({
                title: "Are you sure?",
                text: "You won't be able to revert this profile!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#d33",
                cancelButtonColor: "#3085d6",
                confirmButtonText: "Yes, delete it!"
            }).then((result) => {
                if (result.isConfirmed) {
                    const cleanBaseUrl = base_url.replace(/"/g, '');
                    const ajaxUrl = cleanBaseUrl.endsWith('/') ? cleanBaseUrl + "delete_customer" : cleanBaseUrl + "/delete_customer";
                    $.ajax({
                        url: ajaxUrl,
                        type: "POST",
                        data: { id: customerId },
                        dataType: "json",
                        success: function (response) {
                            if (response.success == 1) {
                                toaster("success", response.msg);
                                that.table.ajax.reload(null, false); // Reload table without reset
                            } else {
                                toaster("error", response.msg);
                            }
                        },
                        error: function (xhr, status, error) {
                            console.error("Delete Error:", status, error, xhr.responseText);
                            toaster("error", "Failed to delete customer. Check console.");
                        }
                    });
                }
            });
        });
    },

    handleProfileUpdate: function () {
        // This is for the modal form if it still exists or is used elsewhere
        const that = this;
        $(document).on("submit", ".edit-customer-form", function (e) {
            e.preventDefault();
            const form = $(this);
            const formId = form.attr("id");

            if (that.formValidate(formId)) {
                return;
            }

            const formData = new FormData(form[0]);

            $.ajax({
                url: form.attr("action"),
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    const res = JSON.parse(response);
                    if (res.success == 1) {
                        toaster("success", res.msg);
                        form.parents(".modal").modal("hide");
                        if (that.table) {
                            that.table.ajax.reload(null, false);
                        } else {
                            location.reload();
                        }
                    } else {
                        toaster("error", res.msg);
                    }
                },
                error: function () {
                    toaster("error", "Failed to update profile.");
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
                if (input.next(".error").length === 0) {
                    input.after('<label class="error" style="color:red; font-size:12px;">This field is required</label>');
                }
            } else {
                input.next(".error").remove();
            }
        });
        return flag;
    }
};
