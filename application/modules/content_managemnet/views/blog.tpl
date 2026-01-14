
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
          <span >Blog</span>
        </div>
      </nav>

      <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
        <%* <button class="btn btn-seconday" type="button" id="downloadCSVBtn" title="Download CSV"><i class="ti ti-file-type-csv"></i></button>
        <button class="btn btn-seconday" type="button" id="downloadPDFBtn" title="Download PDF"><i class="ti ti-file-type-pdf"></i></button>
        <button class="btn btn-seconday filter-icon" type="button"><i class="ti ti-filter" ></i></i></button>
        <button class="btn btn-seconday" type="button"><i class="ti ti-refresh reset-filter"></i></button> *%>
        
        <%* <button type="button" class="btn btn-seconday" data-bs-toggle="modal" data-bs-target="#addFaq" title="Add FAQ">
       <i class="ti ti-plus"></i>
        </button> *%>
        <a href="add_blog" class="btn btn-seconday" title="Add Blog">
            <i class="ti ti-plus"></i>
        </a>

    
      </div>
     
      <div class="w-100">
            <input type="text" name="reason" placeholder="Filter Search" class="form-control serarch-filter-input m-3 me-0" id="serarch-filter-input" fdprocessedid="bxkoib">
        </div>

      <!-- Main content -->
      <div class="card p-0 mt-4 w-100">
        <div class="">

          <div class="table-responsive text-nowrap">
            <table width="100%" border="1" cellspacing="0" cellpadding="0" class="table table-striped" style="border-collapse: collapse;" border-color="#e1e1e1" id="faq">
              <thead class="table-dark">
                 <tr>
                    <!-- <th>Sr No</th> -->
                    <th>Title </th>
                    <th>Author </th>
                    <th>Status</th>
                    <th>Action</th>
                 </tr>
              </thead>
              <tbody>
              <%if ($blog) %>
                      <%assign var='i' value= 1 %>
                      <%foreach from=$blog item=val %>
                     <tr>
                        <!-- <td><%$i %></td> -->
                        
                        <td><%$val['title'] %></td>
                        <td><%$val['author'] %></td>
                       
                        <td>
                            <%if $val['status'] eq 'Active'%>
                                <span class="status-badge status-active">Active</span>
                            <%else%>
                                <span class="status-badge status-inactive">Inactive</span>
                            <%/if%>
                        </td>


                        <td>
                          
                        	<a href="add_blog?id=<%$val['blog_id']%>" title="Edit">
                            <i class="ti ti-edit edit-part"></i>
                        </a>
                        	
                       
                        </td>
                     </tr>
                  <%assign var='i' value=$i+1 %>
                  <%/foreach%>
                  <%/if%>
              
                 </tbody>
           </table>
          </div>
        </div>
        <!--/ Responsive Table -->
      </div>
      <!-- /.col -->


      <div class="content-backdrop fade"></div>
    </div>


    <script type="text/javascript">
    var base_url = <%$base_url|@json_encode%>
    </script>

    <script src="<%$base_url%>public/js/admin_panel/faq.js">"></script>
