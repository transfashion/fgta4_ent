<?php namespace FGTA4\module; if (!defined('FGTA4')) { die('Forbiden'); } 

require_once __ROOT_DIR.'/core/sqlutil.php';

class item_pageHandler {

	public function LoadPage() {
		$userdata = $this->userdata;

		$this->setup->dept_id = $userdata->dept_id;
		$this->setup->dept_name = $userdata->dept_name;

	}

}