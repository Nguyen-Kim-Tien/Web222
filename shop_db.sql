-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3308
-- Thời gian đã tạo: Th12 13, 2022 lúc 05:04 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shop_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `Account_ID` int(11) NOT NULL,
  `FName` varchar(255) NOT NULL,
  `LName` varchar(255) NOT NULL,
  `TelephoneNum` varchar(15) DEFAULT NULL,
  `Start_date` datetime DEFAULT current_timestamp(),
  `Address` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `ROLE_NO` int(11) NOT NULL,
  `Deleted` int(11) DEFAULT 0,
  `Image` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`Account_ID`, `FName`, `LName`, `TelephoneNum`, `Start_date`, `Address`, `Email`, `Password`, `ROLE_NO`, `Deleted`, `Image`) VALUES
(18, 'tien', 'nguyen', '0904473064', '2022-12-02 13:42:36', '323, Pham Van Chieu, P14, Go Vap, TPHCM', '123@gmail.com', '1f2f7b6c22218522f8cb879939b5ed37', 4, 0, 'author-1.jpg'),
(19, 'Tien', 'Nguyen', '0923236277', '2022-12-02 13:47:20', '323, Pham Văn Chiêu', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b', 1, 0, 'author-1.jpg'),
(22, 'Tien2', 'Nguyen', '0913704201', '2022-12-02 14:33:55', '323, Ly ThuonG kiet', 'staff1@gmail.com', '25f9e794323b453885f5181f1b624d0b', 3, 0, 'author-1.jpg'),
(34, 'Tien3', 'Nguyen', '0998876678', '2022-12-04 03:52:27', '66, Lê tèo, hcm', 'staff2@gmail.com', '25f9e794323b453885f5181f1b624d0b', 2, 0, 'author-1.jpg'),
(28, 'Quyen', 'Tuan', '0117773889', '2022-12-04 22:18:05', 'Quan 1, Ho Chi Minh', 'quyen@gmail.com', '1b8d23600288e0277850eea3d7ec13ca', 4, 0, 'author-2.jpg'),
(31, 'Khang', 'Phan', '03730154', '2022-12-05 20:27:05', 'Kí túc xá khu C', 'khang@gmail.com.vn', '0e3367240684e2463cbe0daa0362138d', 4, 0, 'author-3.jpg'),
(32, 'Quyen', 'Hiiii', '0373015428', '2022-12-13 01:37:05', NULL, 'quyen1@gmail.com', '25d55ad283aa400af464c76d713c07ad', 4, 0, 'author-2.jpg'),
(33, 'Duc', 'Huynh', '0373015428', '2022-12-13 11:47:56', NULL, 'duc@gmail.comm', '0e3367240684e2463cbe0daa0362138d', 4, 0, 'author-4.jpg');


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `author`
--

CREATE TABLE `author` (
  `Author_ID` int(11) NOT NULL,
  `Fullname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `author`
--

INSERT INTO `author` (`Author_ID`, `Fullname`) VALUES
(4, 'Tác giả 1'),
(5, 'Tác giả 2'),
(6, 'Tác giả 3'),
(7, 'Tác giả 4'),
(8, 'Tác giả 5'),
(9, 'Tác giả 6'),
(12, 'Tác giả 7'),
(13, 'Tác giả 8'),
(14, 'Tác giả 9'),
(17, 'Tác giả 10'),
(18, 'Tác giả 11'),
(19, 'Tác giả 12'),
(20, 'Tác giả 13'),
(21, 'Tác giả 14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book`
--

CREATE TABLE `book` (
  `Product_ID` int(11) NOT NULL,
  `Publish_year` year(4) NOT NULL,
  `Quantity_in_store` int(11) NOT NULL,
  `CATEG_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `book`
--

INSERT INTO `book` (`Product_ID`, `Publish_year`, `Quantity_in_store`, `CATEG_ID`) VALUES
(13, 2001, 299, 6),
(15, 2011, 259, 6),
(16, 2017, 972, 6),
(17, 2015, 1, 6),
(18, 2011, 298, 6),
(19, 2010, 299, 6),
(21, 2023, 200, 16),
(22, 2022, 200, 16),
(23, 2023, 200, 16),
(24, 2023, 200, 16),
(27, 2022, 200, 16),
(29, 2022, 200, 17),
(31, 2020, 20, 18),
(32, 2020, 499, 18);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `Category_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`Category_ID`, `Name`) VALUES
(6, 'Fiction'),
(7, 'Religions'),
(16, 'Education'),
(17, 'Biography'),
(18, 'ky nang song');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `company`
--

INSERT INTO `company` (`id`, `name`, `img`, `contact`) VALUES
(1, 'Nguyễn Kim Tiến', 'author-1.jpg', 'https://www.facebook.com/tien.nguyenkim.17022002'),
(2, 'Nguyễn Tuấn Quyến', 'author-2.jpg', 'https://www.facebook.com/tuanquyen.nguyen.526'),
(4, 'Phan Minh Khang', 'author-3.jpg', 'https://www.facebook.com/khangne21'),
(5, 'Nguyễn Huỳnh Đức', 'author-4.jpg', 'https://www.facebook.com/profile.php?id=100048904059148');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discount_code`
--

CREATE TABLE `discount_code` (
  `Code_ID` int(11) NOT NULL,
  `Discount` decimal(3,2) DEFAULT NULL CHECK (`Discount` >= 0 and `Discount` <= 1),
  `Expiration_date` date NOT NULL,
  `Name` varchar(255) DEFAULT 'Ma giam gia',
  `ACC_ID` int(11) NOT NULL,
  `Deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `discount_code`
--

INSERT INTO `discount_code` (`Code_ID`, `Discount`, `Expiration_date`, `Name`, `ACC_ID`, `Deleted`) VALUES
(1, '0.20', '2022-12-31', 'Giam 20%', 31, 1),
(2, '0.15', '2022-12-31', 'Giam 15%', 31, 1),
(3, '0.20', '2022-12-30', 'Giam 20% cho ban moii', 31, 1),
(5, '0.20', '2022-12-30', 'Giam 20% cho ban moiii', 31, 1),
(6, '0.20', '2022-12-30', 'Giam 20% cho ban moiii', 31, 1),
(7, '0.20', '2022-12-30', 'Giam 20% cho ban moii', 31, 1),
(8, '0.20', '2022-12-30', 'Giam 20% cho ban moiii', 31, 1),
(9, '0.20', '2022-12-30', 'Giam 20% cho ban moi', 31, 0),
(10, '0.20', '2022-12-30', 'Giam 20% cho ban moi', 32, 1),
(11, '0.20', '2022-12-30', 'Giam 20% cho ban moi', 33, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `magazine_seri`
--

CREATE TABLE `magazine_seri` (
  `Product_ID` int(11) NOT NULL,
  `Duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `magazine_seri`
--

INSERT INTO `magazine_seri` (`Product_ID`, `Duration`) VALUES
(21, 3),
(22, 3),
(23, 7),
(29, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `img`, `title`, `content`, `date`) VALUES
(3, 'news.jpg', 'bảng tin tháng 11 mới', 'nội dung tuyệt vời mớia a a a a a a a a a a a  anội dung tuyệt vời mớia a a a a a a a a a a a  a nội dung tuyệt vời mớia a a a a a a a a a a a  a nội dung tuyệt vời mớia a a a a a a a a a a a  a nội dung tuyệt vời mớia a a a a a a a a a a a  a nội dung tuyệt vời mớia a a a a a a a a a a a  a nội dung tuyệt vời mớia a a a a a a a a a a a  a nội dung tuyệt vời mớia a a a a a a a a a a a  a nội dung tuyệt vời mớia a a a a a a a a a a a  a nội dung tuyệt vời mớia a a a a a a a a a a a  a', '2022-12-06 02:09:59'),
(4, 'home-bg.jpg', 'bảng tin mới nhất', 'nội dung hay', '2022-12-06 03:06:32'),
(5, 'tuyendung.jpg', 'Tuyển dụng nhân viên cho tháng 1 2023', 'Đăng tin tuyển dụng miễn phí ở đâu?\r\nVới những nhà tuyển dụng đã có kinh nghiệm thì hẳn trong tay thường có một danh sách đăng tin tuyển dụng miễn phí ở đâu là hiệu quả và chất lượng. Có thể nói cùng với sự phát triển của công nghệ có rất nhiều kênh đăng tin cho các doanh nghiệp lựa chọn như đăng tin miễn phí qua website, sử dụng mạng xã hội, các diễn đàn, group… Tuy nhiên đăng tin miễn phí thông qua website và social là lựa chọn được sử dụng phổ biến nhất, bởi nó khả năng truyền tải thông tin nhanh chóng, rộng khắp, dễ dàng tiếp cận được ứng viên đồng thời thể hiện được sự chuyên nghiệp cho các doanh nghiệp.\r\n\r\nNgày nay có rất nhiều các website tuyển dụng cho phép các nhà tuyển dụng có thể sử dụng để đăng tin miễn phí. Mỗi một tin đăng trên website là cơ hội để các doanh nghiệp có cơ hội tiếp cận được nhiều ứng viên hơn. Tuy nhiên cùng cho phép đăng tin tuyển dụng miễn phí nhưng mỗi kênh website lại có những đặc trưng phù hợp với những mục đích riêng. Và khi đăng tin thì người tuyển dụng cũng cần có những bí kíp để bài đăng tin chiếm vị trí cao, dễ tiếp cận ứng viên.', '2022-12-13 11:46:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `Order_ID` int(11) PRIMARY KEY AUTO_INCREMENT,
  `Status` varchar(255) NOT NULL,
  `Total_amount` int(11) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `CODE_ID` int(11) DEFAULT NULL,
  `ACC_ID` int(11) NOT NULL,
  `METHOD_ID` int(11) NOT NULL,
  `Note` varchar(255) DEFAULT NULL,
  `pay_date` datetime DEFAULT current_timestamp(),
  `payment` varchar(30)  default ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`Order_ID`, `Status`, `Total_amount`, `Address`, `CODE_ID`, `ACC_ID`, `METHOD_ID`, `Note`, `pay_date`, `payment`) VALUES
(22, 'Cancelled', 130000, 'Kí túc xá khu A ', NULL, 18, 1, 'cảm ơn', '2022-12-04 01:52:19', ''),
(23, 'Cancelled', 256000, 'Kí túc xá khu B', NULL, 31, 2, 'note*', '2022-12-05 20:27:57', ''),
(24, 'Processing', 220000, 'Kí túc xá khu B', NULL, 31, 2, '', '2022-12-07 12:16:18', ''),
(25, 'Processing', 400000, 'Kí túc xá khu AAA', NULL, 31, 3, 'note*', '2022-12-07 15:26:04', ''),
(26, 'Completed', 120000, 'Kí túc xá khu B', NULL, 31, 2, 'note*', '2022-12-07 15:29:59', ''),
(27, 'Processing', 310000, 'Kí túc xá khu B', NULL, 31, 3, 'note*', '2022-12-07 15:54:04', ''),
(28, 'Processing', 140000, 'Kí túc xá khu B', NULL, 31, 1, 'note*', '2022-12-07 20:05:57', ''),
(30, 'Processing', 410000, 'Kí túc xá khu A', NULL, 31, 1, '', '2022-12-09 00:30:53', ''),
(31, 'Processing', 83000, 'Kí túc xá khu A', NULL, 31, 1, 'Note*', '2022-12-09 00:49:32', ''),
(32, 'Processing', 120000, 'Kí túc xá khu A', 2, 31, 1, 'Note*', '2022-12-09 00:49:57', ''),
(33, 'Processing', 120000, 'Kí túc xá khu A', 2, 31, 2, 'Note*', '2022-12-09 00:50:19', ''),
(36, 'Processing', 120000, 'Kí túc xá khu A', 2, 31, 2, '', '2022-12-09 00:57:27', ''),
(37, 'Processing', 120000, 'Kí túc xá khu B', 2, 31, 1, 'abc', '2022-12-09 01:00:00', ''),
(38, 'Processing', 71000, 'Kí túc xá khu B', 2, 31, 2, 'moi', '2022-12-09 01:02:23', ''),
(39, 'Processing', 71000, 'Kí túc xá khu B', 2, 31, 1, 'abccc', '2022-12-09 01:03:56', ''),
(40, 'Processing', 71000, 'Kí túc xá khu B', 2, 31, 2, 'moi nhat', '2022-12-09 01:04:39', ''),
(41, 'Processing', 71000, 'Kí túc xá khu B', 2, 31, 1, 'abc', '2022-12-09 01:04:59', ''),
(42, 'Processing', 71000, 'Kí túc xá khu B', 2, 31, 1, 'moi nhat', '2022-12-09 01:06:10', ''),
(43, 'Processing', 71000, 'Kí túc xá khu B', 2, 31, 2, 'moi nhat', '2022-12-09 01:07:08', ''),
(44, 'Processing', 71000, 'Kí túc xá khu C', 2, 31, 1, 'moi nhat', '2022-12-09 01:08:41', ''),
(45, 'Processing', 71000, 'Kí túc xá khu C', 2, 31, 2, 'moi nhat', '2022-12-09 01:23:22', ''),
(46, 'Processing', 71000, 'Kí túc xá khu C', 2, 31, 1, 'moi nhat', '2022-12-09 01:30:35', ''),
(47, 'Processing', 71000, 'Kí túc xá khu C', 2, 31, 2, 'moi nhat', '2022-12-09 01:31:55', ''),
(49, 'Processing', 210000, 'Kí túc xá khu B', NULL, 31, 1, 'kjkj', '2022-12-09 01:35:48', ''),
(50, 'Processing', 410000, 'Kí túc xá khu B', 1, 31, 1, 'note*', '2022-12-09 03:51:09', ''),
(51, 'Processing', 390000, 'Kí túc xá khu B', 2, 31, 1, 'note*', '2022-12-09 13:40:42', ''),
(54, 'Processing', 150000, 'Kí túc xá khu B', NULL, 31, 1, '', '2022-12-09 16:39:14', ''),
(55, 'Processing', 240000, 'Kí túc xá khu B', 3, 31, 1, 'bghuy', '2022-12-12 18:42:31', ''),
(56, 'Processing', 80000, 'Kí túc xá khu B', 5, 31, 1, 'note*', '2022-12-12 23:31:21', ''),
(57, 'Processing', 300000, 'Kí túc xá khu B', NULL, 31, 1, 'note((((((', '2022-12-12 23:34:05', ''),
(58, 'Processing', 100000, 'Kí túc xá khu B', NULL, 31, 1, '', '2022-12-13 00:53:43', ''),
(59, 'Processing', 100000, 'Kí túc xá khu B', NULL, 31, 1, '', '2022-12-13 00:54:56', ''),
(61, 'Cancelled', 80000, 'Kí túc xá khu A', 10, 32, 3, 'note*', '2022-12-13 01:38:04', ''),
(62, 'Processing', 63000, 'Kí túc xá khu B', 8, 31, 1, 'moi', '2022-12-13 11:21:55', ''),
(63, 'Processing', 63000, 'Kí túc xá khu B', 9, 31, 1, 'moi', '2022-12-13 11:23:51', ''),
(64, 'Processing', 63000, 'Kí túc xá khu B', 7, 31, 1, 'aaa', '2022-12-13 11:24:28', ''),
(65, 'Processing', 63000, 'Kí túc xá khu B', 7, 31, 1, 'aa', '2022-12-13 11:25:29', ''),
(66, 'Processing', 63000, 'Kí túc xá khu B', 7, 31, 1, 'aaa', '2022-12-13 11:26:06', ''),
(67, 'Processing', 63000, 'Kí túc xá khu B', 7, 31, 1, 'aaa', '2022-12-13 11:28:14', ''),
(68, 'Processing', 140000, 'Kí túc xá khu B', 8, 31, 1, 'note*', '2022-12-13 11:32:35', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `Detail_ID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `ORDERID` int(11) NOT NULL,
  `PID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`Detail_ID`, `Quantity`, `ORDERID`, `PID`) VALUES
(6, 1, 22, 18),
(7, 1, 22, 22),
(8, 1, 23, 13),
(9, 1, 24, 16),
(10, 1, 24, 23),
(11, 2, 25, 15),
(12, 1, 26, 15),
(13, 1, 27, 15),
(14, 1, 28, 19),
(15, 2, 28, 21),
(17, 1, 30, 15),
(18, 1, 30, 16),
(19, 1, 31, 15),
(20, 3, 31, 16),
(21, 1, 32, 15),
(22, 3, 32, 16),
(23, 1, 33, 15),
(24, 3, 33, 16),
(27, 1, 36, 15),
(28, 3, 36, 16),
(29, 1, 37, 15),
(30, 3, 37, 16),
(31, 1, 38, 15),
(32, 3, 38, 16),
(33, 1, 39, 15),
(34, 3, 39, 16),
(35, 1, 40, 15),
(36, 3, 40, 16),
(37, 1, 41, 15),
(38, 3, 41, 16),
(39, 1, 42, 15),
(40, 3, 42, 16),
(41, 1, 43, 15),
(42, 3, 43, 16),
(43, 1, 44, 15),
(44, 3, 44, 16),
(45, 1, 45, 15),
(46, 3, 45, 16),
(47, 1, 46, 15),
(48, 3, 46, 16),
(49, 1, 47, 15),
(50, 3, 47, 16),
(51, 1, 49, 15),
(52, 1, 49, 23),
(53, 1, 50, 15),
(54, 1, 50, 23),
(55, 1, 50, 27),
(56, 2, 51, 15),
(57, 2, 51, 18),
(58, 1, 54, 17),
(59, 1, 55, 27),
(60, 1, 56, 24),
(61, 3, 57, 24),
(62, 1, 58, 24),
(63, 1, 59, 24),
(66, 1, 61, 24),
(67, 2, 67, 21),
(68, 7, 67, 24),
(69, 1, 67, 22),
(70, 1, 67, 23),
(71, 3, 68, 21),
(72, 1, 68, 16),
(73, 4, 68, 29);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `Thumbnail` varchar(255) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Discount_price` int(11) DEFAULT NULL,
  `Publisher` varchar(255) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`Thumbnail`, `Name`, `Product_ID`, `Price`, `Discount_price`, `Publisher`, `Description`, `Deleted`) VALUES
('AnhChangHobbit.png', 'Anh Chàng Hobbit', 13, 174000, 164000, 'J.R.R Tolkien', 'Câu chuyện của Anh Chàng Hobbit là một chuyến phiêu lưu, khi Bilbo Baggins bị cuốn vào chuyến phiêu lưu giành lại xứ sở của những người lùn. Chuyến đi ấy vốn chẳng bao giờ được cho là thích hợp với một Hobbit chỉ thích ăn thức ngon, ở chỗ đẹp. Nhưng rồi Bilbo đã tham gia, đã bị cuốn vào rồi có thể trở về. Chuyến phiêu lưu trở thành bài học về cuộc sống, về con người.', 0),
('BoGia.jpg', 'Bố Già',15, 260000, 250500, 'Mario Puzo', 'Thế giới ngầm được phản ánh trong tiểu thuyết Bố Già là sự gặp gỡ giữa một bên là ý chí cương cường và nền tảng gia tộc chặt chẽ theo truyền thống mafia xứ Sicily với một bên là xã hội Mỹ nhập nhằng đen trắng, mảnh đất màu mỡ cho những cơ hội làm ăn bất chính hứa hẹn những món lợi kếch xù. Trong thế giới ấy, hình tượng Bố già được tác giả dày công khắc họa đã trở thành bức chân dung bất hủ trong lòng người đọc. Từ một kẻ nhập cư tay trắng đến ông trùm tột đỉnh quyền uy, Don Vito Corleone là con rắn hổ mang thâm trầm, nguy hiểm khiến kẻ thù phải kiềng nể, e dè, nhưng cũng được bạn bè, thân quyến xem như một đấng toàn năng đầy nghĩa khí.',0),
('CuocDoiCuaPi.jpg', 'Cuộc Đời Của Pi', 16, 110000, 99500, 'Yann Martel', 'Sau vụ đắm tàu bi thảm, Pi, cậu bé 16 tuổi con một giám đốc sở thú cùng gia đình đi Canada, thấy mình là kẻ sống sót duy nhất trên một chiếc xuồng cứu nạn nhỏ bé dập dềnh giữa Thái Bình Dương. Cùng với một con ngựa vằn đau khổ (gẫy một chân), một con linh cẩu lông đốm độc ác liên tục kêu yip yip, một con đười ươi cái nôn ọe vì say sóng  và đặc biệt một con hổ Bengal nặng 450 pound, Pi đã lang thang trên đại dương suốt 227 ngày, hy vọng rồi tuyệt vọng, trải qua những điều hài hước nhất, kinh khủng nhất, hoang tưởng nhất, đáng sợ nhất...mà một con người có thể gặp trong đời.', 0),
('XuCat.jpg', 'Xứ Cát', 17, 250000, 238500, 'Frank Herbert', 'Là một trong những cuốn tiểu thuyết khoa học giả tưởng bán chạy nhất mọi thời đại, Xứ Cát không chỉ là lựa chọn đối với những tín đồ của Chúa nhẫn, Chiến tranh giữa các vì sao… mà còn chinh phục độc giả đủ mọi lứa tuổi, mọi tầng lớp và sở thích bởi sự đa dạng và phức tạp của con người và không gian trong truyện, bởi sự tinh tế trong xây dựng tâm lý, bởi sự hấp dẫn, căng thẳng và bất ngờ của cốt truyện, bởi sự độc đáo và thú vị của khối lượng kiến thức khổng lồ cũng như bởi sự hấp dẫn trong những tư tưởng về tôn giáo, về tự do, về tình yêu, về sự sống và cái chết…', 0),
('NhaGiaKim.jpg', 'Nhà Giả Kim', 18, 80000,69000, 'Paulo Coelho', 'Tiểu thuyết Nhà giả kim của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm thay đổi cuộc đời người đọc.',0),
('451DoF.jpg', '451 Độ F',19, 80000, 73800, 'Ray Bradbury', 'Hãy mường tượng một thế giới nơi truyền hình thống trị và văn chương ngấp nghé trên bờ tuyệt chủng, nơi thông tin nông cạn được tung hô còn tri thức và ý tưởng thì bị ruồng rẫy, nơi tàng trữ sách là phạm pháp, ta có thể bị bắt chỉ vì tản bộ trên vỉa hè, còn nhiệm vụ của những người lính không phải cứu hỏa mà là châm mồi cho những đám cháy…',0),
('GiaoDucVaYNghiaCuocSong.jpg', 'Giáo Dục Và Ý Nghĩa Cuộc Sống',21,70000, 53900, 'J. Krishnamurti', 'Bằng lối hành văn khúc triết, gần gũi, J.Krishnamurti cho rằng dạy học không nên trở thành một nghề của những chuyên gia như nó đang là như vậy, bởi vì khi đó tình thương sẽ phai tàn, trong khi tình thương chính là yếu tố cốt lõi của quá trình phát triển toàn diện. Thông điệp cuốn sách đưa ra rất nhân văn: Tất cả chúng ta nhất thiết phải học cách trở thành người có lòng trắc ẩn, biết bằng lòng với những cái tối thiểu và tìm kiếm cái tối cao. Chỉ khi đó nhân loại mới thực sự được cứu rỗi. Đó chính là lý do Giáo Dục Và Ý Nghĩa Cuộc Sống trở thành tác phẩm có lượng phát hành cực kỳ ấn tượng trên thế giới suốt nhiều năm qua. ',0),
('KinhNghiemVaGiaoDuc.jpg', 'Kinh Nghiệm Và Giáo Dục',22,80000, 70000, 'John Dewey', 'KINH NGHIỆM VÀ GIÁO DỤC (Experience and Education) của John Dewey là một cuốn sách mỏng được xuất bản năm 1938 dựa trên một bài nói chuyện do ông thực hiện cùng năm đó theo lời mời của Hội Kappa Delta Pi. Đây là lần thứ hai John Dewey được Kappa Delta Pi mời nói chuyện về giáo dục. Và mục đích của lần mời này đã được Kappa Delta Pi nêu như sau: Vì lợi ích của cách hiểu sáng sủa và một sự hiệp lực, Ban Giám đốc của Kappa Delta Pi đã đề nghị Tiến sĩ Dewey đề cập một số vấn đề tranh luận đang chia rẽ nền giáo dục Mỹ thành hai phe và do đó làm cho nền giáo dục này suy yếu vào thời điểm nó cần có trọn vẹn sức mạnh để hướng dẫn một dân tộc đang hoang mang để vượt qua những rủi ro do đổi thay xã hội.',0),
('CamNangCauTrucTiengAnh.jpg', 'Cẩm Nang Cấu Trúc Tiếng Anh',23,75000, 66000, 'Trang Anh', 'Cuốn sách CẨM NANG CẤU TRÚC TIẾNG ANH gồm 25 phần, mỗi phần là một phạm trù kiến thức trong tiếng Anh được trình bày một cách ngắn gọn, đơn giản, cô đọng và hệ thống hoá dưới dạng sơ đồ, bảng biểu nhằm phát triển khả năng tư duy của người học và từ đó giúp người học nhớ kiến thức nhanh hơn và sâu hơn. Sau hầu hết các phần lí thuyết đều có 20-30 câu bài tập áp dụng để kiểm tra cũng như khắc sâu kiến thức cho người học. Tuy dày chưa đến 250 trang nhưng cuốn sách lại có thể bao trọn toàn bộ kiến thức từ đơn giản đến phức tạp cộng với cách tận dụng tối đa và áp dụng triệt để cách học tiếng Anh bằng sơ đồ tư duy.',0),
('TiengAnhGenZ.jpg', 'Tiếng Anh GenZ',24, 80000, 72000, 'English Not Boring', 'Giống như một cuốn từ điển mini nhưng không mang nặng tính hàn lâm học thuật hay một tài liệu tham khảo to tát, Tiếng Anh GenZ sẽ mang đến cho bạn những cách giải nghĩa thú vị, những ẩn ý tiếng Anh hay ho và những funfact vui nhộn không đụng hàng ở bất cứ đâu…',0),
('CungBanTruongThanh.jpg', 'Cùng Bạn Trưởng Thành',27,90000, 71200, 'Yi Yang', 'Nếu bạn đang tìm kiếm một người bạn đồng hành trong việc học tập ngoại ngữ và phát triển bản thân thì cuốn sách “Cùng bạn trưởng thành” chắc chắn là cuốn sách dành cho bạn. Đúng như tên gọi của nó, cuốn sách sẽ là người bạn sát cánh bên bạn mỗi ngày, ngoài ra còn truyền tải cảm hứng và thông điệp sống tích cực thông qua những trích dẫn ngắn song ngữ Trung - Việt, qua đó bạn có thể vừa trau dồi thêm kiến thức mới, vừa làm mới thế giới nội tâm của bản thân. Với ngoại hình nhỏ gọn và vô cùng xinh xắn, bạn cũng có thể dễ dàng sách mang theo bên mình để cuốn sách trở thành bạn đồng hành không thể thiếu trong cuộc sống và có thể thưởng thức bất cứ lúc nào bạn rảnh rỗi.',0),
('TroChuyenVoiNhaVatLyThienVan.jpg', 'Trò Chuyện Với Nhà Vật Lý Thiên Văn Trịnh Xuân Thuận',29,100000, 94500, 'Trịnh Xuân Thuận', 'Sách là nội dung trả lời phỏng vấn của nhà vật lý thiên văn Trịnh Xuân Thuận về các vấn đề khoa học thiên văn, về cuộc đời, sở thích và những sự kiện đã dẫn Trịnh Xuân Thuận đến với thiên văn học.',0),
('TuoiTreDangGiaBaoNhieu.jpg', 'Tuổi Trẻ Đáng Giá Bao Nhiêu',31,90000, 70000, 'Rosie Nguyễn', 'Tuổi trẻ đáng giá bao nhiêu? Bạn có thể tự trả lời được câu hỏi này không nhỉ? Tuổi trẻ được xem là lứa tuổi đẹp nhất của một đời người, thế nhưng có bao giờ khi tuổi xuân qua đi, bạn lại cảm thấy tiếc nuối vì những gì mà mình chưa làm được không? Với những lời tâm sự bình dị và gần gũi, cuốn sách Tuổi trẻ đáng giá bao nhiêu của tác giả Rosie Nguyễn sẽ giúp người đọc cảm nhận rõ nét nhất về tâm lý của những người trẻ trong xã hội ngày nay.',0),
('LamChuTuoi20.jpg', 'Làm Chủ Tuổi 20', 32, 180000,169000, 'Dương Duy Bách', 'Làm chủ tuổi 20 được viết lại dựa trên những trải nghiệm trong cuộc sống của tác giả Dương Duy Bách – một người sớm tự lập và đạt được nhiều thành công ở tuổi 20. Ngoài câu chuyện của chính mình, tác giả còn ghi lại những bài học mà anh học được từ những người trẻ thành công khác và phân tích lý do khách quan khiến họ đạt được mục tiêu khi tuổi đời còn rất trẻ.',0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `review`
--

CREATE TABLE `review` (
  `Created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `ACCID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Content` varchar(255) DEFAULT NULL,
  `Rating` int(11) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `review`
--

INSERT INTO `review` (`Created_date`, `ACCID`, `Product_ID`, `Content`, `Rating`, `ID`) VALUES
('2022-12-04 03:52:52', 28, 13, 'Sách dở ẹc', 1, 3),
('2022-12-04 18:24:50', 28, 18, 'sách ko hay lắm', 3, 7),
('2022-12-04 20:47:52', 28, 27, 'Greatest book of the year', 5, 8),
('2022-12-11 10:57:08', 31, 13, 'aaa', 3, 10),
('2022-12-13 01:38:39', 32, 24, 'cuốn sách hay', 5, 11),
('2022-12-13 10:11:50', 31, 17, 'hay day', 1, 12),
('2022-12-13 10:12:59', 31, 17, 'hay day', 1, 13),
('2022-12-13 10:15:08', 31, 17, 'aaa', 2, 14),
('2022-12-13 10:16:01', 31, 17, 'Sách này đọc k thú vị lắm', 2, 15),
('2022-12-13 10:19:19', 28, 17, 'Shop nhiều sách thú vị', 2, 16),
('2022-12-13 10:21:37', 31, 17, 'Sách này có tập mới chưa', 2, 17),
('2022-12-13 10:22:05', 28, 17, 'Giao hàng nhanh', 2, 18),
('2022-12-13 10:22:21', 32, 17, 'Hi vọng sẽ có sách lập trinhg Python', 2, 19);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `Role_ID` int(11) NOT NULL,
  `Role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`Role_ID`, `Role_name`) VALUES
(1, 'quanly'),
(2, 'nhanvienthuong'),
(3, 'nhanvienkho'),
(4, 'khachhang');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipping_method`
--

CREATE TABLE `shipping_method` (
  `Method_ID` int(11) NOT NULL,
  `Fee` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `shipping_method`
--

INSERT INTO `shipping_method` (`Method_ID`, `Fee`, `Name`) VALUES
(1, 10000, 'Giao hàng tiết kiệm'),
(2, 25000, 'Giao hàng nhanh'),
(3, 30000, 'Hỏa tốc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `writee`
--

CREATE TABLE `writee` (
  `AUTHOR_ID` int(11) NOT NULL,
  `PRODUCT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `writee`
--

INSERT INTO `writee` (`AUTHOR_ID`, `PRODUCT_ID`) VALUES
(4, 13),
(4, 15),
(4, 16),
(5, 17),
(5, 18),
(5, 19),
(7, 21),
(7, 23),
(8, 22),
(9, 24),
(12, 27),
(13, 27),
(14, 27),
(17, 29),
(18, 29),
(20, 31),
(21, 32);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Account_ID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `ROLE_NO` (`ROLE_NO`);

--
-- Chỉ mục cho bảng `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`Author_ID`);

--
-- Chỉ mục cho bảng `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `CATEG_ID` (`CATEG_ID`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_ID`);

--
-- Chỉ mục cho bảng `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `discount_code`
--
ALTER TABLE `discount_code`
  ADD PRIMARY KEY (`Code_ID`),
  ADD KEY `ACC_ID` (`ACC_ID`);

--
-- Chỉ mục cho bảng `magazine_seri`
--
ALTER TABLE `magazine_seri`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  -- ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `CODE_ID` (`CODE_ID`),
  ADD KEY `ACC_ID` (`ACC_ID`),
  ADD KEY `METHOD_ID` (`METHOD_ID`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`Detail_ID`),
  ADD KEY `ORDERID` (`ORDERID`),
  ADD KEY `PID` (`PID`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Chỉ mục cho bảng `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`Created_date`,`ACCID`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD KEY `ACCID` (`ACCID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`Role_ID`);

--
-- Chỉ mục cho bảng `shipping_method`
--
ALTER TABLE `shipping_method`
  ADD PRIMARY KEY (`Method_ID`);

--
-- Chỉ mục cho bảng `writee`
--
ALTER TABLE `writee`
  ADD PRIMARY KEY (`AUTHOR_ID`,`PRODUCT_ID`),
  ADD KEY `PRODUCT_ID` (`PRODUCT_ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `Account_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `author`
--
ALTER TABLE `author`
  MODIFY `Author_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `Category_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `discount_code`
--
ALTER TABLE `discount_code`
  MODIFY `Code_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `Order_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `Detail_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `Product_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `review`
--
ALTER TABLE `review`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `Role_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `shipping_method`
--
ALTER TABLE `shipping_method`
  MODIFY `Method_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`ROLE_NO`) REFERENCES `role` (`Role_ID`);

--
-- Các ràng buộc cho bảng `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`CATEG_ID`) REFERENCES `category` (`Category_ID`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Các ràng buộc cho bảng `discount_code`
--
ALTER TABLE `discount_code`
  ADD CONSTRAINT `discount_code_ibfk_1` FOREIGN KEY (`ACC_ID`) REFERENCES `account` (`Account_ID`);

--
-- Các ràng buộc cho bảng `magazine_seri`
--
ALTER TABLE `magazine_seri`
  ADD CONSTRAINT `magazine_seri_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CODE_ID`) REFERENCES `discount_code` (`Code_ID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`ACC_ID`) REFERENCES `account` (`Account_ID`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`METHOD_ID`) REFERENCES `shipping_method` (`Method_ID`);

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`ORDERID`) REFERENCES `orders` (`Order_ID`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`PID`) REFERENCES `product` (`Product_ID`);

--
-- Các ràng buộc cho bảng `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`ACCID`) REFERENCES `account` (`Account_ID`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Các ràng buộc cho bảng `writee`
--
ALTER TABLE `writee`
  ADD CONSTRAINT `writee_ibfk_1` FOREIGN KEY (`AUTHOR_ID`) REFERENCES `author` (`Author_ID`),
  ADD CONSTRAINT `writee_ibfk_2` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`Product_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
