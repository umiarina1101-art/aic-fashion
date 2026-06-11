-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2026 at 07:44 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aic_fashion`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `size` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `qty`, `created_at`, `size`) VALUES
(53, 4, 5, 1, '2026-05-31 16:24:38', 'M'),
(54, 4, 4, 1, '2026-05-31 16:24:51', 'M'),
(55, 4, 8, 1, '2026-05-31 18:03:39', 'M'),
(57, 5, 12, 1, '2026-06-01 03:16:44', 'L'),
(58, 5, 5, 1, '2026-06-01 03:16:57', 'XL');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `nama_kategori`) VALUES
(1, 'Hijab'),
(2, 'Gamis'),
(3, 'Tunik'),
(4, 'Blouse'),
(5, 'Celana'),
(6, 'Rok'),
(7, 'Aksesoris');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_harga` decimal(12,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `alamat` text DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `tracking_status` varchar(30) DEFAULT 'diproses',
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `metode_pembayaran` varchar(50) DEFAULT NULL,
  `ongkir` int(11) DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_harga`, `status`, `created_at`, `alamat`, `no_hp`, `tracking_status`, `latitude`, `longitude`, `metode_pembayaran`, `ongkir`, `updated_at`) VALUES
(333, 4, 1340000.00, 'selesai', '2026-05-31 16:12:40', 'Jalan Jenderal Sudirman No. 1Kelurahan Imopuro, \r\nKecamatan Metro PusatKota Metro, \r\nProvinsi Lampung\r\nKode Pos: 34111', '087865432134', 'diproses', NULL, NULL, 'COD', 10000, '2026-05-31 17:02:58'),
(334, 4, 210000.00, 'batal', '2026-05-31 16:21:01', 'Jalan Jenderal Sudirman No. 1Kelurahan Imopuro, \r\nKecamatan Metro PusatKota Metro, \r\nProvinsi Lampung\r\nKode Pos: 34111', '087865432134', 'diproses', NULL, NULL, 'COD', 10000, '2026-05-31 18:12:48'),
(335, 4, 110000.00, 'dikirim', '2026-05-31 18:35:03', 'Jalan Jenderal Sudirman No. 1Kelurahan Imopuro, \r\nKecamatan Metro PusatKota Metro, \r\nProvinsi Lampung\r\nKode Pos: 34111', '087865432134', 'diproses', NULL, NULL, 'E-Wallet', 10000, '2026-06-01 02:49:36'),
(336, 5, 175000.00, 'batal', '2026-05-31 19:26:02', 'Jl. Sukarno Hatta, RT 012 / RW 004, Kampung Sidokerto, Kec. Bumi Ratu Nuban, Kab. Lampung Tengah, Lampung, 34161', '082367890675', 'diproses', NULL, NULL, 'COD', 25000, '2026-06-01 02:46:58'),
(337, 5, 525000.00, 'selesai', '2026-06-01 03:43:07', 'Jl. Sukarno Hatta, RT 012 / RW 004, Kampung Sidokerto, Kec. Bumi Ratu Nuban, Kab. Lampung Tengah, Lampung, 34161', '082367890675', 'diproses', NULL, NULL, 'COD', 25000, '2026-06-01 10:06:58'),
(338, 5, 185000.00, 'pending', '2026-06-01 08:51:18', 'Jl. Sukarno Hatta, RT 012 / RW 004, Kampung Sidokerto, Kec. Bumi Ratu Nuban, Kab. Lampung Tengah, Lampung, 34161', '082367890675', 'diproses', NULL, NULL, 'E-Wallet', 25000, '2026-06-01 08:51:18'),
(339, 5, 30000.00, 'pending', '2026-06-02 07:36:17', 'Jl. Sukarno Hatta, RT 012 / RW 004, Kampung Sidokerto, Kec. Bumi Ratu Nuban, Kab. Lampung Tengah, Lampung, 34161', '082367890675', 'diproses', NULL, NULL, 'COD', 10000, '2026-06-02 07:36:17');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `harga` decimal(12,2) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `qty`, `harga`, `size`) VALUES
(35, 333, 8, 1, 150000.00, NULL),
(36, 333, 5, 1, 100000.00, NULL),
(37, 333, 5, 1, 100000.00, NULL),
(38, 333, 5, 1, 100000.00, NULL),
(39, 333, 5, 1, 100000.00, NULL),
(40, 333, 6, 1, 120000.00, NULL),
(41, 333, 6, 1, 120000.00, NULL),
(42, 333, 8, 2, 150000.00, NULL),
(43, 333, 6, 1, 120000.00, NULL),
(44, 333, 6, 1, 120000.00, NULL),
(45, 334, 10, 1, 100000.00, NULL),
(46, 334, 5, 1, 100000.00, NULL),
(47, 335, 10, 1, 100000.00, 'L'),
(48, 336, 8, 1, 150000.00, 'M'),
(49, 337, 12, 1, 500000.00, 'M'),
(50, 338, 20, 1, 160000.00, 'XXL'),
(51, 339, 29, 1, 20000.00, 'Free');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `nama_produk` varchar(200) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `harga` decimal(12,2) NOT NULL,
  `stok` int(11) DEFAULT 0,
  `gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `nama_produk`, `deskripsi`, `harga`, `stok`, `gambar`, `created_at`) VALUES
