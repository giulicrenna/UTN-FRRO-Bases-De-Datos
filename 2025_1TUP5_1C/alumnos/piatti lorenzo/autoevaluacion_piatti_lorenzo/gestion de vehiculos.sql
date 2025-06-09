CREATE DATABASE IF NOT EXISTS gestionDeVehiculos;

USE gestionDeVehiculos;

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
id_vendedor INT NOT NULL,
id_cliente INT NOT NULL,
id_vehiculo INT NOT NULL,
fecha DATE NOT NULL,
monto DECIMAL(10, 2) NOT NULL,
forma_de_pago VARCHAR(100) NOT NULL,
FOREIGN KEY (id_vendedor) REFERENCES gestionDeVehiculos.vendedor(id_vendedor),
FOREIGN KEY (id_cliente) REFERENCES gestionDeVehiculos.cliente(id_cliente),
FOREIGN KEY (id_vehiculo) REFERENCES gestionDeVehiculos.vehiculo(id_vehiculo)
);