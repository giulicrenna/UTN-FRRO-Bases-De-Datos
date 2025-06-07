DROP DATABASE IF EXISTS nexus_distribuidora;
CREATE DATABASE nexus_distribuidora CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE nexus_distribuidora;

CREATE TABLE proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cuit VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    descripcion TEXT
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    id_categoria INT,
    id_proveedor INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(10) UNIQUE,
    email VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha DATE NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE detalle_ventas (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_ingreso DATE NOT NULL,
    cargo VARCHAR(50) NOT NULL
);

INSERT INTO proveedores (nombre, cuit, email, telefono) VALUES
('Tecno Sur S.A.', '30-70984512-3', 'ventas@tecnosur.com.ar', '3415123456'),
('Distribuidora Marquez', '30-64819273-9', 'contacto@marquez.com.ar', '3414345678'),
('Electronica Rosario', '30-84521976-1', 'rosario@electronica.com', '3414767890'),
('Mayorista IT', '30-96321458-0', NULL, '3414123456'),
('Redes del Litoral', '30-75938462-5', 'ventas@redeslitoral.com', NULL),
('ProveNet', '30-83920174-2', 'soporte@provenet.com.ar', '3414012345'),
('Mercurio Insumos', '30-61237894-7', NULL, NULL),
('Grupo Iluminar', '30-12984567-6', 'grupo@iluminar.com.ar', '3414567890'),
('Outlet Gamer', '30-99887766-8', 'ventas@outletgamer.com', '3414234567'),
('DigitalTech S.R.L.', '30-55667788-0', 'info@digitaltech.com', '3414891234');

INSERT INTO categorias (nombre, descripcion) VALUES
('Audio', 'Auriculares, parlantes y sistemas de sonido'),
('Cables', 'Cables HDMI, USB, de red y adaptadores'),
('Redes', 'Routers, switches y accesorios de red'),
('Iluminación', 'Luces LED, tiras RGB, lámparas'),
('Gaming', 'Accesorios para gamers'),
('Electrodomésticos', 'Pequeños electrodomésticos de hogar'),
('Celulares', 'Accesorios para celulares y tablets'),
('Notebook', 'Soportes, ventiladores y fundas'),
('Almacenamiento', 'Discos externos, pendrives, memorias'),
('Periféricos', 'Teclados, mouse, pads y webcams');

INSERT INTO productos (nombre, precio, stock, id_categoria, id_proveedor) VALUES
('Auricular JBL T510', 18500.00, 25, 1, 1),
('Cable HDMI 2.1 3m', 2500.00, 50, 2, 2),
('Router TP-Link Archer AX10', 32000.00, 10, 3, 3),
('Tira LED 5m RGB con control', 4200.00, 15, 4, 8),
('Joystick Redragon Saturn', 7800.00, 20, 5, 9),
('Pava eléctrica Liliana PE-710', 11000.00, 7, 6, 6),
('Soporte magnético celular', 2000.00, 45, 7, 7),
('Cooler para notebook Noganet', 3700.00, 18, 8, 4),
('Pendrive Kingston 64GB', 4200.00, 60, 9, 5),
('Mouse Logitech M170', 3100.00, 30, 10, 10),
('Teclado Redragon Kumara', 11500.00, 15, 10, 9),
('Lámpara LED escritorio USB', 3400.00, 10, 4, 8),
('Auricular Inalámbrico Xiaomi', 16800.00, 8, 1, 1),
('Cable USB Tipo-C 1m', 1000.00, 100, 2, 2),
('Switch TP-Link 8 puertos', 13500.00, 5, 3, 3),
('Smartwatch Mibro Lite', 21000.00, 12, 7, 1),
('Mousepad gamer grande', 2200.00, 60, 10, 9),
('Licuadora Philips HR2100', 24000.00, 6, 6, 6),
('Funda neoprene notebook 15"', 3300.00, 10, 8, 4),
('Hub USB 4 puertos 3.0', 2800.00, 25, 2, 2);

INSERT INTO clientes (nombre, apellido, dni, email, telefono) VALUES
('María', 'López', '32123456', 'maria.lopez@gmail.com', '3415123456'),
('Carlos', 'García', '30112233', 'carlosg@gmail.com', '3414234567'),
('Julieta', 'Martínez', '32987654', 'julimartinez@hotmail.com', '3414789456'),
('Ricardo', 'Fernández', '31234567', NULL, NULL),
('Luciana', 'Pérez', '34111222', 'lucianap@gmail.com', '3414123987'),
('Jorge', 'Sosa', '33121212', NULL, '3414001234'),
('Camila', 'Gómez', '35123123', 'cami_gz@outlook.com', NULL),
('Ramiro', 'Alonso', '34123456', NULL, NULL),
('Florencia', 'Ruiz', '36121234', 'florruiz@gmail.com', '3414765123'),
('Nahuel', 'Domínguez', '37123456', NULL, NULL),
('Ezequiel', 'Molina', '30123458', 'ezemolina@gmail.com', '3415671234'),
('Andrea', 'Romero', '31121213', 'andrea.romero@gmail.com', '3414321123'),
('Marcos', 'Vera', '32127890', NULL, NULL),
('Sofía', 'Medina', '30129876', NULL, NULL),
('Iván', 'Peralta', '34127890', 'ivanp@hotmail.com', NULL),
('Julia', 'Giménez', '32123232', NULL, '3414231001'),
('Bruno', 'Castro', '35127891', 'bcastro@gmail.com', NULL),
('Esteban', 'Luna', '34127892', NULL, NULL),
('Valentina', 'Silva', '33127893', NULL, NULL),
('Gonzalo', 'Herrera', '30127894', 'gon_herrera@gmail.com', '3414891002');

