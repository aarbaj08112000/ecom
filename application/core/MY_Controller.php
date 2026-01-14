<?php
defined('BASEPATH') or exit('No direct script access allowed');
class MY_Controller extends MX_Controller
{
  public $current_folder = '';
  public function __construct()
  {
    parent::__construct();
    $routes = $this->router->routes;
    $current_route = $this->uri->segment(1);
    $controller_route = $this->uri->rsegments[1];
    $route_string = explode ('/',$routes[$current_route]);
    $current_folder = $route_string[0];
    $this->current_folder = $current_folder;
    $this->checkEntryAuth($current_folder,$controller_route,$current_route);
    $this->setConfigSetting();
    // setting smarty template.
    if (is_dir(APPPATH . 'modules/' . $current_folder)) {
        $this->smarty->setTemplateDir(APPPATH . 'modules/' . $current_folder . '/views/');
    } else {
        $this->smarty->setTemplateDir(APPPATH . 'views/' . $current_folder . '/');
    }

    // Pass customer session data directly to Smarty views
    $this->smarty->assign('is_customer_logged_in', $this->session->userdata('is_customer_logged_in'));
    $this->smarty->assign('customer_name', $this->session->userdata('customer_name'));
    
    // Log Traffic
    $this->log_traffic();
  }

  private function log_traffic() {
    // Only log page views (exclude AJAX and common assets if possible, 
    // though usually handled by CI router)
    if (!$this->input->is_ajax_request()) {
        $data = [
            'ip_address' => $this->input->ip_address(),
            'user_agent' => $this->input->user_agent(),
            'request_uri' => $_SERVER['REQUEST_URI'],
            'referrer' => isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '',
            'device_type' => $this->get_device_type()
        ];
        $this->db->insert('traffic_logs', $data);
    }
  }

  private function get_device_type() {
    $this->load->library('user_agent');
    if ($this->agent->is_mobile()) {
        return 'Mobile';
    } elseif ($this->agent->is_browser()) {
        return 'Desktop';
    }
    return 'Desktop'; // Default
  }
  public function checkEntryAuth($current_folder='',$controller_route='',$current_route=''){
    $routes = $this->router->routes;
    $url_string = $this->uri->uri_string;
    if(array_key_exists($url_string, $routes) && !$this->checkSession()){
      $admin_allow_arr = array(
            'user' => array(
                'login' => array(
                    'login','forgot_password'
                )
            )
      );

      if(isset($admin_allow_arr[$current_folder][$controller_route])){
        if(!in_array($current_route, $admin_allow_arr[$current_folder][$controller_route])){
            redirect(base_url("login"));
        }
      }else{
        redirect(base_url("login"));
      }
    }
  }
  public function checkSession(){
    $session_data = $this->session->userdata;
    $return = true;
    if(!isset($session_data['user_id'])){
      $return = false;
    }

    return $return;
  }
  /* set config */
  public function setConfigSetting(){
    $this->load->model('Group_model');
    $config_data = $this->Group_model->getConfig();
    /* set config */
    if(is_valid_array($config_data)){
        if(count($config_data) > 0){
            foreach ($config_data as $key => $value) {
                $this->config->set_item($value['name'], $value['value']);
            }
        }
    }   
  }
  /* send Mail */
  public function email_sender($data = array(),$email = "",$template_name){
    $configuration = $this->config->config;
    $data['configuration']  = $configuration;
    $mail = $this->phpmailer_lib->load();
    $mail->isSMTP();                                      // Set mailer to use SMTP
    $mail->Host = 'smtp.gmail.com';             // 'smtp.gmail.com'; //'smtpout.secureserver.net';
    $mail->SMTPAuth = true;                               // Enable SMTP authentication
    $mail->Username = $configuration['smtp_user_name'];     // SMTP username
    $mail->Password = $configuration['smtp_user_password']; // SMTP password
    $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
    $mail->Port = 587; //465; //587;                       // TCP port to connect to
    $mail->From = $configuration['smtp_user_name'];
    $mail->FromName = $data['email_name'];
    $mail->addAddress($email);                      // Name is optional
    $mail->isHTML(true);                                  // Set email format to HTML
    $mail->Subject = $data['email_subject'];
    $template_path = $this->config->item("site_path")."views/email_template/".$template_name.".tpl";
    $html = $this->smarty->fetch($template_path,$data);
    $mail->Body    = $html;
    $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
    // if($this->config->item("email_notification") == "Yes" || $email_notification){
      if(!$mail->send() || $configuration['email_notification_enable'] == "") {
        $message =  'Message could not be sent';
        $success = 0;
        // echo 'Mailer Error: ' . $mail->ErrorInfo;
      } else {
        $message =  '\n Message has been sent';
      }
    // }else{
    //    $message =  'notification turn off';
    // }
     
    return $message;  

    }



}

?>
