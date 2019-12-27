<?php
  require_once('core/dbconnect.php');
  require_once('core/helperfunctions.php');
  
  //echo var_dump($_POST)."==========".var_dump($_FILES);

  $fullname = cleanInput($_POST['fullname']);
  $displayname = cleanInput($_POST['displayname']);
  $userid = cleanInput($_POST['userid']);
  
  if ($fullname === "" || $displayname === ""){
    echo outputInJSON(false, "Please enter all required fields");
  } else {
    if (isset($_POST['photo'])){
      $photourl = getServerHost()."/attareeq/api/uploads/default.jpg";
      echo updateUserInfo($userid, $fullname, $displayname, $photourl);
    }else{
      $res = updateUserPhoto();
      if($res['success']){
        $tagetdir = $res['message'];
        $photourl = getServerHost()."/attareeq/api/".$tagetdir;
        echo updateUserInfo($userid, $fullname, $displayname, $photourl);
      }else{
        echo outputInJSON(false, $res['message']);
      }
    }
  }

  function updateUserInfo($userid, $fullname, $displayname, $photourl ){
    try{
      global $dbh;
      $cArray = array('fullname'=>$fullname, 'displayname'=>$displayname, 'photourl'=>$photourl);
      $wArray = array('userid'=>$userid);
      $rs = $dbh->update('tblusers', $cArray, $wArray)->affectedRows();
      if($rs > 0){
        return outputInJSON(true, "User account successfully updated");
      }else{
        return outputInJSON(false, "Error. User account not updated");
      }
    } catch (Exception $e) {
      return outputInJSON(false, "Error. Please try again");;
      //return $e->getMessage();
    }
  }
  
  function updateUserPhoto(){
    $target_dir = "uploads/";
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