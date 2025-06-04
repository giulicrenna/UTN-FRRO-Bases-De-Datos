DROP DATABASE IF EXISTS ecommerce_arg;
CREATE DATABASE ecommerce_arg CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ecommerce_arg;

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    direccion TEXT,
    fecha_registro DATE NOT NULL
);



CREATE TABLE ordenes (
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    fecha_orden DATE NOT NULL,
    estado ENUM('Pendiente', 'Enviado', 'Entregado', 'Cancelado') DEFAULT 'Pendiente',
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE detalle_orden (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_orden INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_orden INT NOT NULL,
    fecha_pago DATE NOT NULL,
    metodo_pago ENUM('Tarjeta', 'Transferencia', 'Efectivo') NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    confirmado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden)
);

CREATE TABLE clientes (
	id_cliente  INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni  VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100),
    fecha_registro DATE NOT NULL
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(10) NOT NULL,
    precio DECIMAL(10,2) CHECK (precio > 0),
    stock INT NOT NULL CHECK (stock >= 0),
    UNIQUE(nombre, categoria)
);


CREATE TABLE empleados (
	id_empleado INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    puesto VARCHAR(20),
    salario DECIMAL(10,2) CHECK (salario > 0)
);

CREATE TABLE ventas (
	id_venta INT PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

CREATE TABLE detalle_venta (
	id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    PRIMARY KEY (id_venta, id_producto)
);

INSERT INTO clientes (nombre, apellido, dni, email, fecha_registro) VALUES
('Juan', 'Pérez', '12345678', 'juan.perez@example.com', '2024-05-10'),
('Ana', 'García', '87654321', 'ana.garcia@example.com', '2024-06-01'),
('Luis', 'Martínez', '45678912', NULL, '2024-06-03'),
('Marcos', 'Sánchez', '33445566', 'marcos.sanchez@example.com', '2024-06-04'),
('Lucía', 'Romero', '99887766', 'lucia.romero@example.com', '2024-06-04'),
('Sofía', 'Díaz', '11223344', NULL, '2024-06-05');


INSERT INTO productos (nombre, categoria, precio, stock) VALUES
('Mouse inalámbrico', 'Electrón.', 25.50, 100),
('Teclado mecánico', 'Electrón.', 75.00, 50),
('Monitor 24"', 'Electrón.', 150.00, 30),
('Silla gamer', 'Muebles', 199.99, 20),
('Auriculares Bluetooth', 'Electrón.', 45.00, 80),
('Alfombrilla RGB', 'Electrón.', 20.00, 120),
('Escritorio ergonómico', 'Muebles', 350.00, 10);


INSERT INTO productos (nombre, categoria, precio, stock) VALUES
('Mouse inalámbrico', 'Electrón.', 25.50, 100),
('Teclado mecánico', 'Electrón.', 75.00, 50),
('Monitor 24"', 'Electrón.', 150.00, 30),
('Silla gamer', 'Muebles', 199.99, 20);

INSERT INTO empleados (id_empleado, nombre, apellido, puesto, salario) VALUES
(1, 'Carlos', 'Lopez', 'Vendedor', 80000.00),
(2, 'María', 'Fernandez', 'Cajera', 75000.00),
(3, 'Luciano', 'Ruiz', 'Vendedor', 82000.00),
(4, 'Camila', 'Benítez', 'Atención al cliente', 70000.00);


INSERT INTO ventas (id_venta, fecha_venta, id_cliente, id_empleado) VALUES
(1, '2024-06-01', 1, 1),
(2, '2024-06-02', 2, 2),
(3, '2024-06-03', 3, 1),
(4, '2024-06-04', 4, 3),
(5, '2024-06-04', 5, 1),
(6, '2024-06-05', 6, 4);

INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 2, 25.50),
(1, 2, 1, 75.00),
(2, 4, 1, 199.99),
(3, 3, 2, 150.00),
(4, 5, 1, 45.00),
(4, 2, 1, 75.00),
(5, 6, 2, 20.00),
(6, 7, 1, 350.00);



