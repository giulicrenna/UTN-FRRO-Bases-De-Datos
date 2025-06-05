CREATE DATABASE IF NOT EXISTS sistema_venta_autos;

USE sistema_venta_autos;

CREATE TABLE IF NOT EXISTS cliente (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    dni VARCHAR(20) NOT NULL UNIQUE,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS vendedor (
	id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    legajo VARCHAR(50) NOT NULL UNIQUE,
    vendedor_desde DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS medio_pago (
	id_medio INT AUTO_INCREMENT PRIMARY KEY,
    tipo_pago VARCHAR(50) NOT NULL UNIQUE
);
 
CREATE TABLE IF NOT EXISTS modelo (
    id_modelo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_modelo VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS marca (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre_marca VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS vehiculo (
    id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    id_modelo INT NOT NULL,
    id_marca INT NOT NULL,
    id_categoria INT NOT NULL,
	nro_chasis VARCHAR(50) UNIQUE NOT NULL,
	cilindrada_motor VARCHAR(50) NOT NULL,
	patente VARCHAR(50) UNIQUE NOT NULL,
	color VARCHAR(50),
	anio INT,
	kilometraje VARCHAR(50),
	precio DECIMAL(10, 2) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
	estado ENUM('disponible', 'vendido') NOT NULL,
    condicion ENUM('nuevo', 'usado') NOT NULL,
    FOREIGN KEY (id_modelo) REFERENCES modelo(id_modelo),
    FOREIGN KEY (id_marca) REFERENCES marca(id_marca),
	FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);


CREATE TABLE IF NOT EXISTS venta (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
	fecha_venta DATE,
	precio_venta DECIMAL(10, 2),
	observaciones VARCHAR(255),
    id_cliente INT,
    id_vendedor INT,
    id_vehiculo INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor),
    FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id_vehiculo)
);

CREATE TABLE IF NOT EXISTS pago (
    id_habitacion INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_medio INT NOT NULL,
	nro_cuota INT NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    fecha_pago DATE NOT NULL,
    estado ENUM('pendiente', 'pagado') DEFAULT 'pagado',
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
    FOREIGN KEY (id_medio) REFERENCES medio_pago(id_medio)
);
