var table = '';
var file_name = "email_campaign_list";
var pdf_title = "Email Marketing Campaign List";

$(document).ready(function () {
    // Ensure base_url has a trailing slash
    if (typeof base_url !== 'undefined' && !base_url.endsWith('/')) {
        base_url += '/';
    }

    table = $('#campaignsTable').DataTable({
        "dom": "Bfrtilp",
        "processing": true,
        "serverSide": false, // Switching to client-side to match Categories and fix PDF logic
        "columnDefs": [
            { "orderable": false, "targets": [7] }
        ],
        "order": [[6, "desc"]],
        "pagingType": "full_numbers",
        "scrollY": true,
        "bScrollCollapse": true,
        "buttons": [
            {
                extend: "csv",
                text: '<i class="ti ti-file-type-csv"></i>',
                init: function (api, node, config) {
                    $(node).attr("title", "Download CSV");
                    $(node).addClass("btn-hide"); // Hide default, we trigger via manual button
                },
                filename: file_name
            },
            {
                extend: "pdf",
                text: '<i class="ti ti-file-type-pdf"></i>',
                init: function (api, node, config) {
                    $(node).attr("title", "Download PDF");
                    $(node).addClass("btn-hide"); // Hide default, we trigger via manual button
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
                    doc.styles.tableHeader.fillColor = '#7367f0'; // Standard theme color
                    doc.styles.tableHeader.alignment = 'center';
                    doc.content[1].table.body.forEach(function (row) {
                        row.forEach(function (cell) {
                            cell.alignment = "center";
                        });
                    });
                }
            }
        ],
        "initComplete": function () {
            setTimeout(function () {
                $(".dataTables_length select").select2({
                    minimumResultsForSearch: Infinity
                });
            }, 100);
        }
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

    // Save Campaign (Add/Edit)
    $('#saveCampaignBtn').click(function () {
        var formData = $('#campaignForm').serialize();
        $.ajax({
            url: base_url + "save_campaign",
            type: "POST",
            data: formData,
            success: function (response) {
                var res = JSON.parse(response);
                if (res.success == 1) {
                    toaster("success", res.messages);
                    $('#createCampaign').modal('hide');
                    table.ajax.reload();
                } else {
                    toaster("error", res.messages);
                }
            }
        });
    });

    // Edit Campaign
    $(document).on('click', '.edit_campaign', function () {
        var id = $(this).data('id');
        $.ajax({
            url: base_url + "get_campaign/" + id,
            type: "GET",
            success: function (response) {
                var data = JSON.parse(response);
                $('#campaign_id').val(data.id);
                $('#campaignName').val(data.campaign_name);
                $('#emailSubject').val(data.subject);
                $('#targetAudience').val(data.target_audience);
                $('#scheduledDate').val(data.scheduled_date);
                $('#campaignContent').val(data.content);
                $('#campaignStatus').val(data.status);
                $('.modal-title').text('Edit Campaign');
                $('#createCampaign').modal('show');
            }
        });
    });

    // Delete Campaign
    $(document).on('click', '.delete_campaign', function () {
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
                    url: base_url + "delete_campaign",
                    type: "POST",
                    data: { id: id },
                    success: function (response) {
                        var res = JSON.parse(response);
                        if (res.success == 1) {
                            Swal.fire("Deleted!", res.messages, "success");
                            table.ajax.reload();
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
    $('#createCampaign').on('hidden.bs.modal', function () {
        $('#campaignForm')[0].reset();
        $('#campaign_id').val('');
        $('.modal-title').text('Create New Campaign');
    });
});
