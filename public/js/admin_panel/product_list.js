$(document).ready(function () {
    // Check if base_url is defined
    if (typeof base_url === 'undefined' || base_url === null) {
        console.error('base_url is not defined. Please ensure it is set in the template.');
        return;
    }

    // Remove quotes from base_url if present
    const cleanBaseUrl = base_url.replace(/"/g, '');

    // Initialize DataTable with Buttons
    const table = $('#process').DataTable({
        processing: true,
        serverSide: true,
        ajax: {
            url: cleanBaseUrl + 'product/product_list_ajax',
            type: 'POST'
        },
        dom: 'Bfrtilp', // Added 'l' for length menu and moved 'i'
        buttons: [
            {
                extend: 'csv',
                text: '<i class="ti ti-file-type-csv"></i>',
                title: 'Product List',
                titleAttr: 'Download CSV',
                exportOptions: {
                    columns: [1, 2, 3, 5, 6]
                }
            },
            {
                extend: 'pdf',
                text: '<i class="ti ti-file-type-pdf"></i>',
                title: 'Product List',
                titleAttr: 'Download PDF',
                orientation: 'landscape',
                exportOptions: {
                    columns: [1, 2, 3, 5, 6]
                },
                customize: function (doc) {
                    // Match categories PDF customization if needed, or keep simple
                    doc.pageMargins = [15, 15, 15, 15];
                    doc.content[1].table.widths = Array(doc.content[1].table.body[0].length + 1).join('*').split('');
                }
            }
        ],
        columns: [
            {
                data: 'image',
                orderable: false,
                render: function (data, type, row) {
                    const imgSrc = (data && data !== '') ? cleanBaseUrl + 'public/uploads/products/' + data : 'https://www.rallis.com/Upload/Images/thumbnail/Product-inside.png';
                    return `<img src="${imgSrc}" class="img-thumbnail" style="width:60px; height:60px; object-fit:cover;">`;
                }
            },
            { data: 'name' },
            {
                data: 'detail',
                render: function (data) {
                    return `<span class="text-muted">${data}</span>`;
                }
            },
            { data: 'stock_quantity' },
            {
                data: null,
                orderable: false,
                render: function () {
                    return 'pcs';
                }
            },
            { data: 'price' },
            {
                data: 'status',
                render: function (data) {
                    let badgeClass = data.toLowerCase() === 'active' ? 'status-active' : 'status-inactive';
                    return '<span class="status-badge ' + badgeClass + '">' + data + '</span>';
                }
            },
            {
                data: 'id',
                orderable: false,
                render: function (data) {
                    return `
                        <a href="${cleanBaseUrl}product_details?id=${data}" title="View">
                            <i class="ti ti-eye"></i>
                        </a>
                        <a href="${cleanBaseUrl}add_product?id=${data}" title="edit">
                              <i class="ti ti-edit"></i>
                        </a>
                       
                        <a href="#" class="delete-product" data-id="${data}" title="Delete">
                            <i class="ti ti-trash"></i>
                        </a>
                    `;
                }
            }
        ],
        order: [[1, 'asc']],
        pagingType: "full_numbers",
        scrollY: true,
        bScrollCollapse: true,
        language: {
            processing: "Loading products...",
            emptyTable: "No products found",
            zeroRecords: "No matching products found",
            search: "_INPUT_",
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

    // Remove old button hiding/custom handlers as we are integrating into standard dom
    // $('.dt-buttons').hide(); // Removed

    // Custom CSV button handler
    $('#downloadCSVBtn').on('click', function () {
        table.button('.buttons-csv').trigger();
    });

    // Custom PDF button handler
    $('#downloadPDFBtn').on('click', function () {
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
                // Perform AJAX delete
                $.ajax({
                    url: cleanBaseUrl + 'product/delete_product',
                    type: 'POST',
                    data: { id: productId },
                    dataType: 'json',
                    success: function (response) {
                        if (response.success == 1) {
                            Swal.fire(
                                'Deleted!',
                                response.msg || 'Product has been deleted.',
                                'success'
                            );
                            table.ajax.reload(null, false); // Reload table without resetting pagination
                        } else {
                            Swal.fire(
                                'Error!',
                                response.msg || 'Failed to delete product.',
                                'error'
                            );
                        }
                    },
                    error: function () {
                        Swal.fire(
                            'Error!',
                            'An error occurred while deleting the product.',
                            'error'
                        );
                    }
                });
            }
        });
    });
});
