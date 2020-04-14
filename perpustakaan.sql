-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2020 at 10:52 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `nis` int(11) NOT NULL,
  `namaA` varchar(50) NOT NULL,
  `ttl` varchar(15) NOT NULL,
  `jk` varchar(15) NOT NULL,
  `agama` varchar(15) NOT NULL,
  `kelas` varchar(15) NOT NULL,
  `daftar` varchar(15) NOT NULL,
  `exp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`nis`, `namaA`, `ttl`, `jk`, `agama`, `kelas`, `daftar`, `exp`) VALUES
(123, 'riko dwinaro', '31-03-0000', 'Pria', 'Islam', 'B', '12-12-0000', '12-12-0000'),
(999, 'Rd', '31-03-0000', 'Laki-laki', 'Islam', 'b', '29-03-2015', '30-03-2018');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `kode` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `pengarang` varchar(50) NOT NULL,
  `penerbit` varchar(50) NOT NULL,
  `terbit` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`kode`, `judul`, `pengarang`, `penerbit`, `terbit`) VALUES
(1, 'Percy', 'Bobs', 'IndieHome', '2030');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `nik` int(9) NOT NULL,
  `namaK` varchar(50) NOT NULL,
  `jk` varchar(50) NOT NULL,
  `golongan` int(11) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `tunjangan` varchar(50) NOT NULL,
  `gaji` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `np` int(11) NOT NULL,
  `nis` int(11) NOT NULL,
  `namaA` varchar(50) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  `kode` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `penerbit` varchar(50) NOT NULL,
  `pinjam` date NOT NULL,
  `kembali` date NOT NULL,
  `lama` varchar(50) NOT NULL,
  `denda` varchar(50) NOT NULL,
  `nik` int(11) NOT NULL,
  `namaK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`nis`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`np`),
  ADD KEY `nik` (`nik`),
  ADD KEY `nis` (`nis`,`kode`),
  ADD KEY `kode` (`kode`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`),
  ADD CONSTRAINT `pengembalian_ibfk_2` FOREIGN KEY (`nis`) REFERENCES `anggota` (`nis`),
  ADD CONSTRAINT `pengembalian_ibfk_3` FOREIGN KEY (`kode`) REFERENCES `buku` (`kode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
