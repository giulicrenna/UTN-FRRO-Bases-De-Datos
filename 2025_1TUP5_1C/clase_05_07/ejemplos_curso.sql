# EJEMPLOS DDL

DROP DATABASE coderhouse;

CREATE DATABASE IF NOT EXISTS coderhouse;

USE coderhouse;

# SINTAXIS PARA CREAR UNA TABLA
# CREATE TABLE IF NOT EXISTS {nombre de la tabla} (
# 			atributo_1 tipo_de_dato reestricciones,
#			atributo_1 tipo_de_dato
#	)alumnos_ibfk_1

CREATE TABLE IF NOT EXISTS profesores(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE
);

CREATE TABLE IF NOT EXISTS cursos(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS alumnos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    comision_id INT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE
);

CREATE TABLE IF NOT EXISTS inscripciones(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT,
    id_curso INT,
    fecha_inscripcion DATE,
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id),
    FOREIGN KEY (id_curso) REFERENCES cursos(id)
);

CREATE TABLE IF NOT EXISTS comisiones(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_comision VARCHAR(50),
    fecha_alta DATE
);

CREATE TABLE IF NOT EXISTS cursos_comisiones(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_comision INT,
    id_curso INT
);

ALTER TABLE alumnos
ADD mail VARCHAR(100);

ALTER TABLE alumnos
MODIFY mail VARCHAR(50);

# ALTER TABLE alumnos
# ADD FOREIGN KEY (curso_id) REFERENCES cursos(id);

ALTER TABLE alumnos
ADD FOREIGN KEY (comision_id) REFERENCES comisiones(id);

ALTER TABLE cursos
ADD id_profesor INT;

ALTER TABLE cursos
ADD FOREIGN KEY (id_profesor) REFERENCES profesores(id);

ALTER TABLE cursos_comisiones
ADD FOREIGN KEY (id_comision) REFERENCES comisiones(id);

ALTER TABLE cursos_comisiones
ADD FOREIGN KEY (id_curso) REFERENCES cursos(id);

# EJEMPLOS DML

INSERT INTO comisiones (nombre_comision, fecha_alta) VALUES
('Comisión A', '2022-03-01'),
('Comisión B', '2022-03-02'),
('Comisión C', '2022-03-03'),
('Comisión D', '2022-03-04'),
('Comisión E', '2022-03-05'),
('Comisión F', '2022-03-06'),
('Comisión G', '2022-03-07'),
('Comisión H', '2022-03-08'),
('Comisión I', '2022-03-09'),
('Comisión J', '2022-03-10'),
('Comisión K', '2022-03-11'),
('Comisión L', '2022-03-12'),
('Comisión M', '2022-03-13'),
('Comisión N', '2022-03-14'),
('Comisión O', '2022-03-15');

INSERT INTO cursos (nombre) VALUES
('Matemática I'),
('Matemática II'),
('Álgebra'),
('Análisis I'),
('Análisis II'),
('Física I'),
('Física II'),
('Programación I'),
('Programación II'),
('Base de Datos'),
('Sistemas Operativos'),
('Redes'),
('Estadística'),
('Inteligencia Artificial'),
('Ingeniería de Software'),
('Arquitectura de Computadoras'),
('Lógica'),
('Seguridad Informática'),
('Taller de Proyecto I'),
('Taller de Proyecto II');

INSERT INTO profesores (nombre, apellido, fecha_nacimiento) VALUES
('Laura', 'González', '1980-05-12'),
('Mario', 'Pérez', '1975-08-23'),
('Carla', 'Rodríguez', '1982-11-30'),
('Héctor', 'Ramírez', '1969-04-02'),
('Lucía', 'Fernández', '1985-09-18'),
('Julián', 'Molina', '1977-12-20'),
('Ana', 'Torres', '1990-06-03'),
('Diego', 'Cáceres', '1981-01-15'),
('Marcela', 'Domínguez', '1979-07-09'),
('Sofía', 'Herrera', '1992-03-30'),
('Andrés', 'Medina', '1983-08-12'),
('Verónica', 'Suárez', '1987-10-05'),
('Gustavo', 'Silva', '1974-11-22'),
('Natalia', 'Vega', '1991-02-18'),
('Fabián', 'Reyes', '1980-05-01'),
('Graciela', 'Paz', '1986-07-26'),
('Leandro', 'Martínez', '1978-09-03'),
('Florencia', 'Ocampo', '1993-01-27'),
('Ramiro', 'Sosa', '1984-12-11'),
('Cecilia', 'Campos', '1990-06-25');

