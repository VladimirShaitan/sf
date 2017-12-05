<?php
class ControllerModuleSlideshow extends Controller {
	public function index($setting) {
		static $module = 0;		

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');

		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'choose'  => $result['choose'],
					'video_link'  => $result['video_link'],
					'videoLogo'  => $result['videoLogo'],
					'videoDesc'  => $result['videoDesc'],
					'image' => $result['image']
				);
			}
		}

		$data['module'] = $module++;

		return $this->load->view('module/slideshow', $data);
	}
}