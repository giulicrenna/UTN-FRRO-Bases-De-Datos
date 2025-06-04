SELECT u.nombre, u.apellido, o.fecha_orden
FROM usuarios u
INNER JOIN ordenes o ON u.id_usuario = o.id_usuario;

SELECT p.nombre AS producto, d.cantidad, d.precio_unitario
FROM detalle_orden d
INNER JOIN productos p ON d.id_producto = p.id_producto;

SELECT DISTINCT u.*
FROM usuarios u
INNER JOIN ordenes o ON u.id_usuario = o.id_usuario
WHERE o.estado = 'Entregado';

SELECT p.nombre AS producto, u.nombre AS cliente_nombre, u.apellido AS cliente_apellido
FROM detalle_orden d
INNER JOIN productos p ON d.id_producto = p.id_producto
INNER JOIN ordenes o ON d.id_orden = o.id_orden
INNER JOIN usuarios u ON o.id_usuario = u.id_usuario;

SELECT u.nombre, u.apellido, p.fecha_pago, o.fecha_orden
FROM pagos p
INNER JOIN ordenes o ON p.id_orden = o.id_orden
INNER JOIN usuarios u ON o.id_usuario = u.id_usuario;

SELECT p.nombre, d.id_producto
FROM productos p
LEFT JOIN detalle_orden d ON p.id_producto = d.id_producto
WHERE d.id_producto IS NULL;

SELECT u.nombre, u.apellido, o.id_orden, o.total
FROM usuarios u
LEFT JOIN ordenes o ON u.id_usuario = o.id_usuario;

SELECT o.id_orden, o.total, p.confirmado
FROM ordenes o
LEFT JOIN pagos p ON o.id_orden = p.id_orden;

SELECT o.id_orden, o.total, p.metodo_pago
FROM ordenes o
LEFT JOIN pagos p ON o.id_orden = p.id_orden;

SELECT o.id_orden, o.total, u.nombre, u.apellido
FROM usuarios u
RIGHT JOIN ordenes o ON u.id_usuario = o.id_usuario;

SELECT d.id_detalle, d.cantidad, p.nombre AS producto
FROM productos p
RIGHT JOIN detalle_orden d ON p.id_producto = d.id_producto;

SELECT d.*, o.fecha_orden
FROM ordenes o
RIGHT JOIN detalle_orden d ON o.id_orden = d.id_orden;

SELECT p.nombre, m.metodo
FROM productos p
CROSS JOIN (
    SELECT 'Tarjeta' AS metodo
    UNION SELECT 'Transferencia'
    UNION SELECT 'Efectivo'
) AS m;

SELECT u.nombre, u.apellido, p.nombre AS producto
FROM usuarios u
CROSS JOIN productos p;

SELECT u.nombre, u.apellido, m.metodo
FROM usuarios u
CROSS JOIN (
    SELECT 'Tarjeta' AS metodo
    UNION SELECT 'Transferencia'
    UNION SELECT 'Efectivo'
) AS m;
