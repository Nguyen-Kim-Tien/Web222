<?php

include 'config.php';
if(isset($_POST['submit'])){

    $FName = mysqli_real_escape_string($conn, $_POST['FName']);
    $LName = mysqli_real_escape_string($conn, $_POST['LName']);
    $TelephoneNum = mysqli_real_escape_string($conn, $_POST['TelephoneNum']);
    $Email = mysqli_real_escape_string($conn, $_POST['Email']);
    $Rpass=$_POST['password'];
 
    $pass = mysqli_real_escape_string($conn, md5($_POST['password']));
    $cpass = mysqli_real_escape_string($conn, md5($_POST['cpassword']));
 
    $check_FName=1;
    $check_LName=1;
    $check_TelephoneNum=1;
    $check_Password=1;
 
    $len=strlen($FName);
    for ($i=0; $i<$len; $i++) {
       if(($FName[$i]>='a'&&$FName[$i]<='z')||($FName[$i]>='A'&&$FName[$i]<='Z')) {
          continue;
       }
       else {
          $check_FName=0;
       }
    }
 
    $len=strlen($LName);
    for ($i=0; $i<$len; $i++) {
       if(($LName[$i]>='a'&&$LName[$i]<='z')||($LName[$i]>='A'&&$LName[$i]<='Z')) {
          continue;
       }
       else {
          $check_LName=0;
       }
    }
 
    $len=strlen($TelephoneNum);
    if($TelephoneNum[0]!='0') {
       $check_TelephoneNum=0;
    }
    for ($i=0; $i<$len; $i++) {
       if(($TelephoneNum[$i]>='0'&&$TelephoneNum[$i]<='9')) {
          continue;
       }
       else {
          $check_TelephoneNum=0;
       }
    }
 
 
    $len=strlen($Rpass);
    if($len<8) {
       $check_Password=0;
    }
    for ($i=0; $i<$len; $i++) {
       if(($Rpass[$i]>='0'&&$Rpass[$i]<='9')||($Rpass[$i]>='a'&&$Rpass[$i]<='z')||($Rpass[$i]>='A'&&$Rpass[$i]<='Z')) {
          continue;
       }
       else {
          $check_Password=0;
       }
    }
 
    if($check_FName&&$check_LName&&$check_Password&&$check_TelephoneNum){
 
 
    $select_users = mysqli_query($conn, "SELECT * FROM `account` WHERE Email = '$Email'") or die('query failed');
 
    if(mysqli_num_rows($select_users) > 0){
       $message[] = 'Người dùng đã tồn tại!';
    }else{
       if($pass != $cpass){
          $message[] = 'Xác nhận mật khẩu không trùng khớp!';
       }else{
          $res = mysqli_query($conn,"SELECT `Role_ID` FROM `role` WHERE Role_name='khachhang';");
          $result = mysqli_fetch_array($res);
          $RoleID = $result['Role_ID'];
 
 
          $account_query=mysqli_query($conn, "INSERT INTO `account`(FName, LName, TelephoneNum,Email,Password,ROLE_NO) VALUES('$FName','$LName','$TelephoneNum', '$Email','$cpass','$RoleID')");
 
          if($account_query) {
            $message[] = 'Đăng ký thành công, chuyển hướng đến đăng nhập sau 2 giây!!';
            header('Refresh: 2; login.php');
          }
 
          else {
             $message[]="Email không hợp lệ";
          }
       }
    }
 }
 
 else {
    if(!$check_FName) {
       $message[]="Tên không hợp lệ";
    }
 
    if(!$check_LName) {
       $message[]="Họ không hợp lệ";
    }
 
    if(!$check_Password) {
       $message[]="Mật khẩu quá ngắn hoặc không hợp lệ";
    }
 
    if(!$check_TelephoneNum) {
       $message[]="SDT không hợp lệ";
    }
 }

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Đăng nhập</title>

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
   <link rel="stylesheet" href="css/login.css">
</head>
<body>
<?php
if(isset($message)){
      echo '
      <div class="message">
         <strong>'.$message[count($message)-1].'</strong>
         <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
      </div>
      ';
}
?>
<style>
.message{
  position: sticky;
  top:0;
  margin:0 auto;
  max-width: 1200px;
  border-radius:10px;
  padding:2rem;
  display: flex;
  align-items: center;
  justify-content: space-between;
  z-index: 10000;
  gap:1.5rem;
  background-color:#EEEEEE;
}
.message strong{
  font-size: 1rem;
  color:red;
  font-weight:bold;
}
.message i{
  cursor: pointer;
  color:red;
  font-size: 2rem;
}
.message i:hover{
  transform: rotate(90deg);
}
</style>
   
<!-- <div class="form-container">

   <form action="" method="post">
      <h3>login now</h3>
      <input type="email" name="Email" placeholder="enter your email" required class="box">
      <input type="password" name="Password" placeholder="enter your password" required class="box">
      <input type="submit" name="submit" value="login now" class="btn">
      <p>don't have an account? <a href="register.php">register now</a></p>
   </form>

</div> -->
<div class="container" id="container">
  <div class="form-container sign-up-container">
    <form action="" method="post">
      <h1>Tạo tài khoản</h1>
      <input type="text" placeholder="Nhập tên" name="FName" required/>
      <input type="text" placeholder="LName" name="LName" required/>
      <input type="email" placeholder="Email" name="Email" required/>
      <input type="telephonenum" placeholder="TelephoneNum" name="TelephoneNum" required/>
      <input type="password" placeholder="Password" name="password" />
      <input type="password" placeholder="Retype your password" name="cpassword"/>
      <input type="submit" name="submit" value="register now" class="btn">
    </form>
  </div>
  <div class="form-container sign-in-container">
    <form action="" method="post">
      <h1>Đăng ký</h1>
      <input type="text" placeholder="Nhập tên" name="FName" required/>
      <input type="text" placeholder="Nhập họ" name="LName" required/>
      <input type="email" placeholder="Nhập email" name="Email" required/>
      <input type="telephonenum" placeholder="Nhập SDT" name="TelephoneNum" required/>
      <input type="password" placeholder="Nhập mật khẩu" name="password" />
      <input id="passw" type="password" placeholder="Xác nhận mật khẩu" name="cpassword"/>
      <!--show/hide password-->
      <i class="fas fa-eye" id="toggle-passw"></i>
      <style>#toggle-passw{position:relative; left:40%;bottom:7%; cursor:pointer; z-index:69;}</style>
      <script>
      document.getElementById('toggle-passw').addEventListener('click', function(eve) {
         const password_field = document.getElementById('passw');
         const type = password_field.getAttribute('type') === 'password' ? 'text' : 'password';
         password_field.setAttribute('type', type);
         this.classList.toggle('fa-eye-slash');
      });
      </script>
      <!--show/hide password-->
      <input type="submit" name="submit" value="Đăng ký" class="btn">
    </form>
  </div>
  <div class="overlay-container">
    <div class="overlay">
      <div class="overlay-panel overlay-left">
        <h1>Welcome Back!</h1>
        <!-- <p>To keep connected with us please login with your personal info</p> -->
        <p>You will need an account to start shopping with us!</p>
        <button class="ghost" id="signIn">Sign In</button>
      </div>
      <div class="overlay-panel overlay-right">
        <h1>Chào mừng bạn!</h1>
        <!-- <p>Enter your personal details and start journey with us</p> -->
        <p>Bạn đã có tài khoản ?</p>
        <button class="ghost" id="signUp"> <a href="login.php">Đăng nhập</a></button>
      </div>
    </div>
  </div>
</div>
</body>
</html>