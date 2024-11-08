-- 0 a 20

-- Consulta 1
SELECT codigo_oficina, ciudad FROM oficina;

-- +----------------+----------------------+
-- | codigo_oficina | ciudad               |
-- +----------------+----------------------+
-- | BCN-ES         | Barcelona            |
-- | BOS-USA        | Boston               |
-- | LON-UK         | Londres              |
-- | MAD-ES         | Madrid               |
-- | PAR-FR         | Paris                |
-- | SFC-USA        | San Francisco        |
-- | SYD-AU         | Sydney               |
-- | TAL-ES         | Talavera de la Reina |
-- | TOK-JP         | Tokyo                |
-- +----------------+----------------------+

-- Consulta 2

SELECT telefono, ciudad FROM oficina WHERE pais LIKE 'esp%';

-- +----------------+----------------------+
-- | telefono       | ciudad               |
-- +----------------+----------------------+
-- | +34 93 3561182 | Barcelona            |
-- | +34 91 7514487 | Madrid               |
-- | +34 925 867231 | Talavera de la Reina |
-- +----------------+----------------------+

-- Consulta 3

SELECT nombre, apellido1, apellido2, email FROM empleado WHERE codigo_jefe = 7;

-- +---------+-----------+-----------+--------------------------+
-- | nombre  | apellido1 | apellido2 | email                    |
-- +---------+-----------+-----------+--------------------------+
-- | Mariano | L?pez     | Murcia    | mlopez@jardineria.es     |
-- | Lucio   | Campoamor | Mart?n    | lcampoamor@jardineria.es |
-- | Hilario | Rodriguez | Huertas   | hrodriguez@jardineria.es |
-- +---------+-----------+-----------+--------------------------+

-- Consulta 4

SELECT puesto, nombre, apellido1, apellido2, email FROM empleado WHERE puesto = "Director General";

-- +------------------+--------+-----------+-----------+----------------------+
-- | puesto           | nombre | apellido1 | apellido2 | email                |
-- +------------------+--------+-----------+-----------+----------------------+
-- | Director General | Marcos | Maga?a    | Perez     | marcos@jardineria.es |
-- +------------------+--------+-----------+-----------+----------------------+

-- Consulta 5

SELECT puesto, nombre, apellido1, apellido2 FROM empleado WHERE puesto != "Representante Ventas";

-- +-----------------------+----------+------------+-----------+
-- | puesto                | nombre   | apellido1  | apellido2 |
-- +-----------------------+----------+------------+-----------+
-- | Director General      | Marcos   | Maga?a     | Perez     |
-- | Subdirector Marketing | Ruben    | L?pez      | Martinez  |
-- | Subdirector Ventas    | Alberto  | Soria      | Carrasco  |
-- | Secretaria            | Maria    | Sol?s      | Jerez     |
-- | Director Oficina      | Carlos   | Soria      | Jimenez   |
-- | Director Oficina      | Emmanuel | Maga?a     | Perez     |
-- | Director Oficina      | Francois | Fignon     |           |
-- | Director Oficina      | Michael  | Bolton     |           |
-- | Director Oficina      | Hilary   | Washington |           |
-- | Director Oficina      | Nei      | Nishikori  |           |
-- | Director Oficina      | Amy      | Johnson    |           |
-- | Director Oficina      | Kevin    | Fallmer    |           |
-- +-----------------------+----------+------------+-----------+

-- Consulta 6

SELECT nombre_cliente from cliente WHERE pais = 'Spain';

-- +--------------------------------+
-- | nombre_cliente                 |
-- +--------------------------------+
-- | Lasas S.A.                     |
-- | Beragua                        |
-- | Club Golf Puerta del hierro    |
-- | Naturagua                      |
-- | DaraDistribuciones             |
-- | Madrile?a de riegos            |
-- | Lasas S.A.                     |
-- | Camunas Jardines S.L.          |
-- | Dardena S.A.                   |
-- | Jardin de Flores               |
-- | Flores Marivi                  |
-- | Flowers, S.A                   |
-- | Naturajardin                   |
-- | Golf S.A.                      |
-- | Americh Golf Management SL     |
-- | Aloha                          |
-- | El Prat                        |
-- | Sotogrande                     |
-- | Vivero Humanes                 |
-- | Fuenla City                    |
-- | Jardines y Mansiones Cactus SL |
-- | Jardiner?as Mat?as SL          |
-- | Agrojardin                     |
-- | Top Campo                      |
-- | Jardineria Sara                |
-- | Campohermoso                   |
-- | Flores S.L.                    |
-- +--------------------------------+

-- Consulta 7

SELECT DISTINCT estado FROM pedido;

-- +-----------+
-- | estado    |
-- +-----------+
-- | Entregado |
-- | Rechazado |
-- | Pendiente |
-- +-----------+

-- Consulta 8

SELECT p.codigo_cliente, c.nombre_cliente, p.fecha_pago FROM pago p INNER JOIN cliente c ON c.codigo_cliente = p.codigo_cliente GROUP BY p.codigo_cliente HAVING YEAR(fecha_pago) = 2008;

-- +----------------+--------------------------------+------------+
-- | codigo_cliente | nombre_cliente                 | fecha_pago |
-- +----------------+--------------------------------+------------+
-- |              1 | GoldFish Garden                | 2008-11-10 |
-- |             13 | Camunas Jardines S.L.          | 2008-08-04 |
-- |             14 | Dardena S.A.                   | 2008-07-15 |
-- |             26 | Jardines y Mansiones Cactus SL | 2008-03-18 |
-- +----------------+--------------------------------+------------+

SELECT p.codigo_cliente, c.nombre_cliente, p.fecha_pago FROM pago p INNER JOIN cliente c ON c.codigo_cliente = p.codigo_cliente GROUP BY p.codigo_cliente HAVING Date_format(fecha_pago, '%Y') = '2008';

-- +----------------+--------------------------------+------------+
-- | codigo_cliente | nombre_cliente                 | fecha_pago |
-- +----------------+--------------------------------+------------+
-- |              1 | GoldFish Garden                | 2008-11-10 |
-- |             13 | Camunas Jardines S.L.          | 2008-08-04 |
-- |             14 | Dardena S.A.                   | 2008-07-15 |
-- |             26 | Jardines y Mansiones Cactus SL | 2008-03-18 |
-- +----------------+--------------------------------+------------+

SELECT p.codigo_cliente, c.nombre_cliente, p.fecha_pago FROM pago p INNER JOIN cliente c ON c.codigo_cliente = p.codigo_cliente GROUP BY p.codigo_cliente HAVING fecha_pago LIKE '2008-%%-%%';

-- +----------------+--------------------------------+------------+
-- | codigo_cliente | nombre_cliente                 | fecha_pago |
-- +----------------+--------------------------------+------------+
-- |              1 | GoldFish Garden                | 2008-11-10 |
-- |             13 | Camunas Jardines S.L.          | 2008-08-04 |
-- |             14 | Dardena S.A.                   | 2008-07-15 |
-- |             26 | Jardines y Mansiones Cactus SL | 2008-03-18 |
-- +----------------+--------------------------------+------------+

--Consulta 9
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido WHERE estado = "Pendiente" and fecha_entrega IS NOT NULL;

-- +---------------+----------------+----------------+---------------+
-- | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
-- +---------------+----------------+----------------+---------------+
-- |            39 |             19 | 2009-03-07     | 2009-03-09    |
-- |            43 |             23 | 2009-03-26     | 2009-03-28    |
-- |            44 |             23 | 2009-03-27     | 2009-03-30    |
-- |           103 |             30 | 2009-01-20     | 2009-01-24    |
-- |           106 |             30 | 2009-05-15     | 2009-05-20    |
-- |           112 |             36 | 2009-04-06     | 2009-05-07    |
-- |           115 |             36 | 2009-01-26     | 2009-02-27    |
-- |           123 |             30 | 2009-01-20     | 2009-01-24    |
-- |           126 |             30 | 2009-05-15     | 2009-05-20    |
-- +---------------+----------------+----------------+---------------+

--Consulta 10

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido WHERE fecha_esperada >= DATE_ADD(fecha_entrega, INTERVAL 2 DAY);

-- +---------------+----------------+----------------+---------------+
-- | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
-- +---------------+----------------+----------------+---------------+
-- |             2 |              5 | 2007-10-28     | 2007-10-26    |
-- |            24 |             14 | 2008-07-31     | 2008-07-25    |
-- |            30 |             13 | 2008-09-03     | 2008-08-31    |
-- |            36 |             14 | 2008-12-15     | 2008-12-10    |
-- |            53 |             13 | 2008-11-15     | 2008-11-09    |
-- |            89 |             35 | 2007-12-13     | 2007-12-10    |
-- |            91 |             27 | 2009-03-29     | 2009-03-27    |
-- |            93 |             27 | 2009-05-30     | 2009-05-17    |
-- +---------------+----------------+----------------+---------------+

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido WHERE DATEDIFF(fecha_esperada, fecha_entrega) = 2;
-- +---------------+----------------+----------------+---------------+
-- | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
-- +---------------+----------------+----------------+---------------+
-- |             2 |              5 | 2007-10-28     | 2007-10-26    |
-- |            91 |             27 | 2009-03-29     | 2009-03-27    |
-- +---------------+----------------+----------------+---------------+

--Consulta 11

SELECT codigo_pedido FROM pedido WHERE estado = 'Rechazado' and YEAR(fecha_entrega) = '2009';

-- +---------------+
-- | codigo_pedido |
-- +---------------+
-- |            21 |
-- |            40 |
-- |            46 |
-- |           113 |
-- +---------------+

--Consulta 12

SELECT codigo_pedido FROM pedido WHERE estado = 'Entregado' and MONTH(fecha_entrega) = 1;

-- +---------------+
-- | codigo_pedido |
-- +---------------+
-- |             1 |
-- |            13 |
-- |            15 |
-- |            16 |
-- |            17 |
-- |            18 |
-- |            22 |
-- |            32 |
-- |            55 |
-- |            58 |
-- |            64 |
-- |            75 |
-- |            79 |
-- |            82 |
-- |            95 |
-- |           100 |
-- |           102 |
-- |           114 |
-- |           119 |
-- |           121 |
-- +---------------+

--Consulta 13

SELECT id_transaccion FROM pago WHERE forma_pago = 'Paypal' and YEAR(fecha_pago) = '2008' ORDER BY id_transaccion DESC;
-- +----------------+
-- | id_transaccion |
-- +----------------+
-- | ak-std-000020  |
-- | ak-std-000015  |
-- | ak-std-000014  |
-- | ak-std-000002  |
-- | ak-std-000001  |
-- +----------------+

--Consulta 14
SELECT DISTINCT forma_pago FROM pago;
-- +---------------+
-- | forma_pago    |
-- +---------------+
-- | PayPal        |
-- | Transferencia |
-- | Cheque        |
-- +---------------+

--Consulta 15
SELECT codigo_producto, nombre FROM producto WHERE gama = 'Ornamentales' AND cantidad_en_stock >= 100 ORDER BY precio_venta DESC;

