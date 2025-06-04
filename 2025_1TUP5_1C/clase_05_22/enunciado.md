# UTN - FRRO {align=center}
## Técnicatura Universitaria en Programación {align=center}
### Docente: Giuliano Crenna {align=center}

---

## Enunciado: **Sistema de Gestión de Ciber**

El dueño de un ciber ubicado en Rosario ha digitalizado la gestión de su negocio, el cual incluye clientes frecuentes, computadoras numeradas, consumos por hora de uso y productos vendidos en el kiosquito. Para ayudarte a familiarizarte con los conceptos de bases de datos, te solicita que realices una serie de **consultas simples** sobre la información almacenada.

Contás con las siguientes tablas en la base de datos `ciber_rosarino`:

* `clientes(id_cliente, nombre, apellido, dni, telefono, email, fecha_registro)`
* `computadoras(id_pc, numero_pc, marca, ram_gb, estado)`
* `usos(id_uso, id_cliente, id_pc, fecha, hora_inicio, hora_fin, costo)`
* `productos(id_producto, nombre, precio, stock)`
* `ventas(id_venta, id_cliente, id_producto, fecha, cantidad, total)`

---

## Ejercicios

1. Mostrar todos los registros de la tabla `productos`.
2. Contar cuántos clientes hay registrados en total.
3. Mostrar el nombre de cada producto y su precio.
4. Calcular el precio promedio de todos los productos del ciber.
5. Mostrar la cantidad total de productos en stock (sumar stock).
6. Contar cuántas computadoras están registradas.
7. Obtener el costo total acumulado por todos los usos registrados.
8. Mostrar la cantidad total de ventas realizadas.
9. Calcular el total de dinero recaudado en todas las ventas.
10. Mostrar el total recaudado en cada venta (`total`) junto con el ID de la venta.
11. Mostrar el promedio del costo de uso por sesión.
12. Contar cuántos usos fueron registrados por fecha (usar `GROUP BY fecha`).
13. Mostrar cuántos productos distintos hay.
14. Mostrar la cantidad de veces que se vendió cada producto (agrupar por `id_producto`).
15. Mostrar el promedio de RAM de las computadoras.
