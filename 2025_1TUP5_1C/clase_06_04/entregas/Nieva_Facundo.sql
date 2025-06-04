DROP DATABASE IF EXISTS ecommerce_argg;
CREATE DATABASE ecommerce_argg;
USE ecommerce_argg;

CREATE TABLE clientes (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  dni INT,
  email VARCHAR(50),
  fecha_registro DATE
);

CREATE TABLE productos (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  categoria VARCHAR(50),
  precio DECIMAL(10,2),
  stock INT
);

CREATE TABLE empleados (
  id_empleado INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  puesto VARCHAR(50),
  salario DECIMAL(10,2)
);

CREATE TABLE ventas (
  id_venta INT AUTO_INCREMENT PRIMARY KEY,
  fecha_venta DATE,
  id_cliente INT,
  id_empleado INT,
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
  FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

CREATE TABLE detalle_venta (
  id_venta INT,
  id_producto INT,
  cantidad INT,
  precio_unitario DECIMAL(10,2),
  PRIMARY KEY (id_venta, id_producto),
  FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO clientes (nombre, apellido, dni, email, fecha_registro) VALUES
('Lucía', 'Gómez', 12345678, 'lucia.gomez@gmail.com', '2024-01-10'),
('Marcos', 'Fernández', 23456789, 'marcos.fernandez@hotmail.com', '2024-02-12'),
('Carla', 'Martínez', 34567890, 'carla.martinez@yahoo.com', '2024-03-05'),
('Pedro', 'López', 45678901, 'pedro.lopez@gmail.com', '2024-04-15'),
('Sofía', 'Ramírez', 56789012, 'sofia.ramirez@gmail.com', '2024-05-20'),
('Javier', 'Sosa', 67890123, 'javier.sosa@gmail.com', '2024-06-01'),
('Paula', 'Vega', 78901234, 'paula.vega@hotmail.com', '2024-06-03'),
('Martín', 'Díaz', 89012345, 'martin.diaz@gmail.com', '2024-06-05'),
('Julia', 'Molina', 90123456, 'julia.molina@gmail.com', '2024-06-07'),
('Héctor', 'Acosta', 11223344, 'hector.acosta@hotmail.com', '2024-06-09'),
('Valentina', 'Bravo', 22334455, 'valentina.bravo@gmail.com', '2024-06-10'),
('Agustín', 'Farias', 33445566, 'agustin.farias@gmail.com', '2024-06-11'),
('Florencia', 'Navarro', 44556677, 'florencia.navarro@gmail.com', '2024-06-12'),
('Matías', 'Reyes', 55667788, 'matias.reyes@gmail.com', '2024-06-13'),
('Brenda', 'Castro', 66778899, 'brenda.castro@gmail.com', '2024-06-14');


INSERT INTO empleados (nombre, apellido, puesto, salario) VALUES
('Juan', 'Pérez', 'Vendedor', 70000.00),
('Ana', 'Díaz', 'Supervisora', 90000.00),
('Carlos', 'Gutiérrez', 'Vendedor', 68000.00),
('María', 'Ortiz', 'Vendedora', 71000.00),
('Luis', 'Méndez', 'Supervisor', 95000.00),
('Sandra', 'Herrera', 'Vendedora', 69000.00),
('Daniel', 'Paz', 'Encargado', 88000.00),
('Noelia', 'Ibarra', 'Vendedora', 70000.00),
('Raúl', 'Salas', 'Vendedor', 72000.00),
('Patricia', 'Silva', 'Supervisora', 93000.00),
('Tomás', 'Leiva', 'Vendedor', 67000.00),
('Celeste', 'Benítez', 'Vendedora', 71000.00),
('Ramiro', 'Ramos', 'Encargado', 85000.00),
('Laura', 'Moreno', 'Supervisora', 94000.00),
('Iván', 'Gómez', 'Vendedor', 69000.00);


INSERT INTO productos (nombre, categoria, precio, stock) VALUES
('Laptop Lenovo', 'Electrónica', 1200.00, 8),
('Auriculares Sony', 'Accesorios', 150.00, 20),
('Teclado Redragon', 'Periféricos', 60.00, 15),
('Mouse Logitech', 'Periféricos', 40.00, 25),
('Monitor Samsung 24"', 'Electrónica', 220.00, 10),
('Tablet Xiaomi', 'Electrónica', 300.00, 12),
('Disco SSD 1TB', 'Componentes', 120.00, 18),
('Impresora HP', 'Oficina', 250.00, 7),
('Router TP-Link', 'Redes', 90.00, 16),
('Cámara Web Logitech', 'Accesorios', 80.00, 14),
('Notebook Dell', 'Electrónica', 1100.00, 6),
('Smartphone Motorola', 'Electrónica', 500.00, 10),
('Silla Gamer', 'Muebles', 200.00, 5),
('Base Refrigerante', 'Accesorios', 35.00, 20),
('Hub USB 4 Puertos', 'Accesorios', 25.00, 30);

-- Insertar ventas
INSERT INTO ventas (fecha_venta, id_cliente, id_empleado) VALUES
('2024-06-01', 1, 1),
('2024-06-02', 2, 2),
('2024-06-03', 3, 3),
('2024-06-04', 4, 4),
('2024-06-05', 5, 5),
('2024-06-06', 6, 6),
('2024-06-07', 7, 7),
('2024-06-08', 8, 8),
('2024-06-09', 9, 9),
('2024-06-10', 10, 10),
('2024-06-11', 11, 11),
('2024-06-12', 12, 12),
('2024-06-13', 13, 13),
('2024-06-14', 14, 14),
('2024-06-15', 15, 15);


INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 1200.00),
(2, 2, 2, 150.00),
(3, 3, 1, 60.00),
(4, 4, 2, 40.00),
(5, 5, 1, 220.00),
(6, 6, 1, 300.00),
(7, 7, 2, 120.00),
(8, 8, 1, 250.00),
(9, 9, 1, 90.00),
(10, 10, 2, 80.00),
(11, 11, 1, 1100.00),
(12, 12, 1, 500.00),
(13, 13, 1, 200.00),
(14, 14, 2, 35.00),
(15, 15, 3, 25.00);

SELECT
c.nombre,
c.apellido,
v.fecha_venta,
e.nombre,
e.apellido
from ventas v 
inner join clientes c on v.id_cliente = c.id_cliente
inner join empleados e on v.id_empleado = e.id_empleado;

SELECT 
p.nombre,
dv.cantidad,
dv.precio_unitario,
v.fecha_venta
FROM detalle_venta dv
INNER JOIN productos p on dv.id_producto = p.id_producto
INNER JOIN ventas v on dv.id_venta = v.id_venta
ORDER BY v.fecha_venta;

select
p.stock,
sum(d.cantidad) as total_vendido
from productos as p
left join detalle_venta AS d ON p.id_producto = d.id_producto
group by p.nombre, p.stock;

SELECT 
  e.nombre,
  e.apellido,
  SUM(dv.cantidad * dv.precio_unitario) as total_facturado
FROM empleados e
JOIN ventas v ON e.id_empleado = v.id_empleado
JOIN detalle_venta dv ON v.id_venta = dv.id_venta
GROUP BY e.id_empleado, e.nombre, e.apellido
ORDER BY total_facturado DESC;

SELECT
 c.nombre,
 c.apellido,
 COUNT(v.id_venta) as cantidad_ventas
 from clientes c
 JOIN ventas v ON c.id_cliente = v.id_cliente
 GROUP BY c.id_cliente, c.nombre, c.apellido
 HAVING COUNT(v.id_venta) > 2
 ORDER BY c.apellido, c.nombre;