INSERT INTO ventas (id_cliente, fecha, total) VALUES
(1, '2025-06-01', 21500.00),
(2, '2025-06-02', 32000.00),
(3, '2025-06-03', 4200.00),
(5, '2025-06-04', 11000.00),
(6, '2025-06-05', 2000.00),
(1, '2025-06-06', 7800.00),
(2, '2025-06-07', 13500.00),
(5, '2025-06-08', 3100.00),
(3, '2025-06-09', 2500.00),
(6, '2025-06-10', 16800.00),
(11, '2025-06-11', 4200.00),
(12, '2025-06-12', 3300.00),
(14, '2025-06-13', 3400.00),
(15, '2025-06-14', 21000.00),
(17, '2025-06-15', 2800.00),
(1, '2025-06-16', 18500.00),
(5, '2025-06-17', 1000.00),
(6, '2025-06-18', 24000.00),
(13, '2025-06-19', 2200.00),
(19, '2025-06-20', 11500.00);

INSERT INTO detalle_ventas (id_venta, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 18500.00),
(1, 14, 3, 1000.00),
(2, 3, 1, 32000.00),
(3, 4, 1, 4200.00),
(4, 6, 1, 11000.00),
(5, 7, 1, 2000.00),
(6, 5, 1, 7800.00),
(7, 15, 1, 13500.00),
(8, 10, 1, 3100.00),
(9, 2, 1, 2500.00),
(10, 13, 1, 16800.00),
(11, 9, 1, 4200.00),
(12, 19, 1, 3300.00),
(13, 12, 1, 3400.00),
(14, 16, 1, 21000.00),
(15, 20, 1, 2800.00),
(16, 1, 1, 18500.00),
(17, 14, 1, 1000.00),
(18, 18, 1, 24000.00),
(19, 17, 1, 2200.00),
(20, 11, 1, 11500.00);

INSERT INTO empleados (nombre, apellido, fecha_ingreso, cargo)
VALUES 
('Lucía', 'Gómez', '2022-03-15', 'Analista de Datos'),
('Martín', 'Pérez', '2023-07-01', 'Desarrollador Backend'),
('Carla', 'Fernández', '2021-11-20', 'Responsable de RRHH');


-- Simulacro de Parcial
-- UTN - Base de Datos I
-- Docente: Giuliano Crenna

-- 1. Obtener el nombre completo del cliente y el total acumulado de compras, ordenado de mayor a menor.
-- (Solo clientes que realizaron compras - INNER JOIN)
-- Mostrar: nombre, apellido, total_compras

-- 2. Listar todos los productos junto con la cantidad total vendida.
-- (LEFT JOIN para incluir productos que nunca se vendieron con NULL en cantidad)
-- Mostrar: nombre_producto, total_vendido (puede ser NULL)

-- 3. Obtener el total de ventas realizadas por cada fecha.
-- Mostrar: fecha, total_vendido

-- 4. Mostrar la lista de productos vendidos con su nombre, cantidad total vendida y precio promedio de venta.
-- (INNER JOIN entre productos y detalle_ventas)
-- Mostrar: nombre_producto, total_cantidad, precio_promedio

-- 5. Listar todos los clientes, junto con la cantidad de compras que realizaron.
-- (LEFT JOIN para que aparezcan también los que no compraron)
-- Mostrar: nombre_cliente, apellido_cliente, cantidad_ventas

-- 6. Obtener los nombres de proveedores y la cantidad de productos que les compramos.
-- (LEFT JOIN con productos, agrupado por proveedor)
-- Mostrar: nombre_proveedor, cantidad_productos

-- 7. Mostrar todos los productos con su categoría, ordenados alfabéticamente por categoría y luego por nombre de producto.
-- (INNER JOIN entre productos y categorías)
-- Mostrar: categoria, nombre_producto

-- 8. Obtener todas las combinaciones posibles de productos y empleados (CROSS JOIN) — útil para simulaciones.
-- Mostrar: nombre_empleado, nombre_producto

-- 9. Listar todas las ventas realizadas junto con los datos del cliente y la fecha, ordenadas por fecha descendente.
-- Mostrar: fecha, cliente_nombre, cliente_apellido, total

-- 10. Calcular el total de productos vendidos por categoría.
-- (JOIN entre productos → detalle_ventas → categorías)
-- Mostrar: nombre_categoria, total_productos_vendidos

-- 11. Listar cada cliente con su última compra (fecha más reciente).
-- (INNER JOIN con una subconsulta que obtenga la MAX(fecha) por cliente)
-- Mostrar: nombre_cliente, apellido_cliente, fecha_ultima_compra

-- 12. Mostrar todas las combinaciones posibles entre categorías y proveedores para análisis de cobertura (CROSS JOIN).
-- Mostrar: nombre_categoria, nombre_proveedor

-- 13. Listar todas las ventas con el total de ítems que se vendieron en cada una.
-- (JOIN entre ventas y detalle_ventas con agregación)
-- Mostrar: id_venta, fecha, cantidad_items

-- 14. Mostrar los productos que tienen stock mayor al promedio general, ordenados por stock descendente.
-- Mostrar: nombre_producto, stock

-- 15. Listar todos los empleados junto con la cantidad de ventas de la empresa que ocurrieron desde su fecha de ingreso.
-- (JOIN de empleados con ventas usando condición de fecha)
-- Mostrar: nombre_empleado, apellido_empleado, cantidad_ventas_posteriores
