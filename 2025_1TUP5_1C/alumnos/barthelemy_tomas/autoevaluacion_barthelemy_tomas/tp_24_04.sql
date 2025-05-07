CREATE TABLE IF NOT EXISTS vendedores(
id_vendedor INT PRIMARY KEY,
nombre VARCHAR(100),
apellido VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS cliente(
id_cliente INT PRIMARY KEY,
telefono INT,
nombre VARCHAR(100),
apellido VARCHAR(100),
mail VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS vehiculos(
id_vehiculo  INT PRIMARY KEY,
id_vendedor INT REFERENCES vendedores.id_vendedor,
marca VARCHAR(100),
modelo VARCHAR(100),
color VARCHAR(100),
nombre VARCHAR(100),
nuevo BOOL
);
CREATE TABLE IF NOT EXISTS ventas(
id_venta INT PRIMARY KEY,
id_cliente INT REFERENCES cliente.id_cliente,
id_vehiculo INT REFERENCES vehiculos.id_vehiculo,
monto FLOAT,
fecha DATE
);

