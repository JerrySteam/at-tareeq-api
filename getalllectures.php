<?php
  require_once('core/dbconnect.php');
  require_once('core/helperfunctions.php');
  
  try {
    $query = "SELECT * 
              FROM tbllectures as l 
              INNER JOIN tbllecturedaytime as ld 
              ON l.lectureid = ld.lectureid 
              WHERE l.categoryid = '1' 
              OR str_to_date(ld.dayordate, '%d/%m/%Y') >= CURDATE()
              ORDER BY str_to_date(ld.dayordate, '%d/%m/%Y') ASC";
    global $dbh;
    $rs = $dbh->pdoQuery($query)->results();
    $count = count($rs);

    if($count > 0){
      echo outputInJSON(true, $rs);
    }else{
      echo outputInJSON(false, "No Lectures Found");
    }
    
  } catch (Exception $e) {
    echo outputInJSON(false, "Error. Please try again");
    //return $e->getMessage();
  }
?>