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
 * ent/items/itemasset/apis/save.php
 *
 * ====
 * Save
 * ====
 * Menampilkan satu baris data/record sesuai PrimaryKey,
 * dari tabel header itemasset (mst_itemasset)
 *
 * Agung Nugroho <agung@fgta.net> http://www.fgta.net
 * Tangerang, 26 Maret 2021
 *
 * digenerate dengan FGTA4 generator
 * tanggal 30/08/2024
 */
$API = new class extends itemassetBase {
	
	public function execute($data, $options) {
		$event = 'on-save';
		$tablename = 'mst_itemasset';
		$primarykey = 'itemasset_id';
		$autoid = $options->autoid;
		$datastate = $data->_state;
		$userdata = $this->auth->session_get_user();

		$handlerclassname = "\\FGTA4\\apis\\itemasset_headerHandler";
		$hnd = null;
		if (class_exists($handlerclassname)) {
			$hnd = new itemasset_headerHandler($options);
			$hnd->caller = &$this;
			$hnd->db = &$this->db;
			$hnd->auth = $this->auth;
			$hnd->reqinfo = $this->reqinfo;
			$hnd->event = $event;
		} else {
			$hnd = new \stdClass;
		}

		try {

			// cek apakah user boleh mengeksekusi API ini
			if (!$this->RequestIsAllowedFor($this->reqinfo, "save", $userdata->groups)) {
				throw new \Exception('your group authority is not allowed to do this action.');
			}

			if (method_exists(get_class($hnd), 'init')) {
				// init(object &$options) : void
				$hnd->init($options);
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
			$obj->itemasset_purchasedate = (\DateTime::createFromFormat('d/m/Y',$obj->itemasset_purchasedate))->format('Y-m-d');
			$obj->itemasset_lastsupportdate = (\DateTime::createFromFormat('d/m/Y',$obj->itemasset_lastsupportdate))->format('Y-m-d');
			$obj->itemasset_currentvalue_date = (\DateTime::createFromFormat('d/m/Y',$obj->itemasset_currentvalue_date))->format('Y-m-d');

			$obj->itemmodel_id = strtoupper($obj->itemmodel_id);


			if ($obj->itemasset_serial=='') { $obj->itemasset_serial = '--NULL--'; }


			unset($obj->itemasset_writeoffby);
			unset($obj->itemasset_writeoffdate);
			unset($obj->itemasset_writeoffref);


			// current user & timestamp	
			if ($datastate=='NEW') {
				$obj->_createby = $userdata->username;
				$obj->_createdate = date("Y-m-d H:i:s");

				if (method_exists(get_class($hnd), 'PreCheckInsert')) {
					// PreCheckInsert($data, &$obj, &$options)
					$hnd->PreCheckInsert($data, $obj, $options);
				}
			} else {
				$obj->_modifyby = $userdata->username;
				$obj->_modifydate = date("Y-m-d H:i:s");	
		
				if (method_exists(get_class($hnd), 'PreCheckUpdate')) {
					// PreCheckUpdate($data, &$obj, &$key, &$options)
					$hnd->PreCheckUpdate($data, $obj, $key, $options);
				}
			}

			//handle data sebelum sebelum save
			if (method_exists(get_class($hnd), 'DataSaving')) {
				// ** DataSaving(object &$obj, object &$key)
				$hnd->DataSaving($obj, $key);
			}

			$this->db->setAttribute(\PDO::ATTR_AUTOCOMMIT,0);
			$this->db->beginTransaction();

			try {

				$action = '';
				if ($datastate=='NEW') {
					$action = 'NEW';
					if ($autoid) {
						$obj->{$primarykey} = $this->NewId($hnd, $obj);
					}
					
					// handle data sebelum pada saat pembuatan SQL Insert
					if (method_exists(get_class($hnd), 'RowInserting')) {
						// ** RowInserting(object &$obj)
						$hnd->RowInserting($obj);
					}
					$cmd = \FGTA4\utils\SqlUtility::CreateSQLInsert($tablename, $obj);
				} else {
					$action = 'MODIFY';

					// handle data sebelum pada saat pembuatan SQL Update
					if (method_exists(get_class($hnd), 'RowUpdating')) {
						// ** RowUpdating(object &$obj, object &$key))
						$hnd->RowUpdating($obj, $key);
					}
					$cmd = \FGTA4\utils\SqlUtility::CreateSQLUpdate($tablename, $obj, $key);
				}
	
				$stmt = $this->db->prepare($cmd->sql);
				$stmt->execute($cmd->params);

				\FGTA4\utils\SqlUtility::WriteLog($this->db, $this->reqinfo->modulefullname, $tablename, $obj->{$primarykey}, $action, $userdata->username, (object)[]);




				// result
				$options->criteria = [
					"itemasset_id" => $obj->itemasset_id
				];

				$criteriaValues = [
					"itemasset_id" => " itemasset_id = :itemasset_id "
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

				$sqlFieldList = [
					'itemasset_id' => 'A.`itemasset_id`', 'owner_dept_id' => 'A.`owner_dept_id`', 'item_id' => 'A.`item_id`', 'itemasset_name' => 'A.`itemasset_name`',
					'itemasset_merk' => 'A.`itemasset_merk`', 'itemasset_type' => 'A.`itemasset_type`', 'itemasset_serial' => 'A.`itemasset_serial`', 'itemasset_descr' => 'A.`itemasset_descr`',
					'itemstatus_id' => 'A.`itemstatus_id`', 'itemasset_statusnote' => 'A.`itemasset_statusnote`', 'itemasset_ischeckout' => 'A.`itemasset_ischeckout`', 'itemasset_ismoveable' => 'A.`itemasset_ismoveable`',
					'itemasset_isdisabled' => 'A.`itemasset_isdisabled`', 'itemasset_iswrittenof' => 'A.`itemasset_iswrittenof`', 'itemgroup_id' => 'A.`itemgroup_id`', 'itemmodel_id' => 'A.`itemmodel_id`',
					'itemclass_id' => 'A.`itemclass_id`', 'itemasset_baselocation' => 'A.`itemasset_baselocation`', 'site_id' => 'A.`site_id`', 'maintainer_dept_id' => 'A.`maintainer_dept_id`',
					'location_dept_id' => 'A.`location_dept_id`', 'location_site_id' => 'A.`location_site_id`', 'location_room_id' => 'A.`location_room_id`', 'location_empl_id' => 'A.`location_empl_id`',
					'partner_id' => 'A.`partner_id`', 'itemasset_purchasedate' => 'A.`itemasset_purchasedate`', 'itemasset_lastsupportdate' => 'A.`itemasset_lastsupportdate`', 'itemasset_purchasevalue' => 'A.`itemasset_purchasevalue`',
					'curr_id' => 'A.`curr_id`', 'itemasset_purchasevalue_idr' => 'A.`itemasset_purchasevalue_idr`', 'asset_coa_id' => 'A.`asset_coa_id`', 'depremodel_id' => 'A.`depremodel_id`',
					'cost_coa_id' => 'A.`cost_coa_id`', 'itemasset_depreage' => 'A.`itemasset_depreage`', 'itemasset_depreresidu' => 'A.`itemasset_depreresidu`', 'itemasset_currentvalue_idr' => 'A.`itemasset_currentvalue_idr`',
					'itemasset_currentvalue_date' => 'A.`itemasset_currentvalue_date`', 'itemasset_usevaluerate' => 'A.`itemasset_usevaluerate`', 'itemasset_writeoffby' => 'A.`itemasset_writeoffby`', 'itemasset_writeoffdate' => 'A.`itemasset_writeoffdate`',
					'itemasset_writeoffref' => 'A.`itemasset_writeoffref`', '_createby' => 'A.`_createby`', '_createdate' => 'A.`_createdate`', '_modifyby' => 'A.`_modifyby`',
					'_createby' => 'A.`_createby`', '_createdate' => 'A.`_createdate`', '_modifyby' => 'A.`_modifyby`', '_modifydate' => 'A.`_modifydate`'
				];
				$sqlFromTable = "mst_itemasset A";
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

				$dataresponse = array_merge($record, [
					//  untuk lookup atau modify response ditaruh disini
					'owner_dept_name' => \FGTA4\utils\SqlUtility::Lookup($record['owner_dept_id'], $this->db, 'mst_dept', 'dept_id', 'dept_name'),
					'item_name' => \FGTA4\utils\SqlUtility::Lookup($record['item_id'], $this->db, 'mst_item', 'item_id', 'item_name'),
					'itemstatus_name' => \FGTA4\utils\SqlUtility::Lookup($record['itemstatus_id'], $this->db, 'mst_itemstatus', 'itemstatus_id', 'itemstatus_name'),
					'itemgroup_name' => \FGTA4\utils\SqlUtility::Lookup($record['itemgroup_id'], $this->db, 'mst_itemgroup', 'itemgroup_id', 'itemgroup_name'),
					'itemmodel_name' => \FGTA4\utils\SqlUtility::Lookup($record['itemmodel_id'], $this->db, 'mst_itemmodel', 'itemmodel_id', 'itemmodel_name'),
					'itemclass_name' => \FGTA4\utils\SqlUtility::Lookup($record['itemclass_id'], $this->db, 'mst_itemclass', 'itemclass_id', 'itemclass_name'),
					'site_name' => \FGTA4\utils\SqlUtility::Lookup($record['site_id'], $this->db, 'mst_site', 'site_id', 'site_name'),
					'maintainer_dept_name' => \FGTA4\utils\SqlUtility::Lookup($record['maintainer_dept_id'], $this->db, 'mst_dept', 'dept_id', 'dept_name'),
					'dept_name' => \FGTA4\utils\SqlUtility::Lookup($record['location_dept_id'], $this->db, 'mst_dept', 'dept_id', 'dept_name'),
					'site_name' => \FGTA4\utils\SqlUtility::Lookup($record['location_site_id'], $this->db, 'mst_site', 'site_id', 'site_name'),
					'location_room_name' => \FGTA4\utils\SqlUtility::Lookup($record['location_room_id'], $this->db, 'mst_room', 'room_id', 'room_name'),
					'empl_name' => \FGTA4\utils\SqlUtility::Lookup($record['location_empl_id'], $this->db, 'mst_empl', 'empl_id', 'empl_name'),
					'partner_name' => \FGTA4\utils\SqlUtility::Lookup($record['partner_id'], $this->db, 'mst_partner', 'partner_id', 'partner_name'),
					'itemasset_purchasedate' => date("d/m/Y", strtotime($row['itemasset_purchasedate'])),
					'itemasset_lastsupportdate' => date("d/m/Y", strtotime($row['itemasset_lastsupportdate'])),
					'curr_name' => \FGTA4\utils\SqlUtility::Lookup($record['curr_id'], $this->db, 'mst_curr', 'curr_id', 'curr_name'),
					'asset_coa_name' => \FGTA4\utils\SqlUtility::Lookup($record['asset_coa_id'], $this->db, 'mst_coa', 'coa_id', 'coa_name'),
					'depremodel_name' => \FGTA4\utils\SqlUtility::Lookup($record['depremodel_id'], $this->db, 'mst_depremodel', 'depremodel_id', 'depremodel_name'),
					'cost_coa_name' => \FGTA4\utils\SqlUtility::Lookup($record['cost_coa_id'], $this->db, 'mst_coa', 'coa_id', 'coa_name'),
					'itemasset_currentvalue_date' => date("d/m/Y", strtotime($row['itemasset_currentvalue_date'])),
					'itemasset_writeoffby' => \FGTA4\utils\SqlUtility::Lookup($record['itemasset_writeoffby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),

					'_createby' => \FGTA4\utils\SqlUtility::Lookup($record['_createby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),
					'_modifyby' => \FGTA4\utils\SqlUtility::Lookup($record['_modifyby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),
				]);
				
				if (method_exists(get_class($hnd), 'DataOpen')) {
					//  DataOpen(array &$record) : void 
					$hnd->DataOpen($dataresponse);
				}

				$result->username = $userdata->username;
				$result->dataresponse = (object) $dataresponse;
				if (method_exists(get_class($hnd), 'DataSavedSuccess')) {
					// DataSavedSuccess(object &$result) : void
					$hnd->DataSavedSuccess($result);
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

	public function NewId(object $hnd, object $obj) : string {
		// dipanggil hanya saat $autoid == true;

		$id = null;
		$handled = false;
		if (method_exists(get_class($hnd), 'CreateNewId')) {
			// CreateNewId(object $obj) : string 
			$id = $hnd->CreateNewId($obj);
			$handled = true;
		}

		if (!$handled) {
			$id = uniqid();
		}

		return $id;
	}

};