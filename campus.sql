-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2024 at 07:10 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `campus`
--
CREATE DATABASE IF NOT EXISTS `campus` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `campus`;

-- --------------------------------------------------------

--
-- Table structure for table `alumnado`
--

DROP TABLE IF EXISTS `alumnado`;
CREATE TABLE IF NOT EXISTS `alumnado` (
  `dni` varchar(9) NOT NULL,
  `nombre` text NOT NULL,
  `apellidos` text NOT NULL,
  `email` text NOT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alumnado`
--

INSERT INTO `alumnado` (`dni`, `nombre`, `apellidos`, `email`) VALUES
('12345678B', 'alumno2', 'alumnoo2', 'alumno2@gmail.com'),
('12345678C', 'alumno3', 'alumnoo3', 'alumno3@gmail.com'),
('1234567E', 'alumno5', 'alumnoo5', 'alumno5@gmail.com'),
('1234567F', 'alumno6', 'alumnoo6', 'alumno6@gmail.com'),
('1234567G', 'alumno7', 'alumnoo7', 'alumno7@gmail.com'),
('1234567H', 'alumno8', 'alumnoo8', 'alumno8@gmail.com'),
('13245678D', 'alumno4', 'alumnoo4', 'alumno4@gmail.com'),
('45784869B', 'Moisés Jesús', 'Santana Domínguez', 'mjsdaw@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `aulasvirtuales`
--

DROP TABLE IF EXISTS `aulasvirtuales`;
CREATE TABLE IF NOT EXISTS `aulasvirtuales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombrecorto` tinytext NOT NULL,
  `nombrelargo` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aulasvirtuales`
--

INSERT INTO `aulasvirtuales` (`id`, `nombrecorto`, `nombrelargo`) VALUES
(1, 'DSW', 'Desarrollo en entorno servidor'),
(2, 'DEW', 'Desarrollo en entorno cliente');

-- --------------------------------------------------------

--
-- Table structure for table `matriculas`
--

DROP TABLE IF EXISTS `matriculas`;
CREATE TABLE IF NOT EXISTS `matriculas` (
  `id_aula` int(11) NOT NULL,
  `dni` varchar(9) NOT NULL,
  PRIMARY KEY (`id_aula`,`dni`),
  KEY `fk_matricula_alumando` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matriculas`
--

INSERT INTO `matriculas` (`id_aula`, `dni`) VALUES
(1, '12345678B'),
(1, '12345678C'),
(1, '1234567E'),
(1, '13245678D'),
(1, '45784869B'),
(2, '1234567E'),
(2, '1234567F'),
(2, '1234567G'),
(2, '1234567H'),
(2, '45784869B');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `matriculas`
--
ALTER TABLE `matriculas`
  ADD CONSTRAINT `fk_matricula_alumando` FOREIGN KEY (`dni`) REFERENCES `alumnado` (`dni`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_matricula_aulasvirtuales` FOREIGN KEY (`id_aula`) REFERENCES `aulasvirtuales` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
