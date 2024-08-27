<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}



class deptgroup_headerHandler extends WebAPI  {

	public function buildListCriteriaValues(object &$options, array &$criteriaValues) : void {
		$criteriaValues['deptgroup_isparent'] = " A.deptgroup_isparent = :deptgroup_isparent ";
	}


	public function sortListOrder(array &$sortData) : void {
		$sortData['deptgroup_path'] = 'ASC';
		$sortData['deptgroup_pathid'] = 'ASC';
	}

	public function DataListLooping(array &$record) : void {
		$record['_id'] = $record['deptgroup_id'];
	}
}		
		
		
		