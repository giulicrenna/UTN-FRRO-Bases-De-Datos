DROP DATABASE IF EXISTS empresa_tecnologica;
CREATE DATABASE empresa_tecnologica;
use empresa_tecnologica;

CREATE TABLE clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
dni VARCHAR(50) UNIQUE NOT NULL,
email VARCHAR(100),
fecha_registro DATE NOT NULL
);

CREATE TABLE productos(
id_producto INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
precio DECIMAL(10,2) NOT NULL CHECK (precio>0),
stock INT NOT NULL CHECK (stock >=0)
);

CREATE TABLE empleados(
id_empleado INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
puesto VARCHAR(50),
salario DECIMAL(10,2) NOT NULL CHECK(salario>0)
);

CREATE TABLE ventas(
id_venta INT PRIMARY KEY, 
fecha_venta DATE NOT NULL,
id_cliente INT NOT NULL,
id_empleado INT NOT NULL,
FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente),
FOREIGN KEY(id_empleado) REFERENCES empleados(id_empleado)
);

CREATE TABLE detalle_venta(
id_venta INT NOT NULL,
id_producto INT NOT NULL,
cantidad INT NOT NULL CHECK(cantidad>0),
precio_unitario DECIMAL(10,2) NOT NULL,
PRIMARY KEY (id_venta, id_producto),
FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
FOREIGN KEY(id_producto) REFERENCES productos(id_producto)
);
#consultas
USE empresa_tecnologica;
#ejercicio 6
SELECT c.nombre AS nombre_cliente,
c.apellido AS apellido_cliente, 
v.fecha_venta,
e.nombre AS nombre_empleado, 
e.apellido AS apellido_empleado
FROM clientes c
INNER JOIN ventas v ON c.id_cliente = v.id_cliente
INNER JOIN empleados e ON v.id_empleado = e.id_empleado;

#ejercicio 7
SELECT 
	p.nombre AS nombre_producto,
    d.cantidad,
    d.precio_unitario,
    v.fecha_venta
FROM ventas v
INNER JOIN detalle_venta d ON v.id_venta = d.id_venta
INNER JOIN productos p ON p.id_producto = d.id_producto
ORDER BY v.fecha_venta;

#ejercicio 8
SELECT
	p.stock,
    SUM(d.cantidad) AS cantidad_vendida
    FROM productos p 
    LEFT JOIN detalle_venta d ON p.id_producto= d.id_producto
    group by p.id_producto, p.nombre, p.stock;
#ejercicio 9 
SELECT 
	e.nombre AS nombre_empleado,
    e.apellido AS apellido_empleado,
    SUM(d.cantidad*d.precio_unitario) AS total_facturado
FROM empleados e
INNER JOIN ventas v ON e.id_empleado = v.id_empleado
INNER JOIN detalle_venta d ON v.id_venta = d.id_venta
GROUP BY e.id_empleado, e.nombre, e.apellido
ORDER BY total_facturado DESC;
#ejercicio 10

SELECT 
	c.nombre AS nombre_cliente,
	c.apellido AS apellido_cliente,
	COUNT(v.id_venta) AS cantidad_ventas
FROM clientes c 
INNER JOIN ventas v ON c.id_cliente= v.id_cliente
GROUP BY c.id_cliente, c.nombre, c.apellido
HAVING COUNT(v.id_venta)>2
ORDER BY c.apellido, c.nombre;

CREATE DATABASE empresa_tecnologica;
use empresa_tecnologica;

CREATE TABLE clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
dni VARCHAR(50) UNIQUE NOT NULL,
email VARCHAR(100),
fecha_registro DATE NOT NULL
);

CREATE TABLE productos(
id_producto INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
precio DECIMAL(10,2) NOT NULL CHECK (precio>0),
stock INT NOT NULL CHECK (stock >=0)
);

CREATE TABLE empleados(
id_empleado INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
puesto VARCHAR(50),
salario DECIMAL(10,2) NOT NULL CHECK(salario>0)
);

CREATE TABLE ventas(
id_venta INT PRIMARY KEY, 
fecha_venta DATE NOT NULL,
id_cliente INT NOT NULL,
id_empleado INT NOT NULL,
FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente),
FOREIGN KEY(id_empleado) REFERENCES empleados(id_empleado)
);

CREATE TABLE detalle_venta(
id_venta INT NOT NULL,
id_producto INT NOT NULL,
cantidad INT NOT NULL CHECK(cantidad>0),
precio_unitario DECIMAL(10,2) NOT NULL,
PRIMARY KEY (id_venta, id_producto),
FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
FOREIGN KEY(id_producto) REFERENCES productos(id_producto)
);
#consultas
USE empresa_tecnologica;
#ejercicio 6
SELECT c.nombre AS nombre_cliente,
c.apellido AS apellido_cliente, 
v.fecha_venta,
e.nombre AS nombre_empleado, 
e.apellido AS apellido_empleado
FROM clientes c
INNER JOIN ventas v ON c.id_cliente = v.id_cliente
INNER JOIN empleados e ON v.id_empleado = e.id_empleado;

