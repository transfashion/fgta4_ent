<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}

use \FGTA4\utils\SqlUtility;


class itemclass_headerHandler extends WebAPI  {


	public function buildListCriteriaValues(object &$options, array &$criteriaValues) : void {
		$criteriaValues['dept_id'] = " (A.owner_dept_id = :dept_id or A.maintainer_dept_id = :dept_id) ";
		$criteriaValues['owner_dept_id'] = " A.owner_dept_id = :owner_dept_id ";
		$criteriaValues['itemmodel_issellable'] = " A.itemmodel_issellable = :itemmodel_issellable "; 
		$criteriaValues['itemmanage_isasset'] = " A.itemmanage_isasset = :itemmanage_isasset "; 
	}

	public function DataOpen(array &$record) : void {
		if ($record['itemclass_isindependentsetting']==0) {
			$itemmodel = SqlUtility::LookupRow($record['itemmodel_id'], $this->db, 'mst_itemmodel', 'itemmodel_id');
			$record['itemmodel_isintangible'] = $itemmodel['itemmodel_isintangible'];
			$record['itemmodel_issellable'] = $itemmodel['itemmodel_issellable'];
			$record['itemmodel_isnonitem'] = $itemmodel['itemmodel_isnonitem'];
			$record['itemmodel_ishasmainteinerdept'] = $itemmodel['itemmodel_ishasmainteinerdept'];
		}
	}


	public function DataListLooping(array &$record) : void {
		$record['_id'] = $record['itemclass_id'];
	}

	public function sortListOrder(array &$sortData) : void {
		$sortData['itemclass_name'] = 'ASC';
	}

}		
		
		
		