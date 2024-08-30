<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}



class cobgroup_headerHandler extends WebAPI  {


	public function buildListCriteriaValues(object &$options, array &$criteriaValues) : void {
		$criteriaValues['cobgroup_isparent'] = " A.cobgroup_isparent = :cobgroup_isparent ";
	}


	public function sortListOrder(array &$sortData) : void {
		$sortData['cobgroup_path'] = 'ASC';
		$sortData['cobgroup_pathid'] = 'ASC';
	}

	public function DataListLooping(array &$record) : void {
		$record['_id'] = $record['cobgroup_id'];
	}
}		
		
		
		