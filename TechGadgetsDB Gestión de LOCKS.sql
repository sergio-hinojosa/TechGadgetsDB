SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;

-- Seleccionar un producto con intención de actualizar (lock de actualización)
SELECT * 
FROM Productos WITH (UPDLOCK)
WHERE ProductoID = 1;

-- Actualizar stock
UPDATE Productos
SET Stock = Stock - 1
WHERE ProductoID = 1;

COMMIT TRANSACTION;
