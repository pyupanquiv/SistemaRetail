CREATE DATABASE minimarketV2;

USE minimarketV2;

CREATE TABLE perfil (
    ID INT(11) PRIMARY KEY AUTO_INCREMENT,
    perfil VARCHAR(20)
);

CREATE TABLE usuarios (
    ID INT(11) PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(50),
    password VARCHAR(20),
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    dni VARCHAR(100),
    fechaingr DATE,
    perfil_id INT(11),
    FOREIGN KEY (perfil_id) REFERENCES perfil(ID)
);

CREATE TABLE cliente (
    idCliente INT(11) PRIMARY KEY AUTO_INCREMENT,
    Dni VARCHAR(8),
    Nombres VARCHAR(244),
    Direccion VARCHAR(244),
    Estado VARCHAR(1)
);

CREATE TABLE producto (
    IdProducto INT(11) PRIMARY KEY AUTO_INCREMENT,
    Nombres VARCHAR(244),
    Precio DOUBLE,
	FechaVencimiento DATE,
    Stock INT(11),
    Estado VARCHAR(1)
);

CREATE TABLE ventas (
    idVentas INT(11) PRIMARY KEY AUTO_INCREMENT,
    IdCliente INT(11),
    IdEmpleado INT(11),
    NumeroSerie VARCHAR(244),
    FechaVentas DATE,
    Monto DOUBLE,
    Estado VARCHAR(1),
    FOREIGN KEY (IdCliente) REFERENCES cliente(idCliente),
    FOREIGN KEY (IdEmpleado) REFERENCES usuarios(ID)
);

CREATE TABLE detalle_ventas (
    IdDetalleVentas INT(11) PRIMARY KEY AUTO_INCREMENT,
    idVentas INT(11),
    IdProducto INT(11),
    Cantidad INT(11),
    PrecioVenta DOUBLE,
    FOREIGN KEY (idVentas) REFERENCES ventas(idVentas),
    FOREIGN KEY (IdProducto) REFERENCES producto(IdProducto)
);


------------------------------------------------------

ISNERTAR REGISTROS

USE minimarketV2;

-- Insertar datos en tabla perfil
INSERT INTO perfil (ID, perfil)
VALUES (1, 'Administrador'),
       (2, 'Vendedor'),
       (3, 'Cajero'),
       (4, 'Almacen');

-- Insertar datos en tabla usuarios
INSERT INTO usuarios (ID, usuario, password, nombre, apellido, dni, fechaingr, perfil_id)
VALUES (1, 'admin', '123456', 'Paul', 'Yupanqui', '45745874', '2022-01-01', 1),
       (2, 'vendedor', '123456', 'María', 'García', '41254789', '2022-02-15', 2),
       (3, 'cajero', '123456', 'Pedro', 'Ramírez', '41202145', '2022-03-20', 3),
       (4, 'almacen', '123456', 'Ana', 'López', '741255784', '2022-04-25', 4);

-- Insertar datos en tabla cliente
INSERT INTO cliente (idCliente, Dni, Nombres, Direccion, Estado)
VALUES (1, '12345678', 'Carlos Pérez', 'Av. Las Flores 123', 'A'),
       (2, '23456789', 'María Gutiérrez', 'Jr. Los Pinos 456', 'I'),
       (3, '34567890', 'Luis González', 'Av. La Mar 789', 'A'),
       (4, '45678901', 'Fernanda Sánchez', 'Calle Los Cedros 234', 'A');

-- Insertar datos en tabla producto
INSERT INTO producto (Nombres, Precio, FechaVencimiento, Stock, Estado)
VALUES
		('Leche', 2.50, '2023-06-30', 50, 'A'),
		('Queso', 8.00, '2023-07-15', 20, 'A'),
		('Huevos', 1.50, '2023-06-25', 100, 'A'),
		('Cebolla', 1.00, '2023-06-20', 80, 'A'),
		('Tomate', 1.20, '2023-06-22', 60, 'A');

-- Insertar datos en tabla ventas
INSERT INTO ventas (idVentas, IdCliente, IdEmpleado, NumeroSerie, FechaVentas, Monto, Estado)
VALUES (1, 1, 2, '00000010', '2022-05-01', 30.00, 'A');
       (2, 1, 4, '0002-2022', '2022-05-02', 15.50, 'A'),
       (3, 3, 3, '0003-2022', '2022-05-03', 22.00, 'A'),
       (4, 4, 1, '0004-2022', '2022-05-04', 40.00, 'A');

-- Insertar datos en tabla detalle_ventas
INSERT INTO detalle_ventas (IdDetalleVentas, idVentas, IdProducto, Cantidad, PrecioVenta)
VALUES (1, 1, 1, 5, 5.50),
       (2, 1, 2, 3, 3.50),
       (3, 2, 3, 4, 3.50=;
	   
	   
	   
ALTER TABLE usuarios AUTO_INCREMENT = 1;
