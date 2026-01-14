<div class="content-wrapper">
  <div class="container-xxl flex-grow-1 container-p-y">
    
    <!-- Breadcrumb & Actions -->
    <div class="d-flex justify-content-between align-items-center mb-4">
      <nav aria-label="breadcrumb">
            <div class="sub-header-left pull-left breadcrumb">
              <h1>
                Product
                <a hijacked="yes" href="javascript:void(0)" class="backlisting-link" title="Back to Issue Request Listing" >
                  <i class="ti ti-chevrons-right" ></i>
                  <em >Manage Product</em></a>
                </h1>
                <br>
                <span >Details</span>
              </div>
            </nav>
      <div class="d-flex gap-2">
        <a href="<%base_url('product_list')%>" class="btn btn-outline-secondary">
          <i class="ti ti-arrow-left me-1"></i> Back
        </a>
        <a href="<%base_url('add_product')%>?id=<%$product['id']%>" class="btn btn-primary">
          <i class="ti ti-edit me-1"></i> Edit Product
        </a>
      </div>
    </div>

    <div class="row g-4">
      <!-- Left Column: Image Gallery -->
      <div class="col-lg-6">
        <div class="card border-0 shadow-sm h-100 overflow-hidden">
          <div class="card-body p-4">
            
            <!-- Main Image -->
            <div class="main-image-container mb-3 text-center bg-light rounded-3 p-3 position-relative" style="min-height: 400px; display: flex; align-items: center; justify-content: center;">
               <%if $product_images|@count > 0 %>
                  <img id="mainImage" 
                       src="<%$base_url%>public/uploads/products/<%$product['id']%>/<%$product_images[0]['image_path']%>" 
                       class="img-fluid rounded-2" 
                       style="max-height: 400px; object-fit: contain;"
                       alt="<%$product['name']%>">
                  <%if $product_images[0]['is_cover'] == '1' %>
                    <span class="position-absolute top-0 start-0 m-3 badge bg-label-warning">Cover Image</span>
                  <%/if%>
                <%else %>
                  <img id="mainImage" 
                       src="https://www.rallis.com/Upload/Images/thumbnail/Product-inside.png" 
                       class="img-fluid rounded-2"
                       style="max-height: 400px; object-fit: contain;"
                       alt="No Image">
                <%/if %>
            </div>

            <!-- Thumbnails -->
            <%if $product_images|@count > 1 %>
            <div class="d-flex gap-2 overflow-auto pb-2" style="scrollbar-width: thin;">
              <%foreach $product_images as $img %>
                <div class="cursor-pointer border rounded-2 p-1 thumbnail-wrapper <%if $img@first%>border-primary<%/if%>" onclick="changeImage(this, '<%$base_url%>public/uploads/products/<%$product['id']%>/<%$img['image_path']%>')">
                  <img src="<%$base_url%>public/uploads/products/<%$product['id']%>/<%$img['image_path']%>" 
                       class="rounded-1" 
                       style="width: 70px; height: 70px; object-fit: cover;" 
                       alt="Thumbnail">
                </div>
              <%/foreach %>
            </div>
            <%/if %>
            
          </div>
        </div>
      </div>

      <!-- Right Column: Product Details -->
      <div class="col-lg-6">
        <div class="card border-0 shadow-sm h-100">
          <div class="card-body p-4 p-lg-5">
            
            <!-- Header -->
            <div class="mb-4">
                <div class="d-flex align-items-center gap-2 mb-2">
                    <%if !empty($brand_name) %>
                        <span class="badge bg-label-secondary"><%$brand_name%></span>
                    <%/if %>
                    <%if !empty($category_name) %>
                        <span class="badge bg-label-info"><%$category_name%></span>
                    <%/if %>
                     <span class="badge bg-<%if $product['status'] == 'Active'%>success<%else%>danger<%/if%>"><%$product['status']%></span>
                </div>
                <h1 class="display-6 fw-bold text-dark mb-2" style="font-family: var(--font-heading);"><%$product['name']%></h1>
                <div class="mb-4">
                    <div class="d-flex align-items-baseline gap-2 mb-1">
                        <h2 class="text-primary mb-0 fw-bold">₹<%($product['price'] - ($product['price'] * $product['discount_percentage'] / 100)) * (1 + ($product['gst_percentage'] / 100))|number_format:2%></h2>
                        <%if $product['discount_percentage'] > 0 || $product['gst_percentage'] > 0 %>
                            <span class="text-muted text-decoration-line-through small">₹<%$product['price']|number_format:2%></span>
                        <%/if%>
                    </div>
                    <div class="d-flex flex-wrap gap-2">
                        <%if $product['discount_percentage'] > 0 %>
                            <span class="badge bg-label-success"><i class="ti ti-discount-2 me-1"></i><%$product['discount_percentage']%>% Off</span>
                        <%/if%>
                        <%if $product['is_gst_applicable'] eq 'Yes' %>
                            <span class="badge bg-label-secondary">GST: <%$product['gst_percentage']%>%</span>
                        <%/if%>
                    </div>
                </div>
            </div>

            <!-- Key Stats -->
            <div class="row g-3 mb-4">
                <div class="col-6 col-md-4">
                    <div class="p-3 rounded-3 bg-light border border-dashed">
                        <small class="text-muted d-block text-uppercase fw-bold" style="font-size: 0.7rem;">Stock Available</small>
                        <span class="fs-5 fw-bold <%if $product['stock_quantity'] > 0%>text-dark<%else%>text-danger<%/if%>">
                            <%$product['stock_quantity']%>
                        </span>
                    </div>
                </div>
                <div class="col-6 col-md-4">
                    <div class="p-3 rounded-3 bg-light border border-dashed">
                        <small class="text-muted d-block text-uppercase fw-bold" style="font-size: 0.7rem;">Added By</small>
                        <span class="fs-6 text-dark">Admin</span> <small class="text-muted">(ID: <%$product['added_by']%>)</small>
                    </div>
                </div>
                 <div class="col-6 col-md-4">
                    <div class="p-3 rounded-3 bg-light border border-dashed">
                        <small class="text-muted d-block text-uppercase fw-bold" style="font-size: 0.7rem;">Added Date</small>
                        <span class="fs-6 text-dark"><%$product['added_date']|date_format:"%d M, %Y"%></span>
                    </div>
                </div>
            </div>

            <hr class="my-4 border-light">

            <!-- Description -->
            <%if !empty($product['detail']) %>
            <div class="mb-4">
                <h5 class="fw-bold mb-3"><i class="ti ti-file-description me-2 text-primary"></i>Description</h5>
                <p class="text-muted" style="line-height: 1.7;"><%$product['detail']|nl2br%></p>
            </div>
            <%/if %>

            <!-- Attributes / Specifications -->
            <%if $product_attributes|@count > 0 %>
            <div class="mb-4">
                <h5 class="fw-bold mb-3"><i class="ti ti-list-details me-2 text-primary"></i>Specifications</h5>
                <div class="row g-3">
                    <%foreach $product_attributes as $attr %>
                        <div class="col-md-6">
                            <div class="d-flex align-items-center p-2 rounded border bg-white">
                                <div class="badge bg-primary rounded-pill me-3 p-2"><i class="ti ti-check fs-6"></i></div>
                                <div>
                                    <small class="text-muted d-block"><%$attr['attribute_name']%></small>
                                    <span class="fw-medium text-dark"><%$attr['attribute_value']%></span>
                                </div>
                            </div>
                        </div>
                    <%/foreach %>
                </div>
            </div>
            <%/if %>

          </div>
        </div>
      </div>
      
    </div>
  </div>
</div>

<script>
function changeImage(wrapper, src) {
    // Update main image
    document.getElementById('mainImage').src = src;
    
    // Update active state
    document.querySelectorAll('.thumbnail-wrapper').forEach(el => {
        el.classList.remove('border-primary');
        el.classList.add('border-light'); // fallback
    });
    wrapper.classList.remove('border-light');
    wrapper.classList.add('border-primary');
}
</script>
