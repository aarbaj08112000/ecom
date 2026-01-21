<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Customer extends MY_Controller {
	public function __construct() {
        parent::__construct();
        $this->load->model('Customer_model');
    }
	public function index() {
		$data['base_url'] = base_url();
		$this->smarty->loadView('login.tpl',$data,'No','No');
	}
	/* add update Customer module */

	public function customer_list()
	{
		$data['base_url'] = base_url();
		$data['customer_list'] = $this->Customer_model->getCustomerData();
		$this->smarty->loadView('customer_list.tpl', $data,'Yes','Yes');
	}
	
	public function customer_details($id_encoded = 0)
	{
		$id = (is_numeric($id_encoded)) ? $id_encoded : base64_decode(urldecode($id_encoded));
		$data['base_url'] = base_url();
		$data['customer'] = $this->Customer_model->getCustomerById($id);
		$data['addresses'] = $this->Customer_model->getCustomerAddresses($id);
		$data['banks'] = $this->Customer_model->getCustomerBanks($id);
		
        // Fetch internal reviews
        $this->load->model('Customer_reviews_model');
        $data['internal_reviews'] = $this->Customer_reviews_model->get_reviews_by_customer($id);

		$this->smarty->loadView('customer_details.tpl', $data,'Yes','Yes');
	}

    public function update_customer_status()
    {
        $id = $this->input->post('id');
        $status = $this->input->post('status');

        if ($this->Customer_model->updateStatus($id, $status)) {
            echo json_encode(array('success' => 1, 'msg' => 'Status updated successfully to ' . $status));
        } else {
            echo json_encode(array('success' => 0, 'msg' => 'Failed to update status.'));
        }
    }

    public function update_customer_profile()
    {
        $id = $this->input->post('customer_id');
        $data = array(
            'customer_name' => $this->input->post('customer_name'),
            'email' => $this->input->post('email'),
            'mobile_no' => $this->input->post('mobile_no'),
            'gst_no' => $this->input->post('gst_no'),
            'pan_no' => $this->input->post('pan_no')
        );

        if ($this->Customer_model->updateCustomer($id, $data)) {
            echo json_encode(array('success' => 1, 'msg' => 'Customer profile updated successfully.'));
        } else {
            echo json_encode(array('success' => 0, 'msg' => 'Failed to update profile.'));
        }
    }

    public function customer_edit($id_encoded = 0)
    {
        $id = (is_numeric($id_encoded)) ? $id_encoded : base64_decode(urldecode($id_encoded));
        $data['base_url'] = base_url();
        $data['customer'] = $this->Customer_model->getCustomerById($id);
        $data['addresses'] = $this->Customer_model->getCustomerAddresses($id);
        $data['banks'] = $this->Customer_model->getCustomerBanks($id);
        
        $this->smarty->loadView('customer_edit.tpl', $data,'Yes','Yes');
    }

    public function update_full_customer()
    {
        $id = $this->input->post('customer_id');
        
        // Handle Master Data
        $master_data = array(
            'customer_name' => $this->input->post('customer_name'),
            'email'         => $this->input->post('email'),
            'mobile_no'     => $this->input->post('mobile_no'),
            'gst_no'        => $this->input->post('gst_no'),
            'pan_no'        => $this->input->post('pan_no'),
            'dob'           => $this->input->post('dob'),
            'gender'        => $this->input->post('gender'),
            'identity_details' => $this->input->post('identity_details'),
            'status'        => $this->input->post('status'),
            'update_date'   => date('Y-m-d H:i:s'),
            'update_by'     => 1 // Placeholder for session user ID
        );

        // Handle Image Upload
        if (!empty($_FILES['profile_image']['name'])) {
            $upload_path = './public/images/customers/';
            if (!is_dir($upload_path)) {
                mkdir($upload_path, 0777, true);
                chmod($upload_path, 0777); // Ensure permissions
            }

            $config['upload_path']   = $upload_path;
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $config['file_name']     = 'cust_' . $id . '_' . time();
            
            $this->load->library('upload', $config);
            $this->upload->initialize($config); // Re-initialize to ensure config is applied
            
            if ($this->upload->do_upload('profile_image')) {
                $upload_data = $this->upload->data();
                $master_data['profile_image'] = $upload_data['file_name'];
            } else {
                $error = $this->upload->display_errors('', '');
                echo json_encode(array('success' => 0, 'msg' => 'Image Upload Error: ' . $error));
                return;
            }
        }

        // Handle Address Data (First record)
        $address_data = array(
            'address'  => $this->input->post('address'),
            'city'     => $this->input->post('city'),
            'state'    => $this->input->post('state'),
            'pincode'  => $this->input->post('pincode')
        );

        // Handle Bank Data (First record)
        $bank_data = array(
            'account_holder_name' => $this->input->post('account_holder_name'),
            'bank_name'           => $this->input->post('bank_name'),
            'account_no'         => $this->input->post('account_no'),
            'ifsc_code'          => $this->input->post('ifsc_code'),
            'branch_name'        => $this->input->post('branch_name')
        );

        if ($this->Customer_model->updateAllCustomerData($id, $master_data, $address_data, $bank_data)) {
            echo json_encode(array('success' => 1, 'msg' => 'Customer profile updated successfully.'));
        } else {
            echo json_encode(array('success' => 0, 'msg' => 'Failed to update customer profile.'));
        }
    }

    public function delete_customer()
    {
        $id = $this->input->post('id');
        if ($this->Customer_model->deleteCustomer($id)) {
            echo json_encode(array('success' => 1, 'msg' => 'Customer deleted successfully.'));
        } else {
            echo json_encode(array('success' => 0, 'msg' => 'Failed to delete customer.'));
        }
    }

    public function customer_list_ajax()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search_value = $this->input->post('search')['value'] ?? '';
        $order_column_index = $this->input->post('order')[0]['column'] ?? 0;
        $order_dir = $this->input->post('order')[0]['dir'] ?? 'desc';
        
        $columns = ['profile_image', 'customer_code', 'customer_name', 'mobile_no', 'email', 'gst_no', 'pan_no', 'status', 'id', 'id'];
        $order_column = $columns[$order_column_index] ?? 'id';
        
        $customers = $this->Customer_model->getCustomerPaged($start, $length, $search_value, $order_column, $order_dir);
        $total_records = $this->Customer_model->getTotalCustomers();
        $filtered_records = $this->Customer_model->getFilteredCustomersCount($search_value);
        
        $data = [];
        $base_url = base_url();
        $i = $start + 1;
        
        foreach ($customers as $val) {
            // Image Logic
            $image_html = '';
            if ($val['profile_image']) {
                $image_html = '<img src="'.$base_url.'public/uploads/customers/'.$val['profile_image'].'" class="rounded-circle" width="40" height="40" style="object-fit: cover;">';
            } else {
                $avatar_name = urlencode($val['customer_name']);
                $image_html = '<img src="https://ui-avatars.com/api/?name='.$avatar_name.'&background=random&color=fff" class="rounded-circle" width="40" height="40">';
            }

            // Status Logic (Static Badge Display)
            $badge_class = ($val['status'] == 'Active' || $val['status'] == 'Approved') ? 'status-active' : 'status-inactive';
            $status_label = ($val['status'] == 'Active' || $val['status'] == 'Approved') ? 'Active' : 'Inactive';
            $status_html = '<span class="status-badge '.$badge_class.'">'.$status_label.'</span>';

            // Action Logic (Dots Menu with Conditional Status Update Toggle)
            $is_active = ($val['status'] == 'Active' || $val['status'] == 'Approved');
            $status_toggle_html = $is_active ? 
                '<a class="dropdown-item d-flex align-items-center py-2 status-update-link" href="javascript:void(0);" data-id="'.$val['id'].'" data-status="Inactive">
                    <i class="ti ti-circle-x me-2 text-warning" style="font-size: 1.2rem;"></i> <span>Set Inactive</span>
                </a>' : 
                '<a class="dropdown-item d-flex align-items-center py-2 status-update-link" href="javascript:void(0);" data-id="'.$val['id'].'" data-status="Active">
                    <i class="ti ti-circle-check me-2 text-success" style="font-size: 1.2rem;"></i> <span>Set Active</span>
                </a>';

            $action_html = '
                <div class="dropdown text-center">
                    <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                        <i class="ti ti-dots-vertical" style="color: #ff3e1d; font-size: 1.5rem;"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-end shadow-sm border-0" style="min-width: 150px;">
                        <a class="dropdown-item d-flex align-items-center py-2" href="'.$base_url.'customer_details/'.urlencode(base64_encode($val['id'])).'">
                            <i class="ti ti-eye me-2 text-info" style="font-size: 1.2rem;"></i> <span>View Details</span>
                        </a>
                        <a class="dropdown-item d-flex align-items-center py-2" href="'.$base_url.'customer_edit/'.urlencode(base64_encode($val['id'])).'">
                            <i class="ti ti-pencil me-2 text-primary" style="font-size: 1.2rem;"></i> <span>Edit Profile</span>
                        </a>
                        <div class="dropdown-divider"></div>
                        <h6 class="dropdown-header">Update Status</h6>
                        '.$status_toggle_html.'
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item d-flex align-items-center py-2 delete-customer" href="javascript:void(0);" data-id="'.$val['id'].'">
                            <i class="ti ti-trash me-2 text-danger" style="font-size: 1.2rem;"></i> <span>Delete</span>
                        </a>
                    </div>
                </div>';

            $data[] = [
                'image' => $image_html,
                'customer_code' => $val['customer_code'],
                'customer_name' => $val['customer_name'],
                'mobile_no' => $val['mobile_no'],
                'email' => $val['email'],
                'gst_no' => $val['gst_no'],
                'pan_no' => $val['pan_no'],
                'status' => $status_html,
                'orders' => $val['total_order_count'],
                'action' => $action_html
            ];
        }
        
        $response = [
            'draw' => intval($draw),
            'recordsTotal' => $total_records,
            'recordsFiltered' => $filtered_records,
            'data' => $data
        ];
        
        echo json_encode($response);
    }
}

