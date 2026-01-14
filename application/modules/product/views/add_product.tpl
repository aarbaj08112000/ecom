
    <!-- Include jQuery UI for Autocomplete -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <!-- Include Tokenfield JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-tokenfield/dist/bootstrap-tokenfield.min.js"></script>
    
    <div class="content-wrapper">
      <!-- Content -->
      <div class="container-xxl flex-grow-1 container-p-y">
        
        <!-- Page Header -->
        <div class="row align-items-center mb-4">
          <div class="col-md-6">
           

            <nav aria-label="breadcrumb">
            <div class="sub-header-left pull-left breadcrumb">
              <h1>
                Product
                <a hijacked="yes" href="javascript:void(0)" class="backlisting-link" title="Back to Issue Request Listing" >
                  <i class="ti ti-chevrons-right" ></i>
                  <em >Manage Product</em></a>
                </h1>
                <br>
                <span ><%if $product.id%>Update Product<%else%>Add New Product<%/if%></span>
              </div>
            </nav>
          </div>
          <div class="col-md-6 text-end">
            <a href="<%base_url('product_list')%>" class="btn btn-outline-secondary">
              <i class="ti ti-arrow-left me-2"></i>Back to Products
            </a>
          </div>
        </div>

        <!-- Main Form Card -->
        <div class="card shadow-sm border-0">
          <div class="card-body p-4">
            
            <form class="add_product custom-form" action="<%base_url('save_product_data')%>" method="POST" enctype="multipart/form-data" id="add_product">
              <input type="hidden" name="id" value="<%$product.id|default:''%>">
              <input type="hidden" name="deleted_images" id="deleted_images" value="">
              
              <!-- Section 1: Basic Information -->
              <div class="form-section mb-5">
                <div class="section-header mb-4">
                  <h5 class="fw-semibold text-primary mb-1">
                    <i class="ti ti-info-circle me-2"></i>Basic Information
                  </h5>
                  <p class="text-muted small mb-0">Enter the essential details about your product</p>
                </div>
                
                <div class="row g-3">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="product_name" class="form-label fw-medium">
                        Product Name<span class="text-danger ms-1">*</span>
                      </label>
                      <input type="text" class="form-control form-control-lg required-input" id="product_name" placeholder="e.g., Premium Wireless Headphones" name="product_name" value="<%$product.name|default:''%>">
                    </div>
                  </div>
                  
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="description" class="form-label fw-medium">
                        Description<span class="text-danger ms-1">*</span>
                      </label>
                      <input type="text" class="form-control form-control-lg required-input" id="description" placeholder="Brief description of the product" name="description" value="<%$product.detail|default:''%>">
                    </div>
                  </div>
                </div>
              </div>

              <!-- Section 2: Product Images -->
              <div class="form-section mb-5">
                <div class="section-header mb-4">
                  <h5 class="fw-semibold text-primary mb-1">
                    <i class="ti ti-photo me-2"></i>Product Images
                  </h5>
                  <p class="text-muted small mb-0">Upload high-quality images of your product (Max 2MB per image)</p>
                </div>
                
                <div class="row">
                  <div class="col-12">
                    <div class="upload-area border-2 border-dashed rounded-3 p-4 text-center bg-light">
                      <div class="mb-3">
                        <i class="ti ti-cloud-upload" style="font-size: 48px; color: #6c757d;"></i>
                      </div>
                      <label for="product_images" class="form-label fw-medium mb-2">
                        Choose Product Images<%if !$product.id%><span class="text-danger ms-1">*</span><%/if%>
                      </label>
                      <input type="file" class="form-control <%if !$product.id%>required-input<%/if%> d-none" id="product_images" name="product_images[]" multiple accept="image/jpeg,image/jpg,image/png,image/gif">
                      <button type="button" class="btn btn-primary" onclick="document.getElementById('product_images').click()">
                        <i class="ti ti-upload me-2"></i>Browse Images
                      </button>
                      <p class="text-muted small mt-2 mb-0">
                        Supported formats: JPG, JPEG, PNG, GIF • Maximum size: 2MB per file
                      </p>
                      <input type="hidden" name="cover_image_index" id="cover_image_index" value="">
                      <input type="hidden" name="cover_source" id="cover_source" value="">
                      <input type="hidden" name="cover_value" id="cover_value" value="">
                    </div>
                  </div>
                  
                  <!-- Existing Images -->
                  <div class="col-12 mt-4" id="existing-images-container">
                    <div class="row g-3">
                        <%if $product_images%>
                            <%foreach from=$product_images item=img%>
                                <div class="col-md-3 col-sm-6 existing-image-wrapper" data-id="<%$img.image_id%>">
                                    <div class="image-preview-card existing-image <%if $img.is_cover eq '1'%>is-cover<%/if%>" data-id="<%$img.image_id%>">
                                        <%if $img.is_cover eq '1'%><div class="cover-badge">Cover Image</div><%/if%>
                                        <button type="button" class="remove-image-btn remove-existing-btn" data-id="<%$img.image_id%>" title="Remove Image">&times;</button>
                                        <img src="<%base_url('public/uploads/products/')%><%$product.id%>/<%$img.image_path%>" alt="Product Image">
                                        <div class="image-info">
                                            <div><strong>Existing Image</strong></div>
                                        </div>
                                        <div class="cover-radio">
                                            <input type="radio" name="cover_radio" value="<%$img.image_id%>" data-source="existing" <%if $img.is_cover eq '1'%>checked<%/if%>>
                                            <label style="margin-left: 5px; font-size: 12px;">Set as Cover</label>
                                        </div>
                                    </div>
                                </div>
                            <%/foreach%>
                        <%/if%>
                    </div>
                  </div>

                  <!-- Image Preview Container (New Images) -->
                  <div class="col-12 mt-4" id="new-images-container">
                    <div id="image-preview-container" class="row g-3"></div>
                  </div>
                </div>
              </div>

              <!-- Section 3: Pricing & Inventory -->
              <div class="form-section mb-5">
                <div class="section-header mb-4">
                  <h5 class="fw-semibold text-primary mb-1">
                    <i class="ti ti-currency-rupee me-2"></i>Pricing & Inventory
                  </h5>
                  <p class="text-muted small mb-0">Set pricing, discount, and tax information</p>
                </div>
                
                <div class="row g-3">
                  <div class="col-md-3">
                    <div class="form-group">
                      <label for="price" class="form-label fw-medium">
                        Base Price<span class="text-danger ms-1">*</span>
                      </label>
                      <div class="input-group">
                        <span class="input-group-text">₹</span>
                        <input type="number" step="0.01" class="form-control required-input price-calc" id="price" placeholder="0.00" name="price" value="<%$product.price|default:''%>">
                      </div>
                    </div>
                  </div>

                  <div class="col-md-2">
                    <div class="form-group">
                      <label for="discount_percentage" class="form-label fw-medium">
                        Discount (%)
                      </label>
                      <div class="input-group">
                        <input type="number" step="0.01" class="form-control price-calc" id="discount_percentage" placeholder="0" name="discount_percentage" value="<%$product.discount_percentage|default:0%>" min="0" max="100">
                        <span class="input-group-text">%</span>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-2">
                    <div class="form-group">
                      <label for="is_gst_applicable" class="form-label fw-medium">
                        GST Applicable
                      </label>
                      <select name="is_gst_applicable" id="is_gst_applicable" class="form-control price-calc">
                        <option value="No" <%if $product.is_gst_applicable|default:'No' eq 'No'%>selected<%/if%>>No</option>
                        <option value="Yes" <%if $product.is_gst_applicable|default:'No' eq 'Yes'%>selected<%/if%>>Yes</option>
                      </select>
                    </div>
                  </div>

                  <div class="col-md-2">
                    <div class="form-group">
                      <label for="gst_percentage" class="form-label fw-medium">
                        GST (%)
                      </label>
                      <div class="input-group">
                        <input type="number" step="0.01" class="form-control price-calc" id="gst_percentage" placeholder="0" name="gst_percentage" value="<%$product.gst_percentage|default:0%>" min="0" max="100" <%if $product.is_gst_applicable|default:'No' eq 'No'%>disabled<%/if%>>
                        <span class="input-group-text">%</span>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-3">
                    <div class="form-group">
                      <label class="form-label fw-medium text-success">
                        Final Price (Calculated)
                      </label>
                      <div class="input-group">
                        <span class="input-group-text bg-success text-white">₹</span>
                        <input type="text" class="form-control fw-bold border-success text-success bg-white" id="final_price" readonly placeholder="0.00">
                      </div>
                    </div>
                  </div>

                  <div class="col-md-4 mt-3">
                    <div class="form-group">
                      <label for="stock_quantity" class="form-label fw-medium">
                        Stock Quantity<span class="text-danger ms-1">*</span>
                      </label>
                      <input type="number" class="form-control required-input" id="stock_quantity" placeholder="0" name="stock_quantity" min="0" value="<%$product.stock_quantity|default:''%>">
                    </div>
                  </div>
                  
                  <div class="col-md-4 mt-3">
                    <div class="form-group">
                      <label for="category" class="form-label fw-medium">
                        Category<span class="text-danger ms-1">*</span>
                      </label>
                      <select name="category" id="category" class="form-control required-input select2">
                        <option value="">Select Category</option>
                        <%foreach from=$categories item=category %>
                          <option value="<%$category.category_id %>" <%if $product.category_id|default:'' eq $category.category_id%>selected<%/if%>><%$category.category_name %></option>
                        <%/foreach %>
                      </select>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Section 4: Brand & Classification -->
              <div class="form-section mb-5">
                <div class="section-header mb-4">
                  <h5 class="fw-semibold text-primary mb-1">
                    <i class="ti ti-tag me-2"></i>Brand & Classification
                  </h5>
                  <p class="text-muted small mb-0">Select brand and organize your product</p>
                </div>
                
                <div class="row g-3">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="brand" class="form-label fw-medium">
                        Brand<span class="text-danger ms-1">*</span>
                      </label>
                      <select name="brand" id="brand" class="form-control form-control-lg required-input select2">
                        <option value="">Select Brand</option>
                        <%foreach from=$brands item=brand %>
                          <option value="<%$brand.brand_id %>" <%if $product.brand_id|default:'' eq $brand.brand_id%>selected<%/if%>><%$brand.brand_name %></option>
                        <%/foreach %>
                      </select>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Section 5: Product Attributes -->
              <div class="form-section mb-5">
                <div class="section-header mb-4">
                  <h5 class="fw-semibold text-primary mb-1">
                    <i class="ti ti-list-details me-2"></i>Product Attributes
                  </h5>
                  <p class="text-muted small mb-0">Add specifications like color, size, material, etc.</p>
                </div>
                
                <!-- Hidden template for attributes -->
                <select id="attribute-template" class="d-none">
                  <%foreach from=$attribute item=val %>
                    <option value="<%$val.attribute_id %>"><%$val.attribute_name %></option>
                  <%/foreach %>
                </select>
                
                <div class="attribute-fields">
                  <div class="row g-3 mb-3">
                    <div class="col-md-5">
                      <div class="form-group">
                        <label class="form-label fw-medium">Attribute Name<span class="text-danger ms-1">*</span></label>
                        <select name="attribute_name[]" class="form-control required-input select2">
                          <option value="">Select Attribute</option>
                          <%foreach from=$attribute item=val %>
                            <option value="<%$val.attribute_id %>"><%$val.attribute_name %></option>
                          <%/foreach %>
                        </select>
                      </div>
                    </div>
                    
                    <div class="col-md-5">
                      <div class="form-group">
                        <label class="form-label fw-medium">Attribute Value<span class="text-danger ms-1">*</span></label>
                        <input type="text" class="form-control required-input" placeholder="e.g., Red, Large, Cotton" name="attribute_value[]">
                      </div>
                    </div>
                    
                    <div class="col-md-2 d-flex align-items-end">
                      <button type="button" class="btn btn-success add-attribute">
                        <i class="ti ti-plus me-1"></i>
                      </button>
                    </div>
                  </div>
                  
                  <div id="attribute-container">
                    <%if $product_attributes%>
                        <%foreach from=$product_attributes item=attr%>
                             <div class="row mt-2">
                                <div class="col-md-4">
                                    <select name="attribute_name[]" class="form-control required-input select2">
                                        <option value="">Select Attribute</option>
                                        <%foreach from=$attribute item=val %>
                                            <option value="<%$val.attribute_id %>" <%if $attr.attribute_id eq $val.attribute_id%>selected<%/if%>><%$val.attribute_name %></option>
                                        <%/foreach %>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <input type="text" class="form-control required-input" placeholder="Enter Attribute Value" name="attribute_value[]" value="<%$attr.attribute_value%>">
                                </div>
                                <div class="col-md-2 d-flex align-items-end">
                                    <button type="button" class="btn btn-danger remove-attribute">-</button>
                                </div>
                            </div>
                        <%/foreach%>
                    <%/if%>
                  </div>
                </div>
              </div>

              <!-- Form Actions -->
              <div class="form-actions border-top pt-4 mt-5">
                <div class="row">
                  <div class="col-12">
                    <button type="submit" class="btn btn-primary  me-3">
                      Save Product
                    </button>
                    <a href="<%base_url('product_list')%>" class="btn btn-outline-secondary ">
                      Cancel
                    </a>
                  </div>
                </div>
              </div>
              
            </form>
            
          </div>
        </div>
        
      </div>

      <div class="content-backdrop fade"></div>
    </div>

    <style type="text/css">
      /* Form Section Styling */
      .form-section {
        padding: 1.5rem;
        background: #f8f9fa;
        border-radius: 10px;
        border-left: 4px solid #0d6efd;
      }
      
      .section-header h5 {
        color: #0d6efd;
        font-size: 1.1rem;
      }
      
      .form-label {
        color: #495057;
        margin-bottom: 0.5rem;
      }
      
      .form-control-lg {
        border-radius: 8px;
        border: 1px solid #dee2e6;
        padding: 0.75rem 1rem;
      }
      
      .form-control:focus {
        border-color: #0d6efd;
        box-shadow: 0 0 0 0.2rem rgba(13, 110, 253, 0.15);
      }
      
      /* Upload Area */
      .upload-area {
        background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
        transition: all 0.3s ease;
      }
      
      .upload-area:hover {
        background: linear-gradient(135deg, #e9ecef 0%, #dee2e6 100%);
      }
      
      /* Image Preview Styles */
      .image-preview-card {
        position: relative;
        border: 2px solid #e9ecef;
        border-radius: 12px;
        padding: 12px;
        transition: all 0.3s ease;
        cursor: pointer;
        background: white;
        box-shadow: 0 2px 4px rgba(0,0,0,0.05);
      }
      
      .image-preview-card:hover {
        border-color: #0d6efd;
        box-shadow: 0 4px 12px rgba(13, 110, 253, 0.15);
        transform: translateY(-2px);
      }
      
      .image-preview-card.is-cover {
        border-color: #28a745;
        background: linear-gradient(135deg, #f0f9f4 0%, #e8f5e9 100%);
        box-shadow: 0 4px 12px rgba(40, 167, 69, 0.2);
      }
      
      .image-preview-card img {
        width: 100%;
        height: 180px;
        object-fit: cover;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      }
      
      .cover-badge {
        position: absolute;
        top: 8px;
        left: 8px;
        background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
        color: white;
        padding: 6px 12px;
        border-radius: 6px;
        font-size: 11px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        z-index: 2;
        box-shadow: 0 2px 6px rgba(40, 167, 69, 0.3);
      }
      
      .remove-image-btn {
        position: absolute;
        top: 8px;
        right: 8px;
        background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);
        color: white;
        border: none;
        border-radius: 50%;
        cursor: pointer;
        font-size: 18px;
        line-height: 1;
        z-index: 2;
        box-shadow: 0 2px 6px rgba(220, 53, 69, 0.3);
        transition: all 0.2s ease;
      }
      
      .remove-image-btn:hover {
        background: linear-gradient(135deg, #c82333 0%, #bd2130 100%);
        transform: scale(1.1);
        box-shadow: 0 4px 8px rgba(220, 53, 69, 0.4);
      }
      
      .cover-radio {
        position: absolute;
        bottom: 12px;
        left: 50%;
        transform: translateX(-50%);
        background: white;
        padding: 6px 12px;
        border-radius: 20px;
        box-shadow: 0 2px 6px rgba(0,0,0,0.1);
      }
      
      .cover-radio input[type="radio"] {
        cursor: pointer;
        width: 16px;
        height: 16px;
      }
      
      .cover-radio label {
        cursor: pointer;
        margin-bottom: 0;
      }
      
      .image-info {
        margin-top: 10px;
        font-size: 13px;
        color: #6c757d;
        text-align: center;
        padding: 8px;
        background: #f8f9fa;
        border-radius: 6px;
      }
      
      /* Button Enhancements */
      . {
        padding: 0.75rem 1.5rem;
        font-size: 1rem;
        border-radius: 8px;
        font-weight: 500;
        transition: all 0.3s ease;
      }
      
      .btn-primary {
        background: linear-gradient(135deg, #0d6efd 0%, #0a58ca 100%);
        border: none;
      }
      
      .btn-primary:hover {
        background: linear-gradient(135deg, #0a58ca 0%, #084298 100%);
        transform: translateY(-1px);
        box-shadow: 0 4px 12px rgba(13, 110, 253, 0.3);
      }
      
      .btn-success {
        background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
        border: none;
      }
      
      .btn-success:hover {
        background: linear-gradient(135deg, #20c997 0%, #198754 100%);
        transform: translateY(-1px);
        box-shadow: 0 4px 12px rgba(40, 167, 69, 0.3);
      }
      
      .btn-outline-secondary {
        border-width: 2px;
      }
      
      .btn-outline-secondary:hover {
        transform: translateY(-1px);
      }
      
      /* Card Styling */
      .card {
        border-radius: 12px;
      }
      
      /* Required Field Indicator */
      input.required-check:checked {
        border-color: #0d6efd !important;
        background-color: #fc0d0d !important;
      }
      
      .required-check {
        position: absolute;
        top: -13px;
        right: -7px;
        width: 22px;
        height: 22px;
      }
      
      /* Responsive Adjustments */
      @media (max-width: 768px) {
        .form-section {
          padding: 1rem;
        }
        
        .section-header h5 {
          font-size: 1rem;
        }
        
        .image-preview-card img {
          height: 150px;
        }
      }
    </style>
    
    <script type="text/javascript">
      var base_url = <%$base_url|@json_encode%>
    </script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <script src="<%$base_url%>public/js/admin_panel/add_product.js"></script>
