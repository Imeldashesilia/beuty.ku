-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2023 at 03:55 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `id_user`, `id_product`, `qty`, `subtotal`) VALUES
(1, 4, 2, 1, 500000);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `slug`, `title`) VALUES
(7, 'sunscreen', 'Sunscreen'),
(8, 'moisturizer', 'Moisturizer'),
(9, 'tone', 'Toner'),
(10, 'cleanser', 'Cleanser'),
(11, 'lip-care', 'Lip Care'),
(12, 'eyes-make-up', 'Eyes Make Up');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `status` enum('waiting','paid','delivered','cancel') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `date`, `invoice`, `total`, `name`, `address`, `phone`, `status`) VALUES
(1, 5, '2020-03-18', '520200318210456', 36000000, 'Hakim', 'Kampung Malang Kulon 1/38-A', '087855777360', 'paid'),
(2, 5, '2020-03-19', '520200319181238', 500000, 'Jotaro Kujo', 'Western', '218838383', 'delivered'),
(3, 5, '2020-03-24', '520200324223408', 3000000, 'Amir Muhammad Hakim', 'Kampung Malang Kulon 1/38-A', '087855777360', 'waiting'),
(4, 6, '2023-12-22', '620231222115037', 3000000, 'Bernard Andrean Sianturi', '1111', '085155253990', 'cancel');

-- --------------------------------------------------------

--
-- Table structure for table `orders_confirm`
--