-- +-----------------+-------------------------------------------------------------+
-- | codigo_producto | nombre                                                      |
-- +-----------------+-------------------------------------------------------------+
-- | OR-215          | Brahea Armata                                               |
-- | OR-222          | Butia Capitata                                              |
-- | OR-217          | Brahea Edulis                                               |
-- | OR-227          | Chamaerops Humilis                                          |
-- | OR-221          | Butia Capitata                                              |
-- | OR-236          | Jubaea Chilensis                                            |
-- | OR-230          | Cordyline Australis -DRACAENA                               |
-- | OR-134          | Nerium Oleander Arbusto GRANDE                              |
-- | OR-226          | Chamaerops Humilis                                          |
-- | OR-220          | Butia Capitata                                              |
-- | OR-232          | Cycas Revoluta                                              |
-- | OR-228          | Chamaerops Humilis "Cerifera"                               |
-- | OR-219          | Butia Capitata                                              |
-- | OR-218          | Butia Capitata                                              |
-- | OR-229          | Chrysalidocarpus Lutescens -ARECA                           |
-- | OR-216          | Brahea Edulis                                               |
-- | OR-136          | Nerium oleander ARBOL Calibre 8/10                          |
-- | OR-149          | Bougamvillea Sanderiana Espaldera                           |
-- | OR-231          | Cycas Revoluta                                              |
-- | OR-99           | Mimosa DEALBATA Gaulois Astier                              |
-- | OR-144          | Wisteria Sinensis INJERTADAS DEC?"                          |
-- | OR-100          | Mimosa Injerto CLASICA Dealbata                             |
-- | OR-225          | Chamaerops Humilis                                          |
-- | OR-103          | Mimosa Semilla Bayleyana                                    |
-- | OR-104          | Mimosa Semilla Cyanophylla                                  |
-- | OR-106          | Mimosa Semilla Longifolia                                   |
-- | OR-156          | Acer platanoides                                            |
-- | OR-157          | Acer Pseudoplatanus                                         |
-- | OR-160          | Brachychiton Rupestris                                      |
-- | OR-162          | Cassia Corimbosa                                            |
-- | OR-143          | Wisteria Sinensis  azul, rosa, blanca                       |
-- | OR-148          | Bougamvillea Sanderiana Espaldera                           |
-- | OR-147          | Bougamvillea Sanderiana Tutor                               |
-- | OR-118          | Hibiscus Syriacus "Pink Giant" Rosa                         |
-- | OR-224          | Chamaerops Humilis                                          |
-- | OR-116          | Hibiscus Syriacus  "Diana" -Blanco Puro                     |
-- | OR-115          | Forsytia Intermedia "Lynwood"                               |
-- | OR-117          | Hibiscus Syriacus  "Helene" -Blanco-C.rojo                  |
-- | OR-153          | Expositor ?rboles clima mediterr?neo                        |
-- | OR-155          | Acer Negundo                                                |
-- | OR-152          | Expositor ?rboles clima continental                         |
-- | OR-158          | Brachychiton Acerifolius                                    |
-- | OR-159          | Brachychiton Discolor                                       |
-- | OR-161          | Cassia Corimbosa                                            |
-- | OR-101          | Expositor Mimosa Semilla Mix                                |
-- | OR-151          | Bougamvillea Sanderiana, 3 tut. piramide                    |
-- | OR-102          | Mimosa Semilla Bayleyana                                    |
-- | OR-105          | Mimosa Semilla Espectabilis                                 |
-- | OR-107          | Mimosa Semilla Floribunda 4 estaciones                      |
-- | OR-154          | Expositor ?rboles borde del mar                             |
-- | OR-111          | Corylus Avellana "Contorta"                                 |
-- | OR-108          | Abelia Floribunda                                           |
-- | OR-112          | Escallonia (Mix)                                            |
-- | OR-113          | Evonimus Emerald Gayeti                                     |
-- | OR-109          | Callistemom (Mix)                                           |
-- | OR-119          | Laurus Nobilis Arbusto - Ramificado Bajo                    |
-- | OR-120          | Lonicera Nitida                                             |
-- | OR-121          | Lonicera Nitida "Maigrum"                                   |
-- | OR-122          | Lonicera Pileata                                            |
-- | OR-114          | Evonimus Pulchellus                                         |
-- | OR-135          | Nerium oleander COPA  Calibre 6/8                           |
-- | OR-126          | Weigelia "Bristol Ruby"                                     |
-- | OR-125          | Viburnum Tinus "Eve Price"                                  |
-- | OR-123          | Philadelphus "Virginal"                                     |
-- | OR-124          | Prunus pisardii                                             |
-- | OR-138          | Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |
-- | OR-141          | Pitimini rojo                                               |
-- | OR-223          | Chamaerops Humilis                                          |
-- | OR-137          | ROSAL TREPADOR                                              |
-- | OR-140          | Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |
-- | OR-139          | Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |
-- | OR-146          | Bougamvillea Sanderiana Tutor                               |
-- | OR-142          | Solanum Jazminoide                                          |
-- | OR-145          | Bougamvillea Sanderiana Tutor                               |
-- | OR-150          | Bougamvillea roja, naranja                                  |
-- | OR-110          | Callistemom (Mix)                                           |
-- +-----------------+-------------------------------------------------------------+

--Consulta 16
SELECT nombre_cliente FROM cliente WHERE ciudad = 'Madrid' AND codigo_empleado_rep_ventas = '11' OR '30';
-- +--------------------------------+
-- | nombre_cliente                 |
-- +--------------------------------+
-- | GoldFish Garden                |
-- | Gardening Associates           |
-- | Gerudo Valley                  |
-- | Tendo Garden                   |
-- | Lasas S.A.                     |
-- | Beragua                        |
-- | Club Golf Puerta del hierro    |
-- | Naturagua                      |
-- | DaraDistribuciones             |
-- | Madrile?a de riegos            |
-- | Lasas S.A.                     |
-- | Camunas Jardines S.L.          |
-- | Dardena S.A.                   |
-- | Jardin de Flores               |
-- | Flores Marivi                  |
-- | Flowers, S.A                   |
-- | Naturajardin                   |
-- | Golf S.A.                      |
-- | Americh Golf Management SL     |
-- | Aloha                          |
-- | El Prat                        |
-- | Sotogrande                     |
-- | Vivero Humanes                 |
-- | Fuenla City                    |
-- | Jardines y Mansiones Cactus SL |
-- | Jardiner?as Mat?as SL          |
-- | Agrojardin                     |
-- | Top Campo                      |
-- | Jardineria Sara                |
-- | Campohermoso                   |
-- | france telecom                 |
-- | Mus?e du Louvre                |
-- | Tutifruti S.A                  |
-- | Flores S.L.                    |
-- | The Magic Garden               |
-- | El Jardin Viviente S.L         |
-- +--------------------------------+

--Consulta 17
SELECT c.nombre_cliente, e.nombre, e.apellido1, e.apellido2, e.puesto FROM cliente C INNER JOIN empleado e ON e.codigo_empleado = c.codigo_empleado_rep_ventas GROUP BY c.nombre_cliente HAVING e.puesto = 'Representante Ventas';

-- +--------------------------------+-----------------+------------+-----------+----------------------+
-- | nombre_cliente                 | nombre          | apellido1  | apellido2 | puesto               |
-- +--------------------------------+-----------------+------------+-----------+----------------------+
-- | Agrojardin                     | Julian          | Bellinelli |           | Representante Ventas |
-- | Aloha                          | Jos? Manuel     | Martinez   | De la Osa | Representante Ventas |
-- | Americh Golf Management SL     | Jos? Manuel     | Martinez   | De la Osa | Representante Ventas |
-- | Campohermoso                   | Julian          | Bellinelli |           | Representante Ventas |
-- | Camunas Jardines S.L.          | Mariano         | L?pez      | Murcia    | Representante Ventas |
-- | Dardena S.A.                   | Mariano         | L?pez      | Murcia    | Representante Ventas |
-- | El Jardin Viviente S.L         | Mariko          | Kishi      |           | Representante Ventas |
-- | El Prat                        | Jos? Manuel     | Martinez   | De la Osa | Representante Ventas |
-- | Flores Marivi                  | Felipe          | Rosas      | Marquez   | Representante Ventas |
-- | Flowers, S.A                   | Felipe          | Rosas      | Marquez   | Representante Ventas |
-- | france telecom                 | Lionel          | Narvaez    |           | Representante Ventas |
-- | Fuenla City                    | Felipe          | Rosas      | Marquez   | Representante Ventas |
-- | Gardening Associates           | Walter Santiago | Sanchez    | Lopez     | Representante Ventas |
-- | Gerudo Valley                  | Lorena          | Paxton     |           | Representante Ventas |
-- | GoldFish Garden                | Walter Santiago | Sanchez    | Lopez     | Representante Ventas |
-- | Golf S.A.                      | Jos? Manuel     | Martinez   | De la Osa | Representante Ventas |
-- | Jardin de Flores               | Julian          | Bellinelli |           | Representante Ventas |
-- | Jardiner?as Mat?as SL          | Lucio           | Campoamor  | Mart?n    | Representante Ventas |
-- | Jardineria Sara                | Felipe          | Rosas      | Marquez   | Representante Ventas |
-- | Jardines y Mansiones Cactus SL | Lucio           | Campoamor  | Mart?n    | Representante Ventas |
-- | Lasas S.A.                     | Mariano         | L?pez      | Murcia    | Representante Ventas |
-- | Mus?e du Louvre                | Lionel          | Narvaez    |           | Representante Ventas |
-- | Naturajardin                   | Julian          | Bellinelli |           | Representante Ventas |
-- | Sotogrande                     | Jos? Manuel     | Martinez   | De la Osa | Representante Ventas |
-- | Tendo Garden                   | Lorena          | Paxton     |           | Representante Ventas |
-- | Top Campo                      | Felipe          | Rosas      | Marquez   | Representante Ventas |
-- | Tutifruti S.A                  | Mariko          | Kishi      |           | Representante Ventas |
-- | Vivero Humanes                 | Julian          | Bellinelli |           | Representante Ventas |
-- +--------------------------------+-----------------+------------+-----------+----------------------+

--Consulta 18

SELECT c.nombre_cliente, c.codigo_cliente, e.nombre as 'nombre representante' FROM cliente c INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado HAVING c.codigo_cliente IN (SELECT codigo_cliente FROM pago);

-- +--------------------------------+----------------+----------------------+
-- | nombre_cliente                 | codigo_cliente | nombre representante |
-- +--------------------------------+----------------+----------------------+
-- | GoldFish Garden                |              1 | Walter Santiago      |
-- | Gardening Associates           |              3 | Walter Santiago      |
-- | Gerudo Valley                  |              4 | Lorena               |
-- | Tendo Garden                   |              5 | Lorena               |
-- | Beragua                        |              7 | Emmanuel             |
-- | Naturagua                      |              9 | Emmanuel             |
-- | Camunas Jardines S.L.          |             13 | Mariano              |
-- | Dardena S.A.                   |             14 | Mariano              |
-- | Jardin de Flores               |             15 | Julian               |
-- | Flores Marivi                  |             16 | Felipe               |
-- | Golf S.A.                      |             19 | Jos? Manuel          |
-- | Sotogrande                     |             23 | Jos? Manuel          |
-- | Jardines y Mansiones Cactus SL |             26 | Lucio                |
-- | Jardiner?as Mat?as SL          |             27 | Lucio                |
-- | Agrojardin                     |             28 | Julian               |
-- | Jardineria Sara                |             30 | Felipe               |
-- | Tutifruti S.A                  |             35 | Mariko               |
-- | El Jardin Viviente S.L         |             38 | Mariko               |
-- +--------------------------------+----------------+----------------------+

--Consulta 19

SELECT c.nombre_cliente, c.codigo_cliente, e.nombre as 'nombre representante' FROM cliente c INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado HAVING c.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago);

-- +-----------------------------+----------------+----------------------+
-- | nombre_cliente              | codigo_cliente | nombre representante |
-- +-----------------------------+----------------+----------------------+
-- | Lasas S.A.                  |              6 | Mariano              |
-- | Club Golf Puerta del hierro |              8 | Emmanuel             |
-- | DaraDistribuciones          |             10 | Emmanuel             |
-- | Madrile?a de riegos         |             11 | Emmanuel             |
-- | Lasas S.A.                  |             12 | Mariano              |
-- | Flowers, S.A                |             17 | Felipe               |
-- | Naturajardin                |             18 | Julian               |
-- | Americh Golf Management SL  |             20 | Jos? Manuel          |
-- | Aloha                       |             21 | Jos? Manuel          |
-- | El Prat                     |             22 | Jos? Manuel          |
-- | Vivero Humanes              |             24 | Julian               |
-- | Fuenla City                 |             25 | Felipe               |
-- | Top Campo                   |             29 | Felipe               |
-- | Campohermoso                |             31 | Julian               |
-- | france telecom              |             32 | Lionel               |
-- | Mus?e du Louvre             |             33 | Lionel               |
-- | Flores S.L.                 |             36 | Michael              |
-- | The Magic Garden            |             37 | Michael              |
-- +-----------------------------+----------------+----------------------+

--Consulta 20

SELECT c.nombre_cliente, c.codigo_cliente, e.nombre as 'nombre representante', o.ciudad, e.codigo_oficina FROM cliente c INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado INNER JOIN oficina o ON o.codigo_oficina = e.codigo_oficina HAVING c.codigo_cliente IN (SELECT codigo_cliente FROM pago) ORDER BY codigo_cliente;

