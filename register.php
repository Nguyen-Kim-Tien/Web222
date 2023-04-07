<?php

include 'config.php';

if(isset($_POST['submit'])){

   $FName = mysqli_real_escape_string($conn, $_POST['FName']);
   $LName = mysqli_real_escape_string($conn, $_POST['LName']);
   $TelephoneNum = mysqli_real_escape_string($conn, $_POST['TelephoneNum']);
   $Email = mysqli_real_escape_string($conn, $_POST['Email']);
   $Address = mysqli_real_escape_string($conn, $_POST['Address']);
   $Rpass=$_POST['password'];

   $pass = mysqli_real_escape_string($conn, md5($_POST['password']));
   $cpass = mysqli_real_escape_string($conn, md5($_POST['cpassword']));
   $Birthday = $_POST['Birthday'];

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
         $message[] = 'Mật khẩu nhập lại không trùng nhau!';
      }else{
         $res = mysqli_query($conn,"SELECT `Role_ID` FROM `role` WHERE Role_name='khachhang';");
         $result = mysqli_fetch_array($res);
         $RoleID = $result['Role_ID'];


         $account_query=mysqli_query($conn, "INSERT INTO `account`(FName, LName, TelephoneNum,Email,Address,Password,Birthday,ROLE_NO) VALUES('$FName','$LName','$TelephoneNum', '$Email','$Address', '$cpass','$Birthday','$RoleID')");

         if($account_query) {

         $message[] = 'Đăng ký thành công!';
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
      $message[]="Số điện thoại không hợp lệ";
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
   <title>Đăng ký</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>



<?php
if(isset($message)){
   foreach($message as $message){
      echo '
      <div class="message">
         <span>'.$message.'</span>
         <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
      </div>
      ';
   }
}
?>
   
<div class="form-container">

   <form action="" method="post">
      <h3>Đăng ký ngay bây giờ</h3>
      <input type="text" name="FName" placeholder="Nhập tên" required class="box">
      <input type="text" name="LName" placeholder="Nhập họ" required class="box">
      <input type="text" name="TelephoneNum" placeholder="Nhập SDT" required class="box">
      <input type="text" name="Address" placeholder="Nhập địa chỉ"
      required class="box">
      <input type="date" name="Birthday" required class="box" >
      <input type="text" name="Email" placeholder="enter your email" required class="box">
      
      <input type="password" name="password" placeholder="Nhập mật khẩu" required class="box">
      <input type="password" name="cpassword" placeholder="Xác nhận mật khẩu" required class="box">

      <input type="submit" name="submit" value="Đăng ký ngay" class="btn">
      <p>Bạn đã có tài khoản? <a href="login.php">Đăng nhập</a></p>
   </form>

</div>

</body>
</html>