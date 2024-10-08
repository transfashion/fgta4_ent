<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}


use \FGTA4\utils\SqlUtility;

class itemmodel_headerHandler extends WebAPI  {


	public function buildListCriteriaValues(object &$options, array &$criteriaValues) : void {
		$criteriaValues['itemmanage_isasset'] = " A.itemmanage_isasset = :itemmanage_isasset "; 
	}


	// public function DataListLooping(array &$record) : void {
	// 	$itemmanage = SqlUtility::LookupRow($record['itemmanage_id'], $this->db, 'mst_itemmanage', 'itemmanage_id');
	// 	$record['itemmanage_isbyassetowner'] = $itemmanage['itemmanage_isbyassetowner'];
	// 	$record['itemmanage_isbystockowner'] = $itemmanage['itemmanage_isbystockowner'];
	// 	$record['itemmanage_isbynonitemowner'] = $itemmanage['itemmanage_isbynonitemowner'];
	// 	$record['itemmanage_isbypartnerselect'] = $itemmanage['itemmanage_isbypartnerselect'];

	// }

	public function DataListLooping(array &$record) : void {
		$record['_id'] = $record['itemmodel_id'];
	}

}		
		
		
		