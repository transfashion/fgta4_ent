<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}



class deptgroup_headerHandler extends WebAPI  {




	public function sortListOrder(array &$sortData) : void {
		$sortData['deptgroup_path'] = 'ASC';
		$sortData['deptgroup_pathid'] = 'ASC';
	}
}		
		
		
		