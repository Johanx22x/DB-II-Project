USE HomeCredit;
GO

-- Create an admin user (with superuser privileges)
CREATE LOGIN superUser WITH PASSWORD = '6d192ca03fc0be13976f27079c09dad1b90adff3d35e7e5bd79a09e1681398bd';
GO

CREATE USER superUser FOR LOGIN superUser;
GO

ALTER SERVER ROLE sysadmin ADD MEMBER superUser;
GO

-- Create a normal user, with access to tables and stored procedures
CREATE LOGIN normalUser WITH PASSWORD = 'Dpt42-WAJd.12';
GO

CREATE USER normalUser FOR LOGIN normalUser;
GO

GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON SCHEMA :: Client TO normalUser;
GO 

GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON SCHEMA :: Application TO normalUser;
GO 

GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON SCHEMA :: Credit_Bureau TO normalUser;
GO

GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON SCHEMA :: Previous_Application TO normalUser;
GO

-- Create a backup user 
CREATE LOGIN backupUser WITH PASSWORD = 'b4ckupUs3r';
GO 

CREATE USER backupUser FOR LOGIN backupUser;
GO

ALTER ROLE [db_backupoperator] ADD MEMBER [backupUser]
GO

GRANT BACKUP DATABASE TO backupUser;
GO

USE master;
GO