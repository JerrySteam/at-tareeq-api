<?php
  require_once('core/dbconnect.php');
  require_once('core/helperfunctions.php');
  
  try {
    $json = json_decode(file_get_contents('php://input'), true);
    $userid = $json['userid'];

    $query = "SELECT * 
              FROM tblfavouritelectures as fl 
              INNER JOIN tbllectures as l 
              INNER JOIN tbllecturedaytime as ld 
              ON fl.lectureid = l.lectureid 
              AND l.lectureid = ld.lectureid 
              WHERE fl.userid = '$userid'
              AND l.categoryid = '1'
              ORDER BY l.datecreated ASC";
    global $dbh;
    $rs = $dbh->pdoQuery($query)->results();
    $count = count($rs);

    if($count > 0){
      echo outputInJSON(true, $rs);
    }else{
      echo outputInJSON(false, "No Routine Ta'leem Found");
    }
    
  } catch (Exception $e) {
    echo outputInJSON(false, "Error. Please try again");
    //return $e->getMessage();
  }
?>