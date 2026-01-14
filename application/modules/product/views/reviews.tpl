<div class="container-xxl flex-grow-1 container-p-y">
    <nav aria-label="breadcrumb">
      <div class="sub-header-left pull-left breadcrumb">
        <h1>
           Manage Product
          <a hijacked="yes" href="javascript:void(0)" class="backlisting-link" title="Back to Issue Request Listing" >
            <i class="ti ti-chevrons-right" ></i>
            <em >Reviews & Ratings</em></a>
          </h1>
          <br>
          <span >Reviews & Ratings</span>
        </div>
    </nav>

    <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
        <!-- Buttons if any -->
    </div>

    <div class="w-100">
        <input type="text" name="reason" placeholder="Filter Search" class="form-control serarch-filter-input m-3 me-0" id="serarch-filter-input">
    </div>

    <!-- Hidden Filter Section (requested by user) -->
    <div class="card p-0 mt-4 w-100">
        <div class="card-header pb-0" style="display: none;">
            <div class="row g-3 mb-4 filter-section p-3 bg-light rounded">
                <div class="col-md-3">
                    <label class="form-label fw-semibold">Product</label>
                    <select class="form-select select2" id="product_filter">
                        <option value="">All Products</option>
                        <%foreach $products as $product%>
                            <option value="<%$product.id%>"><%$product.name%></option>
                        <%/foreach%>
                    </select>
                </div>
                <!-- ... other filters ... -->
            </div>
        </div>
        
        <div class="card-body p-0">
            <div class="table-responsive text-nowrap">
                <table class="table table-hover" id="reviews_table">
                    <thead>
                        <tr>
                            <th>Product Name</th>
                            <th>Reviewer</th>
                            <th>Rating</th>
                            <th>Comment</th>
                            <th>Status</th>
                            <th>Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                        <!-- Loaded via AJAX -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<style>
    .filter-section {
        border: 1px solid #e5e7eb;
    }
    .rating-stars {
        color: #ffc107;
        font-size: 14px;
    }
   
    .status-Approved { background-color: #dcfce7; color: #166534; }
    .status-Pending { background-color: #fef9c3; color: #854d0e; }
    .status-Rejected { background-color: #fee2e2; color: #991b1b; }
    
    .comment-text {
        max-width: 300px;
        white-space: normal;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }
</style>

<script type="text/javascript" src="<%$base_url%>public/js/admin_panel/reviews.js"></script>
