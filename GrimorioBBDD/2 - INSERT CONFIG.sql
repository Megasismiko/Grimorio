USE GrimorioDB
GO

BEGIN TRY
	BEGIN TRANSACTION;

	insert into Rol(nombre) values
	('Administrador'),
	('Empleado'),
	('Supervisor')



	insert into Usuario(nombreCompleto,correo,idRol,clave) values 
	('admin','admin@admin.com',1,'admin')



	insert into Menu(nombre,icono,url) values
	('DashBoard','dashboard','/pages/dashboard'),
	('Usuarios','group','/pages/usuarios'),
	('Productos','collections_bookmark','/pages/productos'),
	('Venta','currency_exchange','/pages/venta'),
	('Historial Ventas','edit_note','/pages/historial_venta'),
	('Reportes','receipt','/pages/reportes')




--menus para administrador
	insert into MenuRol(idMenu,idRol) values
	(1,1),
	(2,1),
	(3,1),
	(4,1),
	(5,1),
	(6,1)



--menus para empleado
insert into MenuRol(idMenu,idRol) values
(4,2),
(5,2)



--menus para supervisor
	insert into MenuRol(idMenu,idRol) values
	(3,3),
	(4,3),
	(5,3),
	(6,3)



	insert into numerodocumento(ultimoNumero,fechaRegistro) values
	(0,getdate())


COMMIT TRANSACTION;
PRINT 'Transacción completada correctamente.';
END TRY
BEGIN CATCH   
    ROLLBACK TRANSACTION;

    PRINT 'Error en la transacción.';
    PRINT ERROR_MESSAGE();
END CATCH;
