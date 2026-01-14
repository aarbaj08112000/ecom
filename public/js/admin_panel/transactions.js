$(document).ready(function () {
    page.init();
});

var table = '';
const page = {
    init: function () {
        this.dataTable();
    },
    dataTable: function () {
        table = $("#transactions-table").DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: base_url + "payment/get_transactions_ajax",
                type: "POST"
            },
            columns: [
                { data: 'transaction_id' },
                { data: 'customer_name' },
                { data: 'amount' },
                { data: 'payment_method' },
                { data: 'paid_date' },
                {
                    data: 'payment_status',
                    className: 'text-center',
                    render: function (data) {
                        const mapping = {
                            'paid': 'status-active',
                            'completed': 'status-delivered',
                            'success': 'status-delivered',
                            'unpaid': 'status-inactive',
                            'pending': 'status-pending',
                            'failed': 'status-cancelled',
                            'refunded': 'status-returned',
                            'partially paid': 'status-pending'
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
                searchPlaceholder: "Search transactions..."
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
    }
};