(4, 5, 'Celana Highwaist', 'Celana Kerja Formal Kulot Wanita Highwaist Loose Pants Korean Style\r\nNyaman dipakai sehari-hari , Nyaman untuk semua musim', 94998.00, 20, '1780206045_sg-11134201-23020-p7w2gnylgdnvee.webp', '2026-05-31 05:40:45'),
(5, 4, 'Blouse Katbol', 'Yoona Blouse Katbol elegan\r\nwarna putih Tersedia semua ukuran \r\ns ,m,l,xl', 160000.00, 51, '1780206165_8de17a72079ca42f1a88d7088402fb28.jpg', '2026-05-31 05:42:45'),
(6, 4, 'Clea blouse', 'Clea blouse bunga bunga ringan linen bahan adem model kekinian ala Korea\r\nnyaman dipakai sehari-hari tersedia di warna biru', 120000.00, 30, '1780206259_524a9cc8c8e8e04490632cf49ef0da3a.jpg', '2026-05-31 05:44:19'),
(8, 4, 'Blouse ruffle', 'Blouse ruffle|ala korean look|Navy\r\nAtasan wanita dengan gaya Korean style yang modis dan feminin. Cocok untuk kuliah, kerja, maupun hangout.\r\n\r\nDetail Desain & Fitur:\r\n\r\nMotif: Kotak-kotak kecil (gingham) perpaduan warna navy dan putih.\r\n\r\nKerah & Pita: Kerah model bulat dengan aksen tali pita navy yang manis di bagian depan.\r\n\r\nLengan Balon: Potongan lengan bervolume (puff) dengan manset pergelangan tangan navy yang lebar dan rapi.\r\n\r\nAksen Ruffle: Detail lipit/ruffle navy yang cantik di bagian ujung bawah baju.\r\n\r\nKancing Depan: Dilengkapi kancing aktif dari atas sampai bawah.\r\n\r\nSpesifikasi:\r\n\r\nUkuran: S, M, L, XL\r\n\r\nBahan: Katun Grid (Adem, lembut, tidak menerawang, dan nyaman dipakai seharian).', 150000.00, 21, '1780206690_2d979e899dedabedf086a4c85d6fbb0a.jpg', '2026-05-31 05:51:30'),
(10, 4, 'Ghina Blouse||Marun', 'Ghina Blouse - Marun\r\nBlouse wanita dengan potongan loose/flare yang anggun dan memberikan kesan feminin yang manis.\r\n\r\nDetail Desain & Fitur:\r\n\r\nWarna: Marun (burgundy) yang elegan.\r\n\r\nKerah: Model kerah sanghai (mandarin collar) yang rapi dan memberikan kesan formal sekaligus modis.\r\n\r\nDetail Bordir: Variasi bordir bunga-bunga kecil berwarna putih yang tersebar cantik di bagian depan.\r\n\r\nBagian Bawah: Desain potongan bawah melengkung dengan aksen pinggiran gelombang (scallop) berwarna putih yang manis.\r\n\r\nKancing Depan: Dilengkapi kancing bungkus kain senada yang aktif dari atas ke bawah.\r\n\r\nLengan: Lengan panjang dengan detail kerut halus di bahu dan manset kancing di pergelangan tangan.\r\n\r\nSpesifikasi:\r\n\r\nBahan: Katun bertekstur/Crinkle (Ringan, adem, bertekstur elegan, dan tidak menerawang).\r\n\r\nUkuran: All Size (Potongan baju melebar ke bawah/A-line sehingga nyaman dan tidak ketat).', 100000.00, 6, '1780230031_50d1ca7b8e163126e79bf0240906d674.jpg', '2026-05-31 12:20:31'),
(11, 2, 'Abaya Keffiyeh Palestina', 'Abaya Keffiyeh Palestina\r\nOuter abaya premium dengan desain elegan dan bermakna, memadukan gaya modern minimalis dengan sentuhan etnik khas Palestina. Cocok untuk acara formal, kasual, maupun hari raya.\r\n\r\nDetail Desain & Fitur:\r\n\r\nModel: Open front abaya (luaran/outer tanpa kancing depan) yang memberikan siluet jenjang, anggun, dan flowy.\r\n\r\nWarna: Kombinasi warna sage green/abu-abu lembut yang dipadukan dengan inner hitam.\r\n\r\nDetail Lengan: Potongan lengan lebar (wide sleeves) yang dihiasi motif bordir etnik khas keffiyeh Palestina berwarna hitam yang kontras dan eksklusif.\r\n\r\nKarakter Kain: Menggunakan bahan crinkle premium bertekstur halus, jatuh (drop), adem, tidak menerawang, dan tidak mudah kusut.\r\n\r\nSpesifikasi:\r\n\r\nUkuran Tersedia: L dan XL\r\n\r\n(Catatan: Penjualan ini hanya untuk outer abaya saja/tidak termasuk inner dan jilbab).', 400000.00, 10, '1780232844_2e412f054bbd5e5ec5d45b75634d0164.jpg', '2026-05-31 13:07:24'),
(12, 3, 'Aqila Raya Tunik', 'Aqila Raya Tunik Memiliki detail motif bordir bunga dan variasi kancing silver memberikan kesan mewah dan elegan. Material : paper silk premium (bahan adem, nyaman, mewah dan elegan) Memiliki 2 ukuran Size S-M (LD 100cm, PB 95cm) Size L-XL (LD 110cm, PB 96cm) weight 0,6 Kg —————— KENAPA HARUS BELANJA DI BUTIKCHLARIS? Keuntungan belanja di Butikchlaris yang tidak anda temukan di toko lain : - Barang brand sendiri ekslusif by Butikchlaris - Model asli dari Butikchlaris - Real picture (Warna dan model sesuai gambar) - Bisa request kartu ucapan untuk kado - Kami menggaransi semua barang yang anda beli, bila rusak, cacat, tidak puas barang langsung ditukar atau uang kembali. Cara Complain Retur (mohon ikuti petunjuk dibawah ini) : - Untuk klaim retur wajib dengan video unboxing (maks 2x', 500000.00, 7, '1780282855_fd8ae7fb6f04493d5f573e979d587ce9.jpg', '2026-06-01 03:00:55'),
(13, 3, 'Tunik Batik Modern Kosual', 'Mohon DETAIL UKURAN dibaca dengan BAIK dan TELITI. \r\nKami tidak menerima return/pengembalian dengan alasan ukuran tidak sesuai; terlalu kecil/besar, terlalu panjang/pendek. Jika barang diterima dengan kondisi yang tidak sesuai, harap diskusikan lebih dulu di ruang chat. * Agar barang yang diterima bisa sesuai ekspektasi, harap baca deskripsi produk sebaik-baiknya. \r\nDESKRIPSI PRODUK : a. Nama Produk : Semusim Slit Tunik b. Material : Katun c. Detail Ukuran S/M Lingkar Dada: 100cm Bahu: 13cm Ketiak: 46cm Tangan: 43cm Manset: 28cm Panjang: 103cm L/X﻿L Lingkar Dada: 114cm Bahu: 14cm Ketiak: 50cm Tangan: 45cm Manset: 30cm Panjang: 103cm CATATAN: ‌Kemiripan warna produk dengan foto tidak 100% mirip dikarenakan efek pencahayaan. ‌Untuk baju/celana dengan bahan berwarna putih, disaranka', 210000.00, 39, '1780290548_b5c44f1a1174c1a0a2fdc2ead40913e9.jpg', '2026-06-01 05:09:08'),
(14, 3, 'Abaya Medina - Cokelat Tua', 'Abaya premium dengan potongan minimalis dan elegan, memberikan kesan anggun serta syar\'i. Cocok digunakan untuk acara formal, pengajian, umroh, maupun pakaian harian.\r\n\r\nDetail Desain & Fitur:\r\n\r\nWarna: Cokelat tua (dark chocolate) yang dipadukan dengan aksen warna krem (beige) yang manis dan kalem.\r\n\r\nPotongan Baju: Model A-line loose fit yang longgar, jatuh (flowy), dan tidak membentuk lekuk tubuh.\r\n\r\nDetail Lengan: Potongan lengan lebar (wide sleeves) wudhu friendly dengan kombinasi warna krem di ujung manset, dipercantik dengan garis list putih horizontal yang kontras.\r\n\r\nKarakter Kain: Menggunakan bahan khanza/jetblack premium yang sangat lembut, adem, tidak menerawang, tidak mudah kusut, dan memberikan kenyamanan ekstra sepanjang hari.\r\n\r\nSpesifikasi:\r\n\r\nUkuran: S, M ,L, XL\r\n\r\n(Catatan: Penjualan hanya untuk produk abaya saja, tidak termasuk jilbab).', 350000.00, 17, '1780291417_31df9458b058c11ac5b6ee464cd058e1.jpg', '2026-06-01 05:23:37'),
(15, 4, 'Blouse Pita Ruffle - Cream', 'Atasan blouse wanita dengan desain vintage-romantic ala Korean look yang manis dan chic. Sangat cocok untuk hangout, kuliah, atau piknik estetis.\r\n\r\nDetail Desain & Fitur:\r\n\r\nWarna: Broken white / Cream lembut yang hangat.\r\n\r\nDetail Kerah & Depan: Kerah model bulat (round neck) yang dihiasi dengan list bordir gelombang/renda warna cokelat tua di sepanjang garis leher hingga belahan depan baju.\r\n\r\nAksen Tali Pita: Dilengkapi dengan 3 buah tali pita cokelat aktif di bagian dada depan yang memberikan kesan manis sekaligus berfungsi sebagai pengikat baju.\r\n\r\nPotongan Baju: Model peplum/baby doll dengan kerutan halus (ruffle) di bagian pinggang ke bawah yang memberikan siluet feminin dan longgar.\r\n\r\nLengan: Lengan panjang model balon (puff sleeves) dengan karet elastis di bagian pergelangan tangan (wudhu friendly).\r\n\r\nKarakter Kain: Menggunakan bahan katun crinkle bertekstur (airflow) yang ringan, adem, lembut di kulit, dan tidak perlu disetrika.\r\n\r\nSpesifikasi:\r\n\r\nUkuran: XL', 180000.00, 20, '1780291974_351342e711c2050fc51304cedd446163.jpg', '2026-06-01 05:32:54'),
(16, 4, 'Blouse Renda Vintage - Navy', 'Atasan wanita dengan potongan loose fit berdesain vintage-casual yang manis dan santai. Sangat cocok untuk tampilan sehari-hari, kuliah, atau jalan-jalan santai.\r\n\r\nDetail Desain & Fitur:\r\n\r\nWarna: Navy denim (biru tua) yang netral dan mudah dipadukan.\r\n\r\nDetail Kerah & Renda: Kerah bulat dengan variasi renda rajut (lace) berwarna broken white yang melingkar cantik, memberikan sentuhan feminin bergaya mori girl/cottagecore.\r\n\r\nAksen Bawah: Ujung bawah baju (hemline) dilapisi dengan renda rajut senada yang mempermanis siluet pakaian.\r\n\r\nKancing Depan: Dilengkapi kancing aktif bermotif kayu/cokelat klasik di bagian depan (busui friendly).\r\n\r\nPotongan Lengan: Lengan panjang bermodel sedikit balon dengan detail kerut halus di bahu dan ujung karet elastis yang nyaman di pergelangan tangan.\r\n\r\nKarakter Kain: Menggunakan bahan katun linen premium yang adem, bertekstur serat alami yang khas, menyerap keringat, dan tidak menerawang.\r\n\r\nSpesifikasi:\r\n\r\nUkuran: M, L, XL(Potongan longgar/oversized)', 155000.00, 50, '1780293772_b7e4af11e6a006e5a0b43e2458e8857a.jpg', '2026-06-01 06:02:52'),
(17, 4, 'Blouse Renda Tassel - Baby Pink', 'Atasan blouse wanita dengan desain boho-chic dan sentuhan romantic vintage yang lembut. Sangat cantik untuk dipakai hangout, kuliah, piknik, maupun acara kasual lainnya.\r\n\r\nDetail Desain & Fitur:\r\n\r\nWarna: Merah muda lembut (baby pink / dusty pink) yang memberikan kesan manis dan feminin.\r\n\r\nDetail Dada & Kerah: Kerah bulat (round neck) dengan aksen renda rajut (lace) kecil di sepanjang garis leher. Bagian dada dipercantik dengan kombinasi dua baris panel renda rajut berlubang (eyelet/crochet lace) horizontal yang mewah.\r\n\r\nAksen Tali Tassel: Dilengkapi belahan v-neck kecil di depan dengan tali pengikat aktif yang berujung rumbai (tassel) senada.\r\n\r\nPotongan Baju: Model loose fit / babydoll dengan detail kerutan halus di bawah dada yang memberikan efek jatuh, longgar, dan nyaman.\r\n\r\nLengan: Lengan panjang dengan detail sambungan renda rajut tipis di bagian siku serta ujung lengan berkaret elastis (wudhu friendly).\r\n\r\nKarakter Kain: Menggunakan bahan katun crin', 145000.00, 50, '1780294626_4e5692985d5504b045e52862d540c4c9.jpg', '2026-06-01 06:17:06'),
(18, 3, 'Batik Couple Modern - Ocean Navy', 'Set pakaian couple (pria dan wanita) dengan desain modern kontemporer yang elegan. Memadukan motif etnik minimalis dengan warna navy yang netral, sangat cocok untuk acara kondangan, lamaran, prewedding, atau acara formal lainnya.\r\n\r\n1. Detail Set Wanita (Kebaya Outer & Rok Lilit):\r\n\r\nOuter: Kebaya model open-front outer panjang berbahan brokat/lace premium warna putih bersih dengan detail motif jaring-jaring estetik. Lengan panjang dengan ujung kerut elastis.\r\n\r\nRok & Obi Belt: Rok lilit instan bermotif etnik kontemporer warna navy-putih, dilengkapi dengan kain obi (belt) lebar senada yang bisa diikat pita di bagian pinggang untuk memberikan efek ramping.\r\n\r\n2. Detail Kemeja Pria:\r\n\r\nModel: Kemeja lengan pendek dengan potongan slim fit yang rapi dan modern.\r\n\r\nDesain: Kombinasi unik asimetris, di mana satu sisi polos berwarna navy tua dan sisi lainnya (termasuk plaket kancing) menggunakan motif etnik kontemporer yang serasi dengan rok wanita.\r\n\r\nKerah: Kerah kemeja standar yang kaku dan rapi.\r\n\r\nSpesifikasi:\r\n\r\nBahan: Katun premium pada kemeja dan rok (adem, halus, tidak mudah kusut) dipadukan dengan brokat halus pada outer wanita.\r\n\r\nUkuran: Tersedia pilihan ukuran untuk kemeja pria dan set wanita.', 650000.00, 50, '1780302880_86c10970b754d2714a1da803d1fce5c0.jpg', '2026-06-01 08:34:40'),
(19, 3, 'Set Kebaya Kamila - Midnight Navy', 'Setelan kebaya modern dengan perpaduan desain tradisional nan mewah dan potongan asimetris yang elegan. Pilihan sempurna untuk acara formal seperti wisuda, pertunangan, kondangan, maupun seragam panitia pernikahan.\r\n\r\nDetail Desain & Fitur:\r\n\r\nAtasan (Kebaya):\r\n\r\nBerwarna navy tua bermotif floral timbul (jacquard/embossed) yang memberikan kesan mewah.\r\n\r\nModel kerah sanghai tinggi dengan detail deretan kancing putih miring asimetris khas gaya oriental modern.\r\n\r\nPotongan bahu tegas (puff/pad shoulder) untuk memberikan siluet tubuh yang tegap dan elegan.\r\n\r\nDipercantik dengan aksesori bros rantai perak juntai di bagian dada kanan.\r\n\r\nBawahan (Rok) & Obi Belt: Rok span panjang berwarna dasar broken white dengan motif batik floral modern bernuansa navy-gold. Dilengkapi obi belt lebar senada yang bisa diikat pita untuk mempertegas lekuk pinggang.\r\n\r\nSelendang: Termasuk selendang kain senada dengan motif batik yang disampirkan di bahu untuk menambah kesan anggun dan formal.\r\n\r\nSpesifikasi:\r\n\r\nBahan: Katun Jacquard Premium (Atasan) & Katun Primisima Premium (Rok & Selendang). Adem, tebal, tidak menerawang, dan mempertahankan bentuk pakaian dengan baik.', 500000.00, 49, '1780303215_3c46d443466418e80b548d65ddebaaa1.jpg', '2026-06-01 08:40:15'),
(20, 5, 'Highwaist Wide Leg Jeans - Vintage Blue', 'Celana denim panjang wanita dengan potongan longgar yang trendi dan memberikan ilusi kaki lebih jenjang. Sangat cocok untuk gaya kasual sehari-hari, streetwear, atau hangout.\r\n\r\nDetail Desain & Fitur:\r\n\r\nWarna & Efek: Biru indigo tua dengan efek washed vintage (gradasi warna pudar) yang estetik di bagian paha depan.\r\n\r\nPotongan Pinggang: Model High Waist (potongan tinggi di atas pinggang) yang memberikan siluet ramping dan jenjang.\r\n\r\nPotongan Kaki: Model Wide Leg / Baggy (melebar lurus dari paha hingga bawah) yang memberikan ruang gerak maksimal dan nyaman tanpa terasa ketat.\r\n\r\nSaku: Dilengkapi dengan 5 saku fungsional standar (2 di depan dengan 1 saku koin kecil, dan 2 saku tempel di bagian belakang).\r\n\r\nPenutup: Menggunakan kancing logam silver berkilau dan ritsleting depan yang kokoh.\r\n\r\nSpesifikasi:\r\n\r\nBahan: Denim Katun Premium (Tebal, non-stretch, kokoh, tidak kaku, dan tahan lama).\r\n\r\nUkuran: S, M, L, XL', 160000.00, 19, '1780303693_2d6568ba90fad85402e5bb556634d89b.jpg', '2026-06-01 08:48:13'),
(21, 1, 'Hijab Segi Empat Voal Premium Lace', 'Jilbab segi empat (scarf) premium berdesain eksklusif dengan sentuhan motif vintage floral yang lembut dan anggun. Sangat cocok untuk acara formal, hari raya, maupun melengkapi gaya kasual mewah sehari-hari.\r\n\r\nDetail Desain & Fitur:\r\n\r\nMotif Eksklusif: Desain cetak (print) motif bunga-bunga kecil (shabby chic) dan aksen pita merambat yang estetik nan feminin di bagian sudut hijab.\r\n\r\nDetail Renda Rajut: Dipercantik dengan aplikasi renda rajut (lace) berwarna putih bersih yang manis di sepanjang tepi pinggiran hijab, memberikan kesan mewah dan rapi.\r\n\r\nKarakter Kain: Menggunakan bahan voal premium ultra-fine yang super lembut, tegak di dahi, tidak pekak di telinga, adem, dan sangat mudah dibentuk.\r\n\r\nPilihan Varian Warna:\r\n\r\nSky: Perpaduan warna dasar cerah dengan list abu-biru muda yang segar.\r\n\r\nGray Quil: Perpaduan warna abu-abu lembut yang netral dan elegan.\r\n\r\nRose Smoke: Perpaduan warna merah muda pudar (dusty pink) yang manis dan feminin.\r\n\r\nDessert Sage: Perpaduan warna hijau sage lembut yang kalem dan trendi.\r\n\r\nCaramel: Perpaduan warna cokelat krem hangat yang estetik.\r\n\r\nSpesifikasi:\r\n\r\nUkuran: Standar ± 115 x 115 cm (All Size)', 45000.00, 20, '1780304560_8989cddc7ef8f165913046b38ecf8a47.jpg', '2026-06-01 09:02:40'),
(22, 7, 'Jam Tangan Wanita Vintage Quartz - Square Edition', 'Jam tangan analog wanita dengan desain vintage classic yang minimalis dan elegan. Memiliki perpaduan case persegi melengkung dan pilihan warna tali yang hangat, sangat cocok untuk melengkapi gaya kuliah, kerja, maupun kasual sehari-hari.\r\n\r\nDetail Desain & Fitur:\r\n\r\nBentuk Case: Desain kotak dengan sudut melengkung (square-round) berlapis warna gold (emas) mewah yang memberikan kesan timeless dan retro.\r\n\r\nTampilan Dial: Tersedia dalam 2 variasi dial (papan jam):\r\n\r\nMinimalis: Hanya angka 12, 2, 6, dan 10 dengan jarum jam berwarna emas polos.\r\n\r\nKlasik/Full Angka: Menampilkan deretan angka jam lengkap (1-12) yang kasual dan mudah dibaca.\r\n\r\nMesin: Menggunakan mesin Quartz movement yang akurat dan menggunakan baterai.\r\n\r\nStrap (Tali): Terbuat dari bahan kulit sintetis halus (leather strap) berukuran ramping dengan buckle pengait berwarna emas senada.\r\n\r\nPilihan Warna Strap:\r\n\r\nBlack: Hitam pekat yang formal dan netral.\r\n\r\nDark Brown: Cokelat tua yang klasik dan bernuansa vintage intense.\r\n\r\nLight Brown/Tan: Cokelat muda hangat yang estetik dan kasual.\r\n\r\nSpesifikasi:\r\n\r\nUkuran: Diameter case ± 2.5 - 3 cm (Ukuran medium yang manis dan pas di pergelangan tangan wanita).', 50000.00, 55, '1780304714_e92e89ac14fb131a0ca949ee44c24d04.jpg', '2026-06-01 09:05:14'),
(23, 7, 'Anting Wanita Titanium Gold Premium - Chunky Vintage Edition', 'Koleksi anting tusuk (stud & hoop earrings) wanita bergaya vintage chunky Korea yang mewah dan estetik. Desainnya yang tebal, bertekstur, dan berkilau sangat cocok untuk menyempurnakan penampilan formal, kasual, maupun sebagai aksesoris foto ootd.\r\n\r\nDetail Desain & Fitur:\r\n\r\nWarna: High-gloss gold (emas berkilau mewah) yang memberikan kesan glamor dan elegan saat dipakai.\r\n\r\nVariasi Bentuk (Koleksi Lengkap):\r\n\r\nRomantic & Cute: Motif hati lipit, hati polos minimalis, hati abstrak, serta bentuk pita jalin (ribbon bow).\r\n\r\nNature & Floral: Bentuk bunga kelopak mekar, motif cangkang kerang (seashell), dan tekstur daun.\r\n\r\nAbstract & Retro Geometric: Bentuk pusaran bulat (swirl), kotak anyam timbul, anting drop oval bertekstur lipit, serta model chunky hoop (kotak dan oval polos).\r\n\r\nModel Tusukan: Menggunakan jarum tusuk (stud) yang praktis, pas menempel di daun telinga, dan dilengkapi penutup yang aman.\r\n\r\nSpesifikasi:\r\n\r\nBahan: Stainless Steel / Titanium Premium (Anti karat, tidak mudah luntur, awet berkilau, dan aman/hipoalergenik untuk kulit sensitif).\r\n\r\nUkuran: Model chunky medium (ukuran pas, terlihat menonjol namun tidak berat saat dipakai di telinga).', 10000.00, 100, '1780304858_e7d82e94a2636b6f96f4ce26e1d1c332.jpg', '2026-06-01 09:07:38'),
(24, 1, 'Hijab Segi Empat paris jadul(varisha) / Voal Polos', 'Hijab segi empat polos basic yang menjadi must-have item bagi setiap wanita. Desainnya yang simpel, ringan, dan kasual sangat cocok untuk penggunaan sehari-hari, sekolah, kuliah, kerja, hingga acara santai.\r\n\r\nDetail Desain & Fitur:\r\n\r\nModel: Jilbab segi empat polos tanpa motif dengan potongan tepi kain yang dijahit neci rapi di seluruh sisinya.\r\n\r\nKarakter Kain: Menggunakan bahan double hycon / voal premium yang memiliki serat kain rapat, bertekstur lembut, adem, ringan, tidak bikin budeg, dan sangat mudah dibentuk tegak di dahi.\r\n\r\nFleksibilitas: Bahan kain mudah diatur, tidak licin, dan jatuh dengan cantik saat disampirkan di bahu maupun diikat ke belakang.\r\n\r\nSpesifikasi:\r\n\r\nUkuran: Standar ± 110 x 110 cm (All Size)', 15000.00, 25, '1780305096_id-11134207-822wg-mo6kfa5elxqcfb.webp', '2026-06-01 09:11:36'),
(25, 4, 'Set Kemeja & Vest Manik - Denim Blue', 'Setelan pakaian wanita 2-in-1 yang terdiri dari kemeja polos dan rompi (vest) etnik yang modis. Desainnya yang chic dan clean sangat pas untuk kuliah, kerja, maupun acara formal-kasual lainnya.\r\n\r\nDetail Desain & Fitur:\r\n\r\nKemeja (Inner): Kemeja lengan panjang berwarna putih bersih dengan kerah kerah standar (shirt collar) yang rapi, memberikan kesan formal dan minimalis.\r\n\r\nVest (Outer):\r\n\r\nRompi tanpa lengan berwarna biru denim lembut dengan potongan leher model V (V-neck).\r\n\r\nDipercantik dengan detail payet/manik-manik berkilau yang membentuk motif bunga etnik cantik di bagian depan.\r\n\r\nDilengkapi kancing aktif senada di bagian depan.\r\n\r\nSisi kanan dan kiri dilengkapi dengan tali kain aktif yang bisa diikat pita (bisa disesuaikan dengan lebar pinggang).\r\n\r\nKarakter Kain: Menggunakan bahan katun linen/crinkle bertekstur serat alami yang adem, tidak menerawang, ringan, dan sangat nyaman dipakai berlapis sepanjang hari.\r\n\r\nSpesifikasi:\r\n\r\nUkuran: All Size (Potongan vest fleksibel karena menggunakan tali ikat di samping).\r\n(Catatan: Produk dijual satu set kemeja + vest).', 100000.00, 30, '1780305262_e33c29f0e683c7b955c2b0fc97caa2c3.jpg', '2026-06-01 09:14:22'),
(26, 1, 'Mukena Silk Premium Motif - Soft Lilac', 'Set mukena terusan/potongan premium dengan desain yang mewah, elegan, dan menenangkan. Pilihan sempurna untuk ibadah harian, perlengkapan umroh/haji, mahar pernikahan, maupun kado spesial.\r\n\r\nDetail Desain & Fitur:\r\n\r\nWarna: Soft lilac (ungu muda lembut) yang anggun dan memberikan kesan adem.\r\n\r\nMotif: Cetakan motif floral (watercolor flower) merambat yang halus, memberikan sentuhan feminin yang berkelas tanpa terlihat mencolok.\r\n\r\nDetail Kepala: Bagian dahi didesain bersih tanpa karet menempel untuk mencegah bekas di dahi, dilengkapi tali pengikat belakang untuk menyeseuaikan kekencangan.\r\n\r\nKarakter Kain: Menggunakan bahan silk premium (sutra sintetis) yang memiliki kilau (glossy) mewah, tekstur sangat halus, jatuh (flowy), adem di kulit, dan ringan saat dipakai.\r\n\r\nSpesifikasi & Kelengkapan:\r\n\r\nUkuran: Jumbo / All Size (Panjang dan longgar, aman menutup aurat saat shalat).\r\n\r\nBonus Pouch: Sudah termasuk tas mukena (pouch) kecil dengan motif senada dan detail logo plat logam emas mewah, praktis dibawa bepergian (travel-friendly).', 175000.00, 20, '1780305447_85edd6e764fb7eb80aed2506e9ee0068.jpg', '2026-06-01 09:17:27'),
(27, 4, 'Nara Bordir Blouse - Linen Series', 'Atasan blouse wanita bermodel kemeja longgar dengan sentuhan bordir floral bergaya vintage-chic. Desainnya yang manis dan sopan sangat cocok untuk kuliah, kerja, maupun hangout.\r\n\r\nDetail Desain & Fitur:\r\n\r\nKerah & Kancing: Kerah model kemeja standar (shirt collar) yang rapi dengan deretan kancing aktif berwarna senada dari atas hingga bawah (busui friendly).\r\n\r\nDetail Bordir: Dipercantik dengan motif bordir bunga kecil (floral embroidery) kombinasi warna cokelat dan biru yang tersebar anggun di bagian depan dan bahu.\r\n\r\nPotongan Baju: Model babydoll/loose fit dengan kerutan halus (ruffle) di bagian dada, memberikan siluet yang longgar, tidak membentuk lekuk tubuh, dan jatuh dengan cantik.\r\n\r\nBagian Bawah: Desain ujung baju melengkung gelombang (scallop) yang rapi dengan detail benang tepi berwarna gelap yang kontras.\r\n\r\nLengan: Lengan panjang dengan detail kerut halus di bahu dan ujung lengan model terompet/kerut elastis (wudhu friendly).\r\n\r\nKarakter Kain: Menggunakan bahan katun linen premium bertekstur serat alami yang adem, tebal, tidak menerawang, lembut di kulit, dan sangat nyaman dipake seharian.\r\n\r\nPilihan Pilihan Warna:\r\n\r\nCream/Beige: Warna utama depan yang hangat dan estetik.\r\n\r\nMarun/Burgundy: Merah tua yang elegan.\r\n\r\nWhite: Putih bersih yang minimalis dan netral.\r\n\r\nNavy: Biru tua yang formal dan kalem.\r\n\r\nSpesifikasi:\r\n\r\nUkuran: All Size (Potongan longgar/nyaman)', 85000.00, 34, '1780305733_d9187d717214576dc2033b486bb2be88.jpg', '2026-06-01 09:22:13'),
(28, 3, 'Set Kebaya Outer Lace - Creamy Beige', 'Setelan pakaian formal wanita dengan desain modern dan mewah yang memadukan keanggunan outer lace transparan dengan gaun dalaman (inner dress) yang minimalis. Sangat elegan untuk acara kondangan, lamaran, wisuda, Lebaran, atau acara formal lainnya.\r\n\r\nDetail Desain & Fitur:\r\n\r\nWarna: Creamy beige / broken white lembut yang memberikan kesan bersih, mewah, dan berkelas.\r\n\r\nOuter (Luaran):\r\n\r\nTerbuat dari bahan kain tile/brokat (lace) premium transparan dengan motif bordir geometris floral yang halus dan penuh.\r\n\r\nModel asimetris (high-low) dengan potongan bagian depan melengkung indah dan bagian belakang lebih panjang.\r\n\r\nDipercantik dengan detail pinggiran renda rajut (lace border) berbentuk gelombang di sepanjang garis bukaan depan dan ujung bawah baju.\r\n\r\nBagian depan dilengkapi kancing bungkus kecil yang rapi di area dada.\r\n\r\nLengan: Lengan panjang model balon dengan kerut halus di bahu dan ujung manset kerut tipis yang manis.\r\n\r\nInner (Dalaman): Berupa long dress (gaun panjang) polos tanpa motif berwarna senada dengan potongan lurus (column silhouette) yang memberikan efek tubuh terlihat lebih jenjang.\r\n\r\nKarakter Kain: Kombinasi brokat premium berpola mewah pada luaran dan kain satin/silk silk premium yang lembut, jatuh (flowy), adem, serta tidak menerawang untuk dalamannya.\r\n\r\nSpesifikasi:\r\n\r\nUkuran: All Size (Cocok untuk memberikan tampilan siluet yang anggun dan ramping)', 250000.00, 33, '1780306731_33a47821713c1140c6ba290d9c5bfe02.jpg', '2026-06-01 09:38:51'),
(29, 7, 'Gelang tangan Titanium 2 Layer Daisy - Gold Edition', 'Gelang kaki (anklet) wanita dengan desain dua layer (double chain) yang tipis, minimalis, dan estetik. Perpaduan aksen bunga daisy dan permata kecil memberikan kesan feminin, manis, serta sangat cocok untuk menyempurnakan gaya kasual sehari-hari maupun foto OOTD.\r\n\r\nDetail Desain & Fitur:\r\n\r\nWarna: High-gloss gold (emas berkilau) yang memberikan kesan elegan, bersih, dan mewah saat melingkar di pergelangan kaki.\r\n\r\nDesain Dua Layer (Double Chain):\r\n\r\nLayer Atas: Rantai model cable chain tipis klasik yang dipadukan dengan aksen manik-manik bulat kecil (beaded) secara berkala.\r\n\r\nLayer Bawah: Rantai tipis yang dihiasi dengan 3 buah ornamen bunga daisy logam minimalis serta selingan permata sirkon (zirconia) bulat kecil berpendar bening.\r\n\r\nPengunci & Ekstensi: Menggunakan pengait model udang (lobster claw clasp) yang kokoh, dilengkapi dengan rantai tambahan (extension chain) untuk menyesuaikan kelonggaran gelang pada pergelangan kaki.\r\n\r\nSpesifikasi:\r\n\r\nBahan: Titanium Premium / Stainless Steel 316L (Anti karat, tidak mudah hitam atau pudar, serta aman/hipoalergenik untuk kulit sensitif).\r\n\r\nUkuran: Panjang standar ± 20 cm + 5 cm rantai tambahan (All Size).', 20000.00, 19, '1780307047_10bdb0a50df1506d3b8fcc28db2cd216.jpg', '2026-06-01 09:44:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `ukuran` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `product_id`, `ukuran`) VALUES
(36, 12, 'S'),
(37, 12, 'M'),
(38, 12, 'L'),
(39, 12, 'XL'),
(48, 6, 'S'),
(49, 6, 'M'),
(50, 6, 'L'),
(51, 6, 'XL'),
(58, 10, 'L'),
(59, 8, 'S'),
(60, 8, 'M'),
(61, 8, 'L'),
(62, 8, 'XL'),
(63, 11, 'L'),
(64, 11, 'XL'),
(65, 4, 'S'),
(66, 4, 'M'),
(67, 4, 'L'),
(68, 4, 'XL'),
(69, 5, 'S'),
(70, 5, 'M'),
(71, 5, 'L'),
(72, 5, 'XL'),
(73, 13, 'S'),
(74, 13, 'M'),
(75, 13, 'L'),
(76, 13, 'XL'),
(77, 14, 'S'),
(78, 14, 'M'),
(79, 14, 'L'),
(80, 14, 'XL'),
(81, 15, 'XL'),
(82, 16, 'M'),
(83, 16, 'L'),
(84, 16, 'XL'),
(85, 17, 'S'),
(86, 17, 'M'),
(87, 17, 'L'),
(88, 18, 'S'),
(89, 18, 'M'),
(90, 18, 'L'),
(91, 18, 'XL'),
(92, 18, 'XXL'),
(93, 19, 'S'),
(94, 19, 'M'),
(95, 19, 'L'),
(96, 19, 'XL'),
(97, 19, 'XXL'),
(98, 20, 'S'),
(99, 20, 'M'),
(100, 20, 'L'),
(101, 20, 'XL'),
(102, 20, 'XXL'),
(103, 25, 'L'),
(104, 25, 'XL'),
(105, 27, 'XL');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `review` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `order_id`, `user_id`, `product_id`, `rating`, `review`, `created_at`) VALUES
(1, 333, 4, 5, 5, 'sangat bagus', '2026-06-01 01:29:31'),
(2, 337, 5, 12, 5, 'sangatt baguss bahan enakk nyaman dipake', '2026-06-01 17:08:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('admin','customer') DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `alamat` text DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `role`, `created_at`, `alamat`, `no_hp`) VALUES
(2, 'Arina Admin', 'admin@aicfashion.com', '$2y$10$aKCjokXUQUUUqmj8D4W1OOO72saQ5gtt011ddeIQjKCbg/DdYenAy', 'admin', '2026-05-31 03:17:44', NULL, NULL),
(4, 'Intan', 'Intan1212@gmail.com', '$2y$10$LEBwRkHu/n.fcOMhvichb.fk2yfXMC5ur7kw6nI/YKmxWhE8og/nC', 'customer', '2026-05-31 05:04:18', 'Jalan Jenderal Sudirman No. 1Kelurahan Imopuro, \r\nKecamatan Metro PusatKota Metro, \r\nProvinsi Lampung\r\nKode Pos: 34111', '087865432134'),
(5, 'Arina', 'Arina1204@gmail.com', '$2y$10$0eH0yqJ98W60YqcBnYLCkutVpjRg1ny.J6XTOOw/v0ETLcnEKuSZm', 'customer', '2026-05-31 18:42:18', 'Jl. Sukarno Hatta, RT 012 / RW 004, Kampung Sidokerto, Kec. Bumi Ratu Nuban, Kab. Lampung Tengah, Lampung, 34161', '082367890675'),
(6, 'Ningrum', 'ningrum222@gmail.com', '$2y$10$BoGacPIvt8yYErOPtxTEvOZkilFbU4D2lDK.4GO514hEw05a4CcCa', 'customer', '2026-06-01 04:38:18', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=340;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `product_sizes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
