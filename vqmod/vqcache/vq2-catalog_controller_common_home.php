<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

				if( NULL != ( $smk_settings = $this->config->get('smp_meta_stores' ) ) ) {
					if( ! empty( $smk_settings[$this->config->get('config_store_id')]['title'][$this->config->get('config_language_id')] ) ) {
						$this->document->setTitle( $smk_settings[$this->config->get('config_store_id')]['title'][$this->config->get('config_language_id')] );
					}
				
					if( ! empty( $smk_settings[$this->config->get('config_store_id')]['description'][$this->config->get('config_language_id')] ) ) {
						$this->document->setDescription( $smk_settings[$this->config->get('config_store_id')]['description'][$this->config->get('config_language_id')] );
					}
				
					if( ! empty( $smk_settings[$this->config->get('config_store_id')]['keywords'][$this->config->get('config_language_id')] ) ) {
						$this->document->setKeywords( $smk_settings[$this->config->get('config_store_id')]['keywords'][$this->config->get('config_language_id')] );
					}
				}
			

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}