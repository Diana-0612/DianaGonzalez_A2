USE AkirasBoutiques;
GO

-- Consulta 1
SELECT
    c.nombre,
    c.apellido,
    f.fecha
FROM cliente c
INNER JOIN factura f
ON c.id_cliente = f.id_cliente
WHERE YEAR(f.fecha) = 2021;
GO

-- Consulta 2
SELECT
    c.nombre,
    c.apellido,
    f.fecha
FROM cliente c
INNER JOIN factura f
ON c.id_cliente = f.id_cliente
WHERE YEAR(f.fecha) = 2022;
GO

-- Consulta 3
SELECT
    c.nombre,
    c.apellido,
    f.fecha
FROM cliente c
INNER JOIN factura f
ON c.id_cliente = f.id_cliente
WHERE YEAR(f.fecha) = 2021
AND MONTH(f.fecha) = 12;
GO

-- Consulta 4
SELECT
    c.nombre,
    c.apellido,
    p.nombre AS Producto,
    d.cantidad,
    f.fecha
FROM cliente c
INNER JOIN factura f
    ON c.id_cliente = f.id_cliente
INNER JOIN detalle d
    ON f.id_detalle = d.id_detalle
INNER JOIN producto p
    ON d.id_producto = p.id_producto
WHERE CAST(c.nombre AS VARCHAR(100)) IN
(
'Valentina Anastasia',
'Zayra Manuela',
'Dante Eduardo',
'Ana Maribel',
'Rodrigo Ismael'
);
GO

-- Consulta 5
SELECT TOP 1
    CAST(p.nombre AS VARCHAR(100)) AS Producto,
    SUM(d.cantidad) AS TotalVendido
FROM producto p
INNER JOIN detalle d
    ON p.id_producto = d.id_producto
GROUP BY CAST(p.nombre AS VARCHAR(100))
ORDER BY TotalVendido DESC;
GO

-- Consulta 6
SELECT TOP 1
    CAST(nombre AS VARCHAR(100)) AS Producto,
    stock
FROM producto
ORDER BY stock DESC;
GO

-- Consulta 7
SELECT
    id_factura,
    id_cliente,
    fecha
FROM factura
ORDER BY fecha ASC;
GO

-- Consulta 8
SELECT
    nombre,
    apellido
FROM cliente
ORDER BY CAST(nombre AS VARCHAR(100)) ASC;
GO