-- +--------------------------------+----------------+----------------------+----------------------+----------------+
-- | nombre_cliente                 | codigo_cliente | nombre representante | ciudad               | codigo_oficina |
-- +--------------------------------+----------------+----------------------+----------------------+----------------+
-- | GoldFish Garden                |              1 | Walter Santiago      | San Francisco        | SFC-USA        |
-- | Gardening Associates           |              3 | Walter Santiago      | San Francisco        | SFC-USA        |
-- | Gerudo Valley                  |              4 | Lorena               | Boston               | BOS-USA        |
-- | Tendo Garden                   |              5 | Lorena               | Boston               | BOS-USA        |
-- | Beragua                        |              7 | Emmanuel             | Barcelona            | BCN-ES         |
-- | Naturagua                      |              9 | Emmanuel             | Barcelona            | BCN-ES         |
-- | Camunas Jardines S.L.          |             13 | Mariano              | Madrid               | MAD-ES         |
-- | Dardena S.A.                   |             14 | Mariano              | Madrid               | MAD-ES         |
-- | Jardin de Flores               |             15 | Julian               | Sydney               | SYD-AU         |
-- | Flores Marivi                  |             16 | Felipe               | Talavera de la Reina | TAL-ES         |
-- | Golf S.A.                      |             19 | Jos? Manuel          | Barcelona            | BCN-ES         |
-- | Sotogrande                     |             23 | Jos? Manuel          | Barcelona            | BCN-ES         |
-- | Jardines y Mansiones Cactus SL |             26 | Lucio                | Madrid               | MAD-ES         |
-- | Jardiner?as Mat?as SL          |             27 | Lucio                | Madrid               | MAD-ES         |
-- | Agrojardin                     |             28 | Julian               | Sydney               | SYD-AU         |
-- | Jardineria Sara                |             30 | Felipe               | Talavera de la Reina | TAL-ES         |
-- | Tutifruti S.A                  |             35 | Mariko               | Sydney               | SYD-AU         |
-- | El Jardin Viviente S.L         |             38 | Mariko               | Sydney               | SYD-AU         |
-- +--------------------------------+----------------+----------------------+----------------------+----------------+

-- 20 a 40

--Consulta 21
SELECT c.nombre_cliente, c.codigo_cliente, e.nombre as 'nombre representante', o.ciudad, e.codigo_oficina FROM cliente c INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado INNER JOIN oficina o ON o.codigo_oficina = e.codigo_oficina HAVING c.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago) ORDER BY codigo_cliente ASC;

-- +-----------------------------+----------------+----------------------+----------------------+----------------+
-- | nombre_cliente              | codigo_cliente | nombre representante | ciudad               | codigo_oficina |
-- +-----------------------------+----------------+----------------------+----------------------+----------------+
-- | Lasas S.A.                  |              6 | Mariano              | Madrid               | MAD-ES         |
-- | Club Golf Puerta del hierro |              8 | Emmanuel             | Barcelona            | BCN-ES         |
-- | DaraDistribuciones          |             10 | Emmanuel             | Barcelona            | BCN-ES         |
-- | Madrile?a de riegos         |             11 | Emmanuel             | Barcelona            | BCN-ES         |
-- | Lasas S.A.                  |             12 | Mariano              | Madrid               | MAD-ES         |
-- | Flowers, S.A                |             17 | Felipe               | Talavera de la Reina | TAL-ES         |
-- | Naturajardin                |             18 | Julian               | Sydney               | SYD-AU         |
-- | Americh Golf Management SL  |             20 | Jos? Manuel          | Barcelona            | BCN-ES         |
-- | Aloha                       |             21 | Jos? Manuel          | Barcelona            | BCN-ES         |
-- | El Prat                     |             22 | Jos? Manuel          | Barcelona            | BCN-ES         |
-- | Vivero Humanes              |             24 | Julian               | Sydney               | SYD-AU         |
-- | Fuenla City                 |             25 | Felipe               | Talavera de la Reina | TAL-ES         |
-- | Top Campo                   |             29 | Felipe               | Talavera de la Reina | TAL-ES         |
-- | Campohermoso                |             31 | Julian               | Sydney               | SYD-AU         |
-- | france telecom              |             32 | Lionel               | Paris                | PAR-FR         |
-- | Mus?e du Louvre             |             33 | Lionel               | Paris                | PAR-FR         |
-- | Flores S.L.                 |             36 | Michael              | San Francisco        | SFC-USA        |
-- | The Magic Garden            |             37 | Michael              | San Francisco        | SFC-USA        |
-- +-----------------------------+----------------+----------------------+----------------------+----------------+

--Consulta 22

select e.codigo_empleado, CONCAT(o.linea_direccion1, o.linea_direccion2) as "direccion", o.ciudad as "Ciudad de la oficina" FROM oficina o INNER JOIN empleado e ON o.codigo_oficina = e.codigo_oficina HAVING e.codigo_empleado IN (SELECT codigo_empleado_rep_ventas FROM cliente WHERE ciudad LIKE "Fuen%");

-- +-----------------+-----------------------------------------+----------------------+
-- | codigo_empleado | direccion                               | Ciudad de la oficina |
-- +-----------------+-----------------------------------------+----------------------+
-- |               8 | Bulevar Indalecio Prieto, 32            | Madrid               |
-- |              30 | 5-11 Wentworth AvenueFloor #2           | Sydney               |
-- |               5 | Francisco Aguirre, 325? piso (exterior) | Talavera de la Reina |
-- +-----------------+-----------------------------------------+----------------------+

--Consulta 23

SELECT c.nombre_cliente, e.nombre as 'nombre representante', o.ciudad, e.codigo_oficina FROM cliente c INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado INNER JOIN oficina o ON o.codigo_oficina = e.codigo_oficina;

-- +--------------------------------+----------------------+----------------------+----------------+
-- | nombre_cliente                 | nombre representante | ciudad               | codigo_oficina |
-- +--------------------------------+----------------------+----------------------+----------------+
-- | Beragua                        | Emmanuel             | Barcelona            | BCN-ES         |
-- | Club Golf Puerta del hierro    | Emmanuel             | Barcelona            | BCN-ES         |
-- | Naturagua                      | Emmanuel             | Barcelona            | BCN-ES         |
-- | DaraDistribuciones             | Emmanuel             | Barcelona            | BCN-ES         |
-- | Madrile?a de riegos            | Emmanuel             | Barcelona            | BCN-ES         |
-- | Golf S.A.                      | Jos? Manuel          | Barcelona            | BCN-ES         |
-- | Americh Golf Management SL     | Jos? Manuel          | Barcelona            | BCN-ES         |
-- | Aloha                          | Jos? Manuel          | Barcelona            | BCN-ES         |
-- | El Prat                        | Jos? Manuel          | Barcelona            | BCN-ES         |
-- | Sotogrande                     | Jos? Manuel          | Barcelona            | BCN-ES         |
-- | Gerudo Valley                  | Lorena               | Boston               | BOS-USA        |
-- | Tendo Garden                   | Lorena               | Boston               | BOS-USA        |
-- | Lasas S.A.                     | Mariano              | Madrid               | MAD-ES         |
-- | Lasas S.A.                     | Mariano              | Madrid               | MAD-ES         |
-- | Camunas Jardines S.L.          | Mariano              | Madrid               | MAD-ES         |
-- | Dardena S.A.                   | Mariano              | Madrid               | MAD-ES         |
-- | Jardines y Mansiones Cactus SL | Lucio                | Madrid               | MAD-ES         |
-- | Jardiner?as Mat?as SL          | Lucio                | Madrid               | MAD-ES         |
-- | france telecom                 | Lionel               | Paris                | PAR-FR         |
-- | Mus?e du Louvre                | Lionel               | Paris                | PAR-FR         |
-- | Flores S.L.                    | Michael              | San Francisco        | SFC-USA        |
-- | The Magic Garden               | Michael              | San Francisco        | SFC-USA        |
-- | GoldFish Garden                | Walter Santiago      | San Francisco        | SFC-USA        |
-- | Gardening Associates           | Walter Santiago      | San Francisco        | SFC-USA        |
-- | Jardin de Flores               | Julian               | Sydney               | SYD-AU         |
-- | Naturajardin                   | Julian               | Sydney               | SYD-AU         |
-- | Vivero Humanes                 | Julian               | Sydney               | SYD-AU         |
-- | Agrojardin                     | Julian               | Sydney               | SYD-AU         |
-- | Campohermoso                   | Julian               | Sydney               | SYD-AU         |
-- | Tutifruti S.A                  | Mariko               | Sydney               | SYD-AU         |
-- | El Jardin Viviente S.L         | Mariko               | Sydney               | SYD-AU         |
-- | Flores Marivi                  | Felipe               | Talavera de la Reina | TAL-ES         |
-- | Flowers, S.A                   | Felipe               | Talavera de la Reina | TAL-ES         |
-- | Fuenla City                    | Felipe               | Talavera de la Reina | TAL-ES         |
-- | Top Campo                      | Felipe               | Talavera de la Reina | TAL-ES         |
-- | Jardineria Sara                | Felipe               | Talavera de la Reina | TAL-ES         |
-- +--------------------------------+----------------------+----------------------+----------------+

-- Consulta 24

SELECT e.nombre as "nombre empleado", j.nombre as "nombre jefe", e.codigo_empleado, j.codigo_empleado as "codigo jefe" FROM empleado e INNER JOIN empleado j ON e.codigo_jefe = j.codigo_empleado;

-- Consulta 25

SELECT c.nombre_cliente, p.estado, p.fecha_entrega FROM cliente c INNER JOIN pedido p ON c.codigo_cliente = p.codigo_cliente HAVING p.estado = "Pendiente" AND p.fecha_entrega IS NOT NULL;

-- +-----------------+-----------+---------------+
-- | nombre_cliente  | estado    | fecha_entrega |
-- +-----------------+-----------+---------------+
-- | Golf S.A.       | Pendiente | 2009-03-09    |
-- | Sotogrande      | Pendiente | 2009-03-28    |
-- | Sotogrande      | Pendiente | 2009-03-30    |
-- | Jardineria Sara | Pendiente | 2009-01-24    |
-- | Jardineria Sara | Pendiente | 2009-05-20    |
-- | Jardineria Sara | Pendiente | 2009-01-24    |
-- | Jardineria Sara | Pendiente | 2009-05-20    |
-- | Flores S.L.     | Pendiente | 2009-05-07    |
-- | Flores S.L.     | Pendiente | 2009-02-27    |
-- +-----------------+-----------+---------------+

