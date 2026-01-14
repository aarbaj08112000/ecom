<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Email_marketing extends MY_Controller {
	public function __construct() {
        parent::__construct();
        $this->load->model('Email_marketing_model');
    }
	public function index() {
		$this->email_marketing();
	}
	
	public function email_marketing()
	{
		$data['base_url'] = base_url();
		$data['stats'] = $this->Email_marketing_model->get_dashboard_stats();
		$data['campaigns'] = $this->Email_marketing_model->get_campaigns(); // Fetch all
		$this->smarty->loadView('email_marketing.tpl', $data, 'Yes', 'Yes');
	}

	public function get_campaigns_list()
	{
		$limit = $this->input->post('length') ? $this->input->post('length') : 10;
		$start = $this->input->post('start') ? $this->input->post('start') : 0;
		$search = isset($this->input->post('search')['value']) ? $this->input->post('search')['value'] : '';

		$totalData = $this->Email_marketing_model->get_campaign_count();
		$totalFiltered = $this->Email_marketing_model->get_campaign_count($search);
		$campaigns = $this->Email_marketing_model->get_campaigns($limit, $start, $search);

		$data = array();
		if(!empty($campaigns)) {
			foreach ($campaigns as $val) {
				$nestedData = array();
				$nestedData[] = "<strong>".$val['campaign_name']."</strong>";
				
				$status_class = "primary";
				if($val['status'] == 'Completed' || $val['status'] == 'Sent') $status_class = "success";
				if($val['status'] == 'Draft') $status_class = "warning";
				
				$nestedData[] = '<span class="badge bg-label-'.$status_class.'">'.$val['status'].'</span>';
				$nestedData[] = ucfirst($val['target_audience']);
				$nestedData[] = $val['sent_count'];
				$nestedData[] = $val['open_count'];
				$nestedData[] = $val['click_count'];
				$nestedData[] = ($val['status'] == 'Scheduled') ? "Scheduled: ".date('M d, Y', strtotime($val['scheduled_date'])) : date('M d, Y', strtotime($val['added_date']));
				
				$actions = '<div class="dropdown">
								<button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="ti ti-dots-vertical"></i></button>
								<div class="dropdown-menu">
									<a class="dropdown-item edit_campaign" href="javascript:void(0);" data-id="'.$val['id'].'"><i class="ti ti-pencil me-1"></i> Edit</a>
									<a class="dropdown-item delete_campaign" href="javascript:void(0);" data-id="'.$val['id'].'"><i class="ti ti-trash me-1"></i> Delete</a>
								</div>
							</div>';
				$nestedData[] = $actions;
				$data[] = $nestedData;
			}
		}

		$json_data = array(
			"draw"            => intval($this->input->post('draw')),
			"recordsTotal"    => intval($totalData),
			"recordsFiltered" => intval($totalFiltered),
			"data"            => $data
		);

		echo json_encode($json_data);
	}

	public function save_campaign()
	{
		$id = $this->input->post('id');
		$data = [
			'campaign_name' => $this->input->post('campaign_name'),
			'subject' => $this->input->post('subject'),
			'content' => $this->input->post('content'),
			'target_audience' => $this->input->post('target_audience'),
			'scheduled_date' => $this->input->post('scheduled_date'),
			'status' => $this->input->post('status') ? $this->input->post('status') : 'Draft',
		];

		if ($id) {
			$data['updated_date'] = date('Y-m-d H:i:s');
			$data['updated_by'] = $this->session->userdata('user_id');
			$result = $this->Email_marketing_model->update_campaign($id, $data);
			$message = "Campaign updated successfully.";
		} else {
			$data['added_date'] = date('Y-m-d H:i:s');
			$data['added_by'] = $this->session->userdata('user_id');
			$result = $this->Email_marketing_model->add_campaign($data);
			$message = "Campaign created successfully.";
		}

		if ($result) {
			echo json_encode(['success' => 1, 'messages' => $message]);
		} else {
			echo json_encode(['success' => 0, 'messages' => "Something went wrong."]);
		}
	}

	public function get_campaign($id)
	{
		$campaign = $this->Email_marketing_model->get_campaign_by_id($id);
		echo json_encode($campaign);
	}

	public function delete_campaign()
	{
		$id = $this->input->post('id');
		$data = [
			'is_delete' => 1,
			'updated_date' => date('Y-m-d H:i:s'),
			'updated_by' => $this->session->userdata('user_id')
		];
		$result = $this->Email_marketing_model->update_campaign($id, $data);
		if ($result) {
			echo json_encode(['success' => 1, 'messages' => "Campaign deleted successfully."]);
		} else {
			echo json_encode(['success' => 0, 'messages' => "Failed to delete campaign."]);
		}
	}

	public function export_campaigns()
	{
		$search = $this->input->get('search');
		$campaigns = $this->Email_marketing_model->get_all_campaigns_for_export($search);
		
		header('Content-Type: text/csv; charset=utf-8');
		header('Content-Disposition: attachment; filename=email_campaigns_'.date('Ymd').'.csv');
		$output = fopen('php://output', 'w');
		fputcsv($output, array('Campaign Name', 'Subject', 'Target Audience', 'Scheduled Date', 'Status', 'Sent', 'Opens', 'Clicks', 'Date Created'));
		
		if (!empty($campaigns)) {
			foreach ($campaigns as $row) {
				fputcsv($output, $row);
			}
		}
		fclose($output);
	}
}

