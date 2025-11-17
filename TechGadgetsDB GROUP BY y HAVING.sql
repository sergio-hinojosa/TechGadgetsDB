-- Total de ventas por producto
SELECT 
    prod.ProductoID,
    prod.Nombre,
    SUM(dp.Cantidad) AS TotalCantidad,
    SUM(dp.Subtotal) AS TotalVendido
FROM DetallePedidos dp
INNER JOIN Productos prod ON dp.ProductoID = prod.ProductoID
GROUP BY prod.ProductoID, prod.Nombre;

-- Ventas totales por cliente, mostrando solo clientes con más de $5000
SELECT 
    c.ClienteID,
    c.Nombre,
    SUM(p.Total) AS TotalComprado
FROM Pedidos p
INNER JOIN Clientes c ON p.ClienteID = c.ClienteID
GROUP BY c.ClienteID, c.Nombre
HAVING SUM(p.Total) > 5000;
