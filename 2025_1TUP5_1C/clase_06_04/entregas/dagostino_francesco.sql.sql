DROP DATABASE IF EXISTS pre_evaluacion;
CREATE DATABASE pre_evaluacion CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE pre_evaluacion;

CREATE TABLE clientes(
id_cliente int AUTO_INCREMENT primary key,
nombre varchar(50),
apellido varchar(50),
dni int,
email varchar(50) null,
fecha_registro DATE
);

create table productos(
id_producto int AUTO_INCREMENT primary key,
nombre varchar(50),
categoria varchar(50) null,
precio decimal,
stock INT CHECK (stock >= 0)
);

create table empleados(
id_empleado int AUTO_INCREMENT primary key,
nombre varchar(50),
apellido varchar(50),
puesto varchar(50),
salario int 
);

create table ventas(
id_venta int AUTO_INCREMENT primary key,
fecha_venta date,
id_cliente int,
id_empleado int,
foreign key (id_cliente) references clientes(id_cliente),
FOREIGN KEY (id_empleado) references empleados(id_empleado)
);

create table detalle_ventas(
id_venta int AUTO_INCREMENT primary key,
id_producto int,
cantidad int,
precio_unitario decimal(10.2),
foreign key (id_producto) references productos(id_producto)
);


INSERT INTO clientes (nombre, apellido, dni, email, fecha_registro) VALUES
('María', 'Gómez', 12345678, 'maria.gomez@gmail.com', '2025-06-01'),
('Juan', 'Pérez', 23456789, 'juan.perez@gmail.com', '2025-06-02'),
('Lucía', 'Martínez', 34567890, NULL, '2025-06-03'),
('Gonzalo', 'Fernandez', 3456890, NULL, '2025-05-04');

ALTER TABLE productos MODIFY COLUMN precio DECIMAL(10,2);

INSERT INTO productos (nombre, categoria, precio, stock) VALUES
('Campera', 'Ropa', 12000.00, 8),
('Gorra', 'Accesorios', 2500.00, 30),
('Medias', 'Ropa', 1200.00, 50),
('Mochila', 'Accesorios', 9000.00, 12),
('Ojotas', 'Calzado', 3500.00, 25),
('Camisa', 'Ropa', 7000.00, 18),
('Bufanda', 'Accesorios', 3000.00, 20),
('Botines', 'Calzado', 18000.00, 6),
('Cinturón', 'Accesorios', 2200.00, 15),
('Vestido', 'Ropa', 10000.00, 9);

INSERT INTO empleados (nombre, apellido, puesto, salario) VALUES
('Carlos', 'Ramírez', 'Vendedor', 100000),
('Ana', 'Fernández', 'Cajera', 95000);

INSERT INTO ventas (fecha_venta, id_cliente, id_empleado) VALUES
('2025-06-24', 1, 1),
('2025-06-14', 2, 2),
('2025-07-02', 4, 1),
('2025-07-05', 1, 2),
('2025-07-10', 1, 1),
('2025-07-15', 2, 1),
('2025-07-20', 3, 2),
('2025-07-25', 2, 2),
('2025-07-30', 4, 1);

INSERT INTO detalle_ventas (id_producto, cantidad, precio_unitario) VALUES
(1, 2, 5000.00), -- 2 remeras
(2, 1, 8000.00), -- 1 pantalón
(3, 3, 12000.00), -- 3 camperas
(1, 1, 5000.00), -- 1 remera más
(4, 5, 1500.00), -- 5 pares de medias
(2, 2, 8000.00), -- 2 pantalones más
(5, 1, 10000.00), -- 1 buzo
(3, 2, 12000.00), -- 2 camperas más
(6, 4, 2000.00), -- 4 gorras
(7, 1, 18000.00); -- 1 campera premium

/* ----------------------------- CONSULTAS ------------------------------------- 
Use pre_evaluacion;

/* 6
SELECT
c.nombre,
c.apellido,
v.fecha_venta,
e.nombre
From clientes as c
inner join ventas as v on c.id_cliente = v.id_cliente
inner join empleados as e on e.id_empleado = v.id_empleado;
*/

/*7
select
p.nombre,
d.cantidad,
d.precio_unitario,
v.fecha_venta
from productos as p
inner join detalle_ventas as d on p.id_producto = d.id_producto
inner join ventas as v on d.id_venta = v.id_venta
order by fecha_venta;
*/

/*8
select
p.stock,
sum(d.cantidad) as total_vendido
from productos as p
left join detalle_ventas AS d ON p.id_producto = d.id_producto
group by p.nombre, p.stock;
*/

/* 9
select 
p.nombre as producto,
e.apellido as empleado,
e.nombre as empleado,
SUM(d.cantidad * d.precio_unitario) AS total_facturado
from empleados as e
inner join ventas as v on e.id_empleado = v.id_empleado
inner join detalle_ventas as d on v.id_venta = d.id_venta
inner join productos as p on d.id_producto = p.id_producto
group by e.nombre, e.apellido, p.nombre
order by total_facturado desc; /*desc = decendente;*/

/*10
select
c.nombre as cliente,
c.apellido as cliente,
count(v.id_venta) as cantida_ventas
from clientes as c
inner join  ventas AS v ON c.id_cliente = v.id_cliente
group by c.nombre, c.apellido
having COUNT(v.id_venta) > 2
order by c.apellido, c.nombre;
*/

