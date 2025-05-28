SELECT * FROM productos;

SELECT COUNT(*) AS cantidad_clientes FROM clientes;

SELECT nombre, precio FROM productos;

SELECT AVG(precio) AS precio_promedio FROM productos;

SELECT SUM(stock) AS stock_total FROM productos;

SELECT COUNT(*) AS cantidad_computadoras FROM computadoras;

SELECT SUM(costo) AS total_uso_computadoras FROM usos;

SELECT COUNT(*) AS total_ventas FROM ventas;

SELECT SUM(total) AS recaudacion_total FROM ventas;

SELECT id_venta, total FROM ventas;

SELECT AVG(costo) AS promedio_costo_uso FROM usos;

SELECT fecha, COUNT(*) AS cantidad_usos FROM usos GROUP BY fecha;

SELECT COUNT(*) AS cantidad_productos FROM productos;

SELECT id_producto, COUNT(*) AS veces_vendido FROM ventas GROUP BY id_producto;

SELECT AVG(ram_gb) AS promedio_ram FROM computadoras;
