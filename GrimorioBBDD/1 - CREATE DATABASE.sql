CREATE DATABASE GrimorioDB;
GO 
USE GrimorioDB
GO

CREATE TABLE Rol (
    IdRol INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50),
    FechaRegistro DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Menu (
    IdMenu INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50),
    Icono VARCHAR(50),
    Url VARCHAR(50)
);
GO

CREATE TABLE MenuRol (
    IdMenuRol INT PRIMARY KEY IDENTITY(1,1),
    IdMenu INT REFERENCES Menu(IdMenu),
    IdRol INT REFERENCES Rol(IdRol)
);
GO

CREATE TABLE Usuario (
    IdUsuario INT PRIMARY KEY IDENTITY(1,1),
    NombreCompleto VARCHAR(100),
    Correo VARCHAR(40),
    IdRol INT REFERENCES Rol(IdRol),
    Clave VARCHAR(40),
    EsActivo BIT DEFAULT 1,
    FechaRegistro DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Sets (
    IdSet INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50),
    Tipo VARCHAR(100),
    Codigo VARCHAR(5),
    FechaSalida DATETIME,
    Logo VARCHAR(500),
    EsActivo BIT DEFAULT 1,
    FechaRegistro DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Cartas (
    IdCarta INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100),
    Coste VARCHAR(20),
    Tipo VARCHAR(100),
    Rareza VARCHAR(50),
    Texto VARCHAR(MAX),
    Artista VARCHAR(100),
    Numero VARCHAR(10),
    Poder VARCHAR(5),
    Resistencia VARCHAR(5),
    ImagenUrl VARCHAR(500),
    IdSet INT NOT NULL,
    Stock INT,
    Precio DECIMAL(10,2),
    EsActivo BIT DEFAULT 1,
    FechaRegistro DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Cartas_Sets
        FOREIGN KEY (IdSet) REFERENCES dbo.Sets(IdSet)
        ON DELETE CASCADE
);
GO

CREATE TABLE NumeroDocumento (
    IdNumeroDocumento INT PRIMARY KEY IDENTITY(1,1),
    UltimoNumero INT NOT NULL,
    FechaRegistro DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Venta (
    IdVenta INT PRIMARY KEY IDENTITY(1,1),
    NumeroDocumento VARCHAR(40),
    TipoPago VARCHAR(50),
    Total DECIMAL(10,2),
    FechaRegistro DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE DetalleVenta (
    IdDetalleVenta INT PRIMARY KEY IDENTITY(1,1),
    IdVenta INT REFERENCES Venta(IdVenta),
    IdCarta INT REFERENCES Cartas(IdCarta),
    Cantidad INT,
    Precio DECIMAL(10,2),
    Total DECIMAL(10,2)
);
