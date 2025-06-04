Use pre_evaluacion;

/* 6
SELECT
c.nombre,
c.apellido,
v.fecha_venta,
e.nombre
From clientes as c
inner join ventas as v on c.id_cliente = v.id_cliente
inner join empleados as e on e.id_empleado = v.id_empleado;
*/

/*7
select
p.nombre,
d.cantidad,
d.precio_unitario,
v.fecha_venta
from productos as p
inner join detalle_ventas as d on p.id_producto = d.id_producto
inner join ventas as v on d.id_venta = v.id_venta
order by fecha_venta;
*/

/*8
select
p.stock,
sum(d.cantidad) as total_vendido
from productos as p
left join detalle_ventas AS d ON p.id_producto = d.id_producto
group by p.nombre, p.stock;
*/

/* 9
select 
p.nombre as producto,
e.apellido as empleado,
e.nombre as empleado,
SUM(d.cantidad * d.precio_unitario) AS total_facturado
from empleados as e
inner join ventas as v on e.id_empleado = v.id_empleado
inner join detalle_ventas as d on v.id_venta = d.id_venta
inner join productos as p on d.id_producto = p.id_producto
group by e.nombre, e.apellido, p.nombre
order by total_facturado desc; /*desc = decendente;*/

/*10
select
c.nombre as cliente,
c.apellido as cliente,
count(v.id_venta) as cantida_ventas
from clientes as c
inner join  ventas AS v ON c.id_cliente = v.id_cliente
group by c.nombre, c.apellido
having COUNT(v.id_venta) > 2
order by c.apellido, c.nombre;
*/