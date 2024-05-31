<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}

use \FGTA4\utils\SqlUtility;


class selector_headerHandler extends WebAPI  {

	private $options;

	function __construct(object &$options) {
		if (!property_exists($options, 'selector')) {
			$options->selector = null;
		}
		$this->options = $options;
	}


	function buildListCriteriaValues(object &$options, array &$criteriaValues) : void {
		if ($this->options->selector=='unit-all') {
			SqlUtility::setDefaultCriteria($options->criteria, 'unit_isdisabled', '0');
			$criteriaValues['search'] = " A.unit_id LIKE CONCAT('%', :search, '%') OR A.unit_name LIKE CONCAT('%', :search, '%') ";
			$criteriaValues['unit_isdisabled'] = " A.unit_isdisabled =:unit_isdisabled ";		
		} else if ($this->options->selector=='dept-all') {
			SqlUtility::setDefaultCriteria($options->criteria, 'dept_isdisabled', '0');
			$criteriaValues['search'] = " A.dept_id LIKE CONCAT('%', :search, '%') OR A.dept_name LIKE CONCAT('%', :search, '%') ";
			$criteriaValues['dept_isdisabled'] = " A.dept_isdisabled =:dept_isdisabled ";
		}
	}


	function SqlQueryListBuilder(array &$sqlFieldList, string &$sqlFromTable, string &$sqlWhere, array &$params) : void {
		if ($this->options->selector=='unit-all') {
			$sqlFieldList['selector_id'] = "A.`unit_id`";
			$sqlFieldList['selector_text'] = "A.`unit_name`";
			$sqlFieldList['selector_data'] = "''";
			$sqlFromTable = "mst_unit A";
		} else if ($this->options->selector=='dept-all') {
			$sqlFieldList['selector_id'] = "A.`dept_id`";
			$sqlFieldList['selector_text'] = "A.`dept_name`";
			$sqlFieldList['selector_data'] = "''";
			$sqlFromTable = "mst_dept A";
		}

	}	


}		
		
		
		