CREATE DATABASE IF NOT EXISTS ventas;

USE ventas;

CREATE TABLE IF NOT EXISTS clientes(
id_cliente int auto_increment primary key,
dni int,
nombre varchar(50),
direccion varchar(50),
telefono int
);

CREATE TABLE IF NOT EXISTS vehiculos(
id_vehiculo int auto_increment primary key,
estado boolean,
precio int,
modelo varchar(50)
);

CREATE TABLE IF NOT EXISTS vendedores(
id_vendedor int auto_increment primary key,
nombre varchar(50),
bonificacion int
);

CREATE TABLE IF NOT EXISTS ventas(
id_venta int auto_increment primary key,
fecha int, 
precio_final int, 
id_cliente int,
id_vehiculo int, 
id_vendedor int,

foreign key (id_cliente) references ventas.clientes(id_cliente),
foreign key (id_vehiculo) references ventas.vehiculos(id_vehiculo),
foreign key (id_vendedor) references ventas.vendedores(id_vendedor)
);