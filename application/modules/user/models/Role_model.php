<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Role_model extends CI_Model
{
    private $roles_table = 'roles';
    private $permissions_table = 'permissions';
    private $role_permissions_table = 'role_permissions';

    /**
     * Get all roles
     */
    public function get_all_roles()
    {
        $this->db->order_by('created_at', 'DESC');
        $query = $this->db->get($this->roles_table);
        return $query->result_array();
    }

    /**
     * Get role by ID
     */
    public function get_role_by_id($role_id)
    {
        $this->db->where('role_id', $role_id);
        $query = $this->db->get($this->roles_table);
        return $query->row_array();
    }

    /**
     * Create new role with permissions
     */
    public function create_role($role_data, $permissions = [])
    {
        // Start transaction
        $this->db->trans_start();
        
        // Insert role
        $this->db->insert($this->roles_table, $role_data);
        $role_id = $this->db->insert_id();
        
        // Insert permissions if provided
        if (!empty($permissions) && $role_id) {
            $this->save_role_permissions($role_id, $permissions);
        }
        
        // Complete transaction
        $this->db->trans_complete();
        
        return $this->db->trans_status();
    }

    /**
     * Update role with permissions
     */
    public function update_role($role_id, $role_data, $permissions = [])
    {
        // Start transaction
        $this->db->trans_start();
        
        // Update role
        $this->db->where('role_id', $role_id);
        $this->db->update($this->roles_table, $role_data);
        
        // Delete existing permissions
        $this->db->where('role_id', $role_id);
        $this->db->delete($this->role_permissions_table);
        
        // Insert new permissions
        if (!empty($permissions)) {
            $this->save_role_permissions($role_id, $permissions);
        }
        
        // Complete transaction
        $this->db->trans_complete();
        
        return $this->db->trans_status();
    }

    /**
     * Save role permissions
     */
    private function save_role_permissions($role_id, $permissions)
    {
        $permission_data = [];
        
        foreach ($permissions as $module => $actions) {
            foreach ($actions as $action => $value) {
                if ($value == '1') {
                    $permission_data[] = [
                        'role_id' => $role_id,
                        'module' => $module,
                        'action' => $action,
                        'created_at' => date('Y-m-d H:i:s')
                    ];
                }
            }
        }
        
        if (!empty($permission_data)) {
            $this->db->insert_batch($this->role_permissions_table, $permission_data);
        }
    }

    /**
     * Get role permissions
     */
    public function get_role_permissions($role_id)
    {
        $this->db->where('role_id', $role_id);
        $query = $this->db->get($this->role_permissions_table);
        $permissions = $query->result_array();
        
        // Format permissions for easy access
        $formatted = [];
        foreach ($permissions as $perm) {
            $formatted[$perm['module']][$perm['action']] = 1;
        }
        
        return $formatted;
    }

    /**
     * Delete role
     */
    public function delete_role($role_id)
    {
        // Start transaction
        $this->db->trans_start();
        
        // Delete role permissions
        $this->db->where('role_id', $role_id);
        $this->db->delete($this->role_permissions_table);
        
        // Delete role
        $this->db->where('role_id', $role_id);
        $this->db->delete($this->roles_table);
        
        // Complete transaction
        $this->db->trans_complete();
        
        return $this->db->trans_status();
    }

    /**
     * Get roles for DataTables
     */
    public function get_roles_datatable($params)
    {
        $this->db->from($this->roles_table);
        
        if (!empty($params['search'])) {
            $this->db->group_start();
            $this->db->like('role_name', $params['search']);
            $this->db->or_like('role_description', $params['search']);
            $this->db->group_end();
        }
        
        $this->db->order_by($params['order_column'], $params['order_dir']);
        $this->db->limit($params['length'], $params['start']);
        
        return $this->db->get()->result_array();
    }

    /**
     * Get total roles count or filtered count
     */
    public function get_roles_count($search = '')
    {
        $this->db->from($this->roles_table);
        
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('role_name', $search);
            $this->db->or_like('role_description', $search);
            $this->db->group_end();
        }
        
        return $this->db->count_all_results();
    }

    /**
     * Check if user has permission
     */
    public function has_permission($role_id, $module, $action)
    {
        $this->db->where('role_id', $role_id);
        $this->db->where('module', $module);
        $this->db->where('action', $action);
        $query = $this->db->get($this->role_permissions_table);
        
        return $query->num_rows() > 0;
    }
}
