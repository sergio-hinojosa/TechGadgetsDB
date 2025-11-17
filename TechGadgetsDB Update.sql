-- Actualizar el stock de un producto después de una compra
UPDATE Productos
SET Stock = Stock - 2
WHERE ProductoID = 1;  -- Mouse Gamer

-- Cambiar estado de pedido
UPDATE Pedidos
SET Estado = 'Enviado'
WHERE PedidoID = 1;
