CREATE DATABASE IF NOT EXISTS gestion_de_vehiculos;

USE gestion_de_vehiculos;

CREATE TABLE IF NOT EXISTS vendedor (
id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
telefono INT,
mail VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS cliente (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
telefono INT,
mail VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS vehiculo (
id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
marca VARCHAR(100) NOT NULL,
tipo VARCHAR(100) NOT NULL,
modelo VARCHAR(100) NOT NULL,
año INT,
precio DECIMAL(10, 2) NOT NULL,
kilometros INT
);

CREATE TABLE IF NOT EXISTS venta (
id_venta INT AUTO_INCREMENT PRIMARY KEY,
FOREIGN KEY (id_vendedor) REFERENCES gestion_de_vehiculos.vendedor(id_vendedor),
FOREIGN KEY (id_cliente) REFERENCES gestion_de_vehiculos.cliente(id_cliente),
FOREIGN KEY (id_vehiculo) REFERENCES gestion_de_vehiculos.vehiculo(id_vehiculo),
fecha DATE NOT NULL,
monto DECIMAL(10, 2) NOT NULL,
forma_de_pago VARCHAR(100) NOT NULL
);