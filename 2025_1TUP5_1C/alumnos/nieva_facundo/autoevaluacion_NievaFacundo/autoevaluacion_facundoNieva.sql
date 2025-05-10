CREATE DATABASE IF NOT EXISTS concesionaria;

USE concesionaria;

CREATE TABLE IF NOT EXISTS cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200),
    apellido VARCHAR(200),
    telefono INT
);

CREATE TABLE IF NOT EXISTS vendedor (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS vehiculos (
    id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(200),
    modelo VARCHAR(200),
    estado BOOLEAN,
    precio INT
);


CREATE TABLE IF NOT EXISTS VENTA (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha_venta DATE, 
    precio_total INT, 
    id_vendedor INT,
    id_cliente INT, 
    id_vehiculo INT, 

    FOREIGN KEY (id_vendedor) REFERENCES concesionaria.vendedor(id_vendedor),
    FOREIGN KEY (id_cliente) REFERENCES concesionaria.cliente(id_cliente),
    FOREIGN KEY (id_vehiculo) REFERENCES concesionaria.vehiculos(id_vehiculo)
);