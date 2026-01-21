$(document).ready(function () {
  // Check if base_url is defined
  if (typeof base_url === 'undefined' || base_url === null) {
    console.error('base_url is not defined. Please ensure it is set in the template.');
    return;
  }

  // Remove quotes from base_url if present
  const cleanBaseUrl = base_url.replace(/"/g, '');

  page.init(cleanBaseUrl);

  $(document).on("click", ".delete_data", function () {
    var categoryId = $(this).data("id");

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
          url: cleanBaseUrl + "delete_category",
          type: "POST",
          data: { category_id: categoryId },
          dataType: "json",
          success: function (response) {
            if (response.success == 1) {
              Swal.fire("Deleted!", response.msg, "success");
              table.ajax.reload(null, false);
            } else {
              Swal.fire("Error!", response.msg, "error");
            }
          },
          error: function () {
            Swal.fire("Error!", "Something went wrong.", "error");
          }
        });
      }
    });
  });

  // Handle Edit Category Modal Dynamically
  $(document).on("click", ".edit-category", function () {
    const id = $(this).data('id');
    const name = $(this).data('name');
    const parentId = $(this).data('parent');
    const status = $(this).data('status');

    $('#edit_category_id').val(id);
    $('#edit_category_name').val(name);
    $('#edit_parent_category_id').val(parentId).trigger('change');
    $('#edit_status').val(status).trigger('change');

    $('#updateCategoriesModal').modal('show');
  });
});

var table = '';
var file_name = "categories_list";
var pdf_title = "Categories List";

const page = {
  init: function (baseUrl) {
    this.dataTable(baseUrl);
    this.formInitiate(baseUrl);
    $(".select2").select2();
  },

  dataTable: function (baseUrl) {
    table = $("#categories").DataTable({
      processing: true,
      serverSide: true,
      ajax: {
        url: baseUrl + "categories_ajax",
        type: "POST"
      },
      dom: "Brtilp", // Removed 'f' to hide default search
      buttons: [
        {
          extend: "csv",
          text: '<i class="ti ti-file-type-csv"></i>',
          title: 'Categories List',
          exportOptions: {
            columns: [0, 1, 2]
          }
        },
        {
          extend: "pdf",
          text: '<i class="ti ti-file-type-pdf"></i>',
          title: 'Categories List',
          exportOptions: {
            columns: [0, 1, 2]
          }
        },
      ],
      columns: [
        { data: 'category_name' },
        { data: 'parent_name' },
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
          render: function (data, type, row) {
            return `
                            <a href="javascript:void(0)" class="edit-category" 
                               data-id="${data}" 
                               data-name="${row.category_name}" 
                               data-parent="${row.parent_category_id}" 
                               data-status="${row.status}" 
                               title="Edit">
                                <i class="ti ti-edit"></i>
                            </a>
                            <span class="delete_data" title="Delete Record" data-id="${data}">
                                <i class="ti ti-trash"></i>
                            </span>
                        `;
          }
        }
      ],
      order: [[0, 'asc']],
      pagingType: "full_numbers",
      scrollY: true,
      bScrollCollapse: true,
      language: {
        processing: "Loading categories...",
        emptyTable: "No categories found",
        zeroRecords: "No matching categories found"
      }
    });

    // Live Search Filter
    $('#serarch-filter-input').on('keyup input', function () {
      table.search(this.value).draw();
    });

    $('.dataTables_length').find('label').contents().filter(function () {
      return this.nodeType === 3;
    }).remove();

    setTimeout(function () {
      $(".dataTables_length select").select2({
        minimumResultsForSearch: Infinity
      });
    }, 100);
  },

  formInitiate: function (baseUrl) {
    let that = this;
    $(".addCategories, .update_categories").submit(function (e) {
      e.preventDefault();
      var href = $(this).attr("action");
      var id = $(this).attr("id");
      let flag = that.formValidate(id);
      if (flag) {
        return;
      }
      var formData = new FormData($(this)[0]);
      $.ajax({
        type: "POST",
        url: href,
        data: formData,
        processData: false,
        contentType: false,
        success: function (response) {
          var responseObject = JSON.parse(response);
          var msg = responseObject.msg;
          var success = responseObject.success;
          if (success == 1) {
            toaster("success", msg);
            $(".modal").modal("hide");
            table.ajax.reload(null, false);
            // If it's add, we might want to refresh parent category selects
            if (id === 'addCategoriesForm') {
              setTimeout(() => window.location.reload(), 1000);
            }
          } else {
            toaster("error", msg);
          }
        },
        error: function (error) {
          console.error("Error:", error);
        },
      });
    });
  },

  formValidate: function (form_id = '') {
    let flag = false;
    $("#" + form_id + " .required-input").each(function () {
      var value = $(this).val();
      if (value === null || value === '') {
        flag = true;
        var label = $(this).parents(".form-group").find("label").contents().filter(function () {
          return this.nodeType === 3;
        }).text().trim();
        var exit_ele = $(this).parents(".form-group").find("label.error");
        if (exit_ele.length == 0) {
          var start = "Please enter ";
          if ($(this).prop("localName") == "select") {
            var start = "Please select ";
          }
          var validation_message = start + (label.toLowerCase()).replace(/[^\w\s*]/gi, '');
          var label_html = "<label class='error'>" + validation_message + "</label>";
          $(this).parents(".form-group").append(label_html);
        }
      } else {
        $(this).parents(".form-group").find("label.error").remove();
      }
    });
    return flag;
  }
}
