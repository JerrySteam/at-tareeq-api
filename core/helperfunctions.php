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

	function generateUniqueRef($prefix="")
	{
		$random = time() . rand(10*45, 100*98);
		$ref = $prefix."".$random;
		return $ref;
	}

	function outputInJSON($status=false, $message='')
	{
		return json_encode(array('success'=>$status, 'message'=>$message));
	}

	function outputInArray($status=false, $message='')
	{
		return array('success'=>$status, 'message'=>$message);
	}
	
	function validateLogin2($username, $password)
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

	function validateLogin($username, $password)
	{
		try {
			$query = "SELECT * 
								FROM tblusers AS u
								INNER JOIN tbluserrole AS ur
								ON u.userid = ur.userid
								WHERE (u.phone ='".$username."' OR u.email ='".$username."') 
									AND u.status = '1'
							";
			global $dbh;
			$rs = $dbh->pdoQuery($query)->results();
			$count = count($rs);

			if($count === 1 && password_verify($password, $rs[0]['password'])){
				return outputInArray(true, $rs);
			}else{
				return outputInArray(false, "Invalid login credentials");
			}
			
		} catch (Exception $e) {
			resultInJSON(false, "Error. Please try again");
			//return $e->getMessage();
		}
	}

	function encryption($str){
		$ciphering = "BF-CBC"; 
		$iv_length = openssl_cipher_iv_length($ciphering); 
		$options = 0; 
		$encryption_iv = random_bytes($iv_length); 
		$encryption_key = openssl_digest(php_uname(), 'MD5', TRUE); 
		$encryption = openssl_encrypt($str, $ciphering, $encryption_key, $options, $encryption_iv); 
		return $encryption;
	}

	function decryption($str){
		$ciphering = "BF-CBC"; 
		$iv_length = openssl_cipher_iv_length($ciphering); 
		$options = 0; 
		$decryption_iv = random_bytes($iv_length); 
		$decryption_key = openssl_digest(php_uname(), 'MD5', TRUE); 
		$decryption = openssl_decrypt ($str, $ciphering, $decryption_key, $options, $decryption_iv); 

		return $decryption;
	}

	function sendemail($fullname, $email, $token){
		$firstname = explode(" ", $fullname)[0];
		$token = encryption($token);
    $link = "http://hochenmu.ng/accountconfirmation.php?c=".$email."&k=".$token;

    $to = $email;
    $subject = "At-tareeq Account Confirmation";
    $msg = "Hi ".$firstname.", \n\nThank you for signing up on At-tareeq App. Kindly click on the link below to confirm your account :\n".$link;
    $msg = wordwrap($msg,70);
    $headers = "From: info@hochenmu.ng";
    mail($to, $subject, $msg, $headers);
  }

	function phoneExist($phone){
		try {
			$query = "SELECT * FROM tblusers WHERE phone = '$phone'";
			global $dbh;
			$rs = $dbh->pdoQuery($query)->results();
			$count = count($rs);

			if($count > 0){
				return true;
			}else{
				return false;
			}
			
		} catch (Exception $e) {
			return true;
			//return $e->getMessage();
		}
	}

	function emailExist($email){
		try {
			$query = "SELECT * FROM tblusers WHERE email = '$email'";
			global $dbh;
			$rs = $dbh->pdoQuery($query)->results();
			$count = count($rs);

			if($count > 0){
				return true;
			}else{
				return false;
			}
			
		} catch (Exception $e) {
			return true;
			//return $e->getMessage();
		}
	}

	
?>