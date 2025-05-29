USE ciber_rosarino;

-- Inner Join (Interseccion entre A y B)
-- Nos trae todas las filas en las que haya coincidencia entre los dos atributos
-- de las dos tablas.

SELECT
	*
FROM clientes as c
INNER JOIN usos AS u
	ON c.id_cliente = u.id_cliente
ORDER BY u.fecha;

-- Left Join (Union entre A y B - B)
-- Incluye todas las filas de la tabla izquierda
-- solo donde haya coincidencia con la tabla derecha.

-- ¿Que sucede si hay un cliente que no compró?
-- Se rellena con NULL.
SELECT
	c.id_cliente,
    c.nombre,
    c.apellido,
    v.total
FROM clientes AS c
LEFT JOIN ventas as v
	ON c.id_cliente = v.id_cliente
ORDER BY c.id_cliente;


-- Right Join (Union entre A y B - A)
-- Incluye todas las filas de la tabla derecha
-- solo donde haya coincidencia con la tabla izquierda.
SELECT
	c.id_cliente,
    c.nombre,
    c.apellido,
    v.total
FROM clientes AS c
RIGHT JOIN ventas as v
	ON c.id_cliente = v.id_cliente
ORDER BY c.id_cliente;

-- Full Outer Join ((A + B) - Union de A y B)
-- Esto no existe en MySQL, pero se puede simular.

SELECT
	*
FROM clientes AS c
LEFT JOIN ventas as v
	ON c.id_cliente = v.id_cliente

UNION ALL

SELECT
	*
FROM clientes AS c
RIGHT JOIN ventas as v
	ON c.id_cliente = v.id_cliente;
    
-- Cross Join (Producto cartesiano entre las filas)
SELECT 
	c.nombre as cliente,
    p.nombre AS producto
FROM clientes AS c
CROSS JOIN productos AS p;

SELECT COUNT(*) FROM clientes; # 31
SELECT COUNT(*) FROM productos; # 30
SELECT COUNT(*) FROM (
	SELECT 
		c.nombre as cliente,
		p.nombre AS producto
	FROM clientes AS c
	CROSS JOIN productos AS p
) as c; # 930

# A = {1, 2, 3} y B = {5, 6}
# A (x) B = {(1, 5), (1, 6), (2, 5), (2, 6), (3, 5), (3, 6)}

-- Ejercicios de práctica
-- =====================================================
-- EJERCICIO 1: INNER JOIN
-- Objetivo:
--   Listar el nombre y apellido de cada cliente junto con
--   la marca de la PC que utilizó el 2023-06-12.
-- Tablas:
--   clientes c, usos u, computadoras pc
-- Condición de filtrado:
--   u.fecha = '2023-06-12'
-- -----------------------------------------------------

SELECT 
	c.nombre,
    c.apellido,
    pc.marca
FROM usos AS u 
INNER JOIN clientes AS c ON u.id_cliente = c.id_cliente
INNER JOIN computadoras AS pc ON u.id_pc = pc.id_pc
WHERE u.fecha = '2023-06-12';

-- =====================================================
-- EJERCICIO 2: LEFT JOIN
-- Objetivo:
--   Mostrar todos los clientes y la cantidad de usos que
--   han realizado (incluir 0 para los que no usaron PCs).
-- Tablas:
--   clientes c, usos u
-- -----------------------------------------------------

SELECT 
	c.id_cliente,
    c.nombre,
    c.apellido,
    COUNT(u.id_uso) AS cantidad_usos
FROM clientes AS c
LEFT JOIN usos AS u ON c.id_cliente =  u.id_cliente
GROUP BY c.id_cliente, c.nombre, c.apellido
ORDER BY cantidad_usos DESC; 



-- =====================================================
-- EJERCICIO 3: RIGHT JOIN
-- Objetivo:
--   Listar todas las computadoras y el nombre del cliente
--   que la utilizó por última vez (NULL si nunca fue usada).
-- Tablas:
--   computadoras pc, usos u, clientes c
-- -----------------------------------------------------
SELECT 
    pc.id_pc,
    c.nombre,
    u.fecha,
    u.hora_inicio
FROM usos u
RIGHT JOIN computadoras AS pc ON u.id_pc = pc.id_pc
RIGHT JOIN clientes AS c ON u.id_cliente = c.id_cliente;


-- =====================================================
-- EJERCICIO 4: CROSS JOIN
-- Objetivo:
--   Generar todas las combinaciones posibles entre los
--   primeros 5 clientes y los primeros 5 productos.
-- Tablas:
--   clientes c, productos p
-- -----------------------------------------------------
SELECT 
    c.id_cliente,
    c.nombre,
    p.id_producto,
    p.nombre AS nombre_producto
FROM clientes AS c
CROSS JOIN productos AS p
LIMIT 25;
