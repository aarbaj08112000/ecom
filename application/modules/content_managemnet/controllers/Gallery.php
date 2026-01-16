<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Gallery extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Gallery_model');
    }

    public function gallery()
    {
        $data['gallery'] = $this->Gallery_model->get_gallery();
        $this->smarty->loadView('gallery.tpl', $data, 'Yes', 'Yes');
    }

    public function add_gallery()
    {
        $ret_arr = [];
        $msg = '';
        $success = 1;

        $config['upload_path'] = './public/uploads/gallery/'; 
        $config['allowed_types'] = 'jpg|jpeg|png|gif';
        $config['max_size'] = 5120; // 5MB
        $config['encrypt_name'] = TRUE;

        if (!is_dir($config['upload_path'])) {
            mkdir($config['upload_path'], 0777, true);
        }

        $this->load->library('upload', $config);

        if (!$this->upload->do_upload('gallery_image')) {
            $ret_arr['msg'] = $this->upload->display_errors();
            $ret_arr['success'] = 0;
            echo json_encode($ret_arr);
            return; 
        }

        $upload_data = $this->upload->data();
        $image_path = $upload_data['file_name'];

        $data = [
            'gallery_image' => $image_path,
            'added_date' => date("Y-m-d H:i:s"),
            'added_by' => $this->session->userdata('user_id'),
        ];

        $insert_query = $this->Gallery_model->add_gallery($data);
        
        if ($insert_query) {
            $msg = 'Image added to gallery successfully.';
        } else {
            $msg = 'Error occurred while adding the image. Please try again.';
            $success = 0;
        }

        $ret_arr['msg'] = $msg;
        $ret_arr['success'] = $success;
        echo json_encode($ret_arr);
    }

    public function update_gallery()
    {
        $ret_arr = [];
        $msg = '';
        $success = 1;
        
        $gallery_id = $this->input->post("gallery_id");
        $hidden_gallery_image = $this->input->post("hidden_gallery_image"); 
        
        $image_path = $hidden_gallery_image; 

        if (!empty($_FILES['gallery_image']['name'])) {
           
            $config['upload_path'] = './public/uploads/gallery/';
            $config['allowed_types'] = 'jpg|jpeg|png|gif';
            $config['max_size'] = 5120;
            $config['encrypt_name'] = TRUE;

            if (!is_dir($config['upload_path'])) {
                mkdir($config['upload_path'], 0777, true);
            }

            $this->load->library('upload', $config);

            if ($this->upload->do_upload('gallery_image')) {
                $upload_data = $this->upload->data();
                $image_path = $upload_data['file_name'];

                // Note: Not unlinking old file if you want to keep history, 
                // but usually good practice to clean up if not used.
                $old_file = $config['upload_path'] . $hidden_gallery_image;
                if (!empty($hidden_gallery_image) && file_exists($old_file)) {
                    unlink($old_file);
                }
            } 
        }

        $data = [
            'gallery_image' => $image_path,
            'update_date' => date("Y-m-d H:i:s"),
            'update_by' => $this->session->userdata('user_id'),
            'status' => $this->input->post("status"),
        ];

        $update_query = $this->Gallery_model->update_gallery($data, $gallery_id);

        if ($update_query) {
            $msg = 'Gallery item updated successfully.';
        } else {
            $msg = 'Error occurred while updating the gallery item. Please try again.';
            $success = 0;
        }

        $ret_arr['msg'] = $msg;
        $ret_arr['success'] = $success;
        echo json_encode($ret_arr);
    }

    public function delete_gallery()
    {
        $ret_arr = [];
        $msg = '';
        $success = 1;
        $gallery_id = $this->input->post("gallery_id");
        
        $data = array(
            'is_delete'  => "1",
            'update_date'=> date("Y-m-d H:i:s"),
            'update_by'=> $this->session->userdata('user_id'),
        );
        
        $update_query = $this->Gallery_model->update_gallery($data, $gallery_id);
       
        if ($update_query) {
            $msg = 'Gallery item deleted successfully.';
        } else {
            $msg = 'Error occurred while deleting the gallery item. Please try again.';
            $success = 0;
        }
        $ret_arr['msg'] = $msg;
        $ret_arr['success'] = $success;
        echo json_encode($ret_arr);
    }
}
