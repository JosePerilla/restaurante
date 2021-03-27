-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-03-2021 a las 16:58:13
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fosdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `ID` int(2) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_admin`
--

INSERT INTO `tbl_admin` (`ID`, `username`, `password`) VALUES
(0, 'Miku Nakano', '123456'),
(1, 'Kirito', '123456'),
(2, 'Natsuki Subaru', '123456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `menuID` int(11) NOT NULL,
  `menuName` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_menu`
--

INSERT INTO `tbl_menu` (`menuID`, `menuName`) VALUES
(12, 'Desayunos'),
(13, 'Almuerzos'),
(14, 'Bebidas'),
(15, 'Combos & Especiales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_menuitem`
--

CREATE TABLE `tbl_menuitem` (
  `itemID` int(11) NOT NULL,
  `menuID` int(11) NOT NULL,
  `menuItemName` text NOT NULL,
  `price` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_menuitem`
--

INSERT INTO `tbl_menuitem` (`itemID`, `menuID`, `menuItemName`, `price`) VALUES
(40, 12, 'Tamagoyaki', '9600.00'),
(41, 12, 'Hotcakes con Fruta', '10000.00'),
(42, 12, 'Miku\'s Coffee Breakfast (Tortilla + Miku\'s Coffee + Croissant)', '13000.00'),
(43, 12, 'Chocolate con Malvaviscos', '5500.00'),
(44, 12, 'Miku\'s Coffe + Malvaviscos', '6000.00'),
(45, 12, 'Huevos revueltos con cebolla y tomate', '6000.00'),
(46, 12, 'Sopa de pollo', '6000.00'),
(47, 13, 'Nino\'s Ramen', '27000.00'),
(48, 13, 'Katsu', '32000.00'),
(49, 13, 'Sopa de miso', '10000.00'),
(50, 13, 'Sashimi', '20000.00'),
(51, 13, 'Salmón al Horno', '27000.00'),
(52, 13, 'Itsuki\'s Sushi', '27000.00'),
(53, 14, 'Miku\'s Coffee Traditional', '4500.00'),
(54, 14, 'Miku\'s Coffe Mocca', '6000.00'),
(55, 14, 'Miku\'s Coffe Capuccino', '6000.00'),
(56, 14, 'Miku\'s Coffe Latte', '5000.00'),
(57, 14, 'Malteada de Fresa', '5500.00'),
(58, 14, 'Malteada de Vainilla', '5500.00'),
(59, 14, 'Malteada de Chocolate', '5500.00'),
(60, 15, 'Katsu + Papas Firtas + Gaseosa 250ml', '42000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_order`
--

CREATE TABLE `tbl_order` (
  `orderID` int(11) NOT NULL,
  `status` text NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_order`
--

INSERT INTO `tbl_order` (`orderID`, `status`, `total`, `order_date`) VALUES
(1, 'Completed', '1000.00', '2020-01-17'),
(2, 'Completed', '10000.00', '2020-01-17'),
(3, 'Completed', '11000.00', '2020-01-18'),
(4, 'cancelled', '6000.00', '2020-01-18'),
(5, 'Completed', '10000.00', '2020-01-25'),
(6, 'Completed', '15500.00', '2020-01-25'),
(7, 'Completed', '6200.00', '2021-03-27'),
(8, 'Completed', '3600.00', '2021-03-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_orderdetail`
--

CREATE TABLE `tbl_orderdetail` (
  `orderID` int(11) NOT NULL,
  `orderDetailID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_orderdetail`
--

INSERT INTO `tbl_orderdetail` (`orderID`, `orderDetailID`, `itemID`, `quantity`) VALUES
(1, 1, 14, 1),
(2, 2, 13, 1),
(2, 3, 14, 1),
(2, 4, 15, 1),
(2, 5, 16, 1),
(3, 6, 25, 1),
(3, 7, 38, 1),
(3, 8, 32, 1),
(4, 9, 17, 1),
(4, 10, 30, 1),
(5, 11, 17, 2),
(6, 12, 23, 1),
(6, 13, 26, 1),
(6, 14, 36, 1),
(7, 15, 19, 1),
(7, 16, 31, 1),
(8, 17, 31, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_role`
--

CREATE TABLE `tbl_role` (
  `role` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_role`
--

INSERT INTO `tbl_role` (`role`) VALUES
('chef'),
('Mesero'),
('Repartidor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_staff`
--

CREATE TABLE `tbl_staff` (
  `staffID` int(2) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` text NOT NULL,
  `role` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_staff`
--

INSERT INTO `tbl_staff` (`staffID`, `username`, `password`, `status`, `role`) VALUES
(1, 'Nino Nakano', '123456', 'Online', 'chef'),
(2, 'Ichika Nakano', '123456', 'Online', 'Mesero'),
(3, 'Itsuki Nakano', '123456', 'Offline', 'chef'),
(4, 'Fuutarou', '123456', 'Online', 'Repartidor'),
(5, 'Yotsuba Nakano', '123456', 'Online', 'Mesero'),
(6, 'Raiha', '123456', 'Online', 'chef');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`menuID`);

--
-- Indices de la tabla `tbl_menuitem`
--
ALTER TABLE `tbl_menuitem`
  ADD PRIMARY KEY (`itemID`),
  ADD KEY `menuID` (`menuID`);

--
-- Indices de la tabla `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`orderID`);

--
-- Indices de la tabla `tbl_orderdetail`
--
ALTER TABLE `tbl_orderdetail`
  ADD PRIMARY KEY (`orderDetailID`),
  ADD KEY `itemID` (`itemID`),
  ADD KEY `orderID` (`orderID`);

--
-- Indices de la tabla `tbl_staff`
--
ALTER TABLE `tbl_staff`
  ADD PRIMARY KEY (`staffID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `menuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tbl_menuitem`
--
ALTER TABLE `tbl_menuitem`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `tbl_orderdetail`
--
ALTER TABLE `tbl_orderdetail`
  MODIFY `orderDetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tbl_staff`
--
ALTER TABLE `tbl_staff`
  MODIFY `staffID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