-- Consulta 26
SELECT c.nombre_cliente, p.codigo_pedido, pr.gama FROM producto pr LEFT JOIN detalle_pedido dp ON dp.codigo_producto = pr.codigo_producto INNER JOIN pedido p ON p.codigo_pedido = dp.codigo_pedido INNER JOIN cliente c ON c.codigo_cliente = p.codigo_cliente GROUP BY codigo_pedido;
-- +--------------------------------+---------------+--------------+
-- | nombre_cliente                 | codigo_pedido | gama         |
-- +--------------------------------+---------------+--------------+
-- | Tendo Garden                   |             1 | Frutales     |
-- | Tendo Garden                   |             2 | Frutales     |
-- | Tendo Garden                   |             3 | Frutales     |
-- | Tendo Garden                   |             4 | Frutales     |
-- | GoldFish Garden                |             8 | Frutales     |
-- | GoldFish Garden                |             9 | Arom?ticas   |
-- | Gardening Associates           |            10 | Frutales     |
-- | GoldFish Garden                |            11 | Arom?ticas   |
-- | GoldFish Garden                |            12 | Arom?ticas   |
-- | Beragua                        |            13 | Herramientas |
-- | Beragua                        |            14 | Frutales     |
-- | Beragua                        |            15 | Frutales     |
-- | Beragua                        |            16 | Herramientas |
-- | Beragua                        |            17 | Herramientas |
-- | Naturagua                      |            18 | Herramientas |
-- | Naturagua                      |            19 | Herramientas |
-- | Naturagua                      |            20 | Herramientas |
-- | Naturagua                      |            21 | Herramientas |
-- | Naturagua                      |            22 | Ornamentales |
-- | Tendo Garden                   |            23 | Arom?ticas   |
-- | Dardena S.A.                   |            24 | Herramientas |
-- | GoldFish Garden                |            25 | Frutales     |
-- | Gardening Associates           |            26 | Frutales     |
-- | Gardening Associates           |            27 | Ornamentales |
-- | Gardening Associates           |            28 | Frutales     |
-- | Dardena S.A.                   |            29 | Frutales     |
-- | Camunas Jardines S.L.          |            30 | Arom?ticas   |
-- | Camunas Jardines S.L.          |            31 | Arom?ticas   |
-- | Gerudo Valley                  |            32 | Herramientas |
-- | Gerudo Valley                  |            33 | Frutales     |
-- | Gerudo Valley                  |            34 | Frutales     |
-- | Gerudo Valley                  |            35 | Herramientas |
-- | Dardena S.A.                   |            36 | Herramientas |
-- | Gerudo Valley                  |            37 | Frutales     |
-- | Golf S.A.                      |            38 | Herramientas |
-- | Golf S.A.                      |            39 | Herramientas |
-- | Golf S.A.                      |            40 | Arom?ticas   |
-- | Golf S.A.                      |            41 | Arom?ticas   |
-- | Golf S.A.                      |            42 | Arom?ticas   |
-- | Sotogrande                     |            43 | Arom?ticas   |
-- | Sotogrande                     |            44 | Arom?ticas   |
-- | Sotogrande                     |            45 | Arom?ticas   |
-- | Sotogrande                     |            46 | Frutales     |
-- | Sotogrande                     |            47 | Frutales     |
-- | Jardines y Mansiones Cactus SL |            48 | Frutales     |
-- | Jardines y Mansiones Cactus SL |            49 | Ornamentales |
-- | Jardines y Mansiones Cactus SL |            50 | Ornamentales |
-- | Jardines y Mansiones Cactus SL |            51 | Ornamentales |
-- | Jardines y Mansiones Cactus SL |            52 | Frutales     |
-- | Camunas Jardines S.L.          |            53 | Frutales     |
-- | Dardena S.A.                   |            54 | Herramientas |
-- | Dardena S.A.                   |            55 | Ornamentales |
-- | Camunas Jardines S.L.          |            56 | Ornamentales |
-- | Camunas Jardines S.L.          |            57 | Frutales     |
-- | Gardening Associates           |            58 | Ornamentales |
-- | GoldFish Garden                |            59 | Frutales     |
-- | GoldFish Garden                |            60 | Frutales     |
-- | Gardening Associates           |            61 | Frutales     |
-- | GoldFish Garden                |            62 | Frutales     |
-- | GoldFish Garden                |            63 | Frutales     |
-- | GoldFish Garden                |            64 | Frutales     |
-- | GoldFish Garden                |            65 | Frutales     |
-- | Gardening Associates           |            66 | Frutales     |
-- | Gardening Associates           |            67 | Frutales     |
-- | Gardening Associates           |            68 | Frutales     |
-- | Jardin de Flores               |            74 | Frutales     |
-- | Jardin de Flores               |            75 | Arom?ticas   |
-- | Jardin de Flores               |            76 | Arom?ticas   |
-- | Jardin de Flores               |            77 | Herramientas |
-- | Jardin de Flores               |            78 | Frutales     |
-- | Agrojardin                     |            79 | Ornamentales |
-- | Agrojardin                     |            80 | Frutales     |
-- | Agrojardin                     |            81 | Ornamentales |
-- | Agrojardin                     |            82 | Ornamentales |
-- | Agrojardin                     |            83 | Ornamentales |
-- | Tutifruti S.A                  |            89 | Frutales     |
-- | Jardiner?as Mat?as SL          |            90 | Arom?ticas   |
-- | Jardiner?as Mat?as SL          |            91 | Frutales     |
-- | Jardiner?as Mat?as SL          |            92 | Frutales     |
-- | Jardiner?as Mat?as SL          |            93 | Frutales     |
-- | Jardiner?as Mat?as SL          |            94 | Herramientas |
-- | Tutifruti S.A                  |            95 | Frutales     |
-- | Tutifruti S.A                  |            96 | Frutales     |
-- | Tutifruti S.A                  |            97 | Frutales     |
-- | Tutifruti S.A                  |            98 | Frutales     |
-- | Flores Marivi                  |            99 | Ornamentales |
-- | Flores Marivi                  |           100 | Frutales     |
-- | Flores Marivi                  |           101 | Arom?ticas   |
-- | Flores Marivi                  |           102 | Herramientas |
-- | Jardineria Sara                |           103 | Frutales     |
-- | Jardineria Sara                |           104 | Frutales     |
-- | Jardineria Sara                |           105 | Ornamentales |
-- | Jardineria Sara                |           106 | Arom?ticas   |
-- | Jardineria Sara                |           107 | Herramientas |
-- | Flores Marivi                  |           108 | Frutales     |
-- | El Jardin Viviente S.L         |           109 | Frutales     |
-- | El Jardin Viviente S.L         |           110 | Arom?ticas   |
-- | Flores S.L.                    |           111 | Frutales     |
-- | Flores S.L.                    |           112 | Frutales     |
-- | Flores S.L.                    |           113 | Frutales     |
-- | Flores S.L.                    |           114 | Frutales     |
-- | Flores S.L.                    |           115 | Frutales     |
-- | El Jardin Viviente S.L         |           116 | Herramientas |
-- | El Jardin Viviente S.L         |           117 | Frutales     |
-- | Flores Marivi                  |           118 | Frutales     |
-- | Flores Marivi                  |           119 | Frutales     |
-- | Flores Marivi                  |           120 | Frutales     |
-- | Flores Marivi                  |           121 | Frutales     |
-- | Flores Marivi                  |           122 | Frutales     |
-- | Jardineria Sara                |           123 | Frutales     |
-- | Jardineria Sara                |           124 | Frutales     |
-- | Jardineria Sara                |           125 | Frutales     |
-- | Jardineria Sara                |           126 | Frutales     |
-- | Jardineria Sara                |           127 | Frutales     |
-- | El Jardin Viviente S.L         |           128 | Arom?ticas   |
-- +--------------------------------+---------------+--------------+

-- Consulta 27

SELECT nombre_cliente FROM cliente WHERE codigo_cliente NOT IN (SELECT codigo_cliente FROM pago);

-- +-----------------------------+
-- | nombre_cliente              |
-- +-----------------------------+
-- | Lasas S.A.                  |
-- | Club Golf Puerta del hierro |
-- | DaraDistribuciones          |
-- | Madrile?a de riegos         |
-- | Lasas S.A.                  |
-- | Flowers, S.A                |
-- | Naturajardin                |
-- | Americh Golf Management SL  |
-- | Aloha                       |
-- | El Prat                     |
-- | Vivero Humanes              |
-- | Fuenla City                 |
-- | Top Campo                   |
-- | Campohermoso                |
-- | france telecom              |
-- | Mus?e du Louvre             |
-- | Flores S.L.                 |
-- | The Magic Garden            |
-- +-----------------------------+

-- Consulta 28

SELECT nombre_cliente FROM cliente WHERE codigo_cliente NOT IN (SELECT codigo_cliente from pedido);

-- +-----------------------------+
-- | nombre_cliente              |
-- +-----------------------------+
-- | Lasas S.A.                  |
-- | Club Golf Puerta del hierro |
-- | DaraDistribuciones          |
-- | Madrile?a de riegos         |
-- | Lasas S.A.                  |
-- | Flowers, S.A                |
-- | Naturajardin                |
-- | Americh Golf Management SL  |
-- | Aloha                       |
-- | El Prat                     |
-- | Vivero Humanes              |
-- | Fuenla City                 |
-- | Top Campo                   |
-- | Campohermoso                |
-- | france telecom              |
-- | Mus?e du Louvre             |
-- | The Magic Garden            |
-- +-----------------------------|

-- Consulta 29

SELECT nombre_cliente FROM cliente WHERE codigo_cliente NOT IN (SELECT codigo_cliente from pedido) AND codigo_cliente NOT IN (SELECT codigo_cliente from pago);

-- +-----------------------------+
-- | nombre_cliente              |
-- +-----------------------------+
-- | Lasas S.A.                  |
-- | Club Golf Puerta del hierro |
-- | DaraDistribuciones          |
-- | Madrile?a de riegos         |
-- | Lasas S.A.                  |
-- | Flowers, S.A                |
-- | Naturajardin                |
-- | Americh Golf Management SL  |
-- | Aloha                       |
-- | El Prat                     |
-- | Vivero Humanes              |
-- | Fuenla City                 |
-- | Top Campo                   |
-- | Campohermoso                |
-- | france telecom              |
-- | Mus?e du Louvre             |
-- | The Magic Garden            |
-- +-----------------------------+

-- Consulta 30

SELECT nombre, codigo_empleado FROM empleado WHERE codigo_oficina IS NULL;

-- Empty set (0.000 sec)

-- Consulta 31

SELECT nombre, codigo_empleado FROM empleado WHERE codigo_empleado NOT IN (SELECT codigo_empleado_rep_ventas FROM cliente);

-- +-------------+-----------------+
-- | nombre      | codigo_empleado |
-- +-------------+-----------------+
-- | Marcos      |               1 |
-- | Ruben       |               2 |
-- | Alberto     |               3 |
-- | Maria       |               4 |
-- | Juan Carlos |               6 |
-- | Carlos      |               7 |
-- | Hilario     |              10 |
-- | David       |              13 |
-- | Oscar       |              14 |
-- | Francois    |              15 |
-- | Laurent     |              17 |
-- | Hilary      |              20 |
-- | Marcus      |              21 |
-- | Nei         |              23 |
-- | Narumi      |              24 |
-- | Takuma      |              25 |
-- | Amy         |              26 |
-- | Larry       |              27 |
-- | John        |              28 |
-- | Kevin       |              29 |
-- +-------------+-----------------+

-- Consulta 32

SELECT nombre, codigo_empleado FROM empleado WHERE codigo_empleado NOT IN (SELECT codigo_empleado_rep_ventas FROM cliente) AND codigo_oficina IS NULL;
-- Empty set (0.000 sec)

-- Consulta 33

SELECT nombre FROM producto WHERE codigo_producto NOT IN (SELECT codigo_producto FROM detalle_pedido);

