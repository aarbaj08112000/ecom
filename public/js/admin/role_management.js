$(document).ready(function () {
    // Check if base_url is defined
    if (typeof base_url === 'undefined' || base_url === null) {
        console.error('base_url is not defined. Please ensure it is set in the template.');
        return;
    }

    // Remove quotes from base_url if present
    const cleanBaseUrl = base_url.replace(/"/g, '');

    var rolesTable = $('#roles_table').DataTable({
        processing: true,
        serverSide: true,
        ajax: {
            url: cleanBaseUrl + "roles_ajax",
            type: "POST"
        },
        dom: '<"top-btns"B>rt<"bottom-pagination"i<"right-controls"pl>><"clear">',
        scrollY: "450px",
        scrollCollapse: true,
        buttons: [
            {
                extend: "csv",
                text: '<i class="ti ti-file-type-csv"></i>',
                title: 'Roles List',
                exportOptions: {
                    columns: [0, 1, 2, 3]
                }
            },
            {
                extend: "pdf",
                text: '<i class="ti ti-file-type-pdf"></i>',
                title: 'Roles List',
                exportOptions: {
                    columns: [0, 1, 2, 3]
                }
            },
        ],
        columns: [
            { data: 'role_name' },
            { data: 'role_description' },
            {
                data: 'status',
                render: function (data) {
                    let badgeClass = data.toLowerCase() === 'active' ? 'status-active' : 'status-inactive';
                    return '<span class="status-badge ' + badgeClass + '">' + data + '</span>';
                }
            },
            { data: 'created_at' },
            {
                data: 'role_id',
                orderable: false,
                render: function (data, type, row) {
                    return `
                        <a href="javascript:void(0)" class="view-role" 
                           data-id="${data}" 
                           data-name="${row.role_name}" 
                           data-description="${row.role_description}" 
                           data-status="${row.status}" 
                           title="View">
                            <i class="ti ti-eye"></i>
                        </a>
                        <a href="javascript:void(0)" class="edit-role" 
                           data-id="${data}" 
                           data-name="${row.role_name}" 
                           data-description="${row.role_description}" 
                           data-status="${row.status}" 
                           title="Edit">
                            <i class="ti ti-edit"></i>
                        </a>
                        <span class="delete-role" title="Delete Record" data-id="${data}">
                            <i class="ti ti-trash"></i>
                        </span>
                    `;
                }
            }
        ],
        order: [[0, 'asc']],
        pagingType: "full_numbers",
        language: {
            processing: "Loading roles...",
            emptyTable: "No roles found",
            zeroRecords: "No matching roles found",
            paginate: {
                first: "First",
                previous: "Previous",
                next: "Next",
                last: "Last"
            }
        },
        initComplete: function () {
            $('.dataTables_length').find('label').contents().filter(function () {
                return this.nodeType === 3;
            }).remove();
        }
    });

    // Live Search Filter
    $('#serarch-filter-input').on('keyup input', function () {
        rolesTable.search(this.value).draw();
    });

    // Re-initialize Select2 for DataTables length
    setTimeout(function () {
        $(".dataTables_length select").select2({
            minimumResultsForSearch: Infinity
        });
    }, 100);

    // Permission checkboxes logic (Add Modal)
    handlePermissions('#addRoleModal');

    // Handle View Role
    $(document).on("click", ".view-role", function () {
        $('.edit-role').filter(`[data-id="${$(this).data('id')}"]`).click();
        setTimeout(() => {
            $('#editRoleModal .modal-title').text('View Role');
            $('#editRoleModal button[type="submit"]').hide();
            // Disable inputs for view mode
            $('#editRoleModal input, #editRoleModal select').prop('disabled', true);
        }, 500);
    });

    // Handle Edit Role Modal
    $(document).on("click", ".edit-role", function () {
        $('#editRoleModal .modal-title').text('Edit Role');
        $('#editRoleModal button[type="submit"]').show();
        $('#editRoleModal input, #editRoleModal select').prop('disabled', false);

        const id = $(this).data('id');
        const name = $(this).data('name');
        const description = $(this).data('description');
        const status = $(this).data('status');

        $('#edit_role_id').val(id);
        $('#edit_role_name').val(name).trigger('change');
        $('#edit_role_description').val(description);
        $('#edit_status').val(status).trigger('change');

        // Clone permission rows from Add modal if not already done
        if ($('#edit_permissions_body').children().length === 0) {
            const rows = $('#add_permissions_body').html();
            $('#edit_permissions_body').html(rows);
            // Re-initialize permission logic for Edit modal
            handlePermissions('#editRoleModal');
        }

        // Reset all checkboxes first
        $('#editRoleModal .permission-checkbox').prop('checked', false);
        $('#editRoleModal .module-select-all').prop('checked', false);

        // Fetch and check active permissions via AJAX
        $.ajax({
            url: cleanBaseUrl + "user/role/getRolePermissions/" + id,
            type: "GET",
            dataType: "json",
            success: function (permissions) {
                // Loop through modules and actions
                for (let module in permissions) {
                    for (let action in permissions[module]) {
                        if (permissions[module][action] == 1) {
                            $(`#editRoleModal tr[data-module="${module}"] .${action}-permission`).prop('checked', true);
                        }
                    }
                }
                // Update Select All states
                updateAllSelectStates('#editRoleModal');
                $('#editRoleModal').modal('show');
            },
            error: function () {
                toaster("error", "Failed to load permissions");
            }
        });
    });

    // Handle Delete Role
    $(document).on("click", ".delete-role", function () {
        var id = $(this).data("id");

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
                    url: cleanBaseUrl + "user/role/deleteRole",
                    type: "POST",
                    data: { role_id: id },
                    dataType: "json",
                    success: function (response) {
                        if (response.status === 'success') {
                            toaster("success", response.message);
                            rolesTable.ajax.reload(null, false);
                        } else {
                            toaster("error", response.message);
                        }
                    },
                    error: function () {
                        toaster("error", "An error occurred");
                    }
                });
            }
        });
    });

    // Form Submissions (Add and Edit)
    $("#add_role_form, #edit_role_form").submit(function (e) {
        e.preventDefault();
        var form = $(this);
        var url = form.attr("action");

        // Validation check (manual since we simplified)
        let isValid = true;
        form.find(".required-input").each(function () {
            if (!$(this).val()) {
                isValid = false;
                $(this).addClass("is-invalid");
            } else {
                $(this).removeClass("is-invalid");
            }
        });

        if (!isValid) {
            toaster("error", "Please fill all required fields");
            return;
        }

        // Check for at least one permission
        if (form.find('.permission-checkbox:checked').length === 0) {
            toaster("warning", "Please select at least one permission");
            return;
        }

        var formData = form.serialize();
        $.ajax({
            type: "POST",
            url: url,
            data: formData,
            dataType: "json",
            beforeSend: function () {
                $('.main-loader-box').show();
            },
            success: function (response) {
                $('.main-loader-box').hide();
                if (response.status === 'success') {
                    toaster("success", response.message);
                    form.closest(".modal").modal("hide");
                    rolesTable.ajax.reload(null, false);
                } else {
                    toaster("error", response.message);
                }
            },
            error: function () {
                $('.main-loader-box').hide();
                toaster("error", "Something went wrong");
            },
        });
    });

    function handlePermissions(modalId) {
        const $modal = $(modalId);

        // Select All Modules
        $modal.find('.select-all-module').on('change', function () {
            var isChecked = $(this).is(':checked');
            $modal.find('.permission-checkbox').prop('checked', isChecked);
            $modal.find('.module-select-all').prop('checked', isChecked);
            $modal.find('.select-all-permissions').prop('checked', isChecked);
        });

        // Select all permissions by column
        $modal.find('.select-all-permissions').on('change', function () {
            var permissionType = $(this).attr('id').replace('select_all_', '');
            // For Edit modal, IDs might be different or we use classes
            if (modalId === '#editRoleModal') return; // Column select-all in edit modal is simplified for now

            var isChecked = $(this).is(':checked');
            $modal.find('.' + permissionType + '-permission').prop('checked', isChecked);
            updateAllSelectStates(modalId);
        });

        // Module-wise select all
        $(document).on('change', modalId + ' .module-select-all', function () {
            var module = $(this).data('module');
            var isChecked = $(this).is(':checked');
            $(this).closest('tr').find('.permission-checkbox').prop('checked', isChecked);
            updateAllSelectStates(modalId);
        });

        // Individual permission
        $(document).on('change', modalId + ' .permission-checkbox', function () {
            updateAllSelectStates(modalId);
        });
    }

    function updateAllSelectStates(modalId) {
        const $modal = $(modalId);

        // Update Module Select Alls
        $modal.find('tr[data-module]').each(function () {
            var $row = $(this);
            var total = $row.find('.permission-checkbox').length;
            var checked = $row.find('.permission-checkbox:checked').length;
            var $moduleAll = $row.find('.module-select-all');

            $moduleAll.prop('checked', checked === total && total > 0);
            $moduleAll.prop('indeterminate', checked > 0 && checked < total);
        });

        // Update Global Select All
        var totalCheck = $modal.find('.permission-checkbox').length;
        var checkedCheck = $modal.find('.permission-checkbox:checked').length;
        var $globalAll = $modal.find('.select-all-module');

        $globalAll.prop('checked', checkedCheck === totalCheck && totalCheck > 0);
        $globalAll.prop('indeterminate', checkedCheck > 0 && checkedCheck < totalCheck);
    }

    // Initialize Select2
    $('.select2').select2({
        dropdownParent: $('.modal.show').length ? $('.modal.show') : $('body'),
        width: '100%'
    });

    $('.modal').on('shown.bs.modal', function () {
        $(this).find('.select2').select2({
            dropdownParent: $(this),
            width: '100%'
        });
    });

    // Reset form on close
    $('.modal').on('hidden.bs.modal', function () {
        $(this).find('form')[0].reset();
        $(this).find('.is-invalid').removeClass('is-invalid');
        $(this).find('.permission-checkbox, .module-select-all, .select-all-module, .select-all-permissions').prop('checked', false).prop('indeterminate', false);
        $(this).find('.select2').val('').trigger('change');
    });
});

function toaster(type, msg) {
    Swal.fire({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000,
        icon: type,
        title: msg
    });
}
