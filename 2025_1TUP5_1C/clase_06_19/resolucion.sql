USE ecommerce_arg; 

CREATE TEMPORARY TABLE tmp_ventas_marzo2025 AS
SELECT
  p.id_producto,
  p.nombre,
  SUM(d.cantidad)             AS unidades_vendidas,
  SUM(d.cantidad * d.precio_unitario) AS importe_acumulado
FROM detalle_orden d
JOIN ordenes o ON d.id_orden = o.id_orden
JOIN productos p ON d.id_producto = p.id_producto
WHERE o.fecha_orden BETWEEN '2025-03-01' AND '2025-03-31'
GROUP BY p.id_producto, p.nombre;

CREATE TEMPORARY TABLE tmp_clientes_top10 AS
SELECT
  c.id_cliente,
  CONCAT(c.nombre, ' ', c.apellido) AS nombre_completo,
  COUNT(*)                   AS num_ordenes
FROM ordenes o
JOIN clientes c ON o.id_cliente = c.id_cliente
WHERE o.fecha_orden BETWEEN DATE_SUB(CURDATE(), INTERVAL 3 MONTH) AND CURDATE()
GROUP BY c.id_cliente, nombre_completo
ORDER BY num_ordenes DESC
LIMIT 10;

CREATE TEMPORARY TABLE tmp_pagos_pendientes AS
SELECT
  o.id_orden,
  o.fecha_orden,
  o.id_cliente,
  o.total,
  p.metodo_pago
FROM ordenes o
JOIN pagos p ON o.id_orden = p.id_orden
WHERE p.confirmado = FALSE;

CREATE TEMPORARY TABLE tmp_margen_productos AS
SELECT
  p.id_producto,
  p.nombre,
  AVG(d.precio_unitario - p.costo_unitario) AS margen_medio
FROM detalle_orden d
JOIN productos p ON d.id_producto = p.id_producto
GROUP BY p.id_producto, p.nombre
ORDER BY margen_medio DESC
LIMIT 5;

CREATE TEMPORARY TABLE tmp_devoluciones_abril2025 AS
SELECT
  id_devolucion,
  id_orden,
  id_producto,
  cantidad,
  motivo
FROM devoluciones
WHERE DATE(fecha_devolucion) BETWEEN '2025-04-01' AND '2025-04-30';

CREATE TEMPORARY TABLE tmp_facturacion_por_region AS
SELECT
  dc.region,
  SUM(o.total) AS total_facturado
FROM ordenes o
JOIN direcciones_cliente dc ON o.id_direccion_envio = dc.id_direccion
GROUP BY dc.region;

CREATE TEMPORARY TABLE tmp_ventas_diarias AS
SELECT
  DATE(o.fecha_orden)       AS dia,
  COUNT(*)                  AS num_ordenes,
  SUM(o.total)              AS total_ventas
FROM ordenes o
WHERE o.fecha_orden >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY dia
ORDER BY dia;

CREATE TEMPORARY TABLE tmp_productos_sin_movimiento AS
SELECT
  p.id_producto,
  p.nombre
FROM productos p
LEFT JOIN detalle_orden d
  ON p.id_producto = d.id_producto
     AND d.fecha_orden >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
WHERE d.id_producto IS NULL;

CREATE TEMPORARY TABLE tmp_ticket_promedio_clientes AS
SELECT
  c.id_cliente,
  CONCAT(c.nombre, ' ', c.apellido) AS nombre_completo,
  AVG(o.total)                 AS ticket_promedio
FROM ordenes o
JOIN clientes c ON o.id_cliente = c.id_cliente
GROUP BY c.id_cliente, nombre_completo
HAVING ticket_promedio > 100;

CREATE TEMPORARY TABLE tmp_top3_categorias AS
SELECT
  cat.id_categoria,
  cat.nombre                AS nombre_categoria,
  SUM(d.cantidad * d.precio_unitario) AS facturacion_total
FROM detalle_orden d
JOIN productos p ON d.id_producto = p.id_producto
JOIN categorias cat ON p.id_categoria = cat.id_categoria
GROUP BY cat.id_categoria, nombre_categoria
ORDER BY facturacion_total DESC
LIMIT 3;
