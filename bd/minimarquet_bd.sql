cREATE DATABASE minimarket;

USE minimarket;

CREATE TABLE Perfil (
ID INT NOT NULL AUTO_INCREMENT,
perfil VARCHAR(20) NOT NULL,
PRIMARY KEY (ID)
);

CREATE TABLE Usuarios (
  ID INT NOT NULL AUTO_INCREMENT,
  usuario VARCHAR(50) NOT NULL,
  password VARCHAR(20) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  dni VARCHAR(100) NOT NULL,
  fechaingr DATE NOT NULL,
  perfil_id INT NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (perfil_id) REFERENCES Perfil(ID)
);


CREATE TABLE Categorias (
  ID INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE Proveedores (
  ID INT NOT NULL AUTO_INCREMENT,
  RUC VARCHAR(12) NOT NULL,
  Razon_Social VARCHAR(50) NOT NULL,
  Direccion VARCHAR(100) NOT NULL,
  Telefono VARCHAR(20),
  Correo VARCHAR(20),
  Representante_legal VARCHAR(30), 
  PRIMARY KEY (ID)
);

CREATE TABLE Productos (
  IDProducto CHAR(7) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  Descripcion VARCHAR(200),
  CategoriaID INT NOT NULL,
  PrecioCompra DECIMAL(10,2) NOT NULL,
  Cantidad INT NOT NULL,
  FechaVencimiento DATE NOT NULL,
  Lote VARCHAR(50) NOT NULL,
  ID_Proveedor INT NOT NULL,
  PRIMARY KEY (IDProducto),
  FOREIGN KEY (CategoriaID) REFERENCES Categorias(ID),
  FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores(ID)
);

CREATE TABLE Clientes (
  ID INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(50) NOT NULL,
  Direccion VARCHAR(100) NOT NULL,
  Telefono VARCHAR(20),
  PRIMARY KEY (ID)
);

CREATE TABLE Ventas (
  ID INT NOT NULL AUTO_INCREMENT,
  Fecha DATE NOT NULL,
  Total DECIMAL(10,2) NOT NULL,
  IDUsuario INT NOT NULL,
   IDCliente INT NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (IDUsuario) REFERENCES Usuarios(ID),
  FOREIGN KEY (IDCliente) REFERENCES Clientes(ID)
);

CREATE TABLE DetalleVentas (
  IDVenta INT NOT NULL,
  IDProducto CHAR(7) NOT NULL,
  Cantidad INT NOT NULL,
  Precio DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (IDVenta, IDProducto),
  FOREIGN KEY (IDVenta) REFERENCES Ventas(ID),
  FOREIGN KEY (IDProducto) REFERENCES Productos(IDProducto)
);

CREATE TABLE lote (
  Nro_lote INT NOT NULL AUTO_INCREMENT,
  cant_lote INT NOT NULL,
  descripcion_lote VARCHAR(200),
  fechaprod DATE NOT NULL,
  fechaven DATE NOT NULL,
  IDProducto CHAR(7) NOT NULL,
  PRIMARY KEY (Nro_lote),
  FOREIGN KEY (IDProducto) REFERENCES Productos(IDProducto)
);

--- llenar tabla perfiles
INSERT INTO Perfil (perfil) VALUES ('administrador'), ('vendedor'), ('almacén');
--llenar tabla usuarios

INSERT INTO Usuarios (usuario, password, nombre, apellido, dni, fechaingr, perfil_id) 
VALUES ('admin', 'admin123', 'Paul', 'Yupanqui', '45847547', '1989-05-21', 1);

INSERT INTO Usuarios (usuario, password, nombre, apellido, dni, fechaingr, perfil_id) 
VALUES ('ventas', 'ventas123', 'Juan', 'Valdez', '41578454', '1995-02-17', 2);

INSERT INTO Usuarios (usuario, password, nombre, apellido, dni, fechaingr, perfil_id) 
VALUES ('almacen', 'almacen123', 'Carlos', 'Mejia', '41741254', '1993-12-25', 3);

UPDATE Usuarios SET password = 'ventas123' WHERE usuario = 'ventas';