INSERT INTO usuarios (nombre, apellido, email, telefono, direccion, fecha_registro) VALUES
('Juan', 'Pérez', 'juanp@gmail.com', '3411234567', 'Calle Falsa 123, Rosario', '2024-01-15'),
('María', 'González', 'mariagonz@outlook.com', '3412345678', 'San Martín 456, Rosario', '2024-02-10'),
('Pedro', 'López', 'plopez@gmail.com', '3413456789', 'Mitre 789, Rosario', '2024-02-20'),
('Laura', 'Sánchez', 'lauras@gmail.com', '3414567890', 'Corrientes 321, Rosario', '2024-03-01'),
('Lucía', 'Díaz', 'luciad@hotmail.com', '3415678901', 'Buenos Aires 654, Rosario', '2024-03-15'),
('Carlos', 'Fernández', 'carlosf@live.com', '3416789012', 'Urquiza 876, Rosario', '2024-03-30'),
('Sofía', 'Ramírez', 'sofiar@outlook.com', '3417890123', 'Maipú 321, Rosario', '2024-04-01'),
('Jorge', 'Martínez', 'jmartinez@gmail.com', '3418901234', 'Italia 963, Rosario', '2024-04-10'),
('Florencia', 'Castro', 'florcastro@gmail.com', '3419012345', 'España 234, Rosario', '2024-04-20'),
('Nicolás', 'Ruiz', 'nruiz@gmail.com', '3410123456', 'Paraguay 123, Rosario', '2024-04-25'),
('Valentina', 'Molina', 'vmolina@hotmail.com', '3411122334', 'Sarmiento 999, Rosario', '2024-05-01'),
('Franco', 'Sosa', 'francos@gmail.com', '3412233445', 'Balcarce 432, Rosario', '2024-05-02'),
('Camila', 'Luna', 'camilal@gmail.com', '3413344556', 'Entre Ríos 654, Rosario', '2024-05-03'),
('Mateo', 'Cruz', 'mateocruz@gmail.com', '3414455667', 'Mitre 876, Rosario', '2024-05-04'),
('Martina', 'Moreno', 'martinam@hotmail.com', '3415566778', 'Salta 132, Rosario', '2024-05-05'),
('Agustín', 'Paz', 'agustinp@outlook.com', '3416677889', 'San Lorenzo 243, Rosario', '2024-05-06'),
('Josefina', 'Herrera', 'josefinah@gmail.com', '3417788990', 'Córdoba 369, Rosario', '2024-05-07'),
('Tomás', 'Arias', 'tomasarias@gmail.com', '3418899001', '3 de Febrero 891, Rosario', '2024-05-08'),
('Julieta', 'Vega', 'julietav@gmail.com', '3419900112', 'Montevideo 321, Rosario', '2024-05-09'),
('Ezequiel', 'Navarro', 'ezequieln@gmail.com', '3411011223', 'Catamarca 421, Rosario', '2024-05-10');



INSERT INTO ordenes (id_usuario, fecha_orden, estado, total) VALUES
(1, '2024-05-10', 'Pendiente', 10500),
(2, '2024-05-11', 'Enviado', 3500),
(3, '2024-05-11', 'Pendiente', 4200),
(4, '2024-05-12', 'Entregado', 80000),
(5, '2024-05-13', 'Cancelado', 250000),
(6, '2024-05-13', 'Pendiente', 18000),
(7, '2024-05-13', 'Pendiente', 1500),
(8, '2024-05-14', 'Pendiente', 2000),
(9, '2024-05-14', 'Enviado', 7000),
(10, '2024-05-14', 'Entregado', 12000),
(11, '2024-05-15', 'Pendiente', 38000),
(12, '2024-05-15', 'Entregado', 16000),
(13, '2024-05-16', 'Cancelado', 8500),
(14, '2024-05-16', 'Pendiente', 10500),
(15, '2024-05-16', 'Pendiente', 10000),
(16, '2024-05-17', 'Entregado', 60000),
(17, '2024-05-17', 'Pendiente', 2300),
(18, '2024-05-18', 'Pendiente', 4500),
(19, '2024-05-18', 'Pendiente', 4200),
(20, '2024-05-19', 'Enviado', 100000);

