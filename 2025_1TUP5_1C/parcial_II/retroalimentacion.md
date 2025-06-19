# UTN-FRRO  
## Tecnicatura Universitaria en Programación  
### Docente: Giuliano Crenna  

---  

#### Eliso Mirleni  
**Nota:** La estructura es correcta, pero faltan detalles importantes:  
- **Ejercicio 1:** No se insertaron los cinco registros solicitados.  
- **Ejercicio 2:** El patrón de búsqueda debe ser LIKE '%@gmail.com' (incluyendo la arroba).  
- **Ejercicio 5:** La condición de JOIN con vendedores debe ser  
vn.id_vendedor = v.id_vendedor  
- **Ejercicio 6:** Después de crear el procedimiento es necesario volver a  
DELIMITER ;  

#### Ivan Bertoni  
**Nota:** La definición de la tabla es correcta, pero no cumple el requisito de insertar al menos cinco registros, y la columna se nombra id_ventas en lugar de id_venta como se solicitó.  
Faltan además los demás ejercicios.  

#### Francesco Dagostino  
**Nota:** La estructura general está, pero hay errores importantes:  
1. **Ejercicio 1:** Los INSERT son correctos.  
2. **Ejercicios 2 y 3:** Consultas bien formuladas.  
3. **Ejercicio 4:** No debe usarse GROUP BY al listar sin agregación; sobra esa cláusula y puede fallar en SQL estricto.  
4. **Ejercicio 5:**  
   - Falta incluir los apellidos de cliente y vendedor.  
   - El alias v.nombre no deja claro a qué nombre se refiere; debería ser  
v.nombre, v.apellido  
5. **Ejercicio 6:**  
   - El procedimiento usa alias de tablas (a.id_auto, c.id_cliente, etc.) en lugar de los parámetros (p_id_auto, p_id_cliente, …).  
   - La llamada CALL pasa seis argumentos a un procedimiento que sólo recibe cinco.  
   - No se vuelve a DELIMITER ; al final.  

#### Richard Rojas  
**Nota:** La estructura de las consultas está bien, pero faltan puntos esenciales:  
- **Ejercicio 1:** Nunca insertaste los cinco registros requeridos en ventas.  
- **Ejercicio 5:** Sólo traes los nombres; faltan los apellidos de cliente y vendedor para mostrar el nombre completo.  
- **Ejercicio 6:** El procedimiento tiene errores de sintaxis:  
  - Duplicas id_vendedor.  
  - Usas fechar_venta en vez de fecha_venta.  
  - El parámetro p_fechar_venta está mal escrito.  
  - No restableces el delimitador ni llamas al CALL.  

#### Ramiro Muñoz  
**Nota:** Hay múltiples errores que impiden la ejecución y no cumple los requisitos mínimos:  
- **Ejercicio 1:** Insertaste sólo 4 ventas y omitiste columnas obligatorias (id_auto, id_cliente, id_vendedor).  
- **Ejercicio 2:** La consulta carece de FROM, usa el campo mail inexistente y el LIKE omitió la arroba ('%@gmail.com').  
- **Ejercicio 3:** Agrupas por v.id_venta, lo cual fragmenta el conteo; debe agruparse solo por forma_pago.  
- **Ejercicio 4:** No incluiste FROM ventas ni los JOIN necesarios con autos y clientes.  
- **Ejercicio 5:** Falta la unión con cada tabla y los alias correctos.  
- **Ejercicio 6:** No creaste el procedimiento ni lo llamaste.  

Revisa la sintaxis de cada bloque, asegúrate de incluir los cinco INSERT, las cláusulas FROM y los JOIN correctos, y de implementar el procedimiento almacenado.  

#### Ismael Hernández  
**Nota:** Aún hay errores y falta completar ejercicios:  
1. **Ejercicio 1:** Usaste VALUE en lugar de VALUES; aunque el conteo de 5 filas es correcto, la sintaxis impide la ejecución.  
2. **Ejercicio 2:** Escribiste  
WHERE email = (%gmail%)  
en vez de  
WHERE email LIKE '%@gmail.com'  
y luego usas ORDER BY c.id_clientes sobre una columna inexistente.  
3. **Ejercicio 3:** No está ni empezado.  

Corrige la sintaxis de los INSERT, usa LIKE '%@gmail.com' y completa la consulta de cantidad por forma de pago.  

#### Facundo Nieva  
**Nota:** Hay errores graves que impiden cualquier ejecución:  
- No insertaste ningún registro en ventas tras recrear la tabla.  
- La definición del procedimiento insertar_venta está incompleta y mal ubicada; falta cuerpo y delimitadores correctos.  
- Re-creaste dos veces la tabla ventas con columnas y orden distintos.  
- En los SELECT empleas alias y nombres de columna erróneos (a.id en lugar de a.id_auto, c.id en lugar de c.id_cliente).  
- El filtro de mails olvida la arroba ('%gmail.com' en vez de '%@gmail.com').  

Reestructura en un solo bloque la creación de ventas, añade los 5 INSERT, corrige los SELECT y completa el procedimiento correctamente para mejorar la calificación.  
