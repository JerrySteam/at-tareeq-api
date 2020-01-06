<?php
  require_once('core/dbconnect.php');
  require_once('core/helperfunctions.php');
  
  $lectureid = cleanInput($_POST['lectureid']);
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
      echo updateLectureInfo($lectureid, $title, $speaker, $location, $weekday, $time, $briefinfo, $photourl);
    }else{
      $res = saveSpeakerPhoto();
      if($res['success']){
        $tagetdir = $res['message'];
        $photourl = getServerHost()."/attareeq/api/".$tagetdir;
        echo updateLectureInfo($lectureid, $title, $speaker, $location, $weekday, $time, $briefinfo, $photourl);
      }else{
        echo outputInJSON(false, $res['message']);
      }
    }
  }

  function updateLectureInfo($lectureid, $title, $speaker, $location, $weekday, $time, $briefinfo, $photourl){
    $categoryid = 2;
    try{
      global $dbh;
      $cArray = array('topic'=>$title, 'speaker'=>$speaker, 'location'=>$location, 'briefinfo'=>$briefinfo, 'speakerphotourl'=>$photourl);
      $wArray =  array('lectureid'=>$lectureid);
      $rs = $dbh->update('tbllectures', $cArray, $wArray)->affectedRows();
      if($rs > 0){
        $res = updateLectureDayTime($lectureid, $weekday, $time);
        if ($res['success']) {
          return outputInJSON(true, "Routine Taleem successfully updated");
        }else{
          return outputInJSON(false, $res['message']);
        }
      }else{
        return outputInJSON(false, "Error. Routine Taleem not updated");
      }
    } catch (Exception $e) {
      return outputInJSON(false, "Error. Please try again");;
      //return $e->getMessage();
    }
  }

  function updateLectureDayTime($lectureid, $weekday, $time){
    try{
      global $dbh;
      $cArray = array('time'=>$time);
      //$cArray = array('time'=>$time, 'dayordate'=>$weekday);
      $wArray = array('lectureid'=>$lectureid);
      $rs = $dbh->update('tbllecturedaytime', $cArray, $wArray)->affectedRows();
      if($rs > 0){
        return outputInArray(true, "Lecture date and time updated");
      }else{
        return outputInArray(true, "Error. Lecture date and time not updated");
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