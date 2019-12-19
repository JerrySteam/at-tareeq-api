<?php
  require_once('core/dbconnect.php');
  require_once('core/helperfunctions.php');

  $json = json_decode(file_get_contents('php://input'), true);
  $lectureid = $json['lectureid'];
  $userid = $json['userid'];
  
  try{
    global $dbh;

    $cArray = '';
    $wArray = array('lectureid'=>$lectureid, 'userid'=>$userid);
    $rs = $dbh->delete('tbllecturenotification', $wArray)->affectedRows();

    if($rs > 0){
      echo outputInJSON(true, "Lecture notification removed!");
    }else{
      echo outputInJSON(false, "Error. Not removed");
    }

  } catch (Exception $e) {
    echo outputInJSON(false, "Error. Please try again");;
    //return $e->getMessage();
  }
?>