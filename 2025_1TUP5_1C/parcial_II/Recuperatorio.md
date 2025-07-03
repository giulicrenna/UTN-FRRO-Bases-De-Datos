# UTN – FRRO

## Técnicatura Universitaria en Programación

### Docente: Giuliano Crenna

**Base de datos:** `ciber_rosarino`

---

## Enunciado

Sobre la base de datos `ciber_rosarino`, que contiene las tablas `clientes`, `computadoras`, `usos`, `productos` y `ventas`, resuelve los siguientes ejercicios:

### Ejercicio 1: Creación y manipulación de datos (2 puntos)

1. Escribe el **DDL** para crear la tabla `reservas` con los campos:

   * `id_reserva` INT AUTO\_INCREMENT PRIMARY KEY
   * `id_cliente` INT NOT NULL (FK → `clientes.id_cliente`)
   * `id_pc` INT NOT NULL (FK → `computadoras.id_pc`)
   * `fecha_reserva` DATE NOT NULL
   * `hora_inicio` TIME NOT NULL
   * `hora_fin` TIME NOT NULL
2. Inserta en `reservas` al menos **3 registros** de ejemplo, utilizando clientes y PCs existentes.

### Ejercicio 2: Consultas de selección y filtros (2 puntos)

1. Listar el **nombre completo** de los clientes (`nombre`, `apellido`) que se registraron antes de **marzo de 2023** y cuyo e-mail termine en `@gmail.com`.
2. Mostrar los **números de PC** (`numero_pc`) que se encuentran en estado `'Disponible'` y tienen al menos **8 GB de RAM**.

### Ejercicio 3: Agregaciones y joins (3 puntos)

1. Calcular cuántos **usos** (`usos`) se realizaron en cada PC. Devuelve dos columnas: `numero_pc` y `total_usos`, ordenadas de mayor a menor.
2. Obtener el **gasto total** por cliente en la tabla `usos` (suma de `costo`), mostrando `id_cliente`, `nombre`, `apellido` y `total_gastado`. Filtrar para mostrar únicamente aquellos clientes cuyo gasto supere los **600 pesos**.

### Ejercicio 4: Ventas y estadísticas de productos (3 puntos)

1. Listar los **productos** que se han vendido (`ventas`), mostrando `nombre`, `precio`, `cantidad` vendida y el **total** calculado (`precio × cantidad`).
2. Encontrar el **producto más vendido** en términos de **cantidad total** (usar `SUM(cantidad)` y `GROUP BY`).
3. Crear una **vista** llamada `v_resumen_ventas` que muestre para cada producto:

   * `id_producto`
   * `nombre`
   * `stock`
   * `total_vendido` (SUM(cantidad))
   * `ingresos` (SUM(total))
