<?php
class ControllerCommonFooter extends Controller {
	public function index() {

        // start: opencart2x.ru
        $data['smch_form_data']         = (array) $this->config->get( 'ocdev_smart_checkout_form_data' );
        $data['smch_store_id']          = (int) $this->config->get( 'config_store_id' );
        $data['smch_customer_group_id'] = ( $this->customer->isLogged() ) ? (int) $this->customer->getGroupId() : (int) $this->config->get( 'config_customer_group_id' );
        $data['moment_js_dir']          = 'catalog/view/javascript/jquery/datetimepicker/';
		if ( isset( $this->request->get['route'] ) ) {
			$data['request_route']          = $this->request->get['route'];
		}
 		if ( isset( $this->request->get['product_id'] ) ) {
			$data['request_product_id']          = $this->request->get['product_id'];
		}
        // end: opencart2x.ru
      
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
        $data['text_telephone'] = $this->language->get('text_telephone');
        $data['text_fax'] = $this->language->get('text_fax');

		$data['footer_top'] = $this->load->controller('common/footer_top');
		$data['footer_right'] = $this->load->controller('common/footer_right');
		$data['footer_bottom'] = $this->load->controller('common/footer_bottom');
		$data['footer_left'] = $this->load->controller('common/footer_left');
		
        $data['telephone'] = $this->config->get('config_telephone');
        $data['fax'] = $this->config->get('config_fax');
        $data['copyright'] = $this->config->get('config_coryright');
        $data['address'] = nl2br($this->config->get('config_address'));
        $data['geocode'] = $this->config->get('config_geocode');
        $data['linkedin'] = $this->config->get('config_linkedin');
        $data['inst'] = $this->config->get('config_instagramm');
        
        $data['twitter'] = $this->config->get('config_twitter');
        $data['facebook'] = $this->config->get('config_facebook');
        $data['gplus'] = $this->config->get('config_gplus');
        $data['pin'] = $this->config->get('config_pin');
        
		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}


				$data['smp_google_analytics'] = (array) $this->config->get('smp_google_analytics');
				
				if( isset( $data['smp_google_analytics'][$this->config->get('config_store_id')] ) ) {
					$data['smp_google_analytics'] = $data['smp_google_analytics'][$this->config->get('config_store_id')];
				} else {
					$data['smp_google_analytics'] = NULL;
				}
			
			
			return $this->load->view('common/footer.tpl', $data);
	}
}
