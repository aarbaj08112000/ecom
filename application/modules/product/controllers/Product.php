<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Product extends MY_Controller {
	public function __construct() {
        parent::__construct();
        $this->load->model('Product_model');
    }
	public function index() {
		$data['base_url'] = base_url();
		$this->smarty->loadView('login.tpl',$data,'No','No');
	}
	/* add update user module */
	
	public function product_list()
	{
		$data['base_url'] = base_url();
		$this->smarty->loadView('product_list.tpl', $data,'Yes','Yes');
	}

	public function product_list_ajax()
	{
		$this->load->model('Product_model');
		
		// DataTables parameters
		$draw = $this->input->post('draw');
		$start = $this->input->post('start');
		$length = $this->input->post('length');
		$search_value = $this->input->post('search')['value'] ?? '';
		$order_column_index = $this->input->post('order')[0]['column'] ?? 0;
		$order_dir = $this->input->post('order')[0]['dir'] ?? 'desc';
		
		// Column mapping (0=image, 1=name, 2=category, 3=detail, 4=stock, 5=unit, 6=price, 7=status, 8=action)
		$columns = ['p.id', 'p.name', 'c.category_name', 'p.detail', 'p.stock_quantity', 'p.price', 'p.price', 'p.status'];
		$order_column = $columns[$order_column_index] ?? 'p.id';
		
		// Prepare parameters
		$params = [
			'start' => $start,
			'length' => $length,
			'search' => $search_value,
			'order_column' => $order_column,
			'order_dir' => $order_dir
		];
		
		// Get data
		$products = $this->Product_model->get_products_datatable($params);
		$total_records = $this->Product_model->get_products_count();
		$filtered_records = $this->Product_model->get_products_count($search_value);
		
// Prepare response
		$data = [];
		foreach ($products as $product) {
			// Construct the correct relative path for the DataTable
			$image_path = '';
			if (!empty($product['cover_image'])) {
				$image_path = $product['id'] . '/' . $product['cover_image'];
			}
			
			// Calculate final price: (Price - Discount) + GST
			$base_price = $product['price'];
			$discount = $product['discount_percentage'];
			$gst = $product['is_gst_applicable'] === 'Yes' ? $product['gst_percentage'] : 0;
			
			$price_after_discount = $base_price - ($base_price * ($discount / 100));
			$final_price = $price_after_discount + ($price_after_discount * ($gst / 100));

			$data[] = [
				'id' => $product['id'],
				'image' => $image_path,
				'name' => $product['name'],
				'category' => $product['category_name'] ?: 'N/A',
				'detail' => $product['detail'],
				'stock_quantity' => $product['stock_quantity'],
				'price' => number_format($final_price, 2),
				'status' => $product['status']
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

	public function add_product()
	{
		$id = $this->input->get('id');
		
		if($id){
			$data['product'] = $this->Product_model->get_product_by_id($id);
			if($data['product']){
				$data['product_images'] = $this->Product_model->get_product_images($id);
				$data['product_attributes'] = $this->Product_model->get_product_attributes($id);
			}
		}

		$data['attribute'] = $this->Product_model->get_attribute();
		$data['categories'] = $this->Product_model->get_categories();
		$data['brands'] = $this->Product_model->get_brands();
		$this->smarty->loadView('add_product.tpl', $data,'Yes','Yes');
	}

	public function product_details()
	{
		$product_id = $this->input->get('id');
		
		if (empty($product_id)) {
			redirect('product_list');
			return;
		}
		
		$data['base_url'] = base_url();
		$data['product'] = $this->Product_model->get_product_by_id($product_id);
		
		if (empty($data['product'])) {
			redirect('product_list');
			return;
		}
		
		// Get product images
		$data['product_images'] = $this->Product_model->get_product_images($product_id);
		
		// Get product attributes
		$data['product_attributes'] = $this->Product_model->get_product_attributes($product_id);
		
		// Get category name
		if (!empty($data['product']['category_id'])) {
			$this->db->select('category_name');
			$this->db->from('categories');
			$this->db->where('category_id', $data['product']['category_id']);
			$category = $this->db->get()->row_array();
			$data['category_name'] = $category['category_name'] ?? 'N/A';
		}
		
		// Get brand name
		if (!empty($data['product']['brand_id'])) {
			$this->db->select('brand_name');
			$this->db->from('brands');
			$this->db->where('brand_id', $data['product']['brand_id']);
			$brand = $this->db->get()->row_array();
			$data['brand_name'] = $brand['brand_name'] ?? 'N/A';
		}
		
		$this->smarty->loadView('product_details.tpl', $data, 'Yes', 'Yes');
	}



	public function delete_product()
	{
		$ret_arr = [];
		$msg = '';
		$success = 0;

		try {
			$product_id = $this->input->post('id');
			
			if (empty($product_id)) {
				throw new Exception('Product ID is required.');
			}

			// Soft delete the product
			$update_data = [
				'is_delete' => '1',
				'updated_date' => date('Y-m-d H:i:s')
			];

			$result = $this->db->where('id', $product_id)
			                    ->update('products', $update_data);

			if ($result) {
				$success = 1;
				$msg = 'Product deleted successfully.';
			} else {
				throw new Exception('Failed to delete product.');
			}

		} catch (Exception $e) {
			$msg = $e->getMessage();
			$success = 0;
		}

		$ret_arr['msg'] = $msg;
		$ret_arr['success'] = $success;
		echo json_encode($ret_arr);
	}

	public function save_product_data()
	{
		$ret_arr = [];
		$msg = '';
		$success = 0;

		try {
			// Validate required fields
			$id = $this->input->post('id'); // Hidden ID for update
			$product_name = trim($this->input->post('product_name'));
			$description = trim($this->input->post('description'));
			$price = trim($this->input->post('price'));
			$discount_percentage = trim($this->input->post('discount_percentage')) ?: 0;
			$is_gst_applicable = $this->input->post('is_gst_applicable') ?: 'No';
			$gst_percentage = trim($this->input->post('gst_percentage')) ?: 0;
			$category_id = $this->input->post('category');
			$brand_id = $this->input->post('brand');
			$stock_quantity = trim($this->input->post('stock_quantity'));

			// Server-side validation
			if(empty($product_name)){
				throw new Exception('Product name is required.');
			}
			if(empty($description)){
				throw new Exception('Description is required.');
			}
			if(empty($price) || !is_numeric($price) || $price <= 0){
				throw new Exception('Valid price is required.');
			}
			if(!is_numeric($discount_percentage) || $discount_percentage < 0 || $discount_percentage > 100){
				throw new Exception('Valid discount percentage (0-100) is required.');
			}
			if(!is_numeric($gst_percentage) || $gst_percentage < 0 || $gst_percentage > 100){
				throw new Exception('Valid GST percentage (0-100) is required.');
			}
			if(empty($category_id)){
				throw new Exception('Category is required.');
			}
			if(empty($brand_id)){
				throw new Exception('Brand is required.');
			}
			if(empty($stock_quantity) || !is_numeric($stock_quantity) || $stock_quantity < 0){
				throw new Exception('Valid stock quantity is required.');
			}

            // Prepare product data
			$product_data = [
				'name' => $product_name,
				'detail' => $description,
				'price' => $price,
				'discount_percentage' => $discount_percentage,
				'is_gst_applicable' => $is_gst_applicable,
				'gst_percentage' => $gst_percentage,
				'category_id' => $category_id,
				'brand_id' => $brand_id,
				'stock_quantity' => $stock_quantity,
				// 'added_date' => date('Y-m-d H:i:s'), // Don't overwrite added_date
				// 'added_by' => $this->session->userdata('user_id') ?: 1,
				'status' => 'Active',
				'is_delete' => '0'
			];

            if ($id) {
                // UPDATE MODE
                $product_data['updated_date'] = date('Y-m-d H:i:s');
                if (!$this->Product_model->update_product($id, $product_data)) {
                    throw new Exception('Failed to update product data.');
                }
                $product_id = $id;

                // Handle Deleted Images
                $deleted_images = $this->input->post('deleted_images');
                if (!empty($deleted_images)) {
                    $deleted_ids = explode(',', $deleted_images);
                    foreach ($deleted_ids as $img_id) {
                        if($img_id){
                             // Optionally delete file from disk here if needed, but for now just DB delete
                            $this->Product_model->delete_image($img_id);
                        }
                    }
                }

                // Delete existing attributes (full replace strategy)
                $this->Product_model->delete_product_attributes($product_id);

            } else {
                // INSERT MODE
                // Check if images are uploaded (Attributes required for new products? Maybe not strict)
			    if(empty($_FILES['product_images']['name'][0])){
				    throw new Exception('At least one product image is required for new products.');
			    }
                $product_data['added_date'] = date('Y-m-d H:i:s');
                $product_data['added_by'] = $this->session->userdata('user_id') ?: 1;
                
                $product_id = $this->Product_model->insert_product($product_data);
                if (!$product_id) {
                    throw new Exception('Failed to insert product data.');
                }
            }


			// Start transaction
			// $this->db->trans_start(); // Already handling parts, let's wrap logic if needed or rely on manual checks

            // Handle Image Uploads (Common for Add/Update)
			$upload_path = './public/uploads/products/' . $product_id . '/';
			if (!is_dir($upload_path)) {
				mkdir($upload_path, 0777, true);
			}

			$config['upload_path'] = $upload_path;
			$config['allowed_types'] = 'jpg|jpeg|png|gif';
			$config['max_size'] = 2048; // 2MB
			$config['encrypt_name'] = TRUE;

			$this->load->library('upload', $config);

            // Cover Image Logic
            $cover_source = $this->input->post('cover_source'); // 'new' or 'existing'
            $cover_value = $this->input->post('cover_value'); // index (new) or ID (existing)

            // If Update, reset cover first if we are setting a new one or changing it
            if($id){
                 $this->Product_model->reset_cover_image($product_id); // Reset all to 0
            }
            
            // Set existing image as cover
            if ($id && $cover_source == 'existing' && $cover_value) {
                $this->Product_model->set_cover_image($cover_value);
                
                // Also update the main product image filename
                $existing_img = $this->db->get_where('product_images', ['image_id' => $cover_value])->row_array();
                if($existing_img){
                    $this->Product_model->update_product($product_id, ['image' => $existing_img['image_path']]);
                }
            }

			// Handle new file uploads
			$uploaded_images = [];
			
            if (!empty($_FILES['product_images']['name'][0])) {
                $files = $_FILES['product_images'];
                $file_count = count($files['name']);

                for ($i = 0; $i < $file_count; $i++) {
                    if (!empty($files['name'][$i])) {
                        $_FILES['product_image']['name'] = $files['name'][$i];
                        $_FILES['product_image']['type'] = $files['type'][$i];
                        $_FILES['product_image']['tmp_name'] = $files['tmp_name'][$i];
                        $_FILES['product_image']['error'] = $files['error'][$i];
                        $_FILES['product_image']['size'] = $files['size'][$i];

                        $this->upload->initialize($config);

                        if ($this->upload->do_upload('product_image')) {
                            $upload_data = $this->upload->data();
                            $filename = $upload_data['file_name'];
                            
                            // Determine is_cover for NEW images
                            $is_cover = '0';
                            if ($cover_source == 'new' && $cover_value == $i) {
                                $is_cover = '1';
                                // Update main product image with just the filename
                                $this->Product_model->update_product($product_id, ['image' => $filename]);
                            }
                            // Fallback for new product default (0 index if not specified)
                             if (!$id && $cover_source == '' && $i == 0) {
                                $is_cover = '1'; 
                                $this->Product_model->update_product($product_id, ['image' => $filename]);
                             }

                            $uploaded_images[] = [
                                'product_id' => $product_id,
                                'image_path' => $filename,
                                'is_cover' => $is_cover,
                                'display_order' => $i,
                                'added_date' => date('Y-m-d H:i:s'),
                                'is_delete' => '0'
                            ];
                        } 
                        // Note: Ignoring failed uploads to not block partial success, or could throw exception
                    }
                }
            }

			// Insert NEW product images
            if (!empty($uploaded_images)) {
			    if (!$this->Product_model->insert_product_images($uploaded_images)) {
				    throw new Exception('Failed to insert product images.');
			    }
            }

			// Handle product attributes (Common for Add/Update)
			$attribute_names = $this->input->post('attribute_name');
			$attribute_values = $this->input->post('attribute_value');

			if (!empty($attribute_names) && is_array($attribute_names)) {
				$attribute_data = [];
				foreach ($attribute_names as $key => $attr_id) {
					if (!empty($attr_id) && !empty($attribute_values[$key])) {
						$attribute_data[] = [
							'product_id' => $product_id,
							'attribute_id' => $attr_id,
							'attribute_value' => trim($attribute_values[$key]),
							'added_date' => date('Y-m-d H:i:s'),
							'added_by' => $this->session->userdata('user_id') ?: 1,
							'status' => 'Active',
							'is_delete' => '0'
						];
					}
				}

				if (!empty($attribute_data)) {
					if (!$this->Product_model->insert_product_attributes($attribute_data)) {
						throw new Exception('Failed to insert product attributes.');
					}
				}
			}

			// Complete transaction
			// $this->db->trans_complete();

			$success = 1;
			$msg = ($id) ? 'Product updated successfully.' : 'Product added successfully.';

		} catch (Exception $e) {
			$msg = $e->getMessage();
			$success = 0;
		}

		$ret_arr['msg'] = $msg;
		$ret_arr['success'] = $success;
		echo json_encode($ret_arr);
	}
	
	
}

