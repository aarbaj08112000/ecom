$(document).ready(function () {
    var table = $('#reviews_table').DataTable({
        "processing": true,
        "serverSide": true,
        "ajax": {
            "url": "reviews_list_ajax",
            "type": "POST",
            "data": function (d) {
                d.product_filter = $('#product_filter').val();
                d.rating_filter = $('#rating_filter').val();
                d.status_filter = $('#status_filter').val();
            }
        },
        "columns": [
            { "data": "product_name" },
            {
                "data": "reviewer_name",
                "render": function (data, type, row) {
                    return '<div><strong>' + data + '</strong><br><small class="text-muted">' + row.email + '</small></div>';
                }
            },
            {
                "data": "rating",
                "render": function (data) {
                    let stars = '';
                    for (let i = 1; i <= 5; i++) {
                        stars += '<i class="ti ti-star' + (i <= data ? '-filled' : '') + ' rating-stars"></i>';
                    }
                    return stars;
                }
            },
            {
                "data": "comment",
                "render": function (data) {
                    return '<div class="comment-text" title="' + data + '">' + data + '</div>';
                }
            },
            {
                "data": "status",
                "render": function (data) {
                    let badgeClass = 'status-inactive';
                    if (data === 'Approved') badgeClass = 'status-approved';
                    else if (data === 'Rejected') badgeClass = 'status-rejected';
                    else if (data === 'Pending') badgeClass = 'status-pending';
                    return '<span class="status-badge ' + badgeClass + '">' + data + '</span>';
                }
            },
            { "data": "added_date" },
            {
                "data": null,
                "orderable": false,
                "render": function (data, type, row) {
                    let actions = '<div class="d-flex gap-2">';

                    if (row.status === 'Pending' || row.status === 'Rejected') {
                        actions += '<a href="javascript:void(0)" class="approve-btn" data-id="' + row.review_id + '" title="Approve"><i class="ti ti-check text-success fs-4"></i></a>';
                    }
                    if (row.status === 'Pending' || row.status === 'Approved') {
                        actions += '<a href="javascript:void(0)" class="reject-btn" data-id="' + row.review_id + '" title="Reject"><i class="ti ti-x text-warning fs-4"></i></a>';
                    }

                    actions += '<a href="javascript:void(0)" class="delete-btn" data-id="' + row.review_id + '" title="Delete"><i class="ti ti-trash text-danger fs-4"></i></a>';
                    actions += '</div>';
                    return actions;
                }
            }
        ],
        "order": [[5, "desc"]], // Default order by date
        "language": {
            "searchPlaceholder": "Search reviews...",
            "sSearch": "",
            "lengthMenu": "_MENU_",
        },
        "dom": "Bfrtilp",
        "buttons": [],
        "pagingType": "full_numbers",
        "scrollY": true,
        "bScrollCollapse": true,
        "initComplete": function () {
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

    // Custom Search Filter
    $('#serarch-filter-input').on('keyup', function () {
        table.search(this.value).draw();
    });

    // Clean up length menu and init select2
    $('.dataTables_length').find('label').contents().filter(function () {
        return this.nodeType === 3; // Filter out text nodes (like "Show" and "entries")
    }).remove();

    setTimeout(function () {
        $(".dataTables_length select").select2({
            minimumResultsForSearch: Infinity
        });
    }, 1000);

    // Approve Review
    $(document).on('click', '.approve-btn', function () {
        let id = $(this).data('id');
        Swal.fire({
            title: 'Are you sure?',
            text: "Do you want to approve this review?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#28c76f',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, approve it!'
        }).then((result) => {
            if (result.isConfirmed) {
                updateStatus(id, 'Approved');
            }
        });
    });

    // Reject Review
    $(document).on('click', '.reject-btn', function () {
        let id = $(this).data('id');
        Swal.fire({
            title: 'Are you sure?',
            text: "Do you want to reject this review?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Yes, reject it!'
        }).then((result) => {
            if (result.isConfirmed) {
                updateStatus(id, 'Rejected');
            }
        });
    });

    // Delete Review
    $(document).on('click', '.delete-btn', function () {
        let id = $(this).data('id');
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: 'delete_review',
                    type: 'POST',
                    data: { review_id: id },
                    dataType: 'json',
                    success: function (response) {
                        if (response.success) {
                            toastr.success(response.msg);
                            table.draw(false);
                        } else {
                            toastr.error(response.msg);
                        }
                    }
                });
            }
        });
    });

    function updateStatus(id, status) {
        $.ajax({
            url: 'update_review_status',
            type: 'POST',
            data: { review_id: id, status: status },
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    toastr.success(response.msg);
                    table.draw(false);
                } else {
                    toastr.error(response.msg);
                }
            }
        });
    }
});
