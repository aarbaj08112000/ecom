$(document).ready(function () {
    page.init();
});

var table = '';
const page = {
    init: function () {
        this.dataTable();
        this.events();
    },
    dataTable: function () {
        table = $("#refunds-table").DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: base_url + "payment/get_refunds_ajax",
                type: "POST"
            },
            columns: [
                { data: 'gateway_refund_id' },
                { data: 'customer_name' },
                { data: 'refund_amount' },
                { data: 'added_date' },
                {
                    data: 'refund_status',
                    className: 'text-center',
                    render: function (data) {
                        const mapping = {
                            'approved': 'status-delivered',
                            'completed': 'status-delivered',
                            'success': 'status-delivered',
                            'processing': 'status-processing',
                            'pending': 'status-pending',
                            'rejected': 'status-cancelled',
                            'failed': 'status-cancelled'
                        };
                        let badgeClass = mapping[data.toLowerCase()] || 'status-inactive';
                        return '<span class="status-badge ' + badgeClass + '">' + data + '</span>';
                    }
                },
                { data: 'action', orderable: false, searchable: false, className: 'text-center' }
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
                searchPlaceholder: "Search refunds..."
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
    events: function () {
        $(document).on('click', '.approve-refund', function () {
            const id = $(this).data('id');
            Swal.fire({
                title: 'Approve Refund?',
                text: "Are you sure you want to approve this refund?",
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#28c76f',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, approve it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Future implementation for status update
                    Swal.fire('Approved!', 'Refund #' + id + ' approval process started.', 'success');
                }
            });
        });

        $(document).on('click', '.reject-refund', function () {
            const id = $(this).data('id');
            Swal.fire({
                title: 'Reject Refund?',
                text: "Are you sure you want to reject this refund?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#ea5455',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, reject it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Future implementation for status update
                    Swal.fire('Rejected!', 'Refund #' + id + ' rejection process started.', 'info');
                }
            });
        });
    }
};