-- +-------------------------------------------------------------+
-- | nombre                                                      |
-- +-------------------------------------------------------------+
-- | Olea-Olivos                                                 |
-- | Calamondin Mini                                             |
-- | Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |
-- | Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |
-- | Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |
-- | Albaricoquero Corbato                                       |
-- | Albaricoquero Moniqui                                       |
-- | Albaricoquero Kurrot                                        |
-- | Cerezo Burlat                                               |
-- | Cerezo Picota                                               |
-- | Ciruelo R. Claudia Verde                                    |
-- | Ciruelo Golden Japan                                        |
-- | Ciruelo Claudia Negra                                       |
-- | Higuera Verdal                                              |
-- | Higuera Breva                                               |
-- | Melocotonero Spring Crest                                   |
-- | Melocotonero Federica                                       |
-- | Parra Uva de Mesa                                           |
-- | Mandarino -Plant?n joven                                    |
-- | Peral Castell                                               |
-- | Peral Williams                                              |
-- | Peral Conference                                            |
-- | Olivo Cipresino                                             |
-- | Albaricoquero                                               |
-- | Albaricoquero                                               |
-- | Albaricoquero                                               |
-- | Cerezo                                                      |
-- | Cerezo                                                      |
-- | Cerezo                                                      |
-- | Ciruelo                                                     |
-- | Granado                                                     |
-- | Granado                                                     |
-- | Granado                                                     |
-- | Higuera                                                     |
-- | Manzano                                                     |
-- | Melocotonero                                                |
-- | Melocotonero                                                |
-- | Melocotonero                                                |
-- | Membrillero                                                 |
-- | Membrillero                                                 |
-- | Membrillero                                                 |
-- | Membrillero                                                 |
-- | Arbustos Mix Maceta                                         |
-- | Mimosa Injerto CLASICA Dealbata                             |
-- | Mimosa Semilla Bayleyana                                    |
-- | Mimosa Semilla Espectabilis                                 |
-- | Mimosa Semilla Longifolia                                   |
-- | Mimosa Semilla Floribunda 4 estaciones                      |
-- | Abelia Floribunda                                           |
-- | Callistemom (Mix)                                           |
-- | Callistemom (Mix)                                           |
-- | Corylus Avellana "Contorta"                                 |
-- | Escallonia (Mix)                                            |
-- | Evonimus Emerald Gayeti                                     |
-- | Evonimus Pulchellus                                         |
-- | Hibiscus Syriacus  "Helene" -Blanco-C.rojo                  |
-- | Hibiscus Syriacus "Pink Giant" Rosa                         |
-- | Lonicera Nitida "Maigrum"                                   |
-- | Prunus pisardii                                             |
-- | Weigelia "Bristol Ruby"                                     |
-- | Leptospermum formado PIRAMIDE                               |
-- | Leptospermum COPA                                           |
-- | Nerium oleander-CALIDAD "GARDEN"                            |
-- | Nerium Oleander Arbusto GRANDE                              |
-- | Nerium oleander COPA  Calibre 6/8                           |
-- | ROSAL TREPADOR                                              |
-- | Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |
-- | Solanum Jazminoide                                          |
-- | Wisteria Sinensis  azul, rosa, blanca                       |
-- | Wisteria Sinensis INJERTADAS DEC?"                          |
-- | Bougamvillea Sanderiana Tutor                               |
-- | Bougamvillea Sanderiana Espaldera                           |
-- | Bougamvillea Sanderiana Espaldera                           |
-- | Bougamvillea Sanderiana, 3 tut. piramide                    |
-- | Expositor ?rboles clima mediterr?neo                        |
-- | Expositor ?rboles borde del mar                             |
-- | Brachychiton Acerifolius                                    |
-- | Cassia Corimbosa                                            |
-- | Cassia Corimbosa                                            |
-- | Chitalpa Summer Bells                                       |
-- | Erytrina Kafra                                              |
-- | Eucalyptus Citriodora                                       |
-- | Eucalyptus Ficifolia                                        |
-- | Hibiscus Syriacus  Var. Injertadas 1 Tallo                  |
-- | Lagunaria Patersonii                                        |
-- | Lagunaria Patersonii                                        |
-- | Morus Alba                                                  |
-- | Platanus Acerifolia                                         |
-- | Salix Babylonica  Pendula                                   |
-- | Tamarix  Ramosissima Pink Cascade                           |
-- | Tecoma Stands                                               |
-- | Tecoma Stands                                               |
-- | Tipuana Tipu                                                |
-- | Pleioblastus distichus-Bamb? enano                          |
-- | Sasa palmata                                                |
-- | Phylostachys aurea                                          |
-- | Phylostachys aurea                                          |
-- | Phylostachys Bambusa Spectabilis                            |
-- | Phylostachys biseti                                         |
-- | Pseudosasa japonica (Metake)                                |
-- | Pseudosasa japonica (Metake)                                |
-- | Cedrus Deodara "Feeling Blue" Novedad                       |
-- | Juniperus chinensis "Blue Alps"                             |
-- | Juniperus Chinensis Stricta                                 |
-- | Juniperus squamata "Blue Star"                              |
-- | Juniperus x media Phitzeriana verde                         |
-- | Bismarckia Nobilis                                          |
-- | Brahea Armata                                               |
-- | Brahea Edulis                                               |
-- | Butia Capitata                                              |
-- | Butia Capitata                                              |
-- | Butia Capitata                                              |
-- | Chamaerops Humilis                                          |
-- | Chamaerops Humilis                                          |
-- | Chamaerops Humilis "Cerifera"                               |
-- | Chrysalidocarpus Lutescens -ARECA                           |
-- | Cordyline Australis -DRACAENA                               |
-- | Cycas Revoluta                                              |
-- | Cycas Revoluta                                              |
-- | Dracaena Drago                                              |
-- | Dracaena Drago                                              |
-- | Livistonia Decipiens                                        |
-- | Livistonia Decipiens                                        |
-- | Rhaphis Excelsa                                             |
-- | Sabal Minor                                                 |
-- | Sabal Minor                                                 |
-- | Trachycarpus Fortunei                                       |
-- | Washingtonia Robusta                                        |
-- | Zamia Furfuracaea                                           |
-- +-------------------------------------------------------------+

-- Consulta 36

SELECT e.nombre, e.codigo_empleado, j.nombre as "Nombre del jefe" FROM empleado e INNER JOIN empleado j ON e.codigo_jefe = j.codigo_empleado WHERE e.codigo_empleado NOT IN (SELECT codigo_empleado_rep_ventas FROM cliente);

-- +-------------+-----------------+-----------------+
-- | nombre      | codigo_empleado | Nombre del jefe |
-- +-------------+-----------------+-----------------+
-- | Ruben       |               2 | Marcos          |
-- | Alberto     |               3 | Ruben           |
-- | Maria       |               4 | Ruben           |
-- | Juan Carlos |               6 | Alberto         |
-- | Carlos      |               7 | Alberto         |
-- | Hilario     |              10 | Carlos          |
-- | David       |              13 | Emmanuel        |
-- | Oscar       |              14 | Emmanuel        |
-- | Francois    |              15 | Alberto         |
-- | Laurent     |              17 | Francois        |
-- | Hilary      |              20 | Alberto         |
-- | Marcus      |              21 | Hilary          |
-- | Nei         |              23 | Alberto         |
-- | Narumi      |              24 | Nei             |
-- | Takuma      |              25 | Nei             |
-- | Amy         |              26 | Alberto         |
-- | Larry       |              27 | Amy             |
-- | John        |              28 | Amy             |
-- | Kevin       |              29 | Alberto         |
-- +-------------+-----------------+-----------------+

-- Consulta 37

SELECT count(codigo_empleado) AS "Cantidad de empleados" FROM empleado;

-- +-----------------------+
-- | Cantidad de empleados |
-- +-----------------------+
-- |                    31 |
-- +-----------------------+

-- Consulta 38

SELECT pais, count(codigo_cliente) AS "Cantidad de clientes" FROM cliente GROUP BY pais;

-- +----------------+----------------------+
-- | pais           | Cantidad de clientes |
-- +----------------+----------------------+
-- | Australia      |                    2 |
-- | France         |                    2 |
-- | Spain          |                   27 |
-- | United Kingdom |                    1 |
-- | USA            |                    4 |
-- +----------------+----------------------+

-- Consulta 39

SELECT avg(total) as "Pago medio" FROM pago WHERE YEAR(fecha_pago) = 2009;

-- +-------------+
-- | Pago medio  |
-- +-------------+
-- | 4504.076923 |

-- +-------------+

-- Consulta 40

SELECT estado, count(estado) as 'Cantidad de cada pedido en los estados' FROM pedido GROUP BY estado ORDER BY count(estado) DESC;

-- +-----------+----------------------------------------+
-- | estado    | Cantidad de cada pedido en los estados |
-- +-----------+----------------------------------------+
-- | Entregado |                                     61 |
-- | Pendiente |                                     30 |
-- | Rechazado |                                     24 |
-- +-----------+----------------------------------------+

-- 40 a 60

-- Consulta 41

SELECT min(precio_venta) as "Minimo de venta", max(precio_venta) as "Maximo de venta" FROM producto;

-- +-----------------+-----------------+
-- | Minimo de venta | Maximo de venta |
-- +-----------------+-----------------+
-- |            1.00 |          462.00 |
-- +-----------------+-----------------+

-- Consulta 42

SELECT count(codigo_cliente) as 'Cantidad clientes' FROM cliente;

-- +-------------------+
-- | Cantidad clientes |
-- +-------------------+
-- |                36 |
-- +-------------------+

-- Consulta 43

SELECT count(codigo_cliente) as 'Cantidad clientes en Madrid' FROM cliente WHERE ciudad LIKE "Mad%";

-- +-----------------------------+
-- | Cantidad clientes en Madrid |
-- +-----------------------------+
-- |                          11 |
-- +-----------------------------+

-- Consulta 44

SELECT ciudad, count(codigo_cliente) as 'Cantidad clientes en ciudad' FROM cliente WHERE ciudad LIKE "M%" GROUP BY ciudad;

-- +----------------------+-----------------------------+
-- | ciudad               | Cantidad clientes en ciudad |
-- +----------------------+-----------------------------+
-- | Madrid               |                          11 |
-- | Miami                |                           2 |
-- | Montornes del valles |                           1 |
-- +----------------------+-----------------------------+

-- Consulta 45

SELECT e.nombre, count(c.codigo_cliente) as 'Cantidad clientes' FROM empleado e INNER JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas GROUP BY e.nombre;

-- +-----------------+-------------------+
-- | nombre          | Cantidad clientes |
-- +-----------------+-------------------+
-- | Emmanuel        |                 5 |
-- | Felipe          |                 5 |
-- | Jos? Manuel     |                 5 |
-- | Julian          |                 5 |
-- | Lionel          |                 2 |
-- | Lorena          |                 2 |
-- | Lucio           |                 2 |
-- | Mariano         |                 4 |
-- | Mariko          |                 2 |
-- | Michael         |                 2 |
-- | Walter Santiago |                 2 |
-- +-----------------+-------------------+

-- Consulta 46

SELECT count(codigo_cliente) as 'Cantidad Clientes' FROM cliente WHERE codigo_empleado_rep_ventas NOT IN (SELECT codigo_empleado FROM empleado);

-- +-------------------+
-- | Cantidad Clientes |
-- +-------------------+
-- |                 0 |
-- +-------------------+

-- Consulta 47

SELECT c.nombre_cliente, concat(c.nombre_contacto, ' ', c.apellido_contacto) as 'Nombre y apellido', min(p.fecha_pago) as 'Primer pago', max(p.fecha_pago) as 'Ultimo pago' FROM pago p INNER JOIN cliente c ON c.codigo_cliente = p.codigo_cliente GROUP BY c.nombre_cliente;

-- +--------------------------------+-------------------+-------------+-------------+
-- | nombre_cliente                 | Nombre y apellido | Primer pago | Ultimo pago |
-- +--------------------------------+-------------------+-------------+-------------+
-- | Agrojardin                     | Benito Lopez      | 2009-01-13  | 2009-01-13  |
-- | Beragua                        | Jose Bermejo      | 2009-01-13  | 2009-01-13  |
-- | Camunas Jardines S.L.          | Pedro Camunas     | 2008-08-04  | 2008-08-04  |
-- | Dardena S.A.                   | Juan Rodriguez    | 2008-07-15  | 2008-07-15  |
-- | El Jardin Viviente S.L         | Justin Smith      | 2006-05-26  | 2006-05-26  |
-- | Flores Marivi                  | Maria Rodriguez   | 2009-02-16  | 2009-02-16  |
-- | Gardening Associates           | Anne Wright       | 2009-01-16  | 2009-02-19  |
-- | Gerudo Valley                  | Link Flaute       | 2007-01-08  | 2007-01-08  |
-- | GoldFish Garden                | Daniel G GoldFish | 2008-11-10  | 2008-12-10  |
-- | Golf S.A.                      | Luis Martinez     | 2009-03-06  | 2009-03-06  |
-- | Jardin de Flores               | Javier Villar     | 2009-01-15  | 2009-02-15  |
-- | Jardiner?as Mat?as SL          | Mat?as San Mart?n | 2009-02-08  | 2009-02-08  |
-- | Jardineria Sara                | Sara Marquez      | 2009-01-16  | 2009-01-16  |
-- | Jardines y Mansiones Cactus SL | Eva Mar?a S?nchez | 2008-03-18  | 2008-03-18  |
-- | Naturagua                      | Guillermo Rengifo | 2009-01-06  | 2009-01-06  |
-- | Sotogrande                     | Maria Santillana  | 2009-03-26  | 2009-03-26  |
-- | Tendo Garden                   | Akane Tendo       | 2006-01-18  | 2006-01-18  |
-- | Tutifruti S.A                  | Jacob Jones       | 2007-10-06  | 2007-10-06  |
-- +--------------------------------+-------------------+-------------+-------------+

-- Consulta 48

SELECT COUNT(pr.nombre) as "Cantidad de productos", pe.codigo_pedido FROM producto pr JOIN detalle_pedido dp ON pr.codigo_producto = dp.codigo_producto JOIN pedido pe ON pe.codigo_pedido = dp.codigo_pedido GROUP BY pe.codigo_pedido;

