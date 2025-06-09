USE ecommerce_arg;

-- 1- Mostrar el nombre completo del cliente y la fecha de cada orden que haya realizado.
SELECT 
	u.nombre,
    u.apellido,
    o.fecha_orden
FROM usuarios AS u 
INNER JOIN ordenes AS o ON u.id_usuario = o.id_usuario;

-- 2- Listar los nombres de los productos, cantidades y precios unitarios de cada producto vendido en órdenes.

SELECT
	p.nombre,
    dt.cantidad,
	dt.id_detalle,
    dt.id_producto,
    dt.precio_unitario
FROM detalle_orden as dt
INNER JOIN productos AS p ON dt.id_producto = p.id_producto; 

-- 3- Obtener los datos de usuarios que realizaron órdenes con estado 'Entregado'.
SELECT 
	u.id_usuario,
    u.nombre,
    u.email,
    u.direccion,
    o.estado
FROM usuarios as u
INNER JOIN ordenes AS o ON u.id_usuario = o.id_usuario
WHERE estado = "Entregado";
    
-- 4- Mostrar el nombre de cada producto vendido junto con el nombre y apellido del cliente que lo compró.

SELECT 
	p.nombre,
    u.nombre,
    u.apellido
FROM usuarios as u
INNER JOIN ordenes AS o ON u.id_usuario = o.id_usuario
INNER JOIN detalle_orden as dt ON o.id_orden = dt.id_orden
INNER JOIN productos AS p ON dt.id_producto = p.id_producto;

-- 5- Listar todos los pagos realizados, junto con el nombre del cliente y la fecha del pedido asociado.

SELECT 
	p.id_pago,
    u.nombre,
    u.apellido,
    o.fecha_orden,
    p.metodo_pago,
    p.monto,
    p.confirmado
FROM pagos AS p
INNER JOIN ordenes AS o ON p.id_orden = o.id_orden
INNER JOIN usuarios AS u ON o.id_usuario = u.id_usuario;
	
-- 6- Listar todos los productos, incluso los que no han sido vendidos (es decir, no tienen registros en detalle_orden).
SELECT 
	p.id_producto,
    p.nombre,
    p.stock,
    p.precio,
    dt.id_detalle
FROM productos AS p
LEFT JOIN detalle_orden AS dt ON p.id_producto = dt.id_producto;

-- 7- Mostrar todos los usuarios junto con los detalles de sus órdenes, si es que realizaron alguna.

SELECT 
	u.id_usuario,
    u.nombre AS nombre_usuario,
    u.apellido,
    o.id_orden,
    o.fecha_orden,
    o.estado,
    dt.id_detalle,
    dt.id_producto,
    dt.cantidad,
    dt.precio_unitario
FROM usuarios AS u
LEFT JOIN ordenes AS o ON o.id_usuario = u.id_usuario
LEFT JOIN detalle_orden AS dt ON o.id_orden = dt.id_orden;

-- 8- Listar todas las órdenes, incluyendo aquellas que aún no tienen un pago confirmado.

SELECT 
	o.id_orden,
    o.fecha_orden,
    o.estado,
    o.total,
    p.id_pago,
    p.fecha_pago,
    p.metodo_pago,
    p.monto,
    p.confirmado
FROM ordenes AS o
LEFT JOIN pagos AS p ON o.id_orden = p.id_orden;

-- 9- Mostrar todas las órdenes con su total, y el método de pago si es que existe un pago registrado.

SELECT 
	o.id_orden,
    o.total,
    p.metodo_pago
FROM ordenes AS o
LEFT JOIN pagos AS p ON o.id_orden = p.id_orden;

-- 10 -Listar todas las órdenes con la información del usuario, incluso si el usuario fue eliminado (simular caso de datos huérfanos).
SELECT 
	o.id_orden,
    o.fecha_orden,
    o.total,
    u.id_usuario,
    u.nombre,
    u.apellido,
    u.email
FROM ordenes AS o
LEFT JOIN usuarios AS u ON o.id_usuario = u.id_usuario;

-- 11- Mostrar todos los productos comprados (de detalle_orden) junto con su descripción, incluso si el producto ya fue eliminado.

SELECT 
	dt.id_detalle,
    dt.cantidad,
    dt.precio_unitario,
    p.id_producto,
    p.nombre,
    p.descripcion
FROM productos AS p
RIGHT JOIN detalle_orden AS dt ON p.id_producto = dt.id_producto; 

-- 12- Obtener todas las entradas en detalle_orden con su respectiva orden, mostrando incluso aquellas líneas de detalle sin coincidencia válida en ordenes.
SELECT 
	*
FROM ordenes AS o
RIGHT JOIN detalle_orden AS dt ON dt.id_orden = o.id_orden;

    
-- 13- Generar un listado de todas las combinaciones posibles de productos y métodos de pago disponibles (Tarjeta, Transferencia, Efectivo).






	
