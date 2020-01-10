<?php
  require_once('core/dbconnect.php');
  require_once('core/helperfunctions.php');

  //$userid = "18";
  //$userid = $_POST['userid'];
  $json = json_decode(file_get_contents('php://input'), true);
  $userid = $json['userid'];

  try{
    $query = "SELECT COUNT(rowid) 
              FROM tbluserlecturenotification 
              WHERE userid = '$userid' 
              AND status = '0'";
    global $dbh;
    $rs = $dbh->pdoQuery($query)->results();
    //$count = count($rs);

    if($rs > 0){
      echo outputInJSON(true, $rs[0]["COUNT(rowid)"]);
    }else{
      echo outputInJSON(false, $rs[0]["COUNT(rowid)"]);
    }
    
  } catch (Exception $e) {
    echo outputInJSON(false, "Error! Please try again");
    //return $e->getMessage();
  }
?>