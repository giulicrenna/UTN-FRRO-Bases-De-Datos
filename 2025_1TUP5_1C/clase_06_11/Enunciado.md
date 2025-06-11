# UTN - FRRO
## Técnicatura Universitaria en Programación
### Docente: Giuliano Crenna

---

# Ejercicios de Stored Procedures

## Base de Datos: `ecommerce_arg`

Sistema de comercio electrónico con tablas para usuarios, productos, órdenes, pagos y detalles.

### Ejercicios

1. Crear un procedimiento almacenado llamado `sp_productos_por_categoria` que reciba una categoría como parámetro y muestre todos los productos activos de esa categoría.

2. Crear un procedimiento `sp_ordenes_por_usuario` que reciba el ID de un usuario y devuelva todas sus órdenes con su estado y total.

3. Crear un procedimiento `sp_stock_bajo` que muestre todos los productos cuyo stock sea menor a 10 unidades.

4. Crear un procedimiento `sp_pagos_confirmados_por_fecha` que reciba una fecha como parámetro y liste todos los pagos confirmados de esa fecha.

5. Crear un procedimiento `sp_ventas_por_producto` que reciba un ID de producto y devuelva la cantidad total vendida según `detalle_orden`.

6. Crear un procedimiento `sp_actualizar_stock` que reciba un ID de producto y una cantidad, y reste esa cantidad del stock actual.

7. Crear un procedimiento `sp_orden_detallada` que reciba el ID de una orden y devuelva los datos de la orden, los productos asociados (nombre, cantidad, precio) y el total acumulado.

8. Crear un procedimiento `sp_clientes_recientes` que devuelva todos los usuarios registrados en el último mes desde la fecha actual.

9. Crear un procedimiento `sp_cancelar_orden` que reciba el ID de una orden y actualice su estado a `'Cancelado'` si aún está en estado `'Pendiente'`.

10. Crear un procedimiento `sp_estadisticas_pagos` que devuelva la suma total de montos agrupados por método de pago.

11. Crear un procedimiento `sp_producto_mas_vendido` que devuelva el producto con mayor cantidad vendida.

12. Crear un procedimiento `sp_total_gastado_por_usuario` que reciba un ID de usuario y calcule el total pagado por todas sus órdenes con pagos confirmados.

---

## Base de Datos: `ciber_rosarino`

Sistema de gestión de cibercafé con clientes, computadoras, sesiones de uso, productos y ventas.

### Ejercicios

1. Crear un procedimiento `sp_productos_bajo_stock` que reciba un valor límite y muestre todos los productos con stock menor a ese valor.

2. Crear un procedimiento `sp_total_gastado_por_cliente` que reciba un ID de cliente y devuelva la suma total gastada entre usos de computadoras y productos comprados.

3. Crear un procedimiento `sp_uso_por_fecha` que reciba una fecha y devuelva todas las sesiones de uso registradas ese día, incluyendo cliente, computadora y costo.

4. Crear un procedimiento `sp_clientes_frecuentes` que reciba un número N y devuelva los clientes con más de N sesiones de uso.

5. Crear un procedimiento `sp_disponibilidad_pc` que reciba una marca y devuelva las computadoras disponibles de esa marca.

6. Crear un procedimiento `sp_registrar_uso` que reciba ID de cliente, número de PC, hora de inicio y fin, calcule el costo y registre el uso.

7. Crear un procedimiento `sp_registrar_venta` que reciba ID de cliente, ID de producto y cantidad, actualice el stock y registre la venta solo si hay stock suficiente.

8. Crear un procedimiento `sp_clientes_recientes` que devuelva los clientes registrados en los últimos 30 días.

9. Crear un procedimiento `sp_productos_mas_vendidos` que devuelva los tres productos más vendidos, incluyendo cantidad total y monto.

10. Crear un procedimiento `sp_resumen_diario` que reciba una fecha y devuelva el total facturado por ventas y por uso de computadoras en esa fecha.