INSERT INTO detalle_orden (id_orden, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 8000),
(2, 2, 1, 2500),
(3, 4, 1, 3500),
(4, 19, 1, 80000),
(5, 6, 1, 250000),
(6, 7, 1, 15000),
(7, 16, 1, 1200),
(8, 9, 1, 2000),
(9, 14, 1, 8500),
(10, 5, 1, 12000),
(11, 12, 1, 38000),
(12, 18, 1, 16000),
(13, 14, 1, 8500),
(14, 1, 1, 8000),
(15, 17, 1, 5000),
(16, 13, 1, 60000),
(17, 20, 1, 2300),
(18, 4, 1, 3500),
(19, 3, 1, 1800),
(20, 11, 2, 5000);

INSERT INTO pagos (id_orden, fecha_pago, metodo_pago, monto, confirmado) VALUES
(1, '2024-05-10', 'Tarjeta', 10500, TRUE),
(2, '2024-05-11', 'Efectivo', 3500, TRUE),
(3, '2024-05-11', 'Transferencia', 4200, TRUE),
(4, '2024-05-12', 'Tarjeta', 80000, TRUE),
(5, '2024-05-13', 'Transferencia', 250000, FALSE),
(6, '2024-05-13', 'Tarjeta', 18000, TRUE),
(7, '2024-05-13', 'Efectivo', 1500, TRUE),
(8, '2024-05-14', 'Efectivo', 2000, TRUE),
(9, '2024-05-14', 'Tarjeta', 7000, TRUE),
(10, '2024-05-14', 'Transferencia', 12000, TRUE),
(11, '2024-05-15', 'Tarjeta', 38000, TRUE),
(12, '2024-05-15', 'Transferencia', 16000, TRUE),
(13, '2024-05-16', 'Efectivo', 8500, TRUE),
(14, '2024-05-16', 'Tarjeta', 10500, TRUE),
(15, '2024-05-16', 'Tarjeta', 10000, TRUE),
(16, '2024-05-17', 'Transferencia', 60000, TRUE),
(17, '2024-05-17', 'Efectivo', 2300, TRUE),
(18, '2024-05-18', 'Efectivo', 4500, TRUE),
(19, '2024-05-18', 'Transferencia', 4200, TRUE),
(20, '2024-05-19', 'Tarjeta', 100000, TRUE);


-- 6- Listar el nombre y apellido de cada cliente, junto con la fecha de sus compras y el empleado que los atendio (nombre y apellido)
SELECT 
	c.nombre,
    c.apellido,
    v.fecha_venta,
    e.nombre,
    e.apellido
FROM clientes AS c
INNER JOIN ventas AS v ON c.id_cliente = v.id_cliente
INNER JOIN empleados AS e ON e.id_empleado = v.id_empleado;


-- 7- Listar todos los productos vendidos, con nombre del producto, cantidad vendida y precio unitario, ordenados por fecha de venta.
SELECT 
	p.nombre,
    dv.cantidad,
    dv.precio_unitario,
    v.fecha_venta
FROM productos AS p
INNER JOIN detalle_venta AS dv ON p.id_producto = dv.id_producto
INNER JOIN ventas AS v ON v.id_venta = dv.id_venta
ORDER BY v.fecha_venta;


-- 8- Obtener un listado de productos con su stock actual y la cantidad total vendida (usar LEFT JOIN para mostrar tambien productos no vendidos)

SELECT 
    p.nombre,
    p.stock,
    SUM(dv.cantidad) AS cantidad_total_vendida
FROM productos AS p
LEFT JOIN detalle_venta AS dv ON p.id_producto = dv.id_producto
GROUP BY p.id_producto;

-- 9- Mostrar el total facturado por cada empleado (sumatoria de cantidad * precio_unitario), ordenado de mayor a menor

SELECT 
	e.nombre,
    e.apellido,
    SUM(dv.cantidad*dv.precio_unitario) AS total_facturado
FROM empleados AS e
INNER JOIN ventas AS v ON e.id_empleado = v.id_empleado
INNER JOIN detalle_venta AS dv ON  v.id_venta = dv.id_venta
GROUP BY e.id_empleado
ORDER BY total_facturado DESC;

-- 10- Mostrar para cada cliente la cantidad de ventas que realizo, solo si tuvo mas de 2 ventas. Ordenar por nombre y apellido.
SELECT 
    c.nombre,
    c.apellido,
    COUNT(v.id_venta) AS cantidad_ventas
FROM clientes AS c
INNER JOIN ventas AS v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente
HAVING COUNT(v.id_venta) > 2
ORDER BY c.nombre, c.apellido;


