var table = '';
var file_name = "delivery_partner_list";
var pdf_title = "Delivery Partners List";

$(document).ready(function () {
    // Ensure base_url has a trailing slash
    if (typeof base_url !== 'undefined' && !base_url.endsWith('/')) {
        base_url += '/';
    }

    table = $('#deliveryPartnersTable').DataTable({
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

    // Save Partner (Add/Edit)
    $('#savePartnerBtn').click(function () {
        var formData = $('#partnerForm').serialize();
        $.ajax({
            url: base_url + "save_delivery_partner",
            type: "POST",
            data: formData,
            success: function (response) {
                var res = JSON.parse(response);
                if (res.success == 1) {
                    toaster("success", res.messages);
                    $('#createPartnerModal').modal('hide');
                    setTimeout(function () {
                        location.reload();
                    }, 1000);
                } else {
                    toaster("error", res.messages);
                }
            }
        });
    });

    // Edit Partner
    $(document).on('click', '.edit_partner', function () {
        var id = $(this).data('id');
        $.ajax({
            url: base_url + "get_delivery_partner/" + id,
            type: "GET",
            success: function (response) {
                var data = JSON.parse(response);
                $('#partner_id').val(data.id);
                $('#partnerName').val(data.partner_name);
                $('#contactPerson').val(data.contact_person);
                $('#partnerEmail').val(data.email);
                $('#partnerPhone').val(data.phone);
                $('#trackingUrl').val(data.tracking_url_format);
                $('#partnerStatus').val(data.status);
                $('.modal-title').text('Edit Delivery Partner');
                $('#createPartnerModal').modal('show');
            }
        });
    });

    // Delete Partner
    $(document).on('click', '.delete_partner', function () {
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
                    url: base_url + "delete_delivery_partner",
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
    $('#createPartnerModal').on('hidden.bs.modal', function () {
        $('#partnerForm')[0].reset();
        $('#partner_id').val('');
        $('.modal-title').text('Add Delivery Partner');
    });
});
