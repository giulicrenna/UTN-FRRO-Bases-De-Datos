/*
CREATE DATABASE IF NOT EXISTS empresatecnologia;

USE empresatecnologia;

CREATE TABLE IF NOT EXISTS clientes (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    dni VARCHAR(8) NOT NULL,
    email VARCHAR(50) NOT NULL,
    fecha_registro DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS productos (
	id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    categoria VARCHAR(20) NOT NULL,
    precio DECIMAL(10,2) CHECK (precio > 0),
    stock INT CHECK (stock >= 0)
);

CREATE TABLE IF NOT EXISTS empleados (
	id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    puesto VARCHAR(50),
    salario DECIMAL(10,2) CHECK (salario > 0)
);

CREATE TABLE IF NOT EXISTS ventas (
	id_venta INT PRIMARY KEY,
    fecha_venta DATETIME NOT NULL,
    id_cliente INT,
    id_empleado INT,
    FOREIGN KEY (id_cliente) REFERENCES empresatecnologia.clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empresatecnologia.empleados(id_empleado)
);

CREATE TABLE IF NOT EXISTS detalle_venta (
	id_venta INT,
    id_producto INT,
    cantidad INT CHECK (cantidad > 0),
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES empresatecnologia.ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES empresatecnologia.productos(id_producto),
    PRIMARY KEY (id_venta, id_producto)
);

INSERT INTO clientes (nombre, apellido, dni, email, fecha_registro) VALUES
('Juan', 'Perez', '12345678', 'juan.perez@email.com', '2023-01-15'),
('Maria', 'Gomez', '87654321', 'maria.gomez@email.com', '2023-02-20'),
('Carlos', 'Lopez', '11223344', 'carlos.lopez@email.com', '2023-03-10'),
('Ana', 'Diaz', '44332211', 'ana.diaz@email.com', '2023-04-05'),
('Pedro', 'Ruiz', '55667788', 'pedro.ruiz@email.com', '2023-05-12');

INSERT INTO productos (nombre, categoria, precio, stock) VALUES
('Laptop Pro', 'Computadoras', 1200.00, 50),
('Smartphone X', 'Moviles', 800.00, 120),
('Auriculares BT', 'Accesorios', 75.00, 300),
('Smartwatch S', 'Wearables', 250.00, 80),
('Tablet Pad', 'Tablets', 400.00, 60),
('Teclado RGB', 'Perifericos', 60.00, 150);

INSERT INTO empleados (nombre, apellido, puesto, salario) VALUES
('Laura', 'Martinez', 'Gerente de Ventas', 60000.00),
('Diego', 'Fernandez', 'Vendedor', 40000.00),
('Sofía', 'Ramirez', 'Soporte Tecnico', 45000.00),
('Martin', 'Gonzalez', 'Vendedor', 40000.00);

INSERT INTO ventas (id_venta, fecha_venta, id_cliente, id_empleado) VALUES
(1, '2024-01-20 10:30:00', 1, 2),
(2, '2024-01-22 11:00:00', 2, 4),
(3, '2024-02-01 14:15:00', 1, 2),
(4, '2024-02-05 09:45:00', 3, 2),
(5, '2024-02-10 16:00:00', 4, 4);
(6, '2024-03-01 12:30:00', 1, 2);

INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 1200.00),
(1, 3, 2, 75.00),
(2, 2, 1, 800.00),
(3, 1, 1, 1200.00),
(3, 5, 1, 400.00),
(4, 4, 3, 250.00),
(5, 2, 1, 800.00),
(5, 6, 1, 60.00);
(6, 6, 2, 60.00);
*/

-- Ejercicio 6

SELECT
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    v.fecha_venta,
    e.nombre AS nombre_empleado,
    e.apellido AS apellido_empleado
FROM
    clientes c
JOIN
    ventas v ON c.id_cliente = v.id_cliente
JOIN
    empleados e ON v.id_empleado = e.id_empleado
ORDER BY
    v.fecha_venta;
    
-- Ejercicio 7

SELECT
    p.nombre AS nombre_producto,
    dv.cantidad,
    dv.precio_unitario,
    v.fecha_venta
FROM
    productos p
JOIN
    detalle_venta dv ON p.id_producto = dv.id_producto
JOIN
    ventas v ON dv.id_venta = v.id_venta
ORDER BY
    v.fecha_venta;
    
-- Ejercicio 8

SELECT 
    p.id_producto,
    p.nombre,
    p.stock,
    COALESCE(SUM(dv.cantidad), 0) AS cantidad_vendida
FROM productos p
LEFT JOIN detalle_venta dv ON p.id_producto = dv.id_producto
GROUP BY p.id_producto, p.nombre, p.stock
ORDER BY p.id_producto;
    
-- Ejercicio 9

SELECT 
    e.id_empleado,
    e.nombre,
    e.apellido,
    SUM(dv.cantidad * dv.precio_unitario) AS total_facturado
FROM empleados e
JOIN ventas v ON e.id_empleado = v.id_empleado
JOIN detalle_venta dv ON v.id_venta = dv.id_venta
GROUP BY e.id_empleado, e.nombre, e.apellido
ORDER BY total_facturado DESC;
    
-- Ejercicio 10

SELECT 
    c.id_cliente,
    c.nombre,
    c.apellido,
    COUNT(v.id_venta) AS cantidad_ventas
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nombre, c.apellido
HAVING COUNT(v.id_venta) > 2
ORDER BY c.apellido, c.nombre;