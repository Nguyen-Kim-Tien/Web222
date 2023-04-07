<?php
// biến $conn để lưu trữ kết nối tới cơ sở dữ liệu MySQL bằng hàm mysqli_connect()
$conn = mysqli_connect('localhost','root','Nguyenkimtien1','shop_db') or die('connection failed');

// Biến $image_foldr lưu trữ đường dẫn tới thư mục chứa các hình ảnh đã được tải lên. 
$image_foldr = 'images/';
// Biến $default_img lưu trữ tên của hình ảnh mặc định, được sử dụng nếu không tìm thấy hình ảnh nào trong thư mục được chỉ định.
$default_img = 'user.png';
?>