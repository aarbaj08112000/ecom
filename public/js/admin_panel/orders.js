$(document).ready(function () {
    page.init();
});

var table = '';
const page = {
    init: function () {
        this.dataTable();
        this.attachEvents();
    },
    dataTable: function () {
        table = $("#orders-table").DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: base_url + "orders/get_orders_ajax",
                type: "POST"
            },
            columns: [
                { data: 'order_id' },
                { data: 'customer_name' },
                { data: 'total_amount' },
                { data: 'net_amount' },
                {
                    data: 'payment_status',
                    render: function (data) {
                        const mapping = {
                            'paid': 'status-paid',
                            'unpaid': 'status-unpaid',
                            'pending': 'status-pending',
                            'failed': 'status-failed',
                            'refunded': 'status-refunded',
                            'partially paid': 'status-partial-paid'
                        };
                        let badgeClass = mapping[data.toLowerCase()] || 'status-inactive';
                        return '<span class="status-badge ' + badgeClass + '">' + data + '</span>';
                    }
                },
                {
                    data: 'order_status',
                    render: function (data) {
                        const mapping = {
                            'pending': 'status-pending',
                            'processing': 'status-processing',
                            'shipped': 'status-shipped',
                            'delivered': 'status-delivered',
                            'cancelled': 'status-cancelled'
                        };
                        let badgeClass = mapping[data.toLowerCase()] || 'status-inactive';
                        return '<span class="status-badge ' + badgeClass + '">' + data + '</span>';
                    }
                },
                { data: 'added_date' },
                { data: 'action', orderable: false, searchable: false }
            ],
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
            searching: true,
            pagingType: "full_numbers",
            order: [[0, "desc"]],
            scrollY: true,
            bScrollCollapse: true,
            language: {
                search: "",
                searchPlaceholder: "Search orders..."
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

        // Custom search input integration
        $('#serarch-filter-input').on('keyup', function () {
            table.search(this.value).draw();
        });
    },
    attachEvents: function () {
        $(document).on('click', '.update-status', function () {
            const orderId = $(this).data('id');
            const currentStatus = $(this).data('status');

            // For now, just a placeholder. We'll implement a proper modal later if needed.
            Swal.fire({
                title: 'Update Order Status',
                text: 'Select the new status for this order',
                input: 'select',
                inputOptions: {
                    'pending': 'Pending',
                    'processing': 'Processing',
                    'shipped': 'Shipped',
                    'delivered': 'Delivered',
                    'cancelled': 'Cancelled'
                },
                inputValue: currentStatus,
                showCancelButton: true,
                confirmButtonText: 'Update',
                cancelButtonText: 'Cancel',
                customClass: {
                    confirmButton: 'btn btn-primary me-3',
                    cancelButton: 'btn btn-label-secondary',
                    input: 'form-select'
                },
                buttonsStyling: false,
                showLoaderOnConfirm: true,
                preConfirm: (newStatus) => {
                    // Placeholder for AJAX status update
                    return new Promise((resolve) => {
                        setTimeout(() => {
                            resolve({ orderId, newStatus });
                        }, 500);
                    });
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    toaster("info", "Status update logic will be implemented in the next phase.");
                }
            });
        });
    }
};