-- +-----------------------+---------------+
-- | Cantidad de productos | codigo_pedido |
-- +-----------------------+---------------+
-- |                     5 |             1 |
-- |                     6 |             2 |
-- |                     6 |             3 |
-- |                     8 |             4 |
-- |                     3 |             8 |
-- |                     4 |             9 |
-- |                     3 |            10 |
-- |                     2 |            11 |
-- |                     1 |            12 |
-- |                     3 |            13 |
-- |                     2 |            14 |
-- |                     4 |            15 |
-- |                     2 |            16 |
-- |                     5 |            17 |
-- |                     3 |            18 |
-- |                     5 |            19 |
-- |                     2 |            20 |
-- |                     3 |            21 |
-- |                     1 |            22 |
-- |                     4 |            23 |
-- |                     4 |            24 |
-- |                     3 |            25 |
-- |                     3 |            26 |
-- |                     3 |            27 |
-- |                     3 |            28 |
-- |                     5 |            29 |
-- |                     6 |            30 |
-- |                     2 |            31 |
-- |                     5 |            32 |
-- |                     4 |            33 |
-- |                     3 |            34 |
-- |                     5 |            35 |
-- |                     5 |            36 |
-- |                     3 |            37 |
-- |                     2 |            38 |
-- |                     2 |            39 |
-- |                     2 |            40 |
-- |                     2 |            41 |
-- |                     2 |            42 |
-- |                     1 |            43 |
-- |                     1 |            44 |
-- |                     2 |            45 |
-- |                     2 |            46 |
-- |                     2 |            47 |
-- |                     5 |            48 |
-- |                     3 |            49 |
-- |                     3 |            50 |
-- |                     3 |            51 |
-- |                     1 |            52 |
-- |                     3 |            53 |
-- |                     7 |            54 |
-- |                     5 |            55 |
-- |                     6 |            56 |
-- |                     4 |            57 |
-- |                     4 |            58 |
-- |                     1 |            59 |
-- |                     1 |            60 |
-- |                     1 |            61 |
-- |                     1 |            62 |
-- |                     1 |            63 |
-- |                     1 |            64 |
-- |                     1 |            65 |
-- |                     1 |            66 |
-- |                     1 |            67 |
-- |                     1 |            68 |
-- |                     3 |            74 |
-- |                     3 |            75 |
-- |                     5 |            76 |
-- |                     2 |            77 |
-- |                     4 |            78 |
-- |                     1 |            79 |
-- |                     3 |            80 |
-- |                     1 |            81 |
-- |                     1 |            82 |
-- |                     1 |            83 |
-- |                     5 |            89 |
-- |                     3 |            90 |
-- |                     3 |            91 |
-- |                     3 |            92 |
-- |                     3 |            93 |
-- |                     2 |            94 |
-- |                     3 |            95 |
-- |                     4 |            96 |
-- |                     3 |            97 |
-- |                     5 |            98 |
-- |                     2 |            99 |
-- |                     2 |           100 |
-- |                     2 |           101 |
-- |                     2 |           102 |
-- |                     2 |           103 |
-- |                     2 |           104 |
-- |                     2 |           105 |
-- |                     2 |           106 |
-- |                     2 |           107 |
-- |                     2 |           108 |
-- |                     7 |           109 |
-- |                     3 |           110 |
-- |                     1 |           111 |
-- |                     1 |           112 |
-- |                     1 |           113 |
-- |                     1 |           114 |
-- |                     1 |           115 |
-- |                     5 |           116 |
-- |                     4 |           117 |
-- |                     1 |           118 |
-- |                     1 |           119 |
-- |                     1 |           120 |
-- |                     1 |           121 |
-- |                     1 |           122 |
-- |                     1 |           123 |
-- |                     1 |           124 |
-- |                     1 |           125 |
-- |                     1 |           126 |
-- |                     1 |           127 |
-- |                     2 |           128 |
-- +-----------------------+---------------+

-- Consulta 49

SELECT SUM(dp.cantidad) as "Suma de productos", pe.codigo_pedido FROM producto pr JOIN detalle_pedido dp ON pr.codigo_producto = dp.codigo_producto JOIN pedido pe ON pe.codigo_pedido = dp.codigo_pedido GROUP BY pe.codigo_pedido;

-- +-------------------+---------------+
-- | Suma de productos | codigo_pedido |
-- +-------------------+---------------+
-- |               113 |             1 |
-- |               161 |             2 |
-- |               232 |             3 |
-- |               179 |             4 |
-- |                14 |             8 |
-- |               625 |             9 |
-- |                40 |            10 |
-- |               260 |            11 |
-- |               290 |            12 |
-- |                22 |            13 |
-- |                21 |            14 |
-- |                21 |            15 |
-- |                22 |            16 |
-- |                25 |            17 |
-- |                16 |            18 |
-- |                41 |            19 |
-- |                22 |            20 |
-- |                30 |            21 |
-- |                 1 |            22 |
-- |               194 |            23 |
-- |                19 |            24 |
-- |                29 |            25 |
-- |                27 |            26 |
-- |                84 |            27 |
-- |                12 |            28 |
-- |                40 |            29 |
-- |                33 |            30 |
-- |                26 |            31 |
-- |                40 |            32 |
-- |               905 |            33 |
-- |                56 |            34 |
-- |               178 |            35 |
-- |                28 |            36 |
-- |               245 |            37 |
-- |                 7 |            38 |
-- |                 9 |            39 |
-- |                12 |            40 |
-- |                10 |            41 |
-- |                 4 |            42 |
-- |                 9 |            43 |
-- |                 5 |            44 |
-- |                10 |            45 |
-- |                12 |            46 |
-- |                14 |            47 |
-- |               147 |            48 |
-- |                65 |            49 |
-- |                71 |            50 |
-- |               200 |            51 |
-- |                10 |            52 |
-- |                 9 |            53 |
-- |                69 |            54 |
-- |                20 |            55 |
-- |                22 |            56 |
-- |                17 |            57 |
-- |               364 |            58 |
-- |                10 |            59 |
-- |                10 |            60 |
-- |                10 |            61 |
-- |                10 |            62 |
-- |                10 |            63 |
-- |                10 |            64 |
-- |                10 |            65 |
-- |                10 |            66 |
-- |                10 |            67 |
-- |                10 |            68 |
-- |                91 |            74 |
-- |               130 |            75 |
-- |               374 |            76 |
-- |                49 |            77 |
-- |               153 |            78 |
-- |                50 |            79 |
-- |               162 |            80 |
-- |                30 |            81 |
-- |                34 |            82 |
-- |                30 |            83 |
-- |                32 |            89 |
-- |                41 |            90 |
-- |               101 |            91 |
-- |                62 |            92 |
-- |                79 |            93 |
-- |                45 |            94 |
-- |                20 |            95 |
-- |                36 |            96 |
-- |                36 |            97 |
-- |                62 |            98 |
-- |                45 |            99 |
-- |                60 |           100 |
-- |               209 |           101 |
-- |                55 |           102 |
-- |                64 |           103 |
-- |               122 |           104 |
-- |                48 |           105 |
-- |               278 |           106 |
-- |               158 |           107 |
-- |               112 |           108 |
-- |                69 |           109 |
-- |                21 |           110 |
-- |                10 |           111 |
-- |                10 |           112 |
-- |                10 |           113 |
-- |                10 |           114 |
-- |                10 |           115 |
-- |                78 |           116 |
-- |                24 |           117 |
-- |                10 |           118 |
-- |                10 |           119 |
-- |                10 |           120 |
-- |                10 |           121 |
-- |                10 |           122 |
-- |                10 |           123 |
-- |                10 |           124 |
-- |                10 |           125 |
-- |                10 |           126 |
-- |                10 |           127 |
-- |                33 |           128 |
-- +-------------------+---------------+

-- Consulta 50

SELECT pr.nombre, SUM(dp.cantidad) AS "Unidades vendidas"

-- Consulta 51

SELECT SUM(cantidad * precio_unidad) AS base_imponible, SUM(cantidad * precio_unidad) * 0.21 AS IVA, SUM((cantidad * precio_unidad) - (cantidad * precio_unidad) * 0.21) AS total_facturado FROM detalle_pedido;

-- +----------------+------------+-----------------+
-- | base_imponible | IVA        | total_facturado |
-- +----------------+------------+-----------------+
-- |      214682.00 | 45083.2200 |     169598.7800 |
-- +----------------+------------+-----------------+

-- Consulta 52

SELECT SUM(cantidad * precio_unidad) AS base_imponible, SUM(cantidad * precio_unidad) * 0.21 AS IVA, SUM((cantidad * precio_unidad) - (cantidad * precio_unidad) * 0.21) AS total_facturado FROM detalle_pedido GROUP BY codigo_producto;

-- +----------------+------------+-----------------+
-- | base_imponible | IVA        | total_facturado |
-- +----------------+------------+-----------------+
-- |         630.00 |   132.3000 |        497.7000 |
-- |         564.00 |   118.4400 |        445.5600 |
-- |         996.00 |   209.1600 |        786.8400 |
-- |        2640.00 |   554.4000 |       2085.6000 |
-- |         135.00 |    28.3500 |        106.6500 |
-- |         128.00 |    26.8800 |        101.1200 |
-- |          17.00 |     3.5700 |         13.4300 |
-- |          30.00 |     6.3000 |         23.7000 |
-- |          21.00 |     4.4100 |         16.5900 |
-- |         291.00 |    61.1100 |        229.8900 |
-- |           9.00 |     1.8900 |          7.1100 |
-- |         455.00 |    95.5500 |        359.4500 |
-- |         986.00 |   207.0600 |        778.9400 |
-- |          10.00 |     2.1000 |          7.9000 |
-- |         168.00 |    35.2800 |        132.7200 |
-- |         119.00 |    24.9900 |         94.0100 |
-- |        1209.00 |   253.8900 |        955.1100 |
-- |         247.00 |    51.8700 |        195.1300 |
-- |         668.00 |   140.2800 |        527.7200 |
-- |          25.00 |     5.2500 |         19.7500 |
-- |         280.00 |    58.8000 |        221.2000 |
-- |         673.00 |   141.3300 |        531.6700 |
-- |        1100.00 |   231.0000 |        869.0000 |
-- |         468.00 |    98.2800 |        369.7200 |
-- |       13092.00 |  2749.3200 |      10342.6800 |
-- |         668.00 |   140.2800 |        527.7200 |
-- |         741.00 |   155.6100 |        585.3900 |
-- |         225.00 |    47.2500 |        177.7500 |
-- |          45.00 |     9.4500 |         35.5500 |
-- |         846.00 |   177.6600 |        668.3400 |
-- |         108.00 |    22.6800 |         85.3200 |
-- |          40.00 |     8.4000 |         31.6000 |
-- |          62.00 |    13.0200 |         48.9800 |
-- |         960.00 |   201.6000 |        758.4000 |
-- |          96.00 |    20.1600 |         75.8400 |
-- |         216.00 |    45.3600 |        170.6400 |
-- |         336.00 |    70.5600 |        265.4400 |
-- |         621.00 |   130.4100 |        490.5900 |
-- |          45.00 |     9.4500 |         35.5500 |
-- |         434.00 |    91.1400 |        342.8600 |
-- |          96.00 |    20.1600 |         75.8400 |
-- |          96.00 |    20.1600 |         75.8400 |
-- |          48.00 |    10.0800 |         37.9200 |
-- |         112.00 |    23.5200 |         88.4800 |
-- |         440.00 |    92.4000 |        347.6000 |
-- |        1080.00 |   226.8000 |        853.2000 |
-- |         744.00 |   156.2400 |        587.7600 |
-- |         351.00 |    73.7100 |        277.2900 |
-- |         128.00 |    26.8800 |        101.1200 |
-- |        1624.00 |   341.0400 |       1282.9600 |
-- |         561.00 |   117.8100 |        443.1900 |
-- |         112.00 |    23.5200 |         88.4800 |
-- |         352.00 |    73.9200 |        278.0800 |
-- |         110.00 |    23.1000 |         86.9000 |
-- |         245.00 |    51.4500 |        193.5500 |
-- |       19950.00 |  4189.5000 |      15760.5000 |
-- |        1911.00 |   401.3100 |       1509.6900 |
-- |         348.00 |    73.0800 |        274.9200 |
-- |         220.00 |    46.2000 |        173.8000 |
-- |         124.00 |    26.0400 |         97.9600 |
-- |         224.00 |    47.0400 |        176.9600 |
-- |        1035.00 |   217.3500 |        817.6500 |
-- |          30.00 |     6.3000 |         23.7000 |
-- |         946.00 |   198.6600 |        747.3400 |
-- |         108.00 |    22.6800 |         85.3200 |
-- |          32.00 |     6.7200 |         25.2800 |
-- |         147.00 |    30.8700 |        116.1300 |
-- |         980.00 |   205.8000 |        774.2000 |
-- |         143.00 |    30.0300 |        112.9700 |
-- |        5320.00 |  1117.2000 |       4202.8000 |
-- |          22.00 |     4.6200 |         17.3800 |
-- |        1584.00 |   332.6400 |       1251.3600 |
-- |         450.00 |    94.5000 |        355.5000 |
-- |         232.00 |    48.7200 |        183.2800 |
-- |         280.00 |    58.8000 |        221.2000 |
-- |        2250.00 |   472.5000 |       1777.5000 |
-- |        1649.00 |   346.2900 |       1302.7100 |
-- |         144.00 |    30.2400 |        113.7600 |
-- |        1302.00 |   273.4200 |       1028.5800 |
-- |         200.00 |    42.0000 |        158.0000 |
-- |          63.00 |    13.2300 |         49.7700 |
-- |          98.00 |    20.5800 |         77.4200 |
-- |          50.00 |    10.5000 |         39.5000 |
-- |          25.00 |     5.2500 |         19.7500 |
-- |         160.00 |    33.6000 |        126.4000 |
-- |          70.00 |    14.7000 |         55.3000 |
-- |          15.00 |     3.1500 |         11.8500 |
-- |         160.00 |    33.6000 |        126.4000 |
-- |        2900.00 |   609.0000 |       2291.0000 |
-- |         337.00 |    70.7700 |        266.2300 |
-- |         216.00 |    45.3600 |        170.6400 |
-- |        2286.00 |   480.0600 |       1805.9400 |
-- |         320.00 |    67.2000 |        252.8000 |
-- |         200.00 |    42.0000 |        158.0000 |
-- |         200.00 |    42.0000 |        158.0000 |
-- |          68.00 |    14.2800 |         53.7200 |
-- |          42.00 |     8.8200 |         33.1800 |
-- |          36.00 |     7.5600 |         28.4400 |
-- |          18.00 |     3.7800 |         14.2200 |
-- |          24.00 |     5.0400 |         18.9600 |
-- |         313.00 |    65.7300 |        247.2700 |
-- |        2620.00 |   550.2000 |       2069.8000 |
-- |         132.00 |    27.7200 |        104.2800 |
-- |          90.00 |    18.9000 |         71.1000 |
-- |          30.00 |     6.3000 |         23.7000 |
-- |          20.00 |     4.2000 |         15.8000 |
-- |        1395.00 |   292.9500 |       1102.0500 |
-- |         432.00 |    90.7200 |        341.2800 |
-- |         380.00 |    79.8000 |        300.2000 |
-- |        2250.00 |   472.5000 |       1777.5000 |
-- |          30.00 |     6.3000 |         23.7000 |
-- |         360.00 |    75.6000 |        284.4000 |
-- |         240.00 |    50.4000 |        189.6000 |
-- |         100.00 |    21.0000 |         79.0000 |
-- |         100.00 |    21.0000 |         79.0000 |
-- |         280.00 |    58.8000 |        221.2000 |
-- |          40.00 |     8.4000 |         31.6000 |
-- |         102.00 |    21.4200 |         80.5800 |
-- |         500.00 |   105.0000 |        395.0000 |
-- |         100.00 |    21.0000 |         79.0000 |
-- |          25.00 |     5.2500 |         19.7500 |
-- |          16.00 |     3.3600 |         12.6400 |
-- |         884.00 |   185.6400 |        698.3600 |
-- |         500.00 |   105.0000 |        395.0000 |
-- |        3120.00 |   655.2000 |       2464.8000 |
-- |        4130.00 |   867.3000 |       3262.7000 |
-- |        9310.00 |  1955.1000 |       7354.9000 |
-- |        2120.00 |   445.2000 |       1674.8000 |
-- |         975.00 |   204.7500 |        770.2500 |
-- |         950.00 |   199.5000 |        750.5000 |
-- |        1239.00 |   260.1900 |        978.8100 |
-- |         840.00 |   176.4000 |        663.6000 |
-- |         570.00 |   119.7000 |        450.3000 |
-- |       15104.00 |  3171.8400 |      11932.1600 |
-- |        3520.00 |   739.2000 |       2780.8000 |
-- |        2205.00 |   463.0500 |       1741.9500 |
-- |         950.00 |   199.5000 |        750.5000 |
-- |         468.00 |    98.2800 |        369.7200 |
-- |         485.00 |   101.8500 |        383.1500 |
-- |         128.00 |    26.8800 |        101.1200 |
-- |       73510.00 | 15437.1000 |      58072.9000 |
-- |         150.00 |    31.5000 |        118.5000 |
-- |          30.00 |     6.3000 |         23.7000 |
-- |         517.00 |   108.5700 |        408.4300 |
-- +----------------+------------+-----------------+

