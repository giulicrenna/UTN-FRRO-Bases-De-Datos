DROP DATABASE IF EXISTS ecommerce_arg;
CREATE DATABASE ecommerce_arg CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ecommerce_arg;

-- 1)
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    dni VARCHAR(10) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    fecha_registro DATE NOT NULL
);

-- 2)
CREATE TABLE productos (
	id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) CHECK (precio > 0),
    stock DECIMAL(10, 2) CHECK (stock >= 0)
);

-- 3)
CREATE TABLE empleados (
	id_empleado INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	puesto VARCHAR(50),
    salario DECIMAL(10, 2) CHECK (salario > 0)
);
-- 4)

CREATE TABLE ventas (
	id_venta INT PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

-- 5)
CREATE TABLE detalle_venta (
	id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    
    PRIMARY KEY (id_venta, id_producto),
    
    cantidad DECIMAL(10, 2) CHECK (cantidad > 0),
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- 6)
SELECT concat (c.nombre, " ", c.apellido) as "Cliente", v.fecha_venta, concat(e.nombre, " ", e.apellido) as "Empleado"
FROM ventas v
	INNER JOIN clientes c ON v.id_cliente = c.id_cliente
	INNER JOIN empleados e ON v.id_empleado = e.id_empleado
ORDER BY v.fecha_venta;

-- 7)
SELECT p.nombre AS nombre_producto, dv.cantidad, dv.precio_unitario, v.fecha_venta
FROM detalle_venta dv
	INNER JOIN productos p ON dv.id_producto = p.id_producto
	INNER JOIN ventas v ON dv.id_venta = v.id_venta
ORDER BY v.fecha_venta;

-- 8)
SELECT p.nombre, p.stock, dv.cantidad
FROM detalle_venta dv
	LEFT JOIN productos p on p.id_producto = dv.id_producto;
    
-- 9)
SELECT concat(e.nombre, " ", e.apellido) as "Empleado", SUM(dv.cantidad * dv.precio_unitario) AS total_facturado
FROM detalle_venta dv
	INNER JOIN ventas v on v.id_venta = dv.id_venta
    INNER JOIN empleados e on e.id_empleado = v.id_empleado
ORDER BY total_facturado DESC;

-- 10) 
SELECT c.nombre, c.apellido, COUNT(v.id_venta) as cant_ventas
FROM clientes c
	INNER JOIN ventas v on c.id_cliente = v.id_cliente
HAVING COUNT(v.id_venta) > 2
ORDER BY c.apellido, c.nombre;   
