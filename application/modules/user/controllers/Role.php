<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Role extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('user/Role_model');
    }

    /**
     * Display role management page
     */
    public function role_management()
    {
        // We no longer pre-load all roles here since we'll use server-side DataTables
        
        // Set page data
        $data['title'] = 'Role Management';
        $data['base_url'] = base_url();
        
        // Load view
        $this->smarty->loadView('role_management.tpl', $data, 'Yes', 'Yes');
    }

    /**
     * Get roles for DataTables (AJAX)
     */
    public function roles_ajax()
    {
        // DataTables parameters
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search_value = $this->input->post('search')['value'] ?? '';
        $order_column_index = $this->input->post('order')[0]['column'] ?? 0;
        $order_dir = $this->input->post('order')[0]['dir'] ?? 'desc';
        
        // Column mapping (0=role_name, 1=description, 2=status, 3=created_at, 4=action)
        $columns = ['role_name', 'role_description', 'status', 'created_at'];
        $order_column = $columns[$order_column_index] ?? 'role_id';
        
        // Prepare parameters
        $params = [
            'start' => $start,
            'length' => $length,
            'search' => $search_value,
            'order_column' => $order_column,
            'order_dir' => $order_dir
        ];
        
        // Get data
        $roles = $this->Role_model->get_roles_datatable($params);
        $total_records = $this->Role_model->get_roles_count();
        $filtered_records = $this->Role_model->get_roles_count($search_value);
        
        // Prepare response
        $data = [];
        foreach ($roles as $role) {
            $data[] = [
                'role_id' => $role['role_id'],
                'role_name' => $role['role_name'],
                'role_description' => $role['role_description'],
                'status' => $role['status'],
                'created_at' => $role['created_at']
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

    /**
     * Add new role (AJAX)
     */
    public function addRole()
    {
        if ($this->input->method() === 'post') {
            // Get form data
            $role_data = [
                'role_name' => $this->input->post('role_name'),
                'role_description' => $this->input->post('role_description'),
                'status' => $this->input->post('status'),
                'created_at' => date('Y-m-d H:i:s')
            ];
            
            // Get permissions
            $permissions = $this->input->post('permissions');
            
            // Insert role and permissions
            $result = $this->Role_model->create_role($role_data, $permissions);
            
            if ($result) {
                echo json_encode([
                    'status' => 'success',
                    'message' => 'Role created successfully'
                ]);
            } else {
                echo json_encode([
                    'status' => 'error',
                    'message' => 'Failed to create role'
                ]);
            }
        }
    }

    /**
     * Update existing role (AJAX)
     */
    public function updateRole()
    {
        if ($this->input->method() === 'post') {
            $role_id = $this->input->post('role_id');
            
            // Get form data
            $role_data = [
                'role_name' => $this->input->post('role_name'),
                'role_description' => $this->input->post('role_description'),
                'status' => $this->input->post('status'),
                'updated_at' => date('Y-m-d H:i:s')
            ];
            
            // Get permissions
            $permissions = $this->input->post('permissions');
            
            // Update role and permissions
            $result = $this->Role_model->update_role($role_id, $role_data, $permissions);
            
            if ($result) {
                echo json_encode([
                    'status' => 'success',
                    'message' => 'Role updated successfully'
                ]);
            } else {
                echo json_encode([
                    'status' => 'error',
                    'message' => 'Failed to update role'
                ]);
            }
        }
    }

    /**
     * Get role permissions (AJAX)
     */
    public function getRolePermissions($role_id)
    {
        $permissions = $this->Role_model->get_role_permissions($role_id);
        echo json_encode($permissions);
    }

    /**
     * Delete role (AJAX)
     */
    public function deleteRole()
    {
        if ($this->input->method() === 'post') {
            $role_id = $this->input->post('role_id');
            
            $result = $this->Role_model->delete_role($role_id);
            
            if ($result) {
                echo json_encode([
                    'status' => 'success',
                    'message' => 'Role deleted successfully'
                ]);
            } else {
                echo json_encode([
                    'status' => 'error',
                    'message' => 'Failed to delete role'
                ]);
            }
        }
    }
}
