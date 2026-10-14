
--Consulta 1 - Resumen ejecutivo mensual
SELECT  
MONTH(fecha_venta) AS Mes,
AVG (precio_unitario) AS Ticket_Promedio,
COUNT (id_venta) AS Cantidad_Pedidos,
SUM(cantidad * precio_unitario) AS Total_Facturado
FROM dbo.Ventas 
GROUP BY MONTH (fecha_venta);

--Consulta 2 - Ranking de productos 

SELECT TOP 5 id_producto,
SUM (cantidad) AS Cantidad_ventas,
SUM (cantidad*precio_unitario) AS total_facturado
FROM dbo.Ventas
GROUP BY id_producto
ORDER BY SUM(cantidad*precio_unitario) DESC;

--Consulta 3 - Clientes recurrentes

SELECT id_cliente,
SUM (Cantidad) AS cantidad_comprada,
SUM (Cantidad*precio_unitario) AS Total_comprado
FROM dbo.Ventas
GROUP BY id_cliente 
HAVING COUNT(*) >1
ORDER BY SUM (Cantidad*precio_unitario) DESC;

--Consulta 4 - Meses por encima/por de bajo del promedio

WITH ventas_mensuales AS (
    SELECT 
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
)
SELECT 
    mes,
    total_facturado,
    CASE WHEN total_facturado >= (SELECT AVG(total_facturado) FROM ventas_mensuales) 
            THEN 'Por encima'
        ELSE 'Por debajo'
    END AS estado_promedio
FROM ventas_mensuales
ORDER BY mes;

-- Comentarios: 
--El resumen ejecutivo da que el mes de Marzo es el único que registra operaciones de venta
--El prodcuto id 2 abarca el 50% de la cantidad de ventas, aun así es el de menor total facturado
--EL cliente id 1 representa el 42.96% del total de ventas de la empresa.

--La consulta N°4 me resultó muy dificil y tuve que ayudarme de la IA ¿Será posible analizarlo en clase?


--Revisión tabla ventas
SELECT * FROM ventas;  



