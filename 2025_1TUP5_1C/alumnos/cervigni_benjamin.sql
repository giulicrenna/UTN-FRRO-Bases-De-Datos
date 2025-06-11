create database if not exists tpsql;
use tpsql;

/* ejercicio 1: crear la tabla clientes */
create table if not exists clientes 
(
id_cliente int auto_increment primary key,
nombre varchar(100) not null,
apellido varchar(100) not null,
dni varchar(100) unique not  null,
email varchar(100),
fecha_registro date not null

);

/* ejercicio 2: crear la tabla productos */

create table if not exists productosz
(
id_producto int auto_increment primary key,
nombre varchar(100) not null,
categoria varchar(100) not null,
precio decimal(10,2) check(precio > 0),
stock int  check(stock >= 0)
);


/* ejercicio 3: crear la tabla empleados */

create table if not exists empleados 
(
id_empleados int auto_increment primary key,
nombre varchar(100) not null,
apellido varchar(100) not null,
puesto varchar(100),
salario decimal(10, 2) check(salario > 0)
);


/* ejercicio 4: crear la tabla ventas */

create table if not exists ventas
(
id_ventas int auto_increment primary key,
fecha_venta date not null,
cliente_id int,
empleado_id int,

foreign key(cliente_id) references clientes(id_cliente),
foreign key(empleado_id) references empleados(id_empleados)

);



/* ejercicio 4: crear la tabla detalle_ventas */
create table if not exists detalle_ventas
(
id_venta int,
producto_id int,
cantidad int check(cantidad >= 0),
precio_unitario decimal not null,
primary key(id_venta, producto_id),
foreign key(id_venta) references ventas(id_ventas),
foreign key(producto_id) references productosz(id_producto)
);
alter table detalle_ventas 
add primary key(id_venta, producto_id); 

insert into clientes(nombre, apellido, dni, email, fecha_registro)
values

('roman', 'riquelme', '43569875', 'roman@gmail.com', '09-09-24'),
('vicente', 'taborda', '46967641', 'tabordacap@gmail.com', '09-08-24'),
('pipa', 'benedetto', '43512903', 'pipita@gmail.com', '05-03-24'),
('kevin', 'lomonaco', '44567893', 'kevinlmnc@gmail.com', '05-02-25');






insert into productosz(nombre, categoria,precio, stock)
values

('mate', 'camionero', '45000', '20'),
('mate', 'torpedo uruguayp', '50000', '12'),
('mate', 'criollo', '23000', '60'),
('mate', 'grabado personalizado', '80000', '30'),
('bombillas', 'acero inoxidable', '10000', '30'),
('bombillas', 'tipo cuchara', '13000', '15'),
('bombillas', 'recta clasica', '5000', '24');

insert into empleados(nombre, apellido,puesto, salario)
values

('jorge', 'gomez', 'atecion al publico', '300000'),
('elena', 'gonsalez', 'atecion al publico', '300000'),
('benjamin', 'cervigni', 'staff', '2000000'),
('fernando', 'ruar', 'staff', '2000000'),
('rene', 'zarate', 'delivery', '150000');

insert into ventas(fecha_venta, cliente_id, empleado_id)
values
('03-03-25', '2', '1'),
('02-04-25', '4', '2'),
('01-02-25', '2', '2'),
('23-03-25', '1', '1'),
('04-03-25', '3', '1'),
('03-05-25', '3', '2'),
('01-05-25', '2', '1');

insert into detalle_ventas(id_venta, producto_id, cantidad, precio_unitario) 
values
('2',  '2', '1', '50000'),
('1',  '1', '2', '45000'),
('3',  '3', '4', '23000'),
('4',  '4', '5', '80000'); 






/* parte 2, las consultass */

/* ejercicio 6 */
select clientes.nombre, clientes.apellido, ventas.fecha_venta from clientes
join ventas ON clientes.id_cliente  = ventas.cliente_id;

/* ejercicio 7 */
select  producto_id, cantidad, precio_unitario from detalle_ventas  
join ventas on detalle_ventas.id_venta = ventas.id_ventas
order by id_ventas;


/* ejercicio 8 */

select nombre,categoria, stock, sum(detalle_ventas.cantidad) from productosz
left join detalle_ventas on productosz.id_producto = detalle_ventas.producto_id
group by productosz.id_producto, productosz.nombre, productosz.stock
order by productosz.nombre; 


/* ejercicio 9: mostrar el total facturado por cada empleado (sumatoria de cantidad * precio_unitario), ordenado de mayor a menor */

select empleados.nombre as nombre_empleado,
empleados.apellido as apellido_empleado,
sum(detalle_ventas.cantidad * detalle_ventas.precio_unitario)  as total_facturado
from empleados
join ventas on empleados.id_empleados = ventas.empleado_id
join detalle_ventas on ventas.id_ventas = detalle_ventas.id_venta
group by empleados.id_empleados, empleados.nombre, empleados.apellido
order by total_facturado desc; 


/*ejercicio 10: */

select nombre, apellido, count(ventas.id_ventas) as cantidad_ventas  from clientes
join ventas on  clientes.id_cliente = ventas.cliente_id 
group by clientes.id_cliente, clientes.nombre, clientes.apellido
having count(ventas.id_ventas) > 2
order by clientes.nombre, clientes.apellido











