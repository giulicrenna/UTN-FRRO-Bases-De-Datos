USE utn_bbdd_modificar;

-- Insertamos nuevos cursos.
INSERT INTO cursos (nombre)
VALUES
	('Matemática'),
    ('Estadística'),
    ('Programación I'),
    ('Bases de Datos I'),
    ('Programación II'),
    ('Gestion de Proyectos'),
    ('Bases de Datos II'),
    ('Análisis de Datos');

INSERT INTO cursos (nombre)
VALUES
	('Inglés');

-- Insertamos alumnos.
INSERT INTO estudiantes (nombre, mail, curso_id)
VALUES
	('Tessa Luciano', 'tessa.luciano@gmail.com', 1),
    ('Gabriela Carvalho', 'gabriela.carvalho@yahoo.com', 2),
    ('Maria Laura Moyano', 'maria.moyano@gmail.com', 3),
    ('Muriel Salvador', 'muriel.salvador@hotmail.com', 2),
    ('Ramiro Brenta', 'ramiro.brenta@yahoo.com', 2),
    ('Justina Rey', 'justina.rey@gmail.com', 1),
    ('Gabriel Mercé', 'gabriel.merce@hotmail.com', 3),
    ('Arriola Valentín', 'valentin.arriola@gmail.com', 2);
    
-- Actualizamos datos
UPDATE estudiantes
SET mail = 'ramiro.brenta@gmail.com'
WHERE id = 41;

UPDATE cursos
SET nombre = 'Organización Empresarial'
WHERE nombre = 'Gestion de Proyectos';

-- Actualizamos datos
UPDATE estudiantes
SET curso_id = curso_id + 1;

-- Borramos los registros
DELETE FROM estudiantes
WHERE id = 39;

-- Eliminamos todos los datos de la tabla.
TRUNCATE TABLE estudiantes;

