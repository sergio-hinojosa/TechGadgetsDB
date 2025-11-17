-- Crear la base de datos
CREATE DATABASE TechGadgetsDB;
GO

USE TechGadgetsDB;
GO

-- Tabla de Clientes
CREATE TABLE Clientes (
    ClienteID      INT IDENTITY(1,1) PRIMARY KEY,
    Nombre         VARCHAR(100) NOT NULL,
    Email          VARCHAR(150) NOT NULL UNIQUE,
    Telefono       VARCHAR(20),
    Direccion      VARCHAR(200),
    FechaRegistro  DATE DEFAULT GETDATE()
);

-- Tabla de Empleados
CREATE TABLE Empleados (
    EmpleadoID     INT IDENTITY(1,1) PRIMARY KEY,
    Nombre         VARCHAR(100) NOT NULL,
    Email          VARCHAR(150) NOT NULL UNIQUE,
    Cargo          VARCHAR(50),
    FechaContratacion DATE DEFAULT GETDATE(),
    Salario        DECIMAL(10,2)
);

-- Tabla de Productos
CREATE TABLE Productos (
    ProductoID     INT IDENTITY(1,1) PRIMARY KEY,
    Nombre         VARCHAR(100) NOT NULL,
    Descripcion    VARCHAR(250),
    Precio         DECIMAL(10,2) NOT NULL,
    Stock          INT NOT NULL,
    Categoria      VARCHAR(50),
    Activo         BIT DEFAULT 1
);

-- Tabla de Pedidos (encabezado)
CREATE TABLE Pedidos (
    PedidoID       INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID      INT NOT NULL,
    EmpleadoID     INT NULL, -- quien atiende el pedido
    FechaPedido    DATETIME DEFAULT GETDATE(),
    Estado         VARCHAR(20) DEFAULT 'Pendiente',
    Total          DECIMAL(12,2) DEFAULT 0,
    CONSTRAINT FK_Pedidos_Clientes FOREIGN KEY (ClienteID)
        REFERENCES Clientes(ClienteID),
    CONSTRAINT FK_Pedidos_Empleados FOREIGN KEY (EmpleadoID)
        REFERENCES Empleados(EmpleadoID)
);

-- Tabla de Detalle de Pedido
CREATE TABLE DetallePedidos (
    DetalleID      INT IDENTITY(1,1) PRIMARY KEY,
    PedidoID       INT NOT NULL,
    ProductoID     INT NOT NULL,
    Cantidad       INT NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL,
    Subtotal       AS (Cantidad * PrecioUnitario) PERSISTED,
    CONSTRAINT FK_DetallePedidos_Pedidos FOREIGN KEY (PedidoID)
        REFERENCES Pedidos(PedidoID),
    CONSTRAINT FK_DetallePedidos_Productos FOREIGN KEY (ProductoID)
        REFERENCES Productos(ProductoID)
);
