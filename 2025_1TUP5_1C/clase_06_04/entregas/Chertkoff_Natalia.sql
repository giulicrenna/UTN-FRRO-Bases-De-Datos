CREATE DATABASE pre_evalucion;

-- Ejercicio 1.
CREATE TABLE clientes (
  id_cliente int AUTO_INCREMENT PRIMARY KEY,
  nombre varchar(30) NOT NULL,
  apellido varchar(30) NOT NULL,
  dni int NOT NULL UNIQUE,
  email varchar (50) DEFAULT NULL,
  fecha_registro date NOT NULL
) ;
-- Ejercicio 2.
CREATE TABLE productos (
  id_producto int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre varchar(30) NOT NULL,
  categoria varchar (40) NOT NULL,
  precio decimal(6,2) CHECK(precio > 0),
  stock int CHECK(stock >= 0)
) ;
-- Ejercicio 3.
CREATE TABLE empleados (
  id_empleado int PRIMARY KEY,
  nombre varchar(30) NOT NULL,
  apellido varchar(30) NOT NULL,
  puesto varchar (40) ,
  salario decimal(6,2) CHECK(salario > 0) 
) ;
-- Ejercicio 4.
CREATE TABLE ventas (
  id_venta int PRIMARY KEY,
  fecha_venta date NOT NULL,
  id_cliente int, 
  id_empleado int,
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
  FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
) ;
-- Ejercicio 5.
CREATE TABLE detalle_venta (
  id_venta int,
  id_producto int,
  cantidad int CHECK(cantidad > 0),
  precio_unitario decimal(6,2) NOT NULL,
  PRIMARY KEY (id_venta,id_producto),
  FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
) ;

-- Le pedi a chat gpt Clientes
INSERT INTO clientes VALUES 
(1, 'Laura', 'Gonzalez', 12345678, 'laura@gmail.com', '2024-03-10'),
(2, 'Juan', 'Pérez', 23456789, 'juan@hotmail.com', '2024-05-02'),
(3, 'María', 'Suárez', 34567890, NULL, '2024-06-01'),
(4, 'Pedro', 'López', 45678901, 'pedro@live.com', '2024-01-15'),
(5, 'Ana', 'Ramírez', 56789012, 'ana@gmail.com', '2024-04-22');

-- Le pedi a chat gpt Productos
INSERT INTO productos VALUES 
(1, 'Paracetamol', 'Medicamento', 250.00, 100),
(2, 'Alcohol en gel', 'Higiene', 600.00, 50),
(3, 'Ibuprofeno', 'Medicamento', 300.00, 200),
(4, 'Termómetro', 'Instrumento', 1500.00, 25),
(5, 'Guantes descartables', 'Higiene', 100.00, 300);

-- Le pedi a chat gpt Empleados
INSERT INTO empleados VALUES 
(1, 'Carlos', 'Martínez', 'Cajero', 120000),
(2, 'Lucía', 'Fernández', 'Vendedora', 110000),
(3, 'Miguel', 'Díaz', 'Supervisor', 180000),
(4, 'Sofía', 'Morales', 'Cajera', 115000);

-- Le pedi a chat gpt Ventas
INSERT INTO ventas VALUES 
(1, '2024-06-01', 1, 1),
(2, '2024-06-02', 2, 2),
(3, '2024-06-03', 3, 1),
(4, '2024-06-04', 5, 3);

-- Le pedi a chat gpt Detalle de ventas
INSERT INTO detalle_venta VALUES 
(1, 1, 2, 250.00),  -- 2 Paracetamol
(1, 2, 1, 600.00),  -- 1 Alcohol
(2, 3, 3, 300.00),  -- 3 Ibuprofeno
(3, 5, 5, 100.00),  -- 5 Guantes
(4, 4, 1, 1500.00); -- 1 Termómetro

 -- Parte 2. Consultas
-- Ejercicio 6
SELECT 
  c.nombre AS nombre_cliente, 
  c.apellido AS apellido_cliente, 
  v.fecha_venta, 
  e.nombre AS nombre_empleado, 
  e.apellido AS apellido_empleado
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN empleados e ON v.id_empleado = e.id_empleado;

-- Ejercicio 7
SELECT
  p.nombre AS nombre_productos,
  dv.cantidad,
  dv.precio_unitario,
  v.fecha_venta
FROM detalle_venta dv
JOIN productos p ON dv.id_producto = p.id_producto
JOIN ventas v ON dv.id_venta = v.id_venta
ORDER BY v.fecha_venta;

-- Ejercicio 8
SELECT 
  p.nombre,
  p.stock,
  SUM(dv.cantidad) AS total_vendido
FROM productos p
LEFT JOIN detalle_venta dv ON p.id_producto = dv.id_producto
GROUP BY p.id_producto, p.nombre, p.stock;


-- Ejercicio 9
SELECT 
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
  c.nombre,
  c.apellido,
  COUNT(v.id_venta) AS cantidad_ventas
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nombre, c.apellido
HAVING COUNT(v.id_venta) > 2
ORDER BY c.apellido, c.nombre;

  

