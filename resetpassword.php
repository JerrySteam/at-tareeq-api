<?php
  require_once('core/dbconnect.php');
  require_once('core/helperfunctions.php');

  if (isset($_POST['resetpassword'])) {
    $email = cleanInput($_POST['email']);
    
    $res = verifyEmail($email);
    if ($res['success']) {
      echo saveEmailandToken($email);
    }else{
      echo outputInJSON(false, $res['message']);
    }
  }

  if (isset($_POST['newpassword'])) {
    $email = cleanInput($_POST['email']);
    $token = cleanInput($_POST['token']);
    $password = cleanInput($_POST['password']);
    $cpassword = cleanInput($_POST['cpassword']);

    $res = verifyEmail($email);
    if ($res['success']) {
      echo processPasswordReset($email, $token, $password, $cpassword);
    }else{
      echo outputInJSON(false, $res['message']);
    }
  }

  function verifyEmail($email){
    if ($email === "" || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
      return outputInArray(false, "Please enter a valid email address");
    } else {
      try{
        $query = "SELECT email FROM tblusers WHERE email = '$email'";
        global $dbh;
        $rs = $dbh->pdoQuery($query)->results();
        $count = count($rs);
    
        if($count <= 0){
          return outputInArray(false, "Sorry, no user exists on our system with that email");
        }else{
          return outputInArray(true, "yes");
        }
        
      } catch (Exception $e) {
        return outputInArray(false, "Error! Please try again");
        //return $e->getMessage();
      }
    }
  }

  function saveEmailandToken($email){
    //$token = bin2hex(random_bytes(50));
    $token = generateUniqueRef();

    try{
      global $dbh;
      $cArray = array('email'=>$email, 'token'=>$token);
      $wArray = '';
      $lastId = $dbh->insert('tblpasswordresets', $cArray, $wArray)->getLastInsertId();
      if($lastId > 0){
        $to = $email;
        $subject = "Reset your password on At-tareeq App";
        $msg = "Hi there, the code: ".$token." is required to reset your At-tareeq App password";
        $msg = wordwrap($msg,70);
        $headers = "From: info@hochenmu.ng";
        mail($to, $subject, $msg, $headers);
        return outputInJSON(true, "We sent an email to ".$email." to help you recover your account.");
      }else{
        return outputInJSON(false, "Error. Email not sent");
      }
    } catch (Exception $e) {
      return outputInJSON(false, "Error. Please try again");;
      //return $e->getMessage();
    }
  }

  function processPasswordReset($email, $token, $password, $cpassword){
    if (empty($token) || empty($password) || empty($cpassword)) {
      return outputInJSON(false, "All fields are required");
    }elseif ($password !== $cpassword) {
      return outputInJSON(false, "Password do not match");
    }else{
      try{
        $query = "SELECT email FROM tblpasswordresets WHERE token='$token' LIMIT 1";
        global $dbh;
        $rs = $dbh->pdoQuery($query)->results();
        $count = count($rs);
        $r_email = $rs[0]['email'];
    
        if(($count === 1) && ($email === $r_email)){
          return updatePassword($r_email, $password);
        }else{
          //return outputInJSON(false, $email."==".$r_email);
          return outputInJSON(false, "Invalid code");
        }
      } catch (Exception $e) {
        return outputInJSON(false, "Error! Please try again");
        //return $e->getMessage();
      }
    }
  }

  function updatePassword($email, $password){
    try{
      global $dbh;
      $password = password_hash($password, PASSWORD_DEFAULT);
      $cArray = array('password'=>$password);
      $wArray =  array('email'=>$email);
      $rs = $dbh->update('tblusers', $cArray, $wArray)->affectedRows();
      if($rs > 0){
        return outputInJSON(true, "Password successfully updated");
      }else{
        return outputInJSON(false, "Password not updated");
      }
    } catch (Exception $e) {
      return outputInJSON(false, "Error updating password. Please try again");;
      //return $e->getMessage();
    }
  }

?>