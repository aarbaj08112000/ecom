
    <!-- Include jQuery UI for Autocomplete -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <!-- Include Tokenfield JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-tokenfield/dist/bootstrap-tokenfield.min.js"></script>
    <div class="content-wrapper">
  <!-- Content -->

  <div class="container-xxl flex-grow-1 container-p-y">
 

    <nav aria-label="breadcrumb">
      <div class="sub-header-left pull-left breadcrumb">
          <h1>
         Content Management
          <a hijacked="yes" href="javascript:void(0)" class="backlisting-link" title="Back to Issue Request Listing" >
            <i class="ti ti-chevrons-right" ></i>
            <em >Blog</em></a>
          </h1>
          <br>
          <span ><%$mode%> Blog</span>
        </div>
      </nav>
        <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
         <a href="<%base_url('blog')%>"  class="btn btn-seconday" title="Back To Blog Listing">
            <i class="ti ti-arrow-left"></i>
        </a>
        </div>
      <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
        <%* <button class="btn btn-seconday" type="button" id="downloadCSVBtn" title="Download CSV"><i class="ti ti-file-type-csv"></i></button>
        <button class="btn btn-seconday" type="button" id="downloadPDFBtn" title="Download PDF"><i class="ti ti-file-type-pdf"></i></button>
        <button class="btn btn-seconday filter-icon" type="button"><i class="ti ti-filter" ></i></i></button>
        <button class="btn btn-seconday" type="button"><i class="ti ti-refresh reset-filter"></i></button> *%>
        
       <!-- <button type="button" class="btn btn-seconday" data-bs-toggle="modal" data-bs-target="#addPromo" title="Add process">
       <i class="ti ti-plus"></i>
        </button> -->
       

      </div>
     

      <!-- Main content -->
      <div class="card p-0 mt-4 w-100">
        <div class="p-3">

        <form class="container mt-4 add_blog_data custom-form" id="add_blog_data" action="<%base_url('add_blog_data')%>" method="POST" enctype="multipart/form-data"  >
        <input type="hidden" name="id" value="<%$blog_data.blog_id%>">
        <div class="row g-3">
          <div class="col-md-6">
            <div class="form-group">
              <label for="title" class="form-label fs-6">Title<span class="text-danger ms-1">*</span></label>
              <input type="text" class="form-control required-input" id="title" placeholder="Enter blog title" name="title" value="<%$blog_data.title|default:''%>">
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label for="author" class="form-label fs-6">Author Name<span class="text-danger ms-1">*</span></label>
              <input type="text" class="form-control required-input" id="author" name="author" placeholder="Enter author name" value="<%$blog_data.author|default:''%>">
            </div>
          </div>
          <div class="col-md-12">
            <div class="form-group">
              <label for="content" class="form-label fs-6">Content<span class="text-danger ms-1">*</span></label>
              <textarea class="form-control required-input" id="content" name="content" placeholder="Enter blog content" rows="5"><%$blog_data.content|default:''%></textarea>
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label for="status" class="form-label fs-6">Status<span class="text-danger ms-1">*</span></label>
              <select class="form-control required-input" id="status" name="status">
                <option value="">Select Status</option>
                <option value="Active" <%if $blog_data.status|default:'' eq 'Active'%>selected<%/if%>>Active</option>
                <option value="Inactive" <%if $blog_data.status|default:'' eq 'Inactive'%>selected<%/if%>>Inactive</option>
              </select>
            </div>
          </div>
        </div>
      
        
      
      
        <div class="mt-3">
          <button type="submit" class="btn btn-primary">Submit</button>
        </div>
      </form>
         
        </div>
        <!--/ Responsive Table -->
      </div>
      <!-- /.col -->
    

      <div class="content-backdrop fade"></div>
    </div>

    <style type="text/css">
      input.required-check:checked {
          border-color: #0d6efd !important;
          background-color: #fc0d0d !important;
      }
      .required-check{
          position: absolute;
          top: -13px;
          right: -7px;
          width: 22px;
          height: 22px;
      }
      .cke_notification_warning {
        display: none !important;
      }
    </style>
    <script type="text/javascript">
    var base_url = <%$base_url|@json_encode%>
    
    // Initialize CKEditor (standard version already loaded in header.tpl)
    CKEDITOR.replace('content', {
        height: 400,
        toolbar: [
            { name: 'document', items: ['Source', '-', 'Preview'] },
            { name: 'clipboard', items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo'] },
            '/',
            { name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', '-', 'RemoveFormat'] },
            { name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote'] },
            { name: 'links', items: ['Link', 'Unlink'] },
            { name: 'insert', items: ['Image', 'Table', 'HorizontalRule'] },
            '/',
            { name: 'styles', items: ['Format'] },
            { name: 'tools', items: ['Maximize'] }
        ],
        format_tags: 'p;h1;h2;h3;h4;h5;h6',
        // Allow all HTML content
        allowedContent: true,
        // Simple image upload - paste images directly or use Link to external image
        removePlugins: 'elementspath',
        resize_enabled: true
    });
    </script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <script src="<%$base_url%>public/js/admin_panel/add_blog.js"></script>
