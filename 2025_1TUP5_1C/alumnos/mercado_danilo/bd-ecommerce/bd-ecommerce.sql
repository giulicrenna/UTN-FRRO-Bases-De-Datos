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

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    categoria VARCHAR(50),
    activo BOOLEAN DEFAULT TRUE
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

INSERT INTO productos (nombre, descripcion, precio, stock, categoria) VALUES
('Auriculares Bluetooth', 'Auriculares inalámbricos con estuche cargador', 8000, 50, 'Electrónica'),
('Cargador USB-C', 'Cargador rápido para celulares Android', 2500, 30, 'Electrónica'),
('Funda para iPhone', 'Funda de silicona para iPhone 12', 1800, 40, 'Accesorios'),
('Mouse inalámbrico', 'Mouse óptico con conexión Bluetooth', 3500, 60, 'Computación'),
('Teclado mecánico', 'Teclado gamer retroiluminado', 12000, 25, 'Computación'),
('Notebook HP 14"', 'Notebook HP con 8GB RAM y SSD', 250000, 10, 'Tecnología'),
('Smartwatch', 'Reloj inteligente con podómetro y notificaciones', 15000, 20, 'Wearables'),
('Cámara Web HD', 'Webcam 1080p para videollamadas', 6500, 35, 'Computación'),
('Cable HDMI', 'Cable HDMI de 2 metros', 2000, 80, 'Accesorios'),
('Impresora Multifunción', 'Impresora, escáner y fotocopiadora', 70000, 15, 'Tecnología'),
('Pendrive 64GB', 'Memoria USB 3.0', 3500, 100, 'Almacenamiento'),
('Disco SSD 512GB', 'Disco sólido para notebooks', 38000, 20, 'Almacenamiento'),
('Tablet 10"', 'Tablet con Android 11', 60000, 18, 'Tecnología'),
('Parlante portátil', 'Parlante bluetooth con batería recargable', 8500, 30, 'Audio'),
('Cooler para notebook', 'Base refrigerante con ventiladores', 4200, 25, 'Accesorios'),
('Lámpara LED USB', 'Luz flexible para notebooks', 1200, 70, 'Accesorios'),
('Joystick USB', 'Control para PC con vibración', 5000, 45, 'Gaming'),
('Router WiFi', 'Router inalámbrico con doble banda', 16000, 22, 'Redes'),
('Monitor 24"', 'Monitor LED full HD', 80000, 12, 'Tecnología'),
('Soporte celular auto', 'Soporte magnético para automóvil', 2300, 55, 'Accesorios');

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