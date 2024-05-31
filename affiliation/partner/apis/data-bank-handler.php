<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}



class partner_bankHandler extends WebAPI  {

	public function buildListCriteriaValues(object &$options, array &$criteriaValues) : void {
		if (property_exists($options->criteria, 'empl_id')) {
			$this->empl_id = $options->criteria->empl_id;

			$criteriaValues['empl_id'] = ' B.empl_id = :empl_id ';
		}
	}


	public function SqlQueryListBuilder(array &$sqlFieldList, string &$sqlFromTable, string &$sqlWhere, array &$params) : void {
		$jointopartner = false;
		if (property_exists($this, 'empl_id')) {
			$jointopartner = true;
		}

		if ($jointopartner) {
			$sqlFromTable = "mst_partnerbank A inner join mst_partner B on B.partner_id = A.partner_id";
		}

	}

	public function DataSavedSuccess($result) {
		// $this->caller->log('save success');
	}	
}		
		
		
		