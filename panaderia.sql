-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-06-2023 a las 14:17:31
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

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `nombreCliente`, `CUIL_CUIT`, `DNI`, `telefonoCliente`, `domicilioCliente`) VALUES
(2, 'Brenda', 27458963125, 45896312, 2147483647, 'republica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratacion`
--

CREATE TABLE `contratacion` (
  `idContratacion` int(11) NOT NULL,
  `fechaInicioContratacion` date NOT NULL,
  `fechaFinContratacion` date DEFAULT NULL,
  `idUsuarioAdmin` int(11) NOT NULL,
  `idUsuarioEmpleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contratacion`
--

INSERT INTO `contratacion` (`idContratacion`, `fechaInicioContratacion`, `fechaFinContratacion`, `idUsuarioAdmin`, `idUsuarioEmpleado`) VALUES
(1, '2023-05-02', NULL, 3, 4),
(2, '2023-05-01', '2023-05-31', 5, 3),
(3, '2023-05-30', NULL, 6, 9),
(4, '2023-05-30', NULL, 6, 10),
(5, '2023-05-30', NULL, 6, 11),
(6, '2023-06-01', NULL, 6, 12),
(7, '2023-06-01', NULL, 6, 13),
(8, '2023-06-01', NULL, 6, 14),
(9, '2023-06-01', NULL, 6, 15);

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

--
-- Volcado de datos para la tabla `detalleremitoproveedor`
--

INSERT INTO `detalleremitoproveedor` (`idDetalleRemitoProveedor`, `cantidad`, `fechaEntregaProducto`, `idRemito`, `idMateriaPrima`, `idTipoEstadoMateriaPrima`) VALUES
(1, 2023, '0000-00-00', 1, 1, 1),
(2, 10, '2023-05-02', 1, 1, 1),
(3, 10, '2023-05-02', 1, 1, 1),
(4, 10, '2023-05-02', 1, 1, 1),
(5, 10, '2023-05-02', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fabricacion`
--

CREATE TABLE `fabricacion` (
  `idFabricacion` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idMateriaPrima` int(11) NOT NULL,
  `CantidadMateriaPrima` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fabricacion`
--

INSERT INTO `fabricacion` (`idFabricacion`, `idProducto`, `idMateriaPrima`, `CantidadMateriaPrima`) VALUES
(1, 1, 2, 4),
(2, 1, 3, 0.2),
(3, 2, 3, 0.2),
(4, 2, 4, 0.9),
(6, 1, 4, 0.5);

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

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`idFactura`, `numeroFactura`, `fechaEmisionFactura`, `idTipoFactura`, `precioTotal`, `idMedioPago`, `idCliente`, `idUsuario`) VALUES
(9, 12345, '2023-05-02', 1, 1200.00, 1, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiasprimas`
--

CREATE TABLE `materiasprimas` (
  `idMateriaPrima` int(11) NOT NULL,
  `nombreMateriaPrima` varchar(80) NOT NULL,
  `descripcionMateriaPrima` varchar(80) NOT NULL,
  `precioUnitarioMateriaPrima` decimal(10,2) NOT NULL,
  `stockMateriaPrima` float NOT NULL,
  `stockMinimoMateriaPrima` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materiasprimas`
--

INSERT INTO `materiasprimas` (`idMateriaPrima`, `nombreMateriaPrima`, `descripcionMateriaPrima`, `precioUnitarioMateriaPrima`, `stockMateriaPrima`, `stockMinimoMateriaPrima`) VALUES
(1, 'Harina', 'en kg', 300.00, 60, 10),
(2, 'Huevo', 'unidades', 3.00, 0, 3000),
(3, 'Manteca', 'kg', 230.00, 0, 344),
(4, 'Aceite y agua', 'litro', 450.00, 0, 4444),
(5, 'Avena', 'kg', 400.00, 0, 3000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mediopago`
--

CREATE TABLE `mediopago` (
  `idMedioPago` int(11) NOT NULL,
  `descripcionMedioPago` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mediopago`
--

INSERT INTO `mediopago` (`idMedioPago`, `descripcionMedioPago`) VALUES
(1, 'contado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `nombreProducto` varchar(80) NOT NULL,
  `descripcionProducto` varchar(80) NOT NULL,
  `precioUnitarioProducto` decimal(10,2) NOT NULL,
  `stockProducto` float NOT NULL,
  `stockMinimoProducto` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombreProducto`, `descripcionProducto`, `precioUnitarioProducto`, `stockProducto`, `stockMinimoProducto`) VALUES
(1, 'Chipa', 'en kg', 300.00, 60, 10),
(2, 'Pan de leche', 'unidades', 300.00, 0, 3000);

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

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idProveedor`, `nombreProveedor`, `CUIL_CUIT`, `DNI`, `telefonoProveedor`, `domicilioProveedor`) VALUES
(1, 'Brenda', 27458963125, 45896312, 2147483647, 'republica'),
(2, 'Azul Coronel', 33555555553, 55555555, 2323, 'conejos');

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

--
-- Volcado de datos para la tabla `remitoproveedor`
--

INSERT INTO `remitoproveedor` (`idRemito`, `numeroRemito`, `fechaEmisionRemito`, `idProveedor`) VALUES
(1, 2345, '2023-05-02', 1),
(2, 2345, '2023-05-02', 1),
(3, 2345, '2023-05-02', 1),
(4, 2345, '2023-05-02', 1),
(5, 2345, '2023-05-02', 1),
(6, 2345, '2023-05-02', 1),
(7, 2345, '2023-05-02', 1),
(8, 1, '2023-05-02', 1),
(9, 1, '2023-05-02', 1),
(10, 1, '2023-05-02', 1),
(11, 1, '2023-05-02', 1);

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

--
-- Volcado de datos para la tabla `tipoestadomateriaprima`
--

INSERT INTO `tipoestadomateriaprima` (`idTipoEstadoMateriaPrima`, `descripcionEstadoMateriaPrima`) VALUES
(1, 'integro'),
(2, 'defectuoso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipofactura`
--

CREATE TABLE `tipofactura` (
  `idTipoFactura` int(11) NOT NULL,
  `descripcion` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipofactura`
--

INSERT INTO `tipofactura` (`idTipoFactura`, `descripcion`) VALUES
(1, 'FACTURA A');

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
(2, 'empleado', 3);

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
  `telefono` int(15) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `idTipoUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `DNI`, `CUIL_CUIT`, `nombre`, `domicilio`, `telefono`, `usuario`, `clave`, `idTipoUsuario`) VALUES
(3, 44923092, 27449230928, 'brenda', 'no tengo', 0, 'bren', '1234', 2),
(4, 45678901, 23456789012, 'holsa', 'holwfewfew', 370458963, 'hola2', '1234556', 2),
(5, 44923092, 23456789012, 'adminsoy', 'notngo', 370502044, 'admin', '12345', 1),
(6, 44444444, 44444444444, 'Darío Coronel', 'Pauzier', 6666, 'DarioDario7', 'DarioDario7', 1),
(7, 88888888, 88888888888, 'B', 'B', 66666, 'BelenBelen7', 'BelenBelen7', 2),
(8, 99999999, 99999999999, 'Lore', 'L', 55555, 'LoreLore7', 'LoreLore7', 2),
(9, 89898989, 89898989899, 'Mel', 'mel', 44544, 'MelaMela7', 'MelaMela7', 2),
(10, 87878787, 87878787877, 'Agustin', 'Ag', 44432, 'AgusAgus7', 'AgusAgus7', 2),
(11, 65656565, 65656565656, 'Sonia', '34334', 34343, 'SoniaSonia7', 'SoniaSonia7', 2),
(12, 34343434, 55343434345, 'fff', 'fff', 4545, 'FFFF5555', 'FFFF5555', 2),
(13, 77777777, 55777777775, 'rrr', 'rrr', 777, 'RRRR7777', 'RRRR7777', 2),
(14, 45464546, 45454645465, 'gggg', 'gggg', 6666, 'GGGG6666', 'GGGG6666', 2),
(15, 32323232, 32323232323, 'Mayten Leila Avalos', 'Paraguay', 4444, 'MaytenL', 'Mayten04', 2);

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
  ADD KEY `idUsuario` (`idUsuarioAdmin`),
  ADD KEY `idUsuarioEmpleado` (`idUsuarioEmpleado`);

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
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `contratacion`
--
ALTER TABLE `contratacion`
  MODIFY `idContratacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  MODIFY `idDetalleFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalleremitoproveedor`
--
ALTER TABLE `detalleremitoproveedor`
  MODIFY `idDetalleRemitoProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `fabricacion`
--
ALTER TABLE `fabricacion`
  MODIFY `idFabricacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `materiasprimas`
--
ALTER TABLE `materiasprimas`
  MODIFY `idMateriaPrima` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `mediopago`
--
ALTER TABLE `mediopago`
  MODIFY `idMedioPago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `remitoproveedor`
--
ALTER TABLE `remitoproveedor`
  MODIFY `idRemito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tipoempleado`
--
ALTER TABLE `tipoempleado`
  MODIFY `idTipoEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipoestadomateriaprima`
--
ALTER TABLE `tipoestadomateriaprima`
  MODIFY `idTipoEstadoMateriaPrima` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipofactura`
--
ALTER TABLE `tipofactura`
  MODIFY `idTipoFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `idTipoUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contratacion`
--
ALTER TABLE `contratacion`
  ADD CONSTRAINT `contratacion_ibfk_1` FOREIGN KEY (`idUsuarioAdmin`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contratacion_ibfk_2` FOREIGN KEY (`idUsuarioEmpleado`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

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
