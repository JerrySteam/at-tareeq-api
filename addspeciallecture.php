<?php
  require_once('core/dbconnect.php');
  require_once('core/helperfunctions.php');
  
  $userid = cleanInput($_POST['userid']);
  $title = cleanInput($_POST['title']);
  $speaker = cleanInput($_POST['speaker']);
  $location = cleanInput($_POST['location']);
  $date = cleanInput($_POST['date']);
  $time = cleanInput($_POST['time']);
  $briefinfo = cleanInput($_POST['briefinfo']);
  $latitude = cleanInput($_POST['latitude']);
  $longitude = cleanInput($_POST['longitude']);
  
  if ($title === "" ||
      $speaker === "" ||
      $location === "" ||
      $date === "" ||
      $time === null
  ){
    echo outputInJSON(false, "Please enter all required fields");
  } else {
    if (isset($_POST['photo'])){
      $photourl = getServerHost()."/attareeq/api/uploads/speakers/default.jpg";
      echo saveLectureInfo($userid, $title, $speaker, $location, $date, $time, $briefinfo, $latitude, $longitude, $photourl);
    }else{
      $res = saveSpeakerPhoto();
      if($res['success']){
        $tagetdir = $res['message'];
        $photourl = getServerHost()."/attareeq/api/".$tagetdir;
        echo saveLectureInfo($userid, $title, $speaker, $location, $date, $time, $briefinfo, $latitude, $longitude, $photourl);
      }else{
        echo outputInJSON(false, $res['message']);
      }
    }
  }

  function saveLectureInfo($userid, $title, $speaker, $location, $date, $time, $briefinfo, $latitude, $longitude, $photourl){
    $categoryid = 2;
    try{
      global $dbh;
      $cArray = array('categoryid'=>$categoryid, 'topic'=>$title, 'speaker'=>$speaker, 'location'=>$location, 'briefinfo'=>$briefinfo, 'latitude'=>$latitude, 'longitude'=>$longitude, 'speakerphotourl'=>$photourl, 'createdby'=>$userid);
      $wArray = '';
      $lectureid = $dbh->insert('tbllectures', $cArray, $wArray)->getLastInsertId();
      if($lectureid > 0){
        $res = saveLectureDayTime($lectureid, $date, $time);
        if ($res['success']) {

          $nid = "1";
          $users = getUsersToNotify($nid);
          if($users['success']){
            $res2 = saveLectureNotification($lectureid, $users['message']);
          }

          return outputInJSON(true, "Special lecture successfully posted");
        }else{
          return outputInJSON(false, $res['message']);
        }
      }else{
        return outputInJSON(false, "Error. User account not created");
      }
    } catch (Exception $e) {
      return outputInJSON(false, "Error. Please try again");;
      //return $e->getMessage();
    }
  }

  function saveLectureDayTime($lectureid, $date, $time){
    try{
      global $dbh;
      $cArray = array('lectureid'=>$lectureid, 'time'=>$time, 'dayordate'=>$date);
      $wArray = '';
      $lastId = $dbh->insert('tbllecturedaytime', $cArray, $wArray)->getLastInsertId();
      if($lastId > 0){
        return outputInArray(true, "Lecture day/time saved");
      }else{
        return outputInArray(false, "Error. Lecture day/time not saved");
      }
    } catch (Exception $e) {
      return outputInArray(false, "Error. Please try again");;
      //return $e->getMessage();
    }
  }

  function saveSpeakerPhoto(){
    $target_dir = "uploads/speakers/";
    $target_file = $target_dir . basename($_FILES["photo"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
    $msg = '';
    // Check if file already exists
    if (file_exists($target_file)) {
      $msg = "Sorry, file already exists.";
      $uploadOk = 0;
    }
    // Check file size
    if ($_FILES["photo"]["size"] > 500000) {
      $msg = "Sorry, your file is too large. Max Size: 500KB";
      $uploadOk = 0;
    }
    // Allow certain file formats
    if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
    && $imageFileType != "gif" ){
      $msg = "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
      $uploadOk = 0;
    }
    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
      //$msg = "Sorry, your file was not uploaded.";
      return outputInArray(false, $msg);
    // if everything is ok, try to upload file
    } else {
      if (move_uploaded_file($_FILES["photo"]["tmp_name"], $target_file)) {
        $msg = "The file ". basename( $_FILES["photo"]["name"]). " has been uploaded.";
        return outputInArray(true, $target_file);
      } else {
        $msg = "Sorry, there was an error uploading your file.";
        return outputInArray(false, $msg);
      }
    }
  }

  function getUsersToNotify($nid){
    try {
      $query = "SELECT userid 
                FROM tblusernotification
                WHERE notificationid = '$nid'";
      global $dbh;
      $rs = $dbh->pdoQuery($query)->results();
      $count = count($rs);
  
      if($count > 0){
        return outputInArray(true, $rs);
      }else{
        return outputInArray(false, "User has no notification");
      }
      
    } catch (Exception $e) {
      return outputInArray(false, "Error. Please try again");
      //return $e->getMessage();
    }
  }

  function saveLectureNotification($lectureid, $users){
    try{
      global $dbh;
      $count = 0;
      foreach ($users as $user) { 
        $cArray = array('lectureid'=>$lectureid, 'userid'=>$user['userid']);
        $wArray = '';
        $lastId = $dbh->insert('tbluserlecturenotification', $cArray, $wArray)->getLastInsertId();
        $count++;
      }

      if($count === count($users)){
        return outputInArray(true, "Users lecture notification saved");
      }else{
        return outputInArray(false, "Error. Users lecture notification not saved");
      }
    } catch (Exception $e) {
      return outputInArray(false, "Error. Please try again");;
      //return $e->getMessage();
    }
  }
?>