-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2024 at 05:50 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_pc`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `umur` int(3) NOT NULL,
  `jenis_kelamin` char(2) NOT NULL,
  `no_phone` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama`, `alamat`, `umur`, `jenis_kelamin`, `no_phone`) VALUES
(13, 'HAHAHA', 'JL. HAHAHA', 19, 'P', 4919413),
(16, 'Grendy Aditya Pangestu', 'Jl. HAHAHA', 18, 'L', 1432124);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `no_transaksi` varchar(30) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `harga_satuan` int(20) DEFAULT NULL,
  `harga_total` int(40) DEFAULT NULL,
  `jumlah` int(5) DEFAULT NULL,
  `diskon` int(5) DEFAULT NULL,
  `tanggal` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_penjualan`
--

INSERT INTO `tb_penjualan` (`id_penjualan`, `no_transaksi`, `id_produk`, `id_pelanggan`, `id_user`, `harga_satuan`, `harga_total`, `jumlah`, `diskon`, `tanggal`) VALUES
(22, '20240519141', 10, 13, 14, 500000000, 1000000000, 2, 0, '2024-05-19'),
(23, '202405191423', 10, 16, 14, 500000000, 1500000000, 3, 0, '2024-05-19'),
(24, '202405191424', 10, 16, 14, 500000000, 2000000000, 4, 0, '2024-05-19'),
(25, '202405201425', 13, 13, 14, 100000000, 2100000000, 21, 0, '2024-05-20'),
(26, '202405201426', 14, 16, 14, 5000000, 47500000, 10, 5, '2024-05-20'),
(27, '202405201427', 13, 13, 14, 100000000, 120000000, 2, 40, '2024-05-20'),
(28, '202405201428', 10, 16, 14, 500000000, 900000000, 2, 10, '2024-05-20'),
(29, '202405201429', 10, 13, 14, 500000000, 450000000, 1, 10, '2024-05-20'),
(30, '202405201430', 10, 13, 14, 500000000, 1350000000, 3, 10, '2024-05-20'),
(31, '202405201431', 10, 16, 14, 500000000, 800000000, 2, 20, '2024-05-20'),
(32, '202405201432', 13, 16, 14, 100000000, 360000000, 4, 10, '2024-05-20'),
(33, '202406051433', 13, 13, 14, 100000000, 720000000, 8, 10, '2024-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `tb_produk`
--

CREATE TABLE `tb_produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(50) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_produk`
--

INSERT INTO `tb_produk` (`id_produk`, `nama_produk`, `harga`, `stok`, `deskripsi`, `nama_kategori`) VALUES
(10, 'GTX', 500000000, 83, 'ADSHDASHJ', 'HAHA'),
(13, 'ASROCK', 100000000, 15, 'adsdjkdsajk', 'Mobo'),
(14, 'HDD', 5000000, 0, 'ASD', 'ASD');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `level` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama`, `username`, `password`, `level`) VALUES
(14, 'admin', 'admin', 'admin', 'Super Admin'),
(15, 'user', 'user', 'user', 'User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tb_produk`
--
ALTER TABLE `tb_produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD CONSTRAINT `tb_penjualan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `tb_penjualan_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`),
  ADD CONSTRAINT `tb_penjualan_ibfk_3` FOREIGN KEY (`id_produk`) REFERENCES `tb_produk` (`id_produk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
