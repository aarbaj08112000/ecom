$(document).ready(function () {
    var table = $('#wishlist_table').DataTable({
        "processing": true,
        "serverSide": true,
        "ajax": {
            "url": base_url + "user/wishlist/wishlist_list_ajax",
            "type": "POST"
        },
        "columns": [
            {
                "data": "image_path",
                "orderable": false,
                "render": function (data, type, row) {
                    // data already contains the relative path constructed in controller
                    // But we'll verify if it exists/valid or use a fallback. 
                    // Using onerror to handle missing images elegantly.
                    const imgUrl = base_url + data;
                    const fallbackUrl = base_url + 'public/assets/img/elements/1.jpg';

                    return `<img src="${imgUrl}" 
                                 width="50" height="50" 
                                 class="rounded" 
                                 onerror="this.onerror=null;this.src='${fallbackUrl}';">`;
                }
            },
            { "data": "product_name" },
            { "data": "user_name" },
            { "data": "user_email" },
            { "data": "price" },
            { "data": "added_date" },
            {
                "data": "status",
                "render": function (data, type, row) {
                    let badgeClass = 'status-inactive';
                    if (data === 'Active') badgeClass = 'status-active';
                    else if (data === 'Inactive') badgeClass = 'status-inactive';

                    return '<span class="status-badge ' + badgeClass + '">' + data + '</span>';
                }
            }
        ],
        "order": [[5, "desc"]], // Sort by Added Date by default
        "language": {
            "searchPlaceholder": "Search wishlist...",
            "sSearch": "",
            "lengthMenu": "_MENU_",
        },
        "dom": "Bfrtilp",
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
});
