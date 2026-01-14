<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Blog extends MY_Controller {
	public function __construct() {
        parent::__construct();
        $this->load->model('Blog_model');
    }
	public function index() {
		$data['base_url'] = base_url();
		$this->smarty->loadView('login.tpl',$data,'No','No');
	}
	/* add update user module */
	
	public function blog()
	{
		$data['base_url'] = base_url();
		$data['blog'] = $this->Blog_model->get_all_blogs();
		$this->smarty->loadView('blog.tpl', $data,'Yes','Yes');
	}
	
	public function add_blog()
	{
		$data['base_url'] = base_url();
		$id = $this->input->get('id');
		$data['blog_data'] = [];
		$data['mode'] = 'Add';
		
		if($id){
            $blog_details = $this->Blog_model->get_blog_by_id($id);
            if($blog_details){
                $data['blog_data'] = $blog_details;
				$data['mode'] = 'Update';
            }
		}

		$this->smarty->loadView('add_blog.tpl', $data,'Yes','Yes');
	}
	
	public function add_blog_data()
	{
		$ret_arr = [];
		$msg = '';
		$success = 0;

		try {
			// Validate required fields
			$id = $this->input->post('id'); // Hidden ID field
			$title = trim($this->input->post('title'));
			$author = trim($this->input->post('author'));
			$content = $this->input->post('content'); // HTML content from TinyMCE
			$status = $this->input->post('status');

			// Server-side validation
			if(empty($title)){
				throw new Exception('Blog title is required.');
			}
			if(empty($author)){
				throw new Exception('Author name is required.');
			}
			if(empty($content)){
				throw new Exception('Blog content is required.');
			}
			if(empty($status) || !in_array($status, ['Active', 'Inactive'])){
				throw new Exception('Valid status is required.');
			}

			// Prepare blog data
			$blog_data = [
				'title' => $title,
				'author' => $author,
				'content' => $content,
				'status' => $status,
				// 'added_date' => date('Y-m-d H:i:s'), // Keep original added_date for updates
				// 'added_by' => $this->session->userdata('user_id') ?: 1,
				'is_delete' => '0'
			];

			if($id){
				// Update existing blog
				$update_result = $this->Blog_model->update_blog($id, $blog_data);
				if (!$update_result) {
					throw new Exception('Failed to update blog data.');
				}
				$msg = 'Blog updated successfully.';
			} else {
				// Insert new blog
				$blog_data['added_date'] = date('Y-m-d H:i:s');
				$blog_data['added_by'] = $this->session->userdata('user_id') ?: 1;

				$blog_id = $this->Blog_model->insert_blog($blog_data);
				if (!$blog_id) {
					throw new Exception('Failed to insert blog data.');
				}
				$msg = 'Blog added successfully.';
			}

			$success = 1;

		} catch (Exception $e) {
			$msg = $e->getMessage();
			$success = 0;
		}

		$ret_arr['msg'] = $msg;
		$ret_arr['success'] = $success;
		echo json_encode($ret_arr);
	}
	
	
}

