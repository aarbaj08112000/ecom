$(document).ready(function () {
	grid.init();
})

const grid = {
	init: function () {

	},
	setDefaultView: function (module_name) {
		var default_page_dispay = default_page_view_type[module_name];
		if (default_page_dispay == "Grid") {
			$(".toggle-grid-btn .table").removeClass("active");
			$(".toggle-grid-btn .grid").addClass("active");
		} else {
			$(".toggle-grid-btn .grid").removeClass("active");
			$(".toggle-grid-btn .table").addClass("active");
		}
	},
	gridStructure: function (module_name = "", row_data = [], no_data_message) {
		let that = this;
		grid_html = "";
		switch (module_name) {
			case "User":
				grid_html = `<div class="container grid-block-container"><div class="row w-100">`;
				if (row_data.length > 0) {

					for (var i = 0; i < row_data.length; i++) {
						var row_details = row_data[i]._aData;
						var status = row_details[5] == "Active" ? "active" : "inactive";
						var user_image = row_details[8] != "" && row_details[8] != null ? row_details[8] : "";
						var user_name = row_details[1] || "User";
						var first_letter = user_name.charAt(0).toUpperCase();

						// Generate avatar HTML
						var avatar_html = "";
						if (user_image) {
							avatar_html = `<img src="${user_image}" width="80" height="80" class="rounded-circle" style="object-fit: cover;">`;
						} else {
							avatar_html = `<div class="rounded-circle d-flex align-items-center justify-content-center" style="width: 80px; height: 80px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; font-size: 32px; font-weight: bold;">${first_letter}</div>`;
						}
						let row_html = `<div class="col-md-4 col-lg-3 mb-4">
				        <div class="card user-grid-card h-100" style="border-radius: 16px; box-shadow: 0 2px 8px rgba(0,0,0,0.08); transition: all 0.3s ease; border: 1px solid #e9ecef; position: relative; overflow: hidden;">
				            <!-- Edit Icon Button - Top Right -->
				            <a href="javascript:void(0)" class="position-absolute" style="top: 12px; right: 12px; z-index: 10; width: 36px; height: 36px; border-radius: 50%; background: rgba(255,255,255,0.95); box-shadow: 0 2px 6px rgba(0,0,0,0.12); display: flex; align-items: center; justify-content: center; transition: all 0.3s ease; border: 1px solid rgba(0,0,0,0.06);" 
				               title="Edit User" 
				               data-bs-toggle="modal" 
				               data-bs-target="#updatePromo${row_details[0]}"
				               onmouseover="this.style.background='#0d6efd'; this.style.transform='scale(1.1)'; this.querySelector('i').style.color='#fff';"
				               onmouseout="this.style.background='rgba(255,255,255,0.95)'; this.style.transform='scale(1)'; this.querySelector('i').style.color='#0d6efd';">
				                <i class="ti ti-edit" style="font-size: 18px; color: #0d6efd; transition: color 0.3s ease;"></i>
				            </a>
				            
				            <div class="card-body p-4">
				               <!-- User Avatar and Basic Info -->
				               <div class="text-center mb-3">
				                  <div class="position-relative d-inline-block">
				                     ${avatar_html}
				                     <div class="status-radius ${status}" style="position: absolute; bottom: 2px; right: 2px; width: 18px; height: 18px; border-radius: 50%; border: 3px solid #fff; box-shadow: 0 2px 4px rgba(0,0,0,0.15);"></div>
				                  </div>
				                  <h5 class="mb-1 mt-3 fw-bold" style="color: #2c3e50; font-size: 1.1rem;">${row_details[1]}</h5>
				                  <p class="text-muted mb-0" style="font-size: 0.85rem; font-weight: 500;">${row_details[4]}</p>
				               </div>
				               
				               <!-- Divider -->
				               <hr style="margin: 1rem 0; border-top: 1px solid #e9ecef;">
				               
				               <!-- User Details -->
				               <div class="user-details">
				                  <div class="mb-2 py-1">
				                     <i class="ti ti-phone" style="font-size: 14px; margin-right: 6px; color: #6c757d;"></i>
				                     <span class="text-muted" style="font-size: 0.85rem; font-weight: 500;">Mobile:</span>
				                     <span style="font-size: 0.85rem; font-weight: 600; color: #495057; margin-left: 4px;">${row_details[7] || 'N/A'}</span>
				                  </div>
				                  <div class="mb-2 py-1">
				                     <i class="ti ti-user" style="font-size: 14px; margin-right: 6px; color: #6c757d;"></i>
				                     <span class="text-muted" style="font-size: 0.85rem; font-weight: 500;">Gender:</span>
				                     <span style="font-size: 0.85rem; font-weight: 600; color: #495057; margin-left: 4px;">${row_details[6] || 'N/A'}</span>
				                  </div>
				                  <div class="mb-2 py-1">
				                     <i class="ti ti-mail" style="font-size: 14px; margin-right: 6px; color: #6c757d;"></i>
				                     <span class="text-muted" style="font-size: 0.85rem; font-weight: 500;">Email:</span>
				                     <span class="text-truncate d-inline-block" style="font-size: 0.85rem; font-weight: 600; color: #495057; margin-left: 4px; max-width: calc(100% - 80px); vertical-align: bottom;" title="${row_details[2]}">${row_details[2]}</span>
				                  </div>
				                  <div class="py-1">
				                     <i class="ti ti-calendar" style="font-size: 14px; margin-right: 6px; color: #6c757d;"></i>
				                     <span class="text-muted" style="font-size: 0.85rem; font-weight: 500;">Joined:</span>
				                     <span style="font-size: 0.85rem; font-weight: 600; color: #495057; margin-left: 4px;">${row_details[9] || 'N/A'}</span>
				                  </div>
				               </div>
				            </div>
				          </div>
				    </div>`;
						grid_html += row_html;
					}
				} else {
					grid_html += that.noDataFound(no_data_message);
				}
				grid_html += `</div></div>`;
				break;

			default:
				break;
		}

		return grid_html;
	},
	noDataFound: function (no_data_message) {
		no_data_html = `<div class="col-12 text-center grid-no-message mt-5 pt-5">${no_data_message}</div>`;
		return no_data_html;
	}
}