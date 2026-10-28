SELECT * FROM dbo.Categorias
SELECT * FROM dbo.clientes
SELECT * FROM dbo.productos
SELECT * FROM dbo.Ventas

-- Consulta 1: Vista base del proyecto (INNER JOIN)
--Propósito:Este apartado busca crear tablas de facil lectura para un rápido análisis de situación por parte de la mesa directiva.

--Tabla de relación 
SELECT 
fecha_venta,
nombre,
email,
ciudad,
nombre_producto,
nombre_categoria,
cantidad,
precio_unitario,
(precio_unitario * cantidad) AS Total_venta
FROM Ventas  V
INNER JOIN Clientes C ON V.id_cliente = C.id_cliente
INNER JOIN Productos P ON V.id_producto = P.id_producto
INNER JOIN Categorias CT ON P.id_categoria= CT.id_categoria

--HALLAZGO: 
--La tabla permite ver rápidamente las ventas realizadas con su información, a la par que los datos del cliente que la realizó y información de los productos y cuanto se vendió, esto puede ser útil para una rápida actualizacón de stock.  

-- Consulta 2: Clientes sin ventas (LEFT JOIN) 
--Propósito:La tabla busca a los clientes que se registraron pero que aún no han realizado una compra.

SELECT
V.id_cliente,
nombre,
ciudad,
id_venta,
fecha_venta
FROM Ventas V 
LEFT JOIN Clientes C ON V.id_cliente =C.id_cliente
WHERE V.id_cliente IS NULL;

--HALLAZGO:
--Todos los clientes que están registrados han realizadó al menos una compra.
--No apareció ningun registro como NULL, esto puede significar el área de ventas, para registrarte como cliente, primero tiene que hacerte realizar una compra.

-- Consulta 3: Productos sin ventas (RIGHT JOIN) 
--Propósito:La tabla busca a los productos que no tienen niguna venta registrada hasta el momento.

SELECT
V.id_producto,
nombre_producto,
stock,
activo,
id_venta,
fecha_venta
FROM Ventas V 
LEFT JOIN productos P ON V.id_producto =P.id_producto
WHERE v.id_producto IS NULL;

--HALLAZGO:
--Todos los productos han sido vendidos al menos una vez.
--Al no aparecer ningún producto en la tabla, significa que las áreas de almacenamiento y compras lograron obtener productos que tienen un demanda real en el mercado.

--Consulta 4 — Consolidado por canal (UNION ALL)
--Porposito: Analizar la apertura del canal de ventas ONLINE que se realizó el 2024-03-10 y comprar los siguientes 5 días de ventas contra los anteriores 5 días de ventas en el canal presencial.

SELECT canal, SUM(total) AS total_canal
FROM (
    SELECT fecha_venta, cantidad * precio_unitario AS total, 'Presencial' AS canal
    FROM ventas 
    WHERE fecha_venta BETWEEN '2024-03-05' AND '2024-03-09'  
    UNION ALL
    SELECT fecha_venta, cantidad * precio_unitario AS total, 'Online' AS canal
    FROM ventas 
    WHERE fecha_venta BETWEEN '2024-03-10' AND '2024-03-14'
) AS consolidado
GROUP BY canal;

--HALLAZGO:
--El canal de ventas Online registro una menor facturacón total en los periodos analizados.

