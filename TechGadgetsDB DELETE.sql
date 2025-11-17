-- Eliminar un producto inactivo SIN pedidos asociados
DELETE FROM Productos
WHERE ProductoID = 4
  AND Activo = 0;
