<?php
  require_once('core/dbconnect.php');
  require_once('core/helperfunctions.php');

  $userid = $_POST['userid'];
  try{
    $query = "SELECT * 
              FROM tblmosque
              WHERE registeredby = '$userid'";
    global $dbh;
    $rs = $dbh->pdoQuery($query)->results();
    $count = count($rs);

    if($count > 0){
      echo outputInJSON(true, $rs);
    }else{
      echo outputInJSON(false, "You are not an admin for any mosque or organization.");
    }
    
  } catch (Exception $e) {
    echo outputInJSON(false, "Error! Please try again");
    //return $e->getMessage();
  }
?>