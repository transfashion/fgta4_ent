<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}

require_once __ROOT_DIR.'/core/sqlutil.php';
// require_once __ROOT_DIR . "/core/sequencer.php";
require_once __DIR__ . '/xapi.base.php';

if (is_file(__DIR__ .'/data-header-handler.php')) {
	require_once __DIR__ .'/data-header-handler.php';
}


use \FGTA4\exceptions\WebException;
// use \FGTA4\utils\Sequencer;



/**
 * ent/affiliation/partnertype/apis/save.php
 *
 * ====
 * Save
 * ====
 * Menampilkan satu baris data/record sesuai PrimaryKey,
 * dari tabel header partnertype (mst_partnertype)
 *
 * Agung Nugroho <agung@fgta.net> http://www.fgta.net
 * Tangerang, 26 Maret 2021
 *
 * digenerate dengan FGTA4 generator
 * tanggal 06/09/2022
 */
$API = new class extends partnertypeBase {
	
	public function execute(object $data, object $options) : object {
		$event = 'on-save';
		$tablename = 'mst_partnertype';
		$primarykey = 'partnertype_id';
		$autoid = $options->autoid;
		$datastate = $data->_state;
		$userdata = $this->auth->session_get_user();

		$handlerclassname = "\\FGTA4\\apis\\partnertype_headerHandler";
		$hnd = null;
		if (class_exists($handlerclassname)) {
			$hnd = new partnertype_headerHandler($options);
			$hnd->caller = &$this;
			$hnd->db = &$this->db;
			$hnd->auth = $this->auth;
			$hnd->reqinfo = $this->reqinfo;
			$hnd->event = $event;
		}

		try {

			// cek apakah user boleh mengeksekusi API ini
			if (!$this->RequestIsAllowedFor($this->reqinfo, "save", $userdata->groups)) {
				throw new \Exception('your group authority is not allowed to do this action.');
			}

			$result = new \stdClass; 
			
			$key = new \stdClass;
			$obj = new \stdClass;
			foreach ($data as $fieldname => $value) {
				if ($fieldname=='_state') { continue; }
				if ($fieldname==$primarykey) {
					$key->{$fieldname} = $value;
				}
				$obj->{$fieldname} = $value;
			}

			// apabila ada tanggal, ubah ke format sql sbb:
			// $obj->tanggal = (\DateTime::createFromFormat('d/m/Y',$obj->tanggal))->format('Y-m-d');

			$obj->partnertype_id = strtoupper($obj->partnertype_id);
			$obj->partnertype_name = strtoupper($obj->partnertype_name);



			// current user & timestamp	
			if ($datastate=='NEW') {
				$obj->_createby = $userdata->username;
				$obj->_createdate = date("Y-m-d H:i:s");
			} else {
				$obj->_modifyby = $userdata->username;
				$obj->_modifydate = date("Y-m-d H:i:s");	
			}

			//handle data sebelum sebelum save
			if (is_object($hnd)) {
				if (method_exists(get_class($hnd), 'DataSaving')) {
					// ** DataSaving(object &$obj, object &$key) : void
					$hnd->DataSaving($obj, $key);
				}
			}	
	

			$this->db->setAttribute(\PDO::ATTR_AUTOCOMMIT,0);
			$this->db->beginTransaction();

			try {

				$action = '';
				if ($datastate=='NEW') {
					$action = 'NEW';
					if ($autoid) {
						$obj->{$primarykey} = $this->NewId($obj);
					}
					$cmd = \FGTA4\utils\SqlUtility::CreateSQLInsert($tablename, $obj);
				} else {
					$action = 'MODIFY';
					$cmd = \FGTA4\utils\SqlUtility::CreateSQLUpdate($tablename, $obj, $key);
				}
				$stmt = $this->db->prepare($cmd->sql);
				$stmt->execute($cmd->params);
				\FGTA4\utils\SqlUtility::WriteLog($this->db, $this->reqinfo->modulefullname, $tablename, $obj->{$primarykey}, $action, $userdata->username, (object)[]);





				$criteriaValues = [
					"partnertype_id" => " partnertype_id = :partnertype_id "
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
					'partnertype_id' => 'A.`partnertype_id`', 'partnertype_name' => 'A.`partnertype_name`', 'partnertype_descr' => 'A.`partnertype_descr`', 'partnercategory_id' => 'A.`partnercategory_id`',
					'itemclass_id' => 'A.`itemclass_id`', 'unbill_accbudget_id' => 'A.`unbill_accbudget_id`', 'unbill_coa_id' => 'A.`unbill_coa_id`', 'payable_accbudget_id' => 'A.`payable_accbudget_id`',
					'payable_coa_id' => 'A.`payable_coa_id`', 'arunbill_accbudget_id' => 'A.`arunbill_accbudget_id`', 'arunbill_coa_id' => 'A.`arunbill_coa_id`', 'ar_accbudget_id' => 'A.`ar_accbudget_id`',
					'ar_coa_id' => 'A.`ar_coa_id`', 'partnertype_isempl' => 'A.`partnertype_isempl`', 'partnertype_ishaveae' => 'A.`partnertype_ishaveae`', 'partnertype_ishavecollector' => 'A.`partnertype_ishavecollector`',
					'partnertype_isdisabled' => 'A.`partnertype_isdisabled`', '_createby' => 'A.`_createby`', '_createdate' => 'A.`_createdate`', '_modifyby' => 'A.`_modifyby`'
				];
				$sqlFromTable = "mst_partnertype A";
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
	
		
				$result->dataresponse = array_merge($record, [
					
					// // jikalau ingin menambah atau edit field di result record, dapat dilakukan sesuai contoh sbb: 
					// 'tambahan' => 'dta',
					//'tanggal' => date("d/m/Y", strtotime($record['tanggal'])),
					//'gendername' => $record['gender']
					
					'partnercategory_name' => \FGTA4\utils\SqlUtility::Lookup($record['partnercategory_id'], $this->db, 'mst_partnercategory', 'partnercategory_id', 'partnercategory_name'),
					'itemclass_name' => \FGTA4\utils\SqlUtility::Lookup($record['itemclass_id'], $this->db, 'mst_itemclass', 'itemclass_id', 'itemclass_name'),
					'unbill_accbudget_name' => \FGTA4\utils\SqlUtility::Lookup($record['unbill_accbudget_id'], $this->db, 'mst_accbudget', 'accbudget_id', 'accbudget_name'),
					'unbill_coa_name' => \FGTA4\utils\SqlUtility::Lookup($record['unbill_coa_id'], $this->db, 'mst_coa', 'coa_id', 'coa_name'),
					'payable_accbudget_name' => \FGTA4\utils\SqlUtility::Lookup($record['payable_accbudget_id'], $this->db, 'mst_accbudget', 'accbudget_id', 'accbudget_name'),
					'payable_coa_name' => \FGTA4\utils\SqlUtility::Lookup($record['payable_coa_id'], $this->db, 'mst_coa', 'coa_id', 'coa_name'),
					'arunbill_accbudget_name' => \FGTA4\utils\SqlUtility::Lookup($record['arunbill_accbudget_id'], $this->db, 'mst_accbudget', 'accbudget_id', 'accbudget_name'),
					'arunbill_coa_name' => \FGTA4\utils\SqlUtility::Lookup($record['arunbill_coa_id'], $this->db, 'mst_coa', 'coa_id', 'coa_name'),
					'ar_accbudget_name' => \FGTA4\utils\SqlUtility::Lookup($record['ar_accbudget_id'], $this->db, 'mst_accbudget', 'accbudget_id', 'accbudget_name'),
					'ar_coa_name' => \FGTA4\utils\SqlUtility::Lookup($record['ar_coa_id'], $this->db, 'mst_coa', 'coa_id', 'coa_name'),
	
	
					'_createby' => \FGTA4\utils\SqlUtility::Lookup($record['_createby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),
					'_modifyby' => \FGTA4\utils\SqlUtility::Lookup($record['_modifyby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),
	
				]);

				if (is_object($hnd)) {
					if (method_exists(get_class($hnd), 'DataOpen')) {
						//  DataOpen(array &$record) : void 
						$hnd->DataOpen($result->dataresponse);
					}
				}
	
				if (is_object($hnd)) {
					if (method_exists(get_class($hnd), 'DataSavedSuccess')) {
						$hnd->DataSavedSuccess($result);
					}
				}


				$this->db->commit();
				return $result;

			} catch (\Exception $ex) {
				$this->db->rollBack();
				throw $ex;
			} finally {
				$this->db->setAttribute(\PDO::ATTR_AUTOCOMMIT,1);
			}

		} catch (\Exception $ex) {
			throw $ex;
		}
	}

	public function NewId(object $obj) : string {
		// dipanggil hanya saat $autoid == true;

		$id = null;
		$handled = false;
		if (is_object($hnd)) {
			if (method_exists(get_class($hnd), 'CreateNewId')) {
				$id = $hnd->CreateNewId($obj);
				$handled = true;
			}
		}

		if (!$handled) {
			$id = uniqid();
		}

		return $id;
	}

};