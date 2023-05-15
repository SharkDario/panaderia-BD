-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-05-2023 a las 01:46:50
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `panaderia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleremitoproveedor`
--

CREATE TABLE `detalleremitoproveedor` (
  `idDetalleRemitoProveedor` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fechaEntregaProducto` date NOT NULL,
  `idRemito` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idTipoEstadoProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalleremitoproveedor`
--
ALTER TABLE `detalleremitoproveedor`
  ADD PRIMARY KEY (`idDetalleRemitoProveedor`),
  ADD KEY `idRemito` (`idRemito`),
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `idTipoEstadoProducto` (`idTipoEstadoProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalleremitoproveedor`
--
ALTER TABLE `detalleremitoproveedor`
  MODIFY `idDetalleRemitoProveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalleremitoproveedor`
--
ALTER TABLE `detalleremitoproveedor`
  ADD CONSTRAINT `detalleremitoproveedor_ibfk_1` FOREIGN KEY (`idRemito`) REFERENCES `remitoproveedor` (`idRemito`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleremitoproveedor_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`),
  ADD CONSTRAINT `detalleremitoproveedor_ibfk_3` FOREIGN KEY (`idTipoEstadoProducto`) REFERENCES `tipoestadoproducto` (`idTipoEstadoProducto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