-- Consulta 53

SELECT SUM(cantidad * precio_unidad) AS base_imponible, SUM(cantidad * precio_unidad) * 0.21 AS IVA, SUM((cantidad * precio_unidad) - (cantidad * precio_unidad) * 0.21) AS total_facturado FROM detalle_pedido WHERE codigo_producto LIKE "OR%" GROUP BY codigo_producto;

-- +----------------+------------+-----------------+
-- | base_imponible | IVA        | total_facturado |
-- +----------------+------------+-----------------+
-- |         144.00 |    30.2400 |        113.7600 |
-- |        1302.00 |   273.4200 |       1028.5800 |
-- |         200.00 |    42.0000 |        158.0000 |
-- |          63.00 |    13.2300 |         49.7700 |
-- |          98.00 |    20.5800 |         77.4200 |
-- |          50.00 |    10.5000 |         39.5000 |
-- |          25.00 |     5.2500 |         19.7500 |
-- |         160.00 |    33.6000 |        126.4000 |
-- |          70.00 |    14.7000 |         55.3000 |
-- |          15.00 |     3.1500 |         11.8500 |
-- |         160.00 |    33.6000 |        126.4000 |
-- |        2900.00 |   609.0000 |       2291.0000 |
-- |         337.00 |    70.7700 |        266.2300 |
-- |         216.00 |    45.3600 |        170.6400 |
-- |        2286.00 |   480.0600 |       1805.9400 |
-- |         320.00 |    67.2000 |        252.8000 |
-- |         200.00 |    42.0000 |        158.0000 |
-- |         200.00 |    42.0000 |        158.0000 |
-- |          68.00 |    14.2800 |         53.7200 |
-- |          42.00 |     8.8200 |         33.1800 |
-- |          36.00 |     7.5600 |         28.4400 |
-- |          18.00 |     3.7800 |         14.2200 |
-- |          24.00 |     5.0400 |         18.9600 |
-- |         313.00 |    65.7300 |        247.2700 |
-- |        2620.00 |   550.2000 |       2069.8000 |
-- |         132.00 |    27.7200 |        104.2800 |
-- |          90.00 |    18.9000 |         71.1000 |
-- |          30.00 |     6.3000 |         23.7000 |
-- |          20.00 |     4.2000 |         15.8000 |
-- |        1395.00 |   292.9500 |       1102.0500 |
-- |         432.00 |    90.7200 |        341.2800 |
-- |         380.00 |    79.8000 |        300.2000 |
-- |        2250.00 |   472.5000 |       1777.5000 |
-- |          30.00 |     6.3000 |         23.7000 |
-- |         360.00 |    75.6000 |        284.4000 |
-- |         240.00 |    50.4000 |        189.6000 |
-- |         100.00 |    21.0000 |         79.0000 |
-- |         100.00 |    21.0000 |         79.0000 |
-- |         280.00 |    58.8000 |        221.2000 |
-- |          40.00 |     8.4000 |         31.6000 |
-- |         102.00 |    21.4200 |         80.5800 |
-- |         500.00 |   105.0000 |        395.0000 |
-- |         100.00 |    21.0000 |         79.0000 |
-- |          25.00 |     5.2500 |         19.7500 |
-- |          16.00 |     3.3600 |         12.6400 |
-- |         884.00 |   185.6400 |        698.3600 |
-- |         500.00 |   105.0000 |        395.0000 |
-- |        3120.00 |   655.2000 |       2464.8000 |
-- |        4130.00 |   867.3000 |       3262.7000 |
-- |        9310.00 |  1955.1000 |       7354.9000 |
-- |        2120.00 |   445.2000 |       1674.8000 |
-- |         975.00 |   204.7500 |        770.2500 |
-- |         950.00 |   199.5000 |        750.5000 |
-- |        1239.00 |   260.1900 |        978.8100 |
-- |         840.00 |   176.4000 |        663.6000 |
-- |         570.00 |   119.7000 |        450.3000 |
-- |       15104.00 |  3171.8400 |      11932.1600 |
-- |        3520.00 |   739.2000 |       2780.8000 |
-- |        2205.00 |   463.0500 |       1741.9500 |
-- |         950.00 |   199.5000 |        750.5000 |
-- |         468.00 |    98.2800 |        369.7200 |
-- |         485.00 |   101.8500 |        383.1500 |
-- |         128.00 |    26.8800 |        101.1200 |
-- |       73510.00 | 15437.1000 |      58072.9000 |
-- |         150.00 |    31.5000 |        118.5000 |
-- |          30.00 |     6.3000 |         23.7000 |
-- |         517.00 |   108.5700 |        408.4300 |
-- +----------------+------------+-----------------+

-- Consulta 54

SELECT pr.nombre, dp.cantidad, SUM(dp.precio_unidad * dp.cantidad) AS "Total Facturado", SUM(dp.precio_unidad * dp.cantidad) - SUM(dp.precio_unidad * dp.cantidad) * 0.21 AS "Total con IVA" FROM producto pr JOIN detalle_pedido dp ON dp.codigo_producto = pr.codigo_producto GROUP BY pr.nombre HAVING SUM(dp.precio_unidad * dp.cantidad) > 3000;

-- +---------------------------+----------+-----------------+---------------+
-- | nombre                    | cantidad | Total Facturado | Total con IVA |
-- +---------------------------+----------+-----------------+---------------+
-- | Beucarnea Recurvata       |       80 |         7250.00 |     5727.5000 |
-- | Bismarckia Nobilis        |       30 |         9310.00 |     7354.9000 |
-- | Camelia japonica ejemplar |        2 |         3237.00 |     2557.2300 |
-- | Cerezo                    |       10 |        22216.00 |    17550.6400 |
-- | Chamaerops Humilis        |       67 |        16514.00 |    13046.0600 |
-- | Dracaena Drago            |        5 |         3520.00 |     2780.8000 |
-- | Kaki                      |        4 |         5463.00 |     4315.7700 |
-- | Limonero 30/40            |       10 |        13092.00 |    10342.6800 |
-- | Trachycarpus Fortunei     |        5 |        73510.00 |    58072.9000 |
-- +---------------------------+----------+-----------------+---------------+

-- Consulta 55

SELECT nombre_cliente, limite_credito FROM cliente WHERE limite_credito = (SELECT max(limite_credito) FROM cliente);

-- +----------------+----------------+
-- | nombre_cliente | limite_credito |
-- +----------------+----------------+
-- | Tendo Garden   |      600000.00 |
-- +----------------+----------------+

-- Consulta 57

SELECT pr.nombre, dp.cantidad FROM producto pr JOIN detalle_pedido dp WHERE dp.cantidad >= ALL (SELECT cantidad FROM detalle_pedido) ORDER BY pr.nombre DESC LIMIT 1;

-- Consulta 59

SELECT nombre FROM producto WHERE cantidad_en_stock = (SELECT max(cantidad_en_stock) FROM producto);

-- +---------------------------------+
-- | nombre                          |
-- +---------------------------------+
-- | Rosal copa                      |
-- | Albaricoquero Corbato           |
-- | Albaricoquero Moniqui           |
-- | Albaricoquero Kurrot            |
-- | Cerezo Burlat                   |
-- | Cerezo Picota                   |
-- | Cerezo Napole?n                 |
-- | Ciruelo R. Claudia Verde        |
-- | Ciruelo Santa Rosa              |
-- | Ciruelo Golden Japan            |
-- | Ciruelo Friar                   |
-- | Ciruelo Reina C. De Ollins      |
-- | Ciruelo Claudia Negra           |
-- | Granado Mollar de Elche         |
-- | Higuera Napolitana              |
-- | Higuera Verdal                  |
-- | Higuera Breva                   |
-- | Manzano Starking Delicious      |
-- | Manzano Reineta                 |
-- | Manzano Golden Delicious        |
-- | Membrillero Gigante de Wranja   |
-- | Melocotonero Spring Crest       |
-- | Melocotonero Amarillo de Agosto |
-- | Melocotonero Federica           |
-- | Melocotonero Paraguayo          |
-- | Nogal Com?n                     |
-- | Parra Uva de Mesa               |
-- | Peral Castell                   |
-- | Peral Williams                  |
-- | Peral Conference                |
-- | Peral Blanq. de Aranjuez        |
-- | N?spero Tanaca                  |
-- | Olivo Cipresino                 |
-- | Nectarina                       |
-- | Kaki Rojo Brillante             |
-- +---------------------------------+

