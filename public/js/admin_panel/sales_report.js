$(document).ready(function () {
    page.init();
});
var table = '';
var file_name = "sale Report";
var pdf_title = "Sales Report";
const page = {
    init: function () {
        this.dataTable();

    },
    dataTable: function () {
        table = $("#sales_report").DataTable({
            dom: "Bfrtilp",
            serverSide: true,
            ajax: {
                url: base_url + "report/report/get_sales_report_ajax",
                type: "POST"
            },
            columns: [
                { data: 'invoice_no', render: function (data) { return '<strong>' + data + '</strong>'; } },
                { data: 'customer_name' },
                { data: 'customer_code' },
                { data: 'order_date' },
                { data: 'product_name' },
                { data: 'category_name' },
                { data: 'quantity' },
                { data: 'rate' },
                { data: 'total_amount' },
                { data: 'discount', render: function (data) { return '₹' + data; } },
                { data: 'tax', render: function (data) { return '₹' + data; } },
                { data: 'net_amount', render: function (data) { return '<strong>₹' + data + '</strong>'; } },
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
                {
                    data: 'id',
                    orderable: false,
                    render: function (data) {
                        return `
                        <a href="${base_url}sales_view?id=${data}" class="text-primary me-2" title="View">
                            <i class="ti ti-eye"></i>
                        </a>
                        <a href="${base_url}sales/edit/${data}" class="text-warning me-2" title="Edit">
                            <i class="ti ti-pencil"></i>
                        </a>
                        <a href="${base_url}sales/delete/${data}" class="text-danger" title="Delete" onclick="return confirm('Are you sure you want to delete this sale?')">
                            <i class="ti ti-trash"></i>
                        </a>
                    `;
                    }
                }
            ],
            buttons: [
                {
                    extend: "csv",
                    text: '<i class="ti ti-file-type-csv"></i>',
                    init: function (api, node, config) {
                        $(node).attr("title", "Download CSV");
                    },
                    customize: function (csv) {
                        var lines = csv.split('\n');
                        var modifiedLines = lines.map(function (line) {
                            var values = line.split(',');
                            // values.splice(7, 1);
                            return values.join(',');
                        });
                        return modifiedLines.join('\n');
                    },
                    filename: file_name
                },

                {
                    extend: "pdf",
                    text: '<i class="ti ti-file-type-pdf"></i>',
                    init: function (api, node, config) {
                        $(node).attr("title", "Download Pdf");
                    },
                    filename: file_name,
                    customize: function (doc) {
                        doc.pageMargins = [15, 15, 15, 15];
                        doc.content[0].text = pdf_title;
                        doc.content[0].color = theme_color;
                        doc.content[1].table.widths = ["50%", "50%"];
                        doc.content[1].table.body[0].forEach(function (cell) {
                            cell.fillColor = theme_color;
                        });
                        doc.content[1].table.body.forEach(function (row, index) {
                            // row.splice(7, 1);
                            row.forEach(function (cell) {
                                // Set alignment for each cell
                                cell.alignment = "center"; // Change to 'left' or 'right' as needed
                            });
                        });
                    },
                },
            ],
            searching: true,
            // scrollX: true,
            scrollY: true,
            bScrollCollapse: true,
            // columnDefs: [{ sortable: false, targets: 7 }],
            pagingType: "full_numbers",


        });
        $('#serarch-filter-input').on('keyup', function () {
            table.search(this.value).draw();
        });
        $('.dataTables_length').find('label').contents().filter(function () {
            return this.nodeType === 3; // Filter out text nodes
        }).remove();
        setTimeout(function () {
            $(".dataTables_length select").select2({
                minimumResultsForSearch: Infinity
            });
        }, 1000)
    },


}


