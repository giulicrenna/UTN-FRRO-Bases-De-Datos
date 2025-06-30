DROP DATABASE IF EXISTS  hospital_tp;

CREATE DATABASE hospital_tp;

USE hospital_tp;

CREATE TABLE pacientes (
    id_paciente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_nacimiento DATE NOT NULL,
    direccion VARCHAR(100),
    nro_obrasocial INT
);

CREATE TABLE cita_medica (
    id_cita_medica INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    hora TIME,
    id_paciente INT,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
);

CREATE TABLE empleados (
    id_empleado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    telefonos VARCHAR(100),
    mail VARCHAR(100),
    horario TIME
);

CREATE TABLE empleados_pacientes (
    id_empleado INT,
    id_paciente INT,
    PRIMARY KEY (id_empleado, id_paciente),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
);

CREATE TABLE administrativo (
    id_administrativo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    sector VARCHAR(50),
    antiguedad INT,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
); 

CREATE TABLE enfermeros (
    id_enfermero INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    sector VARCHAR(50),
    antiguedad INT,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

CREATE TABLE medicos (
    id_medico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_empleado INT,
    matricula INT NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

CREATE TABLE consultorios (
   id_consultorio INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   id_medico INT,
   franja_horario TIME,
   nro_consultorio INT,
   FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);

CREATE TABLE historiales_clinicos (
    id_historial_clinico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_medico INT,
    fecha DATE,
    diagnostico VARCHAR(200),
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);

CREATE TABLE especialista (
    id_especialista INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_medico INT,
    especialidad VARCHAR(50),
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);

CREATE TABLE residentes (
     id_residente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
     id_medico INT,
     especialidad VARCHAR(50),
     ano_residencia DATE,
     FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);
-- POBLACION DE TABLAS CON REGISTROS

-- TABLA PACIENTES (100 REGISTROS)

INSERT INTO pacientes (nombre, apellido,fecha_nacimiento, direccion,nro_obrasocial)
VALUES
('Juan', 'Pérez', '1993-05-10', 'Calle Falsa 123', 101),
('Ana', 'Gómez', '1998-02-15', 'Av. Siempre Viva 742', 102),
('Carlos', 'López', '1983-08-20', 'Calle Real 50', 103),
('María', 'Fernández', '1988-11-30', 'Av. Libertad 20', 104),
('Lucía', 'Ramírez', '1995-07-12', 'Calle Luna 10', 105),
('Diego', 'Torres', '1990-01-05', 'Av. Sol 333', 106),
('Sofía', 'Díaz', '2001-03-23', 'Calle Estrella 9', 107),
('Mateo', 'Vargas', '1978-12-01', 'Av. Mar 45', 108),
('Camila', 'Rojas', '1996-06-17', 'Calle Nube 101', 109),
('Lucas', 'Morales', '1992-09-25', 'Av. Río 88', 110),
('Valentina', 'Castro', '1994-04-04', 'Calle Sol 14', 111),
('Joaquín', 'Ortiz', '1989-07-07', 'Av. Bosque 22', 112),
('Martina', 'Sánchez', '1997-10-19', 'Calle Verde 77', 113),
('Tomás', 'Silva', '1985-01-13', 'Av. Cerro 31', 114),
('Isabella', 'Mendoza', '1999-08-08', 'Calle Agua 50', 115),
('Benjamín', 'Alvarez', '1987-03-30', 'Av. Viento 66', 116),
('Mía', 'Ruiz', '2000-12-22', 'Calle Tierra 12', 117),
('Sebastián', 'Herrera', '1984-05-11', 'Av. Luz 3', 118),
('Agustina', 'Guzmán', '2002-09-14', 'Calle Oro 99', 119),
('Nicolás', 'Medina', '1986-11-23', 'Av. Plata 20', 120),
('Julieta', 'Romero', '1995-02-28', 'Calle Cielo 42', 121),
('Diego', 'Iglesias', '1991-06-18', 'Av. Sol 58', 122),
('Sofía', 'Reyes', '1993-04-05', 'Calle Bosque 100', 123),
('Mateo', 'Castillo', '1982-01-21', 'Av. Mar 7', 124),
('Camila', 'Vega', '1998-10-15', 'Calle Nube 83', 125),
('Lucas', 'Paredes', '1994-07-12', 'Av. Río 35', 126),
('Valentina', 'Soto', '1996-05-09', 'Calle Sol 77', 127),
('Joaquín', 'Mora', '1989-09-14', 'Av. Bosque 12', 128),
('Martina', 'Fuentes', '1997-03-19', 'Calle Verde 65', 129),
('Tomás', 'Navarro', '1985-12-10', 'Av. Cerro 28', 130),
('Isabella', 'Campos', '1999-08-07', 'Calle Agua 43', 131),
('Benjamín', 'Silva', '1987-06-15', 'Av. Viento 90', 132),
('Mía', 'Ramos', '2000-04-18', 'Calle Tierra 51', 133),
('Sebastián', 'Vargas', '1984-02-25', 'Av. Luz 67', 134),
('Agustina', 'Delgado', '2002-11-09', 'Calle Oro 11', 135),
('Nicolás', 'Ponce', '1986-07-30', 'Av. Plata 18', 136),
('Julieta', 'Ortiz', '1995-03-16', 'Calle Cielo 34', 137),
('Diego', 'Serrano', '1991-09-22', 'Av. Sol 72', 138),
('Sofía', 'Rivas', '1993-12-29', 'Calle Bosque 8', 139),
('Mateo', 'Miranda', '1982-10-03', 'Av. Mar 39', 140),
('Camila', 'Acosta', '1998-06-26', 'Calle Nube 90', 141),
('Lucas', 'Vidal', '1994-11-13', 'Av. Río 53', 142),
('Valentina', 'Bravo', '1996-08-17', 'Calle Sol 68', 143),
('Joaquín', 'Méndez', '1989-04-20', 'Av. Bosque 26', 144),
('Martina', 'Suárez', '1997-01-14', 'Calle Verde 99', 145),
('Tomás', 'Vargas', '1985-09-01', 'Av. Cerro 6', 146),
('Isabella', 'García', '1999-05-24', 'Calle Agua 73', 147),
('Benjamín', 'Cruz', '1987-02-11', 'Av. Viento 49', 148),
('Mía', 'Luna', '2000-10-07', 'Calle Tierra 30', 149),
('Sebastián', 'Campos', '1984-03-21', 'Av. Luz 59', 150),
('Agustina', 'Pérez', '2002-08-12', 'Calle Oro 15', 151),
('Nicolás', 'Flores', '1986-05-28', 'Av. Plata 25', 152),
('Julieta', 'Vargas', '1995-07-30', 'Calle Cielo 45', 153),
('Diego', 'Reyes', '1991-04-17', 'Av. Sol 80', 154),
('Sofía', 'Molina', '1993-09-10', 'Calle Bosque 21', 155),
('Mateo', 'Castro', '1982-11-05', 'Av. Mar 16', 156),
('Camila', 'López', '1998-03-03', 'Calle Nube 37', 157),
('Lucas', 'Ramírez', '1994-12-09', 'Av. Río 64', 158),
('Valentina', 'Morales', '1996-01-28', 'Calle Sol 44', 159),
('Joaquín', 'Sánchez', '1989-10-11', 'Av. Bosque 33', 160),
('Martina', 'Díaz', '1997-08-04', 'Calle Verde 55', 161),
('Tomás', 'Fernández', '1985-06-22', 'Av. Cerro 44', 162),
('Isabella', 'Herrera', '1999-11-18', 'Calle Agua 68', 163),
('Benjamín', 'González', '1987-01-07', 'Av. Viento 17', 164),
('Mía', 'Navarro', '2000-07-13', 'Calle Tierra 92', 165),
('Sebastián', 'Paredes', '1984-09-27', 'Av. Luz 41', 166),
('Agustina', 'Silva', '2002-04-02', 'Calle Oro 36', 167),
('Nicolás', 'Mora', '1986-12-19', 'Av. Plata 54', 168),
('Julieta', 'Reyes', '1995-05-25', 'Calle Cielo 81', 169),
('Diego', 'Vargas', '1991-08-14', 'Av. Sol 29', 170),
('Sofía', 'Castillo', '1993-01-09', 'Calle Bosque 36', 171),
('Mateo', 'Ramírez', '1982-03-15', 'Av. Mar 42', 172),
('Camila', 'Guzmán', '1998-09-20', 'Calle Nube 69', 173),
('Lucas', 'Herrera', '1994-06-11', 'Av. Río 93', 174),
('Valentina', 'Ortiz', '1996-11-26', 'Calle Sol 28', 175),
('Joaquín', 'Flores', '1989-03-02', 'Av. Bosque 97', 176),
('Martina', 'López', '1997-12-23', 'Calle Verde 40', 177),
('Tomás', 'Ramírez', '1985-07-29', 'Av. Cerro 11', 178),
('Isabella', 'Morales', '1999-10-16', 'Calle Agua 85', 179),
('Benjamín', 'Sánchez', '1987-04-06', 'Av. Viento 31', 180),
('Mía', 'Díaz', '2000-01-20', 'Calle Tierra 13', 181),
('Sebastián', 'Fernández', '1984-08-09', 'Av. Luz 88', 182),
('Agustina', 'González', '2002-02-14', 'Calle Oro 75', 183),
('Nicolás', 'Navarro', '1986-10-30', 'Av. Plata 44', 184),
('Julieta', 'Paredes', '1995-01-08', 'Calle Cielo 27', 185),
('Diego', 'Silva', '1991-05-04', 'Av. Sol 13', 186),
('Sofía', 'Mora', '1993-07-21', 'Calle Bosque 95', 187),
('Mateo', 'Reyes', '1982-09-12', 'Av. Mar 23', 188),
('Camila', 'Vargas', '1998-11-29', 'Calle Nube 34', 189),
('Lucas', 'Castillo', '1994-03-07', 'Av. Río 67', 190),
('Valentina', 'Ramírez', '1996-12-15', 'Calle Sol 56', 191),
('Joaquín', 'Soto', '1989-06-01', 'Av. Bosque 71', 192),
('Martina', 'Méndez', '1997-04-27', 'Calle Verde 22', 193),
('Tomás', 'Suárez', '1985-08-13', 'Av. Cerro 50', 194),
('Isabella', 'Vargas', '1999-02-19', 'Calle Agua 98', 195),
('Benjamín', 'García', '1987-09-23', 'Av. Viento 4', 196),
('Mía', 'Cruz', '2000-06-28', 'Calle Tierra 39', 197),
('Sebastián', 'Luna', '1984-12-04', 'Av. Luz 14', 198),
('Agustina', 'Campos', '2002-01-16', 'Calle Oro 47', 199),
('Nicolás', 'Pérez', '1986-03-25', 'Av. Plata 88', 200);

-- CITA MEDICA 50 REGISTROS

INSERT INTO cita_medica (fecha, hora, id_paciente) VALUES
('2025-06-01', '08:00:00', 1),
('2025-06-01', '08:30:00', 2),
('2025-06-01', '09:00:00', 3),
('2025-06-01', '09:30:00', 4),
('2025-06-01', '10:00:00', 5),
('2025-06-02', '08:00:00', 6),
('2025-06-02', '08:30:00', 7),
('2025-06-02', '09:00:00', 8),
('2025-06-02', '09:30:00', 9),
('2025-06-02', '10:00:00', 10),
('2025-06-03', '08:00:00', 11),
('2025-06-03', '08:30:00', 12),
('2025-06-03', '09:00:00', 13),
('2025-06-03', '09:30:00', 14),
('2025-06-03', '10:00:00', 15),
('2025-06-04', '08:00:00', 16),
('2025-06-04', '08:30:00', 17),
('2025-06-04', '09:00:00', 18),
('2025-06-04', '09:30:00', 19),
('2025-06-04', '10:00:00', 20),
('2025-06-05', '08:00:00', 21),
('2025-06-05', '08:30:00', 22),
('2025-06-05', '09:00:00', 23),
('2025-06-05', '09:30:00', 24),
('2025-06-05', '10:00:00', 25),
('2025-06-06', '08:00:00', 26),
('2025-06-06', '08:30:00', 27),
('2025-06-06', '09:00:00', 28),
('2025-06-06', '09:30:00', 29),
('2025-06-06', '10:00:00', 30),
('2025-06-07', '08:00:00', 31),
('2025-06-07', '08:30:00', 32),
('2025-06-07', '09:00:00', 33),
('2025-06-07', '09:30:00', 34),
('2025-06-07', '10:00:00', 35),
('2025-06-08', '08:00:00', 36),
('2025-06-08', '08:30:00', 37),
('2025-06-08', '09:00:00', 38),
('2025-06-08', '09:30:00', 39),
('2025-06-08', '10:00:00', 40),
('2025-06-09', '08:00:00', 41),
('2025-06-09', '08:30:00', 42),
('2025-06-09', '09:00:00', 43),
('2025-06-09', '09:30:00', 44),
('2025-06-09', '10:00:00', 45),
('2025-06-10', '08:00:00', 46),
('2025-06-10', '08:30:00', 47),
('2025-06-10', '09:00:00', 48),
('2025-06-10', '09:30:00', 49),
('2025-06-10', '10:00:00', 50);

-- EMPLEADOS (80 REGISTROS)

INSERT INTO empleados (nombre, telefonos, mail, horario) VALUES
('María González', 3415123456, 'maria.gonzalez@hospital.com', '08:00:00'),
('Juan Pérez', 3415234567, 'juan.perez@hospital.com', '14:00:00'),
('Ana Rodríguez', 3415345678, 'ana.rodriguez@hospital.com', '22:00:00'),
('Carlos López', 3415456789, 'carlos.lopez@hospital.com', '08:00:00'),
('Lucía Fernández', 3415567890, 'lucia.fernandez@hospital.com', '14:00:00'),
('Diego Martínez', 3415678901, 'diego.martinez@hospital.com', '22:00:00'),
('Laura Gómez', 3415789012, 'laura.gomez@hospital.com', '08:00:00'),
('Martín Díaz', 3415890123, 'martin.diaz@hospital.com', '14:00:00'),
('Valeria Romero', 3415901234, 'valeria.romero@hospital.com', '22:00:00'),
('Ezequiel Herrera', 3416012345, 'ezequiel.herrera@hospital.com', '08:00:00'),
('Florencia Castro', 3416123456, 'florencia.castro@hospital.com', '14:00:00'),
('Javier Silva', 3416234567, 'javier.silva@hospital.com', '22:00:00'),
('Sofía Ramírez', 3416345678, 'sofia.ramirez@hospital.com', '08:00:00'),
('Rodrigo Torres', 3416456789, 'rodrigo.torres@hospital.com', '14:00:00'),
('Julieta Molina', 3416567890, 'julieta.molina@hospital.com', '22:00:00'),
('Camila Leiva', 3416678901, 'camila.leiva@hospital.com', '08:00:00'),
('Federico Vega', 3416789012, 'federico.vega@hospital.com', '14:00:00'),
('Romina Luna', 3416890123, 'romina.luna@hospital.com', '22:00:00'),
('Gonzalo Castro', 3416901234, 'gonzalo.castro@hospital.com', '08:00:00'),
('Bruno Rojas', 3417012345, 'bruno.rojas@hospital.com', '14:00:00'),
('Daniela Sosa', 3417123456, 'daniela.sosa@hospital.com', '22:00:00'),
('Marcos Ruiz', 3417234567, 'marcos.ruiz@hospital.com', '08:00:00'),
('Luciano Navarro', 3417345678, 'luciano.navarro@hospital.com', '14:00:00'),
('María Paz', 3417456789, 'maria.paz@hospital.com', '22:00:00'),
('Nicolás Domínguez', 3417567890, 'nicolas.dominguez@hospital.com', '08:00:00'),
('Ailén Méndez', 3417678901, 'ailen.mendez@hospital.com', '14:00:00'),
('Matías Salas', 3417789012, 'matias.salas@hospital.com', '22:00:00'),
('Agustina Vera', 3417890123, 'agustina.vera@hospital.com', '08:00:00'),
('Tomás Giménez', 3417901234, 'tomas.gimenez@hospital.com', '14:00:00'),
('Victoria Cabrera', 3418012345, 'victoria.cabrera@hospital.com', '22:00:00'),
('Sebastián Peralta', 3418123456, 'sebastian.peralta@hospital.com', '08:00:00'),
('Milagros Moreno', 3418234567, 'milagros.moreno@hospital.com', '14:00:00'),
('Lautaro Ibáñez', 3418345678, 'lautaro.ibanez@hospital.com', '22:00:00'),
('Andrea Aguirre', 3418456789, 'andrea.aguirre@hospital.com', '08:00:00'),
('Hernán Franco', 3418567890, 'hernan.franco@hospital.com', '14:00:00'),
('Cecilia Ortega', 3418678901, 'cecilia.ortega@hospital.com', '22:00:00'),
('Kevin Ponce', 3418789012, 'kevin.ponce@hospital.com', '08:00:00'),
('Yamila Soria', 3418890123, 'yamila.soria@hospital.com', '14:00:00'),
('Elías Arce', 3418901234, 'elias.arce@hospital.com', '22:00:00'),
('Bárbara Duarte', 3419012345, 'barbara.duarte@hospital.com', '08:00:00'),
('Ivana Molina', 3419123456, 'ivana.molina@hospital.com', '14:00:00'),
('Facundo Castro', 3419234567, 'facundo.castro@hospital.com', '22:00:00'),
('Melina López', 3419345678, 'melina.lopez@hospital.com', '08:00:00'),
('Nahuel Sosa', 3419456789, 'nahuel.sosa@hospital.com', '14:00:00'),
('Tamara Guzmán', 3419567890, 'tamara.guzman@hospital.com', '22:00:00'),
('Axel Herrera', 3419678901, 'axel.herrera@hospital.com', '08:00:00'),
('Pilar Reyes', 3419789012, 'pilar.reyes@hospital.com', '14:00:00'),
('Iván Núñez', 3419890123, 'ivan.nunez@hospital.com', '22:00:00'),
('Juliana Medina', 3419901234, 'juliana.medina@hospital.com', '08:00:00'),
('Simón Toledo', 3420012345, 'simon.toledo@hospital.com', '14:00:00'),
('Rocío Álvarez', 3420123456, 'rocio.alvarez@hospital.com', '22:00:00'),
('Benjamín Cordero', 3420234567, 'benjamin.cordero@hospital.com', '08:00:00'),
('Abril Rivas', 3420345678, 'abril.rivas@hospital.com', '14:00:00'),
('Nicolás Aguero', 3420456789, 'nicolas.aguero@hospital.com', '22:00:00'),
('Emilia Esquivel', 3420567890, 'emilia.esquivel@hospital.com', '08:00:00'),
('Ramiro Navarro', 3420678901, 'ramiro.navarro@hospital.com', '14:00:00'),
('Noelia Lucero', 3420789012, 'noelia.lucero@hospital.com', '22:00:00'),
('Ulises Romero', 3420890123, 'ulises.romero@hospital.com', '08:00:00'),
('Celeste Márquez', 3420901234, 'celeste.marquez@hospital.com', '14:00:00'),
('Agustín Toledo', 3421012345, 'agustin.toledo@hospital.com', '22:00:00'),
('Martina Vallejos', 3421123456, 'martina.vallejos@hospital.com', '08:00:00'),
('Cristian Burgos', 3421234567, 'cristian.burgos@hospital.com', '14:00:00'),
('Lara Arias', 3421345678, 'lara.arias@hospital.com', '22:00:00'),
('Enzo Ibáñez', 3421456789, 'enzo.ibanez@hospital.com', '08:00:00'),
('Tatiana Cabrera', 3421567890, 'tatiana.cabrera@hospital.com', '14:00:00'),
('Franco Montoya', 3421678901, 'franco.montoya@hospital.com', '22:00:00'),
('Malena Duarte', 3421789012, 'malena.duarte@hospital.com', '08:00:00'),
('Santiago Molina', 3421890123, 'santiago.molina@hospital.com', '14:00:00'),
('Isabela Pérez', 3421901234, 'isabela.perez@hospital.com', '22:00:00'),
('Maximiliano Gómez', 3422012345, 'maximiliano.gomez@hospital.com', '08:00:00'),
('Emma Luna', 3422123456, 'emma.luna@hospital.com', '14:00:00'),
('Damián Torres', 3422234567, 'damian.torres@hospital.com', '22:00:00'),
('Valentina Herrera', 3422345678, 'valentina.herrera@hospital.com', '08:00:00'),
('Thiago Romero', 3422456789, 'thiago.romero@hospital.com', '14:00:00'),
('Cintia Delgado', 3422567890, 'cintia.delgado@hospital.com', '22:00:00'),
('Alejandro Ríos', 3422678901, 'alejandro.rios@hospital.com', '08:00:00'),
('Ariana Peña', 3422789012, 'ariana.pena@hospital.com', '14:00:00'),
('Esteban Giménez', 3422890123, 'esteban.gimenez@hospital.com', '22:00:00'),
('Florencia Sánchez', 3422901234, 'florencia.sanchez@hospital.com', '08:00:00'),
('Brenda Barrios', 3423012345, 'brenda.barrios@hospital.com', '14:00:00');

-- ADMINISTRATIVOS (15 registros)
INSERT INTO administrativo (id_empleado, sector,antiguedad) VALUES
(1, 'Recepción', 5),
(2, 'Archivo',3),
(3, 'Atención al Cliente',8),
(4, 'Tesorería',2),
(5, 'Administración', 6),
(6, 'Recepción', 4),
(7, 'Archivo', 1),
(8, 'Atención al Cliente',7),
(9, 'Tesorería',10),
(10, 'Administración',2),
(11, 'Recepción',3),
(12, 'Archivo',4),
(13, 'Atención al Cliente',5),
(14, 'Tesorería',6),
(15, 'Administración',2);

-- ENFERMEROS (40 registros, id_empleado 41 a 80)
INSERT INTO enfermeros (id_empleado, sector,antiguedad) VALUES
(41, 'Cuidados Intensivos',5),
(42, 'Pediatría',3),
(43, 'Urgencias',4),
(44, 'Cuidados Intensivos',7),
(45, 'Pediatría',2),
(46, 'Urgencias',6),
(47, 'Quirófano', 8),
(48, 'Cuidados Generales',1),
(49, 'Cuidados Intensivos',5),
(50, 'Pediatría',3),
(51, 'Urgencias',4),
(52, 'Quirófano',7),
(53, 'Cuidados Generales',2),
(54, 'Cuidados Intensivos',6),
(55, 'Pediatría',5),
(56, 'Urgencias',3),
(57, 'Quirófano',8),
(58, 'Cuidados Generales',1),
(59, 'Cuidados Intensivos',4),
(60, 'Pediatría',7),
(61, 'Urgencias',2),
(62, 'Quirófano',6),
(63, 'Cuidados Generales',5),
(64, 'Cuidados Intensivos',3),
(65, 'Pediatría',4),
(66, 'Urgencias',6),
(67, 'Quirófano',7),
(68, 'Cuidados Generales', 2),
(69, 'Cuidados Intensivos', 5),
(70, 'Pediatría',3),
(71, 'Urgencias', 4),
(72, 'Quirófano', 6),
(73, 'Cuidados Generales', 7),
(74, 'Cuidados Intensivos',3),
(75, 'Pediatría',2),
(76, 'Urgencias',5),
(77, 'Quirófano',4),
(78, 'Cuidados Generales', 6),
(79, 'Cuidados Intensivos',7),
(80, 'Pediatría',3);

-- MÉDICOS (25 registros, id_empleado 16 a 40)
INSERT INTO medicos (id_empleado, matricula) VALUES
(16, 1001),
(17, 1002),
(18, 1003),
(19, 1004),
(20, 1005),
(21, 1006),
(22, 1007),
(23, 1008),
(24, 1009),
(25, 1010),
(26, 1011),
(27, 1012),
(28, 1013),
(29, 1014),
(30, 1015),
(31, 1016),
(32, 1017),
(33, 1018),
(34, 1019),
(35, 1020),
(36, 1021),
(37, 1022),
(38, 1023),
(39, 1024),
(40, 1025);

-- CONSULTORIOS (20 registros)

INSERT INTO consultorios (id_medico,franja_horario, nro_consultorio) 
VALUES
(1, '09:00:00', 121),
(2, '10:30:00', 169),
(3, '14:00:00', 157),
(4, '11:15:00', 103),
(5, '08:45:00', 135),
(6, '13:00:00', 119),
(7, '16:00:00', 197),
(8, '09:30:00', 185),
(9, '15:15:00', 105),
(10, '10:00:00', 154),
(11, '17:00:00', 192),
(12, '12:00:00', 189),
(13, '08:00:00', 133),
(14, '14:30:00', 178),
(15, '09:45:00', 171),
(16, '11:00:00', 177),
(17, '13:30:00', 113),
(18, '16:30:00', 126),
(19, '10:15:00', 140),
(20, '15:00:00', 175);

-- Historiales_clinicos (20 registros)
INSERT INTO historiales_clinicos (id_medico, fecha, diagnostico) 
VALUES
(1, '2025-04-30', 'Hipertensión'),
(2, '2024-12-31', 'Asma'),
(3, '2025-02-12', 'Fractura'),
(4, '2025-01-23', 'Hipertensión'),
(5, '2025-05-07', 'Bronquitis'),
(6, '2025-01-12', 'Gastritis'),
(7, '2025-03-18', 'Gripe'),
(8, '2025-01-01', 'Hipertensión'),
(9, '2025-02-07', 'Fractura'),
(10, '2025-04-04', 'Gastritis'),
(11, '2025-01-01', 'Bronquitis'),
(12, '2025-02-03', 'Bronquitis'),
(13, '2025-03-18', 'Fractura'),
(14, '2025-03-24', 'Gastritis'),
(15, '2025-02-19', 'Gripe'),
(16, '2025-05-23', 'Diabetes'),
(17, '2025-05-11', 'Covid-19'),
(18, '2025-03-03', 'Asma'),
(19, '2025-01-26', 'Fractura'),
(20, '2025-05-24', 'Alergia');

-- Especialistas (10 registros)

INSERT INTO especialista (id_medico, especialidad)
VALUES
(1, 'Cardiología'),
(2, 'Pediatría'),
(3, 'Dermatología'),
(4, 'Neurología'),
(5, 'Oftalmología'),
(6, 'Ginecología'),
(7, 'Traumatología'),
(8, 'Urología'),
(9, 'Psiquiatría'),
(10, 'Oncología');

-- residentes (15 registros)
INSERT INTO residentes (id_medico, especialidad, año_residencia) 
VALUES
(11, 'Medicina Interna', '2023-01-01'),
(12, 'Cirugía General', '2024-01-01'),
(13, 'Pediatría', '2023-01-01'),
(14, 'Ginecología', '2024-01-01'),
(15, 'Cardiología', '2023-01-01'),
(16, 'Neurología', '2024-01-01'),
(17, 'Dermatología', '2023-01-01'),
(18, 'Oftalmología', '2024-01-01'),
(19, 'Traumatología', '2023-01-01'),
(20, 'Urología', '2024-01-01'),
(21, 'Psiquiatría', '2023-01-01'),
(22, 'Oncología', '2024-01-01'),
(23, 'Radiología', '2023-01-01'),
(24, 'Anestesiología', '2024-01-01'),
(25, 'Patología', '2023-01-01');

-- 2 INNER JOIN
-- 2 LEFT o RIGHT JOIN
-- 2 AGREGACION (SUM, AVG, COUNT), 1 TIENE QUE INCLUIR HAVING 
-- 2 SUBCONSULTAS
-- Usar ORDER BY y GROUP BY cuando correponda

-- AGREGACION Y AGRUPACION
-- Mostrar el promedio de antiguedad de los empleados del area administrativa agrupado por sector (AGREGACION CON HAVING)

SELECT sector, AVG(antiguedad) AS promedio_antiguedad
FROM administrativo
GROUP BY sector
HAVING promedio_antiguedad > 1;

-- Cuenta la cantidad total de citas por fecha (AGREGACION)
SELECT c.fecha, COUNT(*) AS cantidad_citas
FROM cita_medica c
GROUP BY c.fecha
ORDER BY c.fecha;

-- LEFT JOINS
-- Muestra medicos y si tienen consultorios asignados en orden alfabetico de los nombres de los medicos (LEFT JOIN)
SELECT e.nombre, m.matricula, c.nro_consultorio
FROM empleados e
INNER JOIN medicos m ON e.id_empleado = m.id_empleado
LEFT JOIN consultorios c ON m.id_medico = c.id_medico
ORDER BY e.nombre;

-- Mostrar pacientes y sus citas medicas en orden alfabetico de los apellidos de los pacientes (LEFT JOIN)

SELECT p.id_paciente, p.nombre, p.apellido, c.fecha, c.hora
FROM pacientes p
LEFT JOIN cita_medica c ON p.id_paciente = c.id_paciente
ORDER BY p.apellido ASC;

-- INNER JOINS
-- muestra nombre y matricula del medico y el id del residente del cual esta a cargo en orden 
-- alfabetico segun nombres de los medicos(INNER JOIN)

SELECT e.nombre,m.matricula, r.id_residente
FROM empleados e
INNER JOIN medicos m ON e.id_empleado = m.id_empleado
INNER JOIN residentes r ON m.id_medico = r.id_medico
ORDER BY e.nombre ASC;

-- Mostrar nombre y id de empleados que son medicos (INNER JOIN)

SELECT e.id_empleado, e.nombre
FROM empleados e
INNER JOIN medicos m ON e.id_empleado = m.id_empleado;

-- SUBCONSULTAS
--  Mostrar antiguedad y id de los empleados administrativos que superen el promedio de antiguedad (SUBCONSULTA)

SELECT id_empleado, sector, antiguedad
FROM administrativo
WHERE antiguedad > (
    SELECT AVG(antiguedad)
    FROM administrativo
);

-- Mostrar empleados que no sean medicos (SUBCONSULTA)
SELECT e.nombre
FROM empleados e
WHERE e.id_empleado NOT IN (
    SELECT m.id_empleado
    FROM medicos m
);

-- STORED PROCEDURES
-- 	Obtiene la informacion de las citas de los pacientes a partir de su ID (STORED PROCEDURES)
DELIMITER //

CREATE PROCEDURE obtenerCitasPorPaciente(IN paciente_id INT)
BEGIN
SELECT c.id_cita_medica, c.fecha, c.hora, p.nombre, p.apellido
FROM cita_medica c
JOIN pacientes p ON c.id_paciente = p.id_paciente
WHERE p.id_paciente = paciente_id;
END //

DELIMITER ;

CALL obtenerCitasPorPaciente(45);

-- Permite insertar un nuevo registro a la tabla pacientes de forma directa (STORED PROCEDURES)
DELIMITER //

CREATE PROCEDURE insertar_paciente (
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_fecha_nacimiento DATE,
    IN p_direccion VARCHAR(100),
    IN p_nro_obrasocial INT
)
BEGIN
    INSERT INTO pacientes (nombre, apellido, fecha_nacimiento, direccion, nro_obrasocial)
    VALUES (p_nombre, p_apellido,p_fecha_nacimiento, p_direccion, p_nro_obrasocial);
END //

DELIMITER ;

CALL insertar_paciente('carlos','bernardi','2025-03-24','Calle Mentira 245',185);

-- Permite mostrar a los medicos con mayor experiencia en relacion al numero ingresado(STORED PROCEDURES)
DELIMITER //

CREATE PROCEDURE administrativo_antiguedad_minima (
    IN min_experiencia INT
)
BEGIN
    SELECT e.nombre, a.antiguedad
    FROM empleados e
    INNER JOIN administrativo a ON e.id_empleado = a.id_empleado
    WHERE a.antiguedad >= min_experiencia;
END //

DELIMITER ;

CALL administrativo_antiguedad_minima (7);


