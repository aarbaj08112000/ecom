$(document).ready(function () {
    // Check if base_url is defined
    if (typeof base_url === 'undefined' || base_url === null) {
        console.error('base_url is not defined. Please ensure it is set in the template.');
        return;
    }

    // Remove quotes from base_url if present
    const cleanBaseUrl = base_url.replace(/"/g, '');

    var table = $('#low_stock_report').DataTable({
        "processing": true,
        "serverSide": true,
        "ajax": {
            "url": cleanBaseUrl + "report/report/get_low_stock_ajax",
            "type": "POST"
        },
        "columns": [
            {
                "data": "image",
                "orderable": false,
                "render": function (data, type, row) {
                    const imgSrc = (data && data !== '') ? cleanBaseUrl + 'public/uploads/products/' + data : 'https://www.rallis.com/Upload/Images/thumbnail/Product-inside.png';
                    return `<img src="${imgSrc}" class="rounded-circle" width="40" height="40" style="object-fit:cover;">`;
                }
            },
            { "data": "product_name" },
            { "data": "category_name" },
            {
                "data": "stock_quantity",
                "className": "text-center",
                "render": function (data, type, row) {
                    return '<span class="badge bg-label-warning">' + data + '</span>';
                }
            },
            { "data": "price" },
            {
                "data": "status",
                "render": function (data, type, row) {
                    let badgeClass = 'status-inactive';
                    if (data === 'Approved' || data === 'Active') badgeClass = 'status-active';
                    else if (data === 'Rejected') badgeClass = 'status-rejected';
                    else if (data === 'Pending') badgeClass = 'status-pending';
                    else if (data === 'Blocked') badgeClass = 'status-blocked';

                    return `<span class="status-badge ${badgeClass}">${data}</span>`;
                }
            },
            {
                "data": "id",
                "orderable": false,
                "className": "text-center",
                "render": function (data, type, row) {
                    return `
                        <div class="d-flex align-items-center justify-content-center gap-3">
                            <a href="${cleanBaseUrl}product_details?id=${data}" class="text-info" title="View">
                                <i class="ti ti-eye"></i>
                            </a>
                            <a href="${cleanBaseUrl}add_product?id=${data}" class="text-primary" title="Edit">
                                <i class="ti ti-edit"></i>
                            </a>
                            <a href="javascript:void(0);" class="delete-product text-danger" data-id="${data}" title="Delete">
                                <i class="ti ti-trash"></i>
                            </a>
                        </div>
                    `;
                }
            }
        ],
        "order": [[1, 'asc']],
        "pagingType": "full_numbers",
        "dom": 'Bfrtilp',
        "scrollY": '50vh',
        "scrollX": true,
        "bScrollCollapse": true,
        "buttons": [
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
        "language": {
            "processing": "Loading...",
            "search": "",
            "searchPlaceholder": "Search..."
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

    // Custom filtering
    $('#serarch-filter-input').keyup(function () {
        table.search(this.value).draw();
    });

    // Export buttons
    $('#downloadCSVBtn').click(function () {
        table.button('.buttons-csv').trigger();
    });

    $('#downloadPDFBtn').click(function () {
        table.button('.buttons-pdf').trigger();
    });

    // Delete product with SweetAlert confirmation
    $(document).on('click', '.delete-product', function (e) {
        e.preventDefault();
        const productId = $(this).data('id');

        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Yes, delete it!',
            cancelButtonText: 'Cancel'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: cleanBaseUrl + 'product/delete_product',
                    type: 'POST',
                    data: { id: productId },
                    dataType: 'json',
                    success: function (response) {
                        if (response.success == 1) {
                            Swal.fire('Deleted!', response.msg || 'Product has been deleted.', 'success');
                            table.ajax.reload(null, false);
                        } else {
                            Swal.fire('Error!', response.msg || 'Failed to delete product.', 'error');
                        }
                    },
                    error: function () {
                        Swal.fire('Error!', 'An error occurred while deleting the product.', 'error');
                    }
                });
            }
        });
    });
});