SELECT nombre FROM producto WHERE cantidad_en_stock = (SELECT min(cantidad_en_stock) FROM producto);

-- +---------------+
-- | nombre        |
-- +---------------+
-- | Brahea Armata |
-- +---------------+

-- Consulta 60

-- 60 a 80

-- Consulta 64

SELECT pr.codigo_producto FROM producto pr JOIN detalle_pedido dp ON pr.codigo_producto = dp.codigo_producto JOIN pedido p ON p.codigo_pedido = dp.codigo_pedido WHERE pr.codigo_producto IN (SELECT codigo_producto FROM detalle_pedido WHERE precio_unidad < 25000);

-- +-----------------+
-- | codigo_producto |
-- +-----------------+
-- | FR-106          |
-- | FR-108          |
-- | FR-11           |
-- | AR-001          |
-- | AR-008          |
-- | FR-106          |
-- | FR-69           |
-- | AR-006          |
-- | OR-247          |
-- | AR-009          |
-- | FR-77           |
-- | FR-9            |
-- | FR-94           |
-- | FR-67           |
-- | FR-67           |
-- | FR-67           |
-- | FR-67           |
-- | FR-67           |
-- | FR-67           |
-- | FR-82           |
-- | FR-91           |
-- | OR-234          |
-- | FR-15           |
-- | OR-188          |
-- | OR-218          |
-- | OR-101          |
-- | OR-102          |
-- | OR-186          |
-- | FR-11           |
-- | OR-213          |
-- | OR-247          |
-- | OR-102          |
-- | OR-139          |
-- | OR-172          |
-- | OR-177          |
-- | FR-67           |
-- | FR-67           |
-- | FR-67           |
-- | FR-67           |
-- | 11679           |
-- | 21636           |
-- | 22225           |
-- | OR-128          |
-- | OR-193          |
-- | FR-17           |
-- | FR-29           |
-- | OR-214          |
-- | OR-247          |
-- | FR-7            |
-- | OR-172          |
-- | OR-174          |
-- | 21636           |
-- | FR-47           |
-- | OR-165          |
-- | OR-181          |
-- | OR-225          |
-- | FR-105          |
-- | FR-57           |
-- | OR-176          |
-- | FR-67           |
-- | OR-127          |
-- | OR-141          |
-- | OR-241          |
-- | OR-99           |
-- | FR-40           |
-- | OR-140          |
-- | OR-141          |
-- | OR-159          |
-- | OR-227          |
-- | OR-247          |
-- | FR-48           |
-- | OR-122          |
-- | OR-123          |
-- | OR-213          |
-- | OR-217          |
-- | OR-218          |
-- | FR-31           |
-- | FR-34           |
-- | FR-40           |
-- | OR-152          |
-- | OR-155          |
-- | OR-156          |
-- | OR-157          |
-- | OR-222          |
-- | AR-002          |
-- | FR-107          |
-- | FR-85           |
-- | OR-249          |
-- | 11679           |
-- | 21636           |
-- | FR-11           |
-- | FR-100          |
-- | FR-13           |
-- | FR-84           |
-- | OR-101          |
-- | OR-156          |
-- | OR-203          |
-- | 30310           |
-- | FR-36           |
-- | 11679           |
-- | 22225           |
-- | FR-37           |
-- | FR-64           |
-- | OR-136          |
-- | 22225           |
-- | FR-22           |
-- | OR-159          |
-- | 30310           |
-- | FR-23           |
-- | FR-75           |
-- | FR-84           |
-- | OR-208          |
-- | 11679           |
-- | 30310           |
-- | 21636           |
-- | FR-18           |
-- | FR-53           |
-- | OR-240          |
-- | AR-004          |
-- | FR-108          |
-- | FR-12           |
-- | FR-72           |
-- | FR-89           |
-- | OR-120          |
-- | AR-009          |
-- | FR-102          |
-- | FR-85           |
-- | FR-86           |
-- | OR-116          |
-- | OR-129          |
-- | OR-130          |
-- | OR-179          |
-- | OR-196          |
-- | OR-207          |
-- | OR-250          |
-- | FR-69           |
-- | FR-81           |
-- | FR-84           |
-- | FR-94           |
-- | 22225           |
-- | FR-1            |
-- | FR-23           |
-- | OR-241          |
-- | FR-82           |
-- | FR-9            |
-- | FR-94           |
-- | OR-129          |
-- | OR-160          |
-- | 30310           |
-- | FR-1            |
-- | OR-147          |
-- | OR-203          |
-- | OR-99           |
-- | 11679           |
-- | FR-100          |
-- | FR-18           |
-- | FR-79           |
-- | OR-116          |
-- | OR-123          |
-- | OR-168          |
-- | OR-115          |
-- | OR-213          |
-- | OR-227          |
-- | OR-243          |
-- | OR-247          |
-- | FR-67           |
-- | OR-227          |
-- | OR-247          |
-- | AR-006          |
-- | FR-87           |
-- | OR-157          |
-- | AR-009          |
-- | FR-79           |
-- | FR-87           |
-- | FR-94           |
-- | OR-196          |
-- | 22225           |
-- | 30310           |
-- | FR-53           |
-- | FR-85           |
-- | OR-157          |
-- | OR-208          |
-- | OR-157          |
-- | OR-227          |
-- | FR-87           |
-- | FR-94           |
-- | AR-006          |
-- | AR-009          |
-- | 22225           |
-- | 30310           |
-- | FR-53           |
-- | OR-208          |
-- | FR-67           |
-- | FR-67           |
-- | FR-67           |
-- | FR-67           |
-- | FR-67           |
-- | 11679           |
-- | 21636           |
-- | 22225           |
-- | 30310           |
-- | AR-001          |
-- | AR-002          |
-- | AR-003          |
-- | AR-004          |
-- | AR-005          |
-- | AR-006          |
-- | AR-007          |
-- | AR-008          |
-- | AR-009          |
-- | AR-010          |
-- | FR-1            |
-- | FR-10           |
-- | FR-100          |
-- | FR-101          |
-- | FR-102          |
-- | FR-103          |
-- | OR-234          |
-- | OR-236          |
-- | OR-237          |
-- | OR-204          |
-- | OR-205          |
-- | OR-206          |
-- | OR-225          |
-- | OR-226          |
-- | OR-227          |
-- | OR-209          |
-- | OR-210          |
-- | OR-211          |
-- | FR-67           |
-- | AR-001          |
-- | AR-002          |
-- | AR-003          |
-- | FR-100          |
-- | FR-101          |
-- | FR-102          |
-- | FR-108          |
-- | FR-11           |
-- | FR-12           |
-- | FR-54           |
-- | FR-58           |
-- | FR-60           |
-- | 11679           |
-- | FR-11           |
-- | OR-240          |
-- | FR-11           |
-- | FR-36           |
-- | OR-136          |
-- | OR-208          |
-- | OR-227          |
-- | OR-208          |
-- | FR-53           |
-- | OR-208          |
-- | FR-85           |
-- | OR-157          |
-- | OR-227          |
-- | OR-240          |
-- | AR-009          |
-- | OR-136          |
-- | 30310           |
-- | FR-11           |
-- | FR-67           |
-- | FR-67           |
-- | FR-67           |
-- | FR-67           |
-- | FR-67           |
-- | FR-108          |
-- | FR-42           |
-- | FR-66           |
-- | FR-87           |
-- | OR-157          |
-- | FR-10           |
-- | FR-75           |
-- | FR-82           |
-- | FR-43           |
-- | FR-6            |
-- | FR-71           |
-- | FR-90           |
-- | FR-41           |
-- | FR-54           |
-- | OR-156          |
-- | FR-33           |
-- | FR-56           |
-- | FR-60           |
-- | FR-8            |
-- | FR-85           |
-- | FR-67           |
-- | FR-67           |
-- | FR-67           |
-- | FR-67           |
-- | FR-67           |
-- | FR-22           |
-- | FR-36           |
-- | FR-45           |
-- | OR-104          |
-- | OR-119          |
-- | OR-125          |
-- | OR-130          |
-- | AR-010          |
-- | FR-1            |
-- | FR-16           |
-- | 21636           |
-- | AR-001          |
-- | AR-005          |
-- | FR-33           |
-- | OR-200          |
-- | FR-78           |
-- | FR-80           |
-- | OR-146          |
-- | OR-179          |
-- | AR-004          |
-- | OR-150          |
-- +-----------------+

-- Consulta 65

SELECT c.codigo_cliente FROM cliente c JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado JOIN pedido p ON p.codigo_cliente = c.codigo_cliente JOIN detalle_pedido dp ON dp.codigo_pedido = p.codigo_pedido WHERE c.codigo_empleado_rep_ventas = (SELECT codigo_empleado FROM empleado WHERE nombre = "Ana" AND apellido1 = "Bustamante") AND dp.cantidad < 3000;

-- Consulta 69

SELECT concat(nombre, " ", e.apellido1, " ", e.apellido2) AS "Nombre y apellidos", e.email FROM empleado e WHERE e.codigo_jefe = (SELECT codigo_empleado FROM empleado WHERE nombre = 'Alberto' AND apellido1 = 'Soria');

-- +---------------------------+---------------------------+
-- | Nombre y apellidos        | email                     |
-- +---------------------------+---------------------------+
-- | Felipe Rosas Marquez      | frosas@jardineria.es      |
-- | Juan Carlos Ortiz Serrano | cortiz@jardineria.es      |
-- | Carlos Soria Jimenez      | csoria@jardineria.es      |
-- | Emmanuel Maga?a Perez     | manu@jardineria.es        |
-- | Francois Fignon           | ffignon@gardening.com     |
-- | Michael Bolton            | mbolton@gardening.com     |
-- | Hilary Washington         | hwashington@gardening.com |
-- | Nei Nishikori             | nnishikori@gardening.com  |
-- | Amy Johnson               | ajohnson@gardening.com    |
-- | Kevin Fallmer             | kfalmer@gardening.com     |
-- +---------------------------+---------------------------+

-- Consulta 70

SELECT nombre_cliente, codigo_cliente, limite_credito FROM cliente WHERE limite_credito >= ALL (SELECT limite_credito FROM cliente);

SELECT nombre_cliente, codigo_cliente, limite_credito FROM cliente WHERE limite_credito >= ANY (SELECT max(limite_credito) FROM cliente); --cp

-- +----------------+----------------+----------------+
-- | nombre_cliente | codigo_cliente | limite_credito |
-- +----------------+----------------+----------------+
-- | Tendo Garden   |              5 |      600000.00 |
-- +----------------+----------------+----------------+

-- Consulta 78

SELECT c.nombre_cliente FROM cliente c WHERE NOT EXISTS (SELECT codigo_cliente FROM pago p WHERE p.codigo_cliente = c.codigo_cliente);

-- +-----------------------------+
-- | nombre_cliente              |
-- +-----------------------------+
-- | Lasas S.A.                  |
-- | Club Golf Puerta del hierro |
-- | DaraDistribuciones          |
-- | Madrile?a de riegos         |
-- | Lasas S.A.                  |
-- | Flowers, S.A                |
-- | Naturajardin                |
-- | Americh Golf Management SL  |
-- | Aloha                       |
-- | El Prat                     |
-- | Vivero Humanes              |
-- | Fuenla City                 |
-- | Top Campo                   |
-- | Campohermoso                |
-- | france telecom              |
-- | Mus?e du Louvre             |
-- | Flores S.L.                 |
-- | The Magic Garden            |
-- | Pablo Rodrigues Inc.        |
-- +-----------------------------+

-- Consulta 79

SELECT c.nombre_cliente FROM cliente c WHERE EXISTS (SELECT codigo_cliente FROM pago p WHERE p.codigo_cliente = c.codigo_cliente);

-- +--------------------------------+
-- | nombre_cliente                 |
-- +--------------------------------+
-- | GoldFish Garden                |
-- | Gardening Associates           |
-- | Gerudo Valley                  |
-- | Tendo Garden                   |
-- | Beragua                        |
-- | Naturagua                      |
-- | Camunas Jardines S.L.          |
-- | Dardena S.A.                   |
-- | Jardin de Flores               |
-- | Flores Marivi                  |
-- | Golf S.A.                      |
-- | Sotogrande                     |
-- | Jardines y Mansiones Cactus SL |
-- | Jardiner?as Mat?as SL          |
-- | Agrojardin                     |
-- | Jardineria Sara                |
-- | Tutifruti S.A                  |
-- | El Jardin Viviente S.L         |
-- +--------------------------------+