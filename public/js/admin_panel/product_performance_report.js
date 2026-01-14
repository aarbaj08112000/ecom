$(document).ready(function () {
    performancePage.init();
});

var performanceTable = '';
var file_name = "Product Performance Report";
var pdf_title = "Product Performance Report";

const performancePage = {
    init: function () {
        this.dataTable();
    },
    dataTable: function () {
        performanceTable = $("#sales_report").DataTable({ // Using the same ID from TPL
            dom: "Bfrtilp",
            serverSide: true,
            ajax: {
                url: base_url + "report/report/get_product_performance_ajax",
                type: "POST"
            },
            columns: [
                {
                    data: null,
                    render: function (data, type, row, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1;
                    }
                },
                { data: 'product_name' },
                { data: 'category_name' },
                { data: 'total_orders' },
                { data: 'qty_sold' },
                {
                    data: 'total_revenue',
                    render: function (data) {
                        return '₹' + parseFloat(data).toLocaleString('en-IN', { minimumFractionDigits: 2 });
                    }
                },
                { data: 'return_qty' },
                {
                    data: 'return_percentage',
                    render: function (data) {
                        return data + '%';
                    }
                },
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
                    className: 'text-center',
                    render: function (data) {
                        return `<a href="${base_url}product_performance_details?id=${data}" title="View"><i class="ti ti-eye"></i></a>`;
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
                    filename: file_name
                },
                {
                    extend: "pdf",
                    text: '<i class="ti ti-file-type-pdf"></i>',
                    init: function (api, node, config) {
                        $(node).attr("title", "Download PDF");
                    },
                    filename: file_name,
                    customize: function (doc) {
                        doc.pageMargins = [15, 15, 15, 15];
                        doc.content[0].text = pdf_title;
                        doc.content[1].table.widths = Array(doc.content[1].table.body[0].length).fill('*');
                        doc.content[1].table.body.forEach(function (row) {
                            row.forEach(function (cell) {
                                cell.alignment = "center";
                            });
                        });
                    }
                }
            ],
            searching: true,
            scrollY: true,
            bScrollCollapse: true,
            pagingType: "full_numbers"
        });

        $('#serarch-filter-input').on('keyup', function () {
            performanceTable.search(this.value).draw();
        });

        // Fix layout for DataTables length select
        setTimeout(function () {
            $(".dataTables_length select").select2({
                minimumResultsForSearch: Infinity
            });
        }, 1000);
    }
};
