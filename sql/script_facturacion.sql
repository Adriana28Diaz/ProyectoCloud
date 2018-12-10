CREATE TABLE cliente (
  cedula varchar(11) NOT NULL,
  apellidos varchar(50) NOT NULL,
  nombres varchar(50) NOT NULL,
  direccion varchar(100) NOT NULL
);

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO cliente (cedula, apellidos, nombres, direccion) VALUES
('1234567890', 'Andrade', 'Luis', 'Ibarra s/n'),
('1234665465', 'TerÃ¡n Lima', 'Anita Juana', 'Bolivar y Sucre'),
('1237894561', 'Cisneros', 'Pablo', 'Teodoro Gomez de la Torre y Bolivar'),
('9876543210', 'Guevara Loza', 'Carlos AndrÃ©s', 'El Olivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_cab`
--

CREATE TABLE factura_cab (
  id_factura_cab serial NOT NULL,
  fecha date NOT NULL,
  cedula varchar(11) NOT NULL,
  estado varchar(1) NOT NULL,
  base_imponible float NOT NULL,
  base_no_imponible float NOT NULL,
  valor_iva float NOT NULL,
  total float NOT NULL
);

--
-- Volcado de datos para la tabla `factura_cab`
--

INSERT INTO factura_cab(id_factura_cab, fecha, cedula, estado, base_imponible, base_no_imponible, valor_iva, total) VALUES
(4, '2015-07-11', '1234567890', 'S', 354.83, 7.2, 42.5796, 404.61),
(5, '2015-07-11', '9876543210', 'S', 354.83, 7.2, 42.5796, 404.61),
(6, '2015-07-12', '1234567890', 'S', 1055.29, 0, 126.635, 1181.92),
(7, '2015-07-12', '1234567890', 'S', 1050.69, 7.2, 126.083, 1183.97),
(8, '2015-07-13', '1234567890', 'S', 354.83, 7.2, 42.5796, 404.61),
(9, '2015-07-13', '1234665465', 'S', 350.23, 0, 42.0276, 392.258),
(10, '2015-07-13', '1234567890', 'S', 14.5, 7.2, 1.74, 23.44),
(11, '2015-07-13', '1234567890', 'S', 350.23, 0, 42.0276, 392.258),
(12, '2015-07-13', '1234567890', 'S', 2101.38, 7.2, 252.17, 2360.75),
(13, '2015-07-14', '1234665465', 'S', 350.23, 7.2, 42.03, 399.46),
(14, '2015-07-14', '1234567890', 'S', 354.83, 0, 42.58, 397.41),
(15, '2015-07-14', '1234567890', 'S', 0, 93.6, 0, 93.6),
(16, '2015-07-14', '1234567890', 'S', 0, 50.4, 0, 50.4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_det`
--

CREATE TABLE factura_det(
id_factura_det serial NOT NULL,
  id_factura_cab serial,
  id_producto  serial,
  precio NUMERIC (7,2) NOT NULL,
  cantidad numeric(11) NOT NULL,
  porcentaje_iva NUMERIC(7,2) NOT NULL,
  subtotal NUMERIC (7,2) not NULL
);

--
-- Volcado de datos para la tabla `factura_det`
--

INSERT INTO factura_det (id_factura_det, id_factura_cab, id_producto, precio, cantidad, porcentaje_iva, subtotal) VALUES
(1, 4, 3, 350.23, 1, 12, 350.23),
(2, 4, 1, 7.2, 1, 0, 7.2),
(3, 4, 2, 4.6, 1, 12, 4.6),
(4, 5, 3, 350.23, 1, 12, 350.23),
(5, 5, 1, 7.2, 1, 0, 7.2),
(6, 5, 2, 4.6, 1, 12, 4.6),
(7, 6, 3, 350.23, 3, 12, 1050.69),
(8, 6, 2, 4.6, 1, 12, 4.6),
(9, 7, 3, 350.23, 3, 12, 1050.69),
(10, 7, 1, 7.2, 1, 0, 7.2),
(11, 8, 3, 350.23, 1, 12, 350.23),
(12, 8, 1, 7.2, 1, 0, 7.2),
(13, 8, 2, 4.6, 1, 12, 4.6),
(14, 9, 3, 350.23, 1, 12, 350.23),
(15, 10, 1, 7.2, 1, 0, 7.2),
(16, 10, 4, 14.5, 1, 12, 14.5),
(17, 11, 3, 350.23, 1, 12, 350.23),
(18, 12, 3, 350.23, 1, 12, 350.23),
(19, 12, 3, 350.23, 1, 12, 350.23),
(20, 12, 3, 350.23, 1, 12, 350.23),
(21, 12, 3, 350.23, 1, 12, 350.23),
(22, 12, 3, 350.23, 1, 12, 350.23),
(23, 12, 3, 350.23, 1, 12, 350.23),
(24, 12, 1, 7.2, 1, 0, 7.2),
(25, 13, 3, 350.23, 1, 12, 350.23),
(26, 13, 1, 7.2, 1, 0, 7.2),
(27, 14, 3, 350.23, 1, 12, 350.23),
(28, 14, 2, 4.6, 1, 12, 4.6),
(29, 15, 1, 7.2, 13, 0, 93.6),
(30, 16, 1, 7.2, 7, 0, 50.4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE producto (
id_producto serial NOT NULL,
  nombre varchar(100) NOT NULL,
  precio numeric(7,2) NOT NULL,
  porcentaje_iva NUMERIC(2) NOT NULL
)

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO producto (id_producto, nombre, precio, porcentaje_iva) VALUES
(1, 'mesa de computador', 7.2, 0),
(2, 'mouse USB', 4.6, 12),
(3, 'impresora laser', 350.23, 12),
(4, 'teclado color negro', 14.5, 12);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE cliente
 ADD PRIMARY KEY (cedula);

--
-- Indices de la tabla `factura_cab`
--
ALTER TABLE factura_cab
 ADD PRIMARY KEY (id_factura_cab), ADD CONSTRAINT cliente_fk FOREIGN KEY (cedula) REFERENCES cliente (cedula);
 
ALTER TABLE producto
ADD PRIMARY KEY (id_producto);




--
-- Indices de la tabla `factura_det`
--falta esto
ALTER TABLE factura_det
 ADD PRIMARY KEY (id_factura_det),
 ADD CONSTRAINT facturacab_fk FOREIGN KEY (id_factura_cab) REFERENCES factura_cab (id_factura_cab),
ADD CONSTRAINT producto_fk FOREIGN KEY (id_producto) REFERENCES producto (id_producto);

