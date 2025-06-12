# UTN - FRRO
## Técnicatura Universitaria en Programación
### Docente: Giuliano Crenna

---

# Concesionario Automotriz

## Enunciado

Se trabajará sobre un sistema de gestión de ventas automotriz implementado en una base de datos llamada `concesionario_autos`. Este sistema almacena información sobre clientes, autos, marcas, vendedores, ventas realizadas, servicios postventa y financiamiento.

Se debe subir un archivo `.sql` con la resolución, el archivo debe tener el siguiente nombre `apellido_nombre.sql` se debe subir el el siguiente Google Forms:
https://forms.gle/RbYjYFN1Zv3SNSda7

### Ejercicio 1: (2 puntos)

Crear la tabla `ventas` con los siguientes campos además de insertar al menos 5 datos en la misma:

* `id_venta` (clave primaria, autoincremental)
* `id_auto` (clave foránea que referencia a `autos`)
* `id_cliente` (clave foránea que referencia a `clientes`)
* `id_vendedor` (clave foránea que referencia a `vendedores`)
* `fecha_venta` (tipo `DATE`, obligatorio)
* `forma_pago` (tipo `VARCHAR(50)`)

Asegúrese de incluir las siguientes restricciones:

1. Clave primaria en `id_venta`
2. Restricción de clave foránea sobre `id_auto`
3. Restricción `NOT NULL` sobre `fecha_venta`

---

### Ejercicio 2: (2 puntos)

Listar el nombre y apellido de todos los clientes que tienen registrado un correo electrónico que contenga el dominio `gmail.com`.

---

### Ejercicio 3: (2 puntos)

Obtener la cantidad total de autos vendidos por cada forma de pago. Mostrar dos columnas: `forma_pago` y `cantidad_ventas`.

---

### Ejercicio 4: (2 puntos)

Listar los modelos de autos vendidos junto con el nombre y apellido del cliente que los compró. Ordenar el resultado por fecha de venta descendente.

---

### Ejercicio 5: (1 puntos)

Obtener un listado con la siguiente información:

* Modelo del auto
* Marca
* Nombre del cliente
* Nombre del vendedor

Utilizar al menos dos `JOIN` entre las tablas `autos`, `marcas`, `clientes`, `vendedores` y `ventas`.

---

### Ejercicio 6: (1 puntos)

Crear un procedimiento almacenado llamado `insertar_venta` que reciba los siguientes parámetros:

* `p_id_auto` INT
* `p_id_cliente` INT
* `p_id_vendedor` INT
* `p_fecha_venta` DATE
* `p_forma_pago` VARCHAR(50)

El procedimiento debe insertar una nueva fila en la tabla `ventas` con los datos provistos.
