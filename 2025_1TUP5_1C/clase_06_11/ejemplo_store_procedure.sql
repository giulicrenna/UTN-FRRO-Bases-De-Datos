/*
Que es un Stores Procedure?

Es un bloque de codigo SQL que se almacena en la base de datos,
puede invocado por el nombre.
Permite encapsular logica (consultas, DML, control de flujo) y
permiten reutilizar código, mejora el rendimiendo (ya que se precompila)
y centraliza validaciones y/o transacciones complejas.

DELIMITER //
CREATE PROCEDURE nombree_procedimiento(
	[IN | OUT | INOUT] parametro_1 TIPO
    [IN | OUT | INOUT] parametro_2 TIPO
	...
)
BEGIN
	--- Consulta SQL
END //

Ventajas:
	- Reutilización del código.
    - Reducción del tráfico cliente-servidor.ALTER
    - Seguridad: ya que ejecuta código sin exponer a la base de datos.
    - Mantenimiento centralizado.
*/

USE coderhouse;

DELIMITER //
CREATE PROCEDURE agregar_alumno(
	IN p_comision_id INT,
    IN p_nombre VARCHAR(100),
    IN P_apellido VARCHAR(100),
    IN p_fecha_nacimiento DATE,
    IN p_mail VARCHAR(100)
)
BEGIN
	INSERT INTO coderhouse.alumnos
	(comision_id, nombre, apellido, fecha_nacimiento, mail)
    VALUES
    (p_comision_id, p_nombre, p_apellido, p_fecha_nacimiento, p_mail);
END //

CALL agregar_alumno(2, 'Mariela', 'Hernandez', '1985-05-05', 'marielahernandez@gmail.com');

DELIMITER //
CREATE PROCEDURE actualizar_mail(
	IN p_id_alumno INT,
    IN nuevo_mail VARCHAR(100)
)
BEGIN
	UPDATE coderhouse.alumnos
    SET mail = nuevo_mail
    WHERE id = p_id_alumno;
END //

CALL actualizar_mail(47, 'ezequielvargas@yahoo.com.ar');

DELIMITER //
CREATE PROCEDURE inscribir_alumno(
	IN p_id_alumno INT,
    IN p_id_curso INT,
    IN p_fecha_inscripcion DATE
)
BEGIN
		INSERT INTO coderhouse.inscripciones
        (id_alumno, id_curso, fecha_inscripcion)
        VALUES
        (p_id_alumno, p_id_curso, p_fecha_inscripcion);
END//

CALL inscribir_alumno(48, 2, '2025-06-11');

DELIMITER //
CREATE PROCEDURE listar_alumnos_por_comision(
	IN p_comision_id INT
)
BEGIN
	SELECT a.nombre, a.apellido, a.fecha_nacimiento, a.mail
    FROM alumnos a
    WHERE a.comision_id = p_comision_id
    ORDER BY a.apellido, a.nombre;
END //

CALL listar_alumnos_por_comision(2);

DELIMITER //
CREATE PROCEDURE contar_alumnos_por_curso(
	IN p_id_curso INT,
    OUT p_total INT
)
BEGIN
	SELECT COUNT(*) INTO p_total
    FROM coderhouse.inscripciones
    WHERE id_curso = p_id_curso;
END //

CALL contar_alumnos_por_curso(5, @cant_inscriptos);

SELECT @cant_inscriptos AS total_alumnos_en_analisis;

