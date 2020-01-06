<?php
  require_once('core/dbconnect.php');
  require_once('core/helperfunctions.php');
  
  $userid = cleanInput($_POST['userid']);
  $title = cleanInput($_POST['title']);
  $speaker = cleanInput($_POST['speaker']);
  $location = cleanInput($_POST['location']);
  $weekday = cleanInput($_POST['weekday']);
  $time = cleanInput($_POST['time']);
  $briefinfo = cleanInput($_POST['briefinfo']);
  
  if ($title === "" ||
      $speaker === "" ||
      $location === "" ||
      $weekday === "" ||
      $time === ""
  ){
    echo outputInJSON(false, "Please enter all required fields");
  } else {
    if (isset($_POST['photo'])){
      $photourl = getServerHost()."/attareeq/api/uploads/speakers/default.jpg";
      echo saveLectureInfo($userid, $title, $speaker, $location, $weekday, $time, $briefinfo, $photourl);
    }else{
      $res = saveSpeakerPhoto();
      if($res['success']){
        $tagetdir = $res['message'];
        $photourl = getServerHost()."/attareeq/api/".$tagetdir;
        echo saveLectureInfo($userid, $title, $speaker, $location, $weekday, $time, $briefinfo, $photourl);
      }else{
        echo outputInJSON(false, $res['message']);
      }
    }
  }

  function saveLectureInfo($userid, $title, $speaker, $location, $weekday, $time, $briefinfo, $photourl){
    $categoryid = 1;
    try{
      global $dbh;
      $cArray = array('categoryid'=>$categoryid, 'topic'=>$title, 'speaker'=>$speaker, 'location'=>$location, 'briefinfo'=>$briefinfo, 'speakerphotourl'=>$photourl, 'createdby'=>$userid);
      $wArray = '';
      $lastId = $dbh->insert('tbllectures', $cArray, $wArray)->getLastInsertId();
      if($lastId > 0){
        $res = saveLectureDayTime($lastId, $weekday, $time);
        if ($res['success']) {
          return outputInJSON(true, "Routine ta'leem successfully posted");
        }else{
          return outputInJSON(false, $res['message']);
        }
      }else{
        return outputInJSON(false, "Error. Routine ta'leem not posted");
      }
    } catch (Exception $e) {
      return outputInJSON(false, "Error. Please try again");;
      //return $e->getMessage();
    }
  }

  function saveLectureDayTime($lectureid, $weekday, $time){
    try{
      global $dbh;
      $cArray = array('lectureid'=>$lectureid, 'time'=>$time, 'dayordate'=>$weekday);
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
?>