$(document).ready(function () {
  page.init();



});
var table = '';
var file_name = "item_par_list";
var pdf_title = "Item part List";
const page = {
  init: function () {
    this.dataTable();
    this.formInitiate();
    $("#group_code").on("input", function () {
      let value = $(this).val();
      $(this).val((value.replace(/[^a-zA-Z_]/g, '')).toLowerCase());
    })

    // Function to update attribute options to prevent duplicates
    const updateAttributeOptions = function () {
      var selectedAttributes = [];
      // Collect all selected values
      $('select[name="attribute_name[]"]').each(function () {
        var val = $(this).val();
        if (val) {
          selectedAttributes.push(val);
        }
      });

      // Update each dropdown
      $('select[name="attribute_name[]"]').each(function () {
        var currentVal = $(this).val();
        $(this).find('option').each(function () {
          var optionVal = $(this).val();
          // Disable if selected in another dropdown (not the current one)
          if (optionVal && selectedAttributes.includes(optionVal) && optionVal !== currentVal) {
            $(this).prop('disabled', true);
          } else {
            $(this).prop('disabled', false);
          }
        });

        // Refresh Select2 to show disabled options correctly
        if ($(this).hasClass("select2-hidden-accessible")) {
          $(this).select2();
        }
      });
    };

    $(".select2").select2();

    // Initialize Attribute Options on Load
    updateAttributeOptions();

    // Initialize Cover Image State on Load
    const checkedCover = $("input[name='cover_radio']:checked");
    if (checkedCover.length) {
      const source = checkedCover.data('source');
      const value = checkedCover.val();
      $("#cover_source").val(source);
      $("#cover_value").val(value);
      if (source === 'new') {
        $("#cover_image_index").val(value);
      }
    }

    $(".add-attribute").click(function () {
      var attributeOptions = $("#attribute-template").html(); // Get options from the hidden template
      var newField = `
                <div class="row mt-2">
                    <div class="col-md-4">
                        <select name="attribute_name[]" class="form-control required-input select2">
                            <option value="">Select Attribute</option>
                            ` + attributeOptions + `
                        </select>
                    </div>
                    <div class="col-md-4">
                        <input type="text" class="form-control required-input" placeholder="Enter Attribute Value" name="attribute_value[]">
                    </div>
                    <div class="col-md-2 d-flex align-items-end">
                        <button type="button" class="btn btn-danger remove-attribute">-</button>
                    </div>
                </div>
            `;
      $("#attribute-container").append(newField);
      $(".select2").select2();
      updateAttributeOptions(); // Update options after adding
    });

    $(document).on("click", ".remove-attribute", function () {
      $(this).closest(".row").remove();
      updateAttributeOptions(); // Update options after removing
    })

    // Update options when a selection changes
    $(document).on("change", 'select[name="attribute_name[]"]', function () {
      updateAttributeOptions();
    });

    // Image Preview and Cover Selection
    let selectedFiles = [];

    $("#product_images").on("change", function (e) {
      const files = Array.from(e.target.files);
      selectedFiles = []; // Reset new files
      $("#image-preview-container").html(''); // Clear preview of NEW files

      if (files.length === 0) {
        return;
      }

      // Validate files
      let validationError = '';
      const maxSize = 2 * 1024 * 1024; // 2MB in bytes
      const allowedTypes = ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'];

      files.forEach((file, index) => {
        // Check file type
        if (!allowedTypes.includes(file.type)) {
          validationError = `Invalid file type for "${file.name}". Only JPG, JPEG, PNG, and GIF are allowed.`;
          return false;
        }

        // Check file size
        if (file.size > maxSize) {
          validationError = `File "${file.name}" exceeds 2MB size limit.`;
          return false;
        }

        selectedFiles.push(file);
      });

      if (validationError) {
        toaster("error", validationError);
        $(this).val(''); // Clear file input
        return;
      }

      // Default: if no existing cover is selected, make first new image cover
      // But only if we aren't editing or user hasn't explicitly chosen an existing cover?
      // For simplicity: If user uploads new files, we default cover to first new file UNLESS they click back on an existing one.
      // Actually, let's just show them and let user decide.
      // Auto-select first new image as cover IF there are no existing images? 
      // Safe bet: first new image is cover 'candidate', user can switch.

      // Let's reset cover selection to "new" - index 0
      $("#cover_source").val('new');
      $("#cover_value").val(0);
      $(".existing-image").removeClass("is-cover");
      $(".cover-badge").remove();
      $("input[name='cover_radio']").prop('checked', false);


      // Generate previews
      selectedFiles.forEach((file, index) => {
        const reader = new FileReader();

        reader.onload = function (e) {
          const isCover = index === 0; // First new image is cover by default
          const fileSize = (file.size / 1024).toFixed(2); // Convert to KB

          const previewCard = `
                        <div class="col-md-3 col-sm-6 new-image-wrapper">
                            <div class="image-preview-card new-image ${isCover ? 'is-cover' : ''}" data-index="${index}">
                                ${isCover ? '<div class="cover-badge">Cover Image</div>' : ''}
                                <button type="button" class="remove-image-btn remove-new-btn" data-index="${index}" title="Remove Image">&times;</button>
                                <img src="${e.target.result}" alt="${file.name}">
                                <div class="image-info">
                                    <div><strong>${file.name.substring(0, 20)}${file.name.length > 20 ? '...' : ''}</strong></div>
                                    <div>${fileSize} KB</div>
                                </div>
                                <div class="cover-radio">
                                    <input type="radio" name="cover_radio" value="${index}" data-source="new" ${isCover ? 'checked' : ''}>
                                    <label style="margin-left: 5px; font-size: 12px;">Set as Cover</label>
                                </div>
                            </div>
                        </div>
                    `;

          $("#image-preview-container").append(previewCard);
        };

        reader.readAsDataURL(file);
      });
    });

    // Handle cover image selection (Delegated for both new and existing)
    $(document).on("change", "input[name='cover_radio']", function () {
      const source = $(this).data('source'); // 'new' or 'existing'
      const value = $(this).val(); // index or ID

      $("#cover_source").val(source);
      $("#cover_value").val(value);
      $("#cover_image_index").val(source === 'new' ? value : ''); // Specific for new files, legacy support

      // Update UI
      $(".image-preview-card").removeClass("is-cover");
      $(".cover-badge").remove();

      // Find the card. 
      // If new: data-index matches value.
      // If existing: data-id matches value.
      let selectedCard;
      if (source === 'new') {
        selectedCard = $(`.new-image[data-index="${value}"]`);
      } else {
        selectedCard = $(`.existing-image[data-id="${value}"]`);
      }

      if (selectedCard.length) {
        selectedCard.addClass("is-cover");
        selectedCard.prepend('<div class="cover-badge">Cover Image</div>');
      }
    });

    // Handle remove NEW image
    $(document).on("click", ".remove-new-btn", function (e) {
      e.stopPropagation();
      const indexToRemove = parseInt($(this).data("index"));

      // Remove from selectedFiles array
      selectedFiles.splice(indexToRemove, 1);

      // Recreate file input with remaining files
      const dt = new DataTransfer();
      selectedFiles.forEach(file => dt.items.add(file));
      $("#product_images")[0].files = dt.files;

      // Remove preview card
      $(this).closest(".new-image-wrapper").remove();

      // Reindex remaining new cards
      $(".new-image").each(function (newIndex) {
        $(this).attr("data-index", newIndex);
        $(this).find(".remove-new-btn").attr("data-index", newIndex);
        $(this).find("input[name='cover_radio']").val(newIndex);
      });

      // If we removed the cover, and it was a 'new' image, reset cover?
      // For now, if no cover selected, user must select one. 
      if (selectedFiles.length === 0) {
        $("#image-preview-container").html('');
      }
    });

    // Handle remove EXISTING image
    $(document).on("click", ".remove-existing-btn", function (e) {
      e.stopPropagation();
      const idToRemove = $(this).data("id");

      // Add to deleted_images input
      let deleted = $("#deleted_images").val();
      let deletedArr = deleted ? deleted.split(',') : [];
      deletedArr.push(idToRemove);
      $("#deleted_images").val(deletedArr.join(','));

      // Remove UI
      $(this).closest(".existing-image-wrapper").remove();
    });


    $(document).on("click", ".delete_data", function () {
      var attribute_id = $(this).data("id"); // Get category ID

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
            url: "delete_attributes", // Your backend PHP file
            type: "POST",
            data: { attribute_id: attribute_id },
            dataType: "json",
            success: function (response) {
              //  response = JSON.parse(response);
              if (response.success == 1) {
                Swal.fire("Deleted!", response.msg, "success").then(() => {
                  location.reload();
                });
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

    // Pricing calculation logic
    const calculateFinalPrice = function () {
      const basePrice = parseFloat($("#price").val()) || 0;
      const discountPercent = parseFloat($("#discount_percentage").val()) || 0;
      const isGstApplicable = $("#is_gst_applicable").val();
      const gstPercentInput = $("#gst_percentage");

      let gstPercent = 0;
      if (isGstApplicable === 'Yes') {
        gstPercentInput.prop('disabled', false);
        gstPercent = parseFloat(gstPercentInput.val()) || 0;
      } else {
        gstPercentInput.prop('disabled', true).val(0);
      }

      // Calculate: Price - Discount + GST
      const priceAfterDiscount = basePrice - (basePrice * (discountPercent / 100));
      const finalPrice = priceAfterDiscount + (priceAfterDiscount * (gstPercent / 100));

      $("#final_price").val(finalPrice.toFixed(2));
    };

    // Attach listeners for pricing fields
    $(document).on("input change", ".price-calc", function () {
      calculateFinalPrice();
    });

    // Initial calculation for edit mode
    calculateFinalPrice();
  },
  dataTable: function () {
    table = $("#attributes").DataTable({
      dom: "Bfrtilp",
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
  formInitiate: function () {
    let that = this;
    $(".add_product,.update_attributes").submit(function (e) {
      e.preventDefault();
      var href = $(this).attr("action");
      var id = $(this).attr("id");
      let flag = that.formValidate(id);
      if (flag) {
        return;
      }
      var formData = new FormData($('.' + id)[0]);
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
            $(this).parents(".modal").modal("hide")
            setTimeout(function () {
              window.location.reload();
            }, 1000);

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
  formValidate: function (form_class = '') {
    let flag = false;
    $(".custom-form." + form_class + " .required-input").each(function (index) {
      var value = $(this).val();
      var dataMax = parseFloat($(this).attr('data-max'));
      var dataMin = parseFloat($(this).attr('data-min'));
      if (value == '') {
        flag = true;
        var label = $(this).parents(".form-group").find("label").contents().filter(function () {
          return this.nodeType === 3; // Filter out non-text nodes (nodeType 3 is Text node)
        }).text().trim();
        var exit_ele = $(this).parents(".form-group").find("label.error");
        if (exit_ele.length == 0) {
          var start = "Please enter ";
          if ($(this).prop("localName") == "select") {
            var start = "Please select ";
          }
          label = ((label.toLowerCase()).replace("enter", "")).replace("select", "");
          var validation_message = start + (label.toLowerCase()).replace(/[^\w\s*]/gi, '');
          var label_html = "<label class='error'>" + validation_message + "</label>";
          $(this).parents(".form-group").append(label_html)
        }
      }
      else if (dataMin !== undefined && dataMin > value) {
        flag = true;
        var label = $(this).parents(".form-group").find("label").contents().filter(function () {
          return this.nodeType === 3; // Filter out non-text nodes (nodeType 3 is Text node)
        }).text().trim();
        var exit_ele = $(this).parents(".form-group").find("label.error");
        if (exit_ele.length == 0) {
          var end = " must be greater than or equal to " + dataMin;
          label = ((label.toLowerCase()).replace("enter", "")).replace("select", "");
          label = (label.toLowerCase()).replace(/[^\w\s*]/gi, '');
          label = label.charAt(0).toUpperCase() + label.slice(1);
          var validation_message = label + end;
          var label_html = "<label class='error'>" + validation_message + "</label>";
          $(this).parents(".form-group").append(label_html)
        }
      } else if (dataMax !== undefined && dataMax < value) {
        flag = true;
        var label = $(this).parents(".form-group").find("label").contents().filter(function () {
          return this.nodeType === 3; // Filter out non-text nodes (nodeType 3 is Text node)
        }).text().trim();
        var exit_ele = $(this).parents(".form-group").find("label.error");
        if (exit_ele.length == 0) {
          var end = " must be less than or equal to " + dataMax;
          label = ((label.toLowerCase()).replace("enter", "")).replace("select", "");
          label = (label.toLowerCase()).replace(/[^\w\s*]/gi, '');
          label = label.charAt(0).toUpperCase() + label.slice(1)
          var validation_message = label + end;
          var label_html = "<label class='error'>" + validation_message + "</label>";
          $(this).parents(".form-group").append(label_html)
        }
      }
    });

    // Validate images - check if files are uploaded OR existing images are present
    if (form_class === 'add_product') {
      const imageInput = $("#product_images")[0];
      const newFilesCount = imageInput.files ? imageInput.files.length : 0;
      const existingFilesCount = $(".existing-image-wrapper").length;

      if (newFilesCount === 0 && existingFilesCount === 0) {
        flag = true;
        toaster("error", "Please select at least one product image.");
      }
    }

    return flag;
  }

}


