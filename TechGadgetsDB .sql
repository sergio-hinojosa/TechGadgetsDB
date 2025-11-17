-- Listar pedidos con nombre de cliente y empleado
SELECT 
    p.PedidoID,
    c.Nombre AS Cliente,
    e.Nombre AS Empleado,
    p.FechaPedido,
    p.Estado,
    p.Total
FROM Pedidos p
INNER JOIN Clientes c ON p.ClienteID = c.ClienteID
LEFT JOIN Empleados e ON p.EmpleadoID = e.EmpleadoID;

-- Detalle de un pedido específico con nombres de productos
SELECT 
    dp.DetalleID,
    p.PedidoID,
    prod.Nombre AS Producto,
    dp.Cantidad,
    dp.PrecioUnitario,
    dp.Subtotal
FROM DetallePedidos dp
INNER JOIN Pedidos p ON dp.PedidoID = p.PedidoID
INNER JOIN Productos prod ON dp.ProductoID = prod.ProductoID
WHERE p.PedidoID = 1;