CREATE TABLE `orders_confirm` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `nominal` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders_confirm`
--

INSERT INTO `orders_confirm` (`id`, `id_orders`, `account_name`, `account_number`, `nominal`, `note`, `image`) VALUES
(1, 1, 'Amir', '42424123333', 36000000, '-', '520200318210456-20200319173859.jpg'),
(2, 2, 'Dio Brando', '344312321', 500000, 'Mantap kang', '520200319181238-20200319181447.jpg'),
(3, 4, 'Ber', '0541263534', 3000000, '-', '620231222115037-20231222115115.png');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(4) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `id_orders`, `id_product`, `qty`, `subtotal`) VALUES
(1, 1, 4, 6, 30000000),
(2, 1, 3, 2, 6000000),
(3, 2, 2, 1, 500000),
(4, 3, 3, 1, 3000000),
(5, 4, 3, 1, 3000000);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `id_category`, `slug`, `title`, `description`, `price`, `is_available`, `image`) VALUES
(5, 12, 'emina-cosmic-lash-volume-mascara-6g-anti-gumpal-dan-tahan-12-jam', 'Emina Cosmic Lash Volume Mascara 6g - Anti Gumpal dan Tahan 12 Jam', '5x VOLUME BOOSTER, CLUMP-FREE LASHES! Emina Cosmic Lash Volume Mascara adalah mascara yang mampu menghasilkan tampilan bulu mata lebih bervolume dengan cepat hingga 5x lebih menebalkan tanpa gumpal serta waterproof. ', 54825, 1, 'emina-cosmic-lash-volume-mascara-6g-anti-gumpal-dan-tahan-12-jam-20231222170934.png'),
(6, 12, 'emina-squeeze-me-up-browcara-8g-brow-mascara-water-resistant', 'Emina Squeeze Me Up Browcara 8g - Brow Mascara Water Resistant', 'About Squeeze Me Up Browcara✨:\r\nMaskara alis dengan formula smudgeproof & water resistant yang bisa lapisi rambut alismu secara merata untuk kasih tampilan alis yang natural, tebal, dan rapih! ', 46400, 1, 'emina-squeeze-me-up-browcara-8g-brow-mascara-water-resistant-20231222170947.jpeg'),
(7, 12, 'emina-eye-do-pencil-eye-liner-1g-eye-liner-pensil-matte-waterproof', 'Emina Eye Do! Pencil Eye Liner 1g - Eye Liner Pensil Matte Waterproof', 'About Eye Do! Pencil Eye Liner✨:\r\nEye Liner dengan kombinasi warna yang halus dan formula waterproof, bikin matamu menyala dengan warna yang lembut dan natural untuk tampilan sehari-hari!', 34000, 1, 'emina-eye-do-pencil-eye-liner-1g-eye-liner-pensil-matte-waterproof-20231222171003.jpg'),
(8, 7, 'emina-sun-battle-spf-50-pa-cica-acne-fighter-sunscreen-30ml', 'Emina Sun Battle SPF 50 PA++++ Cica Acne Fighter Sunscreen 30ml', 'Emina Sun Battle SPF 50 PA++++ Sunscreen adalah tabir surya dengan Maximum Airy Sun Serum sehingga terasa ringan namun tetap menawarkan perlindungan matahari maksimum, 50x* lebih lama dengan manfaat tambahan untuk merawat sesuai kebutuhan kulit spesifik.\r', 49500, 1, 'emina-sun-battle-spf-50-pa-cica-acne-fighter-sunscreen-30ml-20231222171058.jpg'),
(9, 7, 'emina-sun-battle-spf-50-pa-barrier-hydraburst-sunscreen-30ml', 'Emina Sun Battle SPF 50 PA++++ Barrier Hydraburst Sunscreen 30ml', 'Emina Sun Battle SPF 50 PA++++ Sunscreen adalah tabir surya dengan Maximum Airy Sun Serum sehingga terasa ringan namun tetap menawarkan perlindungan matahari maksimum, 50x* lebih lama dengan manfaat tambahan untuk merawat sesuai kebutuhan kulit spesifik.\r', 49500, 1, 'emina-sun-battle-spf-50-pa-barrier-hydraburst-sunscreen-30ml-20231222171610.png'),
(10, 7, 'emina-sun-battle-spf-30-pa-23-ml', 'Emina Sun Battle SPF 30 PA+++ 23 ml', 'About Sun Battle SPF 30 PA+++✨:\r\nSunscreen dengan tekstur ringan yang siap melindungimu dari paparan sinar UV! Diperkaya dengan ekstrak aloe vera, sunscreen ini akan bikin kulit kamu ekstra segar dan nyaman dipakai sehari-hari. Sunny? No worry!', 15725, 1, 'emina-sun-battle-spf-30-pa-23-ml-20231222171629.jpg'),
(11, 7, 'emina-sun-battle-spf-30-pa-60-ml', 'Emina Sun Battle SPF 30 PA+++ 60 ml', 'About Sun Battle SPF 30 PA+++✨:\r\nSunscreen dengan tekstur ringan yang siap melindungimu dari paparan sinar UV! Diperkaya dengan ekstrak aloe vera, sunscreen ini akan bikin kulit kamu ekstra segar dan nyaman dipakai sehari-hari. Sunny? No worry!', 26000, 1, 'emina-sun-battle-spf-30-pa-60-ml-20231222171651.jpg'),
(12, 8, 'emina-ms-pimple-acne-solution-calming-gel-20ml-pelembab-malam-hari', 'Emina Ms. Pimple Acne Solution Calming Gel 20ml - Pelembab Malam Hari', 'About Ms Pimple Acne Solution Calming Gel✨:\r\nPelembab wajah dengan tekstur gel ringan yang bekerja secara intens melembabkan sekaligus mengurangi minyak berlebih di kulit wajahmu semalaman!', 25500, 1, 'emina-ms-pimple-acne-solution-calming-gel-20ml-pelembab-malam-hari-20231222171726.jpg'),
(13, 8, 'emina-natural-pal-gel-moisturizer-20ml-pelembab-wajah-0-alcohol', 'Emina Natural Pal Gel Moisturizer 20ml - Pelembab Wajah 0% Alcohol', 'About Natura Pal Gel Moisturizer✨:\r\nPelembab wajah yang akan bikin kulitmu 2x* lebih terhidrasi! Nyaman digunakan dengan tekstur gel-nya yang ringan dan mampu menghidrasi kulit seketika. ', 32725, 1, 'emina-natural-pal-gel-moisturizer-20ml-pelembab-wajah-0-alcohol-20231222172524.jpg'),
(14, 8, 'emina-bright-stuff-for-acne-prone-skin-moisturizing-cream-20ml', 'Emina Bright Stuff for Acne Prone Skin Moisturizing Cream 20ml', 'About Bright Stuff for Acne Prone Skin Moisturizing Cream✨:\r\nPelembap yang bisa bikin wajah tampak lebih cerah, diformulasikan khusus untuk acne prone; non-comedogenic dan non-acnegenic, cocok banget buat kamu yang punya kulit wajah mudah berjerawat!', 21600, 1, 'emina-bright-stuff-for-acne-prone-skin-moisturizing-cream-20ml-20231222171826.png'),
(15, 8, 'emina-ms-pimple-acne-solution-moisturizing-gel-20ml-pelembab-wajah', 'Emina Ms. Pimple Acne Solution Moisturizing Gel 20ml - Pelembab Wajah', 'About Ms. Pimple Acne Solution Moisturizing Gel✨:\r\nPelembap harian diformulasikan khusus untuk menghidrasi kulit berjerawat dan acne prone, mengurangi kemerahan pada kulit wajahmu dan mencegah pertumbuhan bakteri jahat penyebab jerawat!', 22400, 1, 'emina-ms-pimple-acne-solution-moisturizing-gel-20ml-pelembab-wajah-20231222171848.jpg'),
(16, 9, 'emina-bright-stuff-exfoliating-toner-100ml', 'Emina Bright Stuff Exfoliating Toner 100ml', 'Emina Bright Stuff Exfoliating Toner adalah satu-satunya brightening exfoliant di Indonesia yang formulasinya didesain agar effective but gentle cerahkan kulit dan noda bekas jerawat pada teens Indonesia secara signifikan.', 33575, 1, 'emina-bright-stuff-exfoliating-toner-100ml-20231222171950.png'),
(17, 9, 'emina-ms-pimple-acne-solution-exfoliating-toner-100ml-angkat-komedo', 'Emina Ms. Pimple Acne Solution Exfoliating Toner 100ml - Angkat Komedo', 'About Ms Pimple Acne Solution Exfoliating Toner✨:\r\nToner wajah untuk mengangkat sel kulit mati dan komedo dengan lembut! Mengandung Rosebay Willowherb extract, Mild BHA, dan Zinc Gluconate yang mampu bekerja intensif melawan penyebab jerawat', 34425, 1, 'emina-ms-pimple-acne-solution-exfoliating-toner-100ml-angkat-komedo-20231222172009.jpeg'),
(18, 9, 'emina-ms-pimple-acne-solution-face-toner-toner-atasi-jerawat', 'Emina Ms. Pimple Acne Solution Face Toner - Toner Atasi Jerawat', 'Dengan formula baru mengandung Rosebay Willowherbs extract yang cocok untuk kulit\r\nberminyak dan rentan berjerawat, Zinc Gluconate untuk mengurangi & mencegah timbulnya jerawat', 17425, 1, 'emina-ms-pimple-acne-solution-face-toner-toner-atasi-jerawat-20231222172022.jpg'),
(19, 9, 'emina-natura-pal-toner-essence-100ml-toner-untuk-kulit-sensitif', 'Emina Natura Pal Toner Essence 100ml - Toner untuk Kulit Sensitif', 'About Natura Pal Toner Essence✨:\r\nMulti benefit toner essence dengan 100% natural pea extract dan formula pH-balanced yang punya tekstur ringan seperti air, menyegarkan dan mudah meresap ke kulit sehingga kulitmu terhidrasi seketika!', 39525, 1, 'emina-natura-pal-toner-essence-100ml-toner-untuk-kulit-sensitif-20231222172035.jpg'),
(20, 9, 'emina-skin-buddy-face-toner-toner-wajah-menenangkan-ph-balance', 'Emina Skin Buddy Face Toner - Toner Wajah Menenangkan, pH Balance', 'About Skin Buddy Face Toner✨:\r\nToner wajah dengan pH balance yang bertekstur ringan dan tidak lengket serta sangat cepat menyerap ke dalam kulit. Diformulasikan dengan ekstrak calendula dan hyaluronic acid yang akan kasih efek menenangkan dan hidrasi', 15600, 1, 'emina-skin-buddy-face-toner-toner-wajah-menenangkan-ph-balance-20231222172048.jpg'),
(21, 11, 'emina-watercolor-lip-serum-serum-bibir-mencerahkan-dalam-7-hari', 'Emina Watercolor Lip Serum - Serum Bibir Mencerahkan dalam 7 Hari', 'About Watercolor Lip Serum✨:\r\nHoly grail lip care yang bisa bikin bibir jadi lebih cerah, lembab, dengan warna natural yang super cantik! Your all time favorite holy grail lip care series for whatever lip makeup you are', 30000, 1, 'emina-watercolor-lip-serum-serum-bibir-mencerahkan-dalam-7-hari-20231222172109.jpg'),
(22, 11, 'emina-oh-so-kissable-tinted-balm-stick-34g-lip-balm-dengan-vit-e', 'Emina Oh So Kissable Tinted Balm Stick 3.4g - Lip Balm dengan VIT E', 'About Oh So Kissable Tinted Balm Stick✨:\r\nLip Balm dengan formula pH-smart yang akan kasih warna natural cantik pada bibir kamu. Dilengkapi dengan vitamin E sebagai antioksidan natural dan shea butter oil, lip balm ini akan menjaga bibirmu tetap lembab', 25925, 1, 'emina-oh-so-kissable-tinted-balm-stick-34g-lip-balm-dengan-vit-e-20231222172126.jpg'),
(23, 11, 'emina-lip-tint-eraser-10ml-pembersih-lip-tint-gel-lembut-di-bibir', 'Emina Lip Tint Eraser 10ml - Pembersih Lip Tint Gel Lembut di Bibir', 'About Lip Tint Eraser✨:\r\nPembersih lip tint berbentuk gel yang lembut di bibir', 36800, 1, 'emina-lip-tint-eraser-10ml-pembersih-lip-tint-gel-lembut-di-bibir-20231222172137.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','member') NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `is_active`, `image`) VALUES
(4, 'Admin', 'admin@admin.com', '$2y$10$IcTckaszpTk0bWH0tJE0ke5WPszAd.qBQCnSWnebkwiCmdMoXbKaq', 'admin', 1, 'admin-20200315212825.png'),
(5, 'Member', 'member@member.com', '$2y$10$IcTckaszpTk0bWH0tJE0ke5WPszAd.qBQCnSWnebkwiCmdMoXbKaq', 'member', 1, 'member-20200315232137.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_confirm`
--
ALTER TABLE `orders_confirm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders_confirm`
--
ALTER TABLE `orders_confirm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
