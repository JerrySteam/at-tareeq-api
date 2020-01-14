<?php
	if(!isset($dbh)){
		$dbh = null;
	}

	if(!function_exists("try_db_connect")) {
		function try_db_connect($persistent = false){
			global $dbh;
		
			if ($dbh != null) {
				return $dbh;
			}
			/*
			$db_host		= 'localhost';
			$db_user		= 'root';
			$db_pass		= '';
			$db_database	= 'attareeqdb';*/
			$db_host		= 'localhost';
			$db_user		= 'hochbfld_attareeq';
			$db_pass		= '[Vt!y+@$Y&IB';
			$db_database	= 'hochbfld_attareeq';
	
			$pdo_hlp = 'pdo/class/class.pdohelper.php';
			include_once($pdo_hlp);
			
			$pdo_wrp =  'pdo/class/class.pdowrapper.php';	
			include_once($pdo_wrp);
			
			$dbConfig = array("host"=>$db_host, "dbname"=>$db_database, "username"=>$db_user, "password"=>$db_pass);
	
			$db = new PdoWrapper($dbConfig);
			$helper = new PDOHelper();
			
			// set error log mode true to show error on screen or false to log in log file
			$db->setErrorLog(true);
	
			return $db;
		}
	}
?>