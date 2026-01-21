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
						let row_html = `<div class="col-md-4 col-lg-3">
						        <div class="card mb-4">
						            <div class="card-body p-4">
						               <div class="d-flex align-items-center mb-3">
						                  <div class="position-relative me-3">
						                     ${avatar_html}
						                     <div class="status-radius ${status}" style="position: absolute; bottom: 5px; right: 5px;"></div>
						                  </div>
						                  <div class="flex-grow-1">
						                     <h5 class="mb-1 fw-bold">${row_details[1]}</h5>
						                     <p class="text-muted mb-0 small">${row_details[4]}</p>
						                  </div>
						               </div>
						               
						               <div class="user-details mb-3">
						                  <div class="d-flex justify-content-between mb-2">
						                     <span class="text-muted small">Mobile:</span>
						                     <span class="small fw-semibold">${row_details[7] || 'N/A'}</span>
						                  </div>
						                  <div class="d-flex justify-content-between mb-2">
						                     <span class="text-muted small">Gender:</span>
						                     <span class="small fw-semibold">${row_details[6] || 'N/A'}</span>
						                  </div>
						                  <div class="mb-2">
						                     <span class="text-muted small d-block mb-1">Email</span>
						                     <span class="small fw-semibold text-truncate d-block" title="${row_details[2]}">${row_details[2]}</span>
						                  </div>
						                  <div class="d-flex justify-content-between">
						                     <span class="text-muted small">Joining Date</span>
						                     <span class="small fw-semibold">${row_details[9] || 'N/A'}</span>
						                  </div>
						               </div>
						               
						               <div class="text-center">
						                  <a class="btn btn-outline-primary btn-sm w-100" href="javascript:void(0)" title="Edit" data-bs-toggle="modal" data-bs-target="#updatePromo${row_details[0]}">
						                     <i class="ti ti-edit me-1"></i> Edit
						                  </a>
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