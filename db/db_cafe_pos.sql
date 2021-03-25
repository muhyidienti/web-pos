-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Mar 2021 pada 00.11
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cafe_pos`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id` int(11) NOT NULL,
  `kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_kategori`
--

INSERT INTO `tb_kategori` (`id`, `kategori`) VALUES
(1, 'Makanan'),
(2, 'Minuman');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_laporan_transaksi`
--

CREATE TABLE `tb_laporan_transaksi` (
  `id_makanan` int(11) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `tanggal_transaksi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_laporan_transaksi`
--

INSERT INTO `tb_laporan_transaksi` (`id_makanan`, `kategori`, `nama`, `qty`, `harga`, `tanggal_transaksi`) VALUES
(1, 'Makanan', 'Bakso Spesial', 1, 22000, '21-03-17'),
(7, 'Makanan', 'Nasi Ayam Geprek', 1, 25000, '21-03-17'),
(6, 'Makanan', 'Mie Goreng Spesial', 1, 15000, '21-03-17'),
(9, 'Makanan', 'Nasi Rames', 1, 10000, '21-03-17'),
(16, 'Minuman', 'Teh Hangat', 1, 6000, '21-03-17'),
(14, 'Minuman', 'Es Jeruk', 1, 8000, '21-03-17'),
(1, 'Makanan', 'Bakso Spesial', 1, 22000, '21-03-18'),
(7, 'Makanan', 'Nasi Ayam Geprek', 1, 25000, '21-03-18'),
(14, 'Minuman', 'Es Jeruk', 1, 8000, '21-03-18'),
(16, 'Minuman', 'Teh Hangat', 1, 6000, '21-03-18'),
(1, 'Makanan', 'Bakso Spesial', 1, 22000, '21-03-18'),
(5, 'Makanan', 'Mie Ayam Bakso', 1, 21000, '21-03-18'),
(14, 'Minuman', 'Es Jeruk', 1, 8000, '21-03-18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_makanan`
--

CREATE TABLE `tb_makanan` (
  `id` int(11) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `gambar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_makanan`
--

INSERT INTO `tb_makanan` (`id`, `kategori`, `nama`, `harga`, `gambar`) VALUES
(1, 'Makanan', 'Bakso Spesial', 22000, 'bakso2.jpg'),
(3, 'Makanan', 'Burger Spesial', 10000, 'cheese-burger.jpg'),
(4, 'Makanan', 'Lontong Opor Ayam', 20000, 'lontong-opor-ayam.jpg'),
(5, 'Makanan', 'Mie Ayam Bakso', 21000, 'mie-ayam-bakso.jpg'),
(6, 'Makanan', 'Mie Goreng Spesial', 15000, 'mie-goreng.jpg'),
(7, 'Makanan', 'Nasi Ayam Geprek', 25000, 'nasi-ayam-geprek.jpg'),
(8, 'Makanan', 'Nasi Goreng Telor', 16000, 'nasi-goreng-telor.jpg'),
(9, 'Makanan', 'Nasi Rames', 10000, 'nasi-rames.jpg'),
(10, 'Makanan', 'Pangsit', 3000, 'pangsit.jpg'),
(11, 'Makanan', 'Sate Ayam', 15000, 'sate-ayam.jpg'),
(12, 'Minuman', 'Coffe Late', 10000, 'coffe-late.jpg'),
(14, 'Minuman', 'Es Jeruk', 8000, 'es-jeruk1.jpg'),
(15, 'Minuman', 'Es Teh', 6000, 'es-teh.jpg'),
(16, 'Minuman', 'Teh Hangat', 6000, 'teh-hangat.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id` int(11) NOT NULL,
  `id_makanan` int(11) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `tanggal_transaksi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_makanan`
--
ALTER TABLE `tb_makanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_makanan`
--
ALTER TABLE `tb_makanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
