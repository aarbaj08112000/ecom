<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Customer_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function getCustomerData()
    {
        $this->db->select('*');
        $this->db->from('customer_master as c');
        $this->db->where('c.is_delete', '0');
        $query = $this->db->get(); 
        return $query->result_array(); 
    }

    public function updateCustomer($id, $data)
    {
        $this->db->where('id', $id);
        return $this->db->update('customer_master', $data);
    }

    public function updateStatus($id, $status)
    {
        $this->db->where('id', $id);
        return $this->db->update('customer_master', array('status' => $status));
    }

    public function updateAllCustomerData($id, $master_data, $address_data, $bank_data)
    {
        $this->db->trans_start();

        // Update Master
        $this->db->where('id', $id);
        $this->db->update('customer_master', $master_data);

        // Update Address (Assuming simple sync for now: delete and re-insert or update first record)
        // For simplicity in this demo, we update the first existing record for the customer
        if (!empty($address_data)) {
            $this->db->where('customer_id', $id);
            $this->db->order_by('address_id', 'ASC');
            $this->db->limit(1);
            $this->db->update('customer_address', $address_data);
        }

        // Update Bank
        if (!empty($bank_data)) {
            $this->db->where('customer_id', $id);
            $this->db->order_by('bank_id', 'ASC');
            $this->db->limit(1);
            $this->db->update('customer_bank', $bank_data);
        }

        $this->db->trans_complete();
        return $this->db->trans_status();
    }

    public function getCustomerById($id)
    {
        $this->db->select('*');
        $this->db->from('customer_master');
        $this->db->where('id', $id);
        $query = $this->db->get();
        return $query->row_array();
    }

    public function getCustomerAddresses($customer_id)
    {
        $this->db->select('*');
        $this->db->from('customer_address');
        $this->db->where('customer_id', $customer_id);
        $query = $this->db->get();
        return $query->result_array();
    }

    public function getCustomerBanks($customer_id)
    {
        $this->db->select('*');
        $this->db->from('customer_bank');
        $this->db->where('customer_id', $customer_id);
        $query = $this->db->get();
        return $query->result_array();
    }

    public function deleteCustomer($id)
    {
        $this->db->where('id', $id);
        return $this->db->update('customer_master', array('is_delete' => '1'));
    }

    public function getCustomerPaged($start, $length, $search, $order_col, $order_dir)
    {
        $this->db->select('c.*, (SELECT COUNT(order_id) FROM orders WHERE user_id = c.id) as total_order_count');
        $this->db->from('customer_master as c');
        $this->db->where('c.is_delete', '0');

        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('c.customer_name', $search);
            $this->db->or_like('c.customer_code', $search);
            $this->db->or_like('c.email', $search);
            $this->db->or_like('c.mobile_no', $search);
            $this->db->group_end();
        }

        $this->db->order_by($order_col, $order_dir);
        $this->db->limit($length, $start);
        $query = $this->db->get();
        return $query->result_array();
    }

    public function getTotalCustomers()
    {
        $this->db->where('is_delete', '0');
        return $this->db->count_all_results('customer_master');
    }

    public function getFilteredCustomersCount($search)
    {
        $this->db->from('customer_master');
        $this->db->where('is_delete', '0');

        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('customer_name', $search);
            $this->db->or_like('customer_code', $search);
            $this->db->or_like('email', $search);
            $this->db->or_like('mobile_no', $search);
            $this->db->group_end();
        }

        return $this->db->count_all_results();
    }
}
