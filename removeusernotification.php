<?php
  require_once('core/dbconnect.php');
  require_once('core/helperfunctions.php');

  $json = json_decode(file_get_contents('php://input'), true);
  $userid = $json['userid'];
  $notid = $json['notid'];
  
  try{
    global $dbh;

    $cArray = '';
    $wArray = array('userid'=>$userid, 'notificationid'=>$notid);
    $rs = $dbh->delete('tblusernotification', $wArray)->affectedRows();

    if($rs > 0){
      $dcArray = '';
      $dwArray = array('userid'=>$userid, 'status'=>'0');
      $drs = $dbh->delete('tbluserlecturenotification', $dwArray)->affectedRows();
      echo outputInJSON(true, "Lecture notification removed!");
    }else{
      echo outputInJSON(false, "Error. Lecture notification not removed");
    }

  } catch (Exception $e) {
    //echo outputInJSON(false, "Error. Please try again");;
    echo outputInJSON(false, $e->getMessage());
  }
?>