<?php
	require_once('dbconnect.php');
	$dbh = try_db_connect(true);

	function getServerHost(){
		return "http://".$_SERVER['HTTP_HOST'];
	}
  function cleanInput($data)
	{
		$data = trim($data);
		$data = stripslashes($data);
		$data = htmlspecialchars($data);
		$data = addslashes($data);

		return $data;
	}

	function outputInJSON($status=false, $message='')
	{
		return json_encode(array('success'=>$status, 'message'=>$message));
	}

	function outputInArray($status=false, $message='')
	{
		return array('success'=>$status, 'message'=>$message);
	}
	
	function validateLogin($username, $password)
	{
		try {
			$query = "SELECT * 
								FROM tblusers 
								WHERE (phone ='".$username."' OR email ='".$username."') AND password='".$password."'";
			global $dbh;
			$rs = $dbh->pdoQuery($query)->results();
			$count = count($rs);

			if($count === 1){
				return outputInArray(true, $rs);
			}else{
				return outputInArray(false, "Invalid login credentials");
			}
			
		} catch (Exception $e) {
			resultInJSON(false, "Error. Please try again");
			//return $e->getMessage();
		}
	}

?>