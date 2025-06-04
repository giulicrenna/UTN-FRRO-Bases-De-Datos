-- Crear base de datos y usarla
CREATE DATABASE IF NOT EXISTS empresa_tecnologia;
USE empresa_tecnologia;

CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100),
    fecha_registro DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS empleados (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    puesto VARCHAR(50),
    salario DECIMAL(10,2) NOT NULL CHECK (salario > 0)
);

CREATE TABLE IF NOT EXISTS productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL CHECK (precio > 0),
    stock INT NOT NULL CHECK (stock >= 0)
);

CREATE TABLE IF NOT EXISTS ventas (
    id_ventas INT PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    id_cliente INT,
    id_empleado INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

CREATE TABLE IF NOT EXISTS detalle_venta (
    id_venta INT,
    id_producto INT,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_venta, id_producto),
    FOREIGN KEY (id_venta) REFERENCES ventas(id_ventas),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO clientes (nombre, apellido, dni, email, fecha_registro) VALUES
('Juan', 'Pérez', '12345678', 'juan.perez@mail.com', '2024-01-15'),
('María', 'Gómez', '87654321', 'maria.gomez@mail.com', '2024-02-20'),
('Lucía', 'Fernández', '56781234', NULL, '2024-03-05');

INSERT INTO empleados (id_empleado, nombre, apellido, puesto, salario) VALUES
(1, 'Ana', 'López', 'Vendedora', 2500.00),
(2, 'Carlos', 'Martínez', 'Gerente', 4000.00),
(3, 'Sofía', 'Ramírez', 'Soporte Técnico', 3200.00);

INSERT INTO productos (nombre, categoria, precio, stock) VALUES
('Smartphone X', 'Celulares', 500.00, 20),
('Laptop Y', 'Computadoras', 1200.00, 10),
('Tablet Z', 'Tablets', 350.00, 15);

INSERT INTO ventas (id_ventas, fecha_venta, id_cliente, id_empleado) VALUES
(1, '2024-04-01', 1, 1),
(2, '2024-04-02', 2, 2),
(3, '2024-04-03', 3, 3),
(4, '2024-04-05', 1, 2),
(5, '2024-04-06', 1, 3),
(6, '2024-04-07', 2, 1);

INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 2, 500.00),
(1, 3, 1, 350.00),
(2, 2, 1, 1200.00),
(3, 1, 1, 500.00),
(3, 3, 2, 350.00),
(4, 2, 1, 1200.00),
(5, 3, 2, 350.00),
(6, 1, 1, 500.00);

SELECT 
    clientes.nombre AS nombre_cliente,
    clientes.apellido AS apellido_cliente,
    ventas.fecha_venta,
    empleados.nombre AS nombre_empleado,
    empleados.apellido AS apellido_empleado
FROM ventas
INNER JOIN clientes ON ventas.id_cliente = clientes.id_cliente
INNER JOIN empleados ON ventas.id_empleado = empleados.id_empleado;

SELECT 
    productos.nombre AS nombre_producto,
    detalle_venta.cantidad,
    detalle_venta.precio_unitario,
    ventas.fecha_venta
FROM detalle_venta
INNER JOIN productos ON detalle_venta.id_producto = productos.id_producto
INNER JOIN ventas ON detalle_venta.id_venta = ventas.id_ventas
ORDER BY ventas.fecha_venta;

SELECT 
    productos.nombre AS nombre_producto,
    productos.stock AS stock_actual,
    COALESCE(SUM(detalle_venta.cantidad), 0) AS cantidad_vendida
FROM productos
LEFT JOIN detalle_venta ON productos.id_producto = detalle_venta.id_producto
GROUP BY productos.id_producto, productos.nombre, productos.stock
ORDER BY productos.nombre;

SELECT 
    empleados.nombre AS nombre_empleado,
    empleados.apellido AS apellido_empleado,
    SUM(detalle_venta.cantidad * detalle_venta.precio_unitario) AS total_facturado
FROM empleados
INNER JOIN ventas ON empleados.id_empleado = ventas.id_empleado
INNER JOIN detalle_venta ON ventas.id_ventas = detalle_venta.id_venta
GROUP BY empleados.id_empleado, empleados.nombre, empleados.apellido
ORDER BY total_facturado DESC;

SELECT 
    clientes.nombre AS nombre_cliente,
    clientes.apellido AS apellido_cliente,
    COUNT(ventas.id_ventas) AS cantidad_ventas
FROM clientes
INNER JOIN ventas ON clientes.id_cliente = ventas.id_cliente
GROUP BY clientes.id_cliente, clientes.nombre, clientes.apellido
HAVING COUNT(ventas.id_ventas) > 2
ORDER BY clientes.apellido, clientes.nombre;
