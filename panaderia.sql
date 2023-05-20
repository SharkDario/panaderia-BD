-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-05-2023 a las 23:33:44
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
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `nombreCliente` varchar(80) NOT NULL,
  `CUIL_CUIT` bigint(13) NOT NULL,
  `DNI` bigint(8) NOT NULL,
  `telefonoCliente` int(15) NOT NULL,
  `domicilioCliente` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratacion`
--

CREATE TABLE `contratacion` (
  `idContratacion` int(11) NOT NULL,
  `fechaInicioContratacion` date NOT NULL,
  `fechaFinContratacion` date DEFAULT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefactura`
--

CREATE TABLE `detallefactura` (
  `idDetalleFactura` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioUnitario` decimal(10,2) NOT NULL,
  `idFactura` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleremitoproveedor`
--

CREATE TABLE `detalleremitoproveedor` (
  `idDetalleRemitoProveedor` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fechaEntregaProducto` date NOT NULL,
  `idRemito` int(11) NOT NULL,
  `idMateriaPrima` int(11) NOT NULL,
  `idTipoEstadoMateriaPrima` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fabricacion`
--

CREATE TABLE `fabricacion` (
  `idFabricacion` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idMateriaPrima` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL,
  `numeroFactura` int(11) NOT NULL,
  `fechaEmisionFactura` date NOT NULL,
  `idTipoFactura` int(11) NOT NULL,
  `precioTotal` decimal(10,2) NOT NULL,
  `idMedioPago` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiasprimas`
--

CREATE TABLE `materiasprimas` (
  `idMateriaPrima` int(11) NOT NULL,
  `nombreMateriaPrima` varchar(80) NOT NULL,
  `descripcionMateriaPrima` varchar(80) NOT NULL,
  `precioUnitarioMateriaPrima` decimal(10,2) NOT NULL,
  `stockMateriaPrima` int(11) NOT NULL,
  `fechaVencimientoMateriaPrima` date NOT NULL,
  `stockMinimoMateriaPrima` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mediopago`
--

CREATE TABLE `mediopago` (
  `idMedioPago` int(11) NOT NULL,
  `descripcionMedioPago` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `nombreProducto` varchar(80) NOT NULL,
  `descripcionProducto` varchar(80) NOT NULL,
  `precioUnitarioProducto` decimal(10,2) NOT NULL,
  `stockProducto` int(11) NOT NULL,
  `fechaVencimientoProducto` date NOT NULL,
  `stockMinimoProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedor` int(11) NOT NULL,
  `nombreProveedor` varchar(80) NOT NULL,
  `CUIL_CUIT` bigint(13) NOT NULL,
  `DNI` bigint(8) DEFAULT NULL,
  `telefonoProveedor` int(15) NOT NULL,
  `domicilioProveedor` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remitoproveedor`
--

CREATE TABLE `remitoproveedor` (
  `idRemito` int(11) NOT NULL,
  `numeroRemito` int(11) NOT NULL,
  `fechaEmisionRemito` date NOT NULL,
  `idProveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoempleado`
--

CREATE TABLE `tipoempleado` (
  `idTipoEmpleado` int(11) NOT NULL,
  `descripcionTipoEmpleado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipoempleado`
--

INSERT INTO `tipoempleado` (`idTipoEmpleado`, `descripcionTipoEmpleado`) VALUES
(1, 'repositor'),
(2, 'vendedor'),
(3, 'productor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoestadomateriaprima`
--

CREATE TABLE `tipoestadomateriaprima` (
  `idTipoEstadoMateriaPrima` int(11) NOT NULL,
  `descripcionEstadoMateriaPrima` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipofactura`
--

CREATE TABLE `tipofactura` (
  `idTipoFactura` int(11) NOT NULL,
  `descripcion` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `idTipoUsuario` int(11) NOT NULL,
  `descripcionTipoUsuario` varchar(45) NOT NULL,
  `idTipoEmpleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`idTipoUsuario`, `descripcionTipoUsuario`, `idTipoEmpleado`) VALUES
(1, 'administrador', NULL),
(2, 'empleado', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `DNI` bigint(8) NOT NULL,
  `CUIL_CUIT` bigint(13) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `domicilio` varchar(120) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `idTipoUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `contratacion`
--
ALTER TABLE `contratacion`
  ADD PRIMARY KEY (`idContratacion`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD PRIMARY KEY (`idDetalleFactura`),
  ADD KEY `idFactura` (`idFactura`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `detalleremitoproveedor`
--
ALTER TABLE `detalleremitoproveedor`
  ADD PRIMARY KEY (`idDetalleRemitoProveedor`),
  ADD KEY `idRemito` (`idRemito`),
  ADD KEY `idMateriaPrima` (`idMateriaPrima`),
  ADD KEY `idTipoEstadoMateriaPrima` (`idTipoEstadoMateriaPrima`);

--
-- Indices de la tabla `fabricacion`
--
ALTER TABLE `fabricacion`
  ADD PRIMARY KEY (`idFabricacion`),
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `idMateriaPrima` (`idMateriaPrima`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idMedioPago` (`idMedioPago`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `factura_ibfk_4` (`idTipoFactura`);

--
-- Indices de la tabla `materiasprimas`
--
ALTER TABLE `materiasprimas`
  ADD PRIMARY KEY (`idMateriaPrima`);

--
-- Indices de la tabla `mediopago`
--
ALTER TABLE `mediopago`
  ADD PRIMARY KEY (`idMedioPago`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `remitoproveedor`
--
ALTER TABLE `remitoproveedor`
  ADD PRIMARY KEY (`idRemito`),
  ADD KEY `idProveedor` (`idProveedor`);

--
-- Indices de la tabla `tipoempleado`
--
ALTER TABLE `tipoempleado`
  ADD PRIMARY KEY (`idTipoEmpleado`);

--
-- Indices de la tabla `tipoestadomateriaprima`
--
ALTER TABLE `tipoestadomateriaprima`
  ADD PRIMARY KEY (`idTipoEstadoMateriaPrima`);

--
-- Indices de la tabla `tipofactura`
--
ALTER TABLE `tipofactura`
  ADD PRIMARY KEY (`idTipoFactura`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`idTipoUsuario`),
  ADD KEY `idTipoEmpleado` (`idTipoEmpleado`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idTipoUsuario` (`idTipoUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contratacion`
--
ALTER TABLE `contratacion`
  MODIFY `idContratacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  MODIFY `idDetalleFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalleremitoproveedor`
--
ALTER TABLE `detalleremitoproveedor`
  MODIFY `idDetalleRemitoProveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fabricacion`
--
ALTER TABLE `fabricacion`
  MODIFY `idFabricacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materiasprimas`
--
ALTER TABLE `materiasprimas`
  MODIFY `idMateriaPrima` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mediopago`
--
ALTER TABLE `mediopago`
  MODIFY `idMedioPago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `remitoproveedor`
--
ALTER TABLE `remitoproveedor`
  MODIFY `idRemito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipoempleado`
--
ALTER TABLE `tipoempleado`
  MODIFY `idTipoEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipoestadomateriaprima`
--
ALTER TABLE `tipoestadomateriaprima`
  MODIFY `idTipoEstadoMateriaPrima` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipofactura`
--
ALTER TABLE `tipofactura`
  MODIFY `idTipoFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `idTipoUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contratacion`
--
ALTER TABLE `contratacion`
  ADD CONSTRAINT `contratacion_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD CONSTRAINT `detallefactura_ibfk_1` FOREIGN KEY (`idFactura`) REFERENCES `factura` (`idFactura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detallefactura_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalleremitoproveedor`
--
ALTER TABLE `detalleremitoproveedor`
  ADD CONSTRAINT `detalleremitoproveedor_ibfk_1` FOREIGN KEY (`idRemito`) REFERENCES `remitoproveedor` (`idRemito`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleremitoproveedor_ibfk_2` FOREIGN KEY (`idMateriaPrima`) REFERENCES `materiasprimas` (`idMateriaPrima`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleremitoproveedor_ibfk_3` FOREIGN KEY (`idTipoEstadoMateriaPrima`) REFERENCES `tipoestadomateriaprima` (`idTipoEstadoMateriaPrima`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `fabricacion`
--
ALTER TABLE `fabricacion`
  ADD CONSTRAINT `fabricacion_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fabricacion_ibfk_2` FOREIGN KEY (`idMateriaPrima`) REFERENCES `materiasprimas` (`idMateriaPrima`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`idMedioPago`) REFERENCES `mediopago` (`idMedioPago`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_ibfk_4` FOREIGN KEY (`idTipoFactura`) REFERENCES `tipofactura` (`idTipoFactura`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `remitoproveedor`
--
ALTER TABLE `remitoproveedor`
  ADD CONSTRAINT `remitoproveedor_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD CONSTRAINT `tipousuario_ibfk_1` FOREIGN KEY (`idTipoEmpleado`) REFERENCES `tipoempleado` (`idTipoEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idTipoUsuario`) REFERENCES `tipousuario` (`idTipoUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
