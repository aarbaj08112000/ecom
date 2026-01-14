<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Support extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->helper('url');
    }

    public function track_order() {
        $data['title'] = 'Track Your Order | Craftology';
        $data['page'] = 'track_order';
        $this->smarty->view('support/track_order.tpl', $data);
    }

    public function shipping_policy() {
        $data['title'] = 'Shipping Policy | Craftology';
        $data['page'] = 'shipping_policy';
        $this->smarty->view('support/shipping_policy.tpl', $data);
    }

    public function returns() {
        $data['title'] = 'Returns & Refunds | Craftology';
        $data['page'] = 'returns';
        $this->smarty->view('support/returns.tpl', $data);
    }

    public function faqs() {
        $data['title'] = 'Frequently Asked Questions | Craftology';
        $data['page'] = 'faqs';
        $this->smarty->view('support/faqs.tpl', $data);
    }

    public function privacy_policy() {
        $data['title'] = 'Privacy Policy | Craftology';
        $data['page'] = 'privacy_policy';
        $this->smarty->view('support/privacy_policy.tpl', $data);
    }
}
