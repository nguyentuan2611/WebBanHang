-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2022 at 01:45 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webphukiendt`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `adminId` int(11) NOT NULL,
  `adminName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adminEmail` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `adminUser` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adminPass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`adminId`, `adminName`, `adminEmail`, `adminUser`, `adminPass`, `level`) VALUES
(1, 'phu', 'phu@gmail.com', 'phuAdmin', 'e10adc3949ba59abbe56e057f20f883e', 0),
(2, 'admin', 'admin@gmail.com', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 0),
(3, 'a', 'a@gmail.com', 'a', 'a', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brandId` int(11) NOT NULL,
  `brandName` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`brandId`, `brandName`) VALUES
(15, 'HangVietNam'),
(16, 'Guci'),
(17, 'ThaiLand');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `cartId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `sId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `productName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_cart`
--

INSERT INTO `tbl_cart` (`cartId`, `productId`, `sId`, `productName`, `price`, `quantity`, `image`) VALUES
(25, 26, 'i3vlqgsap6ivof3f4p756lnnrf', 'Đầm Dạ Hội Khoe Body', '300000', 1, 'b90470eee0.jpg'),
(26, 26, 'bd8g1niibsl5ecg1vcesmrq6gs', 'Đầm Dạ Hội Khoe Body', '300000', 1, 'b90470eee0.jpg'),
(30, 27, 'vgthms5oqnke9mu0iv5c6dd8r3', 'Áo Vét Nam', '300000', 1, 'bdfd8f20e3.jpg'),
(31, 27, 'vmnkt9jlr94m0l58vb63vvnist', 'Áo Vét Nam', '300000', 1, 'bdfd8f20e3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `catId` int(11) NOT NULL,
  `catName` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`catId`, `catName`) VALUES
(18, 'Áo Dài Truyền Thống'),
(19, 'Áo Quần Dạ Hội'),
(20, 'Quần Áo Công Sở');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_compare`
--

CREATE TABLE `tbl_compare` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`id`, `name`, `address`, `city`, `country`, `zipcode`, `phone`, `email`, `password`) VALUES
(6, 'quy quy', 'a', 'a', 'hcm', 'a', '0818488169', 'nquy25112000@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
(7, 'quy quy', 'a', 'b', 'hcm', 'b', '0818488169', 'nquy225112000@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `date_order` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `productId`, `productName`, `customer_id`, `quantity`, `price`, `image`, `status`, `date_order`) VALUES
(61, 26, 'Đầm Dạ Hội Khoe Body', 6, 1, '300000', 'b90470eee0.jpg', 1, '2021-12-21 11:28:22'),
(62, 24, 'Áo Dài Trắng Học Sinh', 6, 1, '100000', 'f7cb1969f2.jpg', 1, '2021-12-21 11:28:22');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `productId` int(11) NOT NULL,
  `productName` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `product_code` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `productQuantity` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_soldout` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `product_remain` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `catId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL,
  `product_desc` text COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`productId`, `productName`, `product_code`, `productQuantity`, `product_soldout`, `product_remain`, `catId`, `brandId`, `product_desc`, `type`, `price`, `image`) VALUES
(24, 'Áo Dài Trắng Học Sinh', '', '100', '1', '99', 18, 15, '<p><span>Sự định h&igrave;nh cơ bản của&nbsp;</span><strong>&aacute;o d&agrave;i Việt Nam</strong><span>&nbsp;bắt đầu từ thời ch&uacute;a Nguyễn Ph&uacute;c Kho&aacute;t, được lấy cảm hứng từ&nbsp;</span><strong>&aacute;o</strong><span>&nbsp;sườn x&aacute;m của Trung Quốc.&nbsp;</span><strong>&Aacute;o d&agrave;i</strong><span>&nbsp;gồm c&oacute; th&acirc;n&nbsp;</span><strong>&aacute;o</strong><span>&nbsp;v&agrave; quần ống rộng. Th&acirc;n&nbsp;</span><strong>&aacute;o</strong><span>&nbsp;được t&iacute;nh từ phần cổ xuống eo, từ eo th&acirc;n&nbsp;</span><strong>&aacute;o</strong><span>&nbsp;được xẻ l&agrave;m hai t&agrave;, vị tr&iacute; xẻ ở ngang h&ocirc;ng.</span></p>', 1, '100000', 'f7cb1969f2.jpg'),
(26, 'Đầm Dạ Hội Khoe Body', '', '200', '1', '199', 19, 16, '<p><span>Gam m&agrave;u họa tiết hoa bắt mắt, thu h&uacute;t hơn bao giờ hết.&nbsp;Nổi bật với thiết kế d&aacute;ng t&ugrave;ng x&ograve;e&nbsp;tr&ecirc;n nền</span><a href=\"https://ivymoda.com/tin-tuc/bai-viet/taffeta-tre-chat-lieu-moi-tu-nha-mot-ivy-moda-76\">&nbsp;chất liệu Taffeta&nbsp;</a><span>cao cấp sang chảnh. Chiếc đầm dự tiệc n&agrave;y sẽ thật ho&agrave;n hảo nếu n&agrave;ng phối hợp th&ecirc;m những loại trang sức &aacute;nh kim, đảm bảo n&agrave;ng sẽ c&oacute; một outfit đi tiệc thật sang trọng v&agrave; nổi bật cho m&ugrave;a tiệc t&ugrave;ng</span></p>', 0, '300000', 'b90470eee0.jpg'),
(27, 'Áo Vét Nam', '', '123', '0', '123', 20, 15, '<p><strong>Chất liệu:</strong>&nbsp;28% Rayon, 70% Spun, 2% Spandex</p>\r\n<p><strong>Kiểu d&aacute;ng:</strong>&nbsp;Form slimfit &ocirc;m vừa người, t&ocirc;n d&aacute;ng&nbsp;</p>\r\n<p><strong>Thiết kế:</strong>&nbsp;Ve &aacute;o thiết kế kiểu Anh&nbsp;tinh tế, sang trọng</p>\r\n<p><strong>Ưu điểm:</strong>&nbsp;Chống nhăn nh&agrave;u, tiết kiệm thời gian l&agrave; ủi</p>', 0, '300000', 'bdfd8f20e3.jpg'),
(28, 'Quần Âu', 'MH1', '1234', '0', '1234', 20, 15, '<p><strong>Chất liệu:</strong>&nbsp;28% Rayon, 70% Spun, 2% Spandex</p>\r\n<p><strong>Kiểu d&aacute;ng:</strong>&nbsp;Ống đứng t&ocirc;n d&aacute;ng người mặc</p>\r\n<p><strong>Thiết kế:</strong>&nbsp;L&oacute;t cạp d&agrave;y chắc chắn. Đảm bảo độ bền mặc l&acirc;u kh&ocirc;ng bị m&ograve;n r&aacute;ch</p>\r\n<p><strong>Ưu điểm:</strong>&nbsp;Tại phần mở rộng quần Biluxury c&oacute;&nbsp;vải dư nhiều hơn c&aacute;c nh&atilde;n h&agrave;ng kh&aacute;c,&nbsp;tối đa 2,5cm cả v&ograve;ng m&ocirc;ng, thoải m&aacute;i điều chỉnh</p>', 0, '500000', '9548bb6be4.jpg'),
(29, 'Áo Len', 'MH111365', '343', '0', '343', 20, 15, '<p><strong>Chất liệu:</strong>&nbsp;55% Acrylic,&nbsp;45% Cotton</p>\r\n<p><strong>Kiểu d&aacute;ng:</strong>&nbsp;Form slimfit &ocirc;m vừa người, t&ocirc;n d&aacute;ng.</p>\r\n<p><strong>Thiết kế:</strong>&nbsp;Thiết kế cổ tr&ograve;n basic kết hợp dệt kiểu nhấn vai.</p>\r\n<p><strong>Ưu điểm:</strong>&nbsp;Gi&uacute;p giữ ấm, giữ nhiệt tốt,&nbsp;co gi&atilde;n &ndash; đ&agrave;n hồi cao.</p>', 0, '503000', '00421baf39.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_slider`
--

