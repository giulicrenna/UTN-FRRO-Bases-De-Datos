use ecommerce_arg;

CREATE TABLE if not exists clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR(150) NULL ,
     fecha_registro DATE NOT NULL
);
drop table productos;
CREATE TABLE if not exists productos (
    id_producto INT PRIMARY key,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) CHECK (precio > 0),
    stock INT CHECK (stock >= 0)
);

CREATE TABLE empleados (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    puesto VARCHAR(100),
    salario DECIMAL(10, 2) CHECK (salario > 0)
);

CREATE TABLE venta (
    id_venta INT PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    id_cliente INT,
    id_empleado INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

CREATE TABLE detalle_venta (
    id_venta INT,
    id_producto INT,
    cantidad INT CHECK (cantidad > 0),
    precio_unitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_venta, id_producto),
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
-- ejercicio 6 --
SELECT 
    clientes.nombre AS nombre_cliente,
    clientes.apellido AS apellido_cliente,
    venta.fecha_venta,
    empleados.nombre AS nombre_empleado,
    empleados.apellido AS apellido_empleado
FROM venta
JOIN clientes ON venta.id_cliente = clientes.id_cliente
JOIN empleados ON venta.id_empleado = empleados.id_empleado;

-- ejercicio 7 --
SELECT 
    productos.nombre,
    detalle_venta.cantidad,
    detalle_venta.precio_unitario,
    venta.fecha_venta
FROM detalle_venta
JOIN productos ON detalle_venta.id_producto = productos.id_producto
JOIN venta ON detalle_venta.id_venta = venta.id_venta
ORDER BY venta.fecha_venta;

-- ejercicio 8 --
SELECT 
    productos.nombre,
    productos.stock,
    SUM(detalle_venta.cantidad) AS total_vendido
FROM productos
LEFT JOIN detalle_venta ON productos.id_producto = detalle_venta.id_producto
GROUP BY productos.id_producto, productos.nombre, productos.stock;









