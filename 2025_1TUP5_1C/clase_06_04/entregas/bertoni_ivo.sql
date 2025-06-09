USE ecommerce_arg;

-- 1) Crear tabla clientes

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    dni CHAR(10) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    fecha_registro DATE NOT NULL
);

-- 2) tabla productos

 CREATE TABLE producto (
 	id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) CHECK (precio > 0),
    stock INT CHECK (stock >= 0) NOT NULL
);

-- 3) tabla empleados

CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    puesto VARCHAR(50),
    salario DECIMAL(10,2) CHECK (salario > 0) NOT NULL
);

--  4) tabla ventas 

CREATE TABLE ventas (
    id_ventas INT AUTO_INCREMENT PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    id_cliente INT,
    id_empleado INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

-- 5) tabla detalle venta

CREATE TABLE detalle_venta (
    id_venta INT,
    id_producto INT,
    cantidad INT CHECK (cantidad > 0) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_venta, id_producto),
    FOREIGN KEY (id_venta) REFERENCES ventas(id_ventas),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Insertar clientes
INSERT INTO clientes (nombre, apellido, dni, email, fecha_registro) VALUES
('Juan', 'Pérez', '1234567890', 'juan.perez@email.com', '2025-06-01'),
('María', 'Gómez', '0987654321', 'maria.gomez@email.com', '2025-06-02'),
('Carlos', 'Fernández', '4567891230', 'carlos.fernandez@email.com', '2025-06-03'),
('Ana', 'Martínez', '7891234560', 'ana.martinez@email.com', '2025-06-04'),
('Luis', 'Rodríguez', '3216549870', 'luis.rodriguez@email.com', '2025-06-05'),
('Sofía', 'López', '6549873210', 'sofia.lopez@email.com', '2025-06-06'),
('Martín', 'García', '9873216540', 'martin.garcia@email.com', '2025-06-07'),
('Paula', 'Díaz', '7418529630', 'paula.diaz@email.com', '2025-06-08'),
('Fernando', 'Sosa', '8529637410', 'fernando.sosa@email.com', '2025-06-09'),
('Gabriela', 'Morales', '9637418520', 'gabriela.morales@email.com', '2025-06-10');

-- Insertar productos
INSERT INTO producto (nombre, categoria, precio, stock) VALUES
('Laptop', 'Electrónica', 850.50, 10),
('Mouse', 'Accesorios', 25.99, 50),
('Teclado', 'Accesorios', 45.50, 30),
('Monitor', 'Electrónica', 230.00, 20),
('Impresora', 'Oficina', 150.75, 15),
('Silla Gamer', 'Muebles', 300.00, 5),
('Mesa de Escritorio', 'Muebles', 200.00, 8),
('Auriculares', 'Electrónica', 80.99, 25),
('Memoria USB', 'Almacenamiento', 20.00, 100),
('Disco Duro Externo', 'Almacenamiento', 120.00, 12);

-- Insertar empleados
INSERT INTO empleados (nombre, apellido, puesto, salario) VALUES
('Carlos', 'Fernández', 'Vendedor', 1200.00),
('Ana', 'Martínez', 'Gerente', 2500.00),
('Luis', 'García', 'Administrador', 1800.00),
('María', 'Sosa', 'Atención al Cliente', 1100.00),
('Fernando', 'Rodríguez', 'Supervisor', 2000.00),
('Sofía', 'López', 'Vendedor', 1250.00),
('Martín', 'Díaz', 'Encargado de Almacén', 1400.00),
('Paula', 'Morales', 'Recursos Humanos', 2300.00),
('Gabriel', 'Silva', 'Técnico', 1600.00),
('Valeria', 'Giménez', 'Marketing', 2100.00);

-- Insertar ventas
INSERT INTO ventas (fecha_venta, id_cliente, id_empleado) VALUES
('2025-06-03', 1, 1),
('2025-06-04', 2, 2),
('2025-06-05', 3, 3),
('2025-06-06', 4, 4),
('2025-06-07', 5, 5),
('2025-06-08', 6, 6),
('2025-06-09', 7, 7),
('2025-06-10', 8, 8),
('2025-06-11', 9, 9),
('2025-06-12', 10, 10);

-- Insertar detalle de venta
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 850.50),
(1, 2, 2, 25.99),
(2, 3, 1, 45.50),
(2, 4, 1, 230.00),
(3, 5, 2, 150.75),
(3, 6, 1, 300.00),
(4, 7, 1, 200.00),
(4, 8, 2, 80.99),
(5, 9, 3, 20.00),
(5, 10, 1, 120.00);


USE ecommerce_arg;

-- CONSULTAS 

-- 6) 

SELECT c.nombre AS Nombre_Cliente, c.apellido AS Apellido_Cliente, 
       v.fecha_venta AS Fecha_Venta, 
       e.nombre AS Nombre_Empleado, e.apellido AS Apellido_Empleado
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN empleados e ON v.id_empleado = e.id_empleado;

-- 7) 

SELECT p.nombre AS Nombre_Producto, 
       dv.cantidad AS Cantidad_Vendida, 
       dv.precio_unitario AS Precio_Unitario, 
       v.fecha_venta AS Fecha_Venta
FROM detalle_venta dv
JOIN producto p ON dv.id_producto = p.id_producto
JOIN ventas v ON dv.id_venta = v.id_ventas
ORDER BY v.fecha_venta;

-- 8)

SELECT e.nombre AS Nombre_Empleado, 
       e.apellido AS Apellido_Empleado, 
       COUNT(v.id_ventas) AS Total_Ventas
FROM empleados e
LEFT JOIN ventas v ON e.id_empleado = v.id_empleado
GROUP BY e.id_empleado, e.nombre, e.apellido
ORDER BY Total_Ventas DESC;

-- 9)

SELECT p.nombre AS Nombre_Producto, 
       dv.cantidad AS Cantidad_Vendida, 
       dv.precio_unitario AS Precio_Unitario, 
       v.fecha_venta AS Fecha_Venta
FROM detalle_venta dv
JOIN producto p ON dv.id_producto = p.id_producto
JOIN ventas v ON dv.id_venta = v.id_ventas
ORDER BY v.fecha_venta;

-- 10)

SELECT p.nombre AS Nombre_Producto, 
       dv.cantidad AS Cantidad_Vendida, 
       dv.precio_unitario AS Precio_Unitario, 
       v.fecha_venta AS Fecha_Venta
FROM detalle_venta dv
JOIN producto p ON dv.id_producto = p.id_producto
JOIN ventas v ON dv.id_venta = v.id_ventas
ORDER BY v.fecha_venta;




