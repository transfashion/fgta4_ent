<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}



class itemmanage_headerHandler extends WebAPI  {


	public function DataListLooping(array &$record) : void {
		$record['_id'] = $record['itemmanage_id'];
	}
}		
		
		
		