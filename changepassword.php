<?php
  require_once('core/dbconnect.php');
  require_once('core/helperfunctions.php');
  
  //echo var_dump($_POST)."==========".var_dump($_FILES);

  $userid = cleanInput($_POST['userid']);
  $curpassword = cleanInput($_POST['currentpassword']);
  $newpassword = cleanInput($_POST['newpassword']);
  $conpassword = cleanInput($_POST['confirmpassword']);
  $usrpassword = "";

  $isPasswordFound = getUserPassword($userid);
  if ($isPasswordFound['success']) {
    $usrpassword = $isPasswordFound['message'];
    $usrpassword = $usrpassword[0]['password'];
  }else{
    $usrpassword = $isPasswordFound['message'];
  }

  if ($curpassword === "" ||
      $newpassword === "" ||
      $conpassword === "" 
  ){
    echo outputInJSON(false, "Please enter all required fields");
  } else if ($newpassword !== $conpassword) {
    echo outputInJSON(false, "Password and confirm password do not match");
  } else if (!password_verify($curpassword, $usrpassword)) {
    echo outputInJSON(false, "Invalid current password entered");
  } else {
    echo updateUserPassword($userid, $newpassword);
  }

  function updateUserPassword($userid, $newpassword){
    try{
      global $dbh;
      $newpassword = password_hash($newpassword, PASSWORD_DEFAULT);
      $cArray = array('password'=>$newpassword);
      $wArray = array('userid'=>$userid);
      $rs = $dbh->update('tblusers', $cArray, $wArray)->affectedRows();
      if($rs > 0){
        return outputInJSON(true, "Password successfully updated");
      }else{
        return outputInJSON(false, "Error. Password not updated");
      }
    } catch (Exception $e) {
      return outputInJSON(false, "Error. Please try again");;
      //return $e->getMessage();
    }
  }

  function getUserPassword($userid){
    try{
      $query = "SELECT password 
                FROM tblusers
                WHERE userid = '$userid'
              ";
      global $dbh;
      $rs = $dbh->pdoQuery($query)->results();
      $count = count($rs);

      if($count > 0){
        return outputInArray(true, $rs);
      }else{
        return outputInArray(false, "No Password Found");
      }
    } catch (Exception $e) {
      return outputInArray(false, "Error. Please try again");;
      //return $e->getMessage();
    }
  }

?>