<?php
  require_once('core/dbconnect.php');
  require_once('core/helperfunctions.php');

  //$userid = "18";
  //$userid = $_POST['userid'];
  $json = json_decode(file_get_contents('php://input'), true);
  $userid = $json['userid'];

  try{
    global $dbh;
    $cArray = '';
    $wArray = array('userid'=>$userid, 'status'=>'0');
    $rs = $dbh->delete('tbluserlecturenotification', $wArray)->affectedRows();

    if($rs > 0){
      echo outputInJSON(true, "User Lecture notification removed!");
    }else{
      echo outputInJSON(false, "Error. Not removed");
    }

  } catch (Exception $e) {
    echo outputInJSON(false, "Error. Please try again");;
    //return $e->getMessage();
  }
?>