CREATE TABLE `tbl_slider` (
  `sliderId` int(11) NOT NULL,
  `sliderName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slider_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_slider`
--

INSERT INTO `tbl_slider` (`sliderId`, `sliderName`, `slider_image`, `type`) VALUES
(13, 'Áo Dài Việt Nam', 'c7a510eaba.jpg', 1),
(14, 'áo vét', 'ad24427bff.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_warehouse`
--

CREATE TABLE `tbl_warehouse` (
  `id_warehouse` int(11) NOT NULL,
  `id_sanpham` int(11) NOT NULL,
  `sl_nhap` varchar(50) NOT NULL,
  `sl_ngaynhap` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_warehouse`
--

INSERT INTO `tbl_warehouse` (`id_warehouse`, `id_sanpham`, `sl_nhap`, `sl_ngaynhap`) VALUES
(1, 22, '5', '2019-07-16 18:31:22'),
(2, 21, '10', '2019-07-16 18:32:03'),
(3, 21, '3', '2019-07-16 18:42:59'),
(4, 20, '5', '2019-07-16 18:51:40');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wishlist`
--

CREATE TABLE `tbl_wishlist` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brandId`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`cartId`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`catId`);

--
-- Indexes for table `tbl_compare`
--
ALTER TABLE `tbl_compare`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`productId`);

--
-- Indexes for table `tbl_slider`
--
ALTER TABLE `tbl_slider`
  ADD PRIMARY KEY (`sliderId`);

--
-- Indexes for table `tbl_warehouse`
--
ALTER TABLE `tbl_warehouse`
  ADD PRIMARY KEY (`id_warehouse`);

--
-- Indexes for table `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brandId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_compare`
--
ALTER TABLE `tbl_compare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tbl_slider`
--
ALTER TABLE `tbl_slider`
  MODIFY `sliderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_warehouse`
--
ALTER TABLE `tbl_warehouse`
  MODIFY `id_warehouse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
