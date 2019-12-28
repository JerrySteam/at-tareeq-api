<?php
  require_once('core/dbconnect.php');
  require_once('core/helperfunctions.php');
  
  //echo var_dump($_POST)."==========".var_dump($_FILES);

  $userid = cleanInput($_POST['userid']);
  $phone = cleanInput($_POST['phone']);
  $message = cleanInput($_POST['message']);
  $status = 'unread';

  if ($phone === "" || $message === ""){
    echo outputInJSON(false, "Please enter all required fields");
  } else {
    echo sendFeedback($userid, $phone, $message, $status);
  }

  function sendFeedback($userid, $phone, $message, $status){
    try{
      global $dbh;
      $cArray = array('userid'=>$userid, 'phone'=>$phone, 'message'=>$message, 'status'=>$status);
      $wArray = '';
      $lastId = $dbh->insert('tbluserfeedback', $cArray, $wArray)->getLastInsertId();

      if($lastId > 0){
        return outputInJSON(true, "Message successfully sent. We will contact you via ".$phone." shortly");
      }else{
        return outputInJSON(false, "Error. Message not sent");
      }
      
    } catch (Exception $e) {
      return outputInJSON(false, "Error. Please try again");;
      //return $e->getMessage();
    }
  }
?>