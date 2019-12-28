<?php
  require_once('core/dbconnect.php');
  require_once('core/helperfunctions.php');

  $json = json_decode(file_get_contents('php://input'), true);
  $userid = $json['userid'];
  $notid = $json['notid'];
  
  try{
    global $dbh;
    $cArray = array('userid'=>$userid, 'notificationid'=>$notid);
    $wArray = '';
    $lastId = $dbh->insert('tblusernotification', $cArray, $wArray)->getLastInsertId();

    if($lastId > 0){
      echo outputInJSON(true, "Lecture notification added");
    }else{
      echo outputInJSON(false, "Error. Lecture notification not added");
    }
  } catch (Exception $e) {
    //echo outputInJSON(false, "Error. Please try again");;
    echo outputInJSON(false, $e->getMessage());
  }
?>