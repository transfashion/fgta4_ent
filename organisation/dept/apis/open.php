<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}

require_once __ROOT_DIR.'/core/sqlutil.php';
require_once __DIR__ . '/xapi.base.php';

if (is_file(__DIR__ .'/data-header-handler.php')) {
	require_once __DIR__ .'/data-header-handler.php';
}


use \FGTA4\exceptions\WebException;


/**
 * ent/organisation/dept/apis/open.php
 *
 * ====
 * Open
 * ====
 * Menampilkan satu baris data/record sesuai PrimaryKey,
 * dari tabel header dept (mst_dept)
 *
 * Agung Nugroho <agung@fgta.net> http://www.fgta.net
 * Tangerang, 26 Maret 2021
 *
 * digenerate dengan FGTA4 generator
 * tanggal 02/09/2024
 */
$API = new class extends deptBase {
	
	public function execute($options) {
		$event = 'on-open';
		$tablename = 'mst_dept';
		$primarykey = 'dept_id';
		$userdata = $this->auth->session_get_user();

		$handlerclassname = "\\FGTA4\\apis\\dept_headerHandler";
		$hnd = null;
		if (class_exists($handlerclassname)) {
			$hnd = new dept_headerHandler($options);
			$hnd->caller = &$this;
			$hnd->db = $this->db;
			$hnd->auth = $this->auth;
			$hnd->reqinfo = $this->reqinfo;
			$hnd->event = $event;
		} else {
			$hnd = new \stdClass;
		}

		try {

			// cek apakah user boleh mengeksekusi API ini
			if (!$this->RequestIsAllowedFor($this->reqinfo, "open", $userdata->groups)) {
				throw new \Exception('your group authority is not allowed to do this action.');
			}

			if (method_exists(get_class($hnd), 'init')) {
				// init(object &$options) : void
				$hnd->init($options);
			}

			if (method_exists(get_class($hnd), 'PreCheckOpen')) {
				// PreCheckOpen($data, &$key, &$options)
				$hnd->PreCheckOpen($data, $key, $options);
			}

			$criteriaValues = [
				"dept_id" => " dept_id = :dept_id "
			];
			if (method_exists(get_class($hnd), 'buildOpenCriteriaValues')) {
				// buildOpenCriteriaValues(object $options, array &$criteriaValues) : void
				$hnd->buildOpenCriteriaValues($options, $criteriaValues);
			}
			$where = \FGTA4\utils\SqlUtility::BuildCriteria($options->criteria, $criteriaValues);
			$result = new \stdClass; 

			if (method_exists(get_class($hnd), 'prepareOpenData')) {
				// prepareOpenData(object $options, $criteriaValues) : void
				$hnd->prepareOpenData($options, $criteriaValues);
			}
			

			if (method_exists(get_class($hnd), 'prepareOpenData')) {
				// prepareOpenData(object $options, $criteriaValues) : void
				$hnd->prepareOpenData($options, $criteriaValues);
			}


			$sqlFieldList = [
				'dept_id' => 'A.`dept_id`', 'deptdegree_id' => 'A.`deptdegree_id`', 'dept_name' => 'A.`dept_name`', 'dept_descr' => 'A.`dept_descr`',
				'deptgroup_id' => 'A.`deptgroup_id`', 'unit_id' => 'A.`unit_id`', 'depttype_id' => 'A.`depttype_id`', 'deptmodel_id' => 'A.`deptmodel_id`',
				'authlevel_id' => 'A.`authlevel_id`', 'dept_isdisabled' => 'A.`dept_isdisabled`', 'dept_isitemdefiner' => 'A.`dept_isitemdefiner`', 'dept_isassetowner' => 'A.`dept_isassetowner`',
				'dept_isassetmaintainer' => 'A.`dept_isassetmaintainer`', 'dept_isstockowner' => 'A.`dept_isstockowner`', 'dept_isnonitemowner' => 'A.`dept_isnonitemowner`', 'dept_ispartnerselect' => 'A.`dept_ispartnerselect`',
				'dept_isbudgetmandatory' => 'A.`dept_isbudgetmandatory`', 'dept_issingleprojectbudget' => 'A.`dept_issingleprojectbudget`', '_createby' => 'A.`_createby`', '_createdate' => 'A.`_createdate`',
				'_createby' => 'A.`_createby`', '_createdate' => 'A.`_createdate`', '_modifyby' => 'A.`_modifyby`', '_modifydate' => 'A.`_modifydate`'
			];
			$sqlFromTable = "mst_dept A";
			$sqlWhere = $where->sql;

			if (method_exists(get_class($hnd), 'SqlQueryOpenBuilder')) {
				// SqlQueryOpenBuilder(array &$sqlFieldList, string &$sqlFromTable, string &$sqlWhere, array &$params) : void
				$hnd->SqlQueryOpenBuilder($sqlFieldList, $sqlFromTable, $sqlWhere, $where->params);
			}
			$sqlFields = \FGTA4\utils\SqlUtility::generateSqlSelectFieldList($sqlFieldList);

			
			$sqlData = "
				select 
				$sqlFields 
				from 
				$sqlFromTable 
				$sqlWhere 
			";

			$stmt = $this->db->prepare($sqlData);
			$stmt->execute($where->params);
			$row  = $stmt->fetch(\PDO::FETCH_ASSOC);

			$record = [];
			foreach ($row as $key => $value) {
				$record[$key] = $value;
			}



			$result->record = array_merge($record, [
				
				// // jikalau ingin menambah atau edit field di result record, dapat dilakukan sesuai contoh sbb: 
				// 'tambahan' => 'dta',
				//'tanggal' => date("d/m/Y", strtotime($record['tanggal'])),
				//'gendername' => $record['gender']
				
				'deptdegree_name' => \FGTA4\utils\SqlUtility::Lookup($record['deptdegree_id'], $this->db, 'mst_deptdegree', 'deptdegree_id', 'deptdegree_name'),
				'deptgroup_name' => \FGTA4\utils\SqlUtility::Lookup($record['deptgroup_id'], $this->db, 'mst_deptgroup', 'deptgroup_id', 'deptgroup_name'),
				'unit_name' => \FGTA4\utils\SqlUtility::Lookup($record['unit_id'], $this->db, 'mst_unit', 'unit_id', 'unit_name'),
				'depttype_name' => \FGTA4\utils\SqlUtility::Lookup($record['depttype_id'], $this->db, 'mst_depttype', 'depttype_id', 'depttype_name'),
				'deptmodel_name' => \FGTA4\utils\SqlUtility::Lookup($record['deptmodel_id'], $this->db, 'mst_deptmodel', 'deptmodel_id', 'deptmodel_name'),
				'authlevel_name' => \FGTA4\utils\SqlUtility::Lookup($record['authlevel_id'], $this->db, 'mst_authlevel', 'authlevel_id', 'authlevel_name'),


				'_createby' => \FGTA4\utils\SqlUtility::Lookup($record['_createby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),
				'_modifyby' => \FGTA4\utils\SqlUtility::Lookup($record['_modifyby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),

			]);


			

			if (method_exists(get_class($hnd), 'DataOpen')) {
				//  DataOpen(array &$record) : void 
				$hnd->DataOpen($result->record);
			}

			return $result;
		} catch (\Exception $ex) {
			throw $ex;
		}
	}

};