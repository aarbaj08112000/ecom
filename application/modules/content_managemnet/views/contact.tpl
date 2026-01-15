
<div class="content-wrapper">
  <!-- Content -->

  <div class="container-xxl flex-grow-1 container-p-y">
    <nav aria-label="breadcrumb">
      <div class="sub-header-left pull-left breadcrumb">
        <h1>
          Content Management
          <a hijacked="yes" href="javascript:void(0)" class="backlisting-link" title="Back to Listing" >
            <i class="ti ti-chevrons-right" ></i>
            <em >Contact Us</em></a>
          </h1>
          <br>
          <span >Contact Us</span>
        </div>
      </nav>

      <div class="dt-top-btn d-grid gap-2 d-md-flex justify-content-md-end mb-5">
        <%* Standard buttons can go here *%>
      </div>

      <div class="w-100">
            <input type="text" name="reason" placeholder="Filter Search" class="form-control serarch-filter-input m-3 me-0" id="serarch-filter-input">
        </div>

      <!-- Main content -->
      <div class="card p-0 mt-4 w-100">
        <div class="">
          <div class="table-responsive text-nowrap">
            <table width="100%" border="1" cellspacing="0" cellpadding="0" class="table table-striped" style="border-collapse: collapse;" border-color="#e1e1e1" id="contact_table">
              <thead class="table-dark">
                 <tr>
                    <th>Date</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Subject</th>
                    <th>Status</th>
                    <th>Action</th>
                 </tr>
              </thead>
              <tbody>
              <%if ($contacts) %>
                      <%assign var='i' value= 1 %>
                      <%foreach from=$contacts item=val %>
                     <tr>
                        <td><%$val['added_date']|date_format:"%d-%m-%Y %H:%M"%></td>
                        <td><%$val['name'] %></td>
                        <td><%$val['email'] %></td>
                        <td><%$val['subject'] %></td>
                        <td>
                            <select class="form-select form-select-sm status-change" data-id="<%$val['contact_id']%>" style="width: auto;">
                                <option value="New" <%if $val['status'] eq 'New'%>selected<%/if%>>New</option>
                                <option value="Read" <%if $val['status'] eq 'Read'%>selected<%/if%>>Read</option>
                                <option value="Replied" <%if $val['status'] eq 'Replied'%>selected<%/if%>>Replied</option>
                            </select>
                        </td>
                        <td>
                          <a href="javascript:void(0)" class="view-message" data-bs-toggle="modal" data-bs-target="#viewMessage<%$i %>" title="View Message">
                            <i class="ti ti-eye"></i>
                          </a>
                          <span class="delete_contact" title="Delete Record" data-id="<%$val['contact_id']%>">
                            <i class="ti ti-trash"></i>
                          </span>
                          
                          <!-- View Message Modal -->
                          <div class="modal fade" id="viewMessage<%$i %>" tabindex="-1" role="dialog" aria-labelledby="modalLabel<%$i %>" aria-hidden="true">
                             <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                                <div class="modal-content">
                                   <div class="modal-header">
                                      <h5 class="modal-title" id="modalLabel<%$i %>">Contact Message from <%$val['name']%></h5>
                                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                   </div>
                                   <div class="modal-body text-wrap">
                                      <div class="mb-3">
                                          <strong>Subject:</strong> <%$val['subject']%>
                                      </div>
                                      <div class="mb-3">
                                          <strong>Message:</strong><br>
                                          <div class="p-3 bg-light rounded mt-2">
                                              <%$val['message']|nl2br%>
                                          </div>
                                      </div>
                                      <hr>
                                      <div class="small text-muted">
                                          Submitted on: <%$val['added_date']%> | IP: <%$val['ip_address']%>
                                      </div>
                                   </div>
                                   <div class="modal-footer">
                                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                   </div>
                                </div>
                             </div>
                          </div>
                        </td>
                     </tr>
                  <%assign var='i' value=$i+1 %>
                  <%/foreach%>
                  <%/if%>
              
                 </tbody>
           </table>
          </div>
        </div>
      </div>
      <div class="content-backdrop fade"></div>
    </div>

    <script type="text/javascript">
    var base_url = <%$base_url|@json_encode%>
    </script>
    <script src="<%$base_url%>public/js/admin_panel/contact.js"></script>
