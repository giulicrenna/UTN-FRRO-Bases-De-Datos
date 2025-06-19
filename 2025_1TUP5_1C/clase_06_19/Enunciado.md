# UTN - FRRO
## Técnicatura Universitaria en Programación
### Docente: Giuliano Crenna

---

# Tablas Temporales

1. **Ventas por producto en un rango de fechas**
   Crea una tabla temporal que agrupe, por `id_producto` y `nombre`, el total de unidades vendidas y el importe acumulado entre el 1 de marzo y el 31 de marzo de 2025.

2. **Clientes más activos**
   Genera una tabla temporal con los 10 clientes que más órdenes han realizado durante el último trimestre, indicando `id_cliente`, `nombre` y número de órdenes.

3. **Resumen de pagos pendientes**
   Construye una tabla temporal que liste todas las órdenes cuyo pago aún no esté confirmado, con columnas `id_orden`, `fecha_orden`, `id_cliente`, `total` y `método_pago`.

4. **Top 5 productos con mejor margen**
   Crea una tabla temporal que calcule margen (`precio_unitario – costo_unitario`) por producto y seleccione los cinco productos con mayor margen medio.

5. **Análisis de devoluciones**
   Diseña una tabla temporal que reúna las devoluciones registradas en abril de 2025, incluyendo `id_devolución`, `id_orden`, `id_producto`, `cantidad` y `motivo`.

6. **Montos de órdenes por región**
   Genera una tabla temporal que agrupe el total facturado (`SUM(total)`) por `región` de envío, usando las tablas `ordenes` y `direcciones_cliente`.

7. **Promedio diario de ventas**
   Crea una tabla temporal que, para cada día del mes pasado, muestre el número de órdenes y el importe total de ventas.

8. **Productos sin movimiento**
   Construye una tabla temporal que liste los productos que no han tenido ningún detalle de orden en los últimos seis meses, con `id_producto` y `nombre`.

9. **Clientes y su ticket promedio**
   Genera una tabla temporal que calcule el ticket promedio (`AVG(total)`) de cada cliente y luego filtre solo aquellos cuyo promedio supere los 100 USD.

10. **Top categorías por facturación**
    Crea una tabla temporal que sume la facturación total por `id_categoria` y `nombre_categoria`, ordenada de mayor a menor, y que conserve solo las tres principales.