#ejercicio 7
SELECT 
	p.nombre AS nombre_producto,
    d.cantidad,
    d.precio_unitario,
    v.fecha_venta
FROM ventas v
INNER JOIN detalle_venta d ON v.id_venta = d.id_venta
INNER JOIN productos p ON p.id_producto = d.id_producto
ORDER BY v.fecha_venta;

#ejercicio 8
SELECT
	p.stock,
    SUM(d.cantidad) AS cantidad_vendida
    FROM productos p 
    LEFT JOIN detalle_venta d ON p.id_producto= d.id_producto
    group by p.id_producto, p.nombre, p.stock;
#ejercicio 9 
SELECT 
	e.nombre AS nombre_empleado,
    e.apellido AS apellido_empleado,
    SUM(d.cantidad*d.precio_unitario) AS total_facturado
FROM empleados e
INNER JOIN ventas v ON e.id_empleado = v.id_empleado
INNER JOIN detalle_venta d ON v.id_venta = d.id_venta
GROUP BY e.id_empleado, e.nombre, e.apellido
ORDER BY total_facturado DESC;
#ejercicio 10

SELECT 
	c.nombre AS nombre_cliente,
	c.apellido AS apellido_cliente,
	COUNT(v.id_venta) AS cantidad_ventas
FROM clientes c 
INNER JOIN ventas v ON c.id_cliente= v.id_cliente
GROUP BY c.id_cliente, c.nombre, c.apellido
HAVING COUNT(v.id_venta)>2
ORDER BY c.apellido, c.nombre;


CREATE DATABASE empresa_tecnologica;
use empresa_tecnologica;

CREATE TABLE clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
dni VARCHAR(50) UNIQUE NOT NULL,
email VARCHAR(100),
fecha_registro DATE NOT NULL
);

CREATE TABLE productos(
id_producto INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
precio DECIMAL(10,2) NOT NULL CHECK (precio>0),
stock INT NOT NULL CHECK (stock >=0)
);

CREATE TABLE empleados(
id_empleado INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
puesto VARCHAR(50),
salario DECIMAL(10,2) NOT NULL CHECK(salario>0)
);

CREATE TABLE ventas(
id_venta INT PRIMARY KEY, 
fecha_venta DATE NOT NULL,
id_cliente INT NOT NULL,
id_empleado INT NOT NULL,
FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente),
FOREIGN KEY(id_empleado) REFERENCES empleados(id_empleado)
);

CREATE TABLE detalle_venta(
id_venta INT NOT NULL,
id_producto INT NOT NULL,
cantidad INT NOT NULL CHECK(cantidad>0),
precio_unitario DECIMAL(10,2) NOT NULL,
PRIMARY KEY (id_venta, id_producto),
FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
FOREIGN KEY(id_producto) REFERENCES productos(id_producto)
);
#consultas
USE empresa_tecnologica;
#ejercicio 6
SELECT c.nombre AS nombre_cliente,
c.apellido AS apellido_cliente, 
v.fecha_venta,
e.nombre AS nombre_empleado, 
e.apellido AS apellido_empleado
FROM clientes c
INNER JOIN ventas v ON c.id_cliente = v.id_cliente
INNER JOIN empleados e ON v.id_empleado = e.id_empleado;

#ejercicio 7
SELECT 
	p.nombre AS nombre_producto,
    d.cantidad,
    d.precio_unitario,
    v.fecha_venta
FROM ventas v
INNER JOIN detalle_venta d ON v.id_venta = d.id_venta
INNER JOIN productos p ON p.id_producto = d.id_producto
ORDER BY v.fecha_venta;

#ejercicio 8
SELECT
	p.stock,
    SUM(d.cantidad) AS cantidad_vendida
    FROM productos p 
    LEFT JOIN detalle_venta d ON p.id_producto= d.id_producto
    group by p.id_producto, p.nombre, p.stock;
#ejercicio 9 
SELECT 
	e.nombre AS nombre_empleado,
    e.apellido AS apellido_empleado,
    SUM(d.cantidad*d.precio_unitario) AS total_facturado
FROM empleados e
INNER JOIN ventas v ON e.id_empleado = v.id_empleado
INNER JOIN detalle_venta d ON v.id_venta = d.id_venta
GROUP BY e.id_empleado, e.nombre, e.apellido
ORDER BY total_facturado DESC;
#ejercicio 10

SELECT 
	c.nombre AS nombre_cliente,
	c.apellido AS apellido_cliente,
	COUNT(v.id_venta) AS cantidad_ventas
FROM clientes c 
INNER JOIN ventas v ON c.id_cliente= v.id_cliente
GROUP BY c.id_cliente, c.nombre, c.apellido
HAVING COUNT(v.id_venta)>2
ORDER BY c.apellido, c.nombre;

