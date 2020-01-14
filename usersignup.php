<?php
  require_once('core/dbconnect.php');
  require_once('core/helperfunctions.php');
  
  //echo var_dump($_POST)."==========".var_dump($_FILES);

  $fullname = cleanInput($_POST['fullname']);
  $phone = cleanInput($_POST['phone']);
  $email = cleanInput($_POST['email']);
  $location = cleanInput($_POST['location']);
  $password = cleanInput($_POST['password']);
  $cpassword = cleanInput($_POST['cpassword']);
  
  if ($fullname === "" ||
      $phone === "" ||
      $email === "" ||
      $password === "" ||
      $password === "" ||
      $cpassword === ""
  ){
    echo outputInJSON(false, "Please enter all required fields");
  } else if (phoneExist($phone)) {
    echo outputInJSON(false, "An account already exist with the phone number you provided");
  } else if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo outputInJSON(false, "Please enter a valid email address");
  } else if (emailExist($email)) {
    echo outputInJSON(false, "An account already exist with the email you provided");
  } else if ($password !== $cpassword) {
    echo outputInJSON(false, "Password and confirm password do not match");
  } else {
    if (isset($_POST['photo'])){
      $photourl = getServerHost()."/attareeq/api/uploads/users/default.jpg";
      echo saveUserInfo($fullname, $phone, $email, $location, $password, $photourl);
    }else{
      $res = saveUserPhoto();
      if($res['success']){
        $tagetdir = $res['message'];
        $photourl = getServerHost()."/attareeq/api/".$tagetdir;
        echo saveUserInfo($fullname, $phone, $email, $location, $password, $photourl);
      }else{
        echo outputInJSON(false, $res['message']);
      }
    }
  }

  function saveUserInfo( $fullname, $phone, $email, $location, $password, $photourl ){
    try{
      global $dbh;
      $token = generateUniqueRef();
      $password = password_hash($password, PASSWORD_DEFAULT);
      $cArray = array('fullname'=>$fullname, 'displayname'=>$fullname, 'phone'=>$phone, 'email'=>$email, 'location'=>$location, 'password'=>$password, 'photourl'=>$photourl, 'token'=>$token);
      $wArray = '';
      $lastId = $dbh->insert('tblusers', $cArray, $wArray)->getLastInsertId();
      if($lastId > 0){

        $res = saveUserRole('1',  $lastId);
        if ($res['success']) {
          sendemail($fullname, $email, $token);
          return outputInJSON(true, "User account successfully created. A confirmation mail has been sent to ".$email);
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

  function saveUserRole($roleid, $userid){
    try{
      global $dbh;
      $cArray = array('roleid'=>$roleid, 'userid'=>$userid);
      $wArray = '';
      $lastId = $dbh->insert('tbluserrole', $cArray, $wArray)->getLastInsertId();
      if($lastId > 0){
        return outputInArray(true, "User role added");
      }else{
        return outputInArray(false, "Error. User role not added");
      }
    } catch (Exception $e) {
      return outputInArray(false, "Error. Please try again");;
      //return $e->getMessage();
    }
  }

  function saveUserPhoto(){
    $target_dir = "uploads/users/";
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