-- 1
SELECT * FROM productos;

-- 2
SELECT COUNT(id_cliente) FROM clientes;

-- 3
SELECT nombre,precio FROM productos;

-- 4
SELECT AVG(precio) AS promedio_precio FROM productos;

-- 5
SELECT SUM(stock) FROM productos;

-- 6
SELECT COUNT(numero_pc)  FROM computadoras;

-- 7
SELECT SUM(costo) FROM usos;

-- 8 
SELECT SUM(cantidad) FROM ventas;

-- 9
SELECT SUM(total) FROM ventas;

-- 10
SELECT total,id_venta FROM ventas;

-- 11
SELECT AVG(costo) AS promedio_costo FROM usos;

-- 12
SELECT fecha,COUNT(*) AS cantidad_usos FROM usos GROUP BY fecha;

-- 13
SELECT COUNT(id_producto) FROM productos;

-- 14
SELECT id_producto,SUM(cantidad) AS total_vendido FROM ventas GROUP BY id_producto;

-- 15
SELECT AVG(ram_gb) AS promedio_ram FROM computadoras;



