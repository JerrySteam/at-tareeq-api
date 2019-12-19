<?php
  require_once('core/dbconnect.php');
  require_once('core/helperfunctions.php');

  $json = json_decode(file_get_contents('php://input'), true);
  $lectureid = $json['lectureid'];
  $userid = $json['userid'];
  
  try{
    global $dbh;
    $cArray = array('lectureid'=>$lectureid, 'userid'=>$userid);
    $wArray = '';
    $lastId = $dbh->insert('tblfavouritelectures', $cArray, $wArray)->getLastInsertId();

    if($lastId > 0){
      echo outputInJSON(true, "Lecture added to favourites!");
    }else{
      echo outputInJSON(false, "Error. Not added");
    }
  } catch (Exception $e) {
    echo outputInJSON(false, "Error. Please try again");;
    //return $e->getMessage();
  }
?>