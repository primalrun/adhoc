USE DWIntegrations
GO

CREATE ROLE role_exec_dbo
GO
GRANT EXECUTE ON SCHEMA::dbo TO role_exec_dbo
GO


EXEC sp_addrolemember 'role_exec_dbo', 'shdw_link'