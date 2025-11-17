-- Clientes
INSERT INTO Clientes (Nombre, Email, Telefono, Direccion)
VALUES 
('Juan Pérez', 'juan.perez@correo.com', '555-111-2222', 'CDMX'),
('Ana López', 'ana.lopez@correo.com', '555-333-4444', 'Guadalajara'),
('Carlos Gómez', 'carlos.gomez@correo.com', '555-555-6666', 'Monterrey');

-- Empleados
INSERT INTO Empleados (Nombre, Email, Cargo, Salario)
VALUES
('María Sánchez', 'maria.sanchez@techgadgets.com', 'Vendedor', 15000),
('Luis Torres', 'luis.torres@techgadgets.com', 'Soporte', 14000);

-- Productos
INSERT INTO Productos (Nombre, Descripcion, Precio, Stock, Categoria)
VALUES
('Mouse Gamer', 'Mouse óptico RGB', 450.00, 100, 'Accesorios'),
('Teclado Mecánico', 'Teclado mecánico retroiluminado', 1200.00, 50, 'Accesorios'),
('Laptop Ultrabook', 'Laptop 14" 16GB RAM', 18500.00, 20, 'Computadoras'),
('Audífonos Bluetooth', 'Audífonos inalámbricos', 900.00, 80, 'Audio');

-- Pedido de ejemplo
INSERT INTO Pedidos (ClienteID, EmpleadoID, Estado)
VALUES (1, 1, 'Pendiente');  -- PedidoID = 1 (probablemente)

INSERT INTO DetallePedidos (PedidoID, ProductoID, Cantidad, PrecioUnitario)
VALUES
(1, 1, 2, 450.00),
(1, 4, 1, 900.00);

-- Actualizar el total del pedido 1
UPDATE Pedidos
SET Total = (
    SELECT SUM(Subtotal) FROM DetallePedidos WHERE PedidoID = 1
)
WHERE PedidoID = 1;
