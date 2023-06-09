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
<header class="header">

   <div class="header-1">
      <div class="flex">
         <div class="share">
            <a href="#" class="fab fa-facebook-f"></a>
            <a href="#" class="fab fa-twitter"></a>
            <a href="#" class="fab fa-instagram"></a>
            <a href="#" class="fab fa-linkedin"></a>
         </div>
         <p><a href="logout.php"><i class="fa-solid fa-arrow-right-from-bracket"></i></a></p>

      </div>
   </div>

   <div class="header-2">
      <div class="flex">
         <a href="home.php" class="logo"><img src='./images/lg.png' style='width:150px'></img></a>

         <nav class="navbar" >
            <a href="home.php">Trang chủ</a>
            <a href="about.php">Về chúng tôi</a>
            <a href="books.php">Sách</a>
            <a href="magazine.php">Tạp chí</a></a>
            <a href="contact.php">Liên hệ</a>
            <a href="orders.php">Đơn hàng</a>
            <a href="news.php">Tin tức</a>
         </nav>

         <div class="icons" style="display:flex;flex-direction:row;">
            <div id="menu-btn" class="fas fa-bars"></div>
            <a href="search_page.php" class="fas fa-search"></a>
            
            <?php
               $select_image = mysqli_query($conn, "SELECT Image FROM `account` WHERE Account_ID = '".$_SESSION["user_id"]."'") or die("image query failed");
               $img_info = mysqli_fetch_array($select_image);
               // unset($img_info["Image"]);
               if(array_key_exists("Image",$img_info) && $img_info["Image"]){echo '<div id="user-btn" class="ava-pic"><img loading="lazy" src="'.$image_foldr.$img_info["Image"].'"></div>';}
               else{echo '<div id="user-btn" class="fas fa-user"></div>';}
            ?>
            <style>.ava-pic>img{height:3.5rem;width:3.5rem;border-radius:50%;}</style>
            
            <?php
               $select_cart_number = mysqli_query($conn, "SELECT * FROM `cart` WHERE user_id = '$user_id'") or die('query failed');
               $cart_rows_number = mysqli_num_rows($select_cart_number); 
            ?>
            <a href="cart.php"> <i class="fas fa-shopping-cart"></i> <span>(<?php echo $cart_rows_number; ?>)</span> </a>
         </div>

         <div class="user-box">
            <p><span><?php echo $_SESSION['user_name']; ?></span></p>
            <p><span><?php echo $_SESSION['user_email']; ?></span></p>
            <?php echo '<a href="info_edit.php?id='.$_SESSION["user_id"].'" class="btn">Chỉnh sửa</a>'; ?>
         </div>
      </div>
   </div>

</header>