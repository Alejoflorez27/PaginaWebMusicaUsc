-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2022 a las 02:24:10
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `albumes`
--

CREATE TABLE `albumes` (
  `id` int(11) NOT NULL,
  `nom_album` varchar(30) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `albumes`
--

INSERT INTO `albumes` (`id`, `nom_album`, `descripcion`, `ano`) VALUES
(1, 'Smiley Smile', 'Smiley Smile es el duodécimo álbum de estudio por The Beach Boys, publicado en 1967. Fue editado tras el cancelado SMiLE, y se lo puede considerar como una especie de secuela.', 1967),
(2, 'Arrival', 'Arrival es el nombre del cuarto álbum de estudio del grupo sueco ABBA y fue lanzado en octubre de 1976. El álbum contiene la canción más exitosa del grupo, \"Dancing Queen\", así como los éxitos de \"Fernando\", \"Knowing Me, Knowing You\" y \"Money, Money.', 1976),
(3, 'Appetite for Destruction', 'Es el álbum debut de la banda estadounidense de hard rock Guns N\' Roses, fue publicado por la compañía discográfica Geffen Records el 21 de julio de 1987, tras su autoeditado Live ?!*@ Like a Suicide.', 1987);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artistas`
--

CREATE TABLE `artistas` (
  `id` int(11) NOT NULL,
  `nombre_art` varchar(30) NOT NULL,
  `edad` varchar(2) DEFAULT NULL,
  `biografia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `artistas`
--

INSERT INTO `artistas` (`id`, `nombre_art`, `edad`, `biografia`) VALUES
(2, 'Pink Floyd', '55', 'rockero'),
(3, 'sam smith', '51', 'cantante de pop'),
(4, 'juanes', '45', 'cantante colombiano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canciones`
--

CREATE TABLE `canciones` (
  `id` int(11) NOT NULL,
  `nom_cancion` varchar(30) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `id_genero` int(11) NOT NULL,
  `id_album` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `canciones`
--

INSERT INTO `canciones` (`id`, `nom_cancion`, `descripcion`, `ano`, `id_genero`, `id_album`) VALUES
(1, 'Good vibrations', 'Es una canción escrita, compuesta y producida por Brian Wilson con letras de Mike Love e interpretada por The Beach Boys con Carl Wilson como vocalista principal.', 1966, 1, 1),
(2, 'Dancing queen', 'Es una canción del género pop y disco, interpretada por el grupo sueco ABBA. Escrita en 1975 por Benny Andersson, Björn Ulvaeus y Stig Anderson, este tema se incluyó en el cuarto álbum de estudio del grupo, titulado Arrival, poco después de haber sid', 1976, 1, 2),
(3, 'Sweet Child o\' Mine', 'Es una canción del grupo de hard rock Guns N\' Roses. Fue publicada en su primer álbum, Appetite for Destruction, el 21 de julio de 1987. Es la novena canción en el álbum y el tercer sencillo.', 1988, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canciones_artistas`
--

CREATE TABLE `canciones_artistas` (
  `id_cancion` int(11) NOT NULL,
  `id_artista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `fecha`) VALUES
(1, 'Rock', '2022-12-01 07:23:10'),
(2, 'Pop', '2022-12-01 07:23:30'),
(3, 'Reggetón', '2022-12-01 07:26:34'),
(4, 'REGGAE', '2022-12-01 07:27:17'),
(5, 'BACHATA', '2022-12-01 07:27:38'),
(6, 'SALSA', '2022-12-01 07:28:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `id` int(11) NOT NULL,
  `nom_genero` varchar(30) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id`, `nom_genero`, `descripcion`, `ano`) VALUES
(1, 'pop', 'Es un género de música popular que tuvo su origen a finales de los años 1950 como una derivación del tradicional pop, en combinación con otros géneros musicales que estaban de moda en aquel momento.', 1950),
(2, 'Rock', 'Es un amplio género de música popular originado a principios de la década de 1950 en Estados Unidos y que derivaría en un gran rango de diferentes estilos durante mediados de los años 60 y posteriores, particularmente en ese país y Reino Unido.', 1950),
(14, 'salsa', 'pacifico', 1927);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `codigo` text COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `imagen` text COLLATE utf8_spanish_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `precio_compra` float NOT NULL,
  `precio_venta` float NOT NULL,
  `ventas` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `id_categoria`, `codigo`, `descripcion`, `imagen`, `stock`, `precio_compra`, `precio_venta`, `ventas`, `fecha`) VALUES
(1, 1, '101', 'Aspiradora Industrial ', 'vistas/img/productos/101/632.png', 20, 1000, 1400, 0, '2022-02-08 21:19:28'),
(2, 1, '102', 'Plato Flotante para Allanadora', 'vistas/img/productos/102/940.jpg', 20, 4500, 6300, 0, '2017-12-22 21:33:16'),
(3, 1, '103', 'Compresor de Aire para pintura', 'vistas/img/productos/103/763.jpg', 20, 3000, 4200, 0, '2017-12-22 21:33:31'),
(4, 1, '104', 'Cortadora de Adobe sin Disco ', 'vistas/img/productos/104/957.jpg', 20, 4000, 5600, 0, '2017-12-22 21:33:52'),
(5, 1, '105', 'Cortadora de Piso sin Disco ', 'vistas/img/productos/105/630.jpg', 20, 1540, 2156, 0, '2017-12-22 21:34:08'),
(6, 1, '106', 'Disco Punta Diamante ', 'vistas/img/productos/106/635.jpg', 20, 1100, 1540, 0, '2017-12-22 21:34:20'),
(7, 1, '107', 'Extractor de Aire ', 'vistas/img/productos/107/848.jpg', 20, 1540, 2156, 0, '2017-12-22 21:34:33'),
(8, 1, '108', 'Guadañadora ', 'vistas/img/productos/108/163.jpg', 20, 1540, 2156, 0, '2017-12-22 21:34:44'),
(9, 1, '109', 'Hidrolavadora Eléctrica ', 'vistas/img/productos/109/769.jpg', 20, 2600, 3640, 0, '2017-12-22 21:35:08'),
(10, 1, '110', 'Hidrolavadora Gasolina', 'vistas/img/productos/110/582.jpg', 20, 2210, 3094, 0, '2017-12-22 21:35:19'),
(11, 1, '111', 'Motobomba a Gasolina', 'vistas/img/productos/default/anonymous.png', 20, 2860, 4004, 0, '2017-12-22 02:56:28'),
(12, 1, '112', 'Motobomba El?ctrica', 'vistas/img/productos/default/anonymous.png', 20, 2400, 3360, 0, '2017-12-22 02:56:28'),
(13, 1, '113', 'Sierra Circular ', 'vistas/img/productos/default/anonymous.png', 20, 1100, 1540, 0, '2017-12-22 02:56:28'),
(14, 1, '114', 'Disco de tugsteno para Sierra circular', 'vistas/img/productos/default/anonymous.png', 20, 4500, 6300, 0, '2017-12-22 02:56:28'),
(15, 1, '115', 'Soldador Electrico ', 'vistas/img/productos/default/anonymous.png', 20, 1980, 2772, 0, '2017-12-22 02:56:28'),
(16, 1, '116', 'Careta para Soldador', 'vistas/img/productos/default/anonymous.png', 20, 4200, 5880, 0, '2017-12-22 02:56:28'),
(17, 1, '117', 'Torre de iluminacion ', 'vistas/img/productos/default/anonymous.png', 20, 1800, 2520, 0, '2017-12-22 02:56:28'),
(18, 2, '201', 'Martillo Demoledor de Piso 110V', 'vistas/img/productos/default/anonymous.png', 20, 5600, 7840, 0, '2017-12-22 02:56:28'),
(19, 2, '202', 'Muela o cincel martillo demoledor piso', 'vistas/img/productos/default/anonymous.png', 20, 9600, 13440, 0, '2017-12-22 02:56:28'),
(20, 2, '203', 'Taladro Demoledor de muro 110V', 'vistas/img/productos/default/anonymous.png', 20, 3850, 5390, 0, '2017-12-22 02:56:28'),
(21, 2, '204', 'Muela o cincel martillo demoledor muro', 'vistas/img/productos/default/anonymous.png', 20, 9600, 13440, 0, '2017-12-22 02:56:28'),
(22, 2, '205', 'Taladro Percutor de 1/2 Madera y Metal', 'vistas/img/productos/default/anonymous.png', 20, 8000, 11200, 0, '2017-12-22 03:28:24'),
(23, 2, '206', 'Taladro Percutor SDS Plus 110V', 'vistas/img/productos/default/anonymous.png', 20, 3900, 5460, 0, '2017-12-22 02:56:28'),
(24, 2, '207', 'Taladro Percutor SDS Max 110V (Mineria)', 'vistas/img/productos/default/anonymous.png', 20, 4600, 6440, 0, '2017-12-22 02:56:28'),
(25, 3, '301', 'Andamio colgante', 'vistas/img/productos/default/anonymous.png', 20, 1440, 2016, 0, '2017-12-22 02:56:28'),
(26, 3, '302', 'Distanciador andamio colgante', 'vistas/img/productos/default/anonymous.png', 20, 1600, 2240, 0, '2017-12-22 02:56:28'),
(27, 3, '303', 'Marco andamio modular ', 'vistas/img/productos/default/anonymous.png', 20, 900, 1260, 0, '2017-12-22 02:56:28'),
(28, 3, '304', 'Marco andamio tijera', 'vistas/img/productos/default/anonymous.png', 20, 100, 140, 0, '2017-12-22 02:56:28'),
(29, 3, '305', 'Tijera para andamio', 'vistas/img/productos/default/anonymous.png', 20, 162, 226, 0, '2017-12-22 02:56:28'),
(30, 3, '306', 'Escalera interna para andamio', 'vistas/img/productos/default/anonymous.png', 20, 270, 378, 0, '2017-12-22 02:56:28'),
(31, 3, '307', 'Pasamanos de seguridad', 'vistas/img/productos/default/anonymous.png', 20, 75, 105, 0, '2017-12-22 02:56:28'),
(32, 3, '308', 'Rueda giratoria para andamio', 'vistas/img/productos/default/anonymous.png', 20, 168, 235, 0, '2017-12-22 02:56:28'),
(33, 3, '309', 'Arnes de seguridad', 'vistas/img/productos/default/anonymous.png', 20, 1750, 2450, 0, '2017-12-22 02:56:28'),
(34, 3, '310', 'Eslinga para arnes', 'vistas/img/productos/default/anonymous.png', 20, 175, 245, 0, '2017-12-22 02:56:28'),
(35, 3, '311', 'Plataforma Met?lica', 'vistas/img/productos/default/anonymous.png', 20, 420, 588, 0, '2017-12-22 02:56:28'),
(36, 4, '401', 'Planta Electrica Diesel 6 Kva', 'vistas/img/productos/default/anonymous.png', 20, 3500, 4900, 0, '2017-12-22 02:56:28'),
(37, 4, '402', 'Planta Electrica Diesel 10 Kva', 'vistas/img/productos/default/anonymous.png', 20, 3550, 4970, 0, '2017-12-22 02:56:28'),
(38, 4, '403', 'Planta Electrica Diesel 20 Kva', 'vistas/img/productos/default/anonymous.png', 20, 3600, 5040, 0, '2017-12-22 02:56:28'),
(39, 4, '404', 'Planta Electrica Diesel 30 Kva', 'vistas/img/productos/default/anonymous.png', 20, 3650, 5110, 0, '2017-12-22 02:56:28'),
(40, 4, '405', 'Planta Electrica Diesel 60 Kva', 'vistas/img/productos/default/anonymous.png', 20, 3700, 5180, 0, '2017-12-22 02:56:28'),
(41, 4, '406', 'Planta Electrica Diesel 75 Kva', 'vistas/img/productos/default/anonymous.png', 20, 3750, 5250, 0, '2017-12-22 02:56:28'),
(42, 4, '407', 'Planta Electrica Diesel 100 Kva', 'vistas/img/productos/default/anonymous.png', 20, 3800, 5320, 0, '2017-12-22 02:56:28'),
(43, 4, '408', 'Planta Electrica Diesel 120 Kva', 'vistas/img/productos/default/anonymous.png', 20, 3850, 5390, 0, '2017-12-22 02:56:28'),
(44, 5, '501', 'Escalera de Tijera Aluminio ', 'vistas/img/productos/default/anonymous.png', 20, 350, 490, 0, '2017-12-22 02:56:28'),
(45, 5, '502', 'Extension Electrica ', 'vistas/img/productos/default/anonymous.png', 20, 370, 518, 0, '2017-12-22 02:56:28'),
(46, 5, '503', 'Gato tensor', 'vistas/img/productos/default/anonymous.png', 20, 380, 532, 0, '2017-12-22 02:56:28'),
(47, 5, '504', 'Lamina Cubre Brecha ', 'vistas/img/productos/default/anonymous.png', 20, 380, 532, 0, '2017-12-22 02:56:28'),
(48, 5, '505', 'Llave de Tubo', 'vistas/img/productos/default/anonymous.png', 20, 480, 672, 0, '2017-12-22 02:56:28'),
(49, 5, '506', 'Manila por Metro', 'vistas/img/productos/default/anonymous.png', 20, 600, 840, 0, '2017-12-22 02:56:28'),
(50, 5, '507', 'Polea 2 canales', 'vistas/img/productos/default/anonymous.png', 20, 900, 1260, 0, '2017-12-22 02:56:28'),
(51, 5, '508', 'Tensor', 'vistas/img/productos/default/anonymous.png', 20, 100, 140, 0, '2017-12-22 02:56:28'),
(52, 5, '509', 'Bascula ', 'vistas/img/productos/default/anonymous.png', 20, 130, 182, 0, '2017-12-22 02:56:28'),
(53, 5, '510', 'Bomba Hidrostatica', 'vistas/img/productos/default/anonymous.png', 20, 770, 1078, 0, '2017-12-22 02:56:28'),
(54, 5, '511', 'Chapeta', 'vistas/img/productos/default/anonymous.png', 20, 660, 924, 0, '2017-12-22 02:56:28'),
(55, 5, '512', 'Cilindro muestra de concreto', 'vistas/img/productos/default/anonymous.png', 20, 400, 560, 0, '2017-12-22 02:56:28'),
(56, 5, '513', 'Cizalla de Palanca', 'vistas/img/productos/default/anonymous.png', 20, 450, 630, 0, '2017-12-22 02:56:28'),
(57, 5, '514', 'Cizalla de Tijera', 'vistas/img/productos/default/anonymous.png', 20, 580, 812, 0, '2017-12-22 02:56:28'),
(58, 5, '515', 'Coche llanta neumatica', 'vistas/img/productos/default/anonymous.png', 20, 420, 588, 0, '2017-12-22 02:56:28'),
(59, 5, '516', 'Cono slump', 'vistas/img/productos/default/anonymous.png', 20, 140, 196, 0, '2017-12-22 02:56:28'),
(60, 5, '517', 'Cortadora de Baldosin', 'vistas/img/productos/default/anonymous.png', 20, 930, 1302, 0, '2017-12-22 02:56:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `python`
--

CREATE TABLE `python` (
  `id` int(11) NOT NULL,
  `id_tweet` bigint(20) NOT NULL,
  `username` text COLLATE utf8_spanish_ci NOT NULL,
  `id_author` bigint(20) NOT NULL,
  `text` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `python`
--

INSERT INTO `python` (`id`, `id_tweet`, `username`, `id_author`, `text`) VALUES
(0, 1513750000000000000, 'GladisC23705682', 1395450000000000000, 'Gustavo petro presidente, Francia mi vicepresidente est? es mi respuesta https://t.co/EkBIAtPtDH'),
(1, 1513750000000000000, 'santiag13041460', 1484600000000000000, 'RT @cesarbelaez: 10 salarios m?nimos es mi ingreso mensual y si se?ores, votare por Petro, no porque me vaya bien a mi significa que le va?'),
(2, 1513750000000000000, 'samarieth1', 1084910000000000000, 'RT @RobertoMTico: Este DEGENERADO Eduardo Enrique Zapateiro LEGALIZ? las EJECUCIONES EXTRA JUDICIALES. Viol? como el ASESINO @Diego_Molano?'),
(3, 1513750000000000000, 'LarryzEden', 1729765658, 'RT @DrMatFS2: Petro pein? la calva de @JuanPabloCalvas por el trino que hizo un oyente que dec?a \"un ex-guerrilllero no puede ser jefe m?xi?\r'),
(4, 1513750000000000000, 'edusoff', 48190556, 'RT @EnriquePenalosa: Muchos j?venes que apoyan a Petro creen que no tienen nada que perder. Es lo que cre?an muchos j?venes en Venezuela en?'),
(5, 1513750000000000000, 'alvaro8407', 196348178, 'RT @Wilson_Suaza_: Su auto con el que le hace campa?a a Petro es el Maserati MC20, avaluado en m?s de $1.100 millones de pesos.  Se les ac?'),
(6, 1513750000000000000, 'JESUSGAM21', 1304810000000000000, 'RT @GustavoBolivar: C?mo ganar la presidencia el 29 de Mayo en primera vuelta. En este video lo explico. El candidato a vencer no es Duqu?'),
(7, 1513750000000000000, 'Viccas79', 1468190000000000000, 'RT @NanyPardo: ?Me gustaba m?s cuando eras de centro y escrib?as como de centro, no de izquierda.? Esa frase me la dijo hoy un arquitecto.?'),
(8, 1513750000000000000, 'adtorresa', 974374000000000000, '@Davemaster84 @karinin7986 @sergio_fajardo La propuesta del candidato Petro es acertada cuando dice que si les gusta y contin?an en la universidad pueden a futuro ser desarrolladores no solo con lo ense?ado en el colegio.'),
(9, 1513750000000000000, 'pete_felipe', 1034620000000000000, 'RT @_Gelver_: Trabajando desde el comit? program?tico Petro Presidente Pereira, elaborando estrategias para conquistar indecisos y abstenci?');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `usuario` text COLLATE utf8_spanish_ci NOT NULL,
  `password` text COLLATE utf8_spanish_ci NOT NULL,
  `perfil` text COLLATE utf8_spanish_ci NOT NULL,
  `foto` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `ultimo_login` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `password`, `perfil`, `foto`, `estado`, `ultimo_login`, `fecha`) VALUES
(6, 'Orlando1', 'admin', '2amOO2UW9vjEA', 'Administrador', 'vistas/img/usuarios/admin/835.jpg', 1, '2022-12-01 00:24:12', '2021-12-22 00:18:54'),
(10, 'alejandro', 'alejo27', '2aAnwG7BO/.7I', 'Especial', 'vistas/img/usuarios/alejo27/328.jpg', 1, '2022-12-03 19:57:11', '2022-11-29 10:06:56'),
(11, 'maicol', 'maicol', '2aAnwG7BO/.7I', 'Administrador', 'vistas/img/usuarios/maicol/780.jpg', 1, '2022-12-03 12:27:33', '2022-11-29 10:08:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_canciones`
--

CREATE TABLE `usuarios_canciones` (
  `id_usuario` int(11) NOT NULL,
  `id_cancion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `albumes`
--
ALTER TABLE `albumes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `artistas`
--
ALTER TABLE `artistas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `canciones`
--
ALTER TABLE `canciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_generos` (`id_genero`),
  ADD KEY `fk_albumes` (`id_album`);

--
-- Indices de la tabla `canciones_artistas`
--
ALTER TABLE `canciones_artistas`
  ADD KEY `fk_canciones_1` (`id_cancion`),
  ADD KEY `fk_artistas` (`id_artista`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`) USING HASH;

--
-- Indices de la tabla `usuarios_canciones`
--
ALTER TABLE `usuarios_canciones`
  ADD KEY `fk_usuarios` (`id_usuario`) USING BTREE,
  ADD KEY `fk_canciones_2` (`id_cancion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `albumes`
--
ALTER TABLE `albumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `artistas`
--
ALTER TABLE `artistas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `canciones`
--
ALTER TABLE `canciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `canciones`
--
ALTER TABLE `canciones`
  ADD CONSTRAINT `fk_albumes` FOREIGN KEY (`id_album`) REFERENCES `albumes` (`id`),
  ADD CONSTRAINT `fk_generos` FOREIGN KEY (`id_genero`) REFERENCES `generos` (`id`);

--
-- Filtros para la tabla `canciones_artistas`
--
ALTER TABLE `canciones_artistas`
  ADD CONSTRAINT `fk_artistas` FOREIGN KEY (`id_artista`) REFERENCES `artistas` (`id`),
  ADD CONSTRAINT `fk_canciones_1` FOREIGN KEY (`id_cancion`) REFERENCES `canciones` (`id`);

--
-- Filtros para la tabla `usuarios_canciones`
--
ALTER TABLE `usuarios_canciones`
  ADD CONSTRAINT `fk_anios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `fk_canciones` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `fk_canciones_2` FOREIGN KEY (`id_cancion`) REFERENCES `canciones` (`id`),
  ADD CONSTRAINT `fk_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
