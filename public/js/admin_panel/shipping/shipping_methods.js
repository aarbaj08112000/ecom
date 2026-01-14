var table = '';
var file_name = "shipping_method_list";
var pdf_title = "Shipping Methods List";

$(document).ready(function () {
    // Ensure base_url has a trailing slash
    if (typeof base_url !== 'undefined' && !base_url.endsWith('/')) {
        base_url += '/';
    }

    table = $('#shippingMethodsTable').DataTable({
        "dom": "Bfrtilp",
        "processing": true,
        "serverSide": false,
        "columnDefs": [
            { "orderable": false, "targets": [5] }
        ],
        "order": [[0, "asc"]],
        "pagingType": "full_numbers",
        "scrollY": true,
        "bScrollCollapse": true,
        "buttons": [
            {
                extend: "csv",
                text: '<i class="ti ti-file-type-csv"></i>',
                init: function (api, node, config) {
                    $(node).attr("title", "Download CSV");
                    $(node).addClass("btn-hide");
                },
                filename: file_name,
                exportOptions: {
                    columns: ':not(:last-child)'
                }
            },
            {
                extend: "pdf",
                text: '<i class="ti ti-file-type-pdf"></i>',
                init: function (api, node, config) {
                    $(node).attr("title", "Download PDF");
                    $(node).addClass("btn-hide");
                },
                filename: file_name,
                exportOptions: {
                    columns: ':not(:last-child)'
                },
                customize: function (doc) {
                    doc.pageMargins = [15, 15, 15, 15];
                    doc.content[0].text = pdf_title;
                    doc.content[0].alignment = 'center';
                    doc.content[1].table.widths = Array(doc.content[1].table.body[0].length + 1).join('*').split('');
                    doc.styles.tableHeader.fillColor = '#7367f0';
                    doc.styles.tableHeader.alignment = 'center';
                    doc.content[1].table.body.forEach(function (row) {
                        row.forEach(function (cell) {
                            cell.alignment = "center";
                        });
                    });
                }
            }
        ]
    });

    // Integrated Search Filter
    $('#serarch-filter-input').on('keyup', function () {
        table.search(this.value).draw();
    });

    // Manual Export Buttons triggers
    $('#downloadCSVBtn').click(function () {
        table.button('.buttons-csv').trigger();
    });

    $('#downloadPDFBtn').click(function () {
        table.button('.buttons-pdf').trigger();
    });

    // Remove text from length menu
    $('.dataTables_length').find('label').contents().filter(function () {
        return this.nodeType === 3;
    }).remove();

    // Save Shipping Method (Add/Edit)
    $('#saveMethodBtn').click(function () {
        var formData = $('#shippingMethodForm').serialize();
        $.ajax({
            url: base_url + "save_shipping_method",
            type: "POST",
            data: formData,
            success: function (response) {
                var res = JSON.parse(response);
                if (res.success == 1) {
                    toaster("success", res.messages);
                    $('#createShippingMethod').modal('hide');
                    setTimeout(function () {
                        location.reload();
                    }, 1000);
                } else {
                    toaster("error", res.messages);
                }
            }
        });
    });

    // Edit Shipping Method
    $(document).on('click', '.edit_method', function () {
        var id = $(this).data('id');
        $.ajax({
            url: base_url + "get_shipping_method/" + id,
            type: "GET",
            success: function (response) {
                var data = JSON.parse(response);
                $('#method_id').val(data.id);
                $('#methodName').val(data.method_name);
                $('#carrier').val(data.carrier);
                $('#shippingFee').val(data.shipping_fee);
                $('#minDays').val(data.min_delivery_days);
                $('#maxDays').val(data.max_delivery_days);
                $('#methodStatus').val(data.status);
                $('.modal-title').text('Edit Shipping Method');
                $('#createShippingMethod').modal('show');
            }
        });
    });

    // Delete Shipping Method
    $(document).on('click', '.delete_method', function () {
        var id = $(this).data('id');
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
                    url: base_url + "delete_shipping_method",
                    type: "POST",
                    data: { id: id },
                    success: function (response) {
                        var res = JSON.parse(response);
                        if (res.success == 1) {
                            Swal.fire("Deleted!", res.messages, "success");
                            setTimeout(function () {
                                location.reload();
                            }, 1000);
                        } else {
                            Swal.fire("Error!", res.messages, "error");
                        }
                    },
                    error: function () {
                        Swal.fire("Error!", "Something went wrong.", "error");
                    }
                });
            }
        });
    });

    // Reset Modal on Close
    $('#createShippingMethod').on('hidden.bs.modal', function () {
        $('#shippingMethodForm')[0].reset();
        $('#method_id').val('');
        $('.modal-title').text('Add Shipping Method');
    });
});
