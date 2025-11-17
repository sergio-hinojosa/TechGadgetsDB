-- Todos los productos activos, mostrando nombre en mayúsculas
SELECT 
    ProductoID,
    UPPER(Nombre) AS NombreProducto,
    Precio,
    Stock
FROM Productos
WHERE Activo = 1;

-- Clientes registrados en el último año
SELECT 
    ClienteID, Nombre, FechaRegistro
FROM Clientes
WHERE FechaRegistro >= DATEADD(YEAR, -1, GETDATE());

-- Pedidos con total mayor a 2000
SELECT PedidoID, ClienteID, FechaPedido, Total
FROM Pedidos
WHERE Total > 2000;