INSERT INTO alumnos (comision_id, nombre, apellido, fecha_nacimiento) VALUES
(1, 'Juan', 'López', '2003-06-15'),
(2, 'Ana', 'Martínez', '2002-11-10'),
(3, 'Luis', 'Fernández', '2004-01-25'),
(4, 'María', 'Díaz', '2003-09-17'),
(5, 'Sergio', 'Gómez', '2002-05-30'),
(6, 'Luciana', 'Torres', '2004-12-21'),
(7, 'Pablo', 'Muñoz', '2003-07-14'),
(8, 'Cintia', 'Luna', '2002-04-03'),
(9, 'Valentín', 'Paredes', '2003-10-11'),
(10, 'Julieta', 'Maldonado', '2001-08-09'),
(11, 'Nahuel', 'Peralta', '2003-03-23'),
(12, 'Camila', 'López', '2002-07-19'),
(13, 'Federico', 'Arias', '2003-11-06'),
(14, 'Sol', 'Ríos', '2002-09-01'),
(15, 'Iván', 'Carrizo', '2004-02-12'),
(1, 'Martina', 'Bustos', '2003-05-08'),
(2, 'Tomas', 'Leiva', '2001-10-28'),
(3, 'Malena', 'Sánchez', '2004-06-20'),
(4, 'Franco', 'Acosta', '2002-03-02'),
(5, 'Agustina', 'Villar', '2003-12-18'),
(6, 'Bruno', 'García', '2004-01-14'),
(7, 'Elena', 'Quiroga', '2002-06-22'),
(8, 'Lautaro', 'Maidana', '2001-11-17'),
(9, 'Rocío', 'Benítez', '2003-08-01'),
(10, 'Tomás', 'Vega', '2004-05-05'),
(11, 'Milagros', 'Soto', '2002-09-09'),
(12, 'Bautista', 'Cabrera', '2003-02-26'),
(13, 'Bianca', 'Espinoza', '2002-12-13'),
(14, 'Lucas', 'Morales', '2001-07-31'),
(15, 'Catalina', 'Reynoso', '2004-10-16'),
(1, 'Joaquín', 'Ramos', '2003-06-29'),
(2, 'Isabela', 'Funes', '2002-11-04'),
(3, 'Renzo', 'Barrios', '2003-01-19'),
(4, 'Emilia', 'Lucero', '2002-05-24'),
(5, 'Pedro', 'Medina', '2004-08-27'),
(6, 'Florencia', 'Ledesma', '2003-09-07'),
(7, 'Thiago', 'Orozco', '2002-04-13'),
(8, 'Alma', 'Correa', '2001-06-08'),
(9, 'Sebastián', 'Nieto', '2004-07-02'),
(10, 'Violeta', 'Salas', '2002-02-10'),
(11, 'Matías', 'Olmedo', '2003-12-29'),
(12, 'Micaela', 'Bermúdez', '2002-03-12'),
(13, 'Alan', 'Herrera', '2003-10-04'),
(14, 'Ailén', 'Suárez', '2001-09-14'),
(15, 'Benjamín', 'Guzmán', '2004-06-10'),
(1, 'Juliana', 'Silva', '2002-08-16'),
(2, 'Ezequiel', 'Vargas', '2003-04-07');

INSERT INTO inscripciones (id_alumno, id_curso, fecha_inscripcion) VALUES
(1, 1, '2024-03-01'),
(2, 2, '2024-03-02'),
(3, 3, '2024-03-03'),
(4, 4, '2024-03-04'),
(5, 5, '2024-03-05'),
(6, 6, '2024-03-06'),
(7, 7, '2024-03-07'),
(8, 8, '2024-03-08'),
(9, 9, '2024-03-09'),
(10, 10, '2024-03-10'),
(11, 11, '2024-03-11'),
(12, 12, '2024-03-12'),
(13, 13, '2024-03-13'),
(14, 14, '2024-03-14'),
(15, 15, '2024-03-15'),
(16, 16, '2024-03-16'),
(17, 17, '2024-03-17'),
(18, 18, '2024-03-18'),
(19, 19, '2024-03-19'),
(20, 20, '2024-03-20'),
(21, 1, '2024-03-21'),
(22, 2, '2024-03-22'),
(23, 3, '2024-03-23'),
(24, 4, '2024-03-24'),
(25, 5, '2024-03-25'),
(26, 6, '2024-03-26'),
(27, 7, '2024-03-27'),
(28, 8, '2024-03-28'),
(29, 9, '2024-03-29'),
(30, 10, '2024-03-30'),
(31, 11, '2024-04-01'),
(32, 12, '2024-04-02'),
(33, 13, '2024-04-03'),
(34, 14, '2024-04-04'),
(35, 15, '2024-04-05'),
(36, 16, '2024-04-06'),
(37, 17, '2024-04-07'),
(38, 18, '2024-04-08'),
(39, 19, '2024-04-09'),
(40, 20, '2024-04-10'),
(41, 1, '2024-04-11'),
(42, 2, '2024-04-12'),
(43, 3, '2024-04-13'),
(44, 4, '2024-04-14'),
(45, 5, '2024-04-15'),
(46, 6, '2024-04-16'),
(47, 7, '2024-04-17'),
(48, 8, '2024-04-18'),
(49, 9, '2024-04-19'),
(50, 10, '2024-04-20');

INSERT INTO cursos_comisiones (id_comision, id_curso) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 11),
(6, 12),
(7, 13),
(7, 14),
(8, 15),
(8, 16),
(9, 17),
(9, 18),
(10, 19),
(10, 20),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5),
(11, 6),
(12, 7),
(13, 8),
(14, 9),
(15, 10);

