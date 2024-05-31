<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}

require_once __ROOT_DIR.'/core/sqlutil.php';
require_once __DIR__ . '/xapi.base.php';

if (is_file(__DIR__ .'/data-account-handler.php')) {
	require_once __DIR__ .'/data-account-handler.php';
}


use \FGTA4\exceptions\WebException;



/**
 * ent/affiliation/partnertype/apis/account-open.php
 *
 * ==========
 * Detil-Open
 * ==========
 * Menampilkan satu baris data/record sesuai PrimaryKey,
 * dari tabel account partnertype (mst_partnertypeaccbudget)
 *
 * Agung Nugroho <agung@fgta.net> http://www.fgta.net
 * Tangerang, 26 Maret 2021
 *
 * digenerate dengan FGTA4 generator
 * tanggal 07/09/2022
 */
$API = new class extends partnertypeBase {

	public function execute($options) {
		$event = 'on-open';
		$tablename = 'mst_partnertypeaccbudget';
		$primarykey = 'partnertypeaccbudget_id';
		$userdata = $this->auth->session_get_user();

		$handlerclassname = "\\FGTA4\\apis\\partnertype_accountHandler";
		$hnd = null;
		if (class_exists($handlerclassname)) {
			$hnd = new partnertype_accountHandler($options);
			$hnd->caller = &$this;
			$hnd->db = $this->db;
			$hnd->auth = $this->auth;
			$hnd->reqinfo = $this->reqinfo;
			$hnd->event = $event;
		}

		try {
			$result = new \stdClass; 
			

			$criteriaValues = [
				"partnertypeaccbudget_id" => " partnertypeaccbudget_id = :partnertypeaccbudget_id "
			];
			if (is_object($hnd)) {
				if (method_exists(get_class($hnd), 'buildOpenCriteriaValues')) {
					// buildOpenCriteriaValues(object $options, array &$criteriaValues) : void
					$hnd->buildOpenCriteriaValues($options, $criteriaValues);
				}
			}
			$where = \FGTA4\utils\SqlUtility::BuildCriteria($options->criteria, $criteriaValues);
			$result = new \stdClass; 

			if (is_object($hnd)) {
				if (method_exists(get_class($hnd), 'prepareOpenData')) {
					// prepareOpenData(object $options, $criteriaValues) : void
					$hnd->prepareOpenData($options, $criteriaValues);
				}
			}

			$sqlFieldList = [
				'partnertypeaccbudget_id' => 'A.`partnertypeaccbudget_id`', 'projectmodel_id' => 'A.`projectmodel_id`', 'unbill_accbudget_id' => 'A.`unbill_accbudget_id`', 'unbill_coa_id' => 'A.`unbill_coa_id`',
				'payable_accbudget_id' => 'A.`payable_accbudget_id`', 'payable_coa_id' => 'A.`payable_coa_id`', 'arunbill_accbudget_id' => 'A.`arunbill_accbudget_id`', 'arunbill_coa_id' => 'A.`arunbill_coa_id`',
				'ar_accbudget_id' => 'A.`ar_accbudget_id`', 'ar_coa_id' => 'A.`ar_coa_id`', 'partnertype_id' => 'A.`partnertype_id`', '_createby' => 'A.`_createby`',
				'_createby' => 'A.`_createby`', '_createdate' => 'A.`_createdate`', '_modifyby' => 'A.`_modifyby`', '_modifydate' => 'A.`_modifydate`'
			];
			$sqlFromTable = "mst_partnertypeaccbudget A";
			$sqlWhere = $where->sql;

			if (is_object($hnd)) {
				if (method_exists(get_class($hnd), 'SqlQueryOpenBuilder')) {
					// SqlQueryOpenBuilder(array &$sqlFieldList, string &$sqlFromTable, string &$sqlWhere, array &$params) : void
					$hnd->SqlQueryOpenBuilder($sqlFieldList, $sqlFromTable, $sqlWhere, $where->params);
				}
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
				
				'projectmodel_name' => \FGTA4\utils\SqlUtility::Lookup($record['projectmodel_id'], $this->db, 'mst_projectmodel', 'projectmodel_id', 'projectmodel_name'),
				'unbill_accbudget_name' => \FGTA4\utils\SqlUtility::Lookup($record['unbill_accbudget_id'], $this->db, 'mst_accbudget', 'accbudget_id', 'accbudget_name'),
				'unbill_coa_name' => \FGTA4\utils\SqlUtility::Lookup($record['unbill_coa_id'], $this->db, 'mst_coa', 'coa_id', 'coa_name'),
				'payable_accbudget_name' => \FGTA4\utils\SqlUtility::Lookup($record['payable_accbudget_id'], $this->db, 'mst_accbudget', 'accbudget_id', 'accbudget_name'),
				'payable_coa_name' => \FGTA4\utils\SqlUtility::Lookup($record['payable_coa_id'], $this->db, 'mst_coa', 'coa_id', 'coa_name'),
				'arunbill_accbudget_name' => \FGTA4\utils\SqlUtility::Lookup($record['arunbill_accbudget_id'], $this->db, 'mst_accbudget', 'accbudget_id', 'accbudget_name'),
				'arunbill_coa_name' => \FGTA4\utils\SqlUtility::Lookup($record['arunbill_coa_id'], $this->db, 'mst_coa', 'coa_id', 'coa_name'),
				'ar_accbudget_name' => \FGTA4\utils\SqlUtility::Lookup($record['ar_accbudget_id'], $this->db, 'mst_accbudget', 'accbudget_id', 'accbudget_name'),
				'ar_coa_name' => \FGTA4\utils\SqlUtility::Lookup($record['ar_coa_id'], $this->db, 'mst_coa', 'coa_id', 'coa_name'),

/*{__LOOKUPUSERMERGE__}*/
				'_createby' => \FGTA4\utils\SqlUtility::Lookup($record['_createby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),
				'_modifyby' => \FGTA4\utils\SqlUtility::Lookup($record['_modifyby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),

			]);

			if (is_object($hnd)) {
				if (method_exists(get_class($hnd), 'DataOpen')) {
					//  DataOpen(array &$record) : void 
					$hnd->DataOpen($result->record);
				}
			}

	

			return $result;
		} catch (\Exception $ex) {
			throw $ex;
		}
	}

};