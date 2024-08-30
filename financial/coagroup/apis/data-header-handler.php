<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}

use \FGTA4\utils\SqlUtility;


class coagroup_headerHandler extends WebAPI  {

	public function buildListCriteriaValues(object &$options, array &$criteriaValues) : void {
		$criteriaValues['coagroup_isparent'] = " A.coagroup_isparent = :coagroup_isparent ";
	}


	public function sortListOrder(array &$sortData) : void {
		$sortData['coagroup_path'] = 'ASC';
		$sortData['coagroup_pathid'] = 'ASC';
	}

	public function DataListLooping(array &$record) : void {
		$record['_id'] = $record['coagroup_id'];

		$coamodel = SqlUtility::LookupRow($record['coamodel_id'], $this->db, 'mst_coamodel', 'coamodel_id');
		$record['coa_dk'] = $coamodel['coa_dk'];
		$record['coa_mp'] = $coamodel['coa_mp'];
	}
}		
		
		
		