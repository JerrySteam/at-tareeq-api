<?php
  require_once('core/dbconnect.php');
  require_once('core/helperfunctions.php');
  //json_decode data recieved from client
  $json = json_decode(file_get_contents('php://input'), true);
  $id = $json['id'];
  switch ($id) {
    case 'login':
      processLogin();
      break;
    
    default:
      # code...
      break;
  }
  //echo json_encode(array('success'=>true, 'message'=>$json["password"]));

  function processLogin(){
    global $json;
    $user = cleanInput($json['username']);
    $pass = cleanInput($json['password']);
    if(empty($user) || empty($pass) ){
      echo outputInJSON(false, "Please fill in all fields");
    }else{
      $result = validateLogin($user, $pass);
      if($result['success']){
        echo outputInJSON($result['success'], $result['message']);
      }else{
        echo outputInJSON($result['success'], $result['message']);
      }
    }
  }
?>