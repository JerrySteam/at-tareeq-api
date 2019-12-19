<?php
  require_once('core/dbconnect.php');
  require_once('core/helperfunctions.php');

  $json = json_decode(file_get_contents('php://input'), true);
  $lectureid = $json['lectureid'];
  $userid = $json['userid'];
  
  try{
    $query = "SELECT * 
              FROM tblfavouritelectures
              WHERE lectureid = '$lectureid'
              AND userid = '$userid'";
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