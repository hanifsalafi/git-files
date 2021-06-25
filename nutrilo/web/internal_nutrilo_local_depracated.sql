-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Jan 2021 pada 15.22
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nutriloi_mitra`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `account_bank`
--

CREATE TABLE `account_bank` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `bank_name` varchar(30) NOT NULL,
  `number` varchar(50) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `account_bank`
--

INSERT INTO `account_bank` (`id`, `name`, `bank_name`, `number`, `created_time`) VALUES
(1, 'Hanif Salafi', 'OVO', '082369433456', '2020-10-30 06:07:54'),
(2, 'Gio Justisia Batubara', 'BNI', '0443758197', '2020-10-30 06:07:54'),
(3, 'Ihfan Fajar Satria', 'Mandiri', '1050012000935', '2020-10-30 06:08:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `address` longtext NOT NULL,
  `delivery_date` varchar(35) NOT NULL,
  `delivery_time` varchar(35) NOT NULL,
  `delivery_notes` varchar(255) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `catering_buyer`
--

CREATE TABLE `catering_buyer` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` longtext NOT NULL,
  `latlong` varchar(50) DEFAULT NULL,
  `order_batch_id` int(11) NOT NULL,
  `order_package_id` int(10) NOT NULL,
  `quantity` int(10) DEFAULT NULL,
  `nutritional_needs` longtext,
  `payment_to` int(11) NOT NULL,
  `payment_amount` varchar(15) NOT NULL,
  `payment_date` varchar(30) DEFAULT NULL,
  `batch_start_id` int(11) DEFAULT NULL,
  `day_start` int(11) DEFAULT NULL,
  `batch_end_id` int(11) DEFAULT NULL,
  `day_end` int(11) DEFAULT NULL,
  `notes` longtext,
  `driver_notes` longtext,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `catering_buyer`
--

INSERT INTO `catering_buyer` (`id`, `name`, `phone`, `address`, `latlong`, `order_batch_id`, `order_package_id`, `quantity`, `nutritional_needs`, `payment_to`, `payment_amount`, `payment_date`, `batch_start_id`, `day_start`, `batch_end_id`, `day_end`, `notes`, `driver_notes`, `is_active`, `created_time`) VALUES
(4, 'Hanif', '980673956312', 'jl. Eka surya gg. Sidodadi', '3.509716, 98.668250', 1, 2, 1, 'lest salt', 2, '220000', NULL, 1, 1, 2, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(6, 'gio justisia', '0823123456', 'jalan darat', '3.5393702,98.654413', 1, 3, 2, 'tidak ada', 1, '1000000', NULL, 1, 1, 2, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(7, 'topik', '8735612', 'darat', '3.5254106,98.5958557', 1, 1, 1, 'asdas', 1, '239000', NULL, 1, 1, 1, 5, '12313', '-', 1, '2020-12-15 05:37:05'),
(8, 'Johan', '0823232', 'Jl. Raden Saleh Dalam No. 10', '3.589529, 98.677090', 1, 2, 1, '-', 1, '222000', NULL, 1, 1, 1, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(9, 'Cheria', '0823232328047', 'BCA KCP ASIA', '3.584493, 98.691076', 1, 1, 1, '-', 1, '220000', NULL, 1, 1, 1, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(10, 'Silvi', '87396854234', 'BCA JW', '3.596260, 98.676106', 1, 1, 1, '-', 1, '222000', NULL, 1, 1, 1, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(11, 'Vivi', '0872323232', 'Mutiara Palace', '3.610331, 98.711799', 1, 1, 1, '-', 1, '220000', NULL, 1, 1, 1, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(12, 'Puspita', '08232327953', 'Jl Seroja Raya No 144', '3.528434, 98.602867', 1, 1, 1, '-', 1, '220000', NULL, 1, 1, 1, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(13, 'Ella', '082323713', 'VIlla Gading Mas 2', '3.533680, 98.697001', 1, 1, 1, '-', 1, '220000', NULL, 1, 1, 1, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(14, 'Sinar irwansyah', '081377361145', 'Jl. Karya sehati no. 24', '3.530639, 98.671111', 2, 2, 1, 'Diabetes + asam urat. Karbo < 100gr, protein < 60gr. HARAM JEROAN. Kurangi kacang2an dan turunannya (tauge tempe dll)', 1, '195000', NULL, 2, 3, 3, 2, '', '-', 1, '2020-12-15 05:37:05'),
(15, 'Adriany Hasibuan 1', '082368682675', 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 2, 3, 1, '-', 2, '1845000', NULL, 1, 5, 6, 4, 'Ada MAAGH sebelum jam 6 Dinner', '-', 1, '2020-12-15 05:37:05'),
(16, 'Levana', '087869722124', 'Jl. Emas no. 18/30, sei rengas II', '3.5847916, 98.6976904', 2, 1, 1, '-', 1, '22000', NULL, 2, 1, 2, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(17, 'Debby Anggraini', '08126000357', 'Jl. Karya Jaya No. 146', '3.529349,98.676531', 2, 3, 1, 'Hipertensi + HAMIL. Less salt, less magic, less kecap yang asin. WARNING! Kalo perlu yg lain ngikut yg ini daripada yg ini ngikut yg lain!', 1, '395000', NULL, 2, 1, 2, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(19, 'Cheria Lunch', '081262943669', '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', 2, 6, 1, 'NO BEEF', 2, '1450000', NULL, 2, 1, 5, 5, 'LUNCH titip satpam. Harus sampe sebelum 11.45 !!', '-', 1, '2020-12-15 05:37:05'),
(20, 'Cheria Dinner', '081262943669', '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', 2, 6, 1, 'NO BEEF', 3, '0', NULL, 2, 1, 5, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(21, 'Pipin Lubis', '081375876869', 'Alamat Pengiriman:jl flamboyan raya,kompleks taman asoka asri blok E no 21', '3.5487250, 98.6173930', 2, 3, 1, 'Diabetes insulin. Kecap + gula max 2 sendok makan.', 2, '395000', NULL, 2, 1, 2, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(23, 'Vivita jansen', '082170287017', 'Komplek mutiara palace blok DD-33A', '3.610491,98.711592', 2, 2, 2, '-', 3, '0', NULL, 2, 1, 3, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(24, 'Ariki', '08116567718', 'asia mega mas blok H no.1', '3.585245,98.703028', 2, 3, 1, '-', 2, '395000', NULL, 2, 2, 3, 1, '-', '-', 1, '2020-12-15 05:37:05'),
(25, 'Ella ', '085270376755', 'Komplek villa gading mas 2 blok DD.17', '3.533581,98.697020', 2, 3, 1, 'Hipertensi = less Salt, less magic, less kecap yg ', 2, '0', NULL, 2, 1, 2, 1, 'Tanya kelanjutan Senin malam', '-', 1, '2020-12-15 05:37:05'),
(26, 'Angelia', '08116547912', 'Jl. Tembakau Deli No 2N (Masuk di sbelah jalan Graha Merah Putih)', '3.592226,98.674562', 2, 4, 1, '-', 2, '0', NULL, 1, 1, 5, 2, '-', '-', 1, '2020-12-15 05:37:05'),
(27, 'Aurora', '081376660608', 'jln harmonika baru no.110 pasar 1 padang bulan medan selayang 20135 ( depan J&M coffee). Menu: lunch + dinner weekely.', '3.555143,98.649645', 2, 3, 1, '-', 2, '0', NULL, 1, 1, 1, 1, 'Tanya kelanjutan selasa', '-', 1, '2020-12-15 05:37:05'),
(28, 'Johan', '082366598888', 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', 2, 6, 1, '-', 1, '1450000', NULL, 2, 1, 5, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(29, 'Cathy', '08116311184', 'jl pasar 1 gg polonia no.88 (rumah putih ujung)', '3.558715,98.629152', 2, 3, 1, '-', 2, '395000', NULL, 2, 1, 2, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(30, 'Clarissia', '08126038654', 'BCA Diponegoro', '3.584618,98.672817', 2, 1, 1, 'No Beef', 1, '200000', NULL, 2, 1, 2, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(31, 'dr. Novia', '08118955385', 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 2, 2, 1, '-', 2, '0', NULL, 2, 1, 3, 1, 'Rabu pause. HARUS SAMPE KE TANGANNYA SEBELUM 17.30', '-', 1, '2020-12-15 05:37:05'),
(32, 'Silvina', '081263147071', 'BCA JW MARIOT', '3.596293,98.675918', 2, 1, 1, '-', 1, '220000', NULL, 2, 1, 2, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(33, 'Amerinda', '085261684301', 'Jl. Kenanga sari No. 21 Pasar 6 Tj. Sari3', '3.561760,98.639896', 2, 1, 1, '-', 1, '195000', NULL, 2, 4, 3, 3, '-', '-', 1, '2020-12-15 05:37:05'),
(35, 'Ismah Amrina ', '081263751979', 'Jl besar Tembung masuk Jl balai umum No 5 Tembung', '3.594485,98.747070', 2, 3, 1, '-', 1, '176000', NULL, 2, 4, 2, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(37, 'Minar sianipar', '085361456906', 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', 3, 4, 1, '-', 2, '795000', NULL, 3, 1, 6, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(38, 'Adriany Hasibuan 2', '082368682675', 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 3, 3, 1, '', 2, '3950000', NULL, 3, 1, 3, 5, 'Ada MAAGH sebelum jam 6 Dinner', '-', 1, '2020-12-15 05:37:05'),
(39, 'Amerinda', '085261684301', 'Jl. Kenangq sari No. 21 Pasae 6 Tj. Sari ', '3.561753,98.639911', 3, 1, 1, '', 1, '0', NULL, 2, 4, 3, 3, '', '-', 0, '2020-12-15 05:37:05'),
(40, 'Silvina', '081263147074', 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', 3, 1, 1, '', 1, '220000', NULL, 3, 1, 3, 5, '', '-', 1, '2020-12-15 05:37:05'),
(41, 'dr. Novia', '08118955385', 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 3, 2, 1, '', 3, '00', NULL, 2, 1, 3, 1, 'harus SAMPE TANGAN sebelum 17.30', '-', 0, '2020-12-15 05:37:05'),
(43, 'Johan', '082366598888', 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', 3, 3, 1, '', 1, '0', NULL, 2, 1, 5, 5, '', '-', 1, '2020-12-15 05:37:05'),
(44, 'Angelia', '08116547912', 'Jl. Tembakau Deli No 2N (Masuk di sbelah jalan Graha Merah Putih)', '3.592226,98.674562', 3, 1, 1, '', 2, '0', NULL, 2, 1, 5, 2, '', '-', 1, '2020-12-15 05:37:05'),
(45, 'Ariki', '08116567718', 'Asia mega mas blok H no.1', '3.585245,98.703028', 3, 3, 1, '', 1, '0', NULL, 2, 4, 3, 1, '', '-', 0, '2020-12-15 05:37:05'),
(46, 'Vivita jansen', '082170287017', 'Komplek mutiara palace blok DD-33A', '3.610491,98.711592', 3, 2, 2, '', 3, '0', NULL, 1, 1, 3, 5, '', '-', 1, '2020-12-15 05:37:05'),
(47, 'Cheria Dinner', '081262943669', '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', 3, 3, 1, 'NO BEEF', 1, '0', NULL, 2, 1, 5, 5, '', '-', 1, '2020-12-15 05:37:05'),
(48, 'Cheria Lunch', '081262943669', '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', 3, 3, 1, 'NO BEEF', 2, '0', NULL, 2, 1, 5, 5, 'LUNCH titip satpam. Harus sampe sebelum 11.45 !!', '-', 1, '2020-12-15 05:37:05'),
(49, 'Debby anggraini', '08126000357', 'Jl. Karya Jaya No. 146', '3.529349,98.676531', 3, 3, 1, 'Hipertensi + HAMIL. Less salt, less magic, less kecap yang asin. WARNING! Kalo perlu yg lain ngikut yg ini daripada yg ini ngikut yg lain!', 1, '395000', NULL, 3, 1, 3, 5, '', '-', 1, '2020-12-15 05:37:05'),
(50, 'Adriany Hasibuan 1', '082368682675', 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 3, 3, 1, '', 2, '0', NULL, 3, 4, 6, 5, 'Ada MAAGH sebelum jam 6 Dinner', '-', 1, '2020-12-15 05:37:05'),
(51, 'Sinar irwansyah', '081377361145', 'Jl. Karya sehati no. 24', '3.530639, 98.671111', 3, 2, 1, 'Diabetes + asam urat. Karbo < 100gr, protein < 60gr. HARAM JEROAN. Kurangi kacang2an dan turunannya (tauge tempe dll)', 1, '0', NULL, 2, 3, 3, 2, '', '-', 0, '2020-12-15 05:37:05'),
(52, 'Aldila hilma', '085261951500', 'Jl.M. Idris no 47', '3.596292,98.659113', 3, 3, 1, '', 1, '395000', NULL, 3, 1, 3, 5, 'Dinner sebelum jam 6. Intermitten fasting', '-', 1, '2020-12-15 05:37:05'),
(59, 'dr. Novia', '08118955385', 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 3, 5, 1, '-', 1, '795000', NULL, 3, 2, 7, 4, 'Skip tanggal 13,17,26 november. Harus SAMPE TANGAN sebelum 17.30.', '-', 1, '2020-12-15 05:37:05'),
(64, 'Elisa', '081370639555', 'Jl pukat banting 5 no 11b', '3.594644,98.712990', 3, 1, 1, '', 1, '195000', NULL, 3, 4, 4, 3, '', '', 1, '2020-12-15 05:37:05'),
(65, 'Elisa', '081370639555', 'Jalan pukat banting 5 no 11b', '3.594644,98.712990', 4, 1, 1, '', 1, '0', NULL, 3, 4, 4, 3, '', '', 0, '2020-12-15 05:37:05'),
(66, 'dr. Novia', '08118955385', 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 4, 5, 1, '-', 1, '0', NULL, 3, 2, 7, 4, 'Skip tanggal 13,17,26 november.', '-Harus SAMPE TANGAN sebelum 17.30.', 1, '2020-12-15 05:37:05'),
(67, 'dr. Novia', '08118955385', 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 5, 5, 1, '-', 1, '0', NULL, 3, 2, 7, 4, 'Skip tanggal 13,17,26 november.', '-Harus SAMPE TANGAN sebelum 17.30.', 1, '2020-12-15 05:37:05'),
(68, 'dr. Novia', '08118955385', 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 6, 5, 1, '-', 1, '0', '', 3, 2, 7, 4, 'Skip tanggal 13,17,26 november.', '-Harus SAMPE TANGAN sebelum 17.30.', 1, '2020-12-15 05:37:05'),
(69, 'dr. Novia', '08118955385', 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 7, 5, 1, '-', 1, '795000', NULL, 3, 2, 7, 4, 'Skip tanggal 13,17,26 november.', '-Harus SAMPE TANGAN sebelum 17.30.', 1, '2020-12-15 05:37:05'),
(70, 'Adriany Hasibuan 1', '082368682675', 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 4, 3, 1, '', 2, '0', NULL, 3, 4, 6, 5, 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 1, '2020-12-15 05:37:05'),
(71, 'Adriany Hasibuan 1', '082368682675', 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 5, 3, 1, '', 2, '0', NULL, 3, 4, 6, 5, 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 1, '2020-12-15 05:37:05'),
(72, 'Adriany Hasibuan 1', '082368682675', 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 6, 6, 1, '', 2, '0', '', 3, 4, 6, 5, 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 1, '2020-12-15 05:37:05'),
(73, 'Cheria Lunch', '081262943669', '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', 4, 3, 1, 'NO BEEF', 2, '0', NULL, 2, 1, 5, 5, '', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 1, '2020-12-15 05:37:05'),
(74, 'Cheria Lunch', '081262943669', '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', 5, 3, 1, 'NO BEEF', 2, '0', NULL, 2, 1, 5, 5, '', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 1, '2020-12-15 05:37:05'),
(75, 'Cheria Dinner', '081262943669', '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', 4, 3, 1, 'NO BEEF', 1, '0', NULL, 2, 1, 5, 5, 'rabu&kamis lunch&diner di antar barengan sama johan ke jl raden saleh dalam', '-', 1, '2020-12-15 05:37:05'),
(76, 'Cheria Dinner', '081262943669', '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', 5, 3, 1, 'NO BEEF', 1, '0', NULL, 2, 1, 5, 5, '', '-', 1, '2020-12-15 05:37:05'),
(77, 'Angelia', '08116547912', 'Jl. Tembakau Deli No 2N (Masuk di sbelah jalan Graha Merah Putih)', '3.592226,98.674562', 4, 1, 1, '', 2, '0', NULL, 2, 1, 5, 2, '', '-', 1, '2020-12-15 05:37:05'),
(78, 'Angelia', '08116547912', 'Jl. Tembakau Deli No 2N (Masuk di sbelah jalan Graha Merah Putih)', '3.592226,98.674562', 5, 1, 1, '', 2, '0', NULL, 2, 1, 5, 2, '', '-', 0, '2020-12-15 05:37:05'),
(79, 'Minar sianipar', '085361456906', 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', 4, 4, 1, '-', 2, '795000', NULL, 3, 1, 6, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(80, 'Minar sianipar', '085361456906', 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', 5, 4, 1, '-', 2, '0', NULL, 3, 1, 6, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(81, 'Minar sianipar', '085361456906', 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', 6, 4, 1, '-', 2, '0', '', 3, 1, 6, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(82, 'Adriany Hasibuan 2', '082368682675', 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 4, 3, 1, '', 2, '3950000', NULL, 4, 1, 4, 5, 'Ada MAAGH sebelum jam 6 Dinner', '-', 1, '2020-12-15 05:37:05'),
(83, 'Fenny tjandra 1', '082167629636', 'JL flamboyan kompek cemara asrino.45 masuk dari bank OCBC', '3.633560,98.696976', 4, 1, 1, '', 1, '0', NULL, 4, 1, 5, 1, '', 'Di samping Wie Wie Louhan', 1, '2020-12-15 05:37:05'),
(84, 'Fendro Chandra', '088226699602', 'Bank bca cabang diponegoro jl diponegoro', '3.584043,98.673261', 4, 1, 1, '', 1, '0', NULL, 4, 1, 4, 5, '', '', 1, '2020-12-15 05:37:05'),
(85, 'Stefanie', '085922873090', 'Jl.dagan no.5B/6A Belakang plaza medan fair', '3.593269,98.666074', 4, 1, 1, '', 1, '0', NULL, 4, 2, 4, 5, '', '', 1, '2020-12-15 05:37:05'),
(86, 'Silvina', '081263147074', 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', 4, 1, 1, '', 1, '220000', NULL, 4, 1, 4, 5, '', '-', 1, '2020-12-15 05:37:05'),
(87, 'Amerinda', '085261684301', 'Jl. Kenangq sari No. 21 Pasae 6 Tj. Sari ', '3.561753,98.639911', 4, 1, 1, '', 1, '220000', NULL, 4, 1, 4, 5, '', '-', 1, '2020-12-15 05:37:05'),
(88, 'atina', '085270645541', 'Jl.pembangunan usu no.12', '3.5666580,98.6522182', 4, 1, 1, '', 2, '195000', NULL, 4, 1, 4, 5, '', '', 1, '2020-12-15 05:37:05'),
(89, 'Haliza', '085922835009', 'Jl suka baru no.18,padang bulan selayang 1', '3.5686427,98.6507564', 4, 1, 1, '', 2, '195000', NULL, 4, 1, 4, 5, '', 'Rumah kos tentrem telefon atau chat orang nya setelah dititipkan ke satpam', 1, '2020-12-15 05:37:05'),
(90, 'Fauziah', '08116002126', 'Jl pembangunan no 12', '3.5666580,98.6522182', 4, 1, 1, '', 2, '195000', NULL, 4, 1, 4, 5, '', '', 1, '2020-12-15 05:37:05'),
(91, 'Ratu', '082164218775', 'Jl bakti indah III no.217 komplek tata alam asri', '3.607983,98.620612', 4, 1, 2, '', 1, '0', NULL, 4, 1, 4, 5, '', '', 1, '2020-12-15 05:37:05'),
(92, 'Puput utami', '08116319915', 'Jl sidodadi komplek johor Regency Blok B no,1', '3.508880,98.665949', 4, 1, 1, '', 1, '0', NULL, 4, 1, 4, 5, 'No ikan air tawar', '', 1, '2020-12-15 05:37:05'),
(93, 'Debby anggraini', '08126000357', 'Jl. Karya Jaya No. 146', '3.529349,98.676531', 4, 3, 2, 'Hipertensi + HAMIL. Less salt, less magic, less kecap yang asin. WARNING! Kalo perlu yg lain ngikut yg ini daripada yg ini ngikut yg lain!    No udang', 1, '790000', NULL, 4, 1, 4, 5, '', '-', 1, '2020-12-15 05:37:05'),
(94, 'Juliaty Ginting', '081361447314', 'jl pasar baru no 43 padang bulan', '3.552058,98.654967', 4, 3, 1, 'No Ayam, No Nasi merah', 1, '395000', NULL, 4, 1, 4, 5, 'Skip rabu - jumat keluar kota. Ganti di batch 32', '', 0, '2020-12-15 05:37:05'),
(95, 'Aldila hilma', '085261951500', 'Jl.M. Idris no 47', '3.596292,98.659113', 4, 3, 1, '', 2, '395000', NULL, 4, 1, 4, 5, 'Dinner sebelum jam 6. Intermitten fasting', 'Mohon diterima penbayaran cash ke pengantar', 1, '2020-12-15 05:37:05'),
(96, 'Johan', '0823000022222', 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', 4, 3, 1, '', 1, '0', NULL, 2, 1, 5, 5, '', '-', 1, '2020-12-15 05:37:05'),
(97, 'Johan', '082366598888', '', '3.589318,98.677325', 5, 3, 1, '', 1, '0', '', 2, 1, 5, 5, '', '-', 1, '2020-12-15 05:37:05'),
(98, 'Fionna Blenda', '08118032109', 'kompleks malibu indah blok H-36.', '3.550728,98.684386', 4, 1, 1, '', 1, '0', NULL, 4, 2, 4, 6, '', '', 1, '2020-12-15 05:37:05'),
(99, 'Christy', '08116130478', 'Jl sampali baru komplek sampali baru No.9J', '3.593723,98.698358', 4, 1, 1, '', 2, '195000', NULL, 4, 4, 6, 3, 'selang seling dari tanggan 19nov,24nov,26nov,1des,sampai 3des', '', 1, '2020-12-15 05:37:05'),
(100, 'Christy', '08116130478', 'Jl sampali baru komplek sampali baru No.9J', '3.593723,98.698358', 5, 1, 1, 'Vegetarian', 2, '0', NULL, 4, 4, 6, 3, 'selang seling dari tanggan 19nov,24nov,26nov,1des,sampai 3des', '', 1, '2020-12-15 05:37:05'),
(101, 'Christy', '08116130478', 'Jl sampali baru komplek sampali baru No.9J', '3.593723,98.698358', 6, 1, 1, '', 2, '0', '', 4, 4, 6, 3, 'selang seling dari tanggan 19nov,24nov,26nov,1des,sampai 3des', '', 1, '2020-12-15 05:37:05'),
(102, 'Juliaty Ginting', '081361447314', 'jl pasar baru no 43 padang bulan', '3.552058,98.654967', 5, 3, 1, 'No Ayam, No Nasi merah', 1, '0', NULL, 5, 1, 5, 3, 'Skip rabu - jumat keluar kota. Ganti di batch 32 hari senin - rabu', '', 0, '2020-12-15 05:37:05'),
(103, 'Alvero', '081333363189', 'Jl persatuan,komplek surya regency 1 Blok c No.8', '3.612504,98.652852', 4, 3, 1, '', 2, '396000', NULL, 4, 4, 5, 3, '', 'Cantolin aja makanannya di pintu besi dalam.BUKAN PAGAR. Setelah itu  fotokan lalu chat beliau.GA BISA DITELEFON', 1, '2020-12-15 05:37:05'),
(104, 'Alvero', '081333363189', 'Jl persatuan,komplek surya regency 1 Blok c No.8', '3.612504,98.652852', 5, 3, 1, '', 2, '0', NULL, 4, 4, 5, 3, '', 'Cantolin aja makanannya di pintu besi.BUKAN PAGAR. Setelah itu  fotokan lalu chat beliau.GA BISA DITELEFON', 0, '2020-12-15 05:37:05'),
(107, 'Silvia', '081362420122', 'Jl persamaan Gg rahmat No.77 simpang limun', '3.551046,98.696498', 5, 1, 1, 'HIGH PROTEIN (> 70gr). Beef, ikan, ayam minimal 150gr, udang minimal 200 gr. KARBO DISIKITIN < 50gr ! NO NASI MERAH/PUTIH', 1, '390000', '', 5, 1, 6, 5, '', '', 1, '2020-12-15 05:37:05'),
(108, 'Silvia', '081362420122', 'Jl persamaan Gg rahmat No.77 simpang limun', '3.551046,98.696498', 6, 1, 1, 'HIGH PROTEIN (> 70gr). Beef, ikan, ayam minimal 150gr, udang minimal 200 gr', 1, '0', '', 5, 1, 6, 5, '', '', 1, '2020-12-15 05:37:05'),
(110, 'Nitya', '08116438586', 'Jne Gatsu (sebelah GG harapan seberang Tomang elok)', '3.590999,98.641123', 5, 1, 1, '', 2, '195000', NULL, 5, 1, 5, 5, '', '', 1, '2020-12-15 05:37:05'),
(111, 'Ginda laura ', '08116483008', 'Jl Bunga Ester No.93C Medan Selayang Pasar 6 Padang bulan', '3.544701,98.652720', 5, 1, 1, '', 1, '19500', NULL, 5, 1, 5, 5, '', '', 1, '2020-12-15 05:37:05'),
(112, 'Clarissia', '08126038654', 'BCA Diponegoro', '3.584618,98.672817', 5, 1, 1, 'No Beef', 1, '200000', NULL, 5, 1, 5, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(113, 'Ismah Amrina ', '081263751979', 'Jl besar Tembung masuk Jl balai umum No 5 Tembung', '3.594485,98.747070', 5, 3, 1, '-', 1, '80000', NULL, 5, 1, 5, 1, '-', '-', 0, '2020-12-15 05:37:05'),
(114, 'Demmy putri', '081264600407', 'ZAP klinik Jl. Iskandar muda no 81 Medan (Sebelah BRI AGRO).', '3.581344,98.661068', 5, 1, 1, '', 1, '195000', NULL, 5, 1, 5, 5, '', '', 1, '2020-12-15 05:37:05'),
(115, 'Silvina', '08163147074', 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', 5, 1, 1, '', 1, '220000', NULL, 5, 1, 5, 5, '', '', 1, '2020-12-15 05:37:05'),
(116, 'Fajar', '082294755949', 'Jl Karya jaya gg eka pribadi', '3.518387,98.676233', 5, 2, 1, 'Kolesterol dan asam urat tinggi. Jangan berminyak x, daging ayam, ikan, jamur TIDAK LEBIH 80 gram, kurangi biji2an, kacang2an, kol, dan bayam. HARAM Jeroan', 2, '195000', NULL, 5, 1, 5, 5, '', '', 1, '2020-12-15 05:37:05'),
(117, 'Fenny tjandra 1', '082167629636', 'Jl Flamboyan komplek cemara asri No.45 masuk dari bank OCBC', '3.633560,98.696976', 5, 1, 1, '', 1, '0', NULL, 4, 1, 5, 1, '', 'disamping Wie Wie louhan', 0, '2020-12-15 05:37:05'),
(118, 'Amerinda', '085261684301', 'Jl. Kenangq sari No. 21 Pasae 6 Tj. Sari ', '3.561753,98.639911', 5, 1, 1, '', 1, '220000', NULL, 5, 1, 5, 5, '', '-', 1, '2020-12-15 05:37:05'),
(119, 'Debby anggraini', '08126000357', 'Jl. Karya Jaya No. 146', '3.529349,98.676531', 5, 3, 2, 'Hipertensi + HAMIL. Less salt, less magic, less kecap yang asin. WARNING! Kalo perlu yg lain ngikut yg ini daripada yg ini ngikut yg lain!    No udang', 1, '0', NULL, 5, 1, 5, 5, 'LUNCH 1 DINNER 2', '-', 1, '2020-12-15 05:37:05'),
(120, 'Fifi', '087825567898', 'Jl.Kereta Api Baru No.10B ; Kesawan ; Medan Barat', '3.589103,98.680338', 5, 3, 1, '', 1, '395000', '', 5, 1, 5, 5, '', 'Pengiriman lewat pintu belakang, masuk dari gang di samping rumah Jl.Perniagaan Baru no. 20C', 1, '2020-12-15 05:37:05'),
(121, 'Dilla', '081376296007', 'JL. Mojopahit ujung No. 69 A (Depan Yona Cafe). Pagar htam yg ada ring basket. Medan 20153', '3.575552,98.665248', 5, 2, 1, 'HIGH PROTEIN (> 70gr). Beef, ikan, ayam minimal 150gr, udang minimal 200 gr. KARBO DISIKITIN < 50gr !', 2, '395000', '', 5, 1, 6, 5, 'PAKAI MENU LUNCH', '(Depan Yona Cafe) Pagar htam yg ada ring basket ', 1, '2020-12-15 05:37:05'),
(122, 'Dilla', '081376296007', 'JL. Mojopahit ujung No. 69 A (Depan Yona Cafe). Pagar htam yg ada ring basket. Medan 20153', '3.575552,98.665248', 6, 2, 1, 'HIGH PROTEIN (> 70gr). Beef, ikan, ayam minimal 150gr, udang minimal 200 gr', 2, '0', '', 5, 1, 6, 5, 'PAKAI MENU LUNCH', '(Depan Yona Cafe) Pagar htam yg ada ring basket ', 1, '2020-12-15 05:37:05'),
(123, 'Adriany Hasibuan 2', '082368682675', 'jl Bunga ester No.46d psr VI .bulan (rumahnya pas didepan greja katolik St.Fransiskus)', '3.545025,98.651143', 5, 3, 1, '', 2, '395000', '', 5, 1, 5, 5, 'ada MAAGH sebelum jam 6', '', 1, '2020-12-15 05:37:05'),
(124, 'Hanif', '082369433456', 'jl. Eka surya gg. Sidodadi', '3.509716, 98.668250', 7, 2, 1, 'lest salt', 2, '220000', '23-11-2020', 7, 1, 7, 5, 'TESTING', '-', 1, '2020-12-15 05:37:05'),
(125, 'Ihfan', '082369433456', 'Jln Raden Saleh Dalam', '3.589318,98.677325', 7, 3, 1, '', 1, '0', '23-11-2020', 7, 1, 7, 5, 'TESTING', '-', 1, '2020-12-15 05:37:05'),
(126, 'Gio', '082369433456', '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', 7, 3, 1, 'NO BEEF', 2, '0', '', 7, 1, 7, 5, 'TESTING', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 1, '2020-12-15 05:37:05'),
(127, 'Gita Aisyah', '081265350015', 'Komplek tasbi 2 blok 1 No.43', '3.567955,98.625770', 5, 1, 1, '', 3, '0', '', 5, 3, 5, 5, '', '', 1, '2020-12-15 05:37:05'),
(128, 'Nesya Ardella', '08113677431', 'Perumahan Medan Resort City (Mercy) Rotterdam blok K06 kec.Deli Tua', '3.512107,98.675058', 5, 3, 1, '-', 2, '685000', '', 5, 4, 6, 3, 'LUNCH 1 DINNER 2', '', 1, '2020-12-15 05:37:05'),
(129, 'Nesya Ardella', '08113677431', 'Perumahan Medan Resort City (Mercy) Rotterdam blok K06 kec.Deli Tua', '3.512107,98.675058', 6, 3, 1, '', 2, '0', '', 5, 4, 6, 3, 'LUNCH 1 DINNER 2', '', 1, '2020-12-15 05:37:05'),
(130, 'Willi', '082167888811', 'Jl s parman no 217, cambridge apartemen tower picasso lantai 21 (dari zainul arifin, pas sebelum tanjakan turun starbucks cambridge ada gerbang besi, drop off ke security sana saja).', '3.584218,98.667676', 6, 2, 1, 'NO BEEF', 1, '195000', '', 6, 1, 6, 5, '', '( dari zainul arifin, pas sebelum tanjakan turun starbucks cambridge ada gerbang besi, drop off ke security sana saja )', 1, '2020-12-15 05:37:05'),
(131, 'Amelia', '08126522057', 'Tirta investama jl kapten soemarsono No 74', '3.615893,98.641688', 6, 1, 1, 'Nasi,pasta,spaghetti,kentang,dan karbo lain DIBAWAH 65gr', 1, '395000', '', 6, 1, 7, 5, '', '', 1, '2020-12-15 05:37:05'),
(132, 'Amelia', '08126522057', 'Tirta investama jl kapten soemarsono No 74', '3.615893,98.641688', 7, 1, 1, '', 1, '395008', '', 6, 1, 7, 5, '', '', 1, '2020-12-15 05:37:05'),
(133, 'Sharee ', '085805618529', 'Jl Bintang No.1B/17(sederet RM samudra)', '3.594740,98.686869', 6, 3, 1, 'NO BEEF', 1, '395000', '', 6, 1, 6, 5, 'Reques aglio olio', '', 1, '2020-12-15 05:37:05'),
(134, 'Winna kartika', '087869090150', 'Jl. Menteng VII gg. Kesatria no. 20 Medan', '3.566334,98.725043', 6, 1, 1, 'Nasi,pasta,spaghetti,kentang,dan karbo lain DIBAWAH 65gr', 2, '195000', '', 6, 1, 6, 5, '', '', 1, '2020-12-15 05:37:05'),
(135, 'Didi ', '082370402979', 'ACC ADAM MALIK, Jalan adam malik no.28 (sebelah prudential dan yamaha)', '3.597241,98.66928', 6, 1, 1, '', 2, '195000', '', 6, 1, 6, 5, '', '', 1, '2020-12-15 05:37:05'),
(136, 'Agung rachmawati', '081291818777', 'Jl beringin 4 No.173 gaperta masuk dari samping doorsmear arwana', '3.606051,98.627375', 6, 3, 1, 'Tidak bisa IKAN LAUT kecuali dorry. Semua ikan tawar bisa', 2, '395000', '', 6, 1, 6, 5, '', '', 1, '2020-12-15 05:37:05'),
(137, 'Melsa pratiwi', '082260912490', 'Garuda indonesia jl mongonsidi No.34A depan hermes', '3.571363,98.666801', 6, 1, 1, 'GAK makan nasi merah dan putih. ALERGI PEPAYA, NENAS, BUNCIS', 1, '195000', '', 6, 1, 6, 5, '', '', 1, '2020-12-15 05:37:05'),
(138, 'Tanty anggraeni s', '081377060515', 'Polda sumut pintu 3', '3.530834,98.737646', 6, 1, 1, 'Nasi,pasta,spaghetti,kentang,dan karbo lain DIBAWAH 65gr', 2, '195000', '', 6, 1, 6, 5, '', '', 1, '2020-12-15 05:37:05'),
(139, 'Johan', '082366598888', 'Jl raden saleh dalam No.10', '3.589318,98.677325', 6, 6, 1, '', 1, '145000', '', 6, 1, 9, 5, '', '-', 1, '2020-12-15 05:37:05'),
(140, 'Johan', '082366598888', 'Jl raden saleh dalam No.10', '3.589318,98.677325', 7, 3, 1, '', 1, '145000', '', 6, 1, 7, 5, '', '-', 1, '2020-12-15 05:37:05'),
(141, 'Cheria Lunch', '081262943669', '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', 6, 4, 1, 'NO BEEF', 2, '0', '', 6, 1, 9, 5, '', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 1, '2020-12-15 05:37:05'),
(142, 'Cheria Lunch', '081262943669', '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', 7, 3, 1, 'NO BEEF', 2, '145000', '', 6, 1, 7, 5, '', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 1, '2020-12-15 05:37:05'),
(143, 'Cheria Dinner', '081262943669', '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', 6, 5, 1, 'NO BEEF', 1, '145000', '', 6, 1, 9, 5, '', '-', 1, '2020-12-15 05:37:05'),
(144, 'Clarissia', '08126038654', 'BCA Diponegoro', '3.584618,98.672817', 6, 1, 1, 'No Beef', 1, '200000', '', 6, 1, 6, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(145, 'Silvina', '08163147074', 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', 6, 1, 1, '', 1, '220000', '', 6, 1, 6, 5, '', '', 1, '2020-12-15 05:37:05'),
(146, 'Kartika Yusuf', '082366317224', 'Aquilla Residence 9i-j, Jl. Garuda No.28, Sei Sikambing B', '3.588473,98.639954', 6, 1, 1, '', 3, '0', '', 6, 1, 6, 5, '', '', 1, '2020-12-15 05:37:05'),
(147, 'Cathy', '08116311184', 'jl pasar 1 gg polonia no.88 (rumah putih ujung)', '3.558715,98.629152', 6, 1, 1, '-', 2, '195000', '', 6, 1, 6, 5, '-', '-', 1, '2020-12-15 05:37:05'),
(148, 'Debby anggraini', '08126000357', 'Jl. Karya Jaya No. 146', '3.529349,98.676531', 6, 3, 2, 'Hipertensi + HAMIL. Less salt, less magic, less kecap yang asin. WARNING! Kalo perlu yg lain ngikut yg ini daripada yg ini ngikut yg lain!    No udang', 1, '720000', '', 6, 1, 6, 5, '', '-', 1, '2020-12-15 05:37:05'),
(149, 'Ola sembiring', '082273508719', 'Jl bunga asoka komplek asoka raya residance blok d57. Ringroad medan', '3.564046,98.622653', 6, 1, 1, 'ALERGI AYAM!! Nasi,pasta,spaghetti,kentang,dan karbo lain DIBAWAH 65gr', 2, '195000', '', 6, 3, 7, 2, '', '', 1, '2020-12-15 05:37:05'),
(150, 'Ola sembiring', '082273508719', 'Jl bunga asoka komplek asoka raya residance blok d57. Ringroad medan', '3.564046,98.622653', 7, 1, 1, 'ALERGI AYAM!! Nasi,pasta,spaghetti,kentang,dan karbo lain DIBAWAH 65gr', 2, '195000', '', 6, 3, 7, 2, '', '', 1, '2020-12-15 05:37:05'),
(171, 'Hanif', '082369433456', 'Hanif,Medan,Ringroad', '3.509716, 98.668250', 1, 2, 1, 'lest. salt', 2, '220000', '', 1, 1, 1, 5, 'TESTING', '-', 1, '2020-12-15 05:37:05'),
(172, 'Hanif', '082369433456', 'Hanif. Medan. Ringroad', '3.509716, 98.668250', 1, 2, 1, 'lest.. salt', 2, '220000', '', 1, 1, 1, 5, 'TESTING', '-', 1, '2020-12-15 05:37:05'),
(173, 'Hanif', '082369433456', 'Hanif. Medan. Ringroad', '3.509716, 98.668250', 1, 2, 1, 'lest... salt', 2, '220000', '', 1, 1, 1, 5, 'TESTING', '-', 1, '2020-12-15 05:37:05'),
(174, 'Johan', '082366598888', 'Jl. raden. saleh. dalam. No.10', '3.589318,98.677325', 1, 3, 1, '', 1, '145000', '', 6, 1, 7, 5, '', '-', 1, '2020-12-15 05:37:05'),
(175, 'Johan', '082366598888', 'Jl. raden. saleh. dalam. No.10', '3.589318,98.677325', 2, 3, 1, '', 1, '145000', '', 6, 1, 7, 5, '', '-', 1, '2020-12-15 05:37:05'),
(176, 'Johan', '082366598888', 'Jl. raden. saleh. dalam. No.10', '3.589318,98.677325', 3, 3, 1, '', 1, '145000', '', 6, 1, 7, 5, '', '-', 1, '2020-12-15 05:37:05'),
(177, 'Johan', '082366598888', 'Jl. raden. saleh. dalam. No.10', '3.589318,98.677325', 4, 3, 1, '', 1, '145000', '', 6, 1, 7, 5, '', '-', 1, '2020-12-15 05:37:05'),
(178, 'Johan', '082366598888', 'Jl. raden. saleh. dalam. No.10', '3.589318,98.677325', 5, 3, 1, '', 1, '145000', '', 6, 1, 7, 5, '', '-', 1, '2020-12-15 05:37:05'),
(179, 'Johan', '082366598888', 'Jl. raden. saleh. dalam. No.10', '3.589318,98.677325', 6, 3, 1, '', 1, '145000', '', 6, 1, 7, 5, '', '-', 1, '2020-12-15 05:37:05'),
(180, 'Johan', '082366598888', 'Jl. raden. saleh. dalam. No.10', '3.589318,98.677325', 7, 3, 1, '', 1, '145000', '', 6, 1, 7, 5, '', '-', 1, '2020-12-15 05:37:05'),
(181, 'Johan', '082366598888', 'Jl. raden. saleh. dalam. No.10', '3.530848,98.737637', 8, 3, 1, '-', 1, '145000', '15-12-2020', 8, 1, 8, 5, '-', '-', 1, '2020-12-15 05:39:16'),
(182, 'Johan', '082366598888', 'Jl. raden. saleh. dalam. No.10', '3.530848,98.737637', 8, 3, 1, '-', 1, '145000', '15-12-2020', 8, 1, 8, 5, '-', '-', 1, '2020-12-15 05:39:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `catering_order_batch`
--

CREATE TABLE `catering_order_batch` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `batch_number` int(11) DEFAULT NULL,
  `duration` varchar(35) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `catering_order_batch`
--

INSERT INTO `catering_order_batch` (`id`, `name`, `batch_number`, `duration`, `is_active`, `created_time`) VALUES
(1, 'Batch 28', 28, '26-30 Oktober', 1, '2020-10-27 01:50:53'),
(2, 'Batch 29', 29, '2-6 November', 1, '2020-10-27 06:10:34'),
(3, 'Batch 30', 30, '9 - 13 November 2020', 1, '2020-10-30 16:53:36'),
(4, 'Batch 31', 31, '16 - 20 November 2020', 1, '2020-10-30 16:54:12'),
(5, 'Batch 32', 32, '23 - 27 November 2020', 1, '2020-10-31 05:48:56'),
(6, 'Batch 33', 33, '30 Nov - 4 Des 2020', 1, '2020-11-04 08:55:41'),
(7, 'Batch 34', 34, '7 - 12 Desember', 1, '2020-11-09 14:57:37'),
(8, 'Batch 35', 35, '14 - 18 Desember 2020', 1, '2020-11-29 10:18:43'),
(9, 'Batch 36', 36, '21 - 25 Desember 2020', 1, '2020-11-29 10:19:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `catering_order_detail`
--

CREATE TABLE `catering_order_detail` (
  `id` int(11) NOT NULL,
  `catering_order_batch_id` int(11) NOT NULL,
  `day_id` int(11) NOT NULL,
  `time_order` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `address` longtext,
  `latlong` varchar(30) DEFAULT NULL,
  `notes` longtext,
  `driver_notes` longtext,
  `is_out_of_range` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `catering_order_detail`
--

INSERT INTO `catering_order_detail` (`id`, `catering_order_batch_id`, `day_id`, `time_order`, `buyer_id`, `address`, `latlong`, `notes`, `driver_notes`, `is_out_of_range`, `is_active`, `created_time`) VALUES
(37, 1, 1, 1, 8, 'Jl. Raden Saleh Dalam No. 10', '3.589529, 98.677090', '-', '-', 0, 1, '2020-10-28 10:01:42'),
(38, 1, 1, 1, 9, 'BCA KCP ASIA', '3.584493, 98.691076', '-', '-', 0, 1, '2020-10-28 10:01:49'),
(39, 1, 1, 1, 10, 'BCA JW', '3.596260, 98.676106', '-', '-', 0, 1, '2020-10-28 10:01:55'),
(46, 2, 1, 1, 15, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', '-', '-', 0, 1, '2020-10-29 19:54:24'),
(47, 2, 1, 2, 15, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', '-', '-', 0, 1, '2020-10-29 19:55:13'),
(48, 2, 2, 1, 15, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', '-', '-', 0, 1, '2020-10-29 19:55:27'),
(53, 2, 4, 1, 15, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', '-', '-', 0, 1, '2020-10-29 19:57:28'),
(54, 2, 4, 2, 15, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', '-', '-', 0, 1, '2020-10-29 19:57:42'),
(56, 2, 3, 2, 14, 'Jl. Karya sehati no. 24', '3.530639, 98.671111', 'Diabetes dan asam urat. Nasi max 100 gr, daging2an max 60 gr', '-', 0, 1, '2020-10-29 20:01:39'),
(57, 2, 4, 2, 14, 'Jl. Karya sehati no. 24', '3.530639, 98.671111', 'Diabetes dan asam urat. Nasi max 100 gr, daging2an max 60 gr', '-', 0, 1, '2020-10-29 20:02:00'),
(59, 2, 1, 1, 16, 'Jl. Emas no. 18/30, sei rengas II', '3.5847916, 98.6976904', '-', '-', 0, 1, '2020-10-29 20:04:09'),
(60, 2, 1, 1, 17, 'Jl. Karya Jaya No. 146', '3.5301298, 98.6776335', 'LESS SALT, LESS MAGIC', '-', 0, 1, '2020-10-29 20:05:16'),
(61, 2, 1, 2, 17, 'Jl. Karya Jaya No. 146', '3.5301298, 98.6776335', 'Less salt, less magic', '-', 0, 1, '2020-10-29 20:05:49'),
(62, 2, 1, 1, 19, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', 'LUNCH titip satpam. Dinner ke jl. Puri.', '-', 0, 1, '2020-10-29 20:06:11'),
(63, 2, 1, 2, 20, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', '-', '-', 0, 1, '2020-10-29 20:06:27'),
(64, 2, 1, 1, 21, 'Alamat Pengiriman:jl flamboyan raya,kompleks taman asoka asri blok E no 21', '3.5487250, 98.6173930', 'Diabetes jangan banyak kecap dan gula. Max 3 sendok', '-', 0, 1, '2020-10-29 20:07:43'),
(65, 2, 1, 2, 21, 'Alamat Pengiriman:jl flamboyan raya,kompleks taman asoka asri blok E no 21', '3.5487250, 98.6173930', 'Diabetes jangan banyak gula + kecap. Maksimal 3 sendok utk total gula dan kecap', '-', 0, 1, '2020-10-29 20:08:21'),
(66, 2, 1, 2, 23, 'Komplek mutiara palace blok DD-33A', '3.610491,98.711592', '-', '-', 0, 1, '2020-10-29 20:08:53'),
(67, 2, 1, 1, 24, 'asia mega mas blok H no.1', '3.585245,98.703028', 'Lanjut hari selasa tanya lagi', '-', 0, 1, '2020-10-29 20:09:30'),
(68, 2, 1, 2, 24, 'asia mega mas blok H no.1', '3.585245,98.703028', 'Lanjut hari selasa tanya lagi', '-', 0, 1, '2020-10-29 20:09:42'),
(69, 2, 1, 1, 25, 'Komplek villa gading mas 2 blok DD.17', '3.533581,98.697020', 'LESS SALT, LESS MACIG, totalnya 1/2 sendok teh', '-', 0, 1, '2020-10-29 20:11:05'),
(70, 2, 1, 2, 25, 'Komplek villa gading mas 2 blok DD.17', '3.533581,98.697020', 'LESS SALT, LESS MACIG, totalnya 1/2 sendok teh', '-', 0, 1, '2020-10-29 20:11:34'),
(71, 2, 1, 1, 26, 'Jl. Tembakau Deli No 2N (Masuk di sbelah jalan Graha Merah Putih)', '3.592226,98.674562', '-', '-', 0, 1, '2020-10-29 20:11:54'),
(72, 2, 1, 1, 27, 'jln harmonika baru no.110 pasar 1 padang bulan medan selayang 20135 ( depan J&M coffee). Menu: lunch + dinner weekely.', '3.555143,98.649645', 'Tanya kelanjutan selasa', '-', 0, 1, '2020-10-29 20:12:17'),
(73, 2, 1, 2, 27, 'jln harmonika baru no.110 pasar 1 padang bulan medan selayang 20135 ( depan J&M coffee). Menu: lunch + dinner weekely.', '3.555143,98.649645', 'Tanya kelanjutan selasa', '-', 0, 1, '2020-10-29 20:12:27'),
(74, 2, 1, 1, 28, 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', 'LESS SALT, LESS MACIG, totalnya 1/2 sendok teh', '-', 0, 1, '2020-10-29 20:12:49'),
(76, 2, 1, 1, 29, 'jl pasar 1 gg polonia no.88 (rumah putih ujung)', '3.558715,98.629152', '-', '-', 0, 1, '2020-10-29 20:13:26'),
(77, 2, 1, 2, 29, 'jl pasar 1 gg polonia no.88 (rumah putih ujung)', '3.558715,98.629152', '-', '-', 0, 1, '2020-10-29 20:13:42'),
(78, 2, 1, 1, 30, 'BCA Diponegoro', '3.584618,98.672817', 'No Beef', '-', 0, 1, '2020-10-29 20:13:59'),
(79, 2, 1, 2, 31, 'Oyo medan city homestay / turki family spa jln dr mansyur no 81', '3.567458,98.647036', 'Rabu pause. HARUS SAMPE KE TANGANNYA SEBELUM 17.30', '-', 0, 1, '2020-10-29 20:14:35'),
(80, 2, 2, 1, 32, 'BCA JW MARIOT', '3.596293,98.675918', '-', '-', 0, 1, '2020-10-30 18:36:51'),
(81, 2, 2, 2, 31, 'Oyo medan city homestay / turki family spa jln dr mansyur no 81', '3.567458,98.647036', 'Rabu pause. HARUS SAMPE KE TANGANNYA SEBELUM 17.30', '-', 0, 1, '2020-10-30 18:44:22'),
(82, 2, 2, 1, 30, 'BCA Diponegoro', '3.584618,98.672817', '-', '-', 0, 1, '2020-10-30 18:45:13'),
(83, 2, 2, 1, 29, 'jl pasar 1 gg polonia no.88 (rumah putih ujung)', '3.558715,98.629152', '-', '-', 0, 1, '2020-10-30 18:46:00'),
(84, 2, 2, 2, 29, 'jl pasar 1 gg polonia no.88 (rumah putih ujung)', '3.558715,98.629152', '-', '-', 0, 1, '2020-10-30 18:46:19'),
(85, 2, 2, 1, 28, 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', '-', '-', 0, 1, '2020-10-30 18:47:00'),
(86, 2, 2, 2, 28, 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', '-', '-', 0, 1, '2020-10-30 18:47:23'),
(87, 2, 2, 1, 26, 'Jl. Tembakau Deli No 2N (Masuk di sbelah jalan Graha Merah Putih)', '3.592226,98.674562', '-', '-', 0, 1, '2020-10-30 18:51:23'),
(88, 2, 2, 2, 23, 'Komplek mutiara palace blok DD-33A', '3.610491,98.711592', '-', '-', 0, 1, '2020-10-30 18:53:26'),
(89, 2, 2, 1, 21, 'Alamat Pengiriman:jl flamboyan raya,kompleks taman asoka asri blok E no 21', '3.5487250, 98.6173930', '-', '-', 0, 1, '2020-10-30 18:55:46'),
(90, 2, 2, 2, 21, 'Alamat Pengiriman:jl flamboyan raya,kompleks taman asoka asri blok E no 21', '3.5487250, 98.6173930', '-', '-', 0, 1, '2020-10-30 18:56:04'),
(91, 2, 2, 2, 20, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', '-', '-', 0, 1, '2020-10-30 18:56:30'),
(92, 2, 2, 1, 19, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', 'LUNCH titip satpam. Dinner ke jl. Puri.', '-', 0, 1, '2020-10-30 18:56:47'),
(93, 2, 2, 1, 17, 'Jl. Karya Jaya No. 146', '3.5301298, 98.6776335', '-', '-', 0, 1, '2020-10-30 18:57:23'),
(94, 2, 2, 2, 17, 'Jl. Karya Jaya No. 146', '3.5301298, 98.6776335', '-', '-', 0, 1, '2020-10-30 18:57:38'),
(95, 2, 2, 1, 16, 'Jl. Emas no. 18/30, sei rengas II', '3.5847916, 98.6976904', '-', '-', 0, 1, '2020-10-30 18:58:28'),
(97, 2, 2, 2, 15, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', '-', '-', 0, 1, '2020-10-30 18:59:12'),
(98, 2, 2, 1, 24, 'asia mega mas blok H no.1', '3.585245,98.703028', '-', '-', 0, 1, '2020-10-30 21:07:03'),
(99, 2, 2, 2, 24, 'asia mega mas blok H no.1', '3.585245,98.703028', '-', '-', 0, 1, '2020-10-30 21:07:26'),
(100, 2, 1, 2, 28, 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', '-', '-', 0, 1, '2020-10-30 21:10:25'),
(101, 2, 3, 1, 32, 'BCA JW MARIOT', '3.596293,98.675918', '-', '-', 0, 1, '2020-11-01 06:33:01'),
(102, 2, 3, 1, 30, 'BCA Diponegoro', '3.584618,98.672817', '-', '-', 0, 1, '2020-11-01 06:33:44'),
(103, 2, 3, 1, 29, 'jl pasar 1 gg polonia no.88 (rumah putih ujung)', '3.558715,98.629152', '-', '-', 0, 1, '2020-11-01 06:34:00'),
(104, 2, 3, 2, 29, 'jl pasar 1 gg polonia no.88 (rumah putih ujung)', '3.558715,98.629152', '-', '-', 0, 1, '2020-11-01 06:34:23'),
(105, 2, 3, 1, 28, 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', '-', '-', 0, 1, '2020-11-01 06:34:40'),
(106, 2, 3, 2, 28, 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', '-', '-', 0, 1, '2020-11-01 06:34:53'),
(107, 2, 3, 1, 26, 'Ke jln irian barat no A1', '3.587039,98.682708', '-', '-', 0, 1, '2020-11-01 06:35:36'),
(108, 2, 3, 1, 24, 'asia mega mas blok H no.1', '3.585245,98.703028', '-', '-', 0, 1, '2020-11-01 06:36:01'),
(109, 2, 3, 2, 24, 'asia mega mas blok H no.1', '3.585245,98.703028', '-', '-', 0, 1, '2020-11-01 06:36:14'),
(110, 2, 3, 2, 23, 'Komplek mutiara palace blok DD-33A', '3.610491,98.711592', '-', '-', 0, 1, '2020-11-01 06:36:37'),
(111, 2, 3, 1, 21, 'Alamat Pengiriman:jl flamboyan raya,kompleks taman asoka asri blok E no 21', '3.5487250, 98.6173930', '-', '-', 0, 1, '2020-11-01 06:37:42'),
(112, 2, 3, 2, 21, 'Alamat Pengiriman:jl flamboyan raya,kompleks taman asoka asri blok E no 21', '3.5487250, 98.6173930', '-', '-', 0, 1, '2020-11-01 06:37:52'),
(113, 2, 3, 2, 20, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', '-', '-', 0, 1, '2020-11-01 06:38:21'),
(114, 2, 3, 1, 19, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', 'LUNCH titip satpam. Harus sampe sebelum 11.45 !!', '-', 0, 1, '2020-11-01 06:38:42'),
(115, 2, 3, 1, 17, 'Jl. Karya Jaya No. 146', '3.5301298, 98.6776335', '-', '-', 0, 1, '2020-11-01 06:39:30'),
(116, 2, 3, 2, 17, 'Jl. Karya Jaya No. 146', '3.5301298, 98.6776335', '-', '-', 0, 1, '2020-11-01 06:39:42'),
(117, 2, 3, 1, 16, 'Jl. Emas no. 18/30, sei rengas II', '3.5847916, 98.6976904', '-', '-', 0, 1, '2020-11-01 06:39:57'),
(118, 2, 3, 1, 15, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH harus sampe sebelum jam 6', '-', 0, 1, '2020-11-01 06:40:56'),
(119, 2, 3, 2, 15, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6', '-', 0, 1, '2020-11-01 06:41:19'),
(120, 2, 4, 1, 33, 'Jl. Kenanga sari No. 21 Pasar 6 Tj. Sari3', '3.561760,98.639896', '-', '-', 0, 1, '2020-11-02 01:07:49'),
(121, 2, 4, 1, 32, 'BCA JW MARIOT', '3.596293,98.675918', '-', '-', 0, 1, '2020-11-02 01:09:26'),
(123, 2, 4, 2, 31, 'Oyo medan city homestay / turki family spa jln dr mansyur no 81', '3.567458,98.647036', 'Rabu pause. HARUS SAMPE KE TANGANNYA SEBELUM 17.30', '-', 0, 1, '2020-11-02 01:10:59'),
(124, 2, 4, 1, 30, 'BCA Diponegoro', '3.584618,98.672817', '-', '-', 0, 1, '2020-11-02 01:11:34'),
(125, 2, 4, 1, 29, 'jl pasar 1 gg polonia no.88 (rumah putih ujung)', '3.558715,98.629152', '-', '-', 0, 1, '2020-11-02 01:12:22'),
(126, 2, 4, 2, 29, 'jl pasar 1 gg polonia no.88 (rumah putih ujung)', '3.558715,98.629152', '-', '-', 0, 1, '2020-11-02 01:12:42'),
(127, 2, 4, 1, 28, 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', '-', '-', 0, 1, '2020-11-02 01:14:08'),
(128, 2, 4, 2, 28, 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', '-', '-', 0, 1, '2020-11-02 01:14:24'),
(129, 2, 4, 1, 26, 'Jl. Tembakau Deli No 2N (Masuk di sbelah jalan Graha Merah Putih)', '3.592226,98.674562', '-', '-', 0, 1, '2020-11-02 01:15:22'),
(130, 2, 4, 1, 24, 'asia mega mas blok H no.1', '3.585245,98.703028', '-', '-', 0, 1, '2020-11-02 01:16:56'),
(131, 2, 4, 2, 24, 'asia mega mas blok H no.1', '3.585245,98.703028', '-', '-', 0, 1, '2020-11-02 01:17:26'),
(132, 2, 4, 2, 23, 'Komplek mutiara palace blok DD-33A', '3.610491,98.711592', '-', '-', 0, 1, '2020-11-02 01:18:01'),
(133, 2, 4, 1, 21, 'Alamat Pengiriman:jl flamboyan raya,kompleks taman asoka asri blok E no 21', '3.5487250, 98.6173930', '-', '-', 0, 1, '2020-11-02 01:18:49'),
(134, 2, 4, 2, 21, 'Alamat Pengiriman:jl flamboyan raya,kompleks taman asoka asri blok E no 21', '3.5487250, 98.6173930', '-', '-', 0, 1, '2020-11-02 01:19:25'),
(135, 2, 4, 2, 20, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', '-', '-', 0, 1, '2020-11-02 01:20:16'),
(136, 2, 4, 1, 19, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', 'LUNCH titip satpam. Harus sampe sebelum 11.45 !!', '-', 0, 1, '2020-11-02 01:20:32'),
(137, 2, 4, 1, 17, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '-', '-', 0, 1, '2020-11-02 01:20:53'),
(138, 2, 4, 2, 17, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '-', '-', 0, 1, '2020-11-02 01:21:11'),
(139, 2, 4, 1, 16, 'Jl. Emas no. 18/30, sei rengas II', '3.5847916, 98.6976904', '-', '-', 0, 1, '2020-11-02 01:21:30'),
(140, 2, 4, 1, 14, 'Jl. Karya sehati no. 24', '3.530639, 98.671111', 'Start rabu batch 29', '-', 0, 1, '2020-11-02 01:22:22'),
(141, 2, 4, 1, 34, 'Total Fitcamp, Jl sei blutu No 101 Medan', '3.576048,98.645136', '-', '-', 0, 1, '2020-11-02 04:35:45'),
(142, 2, 4, 2, 35, 'Jl besar Tembung masuk Jl balai umum No 5 Tembung', '3.594485,98.747070', '-', '-', 0, 1, '2020-11-02 04:36:00'),
(144, 2, 4, 2, 14, 'Jl. Karya sehati no. 24', '3.530639, 98.671111', 'Start rabu batch 29', '-', 0, 1, '2020-11-02 21:20:54'),
(145, 2, 5, 1, 35, 'Jl besar Tembung masuk Jl balai umum No 5 Tembung', '3.594485,98.747070', '-', '-', 0, 1, '2020-11-03 16:51:42'),
(146, 2, 5, 2, 35, 'Jl besar Tembung masuk Jl balai umum No 5 Tembung', '3.594485,98.747070', '-', '-', 0, 1, '2020-11-03 16:52:18'),
(147, 2, 5, 1, 33, 'Jl. Kenanga sari No. 21 Pasar 6 Tj. Sari3', '3.561760,98.639896', '-', '-', 0, 1, '2020-11-03 16:53:18'),
(148, 2, 5, 1, 32, 'BCA JW MARIOT', '3.596293,98.675918', '-', '-', 0, 1, '2020-11-03 16:53:42'),
(149, 2, 5, 2, 31, 'Oyo medan city homestay / turki family spa jln dr mansyur no 81', '3.567458,98.647036', 'Rabu pause. HARUS SAMPE KE TANGANNYA SEBELUM 17.30', '-', 0, 1, '2020-11-03 16:54:17'),
(150, 2, 5, 1, 30, 'BCA Diponegoro', '3.584618,98.672817', '-', '-', 0, 1, '2020-11-03 16:54:51'),
(151, 2, 5, 1, 29, 'jl pasar 1 gg polonia no.88 (rumah putih ujung)', '3.558715,98.629152', '-', '-', 0, 1, '2020-11-03 16:55:15'),
(152, 2, 5, 2, 29, 'jl pasar 1 gg polonia no.88 (rumah putih ujung)', '3.558715,98.629152', '-', '-', 0, 1, '2020-11-03 16:55:31'),
(153, 2, 5, 1, 28, 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', '-', '-', 0, 1, '2020-11-03 16:55:46'),
(154, 2, 5, 2, 28, 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', '-', '-', 0, 1, '2020-11-03 16:55:57'),
(155, 2, 5, 1, 26, 'Jl. Tembakau Deli No 2N (Masuk di sbelah jalan Graha Merah Putih)', '3.592226,98.674562', '-', '-', 0, 1, '2020-11-03 16:56:18'),
(156, 2, 5, 1, 24, 'asia mega mas blok H no.1', '3.585245,98.703028', '-', '-', 0, 1, '2020-11-03 16:56:40'),
(157, 2, 5, 2, 24, 'asia mega mas blok H no.1', '3.585245,98.703028', '-', '-', 0, 1, '2020-11-03 16:56:56'),
(158, 2, 5, 2, 23, 'Komplek mutiara palace blok DD-33A', '3.610491,98.711592', '-', '-', 0, 1, '2020-11-03 16:57:15'),
(159, 2, 5, 1, 21, 'Alamat Pengiriman:jl flamboyan raya,kompleks taman asoka asri blok E no 21', '3.5487250, 98.6173930', '-', '-', 0, 1, '2020-11-03 16:57:33'),
(160, 2, 5, 2, 21, 'Alamat Pengiriman:jl flamboyan raya,kompleks taman asoka asri blok E no 21', '3.5487250, 98.6173930', '-', '-', 0, 1, '2020-11-03 16:57:48'),
(161, 2, 5, 1, 19, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', 'LUNCH titip satpam. Harus sampe sebelum 11.45 !!', '-', 0, 1, '2020-11-03 16:58:05'),
(162, 2, 5, 2, 20, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', '-', '-', 0, 1, '2020-11-03 16:58:20'),
(163, 2, 5, 1, 17, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '-', '-', 0, 1, '2020-11-03 16:58:38'),
(164, 2, 5, 2, 17, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '-', '-', 0, 1, '2020-11-03 16:58:50'),
(165, 2, 5, 1, 16, 'Jl. Emas no. 18/30, sei rengas II', '3.5847916, 98.6976904', '-', '-', 0, 1, '2020-11-03 16:59:05'),
(166, 2, 5, 1, 15, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-03 16:59:35'),
(167, 2, 5, 2, 15, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-03 16:59:50'),
(168, 2, 5, 2, 14, 'Jl. Karya sehati no. 24', '3.530639, 98.671111', '', '-', 0, 1, '2020-11-03 17:00:12'),
(170, 3, 1, 2, 52, 'Jl.M. Idris no 47', '3.596292,98.659113', 'Dinner sebelum jam 6. Intermitten fasting', '-', 0, 1, '2020-11-07 12:45:43'),
(171, 3, 1, 2, 51, 'Jl. Karya sehati no. 24. ', '3.530639, 98.671111', '', '-', 0, 1, '2020-11-07 12:45:59'),
(172, 3, 1, 1, 50, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus). ', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-07 12:46:13'),
(173, 3, 1, 2, 50, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus). ', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-07 12:46:22'),
(174, 3, 1, 1, 49, 'Jl. Karya Jaya No. 146. Latitude & Longitude	. ', '3.529349,98.676531', '', '-', 0, 1, '2020-11-07 12:46:32'),
(175, 3, 1, 2, 49, 'Jl. Karya Jaya No. 146. Latitude & Longitude	. ', '3.529349,98.676531', '', '-', 0, 1, '2020-11-07 12:46:42'),
(176, 3, 1, 1, 48, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam. Latitude & Longitude	. ', '3.584527,98.691058', 'LUNCH titip satpam. Harus sampe sebelum 11.45 !!. ', '-', 0, 1, '2020-11-07 12:46:56'),
(177, 3, 1, 2, 47, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri). ', '3.578560,98.688845', '', '-', 0, 1, '2020-11-07 12:47:08'),
(178, 3, 1, 2, 46, 'Komplek mutiara palace blok DD-33A. Latitude & Longitude	. ', '3.610491,98.711592', '', '-', 0, 1, '2020-11-07 12:47:28'),
(179, 3, 1, 1, 45, 'Asia mega mas blok H no.1', '3.585245,98.703028', '', '-', 0, 1, '2020-11-07 12:47:42'),
(180, 3, 1, 2, 45, 'Asia mega mas blok H no.1', '3.585245,98.703028', '', '-', 0, 1, '2020-11-07 12:47:51'),
(181, 3, 1, 1, 44, 'Jl. Tembakau Deli No 2N (Masuk di sbelah jalan Graha Merah Putih)	. ', '3.592226,98.674562', '', '-', 0, 1, '2020-11-07 12:47:59'),
(182, 3, 1, 1, 43, 'Jl. Raden Saleh Dalam No. 10. ', '3.589318,98.677325', '', '-', 0, 1, '2020-11-07 12:48:06'),
(183, 3, 1, 2, 43, 'Jl. Raden Saleh Dalam No. 10. ', '3.589318,98.677325', '', '-', 0, 1, '2020-11-07 12:48:21'),
(184, 3, 1, 2, 41, 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 'harus SAMPE TANGAN sebelum 17.30', '-', 0, 1, '2020-11-07 12:48:44'),
(185, 3, 1, 1, 40, 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', '', '-', 0, 1, '2020-11-07 12:48:58'),
(186, 3, 1, 1, 39, 'Jl. Kenangq sari No. 21 Pasae 6 Tj. Sari ', '3.561753,98.639911', '', '-', 0, 1, '2020-11-07 12:49:08'),
(187, 3, 1, 1, 38, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-07 12:49:18'),
(188, 3, 1, 2, 38, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-07 12:49:29'),
(189, 3, 1, 1, 37, 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', '-', '-', 0, 1, '2020-11-07 12:49:44'),
(193, 3, 2, 1, 52, 'Jl.M. Idris no 47', '3.596292,98.659113', 'Dinner sebelum jam 6. Intermitten fasting', '-', 0, 1, '2020-11-07 20:06:53'),
(194, 3, 2, 2, 52, 'Jl.M. Idris no 47', '3.596292,98.659113', 'Dinner sebelum jam 6. Intermitten fasting', '-', 0, 1, '2020-11-07 20:07:17'),
(195, 3, 2, 2, 51, 'Jl. Karya sehati no. 24. ', '3.530639, 98.671111', '', '-', 0, 1, '2020-11-07 20:08:02'),
(196, 3, 2, 1, 50, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus). ', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-07 20:08:41'),
(197, 3, 2, 2, 50, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus). ', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-07 20:08:59'),
(198, 3, 2, 1, 48, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam. Latitude & Longitude	. ', '3.584527,98.691058', 'LUNCH titip satpam. Harus sampe sebelum 11.45 !!. ', '-', 0, 1, '2020-11-07 20:09:29'),
(199, 3, 2, 2, 47, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri). ', '3.578560,98.688845', '', '-', 0, 1, '2020-11-07 20:09:46'),
(200, 3, 2, 2, 46, 'Komplek mutiara palace blok DD-33A. Latitude & Longitude	. ', '3.610491,98.711592', '', '-', 0, 1, '2020-11-07 20:10:15'),
(203, 3, 2, 1, 44, 'Jl. Tembakau Deli No 2N (Masuk di sbelah jalan Graha Merah Putih)	. ', '3.592226,98.674562', '', '-', 0, 1, '2020-11-07 20:11:41'),
(204, 3, 2, 1, 43, 'Jl. Raden Saleh Dalam No. 10. ', '3.589318,98.677325', '', '-', 0, 1, '2020-11-07 20:12:10'),
(205, 3, 2, 2, 43, 'Jl. Raden Saleh Dalam No. 10. ', '3.589318,98.677325', '', '-', 0, 1, '2020-11-07 20:12:35'),
(206, 3, 2, 2, 41, 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 'harus SAMPE TANGAN sebelum 17.30', '-', 0, 1, '2020-11-07 20:13:07'),
(207, 3, 2, 1, 40, 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', '', '-', 0, 1, '2020-11-07 20:31:46'),
(208, 3, 2, 1, 39, 'Jl. Kenangq sari No. 21 Pasae 6 Tj. Sari ', '3.561753,98.639911', '', '-', 0, 1, '2020-11-07 20:32:33'),
(211, 3, 2, 1, 37, 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', '-', '-', 0, 1, '2020-11-07 20:34:20'),
(212, 3, 2, 1, 49, 'Jl. Karya Jaya No. 146. Latitude & Longitude	. ', '3.529349,98.676531', '', '-', 0, 1, '2020-11-07 20:52:11'),
(213, 3, 2, 2, 49, 'Jl. Karya Jaya No. 146. Latitude & Longitude	. ', '3.529349,98.676531', '', '-', 0, 1, '2020-11-07 20:53:02'),
(214, 3, 2, 1, 38, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-07 21:11:46'),
(215, 3, 2, 2, 38, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-07 21:12:05'),
(216, 3, 3, 1, 52, 'Jl.M. Idris no 47', '3.596292,98.659113', 'Intermitten fasting', 'Dinner sebelum jam 6', 0, 1, '2020-11-08 17:15:23'),
(217, 3, 3, 1, 49, 'Jl. Karya Jaya No. 146. Latitude & Longitude	. ', '3.529349,98.676531', '-', '-', 0, 1, '2020-11-08 17:40:54'),
(218, 3, 3, 1, 48, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam. Latitude & Longitude	. ', '3.584527,98.691058', '-', 'LUNCH titip satpam. Harus sampe sebelum 11.45. ', 0, 1, '2020-11-08 17:42:23'),
(219, 3, 3, 1, 44, 'Jl. Tembakau Deli No 2N (Masuk di sbelah jalan Graha Merah Putih)	. ', '3.592226,98.674562', '', '-', 0, 1, '2020-11-08 17:44:38'),
(220, 3, 3, 1, 43, 'Jl. Raden Saleh Dalam No. 10. ', '3.589318,98.677325', '', '-', 0, 1, '2020-11-08 17:45:34'),
(221, 3, 3, 1, 50, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus). ', '3.544960, 98.651088', 'Ada MAAGH. Pengiriman Dinner sebelum jam 6 ', '-', 0, 1, '2020-11-08 18:09:10'),
(222, 3, 3, 1, 39, 'Jl. Kenangq sari No. 21 Pasae 6 Tj. Sari ', '3.561753,98.639911', '', '-', 0, 1, '2020-11-08 18:11:48'),
(223, 3, 3, 1, 40, 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', '', '-', 0, 1, '2020-11-08 18:12:36'),
(224, 3, 3, 1, 38, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 'Ada MAAGH. ', 'Pengiriman Dinner sebelum jam 6', 0, 1, '2020-11-08 20:06:10'),
(226, 3, 3, 2, 59, 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 'Skip tanggal 13,17,26 november. ', 'Harus SAMPE TANGAN sebelum 17.30.', 0, 1, '2020-11-08 20:24:26'),
(227, 3, 3, 2, 52, 'Jl.M. Idris no 47', '3.596292,98.659113', 'Intermitten fasting', 'Dinner sebelum jam 6', 0, 1, '2020-11-08 20:25:14'),
(229, 3, 3, 2, 50, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus). ', '3.544960, 98.651088', 'Ada MAAGH ', 'Dinner sebelum jam 6 ', 0, 1, '2020-11-08 20:26:53'),
(230, 3, 3, 2, 49, 'Jl. Karya Jaya No. 146. Latitude & Longitude	. ', '3.529349,98.676531', '', '-', 0, 1, '2020-11-08 20:27:33'),
(232, 3, 3, 2, 46, 'Komplek mutiara palace blok DD-33A. Latitude & Longitude	. ', '3.610491,98.711592', '', '-', 0, 1, '2020-11-08 20:28:51'),
(233, 3, 3, 2, 43, 'Jl. Raden Saleh Dalam No. 10. ', '3.589318,98.677325', '', '-', 0, 1, '2020-11-08 20:29:37'),
(234, 3, 3, 2, 38, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 'Ada MAAGH ', 'Dinner sebelum jam 6 ', 0, 1, '2020-11-08 20:30:40'),
(235, 3, 3, 2, 47, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri). ', '3.578560,98.688845', '', '-', 0, 1, '2020-11-08 20:38:50'),
(236, 3, 3, 1, 37, 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', '-', '-', 0, 1, '2020-11-08 20:40:41'),
(237, 3, 4, 1, 52, 'Jl.M. Idris no 47', '3.596292,98.659113', 'Dinner sebelum jam 6. Intermitten fasting', '-', 0, 1, '2020-11-08 22:33:42'),
(238, 3, 4, 1, 50, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-08 22:34:28'),
(239, 3, 4, 1, 49, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-08 22:35:13'),
(240, 3, 4, 1, 48, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', '', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 0, 1, '2020-11-08 22:35:55'),
(241, 3, 4, 1, 44, 'Jl. Tembakau Deli No 2N (Masuk di sbelah jalan Graha Merah Putih)', '3.592226,98.674562', '', '-', 0, 1, '2020-11-08 22:36:31'),
(242, 3, 4, 1, 43, 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-08 22:37:25'),
(243, 3, 4, 1, 40, 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', '', '-', 0, 1, '2020-11-08 22:37:59'),
(244, 3, 4, 1, 39, 'Jl. Kenangq sari No. 21 Pasae 6 Tj. Sari ', '3.561753,98.639911', '', '-', 0, 1, '2020-11-08 22:38:32'),
(245, 3, 4, 1, 38, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-08 22:39:04'),
(246, 3, 4, 1, 37, 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', '-', '-', 0, 1, '2020-11-08 22:41:05'),
(247, 3, 4, 2, 59, 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 'Skip tanggal 13,17,26 november. Harus SAMPE TANGAN sebelum 17.30.', '-', 0, 1, '2020-11-08 22:42:38'),
(248, 3, 4, 2, 52, 'Jl.M. Idris no 47', '3.596292,98.659113', 'Dinner sebelum jam 6. Intermitten fasting', '-', 0, 1, '2020-11-08 22:43:15'),
(249, 3, 4, 2, 50, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-08 22:44:11'),
(250, 3, 4, 2, 49, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-08 22:44:53'),
(251, 3, 4, 2, 47, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', '', '-', 0, 1, '2020-11-08 22:45:17'),
(252, 3, 4, 2, 46, 'Komplek mutiara palace blok DD-33A', '3.610491,98.711592', '', '-', 0, 1, '2020-11-08 22:45:52'),
(253, 3, 4, 2, 43, 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-08 22:46:29'),
(254, 3, 4, 2, 38, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-08 22:46:53'),
(255, 3, 5, 1, 52, 'Jl.M. Idris no 47', '3.596292,98.659113', 'Dinner sebelum jam 6. Intermitten fasting', '-', 0, 1, '2020-11-10 01:07:05'),
(256, 3, 5, 1, 50, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-10 01:07:50'),
(257, 3, 5, 1, 49, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-10 01:08:41'),
(258, 3, 5, 1, 48, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', '', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 0, 1, '2020-11-10 01:10:07'),
(259, 3, 5, 1, 44, 'Jl. Tembakau Deli No 2N (Masuk di sbelah jalan Graha Merah Putih)', '3.592226,98.674562', '', '-', 0, 1, '2020-11-10 01:11:27'),
(260, 3, 5, 1, 43, 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-10 01:15:00'),
(261, 3, 5, 1, 40, 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', '', '-', 0, 1, '2020-11-10 01:15:42'),
(263, 3, 5, 1, 38, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-10 01:16:31'),
(264, 3, 5, 1, 37, 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', '-', '-', 0, 1, '2020-11-10 01:17:06'),
(265, 3, 5, 2, 52, 'Jl.M. Idris no 47', '3.596292,98.659113', 'Intermitten fasting', '-sebelum jam 6. ', 0, 1, '2020-11-10 01:40:49'),
(266, 3, 5, 2, 50, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH ', '-sebelum jam 6 ', 0, 1, '2020-11-10 01:42:16'),
(267, 3, 5, 2, 49, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-10 01:42:56'),
(268, 3, 5, 2, 47, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', '', '-', 0, 1, '2020-11-10 02:07:22'),
(269, 3, 5, 2, 46, 'Komplek mutiara palace blok DD-33A', '3.610491,98.711592', '', '-', 0, 1, '2020-11-10 02:08:20'),
(270, 3, 5, 2, 43, 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-10 02:08:59'),
(271, 3, 5, 2, 38, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-10 02:09:42'),
(272, 3, 4, 1, 64, 'Jalan pukat banting 5 no 11b', '3.594644,98.712990', '', '', 0, 1, '2020-11-10 03:03:04'),
(273, 3, 5, 1, 64, 'Jalan pukat banting 5 no 11b', '3.594644,98.712990', '', '', 0, 1, '2020-11-10 03:03:37'),
(274, 4, 1, 1, 79, 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', '-', '-', 0, 1, '2020-11-12 04:30:21'),
(275, 4, 1, 1, 77, 'Jl. Tembakau Deli No 2N (Masuk di sbelah jalan Graha Merah Putih)', '3.592226,98.674562', '', '-', 0, 1, '2020-11-12 04:30:39'),
(276, 4, 1, 1, 73, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', '', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 0, 1, '2020-11-12 04:30:57'),
(277, 4, 1, 1, 70, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-12 04:31:28'),
(278, 4, 1, 1, 65, 'Jalan pukat banting 5 no 11b', '3.594644,98.712990', '', '', 0, 1, '2020-11-12 04:32:04'),
(279, 4, 1, 2, 75, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', '', '-', 0, 1, '2020-11-12 04:32:25'),
(280, 4, 1, 2, 70, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-12 04:32:38'),
(281, 4, 1, 2, 66, 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 'Skip tanggal 13,17,26 november.', '-Harus SAMPE TANGAN sebelum 17.30.', 0, 1, '2020-11-12 04:33:06'),
(282, 4, 2, 1, 79, 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', '-', '-', 0, 1, '2020-11-12 04:33:51'),
(283, 4, 2, 1, 77, 'Jl. Tembakau Deli No 2N (Masuk di sbelah jalan Graha Merah Putih)', '3.592226,98.674562', '', '-', 0, 1, '2020-11-12 04:34:06'),
(284, 4, 2, 1, 73, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', '', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 0, 1, '2020-11-12 04:34:24'),
(285, 4, 2, 1, 70, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-12 04:34:41'),
(286, 4, 2, 1, 65, 'Jalan pukat banting 5 no 11b', '3.594644,98.712990', '', '', 0, 1, '2020-11-12 04:34:54'),
(287, 4, 2, 2, 75, 'Jl puri gg.K amaliun No.28/59B ', '3.578560,98.688845', '', '-', 0, 1, '2020-11-12 04:35:16'),
(288, 4, 2, 2, 70, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-12 04:35:41'),
(289, 4, 3, 1, 79, 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', '-', '-', 0, 1, '2020-11-12 04:36:47'),
(290, 4, 3, 1, 77, 'Jl. Tembakau Deli No 2N (Masuk di sbelah jalan Graha Merah Putih)', '3.592226,98.674562', '', '-', 0, 1, '2020-11-12 04:37:13'),
(291, 4, 3, 1, 73, 'jl Raden saleh dalam No.10', '3.589318,98.677325', '', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 0, 1, '2020-11-12 04:37:35'),
(292, 4, 3, 1, 70, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-12 04:37:53'),
(293, 4, 3, 1, 65, 'Jalan pukat banting 5 no 11b', '3.594644,98.712990', '', '', 0, 1, '2020-11-12 04:38:12'),
(294, 4, 3, 2, 75, 'Jl Raden saleh dalam No.10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-12 04:38:45'),
(295, 4, 3, 2, 70, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-12 04:39:01'),
(296, 4, 3, 2, 66, 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 'Skip tanggal 13,17,26 november.', '-Harus SAMPE TANGAN sebelum 17.30.', 0, 1, '2020-11-12 04:39:26'),
(297, 4, 1, 1, 82, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-12 10:30:35'),
(298, 4, 1, 2, 82, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-12 10:30:52'),
(299, 4, 2, 1, 82, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-12 10:31:06'),
(300, 4, 2, 2, 82, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-12 10:31:19'),
(301, 4, 3, 1, 82, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-12 10:31:37'),
(303, 4, 3, 2, 82, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-12 10:32:15'),
(304, 4, 1, 1, 83, 'JL flamboyan kompek cemara asrino.45 masuk dari bank OCBC', '3.633560,98.696976', '', 'Di samping Wie Wie Louhan', 0, 1, '2020-11-14 05:12:06'),
(305, 4, 1, 1, 84, 'Jl danau singkarak no.6 ', '3.604243,98.657713', '', 'Di depan walton school pintu abu abu', 0, 1, '2020-11-14 05:12:39'),
(306, 4, 1, 1, 87, 'Jl. Kenangq sari No. 21 Pasae 6 Tj. Sari ', '3.561753,98.639911', '', '-', 0, 1, '2020-11-14 05:21:03'),
(308, 4, 1, 1, 86, 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', '', '-', 0, 1, '2020-11-14 05:35:35'),
(309, 4, 1, 1, 88, 'Jl.pembangunan usu no.12', '3.5666580,98.6522182', '', '', 0, 1, '2020-11-14 07:03:59'),
(310, 4, 1, 1, 89, 'Jl suka baru no.18,padang bulan selayang 1', '3.5686427,98.6507564', '', 'Rumah kos tentrem', 0, 1, '2020-11-14 07:04:09'),
(311, 4, 1, 1, 90, 'Jl pembangunan no 12', '3.5666580,98.6522182', '', '', 0, 1, '2020-11-14 07:04:20'),
(312, 4, 1, 1, 91, 'Jl bakti indah III no.217 komplek tata alam asri', '3.607983,98.620612', '', '', 0, 1, '2020-11-14 07:52:05'),
(313, 4, 1, 1, 92, 'Jl sidodadi komplek johor Regency Blok B no,1', '3.508880,98.665949', 'No ikan air tawar', '', 0, 1, '2020-11-14 07:52:42'),
(314, 4, 1, 1, 93, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-14 08:00:39'),
(315, 4, 1, 2, 93, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-14 08:00:57'),
(316, 4, 1, 1, 94, 'jl pasar baru no 43 padang bulan', '3.552058,98.654967', '', '', 0, 1, '2020-11-14 10:26:49'),
(317, 4, 1, 2, 94, 'jl pasar baru no 43 padang bulan', '3.552058,98.654967', '', '', 0, 1, '2020-11-14 10:27:10'),
(318, 4, 2, 1, 94, 'jl pasar baru no 43 padang bulan', '3.552058,98.654967', '', '', 0, 1, '2020-11-14 10:27:31'),
(319, 4, 2, 2, 94, 'jl pasar baru no 43 padang bulan', '3.552058,98.654967', '', '', 0, 1, '2020-11-14 10:27:57'),
(326, 4, 1, 1, 96, '', '3.589318,98.677325', '', '-', 0, 1, '2020-11-14 11:29:32'),
(327, 4, 1, 1, 95, 'Jl.M. Idris no 47', '3.596292,98.659113', 'Dinner sebelum jam 6. Intermitten fasting', 'Mohon diterima penbayaran cash ke pengantar', 0, 1, '2020-11-14 11:29:46'),
(328, 4, 1, 2, 96, '', '3.589318,98.677325', '', '-', 0, 1, '2020-11-14 11:30:02'),
(329, 4, 1, 2, 95, 'Jl.M. Idris no 47', '3.596292,98.659113', 'Dinner sebelum jam 6. Intermitten fasting', '', 0, 1, '2020-11-14 11:30:17'),
(330, 4, 4, 1, 93, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-14 11:48:15'),
(331, 4, 2, 1, 83, 'JL flamboyan kompek cemara asrino.45 masuk dari bank OCBC', '3.633560,98.696976', '', 'Di samping Wie Wie Louhan', 0, 1, '2020-11-15 00:04:37'),
(332, 4, 2, 1, 84, 'Jl danau singkarak no.6 ', '3.604243,98.657713', '', 'Di depan walton school pintu abu abu', 0, 1, '2020-11-15 00:05:01'),
(333, 4, 2, 1, 85, 'Jl.dagan no.5B/6A Belakang plaza medan fair', '3.593269,98.666074', '', '', 0, 1, '2020-11-15 00:05:56'),
(334, 4, 2, 1, 86, 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', '', '-', 0, 1, '2020-11-15 00:06:14'),
(335, 4, 2, 1, 87, 'Jl. Kenangq sari No. 21 Pasae 6 Tj. Sari ', '3.561753,98.639911', '', '-', 0, 1, '2020-11-15 00:07:01'),
(336, 4, 2, 1, 88, 'Jl.pembangunan usu no.12', '3.5666580,98.6522182', '', '', 0, 1, '2020-11-15 00:07:21'),
(337, 4, 2, 1, 89, 'Jl suka baru no.18,padang bulan selayang 1', '3.5686427,98.6507564', '', 'Rumah kos tentrem', 0, 1, '2020-11-15 00:07:44'),
(338, 4, 2, 1, 90, 'Jl pembangunan no 12', '3.5666580,98.6522182', '', '', 0, 1, '2020-11-15 00:08:07'),
(339, 4, 2, 1, 91, 'Jl bakti indah III no.217 komplek tata alam asri', '3.607983,98.620612', '', '', 0, 1, '2020-11-15 00:09:12'),
(340, 4, 2, 1, 92, 'Jl sidodadi komplek johor Regency Blok B no,1', '3.508880,98.665949', 'No ikan air tawar', '', 0, 1, '2020-11-15 00:09:39'),
(341, 4, 2, 1, 93, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-15 00:10:08'),
(342, 4, 2, 1, 95, 'Jl.M. Idris no 47', '3.596292,98.659113', 'Dinner sebelum jam 6. Intermitten fasting', 'Mohon diterima penbayaran cash ke pengantar', 0, 1, '2020-11-15 00:10:53'),
(343, 4, 2, 1, 96, 'Jl Raden saleh dalam No.10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-15 00:11:52'),
(344, 4, 2, 2, 93, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-15 00:15:00'),
(345, 4, 2, 2, 95, 'Jl.M. Idris no 47', '3.596292,98.659113', 'Dinner sebelum jam 6. Intermitten fasting', 'Mohon diterima penbayaran cash ke pengantar', 0, 1, '2020-11-15 00:16:50'),
(346, 4, 2, 2, 96, 'Jl Raden saleh dalam No.10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-15 00:17:18'),
(347, 4, 3, 2, 93, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-15 00:31:41'),
(348, 4, 3, 2, 95, 'Jl.M. Idris no 47', '3.596292,98.659113', 'Dinner sebelum jam 6. Intermitten fasting', 'Mohon diterima penbayaran cash ke pengantar', 0, 1, '2020-11-15 00:34:42'),
(349, 4, 3, 2, 96, 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-15 00:35:08'),
(350, 4, 3, 1, 83, 'JL flamboyan kompek cemara asrino.45 masuk dari bank OCBC', '3.633560,98.696976', '', 'Di samping Wie Wie Louhan', 0, 1, '2020-11-15 00:40:44'),
(351, 4, 3, 1, 84, 'Bank bca cabang diponegoro jl diponegoro', '3.584021,98.673261', '', 'dari pintu keluar zainul arifin titip sama satpam yg di tangga', 0, 1, '2020-11-15 00:41:10'),
(352, 4, 3, 1, 85, 'Jl.dagan no.5B/6A Belakang plaza medan fair', '3.593269,98.666074', '', '', 0, 1, '2020-11-15 00:41:56'),
(353, 4, 3, 1, 86, 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', '', '-', 0, 1, '2020-11-15 00:43:02'),
(354, 4, 3, 1, 87, 'Jl. Kenangq sari No. 21 Pasae 6 Tj. Sari ', '3.561753,98.639911', '', '-', 0, 1, '2020-11-15 00:43:57'),
(355, 4, 3, 1, 88, 'Jl.pembangunan usu no.12', '3.5666580,98.6522182', '', '', 0, 1, '2020-11-15 00:46:12'),
(356, 4, 3, 1, 89, 'Jl suka baru no.18,padang bulan selayang 1', '3.5686427,98.6507564', '', 'Rumah kos tentrem telfon atau chat orang nya setelah menitipkan makanan di satpam', 0, 1, '2020-11-15 00:46:35'),
(357, 4, 3, 1, 90, 'Jl pembangunan no 12', '3.5666580,98.6522182', '', '', 0, 1, '2020-11-15 00:47:10'),
(358, 4, 3, 1, 91, 'Jl bakti indah III no.217 komplek tata alam asri', '3.607983,98.620612', '', '', 0, 1, '2020-11-15 00:47:45'),
(359, 4, 3, 1, 92, 'Jl sidodadi komplek johor Regency Blok B no,1', '3.508880,98.665949', 'No ikan air tawar', '', 0, 1, '2020-11-15 00:48:37'),
(360, 4, 3, 1, 93, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-15 00:49:04'),
(361, 4, 3, 1, 95, 'Jl.M. Idris no 47', '3.596292,98.659113', 'Dinner sebelum jam 6. Intermitten fasting', 'Mohon diterima penbayaran cash ke pengantar', 0, 1, '2020-11-15 00:50:11'),
(362, 4, 3, 1, 96, 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-15 00:50:33'),
(364, 4, 4, 1, 70, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-15 00:53:51'),
(365, 4, 4, 1, 73, 'Jl Raden saleh dalam No.10', '3.589318,98.677325', '', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 0, 1, '2020-11-15 00:54:29'),
(366, 4, 4, 1, 77, 'Jl. Tembakau Deli No 2N (Masuk di sbelah jalan Graha Merah Putih)', '3.592226,98.674562', '', '-', 0, 1, '2020-11-15 00:54:50'),
(367, 4, 4, 1, 79, 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', '-', '-', 0, 1, '2020-11-15 00:55:31'),
(368, 4, 4, 1, 82, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-15 00:55:52'),
(369, 4, 4, 1, 83, 'JL flamboyan kompek cemara asrino.45 masuk dari bank OCBC', '3.633560,98.696976', '', 'Di samping Wie Wie Louhan', 0, 1, '2020-11-15 00:56:17'),
(370, 4, 4, 1, 84, 'Bank bca cabang diponegoro jl diponegoro', '3.584021,98.673261', '', 'Dari pintu keluar zainul atifin nanti titip di satpam yg ada di tangga', 0, 1, '2020-11-15 00:56:39'),
(371, 4, 4, 1, 85, 'Jl.dagan no.5B/6A Belakang plaza medan fair', '3.593269,98.666074', '', '', 0, 1, '2020-11-15 00:56:58'),
(372, 4, 4, 1, 86, 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', '', '-', 0, 1, '2020-11-15 00:57:22'),
(373, 4, 4, 1, 87, 'Jl. Kenangq sari No. 21 Pasae 6 Tj. Sari ', '3.561753,98.639911', '', '-', 0, 1, '2020-11-15 00:58:01'),
(374, 4, 4, 1, 88, 'Jl.pembangunan usu no.12', '3.5666580,98.6522182', '', '', 0, 1, '2020-11-15 00:58:20'),
(375, 4, 4, 1, 89, 'Jl suka baru no.18,padang bulan selayang 1', '3.5686427,98.6507564', '', 'Rumah kos tentrem telfon atau chat orang nya setelah menitipkan makanannya di satpam', 0, 1, '2020-11-15 00:58:38'),
(376, 4, 4, 1, 90, 'Jl pembangunan no 12', '3.5666580,98.6522182', '', '', 0, 1, '2020-11-15 00:58:59'),
(377, 4, 4, 1, 91, 'Jl bakti indah III no.217 komplek tata alam asri', '3.607983,98.620612', '', '', 0, 1, '2020-11-15 00:59:18'),
(378, 4, 4, 1, 92, 'Jl sidodadi komplek johor Regency Blok B no,1', '3.508880,98.665949', 'No ikan air tawar', '', 0, 1, '2020-11-15 00:59:54'),
(379, 4, 4, 1, 95, 'Jl.M. Idris no 47', '3.596292,98.659113', 'Dinner sebelum jam 6. Intermitten fasting', 'Mohon diterima penbayaran cash ke pengantar', 0, 1, '2020-11-15 01:00:11'),
(380, 4, 4, 1, 96, 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-15 01:01:02'),
(381, 4, 4, 2, 66, 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 'Skip tanggal 13,17,26 november.', '-Harus SAMPE TANGAN sebelum 17.30.', 0, 1, '2020-11-15 01:02:56'),
(382, 4, 4, 2, 70, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-15 01:03:20'),
(383, 4, 4, 2, 75, 'Jl Raden saleh dalam No.10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-15 01:03:45'),
(384, 4, 4, 2, 82, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-15 01:04:08'),
(385, 4, 4, 2, 93, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-15 01:04:45'),
(386, 4, 4, 2, 96, 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-15 01:05:41'),
(387, 4, 4, 2, 95, 'Jl.M. Idris no 47', '3.596292,98.659113', 'Dinner sebelum jam 6. Intermitten fasting', 'Mohon diterima penbayaran cash ke pengantar', 0, 1, '2020-11-15 01:07:20'),
(388, 4, 5, 1, 70, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-15 01:10:27'),
(389, 4, 5, 1, 73, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', '', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 0, 1, '2020-11-15 01:10:47'),
(390, 4, 5, 1, 77, 'Jl. Tembakau Deli No 2N (Masuk di sbelah jalan Graha Merah Putih)', '3.592226,98.674562', '', '-', 0, 1, '2020-11-15 01:11:17'),
(391, 4, 5, 1, 79, 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', '-', '-', 0, 1, '2020-11-15 01:11:34'),
(392, 4, 5, 1, 82, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-15 01:11:58'),
(393, 4, 5, 1, 83, 'JL flamboyan kompek cemara asrino.45 masuk dari bank OCBC', '3.633560,98.696976', '', 'Di samping Wie Wie Louhan', 0, 1, '2020-11-15 01:12:28'),
(394, 4, 5, 1, 84, 'Bank bca cabang diponegoro jl diponegoro', '3.584021,98.673261', '', 'Dari pintu masuk keluar zainul arifin nanti titip di satpam yg di tangga', 0, 1, '2020-11-15 01:12:45'),
(395, 4, 5, 1, 85, 'Jl.dagan no.5B/6A Belakang plaza medan fair', '3.593269,98.666074', '', '', 0, 1, '2020-11-15 01:13:17'),
(396, 4, 5, 1, 86, 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', '', '-', 0, 1, '2020-11-15 01:13:40'),
(397, 4, 5, 1, 87, 'Jl. Kenangq sari No. 21 Pasae 6 Tj. Sari ', '3.561753,98.639911', '', '-', 0, 1, '2020-11-15 01:14:02'),
(398, 4, 5, 1, 88, 'Jl.pembangunan usu no.12', '3.5666580,98.6522182', '', '', 0, 1, '2020-11-15 01:14:24'),
(399, 4, 5, 1, 89, 'Jl suka baru no.18,padang bulan selayang 1', '3.5686427,98.6507564', '', 'Rumah kos tentrem telfon atau chat orang nya setelah menitipkan makanannya di satpam', 0, 1, '2020-11-15 01:14:48'),
(400, 4, 5, 1, 90, 'Jl pembangunan no 12', '3.5666580,98.6522182', '', '', 0, 1, '2020-11-15 01:15:19'),
(401, 4, 5, 1, 91, 'Jl bakti indah III no.217 komplek tata alam asri', '3.607983,98.620612', '', '', 0, 1, '2020-11-15 01:15:46'),
(402, 4, 5, 1, 92, 'Jl sidodadi komplek johor Regency Blok B no,1', '3.508880,98.665949', 'No ikan air tawar', '', 0, 1, '2020-11-15 01:16:13'),
(403, 4, 5, 1, 93, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-15 01:16:37'),
(404, 4, 5, 1, 95, 'Jl.M. Idris no 47', '3.596292,98.659113', 'Dinner sebelum jam 6. Intermitten fasting', '', 0, 1, '2020-11-15 01:17:19'),
(405, 4, 5, 1, 96, 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-15 01:18:12'),
(406, 4, 5, 2, 66, 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 'Skip tanggal 13,17,26 november.', '-Harus SAMPE TANGAN sebelum 17.30.', 0, 1, '2020-11-15 01:21:06'),
(407, 4, 5, 2, 70, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-15 01:21:34'),
(408, 4, 5, 2, 75, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', '', '-', 0, 1, '2020-11-15 01:21:54'),
(409, 4, 5, 2, 82, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.545025,98.651143', 'Ada MAAGH sebelum jam 6 Dinner', '-', 0, 1, '2020-11-15 01:22:11'),
(410, 4, 5, 2, 93, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-15 01:22:45'),
(411, 4, 5, 2, 95, 'Jl.M. Idris no 47', '3.596292,98.659113', 'Dinner sebelum jam 6. Intermitten fasting', '', 0, 1, '2020-11-15 01:23:24'),
(412, 4, 5, 2, 96, 'Jl. Raden Saleh Dalam No. 10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-15 01:23:40'),
(413, 4, 2, 1, 98, 'kompleks malibu indah blok H-36.', '3.550728,98.684386', '', '', 0, 1, '2020-11-15 05:22:33'),
(414, 4, 3, 1, 98, 'kompleks malibu indah blok H-36.', '3.550728,98.684386', '', '', 0, 1, '2020-11-15 05:22:57'),
(415, 4, 4, 1, 98, 'kompleks malibu indah blok H-36.', '3.550728,98.684386', '', '', 0, 1, '2020-11-15 05:23:37');
INSERT INTO `catering_order_detail` (`id`, `catering_order_batch_id`, `day_id`, `time_order`, `buyer_id`, `address`, `latlong`, `notes`, `driver_notes`, `is_out_of_range`, `is_active`, `created_time`) VALUES
(416, 4, 5, 1, 98, 'kompleks malibu indah blok H-36.', '3.550728,98.684386', '', '', 0, 1, '2020-11-15 05:24:55'),
(418, 4, 4, 1, 99, 'Jl sampali baru komplek sampali baru No.9J', '3.593723,98.698358', 'selang seling dari tanggan 19nov,24nov,26nov,1des,sampai 3des', '', 0, 1, '2020-11-16 05:42:42'),
(419, 4, 4, 1, 103, 'Jl persatuan,komplek surya regency 1 Blok c No.8', '3.612504,98.652852', '', 'Cantolin aja makanannya di pintu besi pagar.BUKAN PAGAR. Setelah itu  fotokan lalu chat beliau.GA BISA DITELEFON', 0, 1, '2020-11-17 00:49:08'),
(420, 4, 4, 2, 103, 'Jl persatuan,komplek surya regency 1 Blok c No.8', '3.612504,98.652852', '', 'Cantolin aja makanannya di pintu besi pagar.BUKAN PAGAR. Setelah itu  fotokan lalu chat beliau.GA BISA DITELEFON', 0, 1, '2020-11-17 00:49:34'),
(421, 4, 5, 1, 103, 'Jl persatuan,komplek surya regency 1 Blok c No.8', '3.612504,98.652852', '', 'Cantolin aja makanannya di pintu besi pagar.BUKAN PAGAR. Setelah itu  fotokan lalu chat beliau.GA BISA DITELEFON', 0, 1, '2020-11-17 00:50:50'),
(422, 4, 5, 2, 103, 'Jl persatuan,komplek surya regency 1 Blok c No.8', '3.612504,98.652852', '', 'Cantolin aja makanannya di pintu besi pagar.BUKAN PAGAR. Setelah itu  fotokan lalu chat beliau.GA BISA DITELEFON', 0, 1, '2020-11-17 00:51:07'),
(423, 5, 1, 1, 71, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-19 03:38:29'),
(424, 5, 1, 1, 74, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', '', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 0, 1, '2020-11-19 03:38:55'),
(425, 5, 1, 1, 78, 'Jl. Tembakau Deli No 2N (Masuk di sbelah jalan Graha Merah Putih)', '3.592226,98.674562', '', '-', 0, 1, '2020-11-19 03:41:12'),
(426, 5, 1, 1, 80, 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', '-', '-', 0, 1, '2020-11-19 03:41:37'),
(427, 5, 1, 1, 97, 'Jl Raden saleh dalam No.10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-19 03:42:01'),
(428, 5, 1, 1, 102, 'jl pasar baru no 43 padang bulan', '3.552058,98.654967', 'Skip rabu - jumat keluar kota. Ganti di batch 32 hari senin - rabu', '', 0, 1, '2020-11-19 03:43:14'),
(429, 5, 1, 1, 104, 'Jl persatuan,komplek surya regency 1 Blok c No.8', '3.612504,98.652852', '', 'Cantolin aja makanannya di pintu besi .BUKAN PAGAR. Setelah itu  fotokan lalu chat beliau.GA BISA DITELEFON', 0, 1, '2020-11-19 03:43:42'),
(430, 5, 1, 1, 107, 'Hotel danau toba', '3.582733,98.676319', '', '', 0, 1, '2020-11-19 03:45:39'),
(432, 5, 1, 2, 67, 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 'Skip tanggal 13,17,26 november.', '-Harus SAMPE TANGAN sebelum 17.30.', 0, 1, '2020-11-19 03:47:03'),
(433, 5, 1, 2, 104, 'Jl persatuan,komplek surya regency 1 Blok c No.8', '3.612504,98.652852', '', 'Cantolin aja makanannya di pintu besi.BUKAN PAGAR. Setelah itu  fotokan lalu chat beliau.GA BISA DITELEFON', 0, 1, '2020-11-19 03:47:23'),
(434, 5, 1, 2, 102, 'jl pasar baru no 43 padang bulan', '3.552058,98.654967', 'Skip rabu - jumat keluar kota. Ganti di batch 32 hari senin - rabu', '', 0, 1, '2020-11-19 03:47:36'),
(435, 5, 1, 2, 97, 'Jl.Raden saleh dalam No.10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-19 03:47:47'),
(436, 5, 1, 2, 76, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', '', '-', 0, 1, '2020-11-19 03:48:01'),
(437, 5, 1, 2, 71, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-19 03:48:16'),
(438, 5, 2, 1, 107, 'Jl persamaan Gg rahmat No.77 simpang limun', '3.551046,98.696498', '', '', 0, 1, '2020-11-19 03:48:58'),
(439, 5, 3, 1, 107, 'Jl persamaan Gg rahmat No.77 simpang limun', '3.551046,98.696498', '', '', 0, 1, '2020-11-19 03:49:10'),
(440, 5, 4, 1, 107, 'Jl persamaan Gg rahmat No.77 simpang limun', '3.551046,98.696498', '', '', 0, 1, '2020-11-19 03:49:21'),
(441, 5, 5, 1, 107, 'Jl persamaan Gg rahmat No.77 simpang limun', '3.551046,98.696498', '', '', 0, 1, '2020-11-19 03:49:37'),
(442, 5, 2, 1, 104, 'Jl persatuan,komplek surya regency 1 Blok c No.8', '3.612504,98.652852', '', 'Cantolin aja makanannya di pintu besi.BUKAN PAGAR. Setelah itu  fotokan lalu chat beliau.GA BISA DITELEFON', 0, 1, '2020-11-19 03:50:08'),
(443, 5, 2, 2, 104, 'Jl persatuan,komplek surya regency 1 Blok c No.8', '3.612504,98.652852', '', 'Cantolin aja makanannya di pintu besi.BUKAN PAGAR. Setelah itu  fotokan lalu chat beliau.GA BISA DITELEFON', 0, 1, '2020-11-19 03:50:20'),
(444, 5, 3, 1, 104, 'Jl persatuan,komplek surya regency 1 Blok c No.8', '3.612504,98.652852', '', 'Cantolin aja makanannya di pintu besi.BUKAN PAGAR. Setelah itu  fotokan lalu chat beliau.GA BISA DITELEFON', 0, 1, '2020-11-19 03:50:37'),
(445, 5, 3, 2, 104, 'Jl persatuan,komplek surya regency 1 Blok c No.8', '3.612504,98.652852', '', 'Cantolin aja makanannya di pintu besi.BUKAN PAGAR. Setelah itu  fotokan lalu chat beliau.GA BISA DITELEFON', 0, 1, '2020-11-19 03:50:51'),
(446, 5, 3, 1, 102, 'jl pasar baru no 43 padang bulan', '3.552058,98.654967', 'Skip rabu - jumat keluar kota. Ganti di batch 32 hari senin - rabu', '', 0, 1, '2020-11-19 03:51:40'),
(447, 5, 3, 2, 102, 'jl pasar baru no 43 padang bulan', '3.552058,98.654967', 'Skip rabu - jumat keluar kota. Ganti di batch 32 hari senin - rabu', '', 0, 1, '2020-11-19 03:51:52'),
(448, 5, 2, 1, 102, 'jl pasar baru no 43 padang bulan', '3.552058,98.654967', 'Skip rabu - jumat keluar kota. Ganti di batch 32 hari senin - rabu', '', 0, 1, '2020-11-19 03:52:14'),
(449, 5, 2, 2, 102, 'jl pasar baru no 43 padang bulan', '3.552058,98.654967', 'Skip rabu - jumat keluar kota. Ganti di batch 32 hari senin - rabu', '', 0, 1, '2020-11-19 03:52:25'),
(450, 5, 2, 1, 100, 'Jl sampali baru komplek sampali baru No.9J', '3.593723,98.698358', 'selang seling dari tanggan 19nov,24nov,26nov,1des,sampai 3des', '', 0, 1, '2020-11-19 03:53:36'),
(451, 5, 2, 1, 97, 'Jl.Raden saleh dalam No.10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-19 03:54:00'),
(452, 5, 2, 2, 97, 'Jl.Raden saleh dalam No.10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-19 03:54:12'),
(453, 5, 3, 1, 97, 'Jl.Raden saleh dalam No.10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-19 03:54:24'),
(454, 5, 3, 2, 97, 'Jl.Raden saleh dalam No.10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-19 03:54:39'),
(455, 5, 4, 1, 97, 'Jl.Raden saleh dalam No.10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-19 03:54:56'),
(456, 5, 4, 2, 97, 'Jl.Raden saleh dalam No.10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-19 03:55:07'),
(457, 5, 5, 1, 97, 'Jl. Raden saleh dalam No.10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-19 03:55:18'),
(458, 5, 5, 2, 97, 'Jl.Raden saleh dalam No.10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-19 03:55:28'),
(459, 5, 2, 1, 80, 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', '-', '-', 0, 1, '2020-11-19 03:56:12'),
(460, 5, 3, 1, 80, 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', '-', '-', 0, 1, '2020-11-19 03:56:43'),
(461, 5, 4, 1, 80, 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', '-', '-', 0, 1, '2020-11-19 03:57:15'),
(462, 5, 5, 1, 80, 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', '-', '-', 0, 1, '2020-11-19 03:57:30'),
(463, 5, 2, 1, 78, 'Jl. Tembakau Deli No 2N (Masuk di sbelah jalan Graha Merah Putih)', '3.592226,98.674562', '', '-', 0, 1, '2020-11-19 03:57:49'),
(464, 5, 2, 1, 74, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', '', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 0, 1, '2020-11-19 03:58:40'),
(465, 5, 2, 2, 76, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', '', '-', 0, 1, '2020-11-19 03:58:53'),
(466, 5, 3, 1, 74, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', '', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 0, 1, '2020-11-19 03:59:07'),
(467, 5, 3, 2, 76, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', '', '-', 0, 1, '2020-11-19 03:59:20'),
(468, 5, 4, 1, 74, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', '', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 0, 1, '2020-11-19 03:59:34'),
(469, 5, 4, 2, 76, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', '', '-', 0, 1, '2020-11-19 03:59:51'),
(470, 5, 5, 1, 74, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', '', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 0, 1, '2020-11-19 04:00:05'),
(471, 5, 5, 2, 76, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', '', '-', 0, 1, '2020-11-19 04:00:15'),
(472, 5, 5, 1, 71, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-19 04:00:49'),
(473, 5, 5, 2, 71, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-19 04:01:02'),
(474, 5, 4, 1, 71, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-19 04:01:15'),
(475, 5, 4, 2, 71, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-19 04:01:28'),
(476, 5, 3, 1, 71, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-19 04:01:46'),
(477, 5, 3, 2, 71, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-19 04:02:03'),
(478, 5, 2, 1, 71, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-19 04:02:19'),
(479, 5, 2, 2, 71, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-19 04:02:40'),
(481, 5, 5, 2, 67, 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 'Skip tanggal 13,17,26 november.', '-Harus SAMPE TANGAN sebelum 17.30.', 0, 1, '2020-11-19 04:04:05'),
(482, 5, 3, 2, 67, 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 'Skip tanggal 13,17,26 november.', '-Harus SAMPE TANGAN sebelum 17.30.', 0, 1, '2020-11-19 04:04:21'),
(483, 5, 2, 2, 67, 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 'Skip tanggal 13,17,26 november.', '-Harus SAMPE TANGAN sebelum 17.30.', 0, 1, '2020-11-19 04:04:37'),
(484, 5, 1, 1, 110, 'Jne Gatsu (sebelah GG harapan seberang Tomang elok)', '3.590999,98.641123', '', '', 0, 1, '2020-11-21 00:38:33'),
(485, 5, 2, 1, 110, 'Jne Gatsu (sebelah GG harapan seberang Tomang elok)', '3.590999,98.641123', '', '', 0, 1, '2020-11-21 00:39:24'),
(486, 5, 3, 1, 110, 'Jne Gatsu (sebelah GG harapan seberang Tomang elok)', '3.590999,98.641123', '', '', 0, 1, '2020-11-21 00:39:59'),
(487, 5, 4, 1, 110, 'Jne Gatsu (sebelah GG harapan seberang Tomang elok)', '3.590999,98.641123', '', '', 0, 1, '2020-11-21 00:40:34'),
(488, 5, 5, 1, 110, 'Jne Gatsu (sebelah GG harapan seberang Tomang elok)', '3.590999,98.641123', '', '', 0, 1, '2020-11-21 00:41:05'),
(489, 5, 1, 1, 111, 'Jl Bunga Ester No.93C Medan Selayang Pasar 6 Padang bulan', '3.544701,98.652720', '', '', 0, 1, '2020-11-21 02:48:44'),
(490, 5, 2, 1, 111, 'Jl Bunga Ester No.93C Medan Selayang Pasar 6 Padang bulan', '3.544701,98.652720', '', '', 0, 1, '2020-11-21 02:49:20'),
(491, 5, 3, 1, 111, 'Jl Bunga Ester No.93C Medan Selayang Pasar 6 Padang bulan', '3.544701,98.652720', '', '', 0, 1, '2020-11-21 02:49:58'),
(492, 5, 4, 1, 111, 'Jl Bunga Ester No.93C Medan Selayang Pasar 6 Padang bulan', '3.544701,98.652720', '', '', 0, 1, '2020-11-21 02:50:25'),
(493, 5, 5, 1, 111, 'Jl Bunga Ester No.93C Medan Selayang Pasar 6 Padang bulan', '3.544701,98.652720', '', '', 0, 1, '2020-11-21 02:50:59'),
(494, 5, 1, 1, 112, 'BCA Diponegoro', '3.584618,98.672817', '-', '-', 0, 1, '2020-11-21 03:24:31'),
(495, 5, 1, 1, 113, 'Jl besar Tembung masuk Jl balai umum No 5 Tembung', '3.594485,98.747070', '-', '-', 0, 1, '2020-11-21 03:25:00'),
(496, 5, 1, 2, 113, 'Jl besar Tembung masuk Jl balai umum No 5 Tembung', '3.594485,98.747070', '-', '-', 0, 1, '2020-11-21 03:25:14'),
(497, 5, 2, 1, 112, 'BCA Diponegoro', '3.584618,98.672817', '-', '-', 0, 1, '2020-11-21 03:25:34'),
(498, 5, 3, 1, 112, 'BCA Diponegoro', '3.584618,98.672817', '-', '-', 0, 1, '2020-11-21 03:26:36'),
(499, 5, 4, 1, 112, 'BCA Diponegoro', '3.584618,98.672817', '-', '-', 0, 1, '2020-11-21 03:27:02'),
(500, 5, 5, 1, 112, 'BCA Diponegoro', '3.584618,98.672817', '-', '-', 0, 1, '2020-11-21 03:27:48'),
(501, 5, 1, 1, 114, 'ZAP klinik Jl. Iskandar muda no 81 Medan . (Sebelah BRI AGRO). ', '3.581344,98.661068', '', '', 0, 1, '2020-11-21 03:36:11'),
(502, 5, 2, 1, 114, 'ZAP klinik Jl. Iskandar muda no 81 Medan . (Sebelah BRI AGRO). ', '3.581344,98.661068', '', '', 0, 1, '2020-11-21 03:36:38'),
(503, 5, 3, 1, 114, 'ZAP klinik Jl. Iskandar muda no 81 Medan . (Sebelah BRI AGRO). ', '3.581344,98.661068', '', '', 0, 1, '2020-11-21 03:37:00'),
(504, 5, 4, 1, 114, 'ZAP klinik Jl. Iskandar muda no 81 Medan . (Sebelah BRI AGRO). ', '3.581344,98.661068', '', '', 0, 1, '2020-11-21 03:37:38'),
(505, 5, 5, 1, 114, 'jl sei padang no 60 medan', '3.570450,98.655250', '', '', 0, 1, '2020-11-21 03:38:18'),
(506, 5, 1, 1, 115, 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', '', '', 0, 1, '2020-11-21 05:33:12'),
(507, 5, 2, 1, 115, 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', '', '', 0, 1, '2020-11-21 05:33:27'),
(508, 5, 3, 1, 115, 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', '', '', 0, 1, '2020-11-21 05:33:53'),
(509, 5, 4, 1, 115, 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', '', '', 0, 1, '2020-11-21 05:34:23'),
(510, 5, 5, 1, 115, 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', '', '', 0, 1, '2020-11-21 05:35:09'),
(511, 5, 1, 1, 117, 'Jl Flamboyan komplek cemara asri No.45 masuk dari bank OCBC', '3.633560,98.696976', '', 'disamping Wie Wie louhan', 0, 1, '2020-11-21 10:17:18'),
(512, 5, 1, 1, 116, 'Jl Karya jaya gg eka pribadi', '3.518387,98.676233', '', '', 0, 1, '2020-11-21 10:18:22'),
(513, 5, 1, 1, 119, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', 'LUNCH 1 DINNER 2', '-', 0, 1, '2020-11-21 10:38:03'),
(514, 5, 1, 2, 119, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', 'LUNCH 1 DINNER 2', '-', 0, 1, '2020-11-21 10:38:18'),
(515, 5, 2, 1, 119, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', 'LUNCH 1 DINNER 2', '-', 0, 1, '2020-11-21 10:38:33'),
(516, 5, 2, 2, 119, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', 'LUNCH 1 DINNER 2', '-', 0, 1, '2020-11-21 10:38:57'),
(517, 5, 3, 1, 119, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', 'LUNCH 1 DINNER 2', '-', 0, 1, '2020-11-21 10:39:30'),
(518, 5, 3, 2, 119, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', 'LUNCH 1 DINNER 2', '-', 0, 1, '2020-11-21 10:39:55'),
(519, 5, 4, 1, 119, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', 'LUNCH 1 DINNER 2', '-', 0, 1, '2020-11-21 10:40:15'),
(520, 5, 4, 2, 119, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', 'LUNCH 1 DINNER 2', '-', 0, 1, '2020-11-21 10:40:36'),
(521, 5, 5, 2, 119, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', 'LUNCH 1 DINNER 2', '-', 0, 1, '2020-11-21 10:41:07'),
(522, 5, 5, 1, 119, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', 'LUNCH 1 DINNER 2', '-', 0, 1, '2020-11-21 10:41:37'),
(523, 5, 1, 1, 118, 'Jl. Kenangq sari No. 21 Pasae 6 Tj. Sari ', '3.561753,98.639911', '', '-', 0, 1, '2020-11-21 10:43:05'),
(524, 5, 2, 1, 118, 'Jl. Kenangq sari No. 21 Pasae 6 Tj. Sari ', '3.561753,98.639911', '', '-', 0, 1, '2020-11-21 10:46:36'),
(525, 5, 3, 1, 118, 'Jl. Kenangq sari No. 21 Pasae 6 Tj. Sari ', '3.561753,98.639911', '', '-', 0, 1, '2020-11-21 10:47:14'),
(526, 5, 4, 1, 118, 'Jl. Kenangq sari No. 21 Pasae 6 Tj. Sari ', '3.561753,98.639911', '', '-', 0, 1, '2020-11-21 10:47:57'),
(527, 5, 5, 1, 118, 'Jl. Kenangq sari No. 21 Pasae 6 Tj. Sari ', '3.561753,98.639911', '', '-', 0, 1, '2020-11-21 10:48:48'),
(528, 5, 1, 1, 120, 'Jl.Kereta Api Baru No.10B ; Kesawan ; Medan Barat', '3.589103,98.680338', '', 'Pengiriman lewat pintu belakang, masuk dari gang di samping rumah Jl.Perniagaan Baru no. 20C', 0, 1, '2020-11-21 11:16:06'),
(529, 5, 1, 2, 120, 'Jl.Kereta Api Baru No.10B ; Kesawan ; Medan Barat', '3.589103,98.680338', '', 'Pengiriman lewat pintu belakang, masuk dari gang di samping rumah Jl.Perniagaan Baru no. 20C', 0, 1, '2020-11-21 11:16:33'),
(530, 5, 2, 1, 120, 'Jl.Kereta Api Baru No.10B ; Kesawan ; Medan Barat', '3.589103,98.680338', '', 'Pengiriman lewat pintu belakang, masuk dari gang di samping rumah Jl.Perniagaan Baru no. 20C', 0, 1, '2020-11-21 11:16:52'),
(531, 5, 2, 2, 120, 'Jl.Kereta Api Baru No.10B ; Kesawan ; Medan Barat', '3.589103,98.680338', '', 'Pengiriman lewat pintu belakang, masuk dari gang di samping rumah Jl.Perniagaan Baru no. 20C', 0, 1, '2020-11-21 11:17:18'),
(532, 5, 3, 1, 120, 'Jl.Kereta Api Baru No.10B ; Kesawan ; Medan Barat', '3.589103,98.680338', '', 'Pengiriman lewat pintu belakang, masuk dari gang di samping rumah Jl.Perniagaan Baru no. 20C', 0, 1, '2020-11-21 11:18:00'),
(533, 5, 3, 2, 120, 'Jl.Kereta Api Baru No.10B ; Kesawan ; Medan Barat', '3.589103,98.680338', '', 'Pengiriman lewat pintu belakang, masuk dari gang di samping rumah Jl.Perniagaan Baru no. 20C', 0, 1, '2020-11-21 11:18:33'),
(534, 5, 4, 1, 120, 'Jl.Kereta Api Baru No.10B ; Kesawan ; Medan Barat', '3.589103,98.680338', '', 'Pengiriman lewat pintu belakang, masuk dari gang di samping rumah Jl.Perniagaan Baru no. 20C', 0, 1, '2020-11-21 11:18:55'),
(535, 5, 4, 2, 120, 'Jl.Kereta Api Baru No.10B ; Kesawan ; Medan Barat', '3.589103,98.680338', '', 'Pengiriman lewat pintu belakang, masuk dari gang di samping rumah Jl.Perniagaan Baru no. 20C', 0, 1, '2020-11-21 11:19:38'),
(536, 5, 5, 2, 120, 'Jl.Kereta Api Baru No.10B ; Kesawan ; Medan Barat', '3.589103,98.680338', '', 'Pengiriman lewat pintu belakang, masuk dari gang di samping rumah Jl.Perniagaan Baru no. 20C', 0, 1, '2020-11-21 11:20:00'),
(537, 5, 5, 1, 120, 'Jl.Kereta Api Baru No.10B ; Kesawan ; Medan Barat', '3.589103,98.680338', '', 'Pengiriman lewat pintu belakang, masuk dari gang di samping rumah Jl.Perniagaan Baru no. 20C', 0, 1, '2020-11-21 11:20:27'),
(538, 5, 1, 2, 121, 'JL. Mojopahit ujung No. 69 A (Depan Yona Cafe). Pagar htam yg ada ring basket . Medan 20153', '3.575552,98.665248', '', '(Depan Yona Cafe) Pagar htam yg ada ring basket ', 0, 1, '2020-11-21 11:31:31'),
(539, 5, 2, 2, 121, 'JL. Mojopahit ujung No. 69 A (Depan Yona Cafe). Pagar htam yg ada ring basket . Medan 20153', '3.575552,98.665248', '', '(Depan Yona Cafe) Pagar htam yg ada ring basket ', 0, 1, '2020-11-21 11:31:59'),
(540, 5, 3, 2, 121, 'JL. Mojopahit ujung No. 69 A (Depan Yona Cafe). Pagar htam yg ada ring basket . Medan 20153', '3.575552,98.665248', '', '(Depan Yona Cafe) Pagar htam yg ada ring basket ', 0, 1, '2020-11-21 11:32:24'),
(541, 5, 4, 2, 121, 'JL. Mojopahit ujung No. 69 A (Depan Yona Cafe). Pagar htam yg ada ring basket . Medan 20153', '3.575552,98.665248', '', '(Depan Yona Cafe) Pagar htam yg ada ring basket ', 0, 1, '2020-11-21 11:33:12'),
(542, 5, 5, 2, 121, 'JL. Mojopahit ujung No. 69 A (Depan Yona Cafe). Pagar htam yg ada ring basket . Medan 20153', '3.575552,98.665248', '', '(Depan Yona Cafe) Pagar htam yg ada ring basket ', 0, 1, '2020-11-21 11:33:28'),
(543, 5, 1, 1, 123, 'jl Bunga ester No.46d psr VI .bulan (rumahnya pas didepan greja katolik St.Fransiskus)', '3.545025,98.651143', 'ada MAAGH sebelum jam 6', '', 0, 1, '2020-11-21 11:45:05'),
(544, 5, 1, 2, 123, 'jl Bunga ester No.46d psr VI .bulan (rumahnya pas didepan greja katolik St.Fransiskus)', '3.545025,98.651143', 'ada MAAGH sebelum jam 6', '', 0, 1, '2020-11-21 11:45:20'),
(545, 5, 2, 1, 123, 'jl Bunga ester No.46d psr VI .bulan (rumahnya pas didepan greja katolik St.Fransiskus)', '3.545025,98.651143', 'ada MAAGH sebelum jam 6', '', 0, 1, '2020-11-21 11:46:20'),
(546, 5, 2, 2, 123, 'jl Bunga ester No.46d psr VI .bulan (rumahnya pas didepan greja katolik St.Fransiskus)', '3.545025,98.651143', 'ada MAAGH sebelum jam 6', '', 0, 1, '2020-11-21 11:46:40'),
(547, 5, 5, 2, 123, 'jl Bunga ester No.46d psr VI .bulan (rumahnya pas didepan greja katolik St.Fransiskus)', '3.545025,98.651143', 'ada MAAGH sebelum jam 6', '', 0, 1, '2020-11-21 11:47:00'),
(548, 5, 5, 1, 123, 'jl Bunga ester No.46d psr VI .bulan (rumahnya pas didepan greja katolik St.Fransiskus)', '3.545025,98.651143', 'ada MAAGH sebelum jam 6', '', 0, 1, '2020-11-21 11:47:51'),
(549, 5, 4, 2, 123, 'jl Bunga ester No.46d psr VI .bulan (rumahnya pas didepan greja katolik St.Fransiskus)', '3.545025,98.651143', 'ada MAAGH sebelum jam 6', '', 0, 1, '2020-11-21 11:48:36'),
(550, 5, 4, 1, 123, 'jl Bunga ester No.46d psr VI .bulan (rumahnya pas didepan greja katolik St.Fransiskus)', '3.545025,98.651143', 'ada MAAGH sebelum jam 6', '', 0, 1, '2020-11-21 11:49:00'),
(551, 5, 3, 2, 123, 'jl Bunga ester No.46d psr VI .bulan (rumahnya pas didepan greja katolik St.Fransiskus)', '3.545025,98.651143', 'ada MAAGH sebelum jam 6', '', 0, 1, '2020-11-21 11:49:34'),
(552, 5, 3, 1, 123, 'jl Bunga ester No.46d psr VI .bulan (rumahnya pas didepan greja katolik St.Fransiskus)', '3.545025,98.651143', 'ada MAAGH sebelum jam 6', '', 0, 1, '2020-11-21 11:50:02'),
(556, 7, 1, 1, 124, 'jl. Eka surya gg. Sidodadi', '3.509716, 98.668250', 'TESTING', '-', 0, 1, '2020-11-22 04:57:42'),
(557, 7, 1, 1, 125, 'Jln Raden Saleh Dalam', '3.589318,98.677325', 'TESTING', '-', 0, 1, '2020-11-22 04:57:47'),
(558, 7, 1, 1, 126, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', 'TESTING', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 0, 1, '2020-11-22 04:57:53'),
(559, 5, 1, 2, 116, 'Jl Karya jaya gg eka pribadi', '3.518387,98.676233', '', '', 0, 1, '2020-11-22 08:47:24'),
(560, 5, 2, 2, 116, 'Jl Karya jaya gg eka pribadi', '3.518387,98.676233', '', '', 0, 1, '2020-11-22 09:01:47'),
(561, 5, 3, 2, 116, 'Jl Karya jaya gg eka pribadi', '3.518387,98.676233', '', '', 0, 1, '2020-11-22 09:02:14'),
(562, 5, 4, 2, 116, 'Jl Karya jaya gg eka pribadi', '3.518387,98.676233', '', '', 0, 1, '2020-11-22 09:03:15'),
(563, 5, 5, 2, 116, 'Jl Karya jaya gg eka pribadi', '3.518387,98.676233', '', '', 0, 1, '2020-11-22 09:03:56'),
(564, 5, 3, 1, 127, 'Komplek tasbi 2 blok 1 No.43', '3.567955,98.625770', '', '', 0, 1, '2020-11-23 09:37:34'),
(565, 5, 4, 1, 127, 'Komplek tasbi 2 blok 1 No.43', '3.567955,98.625770', '', '', 0, 1, '2020-11-23 09:38:18'),
(566, 5, 5, 1, 127, 'Komplek tasbi 2 blok 1 No.43', '3.567955,98.625770', '', '', 0, 1, '2020-11-23 09:39:10'),
(567, 5, 4, 1, 128, 'Perumahan Medan Resort City (Mercy) Rotterdam blok K06 kec.Deli Tua', '3.512107,98.675058', 'LUNCH 1 DINNER 2', '', 0, 1, '2020-11-24 17:26:55'),
(568, 5, 4, 2, 128, 'Perumahan Medan Resort City (Mercy) Rotterdam blok K06 kec.Deli Tua', '3.512107,98.675058', 'LUNCH 1 DINNER 2', '', 0, 1, '2020-11-24 17:27:24'),
(569, 5, 5, 1, 128, 'Perumahan Medan Resort City (Mercy) Rotterdam blok K06 kec.Deli Tua', '3.512107,98.675058', 'LUNCH 1 DINNER 2', '', 0, 1, '2020-11-24 17:28:42'),
(570, 5, 5, 2, 128, 'Perumahan Medan Resort City (Mercy) Rotterdam blok K06 kec.Deli Tua', '3.512107,98.675058', 'LUNCH 1 DINNER 2', '', 0, 1, '2020-11-24 17:29:07'),
(571, 5, 4, 1, 100, 'Jl sampali baru komplek sampali baru No.9J', '3.593723,98.698358', 'VEGETARIAN selang seling dari tanggan 19nov,24nov,26nov,1des,sampai 3des', '', 0, 1, '2020-11-25 00:46:30'),
(572, 6, 1, 1, 58, 'Jl raden saleh dalam No.10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-29 03:47:57'),
(573, 6, 1, 1, 72, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-29 03:48:32'),
(574, 6, 1, 1, 81, 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', '-', '-', 0, 1, '2020-11-29 03:48:50'),
(575, 6, 1, 1, 108, 'Jl persamaan Gg rahmat No.77 simpang limun', '3.551046,98.696498', '', '', 0, 1, '2020-11-29 03:49:54'),
(576, 6, 1, 1, 129, 'Perumahan Medan Resort City (Mercy) Rotterdam blok K06 kec.Deli Tua', '3.512107,98.675058', 'LUNCH 1 DINNER 2', '', 0, 1, '2020-11-29 03:50:26'),
(578, 6, 1, 1, 131, 'Tirta investama jl kapten soemarsono No 74', '3.615893,98.641688', '', '', 0, 1, '2020-11-29 03:51:38'),
(579, 6, 1, 1, 134, 'Jl. Menteng VII gg. Kesatria no. 20 Medan', '3.566334,98.725043', '', '', 0, 1, '2020-11-29 04:00:03'),
(580, 6, 1, 1, 135, 'ACC ADAM MALIK, Jalan adam malik no.28 (sebelah prudential dan yamaha)', '3.597241,98.66928', '', '', 0, 1, '2020-11-29 04:00:19'),
(581, 6, 1, 1, 136, 'Jl beringin 4 No.173 gaperta masuk dari samping doorsmear arwana', '3.606051,98.627375', 'Tidak bisa IKAN LAUT kecuali:udang dan dorry.Semua ikan tawar bisa', '', 0, 1, '2020-11-29 04:00:39'),
(582, 6, 1, 1, 137, 'Garuda indonesia jl mongonsidi No.34A depan hermes', '3.571363,98.666801', '', '', 0, 1, '2020-11-29 04:00:58'),
(583, 6, 1, 2, 122, 'JL. Mojopahit ujung No. 69 A (Depan Yona Cafe). Pagar htam yg ada ring basket. Medan 20153', '3.575552,98.665248', '', '(Depan Yona Cafe) Pagar htam yg ada ring basket ', 0, 1, '2020-11-29 04:06:59'),
(584, 6, 1, 2, 129, 'Perumahan Medan Resort City (Mercy) Rotterdam blok K06 kec.Deli Tua', '3.512107,98.675058', 'LUNCH 1 DINNER 2', '', 0, 1, '2020-11-29 04:07:19'),
(585, 6, 1, 2, 58, '', '3.589318,98.677325', '', '-', 0, 1, '2020-11-29 04:07:54'),
(586, 6, 1, 2, 68, 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 'Skip tanggal 13,17,26 november.', '-Harus SAMPE TANGAN sebelum 17.30.', 0, 1, '2020-11-29 04:08:30'),
(587, 6, 1, 2, 136, 'Jl beringin 4 No.173 gaperta masuk dari samping doorsmear arwana', '3.606051,98.627375', 'Tidak bisa IKAN LAUT kecuali:udang dan dorry.Semua ikan tawar bisa', '', 0, 1, '2020-11-29 04:08:46'),
(588, 6, 1, 2, 72, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-29 04:10:17'),
(589, 6, 1, 2, 130, 'Jl s parman no 217, cambridge apartemen tower picasso lantai 21. ( dari zainul arifin, pas sebelum tanjakan turun starbucks cambridge ada gerbang besi, drop off ke security sana saja )', '3.584218,98.667676', '', '( dari zainul arifin, pas sebelum tanjakan turun starbucks cambridge ada gerbang besi, drop off ke security sana saja )', 0, 1, '2020-11-29 04:10:36'),
(590, 6, 1, 2, 139, 'Jl raden saleh dalam No.10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-29 08:28:25'),
(591, 6, 1, 2, 143, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', '', '-', 0, 1, '2020-11-29 08:28:39'),
(592, 6, 1, 1, 141, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', '', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 0, 1, '2020-11-29 08:28:52'),
(593, 6, 1, 1, 139, 'Jl raden saleh dalam No.10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-29 08:31:50'),
(594, 6, 1, 1, 133, 'Jl Bintang No.1B/17(sederet RM samudra)', '3.594740,98.686869', 'Reques aglio olio', '', 0, 1, '2020-11-29 08:34:35'),
(596, 6, 1, 1, 138, 'Jl bendungan 3 No.9', '3.530354,98.739894', '', '', 0, 1, '2020-11-29 08:41:25'),
(597, 6, 1, 2, 133, 'Jl Bintang No.1B/17(sederet RM samudra)', '3.594740,98.686869', 'Reques aglio olio', '', 0, 1, '2020-11-29 08:46:07'),
(598, 6, 1, 1, 144, 'BCA Diponegoro', '3.584618,98.672817', '-', '-', 0, 1, '2020-11-29 08:48:11'),
(599, 6, 1, 1, 145, 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', '', '', 0, 1, '2020-11-29 09:02:08'),
(600, 6, 1, 1, 147, 'jl pasar 1 gg polonia no.88 (rumah putih ujung)', '3.558715,98.629152', '-', '-', 0, 1, '2020-11-29 10:31:33'),
(601, 6, 1, 1, 146, 'Aquilla Residence 9i-j, Jl. Garuda No.28, Sei Sikambing B', '3.588473,98.639954', '', '', 0, 1, '2020-11-29 10:31:46'),
(602, 6, 2, 1, 147, 'jl pasar 1 gg polonia no.88 (rumah putih ujung)', '3.558715,98.629152', '-', '-', 0, 1, '2020-11-29 23:15:15'),
(603, 6, 3, 1, 147, 'jl pasar 1 gg polonia no.88 (rumah putih ujung)', '3.558715,98.629152', '-', '-', 0, 1, '2020-11-29 23:16:41'),
(604, 6, 4, 1, 147, 'jl pasar 1 gg polonia no.88 (rumah putih ujung)', '3.558715,98.629152', '-', '-', 0, 1, '2020-11-29 23:17:05'),
(605, 6, 5, 1, 147, 'jl pasar 1 gg polonia no.88 (rumah putih ujung)', '3.558715,98.629152', '-', '-', 0, 1, '2020-11-29 23:17:54'),
(606, 6, 2, 1, 146, 'Aquilla Residence 9i-j, Jl. Garuda No.28, Sei Sikambing B', '3.588473,98.639954', '', '', 0, 1, '2020-11-29 23:18:42'),
(607, 6, 3, 1, 146, 'Aquilla Residence 9i-j, Jl. Garuda No.28, Sei Sikambing B', '3.588473,98.639954', '', '', 0, 1, '2020-11-29 23:19:05'),
(608, 6, 4, 1, 146, 'Aquilla Residence 9i-j, Jl. Garuda No.28, Sei Sikambing B', '3.588473,98.639954', '', '', 0, 1, '2020-11-29 23:19:32'),
(609, 6, 5, 1, 146, 'Aquilla Residence 9i-j, Jl. Garuda No.28, Sei Sikambing B', '3.588473,98.639954', '', '', 0, 1, '2020-11-29 23:19:57'),
(610, 6, 2, 1, 145, 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', '', '', 0, 1, '2020-11-29 23:20:41'),
(611, 6, 3, 1, 145, 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', '', '', 0, 1, '2020-11-29 23:20:56'),
(612, 6, 4, 1, 145, 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', '', '', 0, 1, '2020-11-29 23:21:23'),
(613, 6, 5, 1, 145, 'BCA B&G tower (JW Mariot)', '3.596149,98.675886', '', '', 0, 1, '2020-11-29 23:21:44'),
(614, 6, 2, 1, 144, 'BCA Diponegoro', '3.584618,98.672817', '-', '-', 0, 1, '2020-11-29 23:22:07'),
(615, 6, 3, 1, 144, 'BCA Diponegoro', '3.584618,98.672817', '-', '-', 0, 1, '2020-11-29 23:22:32'),
(616, 6, 4, 1, 144, 'BCA Diponegoro', '3.584618,98.672817', '-', '-', 0, 1, '2020-11-29 23:22:55'),
(617, 6, 5, 1, 144, 'BCA Diponegoro', '3.584618,98.672817', '-', '-', 0, 1, '2020-11-29 23:23:17'),
(618, 6, 2, 2, 143, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', '', '-', 0, 1, '2020-11-29 23:26:34'),
(619, 6, 3, 2, 143, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', '', '-', 0, 1, '2020-11-29 23:34:26'),
(620, 6, 4, 2, 143, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', '', '-', 0, 1, '2020-11-29 23:35:13'),
(621, 6, 5, 2, 143, '(Dinner) Jl. Puri Gg. K Alimun no 28/59B (masuk gang, mentok belok kiri)', '3.578560,98.688845', '', '-', 0, 1, '2020-11-29 23:35:30'),
(622, 6, 2, 1, 141, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', '', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 0, 1, '2020-11-29 23:36:29'),
(623, 6, 3, 1, 141, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', '', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 0, 1, '2020-11-29 23:37:19'),
(624, 6, 4, 1, 141, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', '', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 0, 1, '2020-11-29 23:37:46'),
(625, 6, 5, 1, 141, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', '', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 0, 1, '2020-11-29 23:38:22'),
(626, 6, 2, 1, 139, 'Jl raden saleh dalam No.10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-29 23:39:44'),
(627, 6, 3, 1, 139, 'Jl raden saleh dalam No.10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-29 23:40:09'),
(628, 6, 4, 1, 139, 'Jl raden saleh dalam No.10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-29 23:40:32'),
(629, 6, 5, 1, 139, 'Jl raden saleh dalam No.10', '3.589318,98.677325', '', '-', 0, 1, '2020-11-29 23:40:54'),
(634, 6, 2, 1, 137, 'Garuda indonesia jl mongonsidi No.34A depan hermes', '3.571363,98.666801', '', '', 0, 1, '2020-11-29 23:44:02'),
(635, 6, 3, 1, 137, 'Garuda indonesia jl mongonsidi No.34A depan hermes', '3.571363,98.666801', '', '', 0, 1, '2020-11-29 23:44:19'),
(636, 6, 4, 1, 137, 'Garuda indonesia jl mongonsidi No.34A depan hermes', '3.571363,98.666801', '', '', 0, 1, '2020-11-29 23:45:02'),
(637, 6, 5, 1, 137, 'Garuda indonesia jl mongonsidi No.34A depan hermes', '3.571363,98.666801', '', '', 0, 1, '2020-11-29 23:45:46'),
(638, 6, 5, 1, 136, 'Jl beringin 4 No.173 gaperta masuk dari samping doorsmear arwana', '3.606051,98.627375', '', '', 0, 1, '2020-11-29 23:46:17'),
(639, 6, 4, 1, 136, 'Jl beringin 4 No.173 gaperta masuk dari samping doorsmear arwana', '3.606051,98.627375', '', '', 0, 1, '2020-11-29 23:46:44'),
(640, 6, 3, 1, 136, 'Jl beringin 4 No.173 gaperta masuk dari samping doorsmear arwana', '3.606051,98.627375', '', '', 0, 1, '2020-11-29 23:52:28'),
(641, 6, 2, 1, 136, 'Jl beringin 4 No.173 gaperta masuk dari samping doorsmear arwana', '3.606051,98.627375', '', '', 0, 1, '2020-11-29 23:52:56'),
(642, 6, 2, 1, 135, 'ACC ADAM MALIK, Jalan adam malik no.28 (sebelah prudential dan yamaha)', '3.597241,98.66928', '', '', 0, 1, '2020-11-29 23:53:40'),
(643, 6, 2, 2, 136, 'Jl beringin 4 No.173 gaperta masuk dari samping doorsmear arwana', '3.606051,98.627375', '', '', 0, 1, '2020-11-29 23:54:00'),
(644, 6, 3, 2, 136, 'Jl beringin 4 No.173 gaperta masuk dari samping doorsmear arwana', '3.606051,98.627375', '', '', 0, 1, '2020-11-29 23:54:23'),
(645, 6, 4, 2, 136, 'Jl beringin 4 No.173 gaperta masuk dari samping doorsmear arwana', '3.606051,98.627375', '', '', 0, 1, '2020-11-29 23:54:42'),
(646, 6, 5, 2, 136, 'Jl beringin 4 No.173 gaperta masuk dari samping doorsmear arwana', '3.606051,98.627375', '', '', 0, 1, '2020-11-29 23:55:03'),
(647, 6, 3, 1, 135, 'ACC ADAM MALIK, Jalan adam malik no.28 (sebelah prudential dan yamaha)', '3.597241,98.66928', '', '', 0, 1, '2020-11-29 23:56:14'),
(648, 6, 4, 1, 135, 'ACC ADAM MALIK, Jalan adam malik no.28 (sebelah prudential dan yamaha)', '3.597241,98.66928', '', '', 0, 1, '2020-11-29 23:58:27'),
(649, 6, 5, 1, 135, 'ACC ADAM MALIK, Jalan adam malik no.28 (sebelah prudential dan yamaha)', '3.597241,98.66928', '', '', 0, 1, '2020-11-29 23:58:58'),
(650, 6, 5, 1, 134, 'Jl. Menteng VII gg. Kesatria no. 20 Medan', '3.566334,98.725043', '', '', 0, 1, '2020-11-30 00:00:01'),
(651, 6, 4, 1, 134, 'Jl. Menteng VII gg. Kesatria no. 20 Medan', '3.566334,98.725043', '', '', 0, 1, '2020-11-30 00:00:30'),
(652, 6, 3, 1, 134, 'Jl. Menteng VII gg. Kesatria no. 20 Medan', '3.566334,98.725043', '', '', 0, 1, '2020-11-30 00:01:00'),
(653, 6, 2, 1, 134, 'Jl. Menteng VII gg. Kesatria no. 20 Medan', '3.566334,98.725043', '', '', 0, 1, '2020-11-30 00:01:17'),
(654, 6, 5, 1, 133, 'Jl Bintang No.1B/17(sederet RM samudra)', '3.594740,98.686869', 'Reques aglio olio', '', 0, 1, '2020-11-30 00:01:59'),
(655, 6, 4, 1, 133, 'Jl Bintang No.1B/17(sederet RM samudra)', '3.594740,98.686869', 'Reques aglio olio', '', 0, 1, '2020-11-30 00:03:27'),
(656, 6, 3, 2, 133, 'Jl Bintang No.1B/17(sederet RM samudra)', '3.594740,98.686869', 'Reques aglio olio', '', 0, 1, '2020-11-30 00:19:13'),
(657, 6, 2, 1, 138, 'Polda sumut pintu 3', '3.530834,98.737646', '', '', 0, 1, '2020-11-30 00:30:03'),
(658, 6, 3, 1, 138, 'Polda sumut pintu 3', '3.530834,98.737646', '', '', 0, 1, '2020-11-30 00:31:03'),
(659, 6, 4, 1, 138, 'Polda sumut pintu 3', '3.530834,98.737646', '', '', 0, 1, '2020-11-30 00:31:51'),
(660, 6, 5, 1, 138, 'Polda sumut pintu 3', '3.530834,98.737646', '', '', 0, 1, '2020-11-30 00:32:19'),
(661, 6, 2, 1, 133, 'Jl Bintang No.1B/17(sederet RM samudra)', '3.594740,98.686869', 'Reques aglio olio', '', 0, 1, '2020-11-30 00:33:30'),
(663, 6, 3, 1, 133, 'Jl Bintang No.1B/17(sederet RM samudra)', '3.594740,98.686869', 'Reques aglio olio', '', 0, 1, '2020-11-30 00:35:19'),
(664, 6, 4, 2, 133, 'Jl Bintang No.1B/17(sederet RM samudra)', '3.594740,98.686869', 'Reques aglio olio', '', 0, 1, '2020-11-30 00:36:10'),
(665, 6, 5, 2, 133, 'Jl Bintang No.1B/17(sederet RM samudra)', '3.594740,98.686869', 'Reques aglio olio', '', 0, 1, '2020-11-30 00:36:32'),
(666, 6, 2, 1, 131, 'Tirta investama jl kapten soemarsono No 74', '3.615893,98.641688', '', '', 0, 1, '2020-11-30 01:02:20'),
(667, 6, 3, 1, 131, 'Tirta investama jl kapten soemarsono No 74', '3.615893,98.641688', '', '', 0, 1, '2020-11-30 01:02:40'),
(668, 6, 4, 1, 131, 'Tirta investama jl kapten soemarsono No 74', '3.615893,98.641688', '', '', 0, 1, '2020-11-30 01:03:03'),
(669, 6, 5, 1, 131, 'Tirta investama jl kapten soemarsono No 74', '3.615893,98.641688', '', '', 0, 1, '2020-11-30 01:03:29'),
(670, 6, 2, 2, 130, 'Jl s parman no 217, cambridge apartemen tower picasso lantai 21 (dari zainul arifin, pas sebelum tanjakan turun starbucks cambridge ada gerbang besi, drop off ke security sana saja).', '3.584218,98.667676', '', '( dari zainul arifin, pas sebelum tanjakan turun starbucks cambridge ada gerbang besi, drop off ke security sana saja )', 0, 1, '2020-11-30 01:04:45'),
(671, 6, 3, 2, 130, 'Jl s parman no 217, cambridge apartemen tower picasso lantai 21 (dari zainul arifin, pas sebelum tanjakan turun starbucks cambridge ada gerbang besi, drop off ke security sana saja).', '3.584218,98.667676', '', '( dari zainul arifin, pas sebelum tanjakan turun starbucks cambridge ada gerbang besi, drop off ke security sana saja )', 0, 1, '2020-11-30 01:05:42'),
(672, 6, 4, 2, 130, 'Jl s parman no 217, cambridge apartemen tower picasso lantai 21 (dari zainul arifin, pas sebelum tanjakan turun starbucks cambridge ada gerbang besi, drop off ke security sana saja).', '3.584218,98.667676', '', '( dari zainul arifin, pas sebelum tanjakan turun starbucks cambridge ada gerbang besi, drop off ke security sana saja )', 0, 1, '2020-11-30 01:06:02'),
(673, 6, 5, 2, 130, 'Jl s parman no 217, cambridge apartemen tower picasso lantai 21 (dari zainul arifin, pas sebelum tanjakan turun starbucks cambridge ada gerbang besi, drop off ke security sana saja).', '3.584218,98.667676', '', '( dari zainul arifin, pas sebelum tanjakan turun starbucks cambridge ada gerbang besi, drop off ke security sana saja )', 0, 1, '2020-11-30 01:06:20'),
(674, 6, 2, 2, 129, 'Perumahan Medan Resort City (Mercy) Rotterdam blok K06 kec.Deli Tua', '3.512107,98.675058', 'LUNCH 1 DINNER 2', '', 0, 1, '2020-11-30 01:07:23'),
(675, 6, 2, 1, 129, 'Perumahan Medan Resort City (Mercy) Rotterdam blok K06 kec.Deli Tua', '3.512107,98.675058', 'LUNCH 1 DINNER 2', '', 0, 1, '2020-11-30 01:07:45'),
(676, 6, 3, 1, 129, 'Perumahan Medan Resort City (Mercy) Rotterdam blok K06 kec.Deli Tua', '3.512107,98.675058', 'LUNCH 1 DINNER 2', '', 0, 1, '2020-11-30 01:08:06'),
(677, 6, 3, 2, 129, 'Perumahan Medan Resort City (Mercy) Rotterdam blok K06 kec.Deli Tua', '3.512107,98.675058', 'LUNCH 1 DINNER 2', '', 0, 1, '2020-11-30 01:08:31'),
(679, 6, 2, 2, 122, 'JL. Mojopahit ujung No. 69 A (Depan Yona Cafe). Pagar htam yg ada ring basket. Medan 20153', '3.575552,98.665248', 'PAKAI MENU LUNCH', '(Depan Yona Cafe) Pagar htam yg ada ring basket ', 0, 1, '2020-11-30 01:09:44'),
(680, 6, 3, 2, 122, 'JL. Mojopahit ujung No. 69 A (Depan Yona Cafe). Pagar htam yg ada ring basket. Medan 20153', '3.575552,98.665248', 'PAKAI MENU LUNCH', '(Depan Yona Cafe) Pagar htam yg ada ring basket ', 0, 1, '2020-11-30 01:10:03'),
(681, 6, 4, 2, 122, 'JL. Mojopahit ujung No. 69 A (Depan Yona Cafe). Pagar htam yg ada ring basket. Medan 20153', '3.575552,98.665248', 'PAKAI MENU LUNCH', '(Depan Yona Cafe) Pagar htam yg ada ring basket ', 0, 1, '2020-11-30 01:10:26'),
(682, 6, 5, 2, 122, 'JL. Mojopahit ujung No. 69 A (Depan Yona Cafe). Pagar htam yg ada ring basket. Medan 20153', '3.575552,98.665248', 'PAKAI MENU LUNCH', '(Depan Yona Cafe) Pagar htam yg ada ring basket ', 0, 1, '2020-11-30 01:10:58'),
(683, 6, 2, 1, 108, 'Jl persamaan Gg rahmat No.77 simpang limun', '3.551046,98.696498', '', '', 0, 1, '2020-11-30 01:11:35'),
(684, 6, 3, 1, 108, 'Jl persamaan Gg rahmat No.77 simpang limun', '3.551046,98.696498', '', '', 0, 1, '2020-11-30 01:11:58'),
(685, 6, 4, 1, 108, 'Jl persamaan Gg rahmat No.77 simpang limun', '3.551046,98.696498', '', '', 0, 1, '2020-11-30 01:13:05'),
(686, 6, 5, 1, 108, 'Jl persamaan Gg rahmat No.77 simpang limun', '3.551046,98.696498', '', '', 0, 1, '2020-11-30 01:14:01'),
(687, 6, 2, 1, 101, 'Jl sampali baru komplek sampali baru No.9J', '3.593723,98.698358', 'selang seling dari tanggan 19nov,24nov,26nov,1des,sampai 3des', '', 0, 1, '2020-11-30 01:15:06'),
(688, 6, 2, 1, 81, 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', '-', '-', 0, 1, '2020-11-30 01:15:49'),
(689, 6, 3, 1, 81, 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', '-', '-', 0, 1, '2020-11-30 01:16:09'),
(690, 6, 4, 1, 81, 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', '-', '-', 0, 1, '2020-11-30 01:16:39'),
(691, 6, 5, 1, 81, 'jl. Putri hijau no. 4 ( Kanwil kementerian hukum dan ham)', '3.594459,98.676219', '-', '-', 0, 1, '2020-11-30 01:17:18'),
(692, 6, 2, 1, 72, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-30 01:17:50'),
(693, 6, 2, 2, 72, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-30 01:18:09'),
(694, 6, 3, 1, 72, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-30 01:18:34'),
(695, 6, 3, 2, 72, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-30 01:19:01'),
(696, 6, 4, 1, 72, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-30 01:19:38'),
(697, 6, 4, 2, 72, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-30 01:20:04'),
(698, 6, 5, 1, 72, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-30 01:20:34'),
(699, 6, 5, 2, 72, 'Jl.Bunga Ester No.64d Psr VI P.Bulan (rumahnya pas di depan gereja katolik St.Fransiskus)', '3.544960, 98.651088', 'Ada MAAGH sebelum jam 6 Dinner', '-sebelum jam 6 Dinner', 0, 1, '2020-11-30 01:20:52'),
(700, 6, 2, 2, 68, 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 'Skip tanggal 13,17,26 november.', '-Harus SAMPE TANGAN sebelum 17.30.', 0, 1, '2020-11-30 01:21:35'),
(702, 6, 3, 2, 68, 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 'Skip tanggal 13,17,26 november.', '-Harus SAMPE TANGAN sebelum 17.30.', 0, 1, '2020-11-30 01:22:23'),
(703, 6, 4, 2, 68, 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 'Skip tanggal 13,17,26 november.', '-Harus SAMPE TANGAN sebelum 17.30.', 0, 1, '2020-11-30 01:22:56'),
(704, 6, 5, 2, 68, 'Oyo medan city homestay / turki family spa jln dr mansyur no 81.', '3.567458,98.647036', 'Skip tanggal 13,17,26 november.', '-Harus SAMPE TANGAN sebelum 17.30.', 0, 1, '2020-11-30 01:23:16'),
(705, 6, 1, 2, 148, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-30 02:23:11'),
(706, 6, 2, 1, 148, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-30 02:23:32'),
(707, 6, 2, 2, 148, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-30 02:24:07'),
(708, 6, 3, 1, 148, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-30 02:24:31'),
(709, 6, 3, 2, 148, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-30 02:25:42'),
(710, 6, 4, 1, 148, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-30 02:26:00'),
(711, 6, 4, 2, 148, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-30 02:26:33'),
(712, 6, 5, 1, 148, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-30 02:29:14'),
(713, 6, 5, 2, 148, 'Jl. Karya Jaya No. 146', '3.529349,98.676531', '', '-', 0, 1, '2020-11-30 02:29:41'),
(714, 6, 2, 2, 133, 'Jl Bintang No.1B/17(sederet RM samudra)', '3.594740,98.686869', 'Reques aglio olio', '', 0, 1, '2020-12-01 02:03:08'),
(715, 6, 3, 1, 149, 'Jl bunga asoka komplek asoka raya residance blok d57. Ringroad medan', '3.564046,98.622653', '', '', 0, 1, '2020-12-01 02:14:35'),
(716, 6, 4, 1, 149, 'Jl bunga asoka komplek asoka raya residance blok d57. Ringroad medan', '3.564046,98.622653', '', '', 0, 1, '2020-12-01 02:16:36'),
(717, 6, 5, 1, 149, 'Jl bunga asoka komplek asoka raya residance blok d57. Ringroad medan', '3.564046,98.622653', '', '', 0, 1, '2020-12-01 02:17:37'),
(718, 7, 1, 1, 126, '(LUNCH) BCA ASIA SIMPANG LAMPUNG (samping bank UOB) jl. Asia no 184D titip satpam', '3.584527,98.691058', 'TESTING', '-LUNCH titip satpam. Harus sampe sebelum 11.45 !!', 0, 1, '2020-12-15 05:48:15'),
(719, 7, 1, 1, 150, 'Jl bunga asoka komplek asoka raya residance blok d57. Ringroad medan', '3.530848,98.737637', '', '', 1, 1, '2020-12-15 05:50:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `catering_order_item`
--

CREATE TABLE `catering_order_item` (
  `id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `order_batch_id` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `food_name` varchar(200) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `catering_order_item`
--

INSERT INTO `catering_order_item` (`id`, `order_detail_id`, `order_batch_id`, `menu_id`, `food_name`, `quantity`, `created_time`) VALUES
(32, 37, 1, 1, 'Sour & Sweet Dorry', 1, '2020-10-28 10:01:42'),
(33, 38, 1, 1, 'Sour & Sweet Dorry', 1, '2020-10-28 10:01:49'),
(34, 39, 1, 2, 'Vegetarian Katsu', 1, '2020-10-28 10:01:55'),
(40, 46, 2, 6, 'Pesto penne with grilled Chicken', 1, '2020-10-29 19:54:24'),
(41, 47, 2, 11, 'Chicken mushroom oyster sauce', 1, '2020-10-29 19:55:14'),
(42, 48, 2, 7, 'San chow bow roll maki', 1, '2020-10-29 19:55:27'),
(47, 53, 2, 9, 'Spaghetti marinara with grilled fish', 1, '2020-10-29 19:57:28'),
(48, 54, 2, 14, 'Chicken san chow bow', 1, '2020-10-29 19:57:42'),
(50, 56, 2, 13, 'Spicy rice nourish bowl', 1, '2020-10-29 20:01:39'),
(51, 57, 2, 14, 'Chicken san chow bow', 1, '2020-10-29 20:02:00'),
(53, 59, 2, 6, 'Pesto penne with grilled Chicken', 1, '2020-10-29 20:04:09'),
(54, 60, 2, 6, 'Pesto penne with grilled Chicken', 1, '2020-10-29 20:05:16'),
(55, 61, 2, 11, 'Chicken mushroom oyster sauce', 1, '2020-10-29 20:05:49'),
(56, 62, 2, 6, 'Pesto penne with grilled Chicken', 1, '2020-10-29 20:06:11'),
(57, 63, 2, 11, 'Chicken mushroom oyster sauce', 1, '2020-10-29 20:06:27'),
(58, 64, 2, 6, 'Pesto penne with grilled Chicken', 1, '2020-10-29 20:07:43'),
(59, 65, 2, 11, 'Chicken mushroom oyster sauce', 1, '2020-10-29 20:08:21'),
(60, 66, 2, 11, 'Chicken mushroom oyster sauce', 2, '2020-10-29 20:08:53'),
(61, 67, 2, 6, 'Pesto penne with grilled Chicken', 1, '2020-10-29 20:09:31'),
(62, 68, 2, 11, 'Chicken mushroom oyster sauce', 1, '2020-10-29 20:09:42'),
(63, 69, 2, 6, 'Pesto penne with grilled Chicken', 1, '2020-10-29 20:11:05'),
(64, 70, 2, 11, 'Chicken mushroom oyster sauce', 1, '2020-10-29 20:11:34'),
(65, 71, 2, 6, 'Pesto penne with grilled Chicken', 1, '2020-10-29 20:11:54'),
(66, 72, 2, 6, 'Pesto penne with grilled Chicken', 1, '2020-10-29 20:12:17'),
(67, 73, 2, 11, 'Chicken mushroom oyster sauce', 1, '2020-10-29 20:12:27'),
(68, 74, 2, 6, 'Pesto penne with grilled Chicken', 1, '2020-10-29 20:12:49'),
(70, 76, 2, 6, 'Pesto penne with grilled Chicken', 1, '2020-10-29 20:13:26'),
(71, 77, 2, 11, 'Chicken mushroom oyster sauce', 1, '2020-10-29 20:13:42'),
(72, 78, 2, 6, 'Pesto penne with grilled Chicken', 1, '2020-10-29 20:13:59'),
(73, 79, 2, 11, 'Chicken mushroom oyster sauce', 1, '2020-10-29 20:14:35'),
(74, 80, 2, 7, 'San chow bow roll maki', 1, '2020-10-30 18:36:51'),
(75, 81, 2, 12, 'Spaghetti mushroom stroganof', 1, '2020-10-30 18:44:22'),
(76, 82, 2, 7, 'San chow bow roll maki', 1, '2020-10-30 18:45:14'),
(77, 83, 2, 7, 'San chow bow roll maki', 1, '2020-10-30 18:46:00'),
(78, 84, 2, 12, 'Spaghetti mushroom stroganof', 1, '2020-10-30 18:46:19'),
(79, 85, 2, 7, 'San chow bow roll maki', 1, '2020-10-30 18:47:00'),
(80, 86, 2, 12, 'Spaghetti mushroom stroganof', 1, '2020-10-30 18:47:23'),
(81, 87, 2, 7, 'San chow bow roll maki', 1, '2020-10-30 18:51:23'),
(82, 88, 2, 12, 'Spaghetti mushroom stroganof', 2, '2020-10-30 18:53:26'),
(83, 89, 2, 7, 'San chow bow roll maki', 1, '2020-10-30 18:55:46'),
(84, 90, 2, 12, 'Spaghetti mushroom stroganof', 1, '2020-10-30 18:56:04'),
(85, 91, 2, 12, 'Spaghetti mushroom stroganof', 1, '2020-10-30 18:56:30'),
(86, 92, 2, 7, 'San chow bow roll maki', 1, '2020-10-30 18:56:47'),
(87, 93, 2, 7, 'San chow bow roll maki', 1, '2020-10-30 18:57:23'),
(88, 94, 2, 12, 'Spaghetti mushroom stroganof', 1, '2020-10-30 18:57:38'),
(89, 95, 2, 7, 'San chow bow roll maki', 1, '2020-10-30 18:58:28'),
(91, 97, 2, 12, 'Spaghetti mushroom stroganof', 1, '2020-10-30 18:59:12'),
(92, 98, 2, 7, 'San chow bow roll maki', 1, '2020-10-30 21:07:03'),
(93, 99, 2, 12, 'Spaghetti mushroom stroganof', 1, '2020-10-30 21:07:26'),
(94, 100, 2, 11, 'Chicken mushroom oyster sauce', 1, '2020-10-30 21:10:25'),
(95, 101, 2, 8, 'Chicken cordon bleu ', 1, '2020-11-01 06:33:01'),
(96, 102, 2, 8, 'Chicken cordon bleu ', 1, '2020-11-01 06:33:44'),
(97, 103, 2, 8, 'Chicken cordon bleu ', 1, '2020-11-01 06:34:00'),
(98, 104, 2, 8, 'Chicken cordon bleu ', 1, '2020-11-01 06:34:23'),
(99, 105, 2, 8, 'Chicken cordon bleu ', 1, '2020-11-01 06:34:40'),
(100, 106, 2, 8, 'Chicken cordon bleu ', 1, '2020-11-01 06:34:53'),
(101, 107, 2, 8, 'Chicken cordon bleu ', 1, '2020-11-01 06:35:37'),
(102, 108, 2, 8, 'Chicken cordon bleu ', 1, '2020-11-01 06:36:01'),
(103, 109, 2, 13, 'Spicy rice nourish bowl', 1, '2020-11-01 06:36:14'),
(104, 110, 2, 13, 'Spicy rice nourish bowl', 2, '2020-11-01 06:36:37'),
(105, 111, 2, 8, 'Chicken cordon bleu ', 1, '2020-11-01 06:37:42'),
(106, 112, 2, 13, 'Spicy rice nourish bowl', 1, '2020-11-01 06:37:52'),
(107, 113, 2, 13, 'Spicy rice nourish bowl', 1, '2020-11-01 06:38:21'),
(108, 114, 2, 8, 'Chicken cordon bleu ', 1, '2020-11-01 06:38:42'),
(109, 115, 2, 8, 'Chicken cordon bleu ', 1, '2020-11-01 06:39:30'),
(110, 116, 2, 13, 'Spicy rice nourish bowl', 1, '2020-11-01 06:39:42'),
(111, 117, 2, 7, 'San chow bow roll maki', 1, '2020-11-01 06:39:57'),
(112, 118, 2, 8, 'Chicken cordon bleu ', 1, '2020-11-01 06:40:56'),
(113, 119, 2, 13, 'Spicy rice nourish bowl', 1, '2020-11-01 06:41:19'),
(114, 120, 2, 9, 'Spaghetti marinara with grilled fish', 1, '2020-11-02 01:07:49'),
(115, 121, 2, 9, 'Spaghetti marinara with grilled fish', 1, '2020-11-02 01:09:26'),
(117, 123, 2, 14, 'Chicken san chow bow', 1, '2020-11-02 01:10:59'),
(118, 124, 2, 9, 'Spaghetti marinara with grilled fish', 1, '2020-11-02 01:11:34'),
(119, 125, 2, 9, 'Spaghetti marinara with grilled fish', 1, '2020-11-02 01:12:22'),
(120, 126, 2, 14, 'Chicken san chow bow', 1, '2020-11-02 01:12:42'),
(121, 127, 2, 9, 'Spaghetti marinara with grilled fish', 1, '2020-11-02 01:14:08'),
(122, 128, 2, 14, 'Chicken san chow bow', 1, '2020-11-02 01:14:24'),
(123, 129, 2, 9, 'Spaghetti marinara with grilled fish', 1, '2020-11-02 01:15:22'),
(124, 130, 2, 9, 'Spaghetti marinara with grilled fish', 1, '2020-11-02 01:16:56'),
(125, 131, 2, 14, 'Chicken san chow bow', 1, '2020-11-02 01:17:26'),
(126, 132, 2, 14, 'Chicken san chow bow', 2, '2020-11-02 01:18:01'),
(127, 133, 2, 9, 'Spaghetti marinara with grilled fish', 1, '2020-11-02 01:18:49'),
(128, 134, 2, 14, 'Chicken san chow bow', 1, '2020-11-02 01:19:25'),
(129, 135, 2, 14, 'Chicken san chow bow', 1, '2020-11-02 01:20:16'),
(130, 136, 2, 9, 'Spaghetti marinara with grilled fish', 1, '2020-11-02 01:20:32'),
(131, 137, 2, 9, 'Spaghetti marinara with grilled fish', 1, '2020-11-02 01:20:53'),
(132, 138, 2, 14, 'Chicken san chow bow', 1, '2020-11-02 01:21:11'),
(133, 139, 2, 9, 'Spaghetti marinara with grilled fish', 1, '2020-11-02 01:21:30'),
(134, 140, 2, 9, 'Spaghetti marinara with grilled fish', 1, '2020-11-02 01:22:22'),
(135, 141, 2, 9, 'Spaghetti marinara with grilled fish', 1, '2020-11-02 04:35:45'),
(136, 142, 2, 14, 'Chicken san chow bow', 1, '2020-11-02 04:36:00'),
(138, 144, 2, 14, 'Chicken san chow bow', 1, '2020-11-02 21:20:54'),
(139, 145, 2, 10, 'Chicken yogurt sauce', 1, '2020-11-03 16:51:42'),
(140, 146, 2, 15, 'Waldrof salad with sandwich vege mayo', 1, '2020-11-03 16:52:18'),
(141, 147, 2, 10, 'Chicken yogurt sauce', 1, '2020-11-03 16:53:18'),
(142, 148, 2, 10, 'Chicken yogurt sauce', 1, '2020-11-03 16:53:42'),
(143, 149, 2, 15, 'Waldrof salad with sandwich vege mayo', 1, '2020-11-03 16:54:17'),
(144, 150, 2, 10, 'Chicken yogurt sauce', 1, '2020-11-03 16:54:52'),
(145, 151, 2, 10, 'Chicken yogurt sauce', 1, '2020-11-03 16:55:15'),
(146, 152, 2, 15, 'Waldrof salad with sandwich vege mayo', 1, '2020-11-03 16:55:31'),
(147, 153, 2, 10, 'Chicken yogurt sauce', 1, '2020-11-03 16:55:46'),
(148, 154, 2, 15, 'Waldrof salad with sandwich vege mayo', 1, '2020-11-03 16:55:57'),
(149, 155, 2, 10, 'Chicken yogurt sauce', 1, '2020-11-03 16:56:18'),
(150, 156, 2, 10, 'Chicken yogurt sauce', 1, '2020-11-03 16:56:40'),
(151, 157, 2, 15, 'Waldrof salad with sandwich vege mayo', 1, '2020-11-03 16:56:56'),
(152, 158, 2, 15, 'Waldrof salad with sandwich vege mayo', 2, '2020-11-03 16:57:15'),
(153, 159, 2, 10, 'Chicken yogurt sauce', 1, '2020-11-03 16:57:33'),
(154, 160, 2, 15, 'Waldrof salad with sandwich vege mayo', 1, '2020-11-03 16:57:48'),
(155, 161, 2, 10, 'Chicken yogurt sauce', 1, '2020-11-03 16:58:06'),
(156, 162, 2, 15, 'Waldrof salad with sandwich vege mayo', 1, '2020-11-03 16:58:20'),
(157, 163, 2, 10, 'Chicken yogurt sauce', 1, '2020-11-03 16:58:38'),
(158, 164, 2, 15, 'Waldrof salad with sandwich vege mayo', 1, '2020-11-03 16:58:50'),
(159, 165, 2, 10, 'Chicken yogurt sauce', 1, '2020-11-03 16:59:05'),
(160, 166, 2, 10, 'Chicken yogurt sauce', 1, '2020-11-03 16:59:35'),
(161, 167, 2, 15, 'Waldrof salad with sandwich vege mayo', 1, '2020-11-03 16:59:50'),
(162, 168, 2, 15, 'Waldrof salad with sandwich vege mayo', 1, '2020-11-03 17:00:13'),
(164, 170, 3, 17, 'Mushroom patty nourish bowl', 1, '2020-11-07 12:45:43'),
(165, 171, 3, 17, 'Mushroom patty nourish bowl', 1, '2020-11-07 12:45:59'),
(166, 172, 3, 16, 'Chicken sambal matah with Satai Lilit', 1, '2020-11-07 12:46:13'),
(167, 173, 3, 17, 'Mushroom patty nourish bowl', 1, '2020-11-07 12:46:22'),
(168, 174, 3, 16, 'Chicken sambal matah with Satai Lilit', 1, '2020-11-07 12:46:32'),
(169, 175, 3, 17, 'Mushroom patty nourish bowl', 1, '2020-11-07 12:46:42'),
(170, 176, 3, 16, 'Chicken sambal matah with Satai Lilit', 1, '2020-11-07 12:46:56'),
(171, 177, 3, 17, 'Mushroom patty nourish bowl', 1, '2020-11-07 12:47:08'),
(172, 178, 3, 17, 'Mushroom patty nourish bowl', 2, '2020-11-07 12:47:28'),
(173, 179, 3, 16, 'Chicken sambal matah with Satai Lilit', 1, '2020-11-07 12:47:42'),
(174, 180, 3, 17, 'Mushroom patty nourish bowl', 1, '2020-11-07 12:47:51'),
(175, 181, 3, 16, 'Chicken sambal matah with Satai Lilit', 1, '2020-11-07 12:47:59'),
(176, 182, 3, 16, 'Chicken sambal matah with Satai Lilit', 1, '2020-11-07 12:48:06'),
(177, 183, 3, 17, 'Mushroom patty nourish bowl', 1, '2020-11-07 12:48:21'),
(178, 184, 3, 17, 'Mushroom patty nourish bowl', 1, '2020-11-07 12:48:44'),
(179, 185, 3, 16, 'Chicken sambal matah with Satai Lilit', 1, '2020-11-07 12:48:58'),
(180, 186, 3, 16, 'Chicken sambal matah with Satai Lilit', 1, '2020-11-07 12:49:08'),
(181, 187, 3, 16, 'Chicken sambal matah with Satai Lilit', 1, '2020-11-07 12:49:18'),
(182, 188, 3, 17, 'Mushroom patty nourish bowl', 1, '2020-11-07 12:49:30'),
(183, 189, 3, 16, 'Chicken sambal matah with Satai Lilit', 1, '2020-11-07 12:49:44'),
(187, 193, 3, 18, 'Chicken Milanese', 1, '2020-11-07 20:06:53'),
(188, 194, 3, 19, 'Chicken Creamy Glutten Free Zoodles', 1, '2020-11-07 20:07:17'),
(189, 195, 3, 19, 'Chicken Creamy Glutten Free Zoodles', 1, '2020-11-07 20:08:02'),
(190, 196, 3, 18, 'Chicken Milanese', 1, '2020-11-07 20:08:41'),
(191, 197, 3, 19, 'Chicken Creamy Glutten Free Zoodles', 1, '2020-11-07 20:08:59'),
(192, 198, 3, 18, 'Chicken Milanese', 1, '2020-11-07 20:09:29'),
(193, 199, 3, 19, 'Chicken Creamy Glutten Free Zoodles', 1, '2020-11-07 20:09:46'),
(194, 200, 3, 19, 'Chicken Creamy Glutten Free Zoodles', 2, '2020-11-07 20:10:15'),
(197, 203, 3, 18, 'Chicken Milanese', 1, '2020-11-07 20:11:41'),
(198, 204, 3, 18, 'Chicken Milanese', 1, '2020-11-07 20:12:10'),
(199, 205, 3, 19, 'Chicken Creamy Glutten Free Zoodles', 1, '2020-11-07 20:12:35'),
(200, 206, 3, 19, 'Chicken Creamy Glutten Free Zoodles', 1, '2020-11-07 20:13:07'),
(201, 207, 3, 18, 'Chicken Milanese', 1, '2020-11-07 20:31:46'),
(202, 208, 3, 18, 'Chicken Milanese', 1, '2020-11-07 20:32:33'),
(205, 211, 3, 18, 'Chicken Milanese', 1, '2020-11-07 20:34:20'),
(206, 212, 3, 18, 'Chicken Milanese', 1, '2020-11-07 20:52:11'),
(207, 213, 3, 19, 'Chicken Creamy Glutten Free Zoodles', 1, '2020-11-07 20:53:02'),
(208, 214, 3, 18, 'Chicken Milanese', 1, '2020-11-07 21:11:46'),
(209, 215, 3, 19, 'Chicken Creamy Glutten Free Zoodles', 1, '2020-11-07 21:12:05'),
(210, 216, 3, 20, 'Thai Seamed Fish With Jacket Potato', 1, '2020-11-08 17:15:23'),
(211, 217, 3, 20, 'Thai Seamed Fish With Jacket Potato', 1, '2020-11-08 17:40:54'),
(212, 218, 3, 20, 'Thai Seamed Fish With Jacket Potato', 1, '2020-11-08 17:42:23'),
(213, 219, 3, 20, 'Thai Seamed Fish With Jacket Potato', 1, '2020-11-08 17:44:38'),
(214, 220, 3, 20, 'Thai Seamed Fish With Jacket Potato', 1, '2020-11-08 17:45:34'),
(215, 221, 3, 20, 'Thai Seamed Fish With Jacket Potato', 1, '2020-11-08 18:09:10'),
(216, 222, 3, 20, 'Thai Seamed Fish With Jacket Potato', 1, '2020-11-08 18:11:48'),
(217, 223, 3, 20, 'Thai Seamed Fish With Jacket Potato', 1, '2020-11-08 18:12:36'),
(218, 224, 3, 20, 'Thai Seamed Fish With Jacket Potato', 1, '2020-11-08 20:06:10'),
(220, 226, 3, 21, 'Chicken Patty With Potato Wedges', 1, '2020-11-08 20:24:26'),
(221, 227, 3, 21, 'Chicken Patty With Potato Wedges', 1, '2020-11-08 20:25:14'),
(223, 229, 3, 21, 'Chicken Patty With Potato Wedges', 1, '2020-11-08 20:26:53'),
(224, 230, 3, 21, 'Chicken Patty With Potato Wedges', 1, '2020-11-08 20:27:33'),
(226, 232, 3, 21, 'Chicken Patty With Potato Wedges', 2, '2020-11-08 20:28:51'),
(227, 233, 3, 21, 'Chicken Patty With Potato Wedges', 1, '2020-11-08 20:29:37'),
(228, 234, 3, 21, 'Chicken Patty With Potato Wedges', 1, '2020-11-08 20:30:40'),
(229, 235, 3, 21, 'Chicken Patty With Potato Wedges', 1, '2020-11-08 20:38:50'),
(230, 236, 3, 20, 'Thai Seamed Fish With Jacket Potato', 1, '2020-11-08 20:40:41'),
(231, 237, 3, 22, 'Honey Garlic Shrimp With PadThai', 1, '2020-11-08 22:33:42'),
(232, 238, 3, 22, 'Honey Garlic Shrimp With PadThai', 1, '2020-11-08 22:34:28'),
(233, 239, 3, 22, 'Honey Garlic Shrimp With PadThai', 1, '2020-11-08 22:35:13'),
(234, 240, 3, 22, 'Honey Garlic Shrimp With PadThai', 1, '2020-11-08 22:35:55'),
(235, 241, 3, 22, 'Honey Garlic Shrimp With PadThai', 1, '2020-11-08 22:36:31'),
(236, 242, 3, 22, 'Honey Garlic Shrimp With PadThai', 1, '2020-11-08 22:37:25'),
(237, 243, 3, 22, 'Honey Garlic Shrimp With PadThai', 1, '2020-11-08 22:37:59'),
(238, 244, 3, 21, 'Chicken Patty With Potato Wedges', 1, '2020-11-08 22:38:32'),
(239, 245, 3, 22, 'Honey Garlic Shrimp With PadThai', 1, '2020-11-08 22:39:04'),
(240, 246, 3, 22, 'Honey Garlic Shrimp With PadThai', 1, '2020-11-08 22:41:05'),
(241, 247, 3, 23, 'Balinese Shedded Chicken', 1, '2020-11-08 22:42:38'),
(242, 248, 3, 23, 'Balinese Shedded Chicken', 1, '2020-11-08 22:43:15'),
(243, 249, 3, 23, 'Balinese Shedded Chicken', 1, '2020-11-08 22:44:11'),
(244, 250, 3, 23, 'Balinese Shedded Chicken', 1, '2020-11-08 22:44:53'),
(245, 251, 3, 23, 'Balinese Shedded Chicken', 1, '2020-11-08 22:45:17'),
(246, 252, 3, 23, 'Balinese Shedded Chicken', 2, '2020-11-08 22:45:52'),
(247, 253, 3, 23, 'Balinese Shedded Chicken', 1, '2020-11-08 22:46:29'),
(248, 254, 3, 23, 'Balinese Shedded Chicken', 1, '2020-11-08 22:46:53'),
(249, 255, 3, 24, 'Chicken Black Pepper With Corn Soup', 1, '2020-11-10 01:07:05'),
(250, 256, 3, 24, 'Chicken Black Pepper With Corn Soup', 1, '2020-11-10 01:07:50'),
(251, 257, 3, 24, 'Chicken Black Pepper With Corn Soup', 1, '2020-11-10 01:08:41'),
(252, 258, 3, 24, 'Chicken Black Pepper With Corn Soup', 1, '2020-11-10 01:10:07'),
(253, 259, 3, 24, 'Chicken Black Pepper With Corn Soup', 1, '2020-11-10 01:11:27'),
(254, 260, 3, 24, 'Chicken Black Pepper With Corn Soup', 1, '2020-11-10 01:15:00'),
(255, 261, 3, 24, 'Chicken Black Pepper With Corn Soup', 1, '2020-11-10 01:15:42'),
(257, 263, 3, 24, 'Chicken Black Pepper With Corn Soup', 1, '2020-11-10 01:16:31'),
(258, 264, 3, 24, 'Chicken Black Pepper With Corn Soup', 1, '2020-11-10 01:17:06'),
(259, 265, 3, 25, 'Spaghetti Chicken Bolognese', 1, '2020-11-10 01:40:49'),
(260, 266, 3, 25, 'Spaghetti Chicken Bolognese', 1, '2020-11-10 01:42:16'),
(261, 267, 3, 25, 'Spaghetti Chicken Bolognese', 1, '2020-11-10 01:42:56'),
(262, 268, 3, 25, 'Spaghetti Chicken Bolognese', 1, '2020-11-10 02:07:22'),
(263, 269, 3, 25, 'Spaghetti Chicken Bolognese', 2, '2020-11-10 02:08:20'),
(264, 270, 3, 25, 'Spaghetti Chicken Bolognese', 1, '2020-11-10 02:08:59'),
(265, 271, 3, 25, 'Spaghetti Chicken Bolognese', 1, '2020-11-10 02:09:42'),
(266, 272, 3, 22, 'Honey Garlic Shrimp With PadThai', 1, '2020-11-10 03:03:04'),
(267, 273, 3, 24, 'Chicken Black Pepper With Corn Soup', 1, '2020-11-10 03:03:38'),
(268, 274, 4, 26, 'Baked Chiken With Mashed Potato', 1, '2020-11-12 04:30:21'),
(269, 275, 4, 26, 'Baked Chiken With Mashed Potato', 1, '2020-11-12 04:30:39'),
(270, 276, 4, 26, 'Baked Chiken With Mashed Potato', 1, '2020-11-12 04:30:57'),
(271, 277, 4, 26, 'Baked Chiken With Mashed Potato', 1, '2020-11-12 04:31:28'),
(272, 278, 4, 26, 'Baked Chiken With Mashed Potato', 1, '2020-11-12 04:32:04'),
(273, 279, 4, 27, 'Fusilli Signature Skillet Supper', 1, '2020-11-12 04:32:26'),
(274, 280, 4, 27, 'Fusilli Signature Skillet Supper', 1, '2020-11-12 04:32:38'),
(275, 281, 4, 27, 'Fusilli Signature Skillet Supper', 1, '2020-11-12 04:33:06'),
(276, 282, 4, 28, 'Grilled Chicken Taliwang', 1, '2020-11-12 04:33:51'),
(277, 283, 4, 28, 'Grilled Chicken Taliwang', 1, '2020-11-12 04:34:06'),
(278, 284, 4, 28, 'Grilled Chicken Taliwang', 1, '2020-11-12 04:34:24'),
(279, 285, 4, 28, 'Grilled Chicken Taliwang', 1, '2020-11-12 04:34:41'),
(280, 286, 4, 28, 'Grilled Chicken Taliwang', 1, '2020-11-12 04:34:54'),
(281, 287, 4, 29, 'Chicken Kabobs With Grilled Potatoes', 1, '2020-11-12 04:35:16'),
(282, 288, 4, 29, 'Chicken Kabobs With Grilled Potatoes', 1, '2020-11-12 04:35:41'),
(283, 289, 4, 30, 'Chicken Kung Pao', 1, '2020-11-12 04:36:47'),
(284, 290, 4, 30, 'Chicken Kung Pao', 1, '2020-11-12 04:37:13'),
(285, 291, 4, 30, 'Chicken Kung Pao', 1, '2020-11-12 04:37:35'),
(286, 292, 4, 30, 'Chicken Kung Pao', 1, '2020-11-12 04:37:53'),
(287, 293, 4, 30, 'Chicken Kung Pao', 1, '2020-11-12 04:38:12'),
(288, 294, 4, 31, 'Fish Fillet With puree pumpkin sauce', 1, '2020-11-12 04:38:45'),
(289, 295, 4, 31, 'Fish Fillet With puree pumpkin sauce', 1, '2020-11-12 04:39:01'),
(290, 296, 4, 31, 'Fish Fillet With puree pumpkin sauce', 1, '2020-11-12 04:39:26'),
(291, 297, 4, 26, 'Baked Chiken With Mashed Potato', 1, '2020-11-12 10:30:35'),
(292, 298, 4, 27, 'Fusilli Signature Skillet Supper', 1, '2020-11-12 10:30:52'),
(293, 299, 4, 28, 'Grilled Chicken Taliwang', 1, '2020-11-12 10:31:06'),
(294, 300, 4, 29, 'Chicken Kabobs With Grilled Potatoes', 1, '2020-11-12 10:31:19'),
(295, 301, 4, 30, 'Chicken Kung Pao', 1, '2020-11-12 10:31:37'),
(297, 303, 4, 31, 'Fish Fillet With puree pumpkin sauce', 1, '2020-11-12 10:32:15'),
(298, 304, 4, 26, 'Baked Chiken With Mashed Potato', 1, '2020-11-14 05:12:06'),
(299, 305, 4, 26, 'Baked Chiken With Mashed Potato', 1, '2020-11-14 05:12:39'),
(300, 306, 4, 26, 'Baked Chiken With Mashed Potato', 1, '2020-11-14 05:21:03'),
(302, 308, 4, 26, 'Baked Chiken With Mashed Potato', 1, '2020-11-14 05:35:35'),
(303, 309, 4, 26, 'Baked Chiken With Mashed Potato', 1, '2020-11-14 07:03:59'),
(304, 310, 4, 26, 'Baked Chiken With Mashed Potato', 1, '2020-11-14 07:04:09'),
(305, 311, 4, 26, 'Baked Chiken With Mashed Potato', 1, '2020-11-14 07:04:20'),
(306, 312, 4, 26, 'Baked Chiken With Mashed Potato', 2, '2020-11-14 07:52:06'),
(307, 313, 4, 26, 'Baked Chiken With Mashed Potato', 1, '2020-11-14 07:52:42'),
(308, 314, 4, 26, 'Baked Chiken With Mashed Potato', 2, '2020-11-14 08:00:39'),
(309, 315, 4, 27, 'Fusilli Signature Skillet Supper', 2, '2020-11-14 08:00:57'),
(310, 316, 4, 37, 'Vegetarian katsu with mashed potato', 1, '2020-11-14 10:26:49'),
(311, 317, 4, 27, 'Fusilli Signature Skillet Supper', 1, '2020-11-14 10:27:10'),
(312, 318, 4, 38, 'Beef edamames salad', 1, '2020-11-14 10:27:31'),
(313, 319, 4, 40, 'Spaghetti marinara with grilled fish', 1, '2020-11-14 10:27:57'),
(320, 326, 4, 26, 'Baked Chiken With Mashed Potato', 1, '2020-11-14 11:29:32'),
(321, 327, 4, 26, 'Baked Chiken With Mashed Potato', 1, '2020-11-14 11:29:46'),
(322, 328, 4, 27, 'Fusilli Signature Skillet Supper', 1, '2020-11-14 11:30:02'),
(323, 329, 4, 27, 'Fusilli Signature Skillet Supper', 1, '2020-11-14 11:30:18'),
(324, 330, 4, 32, 'Shrimp Black Pepper', 2, '2020-11-14 11:48:15'),
(325, 331, 4, 28, 'Grilled Chicken Taliwang', 1, '2020-11-15 00:04:37'),
(326, 332, 4, 28, 'Grilled Chicken Taliwang', 1, '2020-11-15 00:05:01'),
(327, 333, 4, 28, 'Grilled Chicken Taliwang', 1, '2020-11-15 00:05:56'),
(328, 334, 4, 28, 'Grilled Chicken Taliwang', 1, '2020-11-15 00:06:14'),
(329, 335, 4, 28, 'Grilled Chicken Taliwang', 1, '2020-11-15 00:07:01'),
(330, 336, 4, 28, 'Grilled Chicken Taliwang', 1, '2020-11-15 00:07:22'),
(331, 337, 4, 28, 'Grilled Chicken Taliwang', 1, '2020-11-15 00:07:44'),
(332, 338, 4, 28, 'Grilled Chicken Taliwang', 1, '2020-11-15 00:08:07'),
(333, 339, 4, 28, 'Grilled Chicken Taliwang', 2, '2020-11-15 00:09:12'),
(334, 340, 4, 28, 'Grilled Chicken Taliwang', 1, '2020-11-15 00:09:39'),
(335, 341, 4, 28, 'Grilled Chicken Taliwang', 2, '2020-11-15 00:10:08'),
(336, 342, 4, 28, 'Grilled Chicken Taliwang', 1, '2020-11-15 00:10:53'),
(337, 343, 4, 28, 'Grilled Chicken Taliwang', 1, '2020-11-15 00:11:52'),
(338, 344, 4, 29, 'Chicken Kabobs With Grilled Potatoes', 2, '2020-11-15 00:15:00'),
(339, 345, 4, 29, 'Chicken Kabobs With Grilled Potatoes', 1, '2020-11-15 00:16:50'),
(340, 346, 4, 29, 'Chicken Kabobs With Grilled Potatoes', 1, '2020-11-15 00:17:18'),
(341, 347, 4, 31, 'Fish Fillet With puree pumpkin sauce', 2, '2020-11-15 00:31:41'),
(342, 348, 4, 31, 'Fish Fillet With puree pumpkin sauce', 1, '2020-11-15 00:34:42'),
(343, 349, 4, 31, 'Fish Fillet With puree pumpkin sauce', 1, '2020-11-15 00:35:08'),
(344, 350, 4, 30, 'Chicken Kung Pao', 1, '2020-11-15 00:40:44'),
(345, 351, 4, 30, 'Chicken Kung Pao', 1, '2020-11-15 00:41:10'),
(346, 352, 4, 30, 'Chicken Kung Pao', 1, '2020-11-15 00:41:56'),
(347, 353, 4, 30, 'Chicken Kung Pao', 1, '2020-11-15 00:43:02'),
(348, 354, 4, 30, 'Chicken Kung Pao', 1, '2020-11-15 00:43:57'),
(349, 355, 4, 30, 'Chicken Kung Pao', 1, '2020-11-15 00:46:12'),
(350, 356, 4, 30, 'Chicken Kung Pao', 1, '2020-11-15 00:46:35'),
(351, 357, 4, 30, 'Chicken Kung Pao', 1, '2020-11-15 00:47:10'),
(352, 358, 4, 30, 'Chicken Kung Pao', 2, '2020-11-15 00:47:45'),
(353, 359, 4, 30, 'Chicken Kung Pao', 1, '2020-11-15 00:48:37'),
(354, 360, 4, 30, 'Chicken Kung Pao', 2, '2020-11-15 00:49:04'),
(355, 361, 4, 30, 'Chicken Kung Pao', 1, '2020-11-15 00:50:11'),
(356, 362, 4, 30, 'Chicken Kung Pao', 1, '2020-11-15 00:50:33'),
(358, 364, 4, 32, 'Shrimp Black Pepper', 1, '2020-11-15 00:53:51'),
(359, 365, 4, 32, 'Shrimp Black Pepper', 1, '2020-11-15 00:54:29'),
(360, 366, 4, 32, 'Shrimp Black Pepper', 1, '2020-11-15 00:54:50'),
(361, 367, 4, 32, 'Shrimp Black Pepper', 1, '2020-11-15 00:55:31'),
(362, 368, 4, 32, 'Shrimp Black Pepper', 1, '2020-11-15 00:55:52'),
(363, 369, 4, 32, 'Shrimp Black Pepper', 1, '2020-11-15 00:56:17'),
(364, 370, 4, 32, 'Shrimp Black Pepper', 1, '2020-11-15 00:56:39'),
(365, 371, 4, 32, 'Shrimp Black Pepper', 1, '2020-11-15 00:56:58'),
(366, 372, 4, 32, 'Shrimp Black Pepper', 1, '2020-11-15 00:57:22'),
(367, 373, 4, 32, 'Shrimp Black Pepper', 1, '2020-11-15 00:58:01'),
(368, 374, 4, 32, 'Shrimp Black Pepper', 1, '2020-11-15 00:58:20'),
(369, 375, 4, 32, 'Shrimp Black Pepper', 1, '2020-11-15 00:58:38'),
(370, 376, 4, 32, 'Shrimp Black Pepper', 1, '2020-11-15 00:58:59'),
(371, 377, 4, 32, 'Shrimp Black Pepper', 2, '2020-11-15 00:59:18'),
(372, 378, 4, 32, 'Shrimp Black Pepper', 1, '2020-11-15 00:59:54'),
(373, 379, 4, 32, 'Shrimp Black Pepper', 1, '2020-11-15 01:00:11'),
(374, 380, 4, 32, 'Shrimp Black Pepper', 1, '2020-11-15 01:01:02'),
(375, 381, 4, 33, 'Grilled Chicken With Jacket Potato', 1, '2020-11-15 01:02:56'),
(376, 382, 4, 33, 'Grilled Chicken With Jacket Potato', 1, '2020-11-15 01:03:20'),
(377, 383, 4, 33, 'Grilled Chicken With Jacket Potato', 1, '2020-11-15 01:03:45'),
(378, 384, 4, 33, 'Grilled Chicken With Jacket Potato', 1, '2020-11-15 01:04:08'),
(379, 385, 4, 33, 'Grilled Chicken With Jacket Potato', 2, '2020-11-15 01:04:45'),
(380, 386, 4, 33, 'Grilled Chicken With Jacket Potato', 1, '2020-11-15 01:05:41'),
(381, 387, 4, 33, 'Grilled Chicken With Jacket Potato', 1, '2020-11-15 01:07:20'),
(382, 388, 4, 34, 'Fish Dabu Dabu', 1, '2020-11-15 01:10:27'),
(383, 389, 4, 34, 'Fish Dabu Dabu', 1, '2020-11-15 01:10:47'),
(384, 390, 4, 34, 'Fish Dabu Dabu', 1, '2020-11-15 01:11:17'),
(385, 391, 4, 34, 'Fish Dabu Dabu', 1, '2020-11-15 01:11:34'),
(386, 392, 4, 34, 'Fish Dabu Dabu', 1, '2020-11-15 01:11:58'),
(387, 393, 4, 34, 'Fish Dabu Dabu', 1, '2020-11-15 01:12:28'),
(388, 394, 4, 34, 'Fish Dabu Dabu', 1, '2020-11-15 01:12:45'),
(389, 395, 4, 34, 'Fish Dabu Dabu', 1, '2020-11-15 01:13:17'),
(390, 396, 4, 34, 'Fish Dabu Dabu', 1, '2020-11-15 01:13:40'),
(391, 397, 4, 34, 'Fish Dabu Dabu', 1, '2020-11-15 01:14:02'),
(392, 398, 4, 34, 'Fish Dabu Dabu', 1, '2020-11-15 01:14:24'),
(393, 399, 4, 34, 'Fish Dabu Dabu', 1, '2020-11-15 01:14:48'),
(394, 400, 4, 34, 'Fish Dabu Dabu', 1, '2020-11-15 01:15:19'),
(395, 401, 4, 34, 'Fish Dabu Dabu', 2, '2020-11-15 01:15:46'),
(396, 402, 4, 34, 'Fish Dabu Dabu', 1, '2020-11-15 01:16:13'),
(397, 403, 4, 34, 'Fish Dabu Dabu', 2, '2020-11-15 01:16:37'),
(398, 404, 4, 34, 'Fish Dabu Dabu', 1, '2020-11-15 01:17:19'),
(399, 405, 4, 34, 'Fish Dabu Dabu', 1, '2020-11-15 01:18:12'),
(400, 406, 4, 35, 'Korean Kimbab', 1, '2020-11-15 01:21:06'),
(401, 407, 4, 35, 'Korean Kimbab', 1, '2020-11-15 01:21:34'),
(402, 408, 4, 35, 'Korean Kimbab', 1, '2020-11-15 01:21:54'),
(403, 409, 4, 35, 'Korean Kimbab', 1, '2020-11-15 01:22:11'),
(404, 410, 4, 35, 'Korean Kimbab', 2, '2020-11-15 01:22:45'),
(405, 411, 4, 35, 'Korean Kimbab', 1, '2020-11-15 01:23:24'),
(406, 412, 4, 35, 'Korean Kimbab', 1, '2020-11-15 01:23:40'),
(407, 413, 4, 28, 'Grilled Chicken Taliwang', 1, '2020-11-15 05:22:33'),
(408, 414, 4, 30, 'Chicken Kung Pao', 1, '2020-11-15 05:22:57'),
(409, 415, 4, 32, 'Shrimp Black Pepper', 1, '2020-11-15 05:23:37'),
(410, 416, 4, 34, 'Fish Dabu Dabu', 1, '2020-11-15 05:24:55'),
(412, 418, 4, 47, 'Crispy Mushroom With Red Rice', 1, '2020-11-16 05:42:42'),
(413, 419, 4, 32, 'Shrimp Black Pepper', 1, '2020-11-17 00:49:08'),
(414, 420, 4, 33, 'Grilled Chicken With Jacket Potato', 1, '2020-11-17 00:49:34'),
(415, 421, 4, 34, 'Fish Dabu Dabu', 1, '2020-11-17 00:50:50'),
(416, 422, 4, 35, 'Korean Kimbab', 1, '2020-11-17 00:51:07'),
(417, 423, 5, 48, 'Beef black pepper', 1, '2020-11-19 03:38:41'),
(418, 424, 5, 63, 'Chicken blackpepper', 1, '2020-11-19 03:38:55'),
(419, 425, 5, 48, 'Beef black pepper', 1, '2020-11-19 03:41:12'),
(420, 426, 5, 48, 'Beef black pepper', 1, '2020-11-19 03:41:37'),
(421, 427, 5, 48, 'Beef black pepper', 1, '2020-11-19 03:42:01'),
(422, 428, 5, 62, 'Sandiwich vege mayo', 1, '2020-11-19 03:43:15'),
(423, 429, 5, 48, 'Beef black pepper', 1, '2020-11-19 03:43:42'),
(424, 430, 5, 48, 'Beef black pepper', 1, '2020-11-19 03:45:39'),
(426, 432, 5, 49, 'Spaghetti marinara with grilled fish', 1, '2020-11-19 03:47:03'),
(427, 433, 5, 49, 'Spaghetti marinara with grilled fish', 1, '2020-11-19 03:47:23'),
(428, 434, 5, 49, 'Spaghetti marinara with grilled fish', 1, '2020-11-19 03:47:36'),
(429, 435, 5, 49, 'Spaghetti marinara with grilled fish', 1, '2020-11-19 03:47:47'),
(430, 436, 5, 49, 'Spaghetti marinara with grilled fish', 1, '2020-11-19 03:48:01'),
(431, 437, 5, 49, 'Spaghetti marinara with grilled fish', 1, '2020-11-19 03:48:16'),
(432, 438, 5, 50, 'Chicken basil lettuce wrap', 1, '2020-11-19 03:48:58'),
(433, 439, 5, 52, 'Grilled chicken yogurt sauce', 1, '2020-11-19 03:49:10'),
(434, 440, 5, 54, 'Grillet fish pesto sauce with aglio olio', 1, '2020-11-19 03:49:21'),
(435, 441, 5, 56, 'Chicken penne tomato cream sauce', 1, '2020-11-19 03:49:37'),
(436, 442, 5, 50, 'Chicken basil lettuce wrap', 1, '2020-11-19 03:50:08'),
(437, 443, 5, 51, 'Fish fillet with aioli sauce', 1, '2020-11-19 03:50:20'),
(438, 444, 5, 52, 'Grilled chicken yogurt sauce', 1, '2020-11-19 03:50:37'),
(439, 445, 5, 53, 'Chicken soup with red rice', 1, '2020-11-19 03:50:51'),
(440, 446, 5, 61, 'Spaghetti mushroom stroganoff', 1, '2020-11-19 03:51:40'),
(441, 447, 5, 65, 'Thai Steamed fish fillet', 1, '2020-11-19 03:51:52'),
(442, 448, 5, 59, 'Vegetable kung pao', 1, '2020-11-19 03:52:14'),
(443, 449, 5, 51, 'Fish fillet with aioli sauce', 1, '2020-11-19 03:52:25'),
(444, 450, 5, 58, 'Spicy rice nourish bowl', 1, '2020-11-19 03:53:36'),
(445, 451, 5, 50, 'Chicken basil lettuce wrap', 1, '2020-11-19 03:54:00'),
(446, 452, 5, 51, 'Fish fillet with aioli sauce', 1, '2020-11-19 03:54:12'),
(447, 453, 5, 52, 'Grilled chicken yogurt sauce', 1, '2020-11-19 03:54:24'),
(448, 454, 5, 53, 'Chicken soup with red rice', 1, '2020-11-19 03:54:39'),
(449, 455, 5, 54, 'Grillet fish pesto sauce with aglio olio', 1, '2020-11-19 03:54:56'),
(450, 456, 5, 55, 'Chicken roulade with avocado salad', 1, '2020-11-19 03:55:07'),
(451, 457, 5, 56, 'Chicken penne tomato cream sauce', 1, '2020-11-19 03:55:18'),
(452, 458, 5, 57, 'Sauteed mix mushroom oyster sauce', 1, '2020-11-19 03:55:28'),
(453, 459, 5, 50, 'Chicken basil lettuce wrap', 1, '2020-11-19 03:56:12'),
(454, 460, 5, 52, 'Grilled chicken yogurt sauce', 1, '2020-11-19 03:56:43'),
(455, 461, 5, 54, 'Grillet fish pesto sauce with aglio olio', 1, '2020-11-19 03:57:15'),
(456, 462, 5, 56, 'Chicken penne tomato cream sauce', 1, '2020-11-19 03:57:30'),
(457, 463, 5, 50, 'Chicken basil lettuce wrap', 1, '2020-11-19 03:57:49'),
(458, 464, 5, 50, 'Chicken basil lettuce wrap', 1, '2020-11-19 03:58:40'),
(459, 465, 5, 51, 'Fish fillet with aioli sauce', 1, '2020-11-19 03:58:53'),
(460, 466, 5, 52, 'Grilled chicken yogurt sauce', 1, '2020-11-19 03:59:07'),
(461, 467, 5, 53, 'Chicken soup with red rice', 1, '2020-11-19 03:59:20'),
(462, 468, 5, 54, 'Grillet fish pesto sauce with aglio olio', 1, '2020-11-19 03:59:34'),
(463, 469, 5, 55, 'Chicken roulade with avocado salad', 1, '2020-11-19 03:59:51'),
(464, 470, 5, 56, 'Chicken penne tomato cream sauce', 1, '2020-11-19 04:00:05'),
(465, 471, 5, 57, 'Sauteed mix mushroom oyster sauce', 1, '2020-11-19 04:00:15'),
(466, 472, 5, 56, 'Chicken penne tomato cream sauce', 1, '2020-11-19 04:00:49'),
(467, 473, 5, 57, 'Sauteed mix mushroom oyster sauce', 1, '2020-11-19 04:01:02'),
(468, 474, 5, 54, 'Grillet fish pesto sauce with aglio olio', 1, '2020-11-19 04:01:15'),
(469, 475, 5, 55, 'Chicken roulade with avocado salad', 1, '2020-11-19 04:01:28'),
(470, 476, 5, 52, 'Grilled chicken yogurt sauce', 1, '2020-11-19 04:01:46'),
(471, 477, 5, 53, 'Chicken soup with red rice', 1, '2020-11-19 04:02:03'),
(472, 478, 5, 50, 'Chicken basil lettuce wrap', 1, '2020-11-19 04:02:19'),
(473, 479, 5, 51, 'Fish fillet with aioli sauce', 1, '2020-11-19 04:02:40'),
(475, 481, 5, 57, 'Sauteed mix mushroom oyster sauce', 1, '2020-11-19 04:04:05'),
(476, 482, 5, 53, 'Chicken soup with red rice', 1, '2020-11-19 04:04:21'),
(477, 483, 5, 51, 'Fish fillet with aioli sauce', 1, '2020-11-19 04:04:37'),
(478, 484, 5, 48, 'Beef black pepper', 1, '2020-11-21 00:38:34'),
(479, 485, 5, 50, 'Chicken basil lettuce wrap', 1, '2020-11-21 00:39:24'),
(480, 486, 5, 52, 'Grilled chicken yogurt sauce', 1, '2020-11-21 00:39:59'),
(481, 487, 5, 54, 'Grillet fish pesto sauce with aglio olio', 1, '2020-11-21 00:40:34'),
(482, 488, 5, 56, 'Chicken penne tomato cream sauce', 1, '2020-11-21 00:41:05'),
(483, 489, 5, 48, 'Beef black pepper', 1, '2020-11-21 02:48:44'),
(484, 490, 5, 50, 'Chicken basil lettuce wrap', 1, '2020-11-21 02:49:20'),
(485, 491, 5, 52, 'Grilled chicken yogurt sauce', 1, '2020-11-21 02:49:58'),
(486, 492, 5, 54, 'Grillet fish pesto sauce with aglio olio', 1, '2020-11-21 02:50:25'),
(487, 493, 5, 56, 'Chicken penne tomato cream sauce', 1, '2020-11-21 02:50:59'),
(488, 494, 5, 63, 'Chicken blackpepper', 1, '2020-11-21 03:24:31'),
(489, 495, 5, 48, 'Beef black pepper', 1, '2020-11-21 03:25:00'),
(490, 496, 5, 49, 'Spaghetti marinara with grilled fish', 1, '2020-11-21 03:25:14'),
(491, 497, 5, 50, 'Chicken basil lettuce wrap', 1, '2020-11-21 03:25:34'),
(492, 498, 5, 52, 'Grilled chicken yogurt sauce', 1, '2020-11-21 03:26:36'),
(493, 499, 5, 54, 'Grillet fish pesto sauce with aglio olio', 1, '2020-11-21 03:27:02'),
(494, 500, 5, 56, 'Chicken penne tomato cream sauce', 1, '2020-11-21 03:27:48'),
(495, 501, 5, 48, 'Beef black pepper', 1, '2020-11-21 03:36:11'),
(496, 502, 5, 50, 'Chicken basil lettuce wrap', 1, '2020-11-21 03:36:38'),
(497, 503, 5, 52, 'Grilled chicken yogurt sauce', 1, '2020-11-21 03:37:00'),
(498, 504, 5, 54, 'Grillet fish pesto sauce with aglio olio', 1, '2020-11-21 03:37:38'),
(499, 505, 5, 56, 'Chicken penne tomato cream sauce', 1, '2020-11-21 03:38:18'),
(500, 506, 5, 48, 'Beef black pepper', 1, '2020-11-21 05:33:12'),
(501, 507, 5, 50, 'Chicken basil lettuce wrap', 1, '2020-11-21 05:33:27'),
(502, 508, 5, 52, 'Grilled chicken yogurt sauce', 1, '2020-11-21 05:33:53'),
(503, 509, 5, 54, 'Grillet fish pesto sauce with aglio olio', 1, '2020-11-21 05:34:23'),
(504, 510, 5, 56, 'Chicken penne tomato cream sauce', 1, '2020-11-21 05:35:09'),
(505, 511, 5, 48, 'Beef black pepper', 1, '2020-11-21 10:17:18'),
(506, 512, 5, 48, 'Beef black pepper', 1, '2020-11-21 10:18:22'),
(507, 513, 5, 48, 'Beef black pepper', 1, '2020-11-21 10:38:03'),
(508, 514, 5, 49, 'Spaghetti marinara with grilled fish', 2, '2020-11-21 10:38:18'),
(509, 515, 5, 50, 'Chicken basil lettuce wrap', 1, '2020-11-21 10:38:33'),
(510, 516, 5, 51, 'Fish fillet with aioli sauce', 2, '2020-11-21 10:38:57'),
(511, 517, 5, 52, 'Grilled chicken yogurt sauce', 1, '2020-11-21 10:39:30'),
(512, 518, 5, 53, 'Chicken soup with red rice', 2, '2020-11-21 10:39:55'),
(513, 519, 5, 54, 'Grillet fish pesto sauce with aglio olio', 1, '2020-11-21 10:40:16'),
(514, 520, 5, 55, 'Chicken roulade with avocado salad', 2, '2020-11-21 10:40:36'),
(515, 521, 5, 57, 'Sauteed mix mushroom oyster sauce', 2, '2020-11-21 10:41:07'),
(516, 522, 5, 56, 'Chicken penne tomato cream sauce', 1, '2020-11-21 10:41:37'),
(517, 523, 5, 48, 'Beef black pepper', 1, '2020-11-21 10:43:05'),
(518, 524, 5, 50, 'Chicken basil lettuce wrap', 1, '2020-11-21 10:46:36'),
(519, 525, 5, 52, 'Grilled chicken yogurt sauce', 1, '2020-11-21 10:47:14'),
(520, 526, 5, 54, 'Grillet fish pesto sauce with aglio olio', 1, '2020-11-21 10:47:57'),
(521, 527, 5, 56, 'Chicken penne tomato cream sauce', 1, '2020-11-21 10:48:48'),
(522, 528, 5, 48, 'Beef black pepper', 1, '2020-11-21 11:16:06'),
(523, 529, 5, 49, 'Spaghetti marinara with grilled fish', 1, '2020-11-21 11:16:33'),
(524, 530, 5, 50, 'Chicken basil lettuce wrap', 1, '2020-11-21 11:16:52'),
(525, 531, 5, 51, 'Fish fillet with aioli sauce', 1, '2020-11-21 11:17:18'),
(526, 532, 5, 52, 'Grilled chicken yogurt sauce', 1, '2020-11-21 11:18:00'),
(527, 533, 5, 53, 'Chicken soup with red rice', 1, '2020-11-21 11:18:33'),
(528, 534, 5, 54, 'Grillet fish pesto sauce with aglio olio', 1, '2020-11-21 11:18:55'),
(529, 535, 5, 55, 'Chicken roulade with avocado salad', 1, '2020-11-21 11:19:38'),
(530, 536, 5, 57, 'Sauteed mix mushroom oyster sauce', 1, '2020-11-21 11:20:00'),
(531, 537, 5, 56, 'Chicken penne tomato cream sauce', 1, '2020-11-21 11:20:27'),
(532, 538, 5, 49, 'Spaghetti marinara with grilled fish', 1, '2020-11-21 11:31:31'),
(533, 539, 5, 50, 'Chicken basil lettuce wrap', 1, '2020-11-21 11:31:59'),
(534, 540, 5, 52, 'Grilled chicken yogurt sauce', 1, '2020-11-21 11:32:24'),
(535, 541, 5, 54, 'Grillet fish pesto sauce with aglio olio', 1, '2020-11-21 11:33:12'),
(536, 542, 5, 56, 'Chicken penne tomato cream sauce', 1, '2020-11-21 11:33:28'),
(537, 543, 5, 48, 'Beef black pepper', 1, '2020-11-21 11:45:05'),
(538, 544, 5, 49, 'Spaghetti marinara with grilled fish', 1, '2020-11-21 11:45:20'),
(539, 545, 5, 50, 'Chicken basil lettuce wrap', 1, '2020-11-21 11:46:20'),
(540, 546, 5, 51, 'Fish fillet with aioli sauce', 1, '2020-11-21 11:46:40'),
(541, 547, 5, 57, 'Sauteed mix mushroom oyster sauce', 1, '2020-11-21 11:47:00'),
(542, 548, 5, 56, 'Chicken penne tomato cream sauce', 1, '2020-11-21 11:47:51'),
(543, 549, 5, 55, 'Chicken roulade with avocado salad', 1, '2020-11-21 11:48:36'),
(544, 550, 5, 54, 'Grillet fish pesto sauce with aglio olio', 1, '2020-11-21 11:49:00'),
(545, 551, 5, 53, 'Chicken soup with red rice', 1, '2020-11-21 11:49:34'),
(546, 552, 5, 52, 'Grilled chicken yogurt sauce', 1, '2020-11-21 11:50:03'),
(550, 556, 7, 64, 'San Choy Bow', 1, '2020-11-22 04:57:42'),
(551, 557, 7, 64, 'San Choy Bow', 1, '2020-11-22 04:57:47'),
(552, 558, 7, 64, 'San Choy Bow', 1, '2020-11-22 04:57:53'),
(553, 559, 5, 49, 'Spaghetti marinara with grilled fish', 1, '2020-11-22 08:47:24'),
(554, 560, 5, 51, 'Fish fillet with aioli sauce', 1, '2020-11-22 09:01:47'),
(555, 561, 5, 53, 'Chicken soup with red rice', 1, '2020-11-22 09:02:14'),
(556, 562, 5, 55, 'Chicken roulade with avocado salad', 1, '2020-11-22 09:03:15'),
(557, 563, 5, 57, 'Sauteed mix mushroom oyster sauce', 1, '2020-11-22 09:03:56'),
(558, 564, 5, 52, 'Grilled chicken yogurt sauce', 1, '2020-11-23 09:37:34'),
(559, 565, 5, 54, 'Grillet fish pesto sauce with aglio olio', 1, '2020-11-23 09:38:18'),
(560, 566, 5, 56, 'Chicken penne tomato cream sauce', 1, '2020-11-23 09:39:10'),
(561, 567, 5, 54, 'Grillet fish pesto sauce with aglio olio', 1, '2020-11-24 17:26:55'),
(562, 568, 5, 55, 'Chicken roulade with avocado salad', 2, '2020-11-24 17:27:24'),
(563, 569, 5, 56, 'Chicken penne tomato cream sauce', 1, '2020-11-24 17:28:42'),
(564, 570, 5, 57, 'Sauteed mix mushroom oyster sauce', 2, '2020-11-24 17:29:07'),
(565, 571, 5, 59, 'Vegetable kung pao', 1, '2020-11-25 00:46:30'),
(566, 572, 6, 66, 'Steamed fish with jacket potato', 1, '2020-11-29 03:47:57'),
(567, 573, 6, 66, 'Steamed fish with jacket potato', 1, '2020-11-29 03:48:32'),
(568, 574, 6, 66, 'Steamed fish with jacket potato', 1, '2020-11-29 03:48:50'),
(569, 575, 6, 66, 'Steamed fish with jacket potato', 1, '2020-11-29 03:49:54'),
(570, 576, 6, 66, 'Steamed fish with jacket potato', 1, '2020-11-29 03:50:26'),
(572, 578, 6, 66, 'Steamed fish with jacket potato', 1, '2020-11-29 03:51:38'),
(573, 579, 6, 66, 'Steamed fish with jacket potato', 1, '2020-11-29 04:00:03'),
(574, 580, 6, 66, 'Steamed fish with jacket potato', 1, '2020-11-29 04:00:19'),
(575, 581, 6, 66, 'Steamed fish with jacket potato', 1, '2020-11-29 04:00:39'),
(576, 582, 6, 66, 'Steamed fish with jacket potato', 1, '2020-11-29 04:00:59'),
(577, 583, 6, 66, 'Steamed fish with jacket potato', 1, '2020-11-29 04:06:59'),
(578, 584, 6, 67, 'Waldrof salad with sandwich vege mayo', 2, '2020-11-29 04:07:19'),
(579, 585, 6, 67, 'Waldrof salad with sandwich vege mayo', 1, '2020-11-29 04:07:54'),
(580, 586, 6, 67, 'Waldrof salad with sandwich vege mayo', 1, '2020-11-29 04:08:30'),
(581, 587, 6, 67, 'Waldrof salad with sandwich vege mayo', 1, '2020-11-29 04:08:46'),
(582, 588, 6, 67, 'Waldrof salad with sandwich vege mayo', 1, '2020-11-29 04:10:17'),
(583, 589, 6, 67, 'Waldrof salad with sandwich vege mayo', 1, '2020-11-29 04:10:36'),
(584, 590, 6, 67, 'Waldrof salad with sandwich vege mayo', 1, '2020-11-29 08:28:25'),
(585, 591, 6, 67, 'Waldrof salad with sandwich vege mayo', 1, '2020-11-29 08:28:39'),
(586, 592, 6, 66, 'Steamed fish with jacket potato', 1, '2020-11-29 08:28:52'),
(587, 593, 6, 66, 'Steamed fish with jacket potato', 1, '2020-11-29 08:31:50'),
(588, 594, 6, 66, 'Steamed fish with jacket potato', 1, '2020-11-29 08:34:35'),
(590, 596, 6, 66, 'Steamed fish with jacket potato', 1, '2020-11-29 08:41:25'),
(591, 597, 6, 67, 'Waldrof salad with sandwich vege mayo', 1, '2020-11-29 08:46:07'),
(592, 598, 6, 66, 'Steamed fish with jacket potato', 1, '2020-11-29 08:48:11'),
(593, 599, 6, 66, 'Steamed fish with jacket potato', 1, '2020-11-29 09:02:08'),
(594, 600, 6, 66, 'Steamed fish with jacket potato', 1, '2020-11-29 10:31:33'),
(595, 601, 6, 66, 'Steamed fish with jacket potato', 1, '2020-11-29 10:31:46'),
(596, 602, 6, 68, 'Chicken creamy gluten free zoodles', 1, '2020-11-29 23:15:15'),
(597, 603, 6, 70, 'Thai steamed fish fillet', 1, '2020-11-29 23:16:41'),
(598, 604, 6, 72, 'Chicken cordon bleu', 1, '2020-11-29 23:17:06'),
(599, 605, 6, 74, 'Beef edamame salad', 1, '2020-11-29 23:17:54'),
(600, 606, 6, 68, 'Chicken creamy gluten free zoodles', 1, '2020-11-29 23:18:42'),
(601, 607, 6, 70, 'Thai steamed fish fillet', 1, '2020-11-29 23:19:05'),
(602, 608, 6, 72, 'Chicken cordon bleu', 1, '2020-11-29 23:19:32'),
(603, 609, 6, 74, 'Beef edamame salad', 1, '2020-11-29 23:19:57'),
(604, 610, 6, 68, 'Chicken creamy gluten free zoodles', 1, '2020-11-29 23:20:41'),
(605, 611, 6, 70, 'Thai steamed fish fillet', 1, '2020-11-29 23:20:56'),
(606, 612, 6, 72, 'Chicken cordon bleu', 1, '2020-11-29 23:21:23'),
(607, 613, 6, 74, 'Beef edamame salad', 1, '2020-11-29 23:21:44'),
(608, 614, 6, 68, 'Chicken creamy gluten free zoodles', 1, '2020-11-29 23:22:07'),
(609, 615, 6, 70, 'Thai steamed fish fillet', 1, '2020-11-29 23:22:32'),
(610, 616, 6, 72, 'Chicken cordon bleu', 1, '2020-11-29 23:22:55'),
(611, 617, 6, 76, 'Chicken edamame salad', 1, '2020-11-29 23:23:17'),
(612, 618, 6, 69, 'Sweet and sour fish', 1, '2020-11-29 23:26:34'),
(613, 619, 6, 71, 'Spaghetti chicken mushroom stroganoff', 1, '2020-11-29 23:34:26'),
(614, 620, 6, 73, 'Honey garlic shrimp with padthai', 1, '2020-11-29 23:35:13'),
(615, 621, 6, 75, 'Chicken milanese', 1, '2020-11-29 23:35:30'),
(616, 622, 6, 68, 'Chicken creamy gluten free zoodles', 1, '2020-11-29 23:36:29'),
(617, 623, 6, 70, 'Thai steamed fish fillet', 1, '2020-11-29 23:37:19'),
(618, 624, 6, 72, 'Chicken cordon bleu', 1, '2020-11-29 23:37:46'),
(619, 625, 6, 76, 'Chicken edamame salad', 1, '2020-11-29 23:38:22'),
(620, 626, 6, 68, 'Chicken creamy gluten free zoodles', 1, '2020-11-29 23:39:44'),
(621, 627, 6, 70, 'Thai steamed fish fillet', 1, '2020-11-29 23:40:10'),
(622, 628, 6, 72, 'Chicken cordon bleu', 1, '2020-11-29 23:40:32'),
(623, 629, 6, 74, 'Beef edamame salad', 1, '2020-11-29 23:40:54'),
(628, 634, 6, 68, 'Chicken creamy gluten free zoodles', 1, '2020-11-29 23:44:02'),
(629, 635, 6, 70, 'Thai steamed fish fillet', 1, '2020-11-29 23:44:19'),
(630, 636, 6, 72, 'Chicken cordon bleu', 1, '2020-11-29 23:45:02'),
(631, 637, 6, 74, 'Beef edamame salad', 1, '2020-11-29 23:45:46'),
(632, 638, 6, 74, 'Beef edamame salad', 1, '2020-11-29 23:46:17'),
(633, 639, 6, 72, 'Chicken cordon bleu', 1, '2020-11-29 23:46:44'),
(634, 640, 6, 70, 'Thai steamed fish fillet', 1, '2020-11-29 23:52:28'),
(635, 641, 6, 68, 'Chicken creamy gluten free zoodles', 1, '2020-11-29 23:52:56'),
(636, 642, 6, 68, 'Chicken creamy gluten free zoodles', 1, '2020-11-29 23:53:40'),
(637, 643, 6, 69, 'Sweet and sour fish', 1, '2020-11-29 23:54:01'),
(638, 644, 6, 71, 'Spaghetti chicken mushroom stroganoff', 1, '2020-11-29 23:54:23'),
(639, 645, 6, 73, 'Honey garlic shrimp with padthai', 1, '2020-11-29 23:54:42'),
(640, 646, 6, 75, 'Chicken milanese', 1, '2020-11-29 23:55:03'),
(641, 647, 6, 70, 'Thai steamed fish fillet', 1, '2020-11-29 23:56:15'),
(642, 648, 6, 72, 'Chicken cordon bleu', 1, '2020-11-29 23:58:27'),
(643, 649, 6, 74, 'Beef edamame salad', 1, '2020-11-29 23:58:58'),
(644, 650, 6, 74, 'Beef edamame salad', 1, '2020-11-30 00:00:02'),
(645, 651, 6, 72, 'Chicken cordon bleu', 1, '2020-11-30 00:00:31'),
(646, 652, 6, 70, 'Thai steamed fish fillet', 1, '2020-11-30 00:01:01'),
(647, 653, 6, 68, 'Chicken creamy gluten free zoodles', 1, '2020-11-30 00:01:18'),
(648, 654, 6, 76, 'Chicken edamame salad', 1, '2020-11-30 00:01:59'),
(649, 655, 6, 72, 'Chicken cordon bleu', 1, '2020-11-30 00:03:27'),
(650, 656, 6, 77, 'Spaghetti aglio olio', 1, '2020-11-30 00:19:13'),
(651, 657, 6, 68, 'Chicken creamy gluten free zoodles', 1, '2020-11-30 00:30:03'),
(652, 658, 6, 70, 'Thai steamed fish fillet', 1, '2020-11-30 00:31:03'),
(653, 659, 6, 72, 'Chicken cordon bleu', 1, '2020-11-30 00:31:51'),
(654, 660, 6, 74, 'Beef edamame salad', 1, '2020-11-30 00:32:19'),
(655, 661, 6, 68, 'Chicken creamy gluten free zoodles', 1, '2020-11-30 00:33:30'),
(657, 663, 6, 70, 'Thai steamed fish fillet', 1, '2020-11-30 00:35:19'),
(658, 664, 6, 73, 'Honey garlic shrimp with padthai', 1, '2020-11-30 00:36:10'),
(659, 665, 6, 75, 'Chicken milanese', 1, '2020-11-30 00:36:32'),
(660, 666, 6, 68, 'Chicken creamy gluten free zoodles', 1, '2020-11-30 01:02:20'),
(661, 667, 6, 70, 'Thai steamed fish fillet', 1, '2020-11-30 01:02:40'),
(662, 668, 6, 72, 'Chicken cordon bleu', 1, '2020-11-30 01:03:03'),
(663, 669, 6, 74, 'Beef edamame salad', 1, '2020-11-30 01:03:29'),
(664, 670, 6, 69, 'Sweet and sour fish', 1, '2020-11-30 01:04:45'),
(665, 671, 6, 71, 'Spaghetti chicken mushroom stroganoff', 1, '2020-11-30 01:05:42'),
(666, 672, 6, 73, 'Honey garlic shrimp with padthai', 1, '2020-11-30 01:06:02'),
(667, 673, 6, 75, 'Chicken milanese', 1, '2020-11-30 01:06:20'),
(668, 674, 6, 69, 'Sweet and sour fish', 2, '2020-11-30 01:07:23'),
(669, 675, 6, 68, 'Chicken creamy gluten free zoodles', 1, '2020-11-30 01:07:45'),
(670, 676, 6, 70, 'Thai steamed fish fillet', 1, '2020-11-30 01:08:06'),
(671, 677, 6, 71, 'Spaghetti chicken mushroom stroganoff', 2, '2020-11-30 01:08:31'),
(673, 679, 6, 68, 'Chicken creamy gluten free zoodles', 1, '2020-11-30 01:09:44'),
(674, 680, 6, 70, 'Thai steamed fish fillet', 1, '2020-11-30 01:10:03'),
(675, 681, 6, 72, 'Chicken cordon bleu', 1, '2020-11-30 01:10:26'),
(676, 682, 6, 74, 'Beef edamame salad', 1, '2020-11-30 01:10:58'),
(677, 683, 6, 68, 'Chicken creamy gluten free zoodles', 1, '2020-11-30 01:11:35'),
(678, 684, 6, 70, 'Thai steamed fish fillet', 1, '2020-11-30 01:11:58'),
(679, 685, 6, 72, 'Chicken cordon bleu', 1, '2020-11-30 01:13:05'),
(680, 686, 6, 74, 'Beef edamame salad', 1, '2020-11-30 01:14:01'),
(681, 687, 6, 68, 'Chicken creamy gluten free zoodles', 1, '2020-11-30 01:15:06'),
(682, 688, 6, 68, 'Chicken creamy gluten free zoodles', 1, '2020-11-30 01:15:49'),
(683, 689, 6, 70, 'Thai steamed fish fillet', 1, '2020-11-30 01:16:09'),
(684, 690, 6, 72, 'Chicken cordon bleu', 1, '2020-11-30 01:16:39'),
(685, 691, 6, 74, 'Beef edamame salad', 1, '2020-11-30 01:17:18'),
(686, 692, 6, 68, 'Chicken creamy gluten free zoodles', 1, '2020-11-30 01:17:50'),
(687, 693, 6, 69, 'Sweet and sour fish', 1, '2020-11-30 01:18:09'),
(688, 694, 6, 70, 'Thai steamed fish fillet', 1, '2020-11-30 01:18:34'),
(689, 695, 6, 71, 'Spaghetti chicken mushroom stroganoff', 1, '2020-11-30 01:19:01'),
(690, 696, 6, 72, 'Chicken cordon bleu', 1, '2020-11-30 01:19:38'),
(691, 697, 6, 73, 'Honey garlic shrimp with padthai', 1, '2020-11-30 01:20:04'),
(692, 698, 6, 74, 'Beef edamame salad', 1, '2020-11-30 01:20:34'),
(693, 699, 6, 75, 'Chicken milanese', 1, '2020-11-30 01:20:52'),
(694, 700, 6, 69, 'Sweet and sour fish', 1, '2020-11-30 01:21:35'),
(696, 702, 6, 71, 'Spaghetti chicken mushroom stroganoff', 1, '2020-11-30 01:22:23'),
(697, 703, 6, 73, 'Honey garlic shrimp with padthai', 1, '2020-11-30 01:22:56'),
(698, 704, 6, 75, 'Chicken milanese', 1, '2020-11-30 01:23:16'),
(699, 705, 6, 67, 'Waldrof salad with sandwich vege mayo', 2, '2020-11-30 02:23:11'),
(700, 706, 6, 68, 'Chicken creamy gluten free zoodles', 2, '2020-11-30 02:23:32'),
(701, 707, 6, 69, 'Sweet and sour fish', 2, '2020-11-30 02:24:07'),
(702, 708, 6, 70, 'Thai steamed fish fillet', 2, '2020-11-30 02:24:31'),
(703, 709, 6, 71, 'Spaghetti chicken mushroom stroganoff', 2, '2020-11-30 02:25:42'),
(704, 710, 6, 72, 'Chicken cordon bleu', 2, '2020-11-30 02:26:00'),
(705, 711, 6, 73, 'Honey garlic shrimp with padthai', 2, '2020-11-30 02:26:33'),
(706, 712, 6, 74, 'Beef edamame salad', 2, '2020-11-30 02:29:15'),
(707, 713, 6, 75, 'Chicken milanese', 2, '2020-11-30 02:29:41'),
(708, 714, 6, 69, 'Sweet and sour fish', 1, '2020-12-01 02:03:08'),
(709, 715, 6, 70, 'Thai steamed fish fillet', 1, '2020-12-01 02:14:35'),
(710, 716, 6, 72, 'Chicken cordon bleu', 1, '2020-12-01 02:16:36'),
(711, 717, 6, 74, 'Beef edamame salad', 1, '2020-12-01 02:17:37'),
(712, 718, 7, 64, 'San Choy Bow', 1, '2020-12-15 05:48:17'),
(713, 719, 7, 64, 'San Choy Bow', 1, '2020-12-15 05:50:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `catering_package`
--

CREATE TABLE `catering_package` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `price` varchar(15) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `catering_package`
--

INSERT INTO `catering_package` (`id`, `name`, `duration`, `price`, `is_active`, `created_time`) VALUES
(1, 'Weekly Lunch', '5 hari', '220000', 1, '2020-10-30 06:11:12'),
(2, 'Weekly Dinner', '5 Hari', '220000', 1, '2020-10-30 06:11:12'),
(3, 'Weekly Lunch + Dinner', '5 Hari', '395000', 1, '2020-10-30 06:12:38'),
(4, 'Monthly Lunch', '5 Hari x 4 Minggu', '795000', 1, '2020-10-30 06:12:38'),
(5, 'Monthly Dinner', '5 Hari x 4 Minggu', '795000', 1, '2020-10-30 06:13:28'),
(6, 'Monthly Lunch + Dinner', '5 Hari x 4 Minggu', '1450000', 1, '2020-10-30 06:13:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `day`
--

CREATE TABLE `day` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `day`
--

INSERT INTO `day` (`id`, `name`) VALUES
(1, 'Senin'),
(2, 'Selasa'),
(3, 'Rabu'),
(4, 'Kamis'),
(5, 'Jumat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `delivery_data`
--

CREATE TABLE `delivery_data` (
  `id` int(11) NOT NULL,
  `driver_name` varchar(50) DEFAULT NULL,
  `driver_phone` varchar(15) DEFAULT NULL,
  `num_delivery` int(11) DEFAULT NULL,
  `start_delivered` varchar(50) DEFAULT NULL,
  `end_delivered` varchar(50) DEFAULT NULL,
  `delivery_date` varchar(20) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `delivery_data`
--

INSERT INTO `delivery_data` (`id`, `driver_name`, `driver_phone`, `num_delivery`, `start_delivered`, `end_delivered`, `delivery_date`, `created_time`) VALUES
(64, 'Hanif', '08232323232', 6, '21-11-2020 06:07:16', '21-11-2020 08:14:25', '21-11-2020', '2020-11-20 02:07:16'),
(65, 'Hanif', '08235938243', 3, '21-11-2020 08:41:17', '-', '21-11-2020', '2020-11-20 04:41:17'),
(66, 'Hanif', '08235938243', 3, '21-11-2020 08:42:51', '-', '21-11-2020', '2020-11-20 04:42:51'),
(67, 'Hanif', '0823232', 3, '21-11-2020 12:42:07', '21-11-2020 13:29:44', '21-11-2020', '2020-11-20 08:42:07'),
(68, 'Hanif', '08236943345', 3, '21-11-2020 14:14:21', '-', '21-11-2020', '2020-11-20 10:14:21'),
(69, 'Hanif', '082369433456', 3, '21-11-2020 14:31:35', '-', '21-11-2020', '2020-11-20 10:31:35'),
(70, 'Hanif', '082369433456', 3, '21-11-2020 14:32:41', '-', '21-11-2020', '2020-11-20 10:32:41'),
(71, 'Hanif', '082369433456', 3, '21-11-2020 14:33:13', '-', '21-11-2020', '2020-11-20 10:33:13'),
(72, 'Hanif', '0809273232', 3, '21-11-2020 14:33:52', '-', '21-11-2020', '2020-11-20 10:33:52'),
(73, 'Hanif', '0809273232', 3, '21-11-2020 14:34:13', '-', '21-11-2020', '2020-11-20 10:34:13'),
(74, 'Hanif', '0809273232', 3, '21-11-2020 14:35:38', '-', '21-11-2020', '2020-11-20 10:35:38'),
(75, 'Hanif', '0809273232', 3, '21-11-2020 14:36:52', '-', '21-11-2020', '2020-11-20 10:36:52'),
(76, 'Hanif', '0809273232', 3, '21-11-2020 14:37:10', '-', '21-11-2020', '2020-11-20 10:37:10'),
(77, 'Hanif', '0809273232', 3, '21-11-2020 14:37:17', '-', '21-11-2020', '2020-11-20 10:37:17'),
(78, 'Hanif', '0809273232', 3, '21-11-2020 14:37:21', '-', '21-11-2020', '2020-11-20 10:37:21'),
(79, 'Hanif', '0809273232', 3, '21-11-2020 14:38:11', '-', '21-11-2020', '2020-11-20 10:38:11'),
(80, 'Hanif', '0809273232', 3, '21-11-2020 14:38:26', '-', '21-11-2020', '2020-11-20 10:38:26'),
(81, 'Hanif', '0809273232', 3, '21-11-2020 14:41:42', '-', '21-11-2020', '2020-11-20 10:41:42'),
(82, 'Hanif', '0809273232', 3, '21-11-2020 14:58:54', '-', '21-11-2020', '2020-11-20 10:58:54'),
(83, 'Hanif', '0809273232', 3, '21-11-2020 14:59:35', '-', '21-11-2020', '2020-11-20 10:59:35'),
(84, 'Hanif', '0809273232', 3, '21-11-2020 15:00:08', '-', '21-11-2020', '2020-11-20 11:00:08'),
(85, 'Hanif', '0809273232', 3, '21-11-2020 15:00:26', '-', '21-11-2020', '2020-11-20 11:00:26'),
(86, 'Hanif', '0809273232', 3, '21-11-2020 15:00:46', '-', '21-11-2020', '2020-11-20 11:00:46'),
(87, 'Hanif', '0809273232', 3, '21-11-2020 15:00:53', '-', '21-11-2020', '2020-11-20 11:00:53'),
(88, 'Hanif', '0809273232', 3, '21-11-2020 15:01:13', '-', '21-11-2020', '2020-11-20 11:01:13'),
(89, 'Hanif', '0809273232', 3, '21-11-2020 15:02:48', '-', '21-11-2020', '2020-11-20 11:02:48'),
(90, 'Hanif', '0809273232', 3, '21-11-2020 15:03:18', '-', '21-11-2020', '2020-11-20 11:03:18'),
(91, 'Hanif', '0809273232', 3, '21-11-2020 15:05:49', '-', '21-11-2020', '2020-11-20 11:05:49'),
(92, 'Hanif', '0809273232', 3, '21-11-2020 15:07:13', '-', '21-11-2020', '2020-11-20 11:07:13'),
(93, 'Hanif', '0809273232', 3, '21-11-2020 15:07:59', '-', '21-11-2020', '2020-11-20 11:07:59'),
(94, 'Hanif', '0809273232', 3, '21-11-2020 15:09:30', '-', '21-11-2020', '2020-11-20 11:09:30'),
(95, 'Hanif', '0809273232', 3, '21-11-2020 15:11:57', '-', '21-11-2020', '2020-11-20 11:11:57'),
(96, 'Hanif', '0809273232', 3, '21-11-2020 15:12:06', '-', '21-11-2020', '2020-11-20 11:12:06'),
(97, 'Hanif', '0809273232', 3, '21-11-2020 15:12:30', '-', '21-11-2020', '2020-11-20 11:12:30'),
(98, 'Hanif', '0809273232', 3, '21-11-2020 15:12:59', '-', '21-11-2020', '2020-11-20 11:12:59'),
(99, 'Hanif', '0809273232', 3, '21-11-2020 15:15:16', '-', '21-11-2020', '2020-11-20 11:15:16'),
(100, 'Hanif', '082323233', 3, '21-11-2020 15:22:41', '-', '21-11-2020', '2020-11-20 11:22:41'),
(101, 'Hanif', '082323233', 3, '21-11-2020 15:28:05', '-', '21-11-2020', '2020-11-20 11:28:05'),
(102, 'Hanif', '082323233', 3, '21-11-2020 15:39:35', '-', '21-11-2020', '2020-11-20 11:39:35'),
(103, 'Hanif', '0809273232', 3, '21-11-2020 15:39:40', '-', '21-11-2020', '2020-11-20 11:39:40'),
(104, 'Hanif', '0809273232', 3, '21-11-2020 15:44:17', '-', '21-11-2020', '2020-11-20 11:44:17'),
(105, 'Hanif', '0809273232', 3, '21-11-2020 16:13:14', '-', '21-11-2020', '2020-11-20 12:13:14'),
(106, 'Hanif', '0809273232', 3, '21-11-2020 16:13:49', '-', '21-11-2020', '2020-11-20 12:13:49'),
(107, 'Hanif', '0809273232', 3, '21-11-2020 16:14:17', '-', '21-11-2020', '2020-11-20 12:14:17'),
(108, 'Hanif', '0823769433456', 3, '21-11-2020 16:18:10', '-', '21-11-2020', '2020-11-20 12:18:10'),
(109, 'Hanif', '0823769433456', 3, '21-11-2020 16:20:29', '-', '21-11-2020', '2020-11-20 12:20:29'),
(110, 'Hanif', '0823769433456', 3, '21-11-2020 16:24:15', '-', '21-11-2020', '2020-11-20 12:24:15'),
(111, 'Hanif', '0823769433456', 3, '21-11-2020 16:24:31', '-', '21-11-2020', '2020-11-20 12:24:31'),
(112, 'Hanif', '0823769433456', 3, '21-11-2020 16:27:02', '-', '21-11-2020', '2020-11-20 12:27:02'),
(113, 'Hanif', '0823769433456', 3, '21-11-2020 16:27:29', '-', '21-11-2020', '2020-11-20 12:27:29'),
(114, 'Hanif', '0823769433456', 3, '21-11-2020 16:32:33', '-', '21-11-2020', '2020-11-20 12:32:33'),
(115, 'Hanif', '0823769433456', 3, '21-11-2020 16:32:36', '-', '21-11-2020', '2020-11-20 12:32:36'),
(116, 'Hanif', '0823769433456', 3, '21-11-2020 16:32:38', '-', '21-11-2020', '2020-11-20 12:32:38'),
(117, 'Hanif', '0823769433456', 3, '21-11-2020 16:35:58', '-', '21-11-2020', '2020-11-20 12:35:58'),
(118, 'Hanif', '0823769433456', 3, '21-11-2020 16:36:27', '-', '21-11-2020', '2020-11-20 12:36:27'),
(119, 'Hanif', '0823769433456', 3, '21-11-2020 16:39:54', '-', '21-11-2020', '2020-11-20 12:39:54'),
(120, 'Hanif', '0823769433456', 3, '21-11-2020 16:40:16', '-', '21-11-2020', '2020-11-20 12:40:16'),
(121, 'Hanif', '0823769433456', 3, '21-11-2020 16:40:58', '-', '21-11-2020', '2020-11-20 12:40:58'),
(122, 'Hanif', '0823769433456', 3, '21-11-2020 17:08:11', '21-11-2020 17:11:04', '21-11-2020', '2020-11-20 12:41:15'),
(123, 'Hanif', '082369544545', 3, '-', '-', '21-11-2020', '2020-11-20 13:17:50'),
(124, 'Hanif', '08236943434', 3, '22-11-2020 10:33:49', '22-11-2020 05:37:34', '22-11-2020', '2020-11-21 01:18:29'),
(125, 'hanif', '082369433456', 3, '22-11-2020 08:36:15', '22-11-2020 08:39:07', '22-11-2020', '2020-11-21 04:35:00'),
(126, 'hanif', '08232322323', 3, '22-11-2020 08:54:05', '22-11-2020 09:06:52', '22-11-2020', '2020-11-21 04:53:56'),
(127, 'Hanif', '082323232', 3, '22-11-2020 09:17:53', '22-11-2020 10:28:10', '22-11-2020', '2020-11-21 05:17:45'),
(128, 'Hanif', '082323232', 3, '-', '-', '22-11-2020', '2020-11-21 09:05:19'),
(129, 'Hanif', '082369433456', 3, '23-11-2020 05:18:27', '23-11-2020 05:19:41', '23-11-2020', '2020-11-22 01:18:16'),
(130, 'Sutan', '08236373748', 3, '23-11-2020 09:07:05', '23-11-2020 09:09:29', '23-11-2020', '2020-11-22 05:06:29'),
(131, 'Sutan', '082363837434', 3, '23-11-2020 09:30:32', '-', '23-11-2020', '2020-11-22 05:30:05'),
(132, 'Sutan', '082364847473', 3, '23-11-2020 09:32:11', '23-11-2020 09:33:41', '23-11-2020', '2020-11-22 05:31:50'),
(133, 'Sutan', '08237373738', 3, '23-11-2020 09:35:38', '23-11-2020 09:39:04', '23-11-2020', '2020-11-22 05:35:26'),
(134, 'Hanif', '08232323232', 3, '23-11-2020 09:36:32', '23-11-2020 09:37:56', '23-11-2020', '2020-11-22 05:36:29'),
(135, 'hanif', '0823232323', 3, '23-11-2020 09:40:35', '23-11-2020 09:44:06', '23-11-2020', '2020-11-22 05:39:54'),
(136, 'hanif', '0923823232', 3, '23-11-2020 09:46:52', '23-11-2020 09:47:29', '23-11-2020', '2020-11-22 05:45:57'),
(137, 'Sutan', '08236363737', 3, '23-11-2020 10:15:43', '-', '23-11-2020', '2020-11-22 06:14:56'),
(138, 'Sutan', '08273636373', 3, '23-11-2020 10:18:02', '23-11-2020 10:18:59', '23-11-2020', '2020-11-22 06:17:32'),
(139, 'Sutan', '082360789162', 10, '23-11-2020 11:07:56', '23-11-2020 11:07:47', '23-11-2020', '2020-11-22 06:56:37'),
(140, 'Feldy helmisyah', '08984875432', 10, '23-11-2020 11:00:53', '23-11-2020 11:23:37', '23-11-2020', '2020-11-22 07:00:44'),
(141, 'Sutan', '082360789162', 10, '-', '23-11-2020 11:14:16', '23-11-2020', '2020-11-22 07:13:59'),
(142, 'Sutan', '082360789162', 10, '23-11-2020 11:00:53', '23-11-2020 12:29:55', '23-11-2020', '2020-11-22 07:14:54'),
(143, 'Hanif', '0823737373', 10, '-', '-', '23-11-2020', '2020-11-22 09:36:08'),
(144, 'Hanif', '082369473637', 10, '-', '-', '23-11-2020', '2020-11-22 09:42:16'),
(145, 'Hanif', '082369433456', 3, '25-11-2020 09:36:42', '25-11-2020 09:38:28', '25-11-2020', '2020-11-24 12:36:22'),
(146, 'hanif', '08273636', 8, '-', '-', '26-11-2020', '2020-11-25 10:08:49'),
(147, 'Sutan', '082360789162', 9, '-', '-', '26-11-2020', '2020-11-25 13:37:21'),
(148, 'Sutan', '082360789162', 9, '-', '-', '26-11-2020', '2020-11-25 13:37:55'),
(149, 'Sutan', '082360789162', 9, '-', '26-11-2020 11:51:11', '26-11-2020', '2020-11-25 13:38:02'),
(150, 'Feldi', '08984875432', 8, '-', '-', '26-11-2020', '2020-11-25 13:38:57'),
(151, 'Feldi', '08984875432', 8, '-', '26-11-2020 12:04:38', '26-11-2020', '2020-11-25 13:39:51'),
(152, 'Feldy', '08984875432', 6, '-', '-', '26-11-2020', '2020-11-25 20:34:19'),
(153, 'Feldy', '0895475432', 6, '-', '-', '26-11-2020', '2020-11-25 20:40:04'),
(154, 'Feldy', '08984875432', 6, '26-11-2020 18:06:09', '26-11-2020 18:07:26', '26-11-2020', '2020-11-25 21:05:29'),
(155, 'Sutan', '082360789162', 8, '27-11-2020 11:17:03', '-', '27-11-2020', '2020-11-26 20:40:25'),
(156, 'Sutan', '082360789162', 8, '-', '-', '27-11-2020', '2020-11-26 20:41:47'),
(157, 'Feldi', '08984875432', 8, '-', '-', '27-11-2020', '2020-11-26 20:51:22'),
(158, 'Feldi', '', 8, '27-11-2020 10:52:58', '-', '27-11-2020', '2020-11-26 20:52:58'),
(159, 'Feldy helmisyah', '08984875432', 7, '-', '-', '30-11-2020', '2020-11-29 22:00:16'),
(160, 'Feldy helmisyah', '08984875432', 7, '-', '30-11-2020 13:39:26', '30-11-2020', '2020-11-29 22:00:37'),
(161, 'Feldy', '08984875342', 7, '-', '30-11-2020 18:30:20', '30-11-2020', '2020-11-30 03:08:23'),
(162, 'feldi', '08984875432', 7, '-', '-', '30-11-2020', '2020-11-30 03:10:31'),
(163, 'Feldy helmisyah', '08984875432', 8, '01-12-2020 11:07:58', '01-12-2020 12:38:54', '01-12-2020', '2020-11-30 20:55:31'),
(164, 'Feldi', '08984875432', 8, '-', '-', '01-12-2020', '2020-11-30 21:02:14'),
(165, 'Sutan', '082360789162', 7, '-', '-', '01-12-2020', '2020-11-30 21:02:30'),
(166, 'Sutan', '082360789162', 7, '-', '-', '01-12-2020', '2020-11-30 21:10:38'),
(167, 'Sutan', '082360789162', 7, '-', '-', '01-12-2020', '2020-11-30 21:12:46'),
(168, 'Feldi', '08984875432', 4, '-', '-', '01-12-2020', '2020-12-01 03:07:12'),
(169, 'Sutan', '082360789162', 5, '01-12-2020 17:15:23', '-', '01-12-2020', '2020-12-01 03:15:09'),
(170, 'Sutan', '082360789162', 5, '-', '-', '01-12-2020', '2020-12-01 03:15:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `delivery_point`
--

CREATE TABLE `delivery_point` (
  `id` int(11) NOT NULL,
  `catering_order_detail_id` int(11) DEFAULT NULL,
  `delivery_data_id` int(11) DEFAULT NULL,
  `delivery_time` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `status` double DEFAULT '0',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `delivery_point`
--

INSERT INTO `delivery_point` (`id`, `catering_order_detail_id`, `delivery_data_id`, `delivery_time`, `position`, `status`, `created_time`, `updated_time`) VALUES
(78, 78, 64, NULL, 1, 1, '2020-11-20 02:07:16', NULL),
(79, 74, 64, NULL, 0, 1, '2020-11-20 02:07:16', NULL),
(80, 71, 64, NULL, 2, 1, '2020-11-20 02:07:16', NULL),
(81, 62, 64, NULL, 3, 1, '2020-11-20 02:07:16', NULL),
(82, 59, 64, NULL, 4, 1, '2020-11-20 02:07:16', NULL),
(83, 67, 64, NULL, 5, 1, '2020-11-20 02:07:16', NULL),
(84, 255, 65, NULL, 0, 0, '2020-11-20 04:41:17', NULL),
(85, 256, 65, NULL, 1, 0, '2020-11-20 04:41:17', NULL),
(86, 257, 65, NULL, 2, 0, '2020-11-20 04:41:17', NULL),
(87, 255, 66, NULL, 0, 0, '2020-11-20 04:42:51', NULL),
(88, 256, 66, NULL, 1, 0, '2020-11-20 04:42:51', NULL),
(89, 257, 66, NULL, 2, 0, '2020-11-20 04:42:51', NULL),
(90, 258, 67, NULL, 0, 1, '2020-11-20 08:42:07', NULL),
(91, 260, 67, NULL, 1, 1, '2020-11-20 08:42:07', NULL),
(92, 259, 67, NULL, 2, 1, '2020-11-20 08:42:07', NULL),
(93, 258, 68, NULL, 0, 0, '2020-11-20 10:14:21', NULL),
(94, 260, 68, NULL, 1, 0, '2020-11-20 10:14:21', NULL),
(95, 259, 68, NULL, 2, 0, '2020-11-20 10:14:21', NULL),
(96, 258, 69, NULL, 0, 0, '2020-11-20 10:31:37', NULL),
(97, 260, 69, NULL, 1, 0, '2020-11-20 10:31:37', NULL),
(98, 259, 69, NULL, 2, 0, '2020-11-20 10:31:37', NULL),
(99, 258, 70, NULL, 0, 0, '2020-11-20 10:32:41', NULL),
(100, 260, 70, NULL, 1, 0, '2020-11-20 10:32:41', NULL),
(101, 259, 70, NULL, 2, 0, '2020-11-20 10:32:41', NULL),
(102, 258, 71, NULL, 0, 0, '2020-11-20 10:33:13', NULL),
(103, 260, 71, NULL, 1, 0, '2020-11-20 10:33:13', NULL),
(104, 259, 71, NULL, 2, 0, '2020-11-20 10:33:13', NULL),
(105, 258, 72, NULL, 0, 0, '2020-11-20 10:33:52', NULL),
(106, 260, 72, NULL, 1, 0, '2020-11-20 10:33:52', NULL),
(107, 259, 72, NULL, 2, 0, '2020-11-20 10:33:52', NULL),
(108, 258, 73, NULL, 0, 0, '2020-11-20 10:34:13', NULL),
(109, 260, 73, NULL, 1, 0, '2020-11-20 10:34:13', NULL),
(110, 259, 73, NULL, 2, 0, '2020-11-20 10:34:13', NULL),
(111, 258, 74, NULL, 0, 0, '2020-11-20 10:35:38', NULL),
(112, 260, 74, NULL, 1, 0, '2020-11-20 10:35:38', NULL),
(113, 259, 74, NULL, 2, 0, '2020-11-20 10:35:38', NULL),
(114, 258, 75, NULL, 0, 0, '2020-11-20 10:36:52', NULL),
(115, 260, 75, NULL, 1, 0, '2020-11-20 10:36:52', NULL),
(116, 259, 75, NULL, 2, 0, '2020-11-20 10:36:52', NULL),
(117, 258, 76, NULL, 0, 0, '2020-11-20 10:37:10', NULL),
(118, 260, 76, NULL, 1, 0, '2020-11-20 10:37:10', NULL),
(119, 259, 76, NULL, 2, 0, '2020-11-20 10:37:10', NULL),
(120, 258, 77, NULL, 0, 0, '2020-11-20 10:37:17', NULL),
(121, 260, 77, NULL, 1, 0, '2020-11-20 10:37:17', NULL),
(122, 259, 77, NULL, 2, 0, '2020-11-20 10:37:17', NULL),
(123, 258, 78, NULL, 0, 0, '2020-11-20 10:37:21', NULL),
(124, 260, 78, NULL, 1, 0, '2020-11-20 10:37:21', NULL),
(125, 259, 78, NULL, 2, 0, '2020-11-20 10:37:21', NULL),
(126, 258, 79, NULL, 0, 0, '2020-11-20 10:38:11', NULL),
(127, 260, 79, NULL, 1, 0, '2020-11-20 10:38:11', NULL),
(128, 259, 79, NULL, 2, 0, '2020-11-20 10:38:11', NULL),
(129, 258, 80, NULL, 0, 0, '2020-11-20 10:38:26', NULL),
(130, 260, 80, NULL, 1, 0, '2020-11-20 10:38:26', NULL),
(131, 259, 80, NULL, 2, 0, '2020-11-20 10:38:26', NULL),
(132, 258, 81, NULL, 0, 0, '2020-11-20 10:41:42', NULL),
(133, 260, 81, NULL, 1, 0, '2020-11-20 10:41:42', NULL),
(134, 259, 81, NULL, 2, 0, '2020-11-20 10:41:42', NULL),
(135, 258, 82, NULL, 0, 0, '2020-11-20 10:58:54', NULL),
(136, 260, 82, NULL, 1, 0, '2020-11-20 10:58:54', NULL),
(137, 259, 82, NULL, 2, 0, '2020-11-20 10:58:54', NULL),
(138, 258, 83, NULL, 0, 0, '2020-11-20 10:59:35', NULL),
(139, 260, 83, NULL, 1, 0, '2020-11-20 10:59:35', NULL),
(140, 259, 83, NULL, 2, 0, '2020-11-20 10:59:35', NULL),
(141, 258, 84, NULL, 0, 0, '2020-11-20 11:00:08', NULL),
(142, 260, 84, NULL, 1, 0, '2020-11-20 11:00:08', NULL),
(143, 259, 84, NULL, 2, 0, '2020-11-20 11:00:08', NULL),
(144, 258, 85, NULL, 0, 0, '2020-11-20 11:00:26', NULL),
(145, 260, 85, NULL, 1, 0, '2020-11-20 11:00:26', NULL),
(146, 259, 85, NULL, 2, 0, '2020-11-20 11:00:26', NULL),
(147, 258, 86, NULL, 0, 0, '2020-11-20 11:00:46', NULL),
(148, 260, 86, NULL, 1, 0, '2020-11-20 11:00:46', NULL),
(149, 259, 86, NULL, 2, 0, '2020-11-20 11:00:46', NULL),
(150, 258, 87, NULL, 0, 0, '2020-11-20 11:00:53', NULL),
(151, 260, 87, NULL, 1, 0, '2020-11-20 11:00:53', NULL),
(152, 259, 87, NULL, 2, 0, '2020-11-20 11:00:53', NULL),
(153, 258, 88, NULL, 0, 0, '2020-11-20 11:01:13', NULL),
(154, 260, 88, NULL, 1, 0, '2020-11-20 11:01:13', NULL),
(155, 259, 88, NULL, 2, 0, '2020-11-20 11:01:13', NULL),
(156, 258, 89, NULL, 0, 0, '2020-11-20 11:02:48', NULL),
(157, 260, 89, NULL, 1, 0, '2020-11-20 11:02:48', NULL),
(158, 259, 89, NULL, 2, 0, '2020-11-20 11:02:48', NULL),
(159, 258, 90, NULL, 0, 0, '2020-11-20 11:03:18', NULL),
(160, 260, 90, NULL, 1, 0, '2020-11-20 11:03:18', NULL),
(161, 259, 90, NULL, 2, 0, '2020-11-20 11:03:18', NULL),
(162, 258, 91, NULL, 0, 0, '2020-11-20 11:05:49', NULL),
(163, 260, 91, NULL, 1, 0, '2020-11-20 11:05:49', NULL),
(164, 259, 91, NULL, 2, 0, '2020-11-20 11:05:49', NULL),
(165, 258, 92, NULL, 0, 0, '2020-11-20 11:07:13', NULL),
(166, 260, 92, NULL, 1, 0, '2020-11-20 11:07:13', NULL),
(167, 259, 92, NULL, 2, 0, '2020-11-20 11:07:13', NULL),
(168, 258, 93, NULL, 0, 0, '2020-11-20 11:07:59', NULL),
(169, 260, 93, NULL, 1, 0, '2020-11-20 11:07:59', NULL),
(170, 259, 93, NULL, 2, 0, '2020-11-20 11:07:59', NULL),
(171, 258, 94, NULL, 0, 0, '2020-11-20 11:09:30', NULL),
(172, 260, 94, NULL, 1, 0, '2020-11-20 11:09:30', NULL),
(173, 259, 94, NULL, 2, 0, '2020-11-20 11:09:30', NULL),
(174, 258, 95, NULL, 0, 0, '2020-11-20 11:11:57', NULL),
(175, 260, 95, NULL, 1, 0, '2020-11-20 11:11:57', NULL),
(176, 259, 95, NULL, 2, 0, '2020-11-20 11:11:57', NULL),
(177, 258, 96, NULL, 0, 0, '2020-11-20 11:12:06', NULL),
(178, 260, 96, NULL, 1, 0, '2020-11-20 11:12:06', NULL),
(179, 259, 96, NULL, 2, 0, '2020-11-20 11:12:06', NULL),
(180, 258, 97, NULL, 0, 0, '2020-11-20 11:12:30', NULL),
(181, 260, 97, NULL, 1, 0, '2020-11-20 11:12:30', NULL),
(182, 259, 97, NULL, 2, 0, '2020-11-20 11:12:30', NULL),
(183, 258, 98, NULL, 0, 0, '2020-11-20 11:12:59', NULL),
(184, 260, 98, NULL, 1, 0, '2020-11-20 11:12:59', NULL),
(185, 259, 98, NULL, 2, 0, '2020-11-20 11:12:59', NULL),
(186, 258, 99, NULL, 0, 0, '2020-11-20 11:15:16', NULL),
(187, 260, 99, NULL, 1, 0, '2020-11-20 11:15:16', NULL),
(188, 259, 99, NULL, 2, 0, '2020-11-20 11:15:16', NULL),
(189, 258, 100, NULL, 0, 0, '2020-11-20 11:22:41', NULL),
(190, 260, 100, NULL, 1, 0, '2020-11-20 11:22:41', NULL),
(191, 259, 100, NULL, 2, 0, '2020-11-20 11:22:41', NULL),
(192, 258, 101, NULL, 0, 0, '2020-11-20 11:28:05', NULL),
(193, 260, 101, NULL, 1, 0, '2020-11-20 11:28:05', NULL),
(194, 259, 101, NULL, 2, 0, '2020-11-20 11:28:05', NULL),
(195, 258, 102, NULL, 0, 0, '2020-11-20 11:39:35', NULL),
(196, 260, 102, NULL, 1, 0, '2020-11-20 11:39:35', NULL),
(197, 259, 102, NULL, 2, 0, '2020-11-20 11:39:35', NULL),
(198, 258, 103, NULL, 0, 0, '2020-11-20 11:39:40', NULL),
(199, 260, 103, NULL, 1, 0, '2020-11-20 11:39:40', NULL),
(200, 259, 103, NULL, 2, 0, '2020-11-20 11:39:40', NULL),
(201, 258, 104, NULL, 0, 0, '2020-11-20 11:44:17', NULL),
(202, 260, 104, NULL, 1, 0, '2020-11-20 11:44:17', NULL),
(203, 259, 104, NULL, 2, 0, '2020-11-20 11:44:17', NULL),
(204, 258, 105, NULL, 0, 0, '2020-11-20 12:13:14', NULL),
(205, 260, 105, NULL, 1, 0, '2020-11-20 12:13:14', NULL),
(206, 259, 105, NULL, 2, 0, '2020-11-20 12:13:14', NULL),
(207, 258, 106, NULL, 0, 0, '2020-11-20 12:13:49', NULL),
(208, 260, 106, NULL, 1, 0, '2020-11-20 12:13:49', NULL),
(209, 259, 106, NULL, 2, 0, '2020-11-20 12:13:49', NULL),
(210, 258, 107, NULL, 0, 0, '2020-11-20 12:14:17', NULL),
(211, 260, 107, NULL, 1, 0, '2020-11-20 12:14:17', NULL),
(212, 259, 107, NULL, 2, 0, '2020-11-20 12:14:17', NULL),
(213, 259, 108, NULL, 0, 0, '2020-11-20 12:18:10', NULL),
(214, 260, 108, NULL, 2, 0, '2020-11-20 12:18:10', NULL),
(215, 258, 108, NULL, 1, 0, '2020-11-20 12:18:10', NULL),
(216, 259, 109, NULL, 0, 0, '2020-11-20 12:20:29', NULL),
(217, 260, 109, NULL, 2, 0, '2020-11-20 12:20:29', NULL),
(218, 258, 109, NULL, 1, 0, '2020-11-20 12:20:29', NULL),
(219, 259, 110, NULL, 0, 0, '2020-11-20 12:24:15', NULL),
(220, 260, 110, NULL, 2, 0, '2020-11-20 12:24:15', NULL),
(221, 258, 110, NULL, 1, 0, '2020-11-20 12:24:15', NULL),
(222, 259, 111, NULL, 0, 0, '2020-11-20 12:24:31', NULL),
(223, 260, 111, NULL, 2, 0, '2020-11-20 12:24:31', NULL),
(224, 258, 111, NULL, 1, 0, '2020-11-20 12:24:31', NULL),
(225, 259, 112, NULL, 0, 0, '2020-11-20 12:27:02', NULL),
(226, 260, 112, NULL, 2, 0, '2020-11-20 12:27:02', NULL),
(227, 258, 112, NULL, 1, 0, '2020-11-20 12:27:02', NULL),
(228, 259, 113, NULL, 0, 0, '2020-11-20 12:27:29', NULL),
(229, 260, 113, NULL, 2, 0, '2020-11-20 12:27:29', NULL),
(230, 258, 113, NULL, 1, 0, '2020-11-20 12:27:29', NULL),
(231, 259, 114, NULL, 0, 0, '2020-11-20 12:32:33', NULL),
(232, 260, 114, NULL, 2, 0, '2020-11-20 12:32:33', NULL),
(233, 258, 114, NULL, 1, 0, '2020-11-20 12:32:33', NULL),
(234, 259, 115, NULL, 0, 0, '2020-11-20 12:32:36', NULL),
(235, 260, 115, NULL, 2, 0, '2020-11-20 12:32:36', NULL),
(236, 258, 115, NULL, 1, 0, '2020-11-20 12:32:36', NULL),
(237, 259, 116, NULL, 0, 0, '2020-11-20 12:32:38', NULL),
(238, 260, 116, NULL, 2, 0, '2020-11-20 12:32:38', NULL),
(239, 258, 116, NULL, 1, 0, '2020-11-20 12:32:38', NULL),
(240, 259, 117, NULL, 0, 0, '2020-11-20 12:35:58', NULL),
(241, 260, 117, NULL, 2, 0, '2020-11-20 12:35:58', NULL),
(242, 258, 117, NULL, 1, 0, '2020-11-20 12:35:58', NULL),
(243, 259, 118, NULL, 0, 0, '2020-11-20 12:36:27', NULL),
(244, 260, 118, NULL, 2, 0, '2020-11-20 12:36:27', NULL),
(245, 258, 118, NULL, 1, 0, '2020-11-20 12:36:27', NULL),
(246, 259, 119, NULL, 0, 0, '2020-11-20 12:39:55', NULL),
(247, 260, 119, NULL, 2, 0, '2020-11-20 12:39:55', NULL),
(248, 258, 119, NULL, 1, 0, '2020-11-20 12:39:55', NULL),
(249, 259, 120, NULL, 0, 0, '2020-11-20 12:40:16', NULL),
(250, 260, 120, NULL, 2, 0, '2020-11-20 12:40:16', NULL),
(251, 258, 120, NULL, 1, 0, '2020-11-20 12:40:16', NULL),
(252, 259, 121, NULL, 0, 0, '2020-11-20 12:40:58', NULL),
(253, 260, 121, NULL, 2, 0, '2020-11-20 12:40:58', NULL),
(254, 258, 121, NULL, 1, 0, '2020-11-20 12:40:58', NULL),
(255, 259, 122, NULL, 0, 1, '2020-11-20 12:41:15', NULL),
(256, 260, 122, NULL, 2, 1, '2020-11-20 12:41:15', NULL),
(257, 258, 122, NULL, 1, 1, '2020-11-20 12:41:15', NULL),
(258, 260, 123, NULL, 1, 0, '2020-11-20 13:17:50', NULL),
(259, 259, 123, NULL, 2, 0, '2020-11-20 13:17:50', NULL),
(260, 258, 123, NULL, 0, 0, '2020-11-20 13:17:50', NULL),
(261, 258, 124, NULL, 0, 1, '2020-11-21 01:18:29', NULL),
(262, 260, 124, NULL, 1, 1, '2020-11-21 01:18:29', NULL),
(263, 259, 124, NULL, 2, 1, '2020-11-21 01:18:29', NULL),
(264, 258, 125, NULL, 0, 1, '2020-11-21 04:35:00', NULL),
(265, 260, 125, NULL, 1, 1, '2020-11-21 04:35:00', NULL),
(266, 259, 125, NULL, 2, 0, '2020-11-21 04:35:00', NULL),
(267, 260, 126, NULL, 0, 1, '2020-11-21 04:53:56', NULL),
(268, 258, 126, NULL, 1, 1, '2020-11-21 04:53:56', NULL),
(269, 259, 126, NULL, 2, 1, '2020-11-21 04:53:56', NULL),
(270, 258, 127, NULL, 0, 1, '2020-11-21 05:17:46', NULL),
(271, 260, 127, NULL, 1, 1, '2020-11-21 05:17:46', NULL),
(272, 259, 127, NULL, 2, 0, '2020-11-21 05:17:46', NULL),
(273, 258, 128, NULL, 0, 0, '2020-11-21 09:05:19', NULL),
(274, 260, 128, NULL, 1, 0, '2020-11-21 09:05:19', NULL),
(275, 259, 128, NULL, 2, 0, '2020-11-21 09:05:19', NULL),
(276, 553, 129, NULL, 0, 1, '2020-11-22 01:18:16', NULL),
(277, 555, 129, NULL, 2, 1, '2020-11-22 01:18:16', NULL),
(278, 554, 129, NULL, 1, 1, '2020-11-22 01:18:16', NULL),
(279, 557, 130, NULL, 0, 1, '2020-11-22 05:06:29', NULL),
(280, 558, 130, NULL, 1, 1, '2020-11-22 05:06:29', NULL),
(281, 556, 130, NULL, 2, 1, '2020-11-22 05:06:29', NULL),
(282, 557, 131, NULL, 0, 0, '2020-11-22 05:30:05', NULL),
(283, 558, 131, NULL, 1, 0, '2020-11-22 05:30:05', NULL),
(284, 556, 131, NULL, 2, 0, '2020-11-22 05:30:05', NULL),
(285, 557, 132, NULL, 0, 1, '2020-11-22 05:31:50', NULL),
(286, 558, 132, NULL, 1, 1, '2020-11-22 05:31:50', NULL),
(287, 556, 132, NULL, 2, 0, '2020-11-22 05:31:50', NULL),
(288, 557, 133, NULL, 0, 1, '2020-11-22 05:35:26', NULL),
(289, 558, 133, NULL, 1, 1, '2020-11-22 05:35:26', NULL),
(290, 556, 133, NULL, 2, 0, '2020-11-22 05:35:26', NULL),
(291, 557, 134, NULL, 0, 1, '2020-11-22 05:36:29', NULL),
(292, 558, 134, NULL, 1, 1, '2020-11-22 05:36:29', NULL),
(293, 556, 134, NULL, 2, 0, '2020-11-22 05:36:29', NULL),
(294, 557, 135, NULL, 0, 1, '2020-11-22 05:39:54', NULL),
(295, 558, 135, NULL, 1, 1, '2020-11-22 05:39:54', NULL),
(296, 556, 135, NULL, 2, 0, '2020-11-22 05:39:54', NULL),
(297, 557, 136, NULL, 0, 1, '2020-11-22 05:45:57', NULL),
(298, 558, 136, NULL, 1, 1, '2020-11-22 05:45:57', NULL),
(299, 556, 136, NULL, 2, 0, '2020-11-22 05:45:57', NULL),
(300, 558, 137, NULL, 0, 0, '2020-11-22 06:14:56', NULL),
(301, 556, 137, NULL, 1, 0, '2020-11-22 06:14:56', NULL),
(302, 557, 137, NULL, 2, 0, '2020-11-22 06:14:56', NULL),
(303, 558, 138, NULL, 0, 1, '2020-11-22 06:17:32', NULL),
(304, 556, 138, NULL, 1, 1, '2020-11-22 06:17:32', NULL),
(305, 557, 138, NULL, 2, 1, '2020-11-22 06:17:32', NULL),
(306, 501, 139, NULL, 0, 1, '2020-11-22 06:56:37', NULL),
(307, 427, 139, NULL, 1, 1, '2020-11-22 06:56:37', NULL),
(308, 426, 139, NULL, 2, 0, '2020-11-22 06:56:37', NULL),
(309, 506, 139, NULL, 3, 0, '2020-11-22 06:56:37', NULL),
(310, 528, 139, NULL, 4, 0, '2020-11-22 06:56:37', NULL),
(311, 425, 139, NULL, 5, 0, '2020-11-22 06:56:37', NULL),
(312, 424, 139, NULL, 6, 0, '2020-11-22 06:56:37', NULL),
(313, 429, 139, NULL, 7, 0, '2020-11-22 06:56:37', NULL),
(314, 511, 139, NULL, 8, 0, '2020-11-22 06:56:37', NULL),
(315, 495, 139, NULL, 9, 0, '2020-11-22 06:56:37', NULL),
(316, 494, 140, NULL, 0, 1, '2020-11-22 07:00:44', NULL),
(317, 430, 140, NULL, 1, 1, '2020-11-22 07:00:44', NULL),
(318, 428, 140, NULL, 2, 0, '2020-11-22 07:00:44', NULL),
(319, 489, 140, NULL, 3, 0, '2020-11-22 07:00:44', NULL),
(320, 423, 140, NULL, 4, 0, '2020-11-22 07:00:44', NULL),
(321, 543, 140, NULL, 5, 0, '2020-11-22 07:00:44', NULL),
(322, 523, 140, NULL, 6, 0, '2020-11-22 07:00:44', NULL),
(323, 484, 140, NULL, 7, 0, '2020-11-22 07:00:44', NULL),
(324, 513, 140, NULL, 8, 0, '2020-11-22 07:00:45', NULL),
(325, 512, 140, NULL, 9, 0, '2020-11-22 07:00:45', NULL),
(326, 501, 141, NULL, 0, 1, '2020-11-22 07:13:59', NULL),
(327, 427, 141, NULL, 1, 1, '2020-11-22 07:13:59', NULL),
(328, 426, 141, NULL, 2, 0, '2020-11-22 07:13:59', NULL),
(329, 506, 141, NULL, 3, 0, '2020-11-22 07:13:59', NULL),
(330, 528, 141, NULL, 4, 0, '2020-11-22 07:13:59', NULL),
(331, 425, 141, NULL, 5, 0, '2020-11-22 07:13:59', NULL),
(332, 424, 141, NULL, 6, 0, '2020-11-22 07:13:59', NULL),
(333, 429, 141, NULL, 7, 0, '2020-11-22 07:13:59', NULL),
(334, 511, 141, NULL, 8, 0, '2020-11-22 07:13:59', NULL),
(335, 495, 141, NULL, 9, 0, '2020-11-22 07:13:59', NULL),
(336, 501, 142, NULL, 0, 1, '2020-11-22 07:14:54', NULL),
(337, 427, 142, NULL, 1, 1, '2020-11-22 07:14:54', NULL),
(338, 426, 142, NULL, 2, 1, '2020-11-22 07:14:54', NULL),
(339, 506, 142, NULL, 3, 1, '2020-11-22 07:14:54', NULL),
(340, 528, 142, NULL, 4, 1, '2020-11-22 07:14:54', NULL),
(341, 425, 142, NULL, 5, 1, '2020-11-22 07:14:54', NULL),
(342, 424, 142, NULL, 6, 1, '2020-11-22 07:14:54', NULL),
(343, 429, 142, NULL, 7, 1, '2020-11-22 07:14:54', NULL),
(344, 511, 142, NULL, 8, 1, '2020-11-22 07:14:54', NULL),
(345, 495, 142, NULL, 9, 1, '2020-11-22 07:14:54', NULL),
(346, 501, 143, NULL, 0, 0, '2020-11-22 09:36:08', NULL),
(347, 528, 143, NULL, 1, 0, '2020-11-22 09:36:08', NULL),
(348, 427, 143, NULL, 2, 0, '2020-11-22 09:36:08', NULL),
(349, 426, 143, NULL, 3, 0, '2020-11-22 09:36:08', NULL),
(350, 506, 143, NULL, 4, 0, '2020-11-22 09:36:08', NULL),
(351, 425, 143, NULL, 5, 0, '2020-11-22 09:36:08', NULL),
(352, 494, 143, NULL, 6, 0, '2020-11-22 09:36:08', NULL),
(353, 424, 143, NULL, 7, 0, '2020-11-22 09:36:08', NULL),
(354, 511, 143, NULL, 8, 0, '2020-11-22 09:36:08', NULL),
(355, 495, 143, NULL, 9, 0, '2020-11-22 09:36:08', NULL),
(356, 427, 144, NULL, 0, 0, '2020-11-22 09:42:16', NULL),
(357, 501, 144, NULL, 1, 0, '2020-11-22 09:42:16', NULL),
(358, 528, 144, NULL, 2, 0, '2020-11-22 09:42:16', NULL),
(359, 426, 144, NULL, 3, 0, '2020-11-22 09:42:16', NULL),
(360, 506, 144, NULL, 4, 0, '2020-11-22 09:42:16', NULL),
(361, 425, 144, NULL, 5, 0, '2020-11-22 09:42:16', NULL),
(362, 494, 144, NULL, 6, 0, '2020-11-22 09:42:16', NULL),
(363, 424, 144, NULL, 7, 0, '2020-11-22 09:42:16', NULL),
(364, 511, 144, NULL, 8, 0, '2020-11-22 09:42:16', NULL),
(365, 495, 144, NULL, 9, 0, '2020-11-22 09:42:16', NULL),
(366, 557, 145, NULL, 0, 1, '2020-11-24 12:36:23', NULL),
(367, 558, 145, NULL, 1, 1, '2020-11-24 12:36:23', NULL),
(368, 556, 145, NULL, 2, 1, '2020-11-24 12:36:23', NULL),
(369, 486, 146, NULL, 0, 0, '2020-11-25 10:08:50', NULL),
(370, 444, 146, NULL, 1, 0, '2020-11-25 10:08:50', NULL),
(371, 564, 146, NULL, 2, 0, '2020-11-25 10:08:50', NULL),
(372, 525, 146, NULL, 3, 0, '2020-11-25 10:08:50', NULL),
(373, 446, 146, NULL, 4, 0, '2020-11-25 10:08:50', NULL),
(374, 476, 146, NULL, 5, 0, '2020-11-25 10:08:50', NULL),
(375, 552, 146, NULL, 6, 0, '2020-11-25 10:08:50', NULL),
(376, 491, 146, NULL, 7, 0, '2020-11-25 10:08:50', NULL),
(377, 504, 147, NULL, 0, 0, '2020-11-25 13:37:21', NULL),
(378, 499, 147, NULL, 1, 0, '2020-11-25 13:37:21', NULL),
(379, 455, 147, NULL, 2, 0, '2020-11-25 13:37:21', NULL),
(380, 461, 147, NULL, 3, 0, '2020-11-25 13:37:21', NULL),
(381, 509, 147, NULL, 4, 0, '2020-11-25 13:37:21', NULL),
(382, 534, 147, NULL, 5, 0, '2020-11-25 13:37:21', NULL),
(383, 571, 147, NULL, 6, 0, '2020-11-25 13:37:21', NULL),
(384, 468, 147, NULL, 7, 0, '2020-11-25 13:37:21', NULL),
(385, 440, 147, NULL, 8, 0, '2020-11-25 13:37:21', NULL),
(386, 504, 148, NULL, 0, 0, '2020-11-25 13:37:55', NULL),
(387, 499, 148, NULL, 1, 0, '2020-11-25 13:37:55', NULL),
(388, 455, 148, NULL, 2, 0, '2020-11-25 13:37:55', NULL),
(389, 461, 148, NULL, 3, 0, '2020-11-25 13:37:55', NULL),
(390, 509, 148, NULL, 4, 0, '2020-11-25 13:37:55', NULL),
(391, 534, 148, NULL, 5, 0, '2020-11-25 13:37:55', NULL),
(392, 571, 148, NULL, 6, 0, '2020-11-25 13:37:55', NULL),
(393, 468, 148, NULL, 7, 0, '2020-11-25 13:37:55', NULL),
(394, 440, 148, NULL, 8, 0, '2020-11-25 13:37:55', NULL),
(395, 504, 149, NULL, 0, 1, '2020-11-25 13:38:02', NULL),
(396, 499, 149, NULL, 1, 1, '2020-11-25 13:38:02', NULL),
(397, 455, 149, NULL, 2, 1, '2020-11-25 13:38:02', NULL),
(398, 461, 149, NULL, 3, 1, '2020-11-25 13:38:02', NULL),
(399, 509, 149, NULL, 4, 1, '2020-11-25 13:38:02', NULL),
(400, 534, 149, NULL, 5, 1, '2020-11-25 13:38:02', NULL),
(401, 571, 149, NULL, 6, 1, '2020-11-25 13:38:02', NULL),
(402, 468, 149, NULL, 7, 1, '2020-11-25 13:38:02', NULL),
(403, 440, 149, NULL, 8, 1, '2020-11-25 13:38:02', NULL),
(404, 487, 150, NULL, 0, 0, '2020-11-25 13:38:57', NULL),
(405, 565, 150, NULL, 1, 0, '2020-11-25 13:38:57', NULL),
(406, 526, 150, NULL, 2, 0, '2020-11-25 13:38:57', NULL),
(407, 474, 150, NULL, 3, 0, '2020-11-25 13:38:57', NULL),
(408, 550, 150, NULL, 4, 0, '2020-11-25 13:38:57', NULL),
(409, 492, 150, NULL, 5, 0, '2020-11-25 13:38:57', NULL),
(410, 519, 150, NULL, 6, 0, '2020-11-25 13:38:57', NULL),
(411, 567, 150, NULL, 7, 0, '2020-11-25 13:38:57', NULL),
(412, 487, 151, NULL, 0, 1, '2020-11-25 13:39:51', NULL),
(413, 565, 151, NULL, 1, 1, '2020-11-25 13:39:51', NULL),
(414, 526, 151, NULL, 2, 1, '2020-11-25 13:39:51', NULL),
(415, 474, 151, NULL, 3, 1, '2020-11-25 13:39:51', NULL),
(416, 550, 151, NULL, 4, 1, '2020-11-25 13:39:51', NULL),
(417, 492, 151, NULL, 5, 1, '2020-11-25 13:39:51', NULL),
(418, 519, 151, NULL, 6, 1, '2020-11-25 13:39:51', NULL),
(419, 567, 151, NULL, 7, 1, '2020-11-25 13:39:51', NULL),
(420, 541, 152, NULL, 0, 0, '2020-11-25 20:34:19', NULL),
(421, 475, 152, NULL, 1, 0, '2020-11-25 20:34:19', NULL),
(422, 549, 152, NULL, 2, 0, '2020-11-25 20:34:19', NULL),
(423, 456, 152, NULL, 3, 0, '2020-11-25 20:34:19', NULL),
(424, 535, 152, NULL, 4, 0, '2020-11-25 20:34:19', NULL),
(425, 469, 152, NULL, 5, 0, '2020-11-25 20:34:19', NULL),
(426, 541, 153, NULL, 0, 1, '2020-11-25 20:40:04', NULL),
(427, 475, 153, NULL, 1, 0, '2020-11-25 20:40:04', NULL),
(428, 549, 153, NULL, 2, 0, '2020-11-25 20:40:04', NULL),
(429, 456, 153, NULL, 3, 0, '2020-11-25 20:40:04', NULL),
(430, 535, 153, NULL, 4, 0, '2020-11-25 20:40:04', NULL),
(431, 469, 153, NULL, 5, 0, '2020-11-25 20:40:04', NULL),
(432, 541, 154, NULL, 0, 1, '2020-11-25 21:05:29', NULL),
(433, 475, 154, NULL, 1, 1, '2020-11-25 21:05:29', NULL),
(434, 549, 154, NULL, 2, 1, '2020-11-25 21:05:29', NULL),
(435, 456, 154, NULL, 3, 0, '2020-11-25 21:05:29', NULL),
(436, 535, 154, NULL, 4, 0, '2020-11-25 21:05:29', NULL),
(437, 469, 154, NULL, 5, 0, '2020-11-25 21:05:29', NULL),
(438, 505, 155, 453, 0, 1, '2020-11-26 20:40:25', '27-11-2020 11:17:02'),
(439, 500, 155, 680, 1, 1, '2020-11-26 20:40:25', '27-11-2020 11:17:07'),
(440, 457, 155, 300, 2, 1, '2020-11-26 20:40:25', '27-11-2020 11:17:14'),
(441, 462, 155, 265, 3, 1, '2020-11-26 20:40:25', '27-11-2020 11:17:23'),
(442, 510, 155, 137, 4, 1, '2020-11-26 20:40:25', '27-11-2020 11:17:26'),
(443, 537, 155, 487, 5, 0, '2020-11-26 20:40:25', NULL),
(444, 470, 155, 501, 6, 0, '2020-11-26 20:40:25', NULL),
(445, 441, 155, 1197, 7, 0, '2020-11-26 20:40:25', NULL),
(446, 505, 156, 453, 0, 0, '2020-11-26 20:41:47', NULL),
(447, 500, 156, 680, 1, 0, '2020-11-26 20:41:47', NULL),
(448, 457, 156, 300, 2, 0, '2020-11-26 20:41:47', NULL),
(449, 462, 156, 265, 3, 0, '2020-11-26 20:41:47', NULL),
(450, 510, 156, 137, 4, 0, '2020-11-26 20:41:47', NULL),
(451, 537, 156, 487, 5, 0, '2020-11-26 20:41:47', NULL),
(452, 470, 156, 501, 6, 0, '2020-11-26 20:41:47', NULL),
(453, 441, 156, 1197, 7, 0, '2020-11-26 20:41:47', NULL),
(454, 488, 157, 795, 0, 0, '2020-11-26 20:51:22', NULL),
(455, 566, 157, 842, 1, 0, '2020-11-26 20:51:22', NULL),
(456, 527, 157, 500, 2, 0, '2020-11-26 20:51:22', NULL),
(457, 472, 157, 738, 3, 0, '2020-11-26 20:51:22', NULL),
(458, 548, 157, 1, 4, 0, '2020-11-26 20:51:22', NULL),
(459, 493, 157, 32, 5, 0, '2020-11-26 20:51:22', NULL),
(460, 522, 157, 842, 6, 0, '2020-11-26 20:51:22', NULL),
(461, 569, 157, 571, 7, 0, '2020-11-26 20:51:22', NULL),
(462, 488, 158, 796, 0, 1, '2020-11-26 20:52:58', '27-11-2020 10:55:46'),
(463, 566, 158, 843, 1, 1, '2020-11-26 20:52:58', '27-11-2020 11:14:41'),
(464, 527, 158, 500, 2, 1, '2020-11-26 20:52:58', '27-11-2020 11:15:02'),
(465, 472, 158, 738, 3, 1, '2020-11-26 20:52:58', '27-11-2020 11:29:43'),
(466, 548, 158, 1, 4, 1, '2020-11-26 20:52:58', '27-11-2020 11:29:52'),
(467, 493, 158, 32, 5, 0, '2020-11-26 20:52:58', NULL),
(468, 522, 158, 842, 6, 0, '2020-11-26 20:52:58', NULL),
(469, 569, 158, 571, 7, 0, '2020-11-26 20:52:58', NULL),
(470, 598, 159, 536, 0, 0, '2020-11-29 22:00:16', NULL),
(471, 582, 159, 679, 1, 0, '2020-11-29 22:00:19', NULL),
(472, 600, 159, 1161, 2, 0, '2020-11-29 22:00:19', NULL),
(473, 573, 159, 658, 3, 0, '2020-11-29 22:00:19', NULL),
(474, 601, 159, 1491, 4, 0, '2020-11-29 22:00:19', NULL),
(475, 581, 159, 741, 5, 0, '2020-11-29 22:00:19', NULL),
(476, 578, 159, 311, 6, 0, '2020-11-29 22:00:21', NULL),
(477, 598, 160, 536, 0, 1, '2020-11-29 22:00:39', '30-11-2020 12:01:28'),
(478, 582, 160, 679, 1, 1, '2020-11-29 22:00:39', '30-11-2020 12:14:30'),
(479, 600, 160, 1161, 2, 1, '2020-11-29 22:00:40', '30-11-2020 12:52:06'),
(480, 573, 160, 658, 3, 1, '2020-11-29 22:00:40', '30-11-2020 12:55:51'),
(481, 601, 160, 1491, 4, 1, '2020-11-29 22:00:40', '30-11-2020 13:10:25'),
(482, 581, 160, 741, 5, 1, '2020-11-29 22:00:40', '30-11-2020 13:20:04'),
(483, 578, 160, 311, 6, 1, '2020-11-29 22:00:40', '30-11-2020 13:39:26'),
(484, 583, 161, 249, 0, 1, '2020-11-30 03:08:23', '30-11-2020 17:10:57'),
(485, 586, 161, 775, 1, 1, '2020-11-30 03:08:23', '30-11-2020 17:20:27'),
(486, 588, 161, 1058, 2, 1, '2020-11-30 03:08:23', '30-11-2020 17:40:09'),
(487, 589, 161, 1531, 3, 1, '2020-11-30 03:08:23', '30-11-2020 18:03:05'),
(488, 590, 161, 521, 4, 1, '2020-11-30 03:08:23', '30-11-2020 18:08:39'),
(489, 597, 161, 810, 5, 1, '2020-11-30 03:08:23', '30-11-2020 18:19:36'),
(490, 591, 161, 930, 6, 1, '2020-11-30 03:08:23', '30-11-2020 18:30:20'),
(491, 583, 162, 249, 0, 0, '2020-11-30 03:10:31', NULL),
(492, 586, 162, 771, 1, 0, '2020-11-30 03:10:31', NULL),
(493, 588, 162, 1055, 2, 0, '2020-11-30 03:10:31', NULL),
(494, 589, 162, 1535, 3, 0, '2020-11-30 03:10:31', NULL),
(495, 590, 162, 521, 4, 0, '2020-11-30 03:10:31', NULL),
(496, 597, 162, 806, 5, 0, '2020-11-30 03:10:31', NULL),
(497, 591, 162, 933, 6, 0, '2020-11-30 03:10:31', NULL),
(498, 634, 163, 437, 0, 1, '2020-11-30 20:55:32', '01-12-2020 11:07:56'),
(499, 614, 163, 379, 1, 1, '2020-11-30 20:55:33', '01-12-2020 11:16:43'),
(500, 642, 163, 546, 2, 1, '2020-11-30 20:55:33', '01-12-2020 11:34:57'),
(501, 606, 163, 802, 3, 1, '2020-11-30 20:55:33', '01-12-2020 11:49:41'),
(502, 641, 163, 857, 4, 1, '2020-11-30 20:55:33', '01-12-2020 12:01:11'),
(503, 602, 163, 1027, 5, 1, '2020-11-30 20:55:33', '01-12-2020 12:15:41'),
(504, 692, 163, 638, 6, 1, '2020-11-30 20:55:33', '01-12-2020 12:35:58'),
(505, 706, 163, 823, 7, 1, '2020-11-30 20:55:33', '01-12-2020 12:38:54'),
(506, 634, 164, 439, 0, 0, '2020-11-30 21:02:14', NULL),
(507, 614, 164, 381, 1, 0, '2020-11-30 21:02:14', NULL),
(508, 642, 164, 550, 2, 0, '2020-11-30 21:02:14', NULL),
(509, 606, 164, 806, 3, 0, '2020-11-30 21:02:15', NULL),
(510, 641, 164, 860, 4, 0, '2020-11-30 21:02:15', NULL),
(511, 602, 164, 1035, 5, 0, '2020-11-30 21:02:15', NULL),
(512, 692, 164, 639, 6, 0, '2020-11-30 21:02:15', NULL),
(513, 706, 164, 824, 7, 0, '2020-11-30 21:02:17', NULL),
(514, 626, 165, 594, 0, 0, '2020-11-30 21:02:30', NULL),
(515, 688, 165, 279, 1, 0, '2020-11-30 21:02:30', NULL),
(516, 610, 165, 133, 2, 0, '2020-11-30 21:02:30', NULL),
(517, 687, 165, 702, 3, 0, '2020-11-30 21:02:30', NULL),
(518, 622, 165, 525, 4, 0, '2020-11-30 21:02:30', NULL),
(519, 653, 165, 1139, 5, 0, '2020-11-30 21:02:30', NULL),
(520, 683, 165, 910, 6, 0, '2020-11-30 21:02:30', NULL),
(521, 626, 166, 666, 0, 1, '2020-11-30 21:10:39', '01-12-2020 11:10:45'),
(522, 688, 166, 300, 1, 0, '2020-11-30 21:10:39', NULL),
(523, 610, 166, 133, 2, 0, '2020-11-30 21:10:39', NULL),
(524, 687, 166, 702, 3, 0, '2020-11-30 21:10:39', NULL),
(525, 622, 166, 526, 4, 0, '2020-11-30 21:10:39', NULL),
(526, 653, 166, 1141, 5, 0, '2020-11-30 21:10:39', NULL),
(527, 683, 166, 911, 6, 0, '2020-11-30 21:10:39', NULL),
(528, 626, 167, 695, 0, 1, '2020-11-30 21:12:46', '01-12-2020 11:13:08'),
(529, 688, 167, 365, 1, 1, '2020-11-30 21:12:46', '01-12-2020 11:15:35'),
(530, 610, 167, 134, 2, 1, '2020-11-30 21:12:46', '01-12-2020 11:17:30'),
(531, 687, 167, 705, 3, 1, '2020-11-30 21:12:46', '01-12-2020 11:31:06'),
(532, 622, 167, 533, 4, 1, '2020-11-30 21:12:46', '01-12-2020 11:36:47'),
(533, 653, 167, 1150, 5, 1, '2020-11-30 21:12:46', '01-12-2020 11:49:41'),
(534, 683, 167, 916, 6, 0, '2020-11-30 21:12:46', NULL),
(535, 700, 168, 780, 0, 0, '2020-12-01 03:07:12', NULL),
(536, 693, 168, 1154, 1, 0, '2020-12-01 03:07:12', NULL),
(537, 707, 168, 933, 2, 0, '2020-12-01 03:07:12', NULL),
(538, 674, 168, 628, 3, 0, '2020-12-01 03:07:12', NULL),
(539, 679, 169, 254, 0, 1, '2020-12-01 03:15:09', '01-12-2020 17:19:28'),
(540, 670, 169, 513, 1, 1, '2020-12-01 03:15:09', '01-12-2020 17:34:12'),
(541, 643, 169, 1527, 2, 1, '2020-12-01 03:15:09', '01-12-2020 18:00:47'),
(542, 714, 169, 1656, 3, 0, '2020-12-01 03:15:09', NULL),
(543, 618, 169, 910, 4, 0, '2020-12-01 03:15:09', NULL),
(544, 679, 170, 254, 0, 0, '2020-12-01 03:15:29', NULL),
(545, 670, 170, 513, 1, 0, '2020-12-01 03:15:29', NULL),
(546, 643, 170, 1524, 2, 0, '2020-12-01 03:15:29', NULL),
(547, 714, 170, 1625, 3, 0, '2020-12-01 03:15:29', NULL),
(548, 618, 170, 914, 4, 0, '2020-12-01 03:15:29', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `driver_record`
--

CREATE TABLE `driver_record` (
  `id` int(11) NOT NULL,
  `delivery_date` varchar(50) DEFAULT NULL,
  `driver_data` longtext,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `driver_record`
--

INSERT INTO `driver_record` (`id`, `delivery_date`, `driver_data`, `created_time`) VALUES
(6, '2020-11-02 18:03:14', '[\"Sutan;10(Dinner)\",\"Hanif;1xGrab8k(Dinner)\"]', '2020-10-31 10:03:14'),
(7, '2020-11-02 18:05:15', '[\"Sutan;8(Lunch)\",\"Daka;4(Lunch)\"]', '2020-10-31 10:05:15'),
(8, '2020-11-05 17:39:08', '[\"Sutan;6(Dinner)\"]', '2020-11-03 09:39:08'),
(9, '2020-11-05 17:39:27', '[\"Sutan;6(Lunch)\"]', '2020-11-03 09:39:27'),
(10, '2020-11-06 19:58:14', '[\"Sutan;6(Lunch), 6(Dinner)\"]', '2020-11-04 18:58:14'),
(11, '2020-11-09 11:46:44', '[\"Sutan;6(Lunch)\",\"Feldi;4(Lunch)\"]', '2020-11-07 17:46:44'),
(12, '2020-11-09 17:18:24', '[\"Sutan;5(diner)\",\"Ferdi;5(diner)\"]', '2020-11-07 23:18:24'),
(13, '2020-11-10 11:00:32', '[\"Sutan;5(lunch)\",\"Feldi;5(lunch)\"]', '2020-11-08 17:00:32'),
(14, '2020-11-10 17:25:15', '[\"Sutan;5(diner)\",\"Faldi;5(diner)\"]', '2020-11-08 23:25:15'),
(15, '2020-11-11 10:53:49', '[\"Sutan;5(lunch)\",\"Feldi;5(lunch)\"]', '2020-11-09 23:53:49'),
(16, '2020-11-11 17:00:43', '[\"Feldi;5(diner)\",\"Sutan;5(diner)\"]', '2020-11-10 06:00:44'),
(17, '2020-11-12 11:03:51', '[\"Sutan;6(Lunch)\",\"Feldi;5(lunch)\"]', '2020-11-11 00:03:51'),
(18, '2020-11-12 17:09:07', '[\"Feldi;4 (diner)\",\"Sutan;4 (diner)\"]', '2020-11-11 06:09:07'),
(19, '2020-11-12 17:09:08', '[\"Feldi;4 (diner)\",\"Sutan;4 (diner)\"]', '2020-11-11 06:09:08'),
(20, '2020-11-12 17:09:09', '[\"Feldi;4 (diner)\",\"Sutan;4 (diner)\"]', '2020-11-11 06:09:09'),
(21, '2020-11-12 17:09:11', '[\"Feldi;4 (diner)\",\"Sutan;4 (diner)\"]', '2020-11-11 06:09:11'),
(22, '2020-11-13 10:47:32', '[\"Sutan;5(lunch)\",\"Feldi;5(lunch)\"]', '2020-11-11 23:47:32'),
(23, '2020-11-13 17:03:20', '[\"Sutan;3(lunch)\",\"Feldi;4(lunch)\"]', '2020-11-12 06:03:20'),
(24, '2020-11-16 10:44:43', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-14 23:44:43'),
(25, '2020-11-16 17:18:26', '[\"Sutan;4(dinner)\",\"Feldi;4(dinner)\"]', '2020-11-15 06:18:26'),
(26, '2020-11-17 11:14:26', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-16 00:14:27'),
(27, '2020-11-17 17:27:28', '[\"Sutan;6(dinner)\"]', '2020-11-16 06:27:28'),
(28, '2020-11-18 11:00:15', '[\"Sutan;8(lunch)\",\"Feldi;8(lunch)\"]', '2020-11-17 00:00:15'),
(29, '2020-11-18 17:14:03', '[\"Feldi;4(Lunch)\",\"Sutan;3(Lunch)\"]', '2020-11-17 06:14:03'),
(30, '2020-11-18 17:14:04', '[\"Feldi;4(Lunch)\",\"Sutan;3(Lunch)\"]', '2020-11-17 06:14:04'),
(31, '2020-11-19 10:43:23', '[\"Sutan;9(lunch)\",\"Feldi;8(lunch)\"]', '2020-11-17 23:43:23'),
(32, '2020-11-19 16:46:07', '[\"Feldi;8(dinner)\"]', '2020-11-18 05:46:07'),
(33, '2020-11-20 11:18:34', '[\"Sutan;8(lunch)\",\"Feldi;8(lunch)\"]', '2020-11-19 00:18:34'),
(34, '2020-11-20 11:18:50', '[\"Sutan;8(lunch)\",\"Feldi;8(lunch)\"]', '2020-11-19 00:18:50'),
(35, '2020-11-20 11:18:53', '[\"Sutan;8(lunch)\",\"Feldi;8(lunch)\"]', '2020-11-19 00:18:53'),
(36, '2020-11-20 17:07:45', '[\"Feldi;5(diner)\"]', '2020-11-19 06:07:45'),
(37, '2020-11-23 10:59:42', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 06:59:42'),
(38, '2020-11-23 10:59:49', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 06:59:49'),
(39, '2020-11-23 10:59:52', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 06:59:52'),
(40, '2020-11-23 10:59:53', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 06:59:53'),
(41, '2020-11-23 10:59:54', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 06:59:54'),
(42, '2020-11-23 10:59:54', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 06:59:54'),
(43, '2020-11-23 10:59:54', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 06:59:54'),
(44, '2020-11-23 10:59:55', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 06:59:55'),
(45, '2020-11-23 11:00:00', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 07:00:00'),
(46, '2020-11-23 11:00:02', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 07:00:02'),
(47, '2020-11-23 11:00:03', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 07:00:03'),
(48, '2020-11-23 11:00:03', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 07:00:03'),
(49, '2020-11-23 11:00:09', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 07:00:10'),
(50, '2020-11-23 11:00:09', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 07:00:10'),
(51, '2020-11-23 11:00:09', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 07:00:10'),
(52, '2020-11-23 11:04:56', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 07:04:56'),
(53, '2020-11-23 11:04:59', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 07:04:59'),
(54, '2020-11-23 11:05:04', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 07:05:04'),
(55, '2020-11-23 11:05:06', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 07:05:06'),
(56, '2020-11-23 11:05:07', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 07:05:07'),
(57, '2020-11-23 11:05:07', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 07:05:07'),
(58, '2020-11-23 11:05:07', '[\"Sutan;9(lunch)\",\"Feldi;9(lunch)\"]', '2020-11-22 07:05:07'),
(59, '2020-11-25 11:32:45', '[\"Sutan;7(Lunch)\",\"Feldi;7(Lunch)\"]', '2020-11-24 14:32:45'),
(60, '2020-11-25 17:13:58', '[\"Sutan;8 (dinner)\"]', '2020-11-24 20:13:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ingredients_category`
--

CREATE TABLE `ingredients_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ingredients_category`
--

INSERT INTO `ingredients_category` (`id`, `name`, `description`, `is_active`, `created_time`) VALUES
(1, 'Persediaan Untuk Dijual', 'Contohnya, makanan frozen food.', 1, '2020-10-31 22:10:43'),
(2, 'Bahan Penolong', 'Contohnya, sendok, garpu, packaging, bowl, dll.', 1, '2020-10-31 22:11:42'),
(3, 'Buah & Sayur', 'Contohnya, brokoli, wortel, pepaya, jeruk, dll.', 1, '2020-10-31 22:11:16'),
(4, 'Daging & Seafood', 'Contohnya, ayam, sapi, cumi, udang, dll.', 1, '2020-10-31 22:11:16'),
(5, 'Bahan Pembantu Produksi', 'Contohnya, minyak goreng, gula, kecap, garam, dll.', 1, '2020-10-31 22:11:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ingredients_data`
--

CREATE TABLE `ingredients_data` (
  `id` int(11) NOT NULL,
  `code` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `purchase_price` int(11) DEFAULT NULL,
  `latest_price_date` varchar(30) DEFAULT NULL,
  `stock_limit` int(11) NOT NULL DEFAULT '0',
  `updated_time` timestamp NULL DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ingredients_data`
--

INSERT INTO `ingredients_data` (`id`, `code`, `name`, `description`, `category_id`, `unit_id`, `purchase_price`, `latest_price_date`, `stock_limit`, `updated_time`, `created_time`) VALUES
(10, '569847223736', 'Buah Naga', 'buah naga', 3, 2, 30, '16-11-2020', 350, '2020-11-15 09:13:27', '2020-11-15 08:47:06'),
(11, '431638892557', 'AYAM', 'AYAM KUKURUYUK', 4, 1, 32000, '16-11-2020', 0, NULL, '2020-11-15 08:48:10'),
(12, '253668251749', 'DAGING SAPI', 'MWOOOOOOOO', 4, 1, 125000, '16-11-2020', 0, NULL, '2020-11-15 08:48:45'),
(13, '785612927534', 'IKAN MAHI MAHI', 'SLURPPPP MANJA', 4, 1, 22000, '16-11-2020', 0, NULL, '2020-11-15 08:49:27'),
(14, '353698827954', 'UDANG', 'U DAN G', 4, 1, 65000, '16-11-2020', 0, NULL, '2020-11-15 08:50:04'),
(15, '736423918296', 'CUMI CUMI', 'IMC IMUC', 4, 1, 65000, '16-11-2020', 0, NULL, '2020-11-15 08:50:29'),
(16, '876452498697', 'GURITA', 'SQUIDWOR', 4, 2, 50, '16-11-2020', 350, '2020-11-15 09:12:58', '2020-11-15 08:51:42'),
(17, '489465758272', 'BERAS PUTIH', 'BERAS PUTIH', 1, 1, 12000, '16-11-2020', 0, NULL, '2020-11-15 08:52:52'),
(18, '665187398543', 'BERAS MERAH', 'MERAH ITU BRANI', 1, 1, 14000, '16-11-2020', 0, NULL, '2020-11-15 08:53:22'),
(19, '657897951343', 'KENTANG', 'BUKAN J2 PRIME', 1, 1, 10000, '16-11-2020', 0, NULL, '2020-11-15 08:53:48'),
(20, '365781344262', 'SPAGHETTI', 'OOO ITALIANO', 1, 13, 14000, '16-11-2020', 0, NULL, '2020-11-15 08:54:47'),
(21, '749251612963', 'FUSILLI', 'NTAP', 1, 13, 15000, '16-11-2020', 1, '2020-11-15 08:55:28', '2020-11-15 08:55:15'),
(22, '712839864965', 'PENNE', 'PENNE TENG TEG PENNE', 1, 13, 35000, '16-11-2020', 0, NULL, '2020-11-15 08:56:14'),
(23, '571898337614', 'TELUR', 'TEETELUULUR TELUR', 1, 4, 1333, '16-11-2020', 0, NULL, '2020-11-15 08:57:57'),
(24, '987819522754', 'WORTEL', 'WORTEL LO MASAK GATAU', 3, 2, 1, '16-11-2020', 350, '2020-11-15 09:12:14', '2020-11-15 08:58:44'),
(25, '332921475854', 'JAGUNG', 'JAGUNG', 3, 2, 1, '16-11-2020', 350, '2020-11-15 09:11:56', '2020-11-15 08:59:41'),
(26, '637542883964', 'BROKOLI', 'BROKOLI', 3, 2, 12, '16-11-2020', 350, '2020-11-15 09:11:39', '2020-11-15 09:00:22'),
(27, '214699178764', 'KOL PUTIH', 'KOL', 3, 2, 8, '16-11-2020', 350, '2020-11-15 09:11:15', '2020-11-15 09:00:59'),
(28, '955718423193', 'SELADA', 'SELADA', 3, 2, 20, '16-11-2020', 350, '2020-11-15 09:11:24', '2020-11-15 09:01:25'),
(29, '516591336978', 'TIMUN', 'TIMUN', 3, 2, 8, '16-11-2020', 350, '2020-11-15 09:10:41', '2020-11-15 09:01:53'),
(30, '256457823394', 'PAKCOY', 'PAKCOY', 3, 2, 15, '16-11-2020', 350, '2020-11-15 09:10:18', '2020-11-15 09:02:24'),
(31, '153497869265', 'JAMUR TIRAM', 'JARUM TIRAM', 3, 10, 5000, '16-11-2020', 0, NULL, '2020-11-15 09:03:07'),
(32, '818163943574', 'TEMPE', 'TEMPE', 1, 3, 5000, '16-11-2020', 0, NULL, '2020-11-15 09:03:59'),
(33, '622517984379', 'TOFU', 'TOFU', 1, 10, 3500, '16-11-2020', 0, NULL, '2020-11-15 09:04:30'),
(34, '891866594743', 'BAWANG BOMBAY', 'BOMBAYA', 1, 2, 18, '16-11-2020', 350, '2020-11-15 09:09:31', '2020-11-15 09:07:26'),
(35, '563988947712', 'BAWANG PUTIH', 'PUTIH ITU SUCI', 1, 2, 25, '16-11-2020', 0, NULL, '2020-11-15 09:09:04'),
(36, '869453112473', 'GULA', 'GULA', 1, 2, 15, '16-11-2020', 0, NULL, '2020-11-15 09:14:13'),
(37, '336897158257', 'GARAM', 'GARAM', 1, 2, 22, '16-11-2020', 0, NULL, '2020-11-15 09:14:37'),
(38, '716384376159', 'KALDU JAMUR', 'MANTAP', 1, 2, 175, '16-11-2020', 0, NULL, '2020-11-15 09:15:08'),
(39, '294615371879', 'LADA ', 'LADA COY', 1, 2, 300, '16-11-2020', 0, NULL, '2020-11-15 09:15:34'),
(40, '656315499872', 'ORIGANO', 'BOTOL', 1, 10, 20000, '16-11-2020', 0, NULL, '2020-11-15 09:16:11'),
(41, '674849715325', 'TEPUNG PANIR', 'OANIR', 1, 2, 25, '16-11-2020', 0, NULL, '2020-11-15 09:16:37'),
(42, '498853541297', 'TERIGU', 'TERIGU', 1, 2, 12, '16-11-2020', 0, NULL, '2020-11-15 09:16:57'),
(43, '634779886521', 'MAIZENNA', 'BUNGKUS', 1, 10, 10000, '16-11-2020', 0, NULL, '2020-11-15 09:17:24'),
(44, '859276271613', 'BON CABE', 'BONCAB', 1, 10, 14000, '16-11-2020', 0, NULL, '2020-11-15 09:17:52'),
(45, '319772943812', 'LADA HITAM', 'IRENG', 1, 10, 30000, '16-11-2020', 0, NULL, '2020-11-15 09:18:13'),
(46, '356473569814', 'WIJEN', 'BII WIJEN', 1, 2, 60, '16-11-2020', 0, NULL, '2020-11-15 09:18:36'),
(47, '594214697283', 'CABE MERAH', 'NOT CABE CABEAN', 1, 2, 35, '16-11-2020', 0, NULL, '2020-11-15 09:19:06'),
(48, '591483768543', 'CABE SETAN', 'HUU SERAM', 1, 2, 30, '16-11-2020', 0, NULL, '2020-11-15 09:19:28'),
(49, '588973246715', 'SAOS ', 'JERIGEN', 1, 7, 115000, '16-11-2020', 0, NULL, '2020-11-15 09:20:16'),
(50, '351422617549', 'KECAP', 'KECAPPPPPPP', 1, 1, 55000, '16-11-2020', 0, NULL, '2020-11-15 09:21:01'),
(51, '139914258673', 'MAYONESSE', 'MAYOOO AHHH', 1, 10, 30000, '16-11-2020', 0, NULL, '2020-11-15 09:21:30'),
(52, '599662783417', 'SAOS TIRAM', 'TIRAMM', 1, 2, 70, '16-11-2020', 350, '2020-11-15 09:22:14', '2020-11-15 09:21:59'),
(53, '197586268594', 'PERMESAN BUBUK', 'KEJUU', 1, 10, 40000, '16-11-2020', 0, NULL, '2020-11-15 09:22:45'),
(54, '726581573984', 'PARMESAN BATANG', 'PARMESAN BATANG', 1, 7, 14000, '16-11-2020', 0, NULL, '2020-11-15 09:23:26'),
(55, '279641459818', 'MOZARELA', 'MOZARELA', 1, 2, 130, '16-11-2020', 0, NULL, '2020-11-15 09:23:54'),
(56, '135294697471', 'SUSU KOTAK', 'SUSU KOTAK', 1, 7, 22000, '16-11-2020', 0, NULL, '2020-11-15 09:24:14'),
(57, '353117468282', 'COOKING CREAM', 'COOKING CREAM', 1, 7, 105000, '16-11-2020', 0, NULL, '2020-11-15 09:24:38'),
(58, '769254934582', 'JAMUR KALENG', 'JAMUR KALENG', 1, 7, 17000, '16-11-2020', 0, NULL, '2020-11-15 09:25:04'),
(59, '791956312728', 'MINYAK GORENG', 'MINYAK GORENG', 1, 9, 17000, '16-11-2020', 0, NULL, '2020-11-15 09:25:31'),
(60, '319248586763', 'MENTEGA', 'KILOAN', 1, 10, 70000, '16-11-2020', 0, NULL, '2020-11-15 09:26:12'),
(61, '381939548412', 'BUBUK KEJU', 'A', 1, 2, 85, '16-11-2020', 0, NULL, '2020-11-15 09:26:37'),
(62, '838234171547', 'KEJU MELT', 'A', 1, 7, 30000, '16-11-2020', 0, NULL, '2020-11-15 09:26:57'),
(63, '964135698241', 'JAMUR SHIMIJI', 'AA', 1, 13, 15000, '16-11-2020', 0, NULL, '2020-11-15 09:27:21'),
(64, '319378729561', 'CHILI POWDER', 'W', 1, 2, 70, '16-11-2020', 0, NULL, '2020-11-15 09:27:46'),
(65, '958363224496', 'PAPRIKA BUAH', 'A', 3, 2, 50, '16-11-2020', 0, NULL, '2020-11-15 09:28:11'),
(66, '427987239568', 'SEREH', 'S', 1, 2, 15, '16-11-2020', 0, NULL, '2020-11-15 09:28:32'),
(67, '718759922514', 'JAHE', 'JAHE', 1, 2, 60, '16-11-2020', 0, NULL, '2020-11-15 09:28:50'),
(68, '844291362535', 'LENGKUAS', 'S', 1, 2, 25, '16-11-2020', 0, NULL, '2020-11-15 09:29:32'),
(69, '557694416882', 'KENCUR', 'KENCUR', 1, 2, 50, '16-11-2020', 0, NULL, '2020-11-15 09:29:49'),
(70, '827123947861', 'KELAPA PARUT', 'KELAPA ', 1, 3, 12000, '16-11-2020', 0, NULL, '2020-11-15 09:30:17'),
(71, '492651534689', 'KECAP ASIN', 'ASIN', 1, 1, 50000, '16-11-2020', 0, NULL, '2020-11-15 09:30:44'),
(72, '612785561389', 'PISANG', 'PISANG', 3, 11, 15000, '16-11-2020', 0, NULL, '2020-11-15 09:31:07'),
(73, '731246529954', 'MELON', 'MELON', 3, 1, 15000, '16-11-2020', 0, NULL, '2020-11-15 09:31:31'),
(74, '337816856229', 'PEPAYA', 'PEPAYA', 3, 1, 10000, '16-11-2020', 0, NULL, '2020-11-15 09:31:56'),
(75, '954291754836', 'NENAS', 'NENAS', 3, 1, 10000, '16-11-2020', 0, NULL, '2020-11-15 09:32:14'),
(76, '927464158398', 'ANGGUR', 'A', 3, 2, 60, '16-11-2020', 0, NULL, '2020-11-15 09:32:41'),
(77, '464796838711', 'APEL MERAH', 'A', 3, 2, 25, '16-11-2020', 0, NULL, '2020-11-15 09:33:02'),
(78, '762543736914', 'APEL HIJAU', 'A', 3, 2, 25, '16-11-2020', 0, NULL, '2020-11-15 09:33:27'),
(79, '332462789814', 'KIWI', 'BUKAN KIWIL', 3, 2, 80, '16-11-2020', 0, NULL, '2020-11-15 09:33:54'),
(80, '468612924538', 'MANGGA', 'A', 3, 2, 30, '16-11-2020', 0, NULL, '2020-11-15 09:34:23'),
(81, '522784685791', 'STROWBERRY', 'STROWBERRY MANGGA APEL SORRY GAK LEVEL', 1, 2, 75, '16-11-2020', 0, NULL, '2020-11-15 09:35:07'),
(82, '646389489715', 'JERUK BRASTAGI', 'JERUK', 3, 2, 20, '16-11-2020', 0, NULL, '2020-11-15 09:35:31'),
(83, '159363916244', 'JERUK BALI', 'DI PANTAI KUTA', 3, 2, 25, '16-11-2020', 0, NULL, '2020-11-15 09:35:58'),
(84, '198754262735', 'ALPUKAT', 'ALPUKAT ', 3, 2, 30, '16-11-2020', 0, NULL, '2020-11-15 09:36:25'),
(85, '767852538214', 'SEMANGKA', 'SEMANGAT KAKA', 3, 1, 10, '16-11-2020', 0, NULL, '2020-11-15 09:37:01'),
(86, '298971573146', 'LABU JIPANG', 'JIJIJIPAPNGPANGPANG JIPANG', 3, 1, 3000, '16-11-2020', 0, NULL, '2020-11-15 10:42:50'),
(87, '918762323614', 'BAWANG MERAH', 'KEJAMM', 1, 1, 28000, '16-11-2020', 0, NULL, '2020-11-15 10:43:39'),
(88, '634588951721', 'LABU KUNING', 'LABU KUNING', 1, 1, 7000, '16-11-2020', 0, NULL, '2020-11-15 10:47:47'),
(89, '184278495326', 'CRAB STICK', 'CURAH', 4, 1, 84900, '16-11-2020', 0, NULL, '2020-11-15 10:52:13'),
(90, '728476191535', 'KACANG ARCIS', 'ARCIS', 1, 1, 32000, '16-11-2020', 0, NULL, '2020-11-15 10:52:43'),
(91, '458196391835', 'Kacang mete', '', 1, 1, 200000, '18-11-2020', 0, NULL, '2020-11-16 21:21:12'),
(92, '715285469334', 'Jagung kecil', 'Jantan', 3, 1, 20000, '18-11-2020', 0, NULL, '2020-11-16 21:21:51'),
(93, '338698421755', 'Sawi', 'Sawi', 3, 1, 8000, '18-11-2020', 0, NULL, '2020-11-16 21:22:16'),
(94, '542967867932', 'smoke beef', 'kemasan', 4, 10, 52250, '17-11-2020', 0, NULL, '2020-11-21 06:14:24'),
(95, '374296645319', 'letuce', 'kemasan', 3, 10, 10500, '17-11-2020', 0, NULL, '2020-11-21 06:15:21'),
(96, '899243178616', 'lettuce salanova', 'kemasan', 3, 10, 11000, '17-11-2020', 0, NULL, '2020-11-21 06:16:57'),
(97, '372988136957', 'KEMANGI', 'KEMANGI', 3, 8, 5000, '22-11-2020', 0, NULL, '2020-11-21 06:41:43'),
(98, '527976346824', 'YOGURT', 'KOTAK', 1, 10, 36000, '22-11-2020', 0, NULL, '2020-11-21 06:42:53'),
(99, '934567912568', 'TOMAT', 'TOMAT', 3, 1, 15000, '22-11-2020', 0, NULL, '2020-11-21 06:43:20'),
(100, '686581242459', 'BUNGA KOL', 'KOL', 3, 1, 12000, '22-11-2020', 0, NULL, '2020-11-21 06:43:45'),
(101, '351926827449', 'JAMUR KUPING', 'JAMUR', 3, 2, 13, '22-11-2020', 0, NULL, '2020-11-21 06:45:06'),
(102, '874846925611', 'JAMUR KANCING SEGAR', 'JAMUR', 3, 2, 40, '22-11-2020', 0, NULL, '2020-11-21 06:46:03'),
(103, '415845916637', 'EDAMAME', 'EDAMAME', 3, 2, 35, '22-11-2020', 0, NULL, '2020-11-21 06:46:55'),
(104, '446196577518', 'BUNCIS', 'BUNCIS', 3, 1, 10000, '22-11-2020', 0, NULL, '2020-11-21 06:47:29'),
(105, '142539681879', 'DAUNSOP DAN DAUN PREI', 'DAUN SOP', 3, 8, 5000, '22-11-2020', 0, NULL, '2020-11-21 06:48:02'),
(106, '463758729164', 'KOL UNGU', 'KOL', 3, 2, 25, '22-11-2020', 0, NULL, '2020-11-21 06:48:44'),
(107, '431689473125', 'TOMAT CERI', 'TOMAT', 3, 10, 12000, '22-11-2020', 0, NULL, '2020-11-21 06:49:09'),
(108, '396167987352', 'JIPANG', 'JIPANG', 3, 1, 6000, '22-11-2020', 0, NULL, '2020-11-21 06:49:32'),
(109, '734961296753', 'TEPUNG KETAN', 'ROSEBRAND', 1, 10, 20000, '22-11-2020', 0, NULL, '2020-11-21 06:50:51'),
(110, '329861891472', 'DAUN JERUK', 'DAUN JERUK', 3, 8, 5000, '22-11-2020', 0, NULL, '2020-11-21 06:52:39'),
(111, '426349583192', 'ROTI TAWAR', 'ROTI', 1, 10, 25000, '22-11-2020', 0, NULL, '2020-11-21 06:53:09'),
(112, '789547698135', 'saori saus tiram ', 'bungkus kecil', 1, 13, 3300, '01-12-2020', 0, NULL, '2020-12-01 07:02:24'),
(113, '319344278255', 'bayam', 'bayam', 3, 8, 5000, '01-12-2020', 0, NULL, '2020-12-01 07:02:55'),
(114, '681413298352', 'ifumie', 'ifumie patai', 1, 10, 10000, '01-12-2020', 0, NULL, '2020-12-01 07:03:26'),
(115, '132189359486', 'kincong', 'kincong', 3, 1, 12000, '01-12-2020', 0, NULL, '2020-12-01 07:04:03'),
(116, '653349478159', 'packaging bowl plastik 700ml', '', 5, 3, 2500, '01-12-2020', 0, NULL, '2020-12-01 07:04:52'),
(117, '734581262896', 'alumunium foil', 'foil', 5, 13, 23000, '01-12-2020', 0, NULL, '2020-12-01 07:05:35'),
(118, '431296458859', 'packaging bento thinwall', 'packaging ketring', 5, 3, 2200, '01-12-2020', 0, NULL, '2020-12-01 07:06:59'),
(119, '914736128934', 'saos cabai botol', 'saos', 1, 10, 26000, '01-12-2020', 0, NULL, '2020-12-01 07:18:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ingredients_unit`
--

CREATE TABLE `ingredients_unit` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ingredients_unit`
--

INSERT INTO `ingredients_unit` (`id`, `name`, `created_time`) VALUES
(1, 'kg', '2020-10-31 22:14:59'),
(2, 'gram', '2020-10-31 22:14:59'),
(3, 'buah', '2020-10-31 22:15:08'),
(4, 'butir', '2020-10-31 22:15:08'),
(5, 'dus', '2020-10-31 22:15:45'),
(6, 'ml', '2020-10-31 22:15:45'),
(7, 'kotak', '2020-10-31 22:16:17'),
(8, 'ikat', '2020-10-31 22:16:17'),
(9, 'liter', '2020-11-01 05:27:27'),
(10, 'bungkus', '2020-11-01 11:56:19'),
(11, 'sisir', '2020-11-01 11:56:19'),
(12, 'petak', '2020-11-01 11:56:38'),
(13, 'pack', '2020-11-06 06:29:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `in_stock`
--

CREATE TABLE `in_stock` (
  `id` int(11) NOT NULL,
  `ingredient_id` int(11) DEFAULT NULL,
  `entry_date` varchar(30) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `shopping_list_id` int(11) DEFAULT NULL,
  `supplier_name` varchar(100) DEFAULT NULL,
  `supplier_phone` varchar(20) DEFAULT NULL,
  `other_info` varchar(300) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `updated_time` timestamp NULL DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `order_batch_id` int(11) NOT NULL,
  `day_id` int(11) NOT NULL,
  `time_id` int(11) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id`, `name`, `category_id`, `order_batch_id`, `day_id`, `time_id`, `created_time`) VALUES
(1, 'Sour & Sweet Dorry', 1, 1, 2, 1, '2020-10-28 15:47:04'),
(2, 'Vegetarian Katsu', 1, 1, 4, 2, '2020-10-28 16:27:22'),
(3, 'Baked Chicken', 2, 1, 5, 2, '2020-10-28 16:27:40'),
(4, 'Spaghetti Bolognese', 1, 1, 1, 1, '2020-10-28 16:52:40'),
(5, 'Spaghetti Aglio Olio', 1, 2, 1, 1, '2020-10-30 03:44:58'),
(6, 'Pesto penne with grilled Chicken', 1, 2, 1, 1, '2020-10-30 16:44:22'),
(7, 'San chow bow roll maki', 1, 2, 2, 1, '2020-10-30 16:44:42'),
(8, 'Chicken cordon bleu ', 1, 2, 3, 1, '2020-10-30 16:48:08'),
(9, 'Spaghetti marinara with grilled fish', 1, 2, 4, 1, '2020-10-30 16:48:28'),
(10, 'Chicken yogurt sauce', 1, 2, 5, 1, '2020-10-30 16:48:56'),
(11, 'Chicken mushroom oyster sauce', 1, 2, 1, 2, '2020-10-30 16:51:00'),
(12, 'Spaghetti mushroom stroganof', 1, 2, 2, 2, '2020-10-30 16:51:40'),
(13, 'Spicy rice nourish bowl', 1, 2, 3, 2, '2020-10-30 16:51:57'),
(14, 'Chicken san chow bow', 1, 2, 4, 2, '2020-10-30 16:52:11'),
(15, 'Waldrof salad with sandwich vege mayo', 1, 2, 5, 2, '2020-10-30 16:52:30'),
(16, 'Chicken sambal matah with Satai Lilit', 1, 3, 1, 1, '2020-11-07 12:43:40'),
(17, 'Mushroom patty nourish bowl', 1, 3, 1, 2, '2020-11-07 12:44:02'),
(18, 'Chicken Milanese', 1, 3, 2, 1, '2020-11-07 20:03:44'),
(19, 'Chicken Creamy Glutten Free Zoodles', 1, 3, 2, 2, '2020-11-07 20:05:24'),
(20, 'Thai Seamed Fish With Jacket Potato', 1, 3, 3, 1, '2020-11-07 21:51:19'),
(21, 'Chicken Patty With Potato Wedges', 1, 3, 3, 2, '2020-11-07 21:52:17'),
(22, 'Honey Garlic Shrimp With PadThai', 1, 3, 4, 1, '2020-11-07 21:53:30'),
(23, 'Balinese Shedded Chicken', 1, 3, 4, 2, '2020-11-07 21:54:42'),
(24, 'Chicken Black Pepper With Corn Soup', 1, 3, 5, 1, '2020-11-07 21:56:56'),
(25, 'Spaghetti Chicken Bolognese', 1, 3, 5, 2, '2020-11-07 21:57:43'),
(26, 'Baked Chiken With Mashed Potato', 1, 4, 1, 1, '2020-11-14 03:49:55'),
(27, 'Fusilli Signature Skillet Supper', 1, 4, 1, 2, '2020-11-14 03:51:28'),
(28, 'Grilled Chicken Taliwang', 1, 4, 2, 1, '2020-11-14 03:52:18'),
(29, 'Chicken Kabobs With Grilled Potatoes', 1, 4, 2, 2, '2020-11-14 03:54:44'),
(30, 'Chicken Kung Pao', 1, 4, 3, 1, '2020-11-14 03:55:38'),
(31, 'Fish Fillet With puree pumpkin sauce', 1, 4, 3, 2, '2020-11-14 05:00:16'),
(32, 'Shrimp Black Pepper', 1, 4, 4, 1, '2020-11-14 05:03:08'),
(33, 'Grilled Chicken With Jacket Potato', 1, 4, 4, 2, '2020-11-14 05:04:05'),
(34, 'Fish Dabu Dabu', 1, 4, 5, 1, '2020-11-14 05:04:39'),
(35, 'Korean Kimbab', 1, 4, 5, 2, '2020-11-14 05:05:07'),
(37, 'Vegetarian katsu with mashed potato', 1, 4, 1, 1, '2020-11-14 10:19:07'),
(38, 'Beef edamames salad', 1, 4, 2, 1, '2020-11-14 10:20:12'),
(39, 'kungpao vegetable', 1, 4, 3, 1, '2020-11-14 10:20:43'),
(40, 'Spaghetti marinara with grilled fish', 1, 4, 2, 2, '2020-11-14 10:22:20'),
(41, 'Steamed fish with jacket potato', 1, 4, 4, 2, '2020-11-14 10:23:33'),
(42, 'Beef blackpepper', 1, 4, 4, 1, '2020-11-14 11:47:41'),
(43, 'Vegetable Kung Pao With Red Rice', 2, 5, 2, 1, '2020-11-16 05:57:09'),
(44, 'Korean Fried Cauliflower', 2, 5, 4, 1, '2020-11-16 05:58:38'),
(45, 'Vegetrian Katsu With Mashed Potato', 2, 6, 2, 1, '2020-11-16 06:00:27'),
(46, 'Tofu Mushroom Teriyaki', 2, 6, 4, 1, '2020-11-16 06:01:21'),
(47, 'Crispy Mushroom With Red Rice', 2, 4, 4, 1, '2020-11-16 06:02:30'),
(48, 'Beef black pepper', 1, 5, 1, 1, '2020-11-20 07:04:42'),
(49, 'Spaghetti marinara with grilled fish', 1, 5, 1, 2, '2020-11-20 07:05:10'),
(50, 'Chicken basil lettuce wrap', 1, 5, 2, 1, '2020-11-20 07:05:51'),
(51, 'Fish fillet with aioli sauce', 1, 5, 2, 2, '2020-11-20 07:06:56'),
(52, 'Grilled chicken yogurt sauce', 1, 5, 3, 1, '2020-11-20 07:07:40'),
(53, 'Chicken soup with red rice', 1, 5, 3, 2, '2020-11-20 07:08:11'),
(54, 'Grillet fish pesto sauce with aglio olio', 1, 5, 4, 1, '2020-11-20 07:08:57'),
(55, 'Chicken roulade with avocado salad', 1, 5, 4, 2, '2020-11-20 07:09:50'),
(56, 'Chicken penne tomato cream sauce', 1, 5, 5, 1, '2020-11-20 07:10:36'),
(57, 'Sauteed mix mushroom oyster sauce', 1, 5, 5, 2, '2020-11-20 07:11:24'),
(58, 'Spicy rice nourish bowl', 2, 5, 1, 1, '2020-11-20 07:14:16'),
(59, 'Vegetable kung pao', 2, 5, 2, 1, '2020-11-20 07:14:46'),
(60, 'Korean Fried Cauliflower', 2, 5, 3, 1, '2020-11-20 07:15:16'),
(61, 'Spaghetti mushroom stroganoff', 2, 5, 4, 1, '2020-11-20 07:16:04'),
(62, 'Sandiwich vege mayo', 2, 5, 5, 1, '2020-11-20 07:17:09'),
(63, 'Chicken blackpepper', 1, 5, 1, 1, '2020-11-21 00:41:18'),
(64, 'San Choy Bow', 1, 7, 1, 1, '2020-11-22 01:13:53'),
(65, 'Thai Steamed fish fillet', 2, 5, 3, 2, '2020-11-24 10:39:19'),
(66, 'Steamed fish with jacket potato', 1, 6, 1, 1, '2020-11-29 03:29:12'),
(67, 'Waldrof salad with sandwich vege mayo', 1, 6, 1, 2, '2020-11-29 03:30:56'),
(68, 'Chicken creamy gluten free zoodles', 1, 6, 2, 1, '2020-11-29 03:31:54'),
(69, 'Sweet and sour fish', 1, 6, 2, 2, '2020-11-29 03:32:54'),
(70, 'Thai steamed fish fillet', 1, 6, 3, 1, '2020-11-29 03:33:36'),
(71, 'Spaghetti chicken mushroom stroganoff', 1, 6, 3, 2, '2020-11-29 03:35:33'),
(72, 'Chicken cordon bleu', 1, 6, 4, 1, '2020-11-29 03:35:59'),
(73, 'Honey garlic shrimp with padthai', 1, 6, 4, 2, '2020-11-29 03:37:18'),
(74, 'Beef edamame salad', 1, 6, 5, 1, '2020-11-29 03:37:55'),
(75, 'Chicken milanese', 1, 6, 5, 2, '2020-11-29 03:38:18'),
(76, 'Chicken edamame salad', 1, 6, 5, 1, '2020-11-29 23:25:02'),
(77, 'Spaghetti aglio olio', 1, 6, 3, 2, '2020-11-30 00:17:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_category`
--

CREATE TABLE `menu_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu_category`
--

INSERT INTO `menu_category` (`id`, `category_name`, `created_time`) VALUES
(1, 'Healthy food', '2020-10-30 16:24:43'),
(2, 'Vegetarian', '2020-10-30 16:24:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `out_stock`
--

CREATE TABLE `out_stock` (
  `id` int(11) NOT NULL,
  `ingredient_id` int(11) DEFAULT NULL,
  `out_date` varchar(30) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `consumer_name` varchar(100) DEFAULT NULL,
  `consumer_phone` varchar(15) DEFAULT NULL,
  `reason_out_stock_id` int(11) DEFAULT NULL,
  `other_info` varchar(300) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `updated_time` timestamp NULL DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `out_stock`
--

INSERT INTO `out_stock` (`id`, `ingredient_id`, `out_date`, `quantity`, `consumer_name`, `consumer_phone`, `reason_out_stock_id`, `other_info`, `is_active`, `updated_time`, `created_time`) VALUES
(4, 11, '11/16/2020', 2453, 'Kitchen catering', '0895602364952', 1, '2453 hanya daging, tanpa tulang', 1, NULL, '2020-11-17 10:50:05'),
(5, 30, '11/16/2020', 600, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 10:56:27'),
(6, 35, '11/16/2020', 80, 'Kitchen catering', '0895605364952', 1, 'U paste', 1, NULL, '2020-11-17 10:57:54'),
(7, 87, '11/16/2020', 80, 'Kitchen catering', '0895605364952', 1, 'Untk paste taliwang', 1, NULL, '2020-11-17 10:59:02'),
(8, 47, '11/16/2020', 40, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 10:59:38'),
(9, 48, '11/16/2020', 10, 'Kitchen catering', '0895605364952', 1, 'U taliwang', 1, NULL, '2020-11-17 11:00:15'),
(10, 18, '11/16/2020', 1800, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:00:55'),
(11, 19, '11/16/2020', 100, 'Kitchen catering', '0895605364952', 1, 'Untuk menu khusus', 1, NULL, '2020-11-17 11:01:49'),
(12, 73, '11/16/2020', 1371, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:04:22'),
(13, 24, '11/16/2020', 188, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:04:59'),
(14, 34, '11/16/2020', 217, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:05:26'),
(15, 21, '11/16/2020', 350, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:07:23'),
(16, 65, '11/16/2020', 200, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:09:08'),
(17, 74, '11/16/2020', 800, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:11:37'),
(18, 11, '11/17/2020', 1675, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:13:16'),
(19, 19, '11/17/2020', 4, 'Kitchen catering', '0895605364952', 1, 'Pagi sore', 1, NULL, '2020-11-17 11:14:08'),
(20, 26, '11/17/2020', 1451, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:16:28'),
(21, 10, '11/17/2020', 1000, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:17:30'),
(22, 74, '11/17/2020', 1000, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:18:33'),
(23, 26, '11/17/2020', 1451, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:19:37'),
(24, 90, '11/17/2020', 150, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:21:40'),
(25, 24, '11/17/2020', 200, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:22:28'),
(26, 17, '11/17/2020', 200, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:23:29'),
(27, 34, '11/17/2020', 400, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:23:59'),
(28, 59, '11/16/2020', 500, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:26:17'),
(29, 11, '11/18/2020', 1700, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:27:54'),
(30, 18, '11/18/2020', 1800, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:28:30'),
(31, 26, '11/18/2020', 850, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:28:54'),
(32, 19, '11/18/2020', 2000, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:29:25'),
(33, 65, '11/18/2020', 300, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:30:19'),
(34, 32, '11/18/2020', 3, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:30:43'),
(35, 34, '11/18/2020', 250, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:31:07'),
(36, 33, '11/18/2020', 2, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:31:31'),
(37, 91, '11/18/2020', 200, 'Kitchen catering', '0895605364952', 1, '2 bks kecil', 1, NULL, '2020-11-17 11:32:27'),
(38, 74, '11/18/2020', 300, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:33:45'),
(39, 73, '11/18/2020', 200, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:34:45'),
(40, 17, '11/18/2020', 200, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:36:50'),
(41, 80, '11/18/2020', 250, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:37:48'),
(42, 76, '11/16/2020', 400, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:38:33'),
(43, 88, '11/18/2020', 974, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:39:22'),
(44, 56, '11/16/2020', 1, 'Kitchen catering', '0895605364952', 1, '', 1, NULL, '2020-11-17 11:42:29'),
(45, 11, '11/19/2020', 1550, 'Kitchen catering', '0895602364952', 1, '', 1, NULL, '2020-11-18 11:57:56'),
(46, 35, '11/19/2020', 200, 'Kitchen catering', '0895602364952', 1, '', 1, NULL, '2020-11-18 11:58:42'),
(47, 65, '11/19/2020', 300, 'Kitchen catering', '0895602364952', 1, '', 1, NULL, '2020-11-18 11:59:18'),
(48, 34, '11/19/2020', 225, 'Kitchen catering', '0895602364952', 1, '', 1, NULL, '2020-11-18 11:59:41'),
(49, 18, '11/19/2020', 1030, 'Kitchen catering', '0895602364952', 1, '', 1, NULL, '2020-11-18 12:00:56'),
(50, 30, '11/19/2020', 330, 'Kitchen catering', '0895602364952', 1, '', 1, NULL, '2020-11-18 12:01:25'),
(51, 24, '11/19/2020', 230, 'Kitchen catering', '0895602364952', 1, '', 1, NULL, '2020-11-18 12:01:47'),
(52, 86, '11/19/2020', 750, 'Kitchen catering', '0895602364952', 1, '', 1, NULL, '2020-11-18 12:02:08'),
(53, 73, '11/19/2020', 1300, 'Kitchen catering', '0895602364952', 1, '', 1, NULL, '2020-11-18 12:02:35'),
(54, 25, '11/19/2020', 331, 'Kitchen catering', '0895602364952', 1, '', 1, NULL, '2020-11-18 12:02:54'),
(55, 14, '11/19/2020', 1500, 'Kitchen catering', '0895602364952', 1, '', 1, NULL, '2020-11-18 12:03:20'),
(56, 23, '11/19/2020', 3, 'Kitchen catering', '0895602364952', 1, '', 1, NULL, '2020-11-18 12:03:46'),
(57, 19, '11/19/2020', 3570, 'Kitchen catering', '0895602364952', 1, '+bowl', 1, NULL, '2020-11-18 12:04:37'),
(58, 87, '11/19/2020', 90, 'Kitchen catering', '0895602364952', 1, '', 1, NULL, '2020-11-18 12:05:32'),
(59, 93, '11/19/2020', 375, 'Kitchen catering', '0895602364952', 1, '', 1, NULL, '2020-11-18 12:07:39'),
(60, 12, '11/23/2020', 1250, 'Kitchen catering', '0895602364952', 1, '', 1, NULL, '2020-11-27 05:53:15'),
(61, 13, '11/24/2020', 1891, 'Kitchen catering', '0895602364952', 1, '', 1, NULL, '2020-11-27 05:54:35'),
(62, 18, '11/23/2020', 1200, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 05:56:21'),
(63, 34, '11/23/2020', 1000, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 05:58:22'),
(64, 17, '11/23/2020', 480, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 05:59:25'),
(65, 65, '11/23/2020', 600, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:00:53'),
(66, 35, '11/23/2020', 300, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:01:54'),
(67, 26, '11/23/2020', 305, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:03:42'),
(68, 11, '11/24/2020', 1700, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:04:53'),
(69, 13, '11/24/2020', 1200, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:05:47'),
(70, 34, '11/24/2020', 300, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:07:44'),
(71, 65, '11/24/2020', 300, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:08:46'),
(72, 18, '11/24/2020', 2000, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:09:34'),
(73, 30, '11/24/2020', 7418, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:11:05'),
(74, 28, '11/24/2020', 450, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:12:21'),
(75, 19, '11/24/2020', 2016, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:13:33'),
(76, 24, '11/24/2020', 1296, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:14:17'),
(77, 25, '11/24/2020', 650, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:15:25'),
(78, 104, '11/24/2020', 469, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:16:49'),
(79, 26, '11/24/2020', 1200, 'Kitchen catering', '0895602346952', 2, '', 1, NULL, '2020-11-27 06:17:36'),
(80, 19, '11/25/2020', 2637, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:18:44'),
(81, 11, '11/25/2020', 3261, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:20:43'),
(82, 19, '11/25/2020', 1000, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:21:30'),
(83, 24, '11/25/2020', 350, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:22:20'),
(84, 58, '11/25/2020', 1, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:23:09'),
(85, 34, '11/25/2020', 300, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:24:06'),
(86, 35, '11/25/2020', 100, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:24:45'),
(87, 20, '11/26/2020', 2, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:25:49'),
(88, 35, '11/26/2020', 200, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:27:06'),
(89, 13, '11/26/2020', 1700, 'Kitchen catering', '089605264952', 2, '', 1, NULL, '2020-11-27 06:27:41'),
(90, 28, '11/26/2020', 350, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:28:24'),
(91, 32, '11/26/2020', 2, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:29:12'),
(92, 65, '11/26/2020', 100, 'Kitchen catering', '089602364952', 2, '', 1, NULL, '2020-11-27 06:29:58'),
(93, 19, '11/26/2020', 1600, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:30:49'),
(94, 62, '11/26/2020', 1, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:31:31'),
(95, 104, '11/26/2020', 1000, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:32:38'),
(96, 24, '11/26/2020', 100, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:33:26'),
(97, 24, '11/17/2020', 1000, 'Kitchen catering', '0895602364052', 2, '', 1, NULL, '2020-11-27 06:39:34'),
(98, 86, '', 1000, 'Kitchen catering', '0895602364052', 2, '', 1, NULL, '2020-11-27 06:40:13'),
(99, 99, '11/27/2020', 1300, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:41:20'),
(100, 22, '11/27/2020', 500, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:41:56'),
(101, 11, '11/27/2020', 2800, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:42:39'),
(102, 34, '11/27/2020', 300, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:43:33'),
(103, 35, '11/27/2020', 200, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:45:14'),
(104, 90, '11/27/2020', 300, 'Kitchen catering', '0895602364952', 2, '', 1, NULL, '2020-11-27 06:46:13'),
(105, 72, '11/27/2020', 1, 'Kitchen catering', '0895602364952', 3, 'Tolong urutkan nama bahan sesuai abjad dan sesuaikan dengan jenisnya', 1, NULL, '2020-11-27 06:48:37'),
(106, 19, '11/30/2020', 5300, 'Kitchen catering', '089560236952', 1, '', 1, NULL, '2020-11-30 06:33:01'),
(107, 13, '11/30/2020', 5, 'Kitchen catering', '089560236952', 1, 'Mahi dan ikan nila', 1, NULL, '2020-11-30 06:34:07'),
(108, 35, '11/30/2020', 300, 'Kitchen catering', '089560236952', 1, '', 1, NULL, '2020-11-30 06:34:32'),
(109, 30, '11/30/2020', 1000, 'Kitchen catering', '089560236952', 1, '', 1, NULL, '2020-11-30 06:34:54'),
(110, 73, '11/30/2020', 2, 'Kitchen catering', '089560236952', 1, '', 1, NULL, '2020-11-30 06:35:30'),
(111, 78, '11/30/2020', 300, 'Kitchen catering', '089560236952', 1, '', 1, NULL, '2020-11-30 06:36:32'),
(112, 111, '11/30/2020', 3, 'Kitchen catering', '089560236952', 1, '', 1, NULL, '2020-11-30 06:37:19'),
(113, 91, '11/30/2020', 1, 'Kitchen catering', '089560236952', 1, '', 1, NULL, '2020-11-30 06:39:43'),
(114, 28, '11/30/2020', 300, 'Kitchen catering', '089560236952', 1, '', 1, NULL, '2020-11-30 06:40:08'),
(115, 23, '11/30/2020', 10, 'Kitchen catering', '089560236952', 1, '', 1, NULL, '2020-11-30 06:40:38'),
(116, 29, '11/30/2020', 200, 'Kitchen catering', '089560236952', 1, '', 1, NULL, '2020-11-30 06:41:01'),
(117, 26, '11/30/2020', 600, 'Kitchen catering', '089560236952', 1, '', 1, NULL, '2020-11-30 06:41:22'),
(118, 18, '11/30/2020', 6, 'Kitchen catering', '089560236952', 1, '', 1, NULL, '2020-11-30 06:41:51'),
(119, 17, '11/30/2020', 300, 'Kitchen catering', '089560236952', 1, '', 1, NULL, '2020-11-30 06:42:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_type`
--

CREATE TABLE `payment_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `payment_type`
--

INSERT INTO `payment_type` (`id`, `name`) VALUES
(1, 'Tunai'),
(2, 'Hutang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reason_out_stock`
--

CREATE TABLE `reason_out_stock` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `reason_out_stock`
--

INSERT INTO `reason_out_stock` (`id`, `name`, `created_time`) VALUES
(1, 'Produksi', '2020-11-01 03:50:40'),
(2, 'Dijual', '2020-11-01 03:50:40'),
(3, 'Kadaluarsa', '2020-11-01 03:50:56'),
(4, 'Tidak Sesuai', '2020-11-01 03:50:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id`, `name`, `is_deleted`) VALUES
(1, 'admin', 0),
(2, 'mitra', 0),
(3, 'member', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `shopping_list`
--

CREATE TABLE `shopping_list` (
  `id` int(11) NOT NULL,
  `number_reference` varchar(20) DEFAULT NULL,
  `shopping_plan_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `shopping_place` varchar(100) DEFAULT NULL,
  `shopping_date` varchar(30) DEFAULT NULL,
  `payment_type_id` int(11) DEFAULT NULL,
  `total_costs` int(11) DEFAULT NULL,
  `money_source` varchar(200) DEFAULT NULL,
  `other_costs` int(11) DEFAULT NULL,
  `other_costs_detail` varchar(200) DEFAULT NULL,
  `other_info` longtext,
  `status` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `updated_time` timestamp NULL DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `shopping_list`
--

INSERT INTO `shopping_list` (`id`, `number_reference`, `shopping_plan_id`, `name`, `phone`, `shopping_place`, `shopping_date`, `payment_type_id`, `total_costs`, `money_source`, `other_costs`, `other_costs_detail`, `other_info`, `status`, `is_active`, `updated_time`, `created_time`) VALUES
(15, '876486331529492', 8, 'TIRTA MAHARDIKA', NULL, '-', '16-11-2020', 1, 837000, '-', 7000, 'PARKIR MMTC DAN BRASTAGI SUPERMARKET MANHATTAN', '-', 1, 1, NULL, '2020-11-15 16:56:45'),
(16, '725135631492967', 9, 'TIRTA MAHARDIKA', NULL, '-', '16-11-2020', 1, 17000, '-', 0, '-', '-', 1, 1, NULL, '2020-11-15 17:45:35'),
(17, '352795624913671', 10, 'TIRTA MAHARDIKA', NULL, '-', '15-11-2020', 1, 296095, '-', 0, '-', 'BRASTAGI SUPERMARKET', 1, 1, NULL, '2020-11-15 17:55:42'),
(18, '754132635291679', NULL, 'Tirta Mahardika', NULL, 'Cemara, mmtc, dan pringgan', '18-11-2020', 1, 739000, 'Transfer gio', 14000, 'Bengsin dan parkir', 'Cemara dan mmtc', 1, 1, NULL, '2020-11-17 04:30:36'),
(19, '376581821746939', 12, 'Tirta Mahardika', NULL, 'Pringgan', '18-11-2020', 1, 57000, 'Transfer gio', 1000, 'Parkir', '-', 1, 1, NULL, '2020-11-17 05:37:17'),
(20, '122715983938656', 13, 'TIRTA MAHARDIKA', NULL, 'BRASTAGI SUPERMARKET', '17-11-2020', 1, 165185, 'TRANSFER GIO', 0, '-', '-', 1, 1, NULL, '2020-11-21 13:22:01'),
(21, '767328419341956', 14, 'TIRTA MAHARDIKA', NULL, '-', '22-11-2020', 1, 2444052, '-', 0, '-', '-', 1, 1, NULL, '2020-11-30 18:56:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `shopping_list_item`
--

CREATE TABLE `shopping_list_item` (
  `id` int(11) NOT NULL,
  `shopping_list_id` int(11) DEFAULT NULL,
  `ingredient_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` int(11) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `is_in_stock` tinyint(1) DEFAULT '0',
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `shopping_list_item`
--

INSERT INTO `shopping_list_item` (`id`, `shopping_list_id`, `ingredient_id`, `quantity`, `unit_price`, `total_price`, `is_in_stock`, `is_active`, `created_time`) VALUES
(143, 15, 10, 1500, 18, 28000, 0, 1, '2020-11-15 09:56:45'),
(144, 15, 73, 2, 16000, 32000, 0, 1, '2020-11-15 09:56:45'),
(145, 15, 74, 2, 10000, 20000, 0, 1, '2020-11-15 09:56:45'),
(146, 15, 76, 800, 30, 24000, 0, 1, '2020-11-15 09:56:45'),
(147, 15, 80, 10000, 2, 15000, 0, 1, '2020-11-15 09:56:45'),
(148, 15, 72, 1, 10000, 10000, 0, 1, '2020-11-15 09:56:45'),
(149, 15, 59, 2, 14000, 28000, 0, 1, '2020-11-15 09:56:45'),
(150, 15, 30, 2000, 9, 18000, 0, 1, '2020-11-15 09:56:45'),
(151, 15, 35, 1000, 22, 22000, 0, 1, '2020-11-15 09:56:45'),
(152, 15, 34, 1000, 20, 20000, 0, 1, '2020-11-15 09:56:45'),
(153, 15, 24, 3500, 7, 25000, 0, 1, '2020-11-15 09:56:45'),
(154, 15, 47, 500, 48, 24000, 0, 1, '2020-11-15 09:56:45'),
(155, 15, 32, 3, 2000, 6000, 0, 1, '2020-11-15 09:56:45'),
(156, 15, 31, 4, 5000, 20000, 0, 1, '2020-11-15 09:56:45'),
(157, 15, 67, 250, 48, 12000, 0, 1, '2020-11-15 09:56:45'),
(158, 15, 68, 500, 6, 3000, 0, 1, '2020-11-15 09:56:45'),
(159, 15, 11, 10, 36000, 360000, 0, 1, '2020-11-15 09:56:45'),
(160, 15, 65, 600, 41, 25000, 0, 1, '2020-11-15 09:56:45'),
(161, 15, 19, 10, 10000, 100000, 0, 1, '2020-11-15 09:56:45'),
(162, 15, 26, 3000, 15, 45000, 0, 1, '2020-11-15 09:56:45'),
(163, 16, 87, 1, 14000, 14000, 0, 1, '2020-11-15 10:45:35'),
(164, 16, 86, 1, 3000, 3000, 0, 1, '2020-11-15 10:45:35'),
(165, 17, 52, 1000, 50, 50950, 0, 1, '2020-11-15 10:55:42'),
(166, 17, 57, 1, 105000, 105000, 0, 1, '2020-11-15 10:55:42'),
(167, 17, 62, 2, 29800, 59600, 0, 1, '2020-11-15 10:55:42'),
(168, 17, 88, 1, 6846, 6846, 0, 1, '2020-11-15 10:55:42'),
(169, 17, 89, 1, 59939, 59939, 0, 1, '2020-11-15 10:55:42'),
(170, 17, 90, 1, 13760, 13760, 0, 1, '2020-11-15 10:55:42'),
(179, 18, 13, 15, 10000, 150000, 0, 1, '2020-11-16 21:32:14'),
(180, 18, 11, 10, 35000, 350000, 0, 1, '2020-11-16 21:32:14'),
(181, 18, 14, 2, 68000, 136000, 0, 1, '2020-11-16 21:32:14'),
(182, 18, 92, 1, 10000, 10000, 0, 1, '2020-11-16 21:32:14'),
(183, 18, 93, 1, 8000, 8000, 0, 1, '2020-11-16 21:32:14'),
(184, 18, 74, 2, 7500, 15000, 0, 1, '2020-11-16 21:32:14'),
(185, 18, 73, 3, 10000, 30000, 0, 1, '2020-11-16 21:32:14'),
(186, 18, 91, 1, 40000, 40000, 0, 1, '2020-11-16 21:32:14'),
(187, 19, 10, 2000, 15, 30000, 0, 1, '2020-11-16 22:37:17'),
(188, 19, 66, 500, 10, 5000, 0, 1, '2020-11-16 22:37:17'),
(189, 19, 43, 1, 10000, 10000, 0, 1, '2020-11-16 22:37:17'),
(190, 19, 33, 3, 4000, 12000, 0, 1, '2020-11-16 22:37:17'),
(191, 20, 94, 1, 52250, 52250, 0, 1, '2020-11-21 06:22:01'),
(192, 20, 25, 2000, 6, 10523, 0, 1, '2020-11-21 06:22:01'),
(193, 20, 28, 1000, 9, 9000, 0, 1, '2020-11-21 06:22:01'),
(194, 20, 95, 1, 10500, 10500, 0, 1, '2020-11-21 06:22:01'),
(195, 20, 96, 1, 11000, 11000, 0, 1, '2020-11-21 06:22:01'),
(196, 20, 65, 700, 42, 28912, 0, 1, '2020-11-21 06:22:01'),
(197, 20, 23, 30, 1434, 43000, 0, 1, '2020-11-21 06:22:01'),
(198, 21, 11, 20, 34950, 699000, 0, 1, '2020-11-30 18:56:04'),
(199, 21, 12, 2, 125000, 250000, 0, 1, '2020-11-30 18:56:04'),
(200, 21, 13, 10, 16000, 160000, 0, 1, '2020-11-30 18:56:04'),
(201, 21, 14, 2, 65000, 130000, 0, 1, '2020-11-30 18:56:04'),
(202, 21, 34, 1500, 24, 36000, 0, 1, '2020-11-30 18:56:04'),
(203, 21, 35, 1000, 22, 22000, 0, 1, '2020-11-30 18:56:04'),
(204, 21, 87, 1, 28000, 28000, 0, 1, '2020-11-30 18:56:04'),
(205, 21, 20, 5, 15000, 75000, 0, 1, '2020-11-30 18:56:04'),
(206, 21, 84, 1000, 30, 30000, 0, 1, '2020-11-30 18:56:04'),
(207, 21, 58, 2, 13500, 27000, 0, 1, '2020-11-30 18:56:04'),
(208, 21, 63, 3, 12500, 37500, 0, 1, '2020-11-30 18:56:04'),
(209, 21, 32, 4, 5000, 20000, 0, 1, '2020-11-30 18:56:04'),
(210, 21, 33, 3, 4500, 13500, 0, 1, '2020-11-30 18:56:04'),
(211, 21, 28, 3000, 4, 12000, 0, 1, '2020-11-30 18:56:04'),
(212, 21, 19, 10, 11000, 110000, 0, 1, '2020-11-30 18:56:04'),
(213, 21, 10, 1, 41262, 41262, 0, 1, '2020-11-30 18:56:04'),
(214, 21, 65, 1000, 50, 50000, 0, 1, '2020-11-30 18:56:04'),
(215, 21, 23, 30, 1333, 39990, 0, 1, '2020-11-30 18:56:04'),
(216, 21, 26, 3000, 13, 39000, 0, 1, '2020-11-30 18:56:04'),
(217, 21, 90, 1, 25000, 25000, 0, 1, '2020-11-30 18:56:04'),
(218, 21, 30, 1000, 10, 10000, 0, 1, '2020-11-30 18:56:04'),
(219, 21, 25, 1000, 5, 5000, 0, 1, '2020-11-30 18:56:04'),
(220, 21, 74, 4, 10000, 40000, 0, 1, '2020-11-30 18:56:04'),
(221, 21, 83, 1000, 12, 12000, 0, 1, '2020-11-30 18:56:04'),
(222, 21, 76, 500, 61, 30500, 0, 1, '2020-11-30 18:56:04'),
(223, 21, 73, 4, 18250, 73000, 0, 1, '2020-11-30 18:56:04'),
(224, 21, 59, 6, 13450, 80700, 0, 1, '2020-11-30 18:56:04'),
(225, 21, 18, 10, 12500, 125000, 0, 1, '2020-11-30 18:56:04'),
(226, 21, 37, 500, 23, 11500, 0, 1, '2020-11-30 18:56:04'),
(227, 21, 38, 400, 138, 55200, 0, 1, '2020-11-30 18:56:04'),
(228, 21, 56, 2, 28850, 57700, 0, 1, '2020-11-30 18:56:04'),
(229, 21, 62, 2, 23000, 46000, 0, 1, '2020-11-30 18:56:04'),
(230, 21, 54, 1, 14000, 14000, 0, 1, '2020-11-30 18:56:04'),
(231, 21, 60, 4, 4300, 17200, 0, 1, '2020-11-30 18:56:04'),
(232, 21, 42, 1000, 11, 11000, 0, 1, '2020-11-30 18:56:04'),
(233, 21, 72, 1, 10000, 10000, 0, 1, '2020-11-30 18:56:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `shopping_plan`
--

CREATE TABLE `shopping_plan` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `shopping_date` varchar(30) DEFAULT NULL,
  `other_info` varchar(300) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `shopping_plan`
--

INSERT INTO `shopping_plan` (`id`, `name`, `shopping_date`, `other_info`, `status`, `is_active`, `created_time`, `updated_time`) VALUES
(8, 'TIRTA MAHARDIKA', '16-11-2020', '', 2, 1, '2020-11-15 16:48:35', NULL),
(9, 'TIRTA MAHARDIKA', '16-11-2020', '', 2, 1, '2020-11-15 17:44:52', NULL),
(10, 'TIRTA MAHARDIKA', '15-11-2020', 'BRASTAGI SUPERMARKET', 2, 1, '2020-11-15 17:51:28', NULL),
(11, 'Tirta Mahardika', '18-11-2020', 'Cemara dan mmtc', 2, 1, '2020-11-17 04:26:11', NULL),
(12, 'Tirta Mahardika', '18-11-2020', '', 2, 1, '2020-11-17 05:34:49', NULL),
(13, 'TIRTA MAHARDIKA', '17-11-2020', '', 2, 1, '2020-11-21 13:19:27', NULL),
(14, 'TIRTA MAHARDIKA', '22-11-2020', '', 2, 1, '2020-11-21 13:39:09', NULL),
(15, 'TIRTA MAHARDIKA', '01-12-2020', '', 1, 1, '2020-12-01 06:46:46', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `shopping_plan_list`
--

CREATE TABLE `shopping_plan_list` (
  `id` int(11) NOT NULL,
  `shopping_plan_id` int(11) DEFAULT NULL,
  `ingredient_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `notes` varchar(300) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `shopping_plan_list`
--

INSERT INTO `shopping_plan_list` (`id`, `shopping_plan_id`, `ingredient_id`, `quantity`, `notes`, `is_active`, `created_time`) VALUES
(54, 8, 10, 1500, NULL, 1, '2020-11-15 16:48:49'),
(55, 8, 73, 2, NULL, 1, '2020-11-15 16:48:49'),
(56, 8, 74, 2, NULL, 1, '2020-11-15 16:48:49'),
(57, 8, 76, 800, NULL, 1, '2020-11-15 16:48:49'),
(58, 8, 80, 10000, NULL, 1, '2020-11-15 16:48:49'),
(59, 8, 72, 1, NULL, 1, '2020-11-15 16:48:49'),
(60, 8, 59, 2, NULL, 1, '2020-11-15 16:48:49'),
(61, 8, 30, 2000, NULL, 1, '2020-11-15 16:48:49'),
(62, 8, 35, 1000, NULL, 1, '2020-11-15 16:48:49'),
(63, 8, 34, 1000, NULL, 1, '2020-11-15 16:48:49'),
(64, 8, 24, 3500, NULL, 1, '2020-11-15 16:48:49'),
(65, 8, 47, 500, NULL, 1, '2020-11-15 16:48:49'),
(66, 8, 32, 3, NULL, 1, '2020-11-15 16:48:49'),
(67, 8, 31, 4, NULL, 1, '2020-11-15 16:48:49'),
(68, 8, 67, 250, NULL, 1, '2020-11-15 16:48:49'),
(69, 8, 68, 500, NULL, 1, '2020-11-15 16:48:49'),
(70, 8, 11, 10, NULL, 1, '2020-11-15 16:48:49'),
(71, 8, 65, 600, NULL, 1, '2020-11-15 16:48:49'),
(72, 8, 19, 10, NULL, 1, '2020-11-15 16:48:49'),
(73, 8, 26, 3000, NULL, 1, '2020-11-15 16:48:49'),
(74, 9, 87, 1, NULL, 1, '2020-11-15 17:44:52'),
(75, 9, 86, 1, NULL, 1, '2020-11-15 17:44:52'),
(80, 10, 52, 1000, NULL, 1, '2020-11-15 17:53:35'),
(81, 10, 57, 1, NULL, 1, '2020-11-15 17:53:35'),
(82, 10, 62, 2, NULL, 1, '2020-11-15 17:53:35'),
(83, 10, 88, 1, NULL, 1, '2020-11-15 17:53:35'),
(84, 10, 89, 1, NULL, 1, '2020-11-15 17:53:35'),
(85, 10, 90, 1, NULL, 1, '2020-11-15 17:53:35'),
(86, 11, 13, 15, NULL, 1, '2020-11-17 04:26:11'),
(87, 11, 11, 10, NULL, 1, '2020-11-17 04:26:11'),
(88, 11, 14, 2, NULL, 1, '2020-11-17 04:26:11'),
(89, 11, 92, 0, NULL, 1, '2020-11-17 04:26:11'),
(90, 11, 93, 1, NULL, 1, '2020-11-17 04:26:11'),
(91, 11, 74, 2, NULL, 1, '2020-11-17 04:26:11'),
(92, 11, 73, 3, NULL, 1, '2020-11-17 04:26:11'),
(93, 11, 91, 1, NULL, 1, '2020-11-17 04:26:11'),
(94, 12, 10, 2, NULL, 1, '2020-11-17 05:34:49'),
(95, 12, 66, 1, NULL, 1, '2020-11-17 05:34:49'),
(96, 12, 43, 0, NULL, 1, '2020-11-17 05:34:49'),
(97, 12, 33, 3, NULL, 1, '2020-11-17 05:34:49'),
(98, 13, 94, 1, NULL, 1, '2020-11-21 13:19:27'),
(99, 13, 25, 2000, NULL, 1, '2020-11-21 13:19:27'),
(100, 13, 28, 1000, NULL, 1, '2020-11-21 13:19:27'),
(101, 13, 95, 1, NULL, 1, '2020-11-21 13:19:27'),
(102, 13, 96, 1, NULL, 1, '2020-11-21 13:19:27'),
(103, 13, 65, 700, NULL, 1, '2020-11-21 13:19:27'),
(104, 13, 23, 30, NULL, 1, '2020-11-21 13:19:27'),
(105, 14, 11, 20, NULL, 1, '2020-11-21 13:39:09'),
(106, 14, 12, 2, NULL, 1, '2020-11-21 13:39:09'),
(107, 14, 13, 10, NULL, 1, '2020-11-21 13:39:09'),
(108, 14, 14, 2, NULL, 1, '2020-11-21 13:39:09'),
(109, 14, 34, 1500, NULL, 1, '2020-11-21 13:39:09'),
(110, 14, 35, 1000, NULL, 1, '2020-11-21 13:39:09'),
(111, 14, 87, 1, NULL, 1, '2020-11-21 13:39:09'),
(112, 14, 20, 5, NULL, 1, '2020-11-21 13:39:09'),
(113, 14, 84, 1000, NULL, 1, '2020-11-21 13:39:09'),
(114, 14, 58, 2, NULL, 1, '2020-11-21 13:39:09'),
(115, 14, 63, 3, NULL, 1, '2020-11-21 13:39:09'),
(116, 14, 32, 4, NULL, 1, '2020-11-21 13:39:09'),
(117, 14, 33, 3, NULL, 1, '2020-11-21 13:39:09'),
(118, 14, 28, 3000, NULL, 1, '2020-11-21 13:39:09'),
(119, 14, 19, 10, NULL, 1, '2020-11-21 13:39:09'),
(120, 14, 10, 1, NULL, 1, '2020-11-21 13:39:09'),
(121, 14, 65, 1000, NULL, 1, '2020-11-21 13:39:09'),
(122, 14, 23, 30, NULL, 1, '2020-11-21 13:39:09'),
(123, 14, 26, 3000, NULL, 1, '2020-11-21 13:39:09'),
(124, 14, 90, 1, NULL, 1, '2020-11-21 13:39:09'),
(125, 14, 30, 1000, NULL, 1, '2020-11-21 13:39:09'),
(126, 14, 25, 1000, NULL, 1, '2020-11-21 13:39:09'),
(127, 14, 74, 4, NULL, 1, '2020-11-21 13:39:09'),
(128, 14, 10, 3000, NULL, 1, '2020-11-21 13:39:09'),
(129, 14, 82, 2000, NULL, 1, '2020-11-21 13:39:09'),
(130, 14, 83, 1000, NULL, 1, '2020-11-21 13:39:09'),
(131, 14, 76, 500, NULL, 1, '2020-11-21 13:39:09'),
(132, 14, 79, 250, NULL, 1, '2020-11-21 13:39:09'),
(133, 14, 73, 4, NULL, 1, '2020-11-21 13:39:09'),
(134, 14, 59, 5, NULL, 1, '2020-11-21 13:39:09'),
(135, 14, 49, 1, NULL, 1, '2020-11-21 13:39:09'),
(136, 14, 18, 10, NULL, 1, '2020-11-21 13:39:09'),
(137, 14, 37, 500, NULL, 1, '2020-11-21 13:39:09'),
(138, 14, 38, 500, NULL, 1, '2020-11-21 13:39:09'),
(139, 14, 56, 2, NULL, 1, '2020-11-21 13:39:09'),
(140, 14, 62, 2, NULL, 1, '2020-11-21 13:39:09'),
(141, 14, 54, 1, NULL, 1, '2020-11-21 13:39:09'),
(142, 14, 60, 2, NULL, 1, '2020-11-21 13:39:09'),
(143, 14, 42, 1000, NULL, 1, '2020-11-21 13:39:09'),
(144, 14, 72, 1, NULL, 1, '2020-11-21 13:39:09'),
(254, 15, 24, 1000, NULL, 1, '2020-12-01 07:18:59'),
(255, 15, 29, 1000, NULL, 1, '2020-12-01 07:18:59'),
(256, 15, 26, 1000, NULL, 1, '2020-12-01 07:18:59'),
(257, 15, 25, 1000, NULL, 1, '2020-12-01 07:18:59'),
(258, 15, 30, 1000, NULL, 1, '2020-12-01 07:18:59'),
(259, 15, 13, 3, NULL, 1, '2020-12-01 07:18:59'),
(260, 15, 35, 1000, NULL, 1, '2020-12-01 07:18:59'),
(261, 15, 34, 1000, NULL, 1, '2020-12-01 07:18:59'),
(262, 15, 24, 2000, NULL, 1, '2020-12-01 07:18:59'),
(263, 15, 26, 2000, NULL, 1, '2020-12-01 07:18:59'),
(264, 15, 25, 1000, NULL, 1, '2020-12-01 07:18:59'),
(265, 15, 105, 1, NULL, 1, '2020-12-01 07:18:59'),
(266, 15, 68, 1000, NULL, 1, '2020-12-01 07:18:59'),
(267, 15, 45, 1, NULL, 1, '2020-12-01 07:18:59'),
(268, 15, 66, 1000, NULL, 1, '2020-12-01 07:18:59'),
(269, 15, 30, 2000, NULL, 1, '2020-12-01 07:18:59'),
(270, 15, 65, 1000, NULL, 1, '2020-12-01 07:18:59'),
(271, 15, 19, 36, NULL, 1, '2020-12-01 07:19:00'),
(272, 15, 47, 250, NULL, 1, '2020-12-01 07:19:00'),
(273, 15, 99, 1, NULL, 1, '2020-12-01 07:19:00'),
(274, 15, 74, 4, NULL, 1, '2020-12-01 07:19:00'),
(275, 15, 73, 3, NULL, 1, '2020-12-01 07:19:00'),
(276, 15, 10, 4, NULL, 1, '2020-12-01 07:19:00'),
(277, 15, 41, 1000, NULL, 1, '2020-12-01 07:19:00'),
(278, 15, 17, 10, NULL, 1, '2020-12-01 07:19:00'),
(279, 15, 110, 1, NULL, 1, '2020-12-01 07:19:00'),
(280, 15, 78, 500, NULL, 1, '2020-12-01 07:19:00'),
(281, 15, 73, 4, NULL, 1, '2020-12-01 07:19:00'),
(282, 15, 56, 3, NULL, 1, '2020-12-01 07:19:00'),
(283, 15, 91, 1, NULL, 1, '2020-12-01 07:19:00'),
(284, 15, 10, 1, NULL, 1, '2020-12-01 07:19:00'),
(285, 15, 111, 3, NULL, 1, '2020-12-01 07:19:00'),
(286, 15, 13, 10, NULL, 1, '2020-12-01 07:19:00'),
(287, 15, 14, 1, NULL, 1, '2020-12-01 07:19:00'),
(288, 15, 15, 1, NULL, 1, '2020-12-01 07:19:00'),
(289, 15, 114, 2, NULL, 1, '2020-12-01 07:19:00'),
(290, 15, 115, 1, NULL, 1, '2020-12-01 07:19:00'),
(291, 15, 113, 2, NULL, 1, '2020-12-01 07:19:00'),
(292, 15, 117, 1, NULL, 1, '2020-12-01 07:19:00'),
(293, 15, 112, 1, NULL, 1, '2020-12-01 07:19:00'),
(294, 15, 118, 50, NULL, 1, '2020-12-01 07:19:00'),
(295, 15, 28, 1500, NULL, 1, '2020-12-01 07:19:00'),
(296, 15, 119, 1, NULL, 1, '2020-12-01 07:19:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(36) NOT NULL,
  `password_validation` varchar(36) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `user_status_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updated_time` timestamp NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `password_validation`, `fullname`, `email`, `phone`, `nik`, `address`, `image_url`, `user_status_id`, `role_id`, `is_deleted`, `created_time`, `updated_time`) VALUES
(6, 'adminbaru', 'R?)?????a? <z??\\+??/?T', '', 'admin', 'admin@gmail.com', '89765412312', NULL, 'medan', '', 1, 1, 0, '2020-04-24 03:40:11', '2020-04-24 03:40:11'),
(12, 'admin', '21232f297a57a5a743894a0e4a801fc3', '', 'hanif', 'hanifsalafi456@gmail.com', '082328323', NULL, 'Binjai', '', 3, 2, 0, '2020-04-24 03:52:25', '2020-07-23 15:46:39'),
(13, 'salafihanif5ea5ffef', '2cd756c61b7344d639f7082a24885d5b', 'kjsahgadua', 'salafi hanif', 'hanifsalafi456@gmail.com', '08976521412412', NULL, 'medan', 'https://google.com', 1, 2, 0, '2020-04-26 09:41:03', '2020-04-26 09:41:03'),
(33, 'hanifsalafi5ea61783', '6a2b39792cd945c04307d5e53aa9e989', '03e9227895bc', 'hanif salafi', 'hanifsalafi456@gmail.com', '08976521412412', NULL, 'medan', 'https://google.com', 1, 2, 0, '2020-04-26 11:21:39', '2020-04-26 11:21:39'),
(34, 'hanifsalafiiiii5ea617cf', '86b1f44d142637da6b254b91d23030b1', '459e0c28b98c', 'hanif salafiiiii', 'hanifsalafi456@gmail.com', '08976521412412', NULL, 'medan', NULL, 1, 2, 0, '2020-04-26 11:22:55', '2020-04-26 11:22:55'),
(35, '5ea61ed0', '3fd1acec6867cc2e95bcb16a6d9a2e72', '56e72cfeae11', ' ', NULL, NULL, NULL, NULL, NULL, 1, 2, 0, '2020-04-26 11:52:48', '2020-04-26 11:52:48'),
(36, 'hanifsalafi5ea6227e', '010284868b1d91e18268f88c560a9e9c', 'b72350b86aee', 'hanif salafi', 'hanfias@gmail.com', '98075654867', NULL, 'medanASD', NULL, 1, 2, 0, '2020-04-26 12:08:30', '2020-04-26 12:08:30'),
(37, 'hanifsalafi5ea62301', 'd1aacb0a7531284d99e9447744db330f', 'c3bde13d2170', 'hanif salafi', 'hanfi@gmail.com', '23123123', NULL, 'medan', NULL, 1, 2, 0, '2020-04-26 12:10:41', '2020-04-26 12:10:41'),
(38, 'hanifsalafi5ea623a9', 'fe5694a6cf3bdf47270e6d03145b2082', '7c4691f1eabe', 'hanif salafi', 'hanifsalafi@gmail.com', '97958676', NULL, 'medan', NULL, 1, 2, 0, '2020-04-26 12:13:29', '2020-04-26 12:13:29'),
(39, 'admin_web', '21232f297a57a5a743894a0e4a801fc3', '', 'admin web', 'adminweb@gmail.com', '082369433456', NULL, 'medan', '', 1, 1, 0, '2020-04-27 17:40:29', '2020-04-27 17:40:29'),
(41, '_5eaa3a82', 'b6d192301bf17ad9d4eef06514bab123', 'cea3c48c432f', ' ', '', '', NULL, '', NULL, 1, 2, 0, '2020-04-29 14:40:02', '2020-04-29 14:40:02'),
(42, 'hanifsalafi_5eaa3ab5', '925d74964b40c4840f1e8b07c0ee4a7b', 'a2ed957013bf', 'hanif salafi', 'hanifsalafi456@gmail.com', '0823693433456', NULL, 'Medan Binjai', NULL, 1, 2, 0, '2020-04-29 14:40:53', '2020-04-29 14:40:53'),
(43, 'almiraichasalafi_5eab4e52', '991bcc29c05f7d7a1e418be6deac70b6', '15f4c0dcef22', 'almira icha salafi', 'hanifsalafi@gmail.com', '08236943', NULL, 'Johorrrrrr', NULL, 1, 2, 0, '2020-04-30 10:16:50', '2020-04-30 10:16:50'),
(44, 'almiraichasalafi_5eab4ecc', '1e18357dec37572bcc950bc03e5e2d58', 'ffbf82982b23', 'almira icha salafi', 'hanifsalafi456@gmail.com', '082369433456', NULL, 'Johorrrrrrrrr', NULL, 0, 2, 0, '2020-04-30 10:18:52', '2020-04-30 10:18:52'),
(45, 'almirasalafi_5eab4f83', '6bb79db1991fd7e17fec4b4674c982eb', 'a2ce44f2417a', 'almira salafi', 'hanifsalafi456@gmail.com', '08976521412412', NULL, 'medan', NULL, 0, 2, 0, '2020-04-30 10:21:55', '2020-04-30 10:21:55'),
(46, 'almiraicha_5eab4f9e', '609f5298eab4e38e30ab751a16d9b446', '3d2038b4cf5d', 'almira icha', 'hanifsalafi456@gmail.com', '08976521412412', NULL, 'medan', NULL, 0, 2, 0, '2020-04-30 10:22:22', '2020-04-30 10:22:22'),
(47, 'almiraicha_5eab4ff5', 'a2469738605b408c0411a2cc70225842', '79d39638296f', 'almira icha', 'hanifsalafi@gmail.com', '082323232', NULL, 'medan johorrrr', NULL, 0, 2, 0, '2020-04-30 10:23:49', '2020-04-30 10:23:49'),
(48, 'hanifsalafi', '827ccb0eea8a706c4c34a16891f84e7b', '', 'hanif salafi', 'hanifsalafi@gmail.com', '213213123', NULL, 'Bandung', NULL, 0, 2, 0, '2020-05-02 16:52:17', '2020-05-03 07:14:01'),
(49, 'testtea', '21232f297a57a5a743894a0e4a801fc3', '', 'testeee', 'andisa@gmail.com', NULL, NULL, NULL, NULL, 0, 2, 0, '2020-05-02 16:54:08', '2020-05-02 16:54:08'),
(61, 'hanifsalafissss', 'd41d8cd98f00b204e9800998ecf8427e', '', 'hanifs', 'hanf2@gmail.com', NULL, NULL, NULL, NULL, 0, 2, 0, '2020-05-03 05:10:10', '2020-05-03 05:10:10'),
(62, 'almirahanif', '21232f297a57a5a743894a0e4a801fc3', '', 'hanifsalafi', 'hanif@gmail.com', NULL, NULL, NULL, NULL, 0, 1, 0, '2020-05-03 05:15:24', '2020-05-03 05:15:24'),
(63, 'hanifs', '21232f297a57a5a743894a0e4a801fc3', '', 'hanifsalafi', 'hanif@gmail.com', NULL, NULL, NULL, NULL, 0, 2, 0, '2020-05-03 05:23:54', '2020-05-03 05:23:54'),
(64, 'salafi', 'ff986c0cc3267624cbe3bf97aa5dc2e3', '', 'salafi', 'salafi@gmail.com', '082369434343', NULL, 'EMdan Johor', NULL, 0, 2, 0, '2020-05-03 08:34:35', '2020-05-03 08:35:00'),
(65, 'almiraichaa', '21232f297a57a5a743894a0e4a801fc3', '', 'almira ichaa', 'almiraichaa@gmail.com', '0823972453', NULL, 'Medan Johor', NULL, 0, 2, 0, '2020-05-03 09:01:11', '2020-05-03 09:01:45'),
(66, 'almiraicha', '480a515799f78099f1bf6835b5c2c3ac', '', 'almira icha salafi', 'almiraicha@gmail.com', '082181715136', NULL, 'Jakarta Barat', NULL, 0, 2, 0, '2020-05-03 09:15:57', '2020-05-03 09:16:32'),
(67, 'hanifsalafianindy_5ebce10e', '9eacf960c991910aa855ee3f3760132e', '6e8774287868', 'hanif salafi anindy', 'hanifsalafi456@gmail.com', '0982093768123', NULL, 'Bandungg gan', NULL, 0, 2, 0, '2020-05-14 06:11:26', '2020-05-14 06:11:26'),
(68, 'hanifsalafiiiiianindy_5ebce1de', 'd1b9fee2b4a5a770c3188c541a6c916b', 'c4528be6bdcd', 'hanif salafiiiii anindy', 'hanifsalafi@gmail.com', '987687621312', NULL, 'bandung', NULL, 0, 2, 0, '2020-05-14 06:14:54', '2020-05-14 06:14:54'),
(69, 'user1', '24c9e15e52afc47c225b757e7bee1f9d', '', 'user mania', 'user@gmail.com', '089768655578', NULL, 'bandung', NULL, 0, 2, 0, '2020-05-14 08:20:33', '2020-05-14 10:27:12'),
(70, 'salafihanif', '27cb3ed05ef8687d3cb8af8564f35ae1', '', 'salafihanif', 'hanifsalafi456@gmail.com', '082369433456', NULL, 'Medan Johor Eka Surya', NULL, 0, 2, 0, '2020-05-14 10:33:49', '2020-05-14 10:34:52'),
(71, 'Iburita_5ebf5426', '4c6838b5a8f1fda5efa52780209228b0', 'd6d1250f694e', 'Ibu rita', 'ritalalalal@gmail.com', '082369433456', NULL, 'Rumah aku', NULL, 0, 2, 0, '2020-05-16 02:47:02', '2020-05-16 02:47:02'),
(72, 'Sayurnesia_5ec35763', '493f671bc893260f7812d4981ae32477', '9eca86277119', 'Sayurnesia', 'sayurnesia.id@gmail.com', '085261914563', NULL, 'Jln. Sidodadi Perum. Taman Johor Mas C15, Medan Johor', NULL, 0, 2, 0, '2020-05-19 03:49:55', '2020-05-19 03:49:55'),
(73, 'sayurnesia_5ec35a07', '91b2ac226caab408f5b4cd818c901d97', '6880b4a9a1e8', 'sayurnesia', 'sayurnesia.id@gmail.com', '082369433333', NULL, 'Jln. Sidodadi Perum. TJM C-15, Medan Johor', NULL, 0, 2, 0, '2020-05-19 04:01:11', '2020-05-19 04:01:11'),
(74, 'azzahraaulia_5eec4b0c', 'a4d4846d5f016dd8278c275d344f5557', 'c85c378db1b3', 'azzahra aulia', 'adindarmdhii23@gmail.com', '081326955121', NULL, 'jalan binjai gg mesjid', NULL, 0, 2, 0, '2020-06-19 05:20:12', '2020-06-19 05:24:15'),
(75, 'AdindaRamadhani_5eec59fa', '6bae8f5c4b1ffd186f22bc09a68bd5e9', '11152ac72a5a', 'Adinda Ramadhani', 'adindarmdhii23@gmail.com', '081326955121', NULL, 'jl binjai km 10,5', NULL, 0, 2, 0, '2020-06-19 06:23:54', '2020-06-19 06:50:55'),
(76, 'HanifSalafi_5eec5c4f', '330e38a6753aadacaaf860663fe1eafa', 'fa5fe7b8cd8d', 'Hanif Salafi', 'hanifsalafi456@gmail.com', '082369433456', NULL, 'Medan', NULL, 0, 2, 0, '2020-06-19 06:33:51', '2020-06-19 06:33:51'),
(77, 'hansal', '827ccb0eea8a706c4c34a16891f84e7b', '', 'Hansal', 'hanifsalafi456@gmail.com', NULL, NULL, NULL, NULL, 0, 2, 0, '2020-07-23 16:21:59', '2020-07-23 16:21:59'),
(78, 'giojustisia', '26c834d3f4fea0cf6483ddba7dcc56f2', '', 'Gio Jutsisia Batubara', 'giojustisia@gmail.com', NULL, NULL, NULL, NULL, 0, 2, 0, '2020-07-26 17:04:44', '2020-07-26 17:04:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_status`
--

CREATE TABLE `user_status` (
  `id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_status`
--

INSERT INTO `user_status` (`id`, `status`) VALUES
(1, 'Belum mengajukan verifikasi'),
(2, 'Sudah pengajuan verifikasi'),
(3, 'Sudah diapprove');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `account_bank`
--
ALTER TABLE `account_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `catering_buyer`
--
ALTER TABLE `catering_buyer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `catering_order_batch`
--
ALTER TABLE `catering_order_batch`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `catering_order_detail`
--
ALTER TABLE `catering_order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `catering_order_item`
--
ALTER TABLE `catering_order_item`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `catering_package`
--
ALTER TABLE `catering_package`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `day`
--
ALTER TABLE `day`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `delivery_data`
--
ALTER TABLE `delivery_data`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `delivery_point`
--
ALTER TABLE `delivery_point`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `driver_record`
--
ALTER TABLE `driver_record`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ingredients_category`
--
ALTER TABLE `ingredients_category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ingredients_data`
--
ALTER TABLE `ingredients_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indeks untuk tabel `ingredients_unit`
--
ALTER TABLE `ingredients_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `in_stock`
--
ALTER TABLE `in_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu_category`
--
ALTER TABLE `menu_category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `out_stock`
--
ALTER TABLE `out_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `reason_out_stock`
--
ALTER TABLE `reason_out_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `shopping_list`
--
ALTER TABLE `shopping_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number_reference` (`number_reference`);

--
-- Indeks untuk tabel `shopping_list_item`
--
ALTER TABLE `shopping_list_item`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `shopping_plan`
--
ALTER TABLE `shopping_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `shopping_plan_list`
--
ALTER TABLE `shopping_plan_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `fkey_user_role_id` (`role_id`);

--
-- Indeks untuk tabel `user_status`
--
ALTER TABLE `user_status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `account_bank`
--
ALTER TABLE `account_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `catering_buyer`
--
ALTER TABLE `catering_buyer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT untuk tabel `catering_order_batch`
--
ALTER TABLE `catering_order_batch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `catering_order_detail`
--
ALTER TABLE `catering_order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=720;

--
-- AUTO_INCREMENT untuk tabel `catering_order_item`
--
ALTER TABLE `catering_order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=714;

--
-- AUTO_INCREMENT untuk tabel `catering_package`
--
ALTER TABLE `catering_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `day`
--
ALTER TABLE `day`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `delivery_data`
--
ALTER TABLE `delivery_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT untuk tabel `delivery_point`
--
ALTER TABLE `delivery_point`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=549;

--
-- AUTO_INCREMENT untuk tabel `driver_record`
--
ALTER TABLE `driver_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT untuk tabel `ingredients_category`
--
ALTER TABLE `ingredients_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `ingredients_data`
--
ALTER TABLE `ingredients_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT untuk tabel `ingredients_unit`
--
ALTER TABLE `ingredients_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `in_stock`
--
ALTER TABLE `in_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT untuk tabel `menu_category`
--
ALTER TABLE `menu_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `out_stock`
--
ALTER TABLE `out_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT untuk tabel `payment_type`
--
ALTER TABLE `payment_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `reason_out_stock`
--
ALTER TABLE `reason_out_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `shopping_list`
--
ALTER TABLE `shopping_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `shopping_list_item`
--
ALTER TABLE `shopping_list_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT untuk tabel `shopping_plan`
--
ALTER TABLE `shopping_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `shopping_plan_list`
--
ALTER TABLE `shopping_plan_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fkey_user_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
