<style>
  /* Status Badge & Pills */
  .status-badge {
    padding: 6px 12px;
    border-radius: 30px;
    font-size: 0.8rem;
    font-weight: 600;
  }
  .status-active { background: rgba(16, 185, 129, 0.1); color: #059669; }
  .status-pending { background: rgba(245, 158, 11, 0.1); color: #d97706; }
  .status-inactive { background: rgba(100, 116, 139, 0.1); color: #64748b; }
  .status-blocked { background: rgba(239, 68, 68, 0.1); color: #ef4444; }
  .status-rejected { background: rgba(239, 68, 68, 0.1); color: #ef4444; }

  /* Ensure Action column icons are horizontal */
  .action-btns .ti {
    font-size: 1.2rem;
  }
</style>

<div class="container-xxl flex-grow-1 container-p-y">
    <nav aria-label="breadcrumb">
      <div class="sub-header-left pull-left breadcrumb">
        <h1>
           Reports & Analytics
          <a hijacked="yes" href="javascript:void(0)" class="backlisting-link" title="Back to Reports" >
            <i class="ti ti-chevrons-right" ></i>
            <em >Reports</em></a>
          </h1>
          <br>
          <span >Low Stock Report</span>
        </div>
      </nav>

      <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
        <button class="btn btn-seconday" type="button" id="downloadCSVBtn" title="Download CSV"><i class="ti ti-file-type-csv"></i></button>
        <button class="btn btn-seconday" type="button" id="downloadPDFBtn" title="Download PDF"><i class="ti ti-file-type-pdf"></i></button>
      </div>
    
      <div class="w-100">
            <input type="text" name="reason" placeholder="Filter Search" class="form-control serarch-filter-input m-3 me-0" id="serarch-filter-input">
        </div>

      <div class="card p-0 mt-4 w-100">
        <div class="card-datatable table-responsive">
          <table class="table table-striped align-middle" id="low_stock_report" style="border-collapse: collapse; width: 100%;">
            <thead class="table-light">
              <tr>
                <th>Image</th>
                <th>Product Name</th>
                <th>Category</th>
                <th class="text-center">Current Stock</th>
                <th>Price (₹)</th>
                <th>Status</th>
                <th class="text-center">Action</th>
              </tr>
            </thead>
            <tbody>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <div class="content-backdrop fade"></div>

  <script type="text/javascript">
    var base_url = <%$base_url|@json_encode%>;
  </script>

  <script src="<%$base_url%>public/js/admin_panel/low_stock_report.js"></script>
