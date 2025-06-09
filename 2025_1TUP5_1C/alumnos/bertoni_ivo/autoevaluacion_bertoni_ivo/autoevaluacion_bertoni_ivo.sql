CREATE DATABASE IF NOT EXISTS carshop;

USE carshop;

CREATE TABLE IF NOT EXISTS VEHICULO (
    id_vehiculo INT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    año INT NOT NULL,
    tipo VARCHAR(10) CHECK (tipo IN ('nuevo', 'usado')),
    precio DECIMAL(10, 2) NOT NULL,
    kilometraje INT,
    disponible BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS CLIENTE (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS VENDEDOR (
    id_vendedor INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS VENTA (
    id_venta INT PRIMARY KEY,
    id_vehiculo INT NOT NULL,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    fecha_venta DATE NOT NULL,
    precio_final DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_vehiculo) REFERENCES VEHICULO(id_vehiculo),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES VENDEDOR(id_vendedor)
);
