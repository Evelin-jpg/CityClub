CREATE DATABASE CityClubDB;

Use CityClubDB


CREATE TABLE Membresia
(
IDMembresia int not null identity (1,1) primary key,
Numero varchar (50) not null,
Tipo varchar(50) not null,
premia bit default 0,
Status bit default 1
);

CREATE TABLE Producto
(
IDProducto int not null identity (1,1) primary key,
Clave varchar (50) not null,
Nombre varchar(50) not null,
precio int not null,
Status bit default 1
);

CREATE TABLE Socio
(
IDSocio int not null identity (1,1) Primary key,
Nombre varchar (50) not null,
Telefono varchar(50) not null,
Fechaingreso datetime not null,
IDMembresia int not null,
Status bit default 1
);

CREATE TABLE Usuario
(
IDUsuario int not null identity (1,1) Primary key,
NumEmpleado varchar (50) not null,
Nombre varchar(50) not null,
Contrasena varchar(50) not null,
Status bit default 1
);

CREATE TABLE SocioProducto
(
IDSocioProducto int not null identity (1,1) primary key,
IDSocio int not null,
IDProducto int not null,
Status bit default 1
);

CREATE TABLE UsuarioSocio
(
IDUsuarioSocio int not null identity (1,1) primary key,
IDUsuario int not null,
IDSocio int not null,
Status bit default 1
);

ALTER TABLE Socio ADD CONSTRAINT FK_SocioMembresia
FOREIGN  KEY(idMembresia) REFERENCES Membresia(idMembresia)
GO
ALTER TABLE SocioProducto ADD CONSTRAINT FK_SocioProducto
FOREIGN  KEY(idSocio) REFERENCES Socio(idSocio)
GO
ALTER TABLE SocioProducto ADD CONSTRAINT FK_SocioProducto
FOREIGN  KEY(idProducto) REFERENCES Producto(idProducto)
GO
ALTER TABLE UsuarioSocio ADD CONSTRAINT FK_UsuarioSocio
FOREIGN  KEY(idUsuario) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE UsuarioSocio ADD CONSTRAINT FK_UsuarioSocio
FOREIGN  KEY(idSocio) REFERENCES Socio(idSocio)
GO