<?php
  require_once('core/dbconnect.php');
  require_once('core/helperfunctions.php');
  
  try {
    $query = "SELECT * 
              FROM tblhelpcenter
              ORDER BY title ASC";
    global $dbh;
    $rs = $dbh->pdoQuery($query)->results();
    $count = count($rs);

    if($count > 0){
      echo outputInJSON(true, $rs);
    }else{
      echo outputInJSON(false, "No Help Center Content Found");
    }
    
  } catch (Exception $e) {
    echo outputInJSON(false, "Error. Please try again");
    //return $e->getMessage();
  }
?>