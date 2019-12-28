<?php
  require_once('core/dbconnect.php');
  require_once('core/helperfunctions.php');

  $json = json_decode(file_get_contents('php://input'), true);
  $userid = $json['userid'];
  $notid = $json['notid'];
  
  try{
    $query = "SELECT * 
              FROM tblusernotification
              WHERE userid = '$userid'
              AND notificationid = '$notid'";
    global $dbh;
    $rs = $dbh->pdoQuery($query)->results();
    $count = count($rs);

    if($count > 0){
      echo outputInJSON(true, "Yes");
    }else{
      echo outputInJSON(false, "No");
    }
    
  } catch (Exception $e) {
    echo outputInJSON(false, "Error! Please try again");
    //return $e->getMessage();
  }
?>