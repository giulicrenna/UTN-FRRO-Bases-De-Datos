DROP DATABASE IF EXISTS concesionario_autos;
CREATE DATABASE concesionario_autos CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE concesionario_autos;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE vendedores (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    legajo VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE marcas (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    pais_origen VARCHAR(50),
    anio_fundacion INT
);

CREATE TABLE autos (
    id_auto INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL,
    anio INT NOT NULL,
    color VARCHAR(30),
    precio DECIMAL(12,2) NOT NULL,
    id_marca INT NOT NULL,
    FOREIGN KEY (id_marca) REFERENCES marcas(id_marca)
);


CREATE TABLE servicios_postventa (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    id_auto INT NOT NULL,
    fecha_servicio DATE NOT NULL,
    descripcion TEXT,
    costo DECIMAL(10,2),
    FOREIGN KEY (id_auto) REFERENCES autos(id_auto)
);

INSERT INTO clientes (nombre, apellido, dni, email, telefono) VALUES
('Juan', 'Pérez', '30123456', 'juan.perez@gmail.com', '3415123456'),
('Ana', 'García', '32123456', 'ana.garcia@hotmail.com', '3416234567'),
('Carlos', 'López', '33123456', 'carlos.lopez@yahoo.com', '3417345678'),
('María', 'Rodríguez', '34123456', 'maria.r@gmail.com', '3418456789'),
('Lucía', 'Fernández', '35123456', 'luciaf@gmail.com', '3419567890'),
('Diego', 'Sánchez', '36123456', 'diego.s@gmail.com', '3415678901'),
('Valeria', 'Méndez', '37123456', 'valeria.m@hotmail.com', '3416789012'),
('Martín', 'Gutiérrez', '38123456', 'martin.g@outlook.com', '3417890123'),
('Carla', 'Navarro', '39123456', 'carla.n@gmail.com', '3418901234'),
('Nicolás', 'Suárez', '40123456', 'nico.suarez@yahoo.com', '3419012345'),
('Florencia', 'Luna', '41123456', 'flor.luna@gmail.com', '3410123456'),
('Leandro', 'Vega', '42123456', 'leandro.v@hotmail.com', '3411234567'),
('Romina', 'Castro', '43123456', 'romina.c@concesionario.com', '3412345678'),
('Federico', 'Paz', '44123456', 'fede.paz@gmail.com', '3413456789'),
('Camila', 'Herrera', '45123456', 'camila.h@live.com', '3414567890');


INSERT INTO vendedores (nombre, apellido, legajo, email, telefono) VALUES
('Pedro', 'Martínez', 'VEN001', 'pedro.m@concesionario.com', '3411111111'),
('Laura', 'Gómez', 'VEN002', 'laura.g@concesionario.com', '3412222222'),
('Sofía', 'Ramírez', 'VEN003', 'sofia.r@concesionario.com', '3413333333'),
('Lucas', 'Morales', 'VEN004', 'lucas.m@concesionario.com', '3414444444'),
('Camila', 'Herrera', 'VEN005', 'camila.h@concesionario.com', '3415555555'),
('Andrés', 'Ruiz', 'VEN006', 'andres.r@concesionario.com', '3416666666'),
('Javier', 'Silva', 'VEN007', 'javier.s@concesionario.com', '3417777777'),
('Patricia', 'Bello', 'VEN008', 'patricia.b@concesionario.com', '3418888888'),
('Bruno', 'Torres', 'VEN009', 'bruno.t@concesionario.com', '3419999999'),
('Julieta', 'Molina', 'VEN010', 'julieta.m@concesionario.com', '3411010101'),
('Rodrigo', 'Salas', 'VEN011', 'rodrigo.s@concesionario.com', '3412020202'),
('Carolina', 'Leiva', 'VEN012', 'carolina.l@concesionario.com', '3413030303'),
('Matías', 'Villar', 'VEN013', 'matias.v@concesionario.com', '3414040404'),
('Ailén', 'Rojas', 'VEN014', 'ailen.r@concesionario.com', '3415050505'),
('Ezequiel', 'Campos', 'VEN015', 'ezequiel.c@concesionario.com', '3416060606');


INSERT INTO marcas (nombre, pais_origen, anio_fundacion) VALUES
('Toyota', 'Japón', 1937),
('Ford', 'Estados Unidos', 1903),
('Volkswagen', 'Alemania', 1937),
('Renault', 'Francia', 1899),
('Chevrolet', 'Estados Unidos', 1911),
('Peugeot', 'Francia', 1810),
('Honda', 'Japón', 1948),
('Fiat', 'Italia', 1899),
('Nissan', 'Japón', 1933),
('Hyundai', 'Corea del Sur', 1967),
('Kia', 'Corea del Sur', 1944),
('Mazda', 'Japón', 1920),
('Jeep', 'Estados Unidos', 1941),
('BMW', 'Alemania', 1916),
('Mercedes-Benz', 'Alemania', 1926);


INSERT INTO autos (modelo, anio, color, precio, id_marca) VALUES
('Corolla', 2021, 'Blanco', 32000000.00, 1),
('Hilux', 2022, 'Negro', 45000000.00, 1),
('Focus', 2020, 'Rojo', 28000000.00, 2),
('Ranger', 2023, 'Gris', 47000000.00, 2),
('Golf', 2021, 'Gris', 35000000.00, 3),
('Amarok', 2023, 'Negro', 48000000.00, 3),
('Clio', 2020, 'Blanco', 21000000.00, 4),
('Kangoo', 2019, 'Azul', 22000000.00, 4),
('Cruze', 2021, 'Azul', 29000000.00, 5),
('Onix', 2022, 'Blanco', 24000000.00, 5),
('208', 2023, 'Gris', 31000000.00, 6),
('Civic', 2020, 'Negro', 33000000.00, 7),
('Fit', 2019, 'Rojo', 27000000.00, 7),
('Cronos', 2022, 'Gris', 26500000.00, 8),
('Versa', 2021, 'Plateado', 25000000.00, 9);


INSERT INTO servicios_postventa (id_auto, fecha_servicio, descripcion, costo) VALUES
(1, '2024-06-01', 'Cambio de aceite y filtro', 15000.00),
(2, '2024-06-10', 'Revisión de frenos', 22000.00),
(3, '2024-06-15', 'Alineación y balanceo', 18000.00),
(4, '2024-06-18', 'Cambio de batería', 25000.00),
(5, '2024-06-20', 'Cambio de bujías', 14000.00),
(6, '2024-06-22', 'Revisión completa', 30000.00),
(7, '2024-06-25', 'Cambio correa distribución', 45000.00),
(8, '2024-06-27', 'Diagnóstico motor', 18000.00),
(9, '2024-06-29', 'Revisión de suspensión', 21000.00),
(10, '2024-07-01', 'Pastillas de freno', 19000.00),
(11, '2024-07-02', 'Alineación', 12000.00),
(12, '2024-07-03', 'Balanceo de ruedas', 11000.00),
(13, '2024-07-04', 'Cambio de lámparas', 9000.00),
(14, '2024-07-05', 'Revisión aire acondicionado', 16000.00),
(15, '2024-07-06', 'Cambio de filtro de aire', 8000.00);

