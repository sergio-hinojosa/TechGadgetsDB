BEGIN TRANSACTION;

BEGIN TRY
    DECLARE @PedidoID INT;

    -- 1. Crear el pedido
    INSERT INTO Pedidos (ClienteID, EmpleadoID, Estado)
    VALUES (2, 1, 'Pendiente');

    SET @PedidoID = SCOPE_IDENTITY();

    -- 2. Insertar detalles
    INSERT INTO DetallePedidos (PedidoID, ProductoID, Cantidad, PrecioUnitario)
    VALUES
    (@PedidoID, 2, 1, 1200.00), -- Teclado
    (@PedidoID, 3, 1, 18500.00); -- Laptop

    -- 3. Actualizar stock
    UPDATE Productos
    SET Stock = Stock - 1
    WHERE ProductoID IN (2, 3);

    -- 4. Actualizar total
    UPDATE Pedidos
    SET Total = (
        SELECT SUM(Subtotal) FROM DetallePedidos WHERE PedidoID = @PedidoID
    )
    WHERE PedidoID = @PedidoID;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;

    -- Opcional: mostrar error
    SELECT ERROR_NUMBER() AS ErrorNumber,
           ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
