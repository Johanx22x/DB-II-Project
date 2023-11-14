USE HomeCredit;
GO

-- Create the Audit table
CREATE TABLE Audit (
    id              INT IDENTITY(1,1) NOT NULL,
    timestamp       DATETIME NOT NULL,
    author            VARCHAR(255) NOT NULL,
    action          VARCHAR(255) NOT NULL,
    description     VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
GO

-- Create the triggers for each table

-- Application.Application table
CREATE TRIGGER tr_Audit_Application
ON Application.Application
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @action VARCHAR(255);

    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        IF EXISTS (SELECT 1 FROM deleted)
            SET @action = 'UPDATE';
        ELSE
            SET @action = 'INSERT';
    END
    ELSE
        SET @action = 'DELETE';

    INSERT INTO Audit (timestamp, author, action, description)
    VALUES (GETDATE(), USER_NAME(), @action, 'Affected record in table Application');
END;
GO

-- Client.Client table
CREATE TRIGGER tr_Audit_Client
ON Client.Client
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @action VARCHAR(255);

    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        IF EXISTS (SELECT 1 FROM deleted)
            SET @action = 'UPDATE';
        ELSE
            SET @action = 'INSERT';
    END
    ELSE
        SET @action = 'DELETE';

    INSERT INTO Audit (timestamp, author, action, description)
    VALUES (GETDATE(), USER_NAME(), @action, 'Affected record in table Client');
END;
GO

-- Client.Family table
CREATE TRIGGER tr_Audit_Family
ON Client.Family
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @action VARCHAR(255);

    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        IF EXISTS (SELECT 1 FROM deleted)
            SET @action = 'UPDATE';
        ELSE
            SET @action = 'INSERT';
    END
    ELSE
        SET @action = 'DELETE';

    INSERT INTO Audit (timestamp, author, action, description)
    VALUES (GETDATE(), USER_NAME(), @action, 'Affected record in table Family');
END;
GO

-- Client.Income table
CREATE TRIGGER tr_Audit_Income
ON Client.Income
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @action VARCHAR(255);

    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        IF EXISTS (SELECT 1 FROM deleted)
            SET @action = 'UPDATE';
        ELSE
            SET @action = 'INSERT';
    END
    ELSE
        SET @action = 'DELETE';

    INSERT INTO Audit (timestamp, author, action, description)
    VALUES (GETDATE(), USER_NAME(), @action, 'Affected record in table Income');
END;
GO

-- Client.Car table
CREATE TRIGGER tr_Audit_Car
ON Client.Car
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @action VARCHAR(255);

    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        IF EXISTS (SELECT 1 FROM deleted)
            SET @action = 'UPDATE';
        ELSE
            SET @action = 'INSERT';
    END
    ELSE
        SET @action = 'DELETE';

    INSERT INTO Audit (timestamp, author, action, description)
    VALUES (GETDATE(), USER_NAME(), @action, 'Affected record in table Car');
END;
GO

-- Client.Region table
CREATE TRIGGER tr_Audit_Region
ON Client.Region
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @action VARCHAR(255);

    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        IF EXISTS (SELECT 1 FROM deleted)
            SET @action = 'UPDATE';
        ELSE
            SET @action = 'INSERT';
    END
    ELSE
        SET @action = 'DELETE';

    INSERT INTO Audit (timestamp, author, action, description)
    VALUES (GETDATE(), USER_NAME(), @action, 'Affected record in table Region');
END;
GO

-- Client.Job table
CREATE TRIGGER tr_Audit_Job
ON Client.Job
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @action VARCHAR(255);

    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        IF EXISTS (SELECT 1 FROM deleted)
            SET @action = 'UPDATE';
        ELSE
            SET @action = 'INSERT';
    END
    ELSE
        SET @action = 'DELETE';

    INSERT INTO Audit (timestamp, author, action, description)
    VALUES (GETDATE(), USER_NAME(), @action, 'Affected record in table Job');
END;
GO

-- Credit_Bureau.Credit_Bureau_Application table
CREATE TRIGGER tr_Audit_Credit_Bureau_Application
ON Credit_Bureau.Credit_Bureau_Application
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @action VARCHAR(255);

    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        IF EXISTS (SELECT 1 FROM deleted)
            SET @action = 'UPDATE';
        ELSE
            SET @action = 'INSERT';
    END
    ELSE
        SET @action = 'DELETE';

    INSERT INTO Audit (timestamp, author, action, description)
    VALUES (GETDATE(), USER_NAME(), @action, 'Affected record in table Credit_Bureau_Application');
END;
GO

-- Credit_Bureau.Credit_Bureau_Balance table
CREATE TRIGGER tr_Audit_Credit_Bureau_Balance
ON Credit_Bureau.Credit_Bureau_Balance
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @action VARCHAR(255);

    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        IF EXISTS (SELECT 1 FROM deleted)
            SET @action = 'UPDATE';
        ELSE
            SET @action = 'INSERT';
    END
    ELSE
        SET @action = 'DELETE';

    INSERT INTO Audit (timestamp, author, action, description)
    VALUES (GETDATE(), USER_NAME(), @action, 'Affected record in table Credit_Bureau_Balance');
END;
GO

-- Previous_Application.Previous_Application table
CREATE TRIGGER tr_Audit_Previous_Application
ON Previous_Application.Previous_Application
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @action VARCHAR(255);

    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        IF EXISTS (SELECT 1 FROM deleted)
            SET @action = 'UPDATE';
        ELSE
            SET @action = 'INSERT';
    END
    ELSE
        SET @action = 'DELETE';

    INSERT INTO Audit (timestamp, author, action, description)
    VALUES (GETDATE(), USER_NAME(), @action, 'Affected record in table Previous_Application');
END;
GO

-- Previous_Application.Previous_Application_Date table
CREATE TRIGGER tr_Audit_Previous_Application_Date
ON Previous_Application.Previous_Application_Date
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @action VARCHAR(255);

    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        IF EXISTS (SELECT 1 FROM deleted)
            SET @action = 'UPDATE';
        ELSE
            SET @action = 'INSERT';
    END
    ELSE
        SET @action = 'DELETE';

    INSERT INTO Audit (timestamp, author, action, description)
    VALUES (GETDATE(), USER_NAME(), @action, 'Affected record in table Previous_Application_Date');
END;
GO

-- Previous_Application.Credit_Card_Balance table
CREATE TRIGGER tr_Audit_Credit_Card_Balance
ON Previous_Application.Credit_Card_Balance
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @action VARCHAR(255);

    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        IF EXISTS (SELECT 1 FROM deleted)
            SET @action = 'UPDATE';
        ELSE
            SET @action = 'INSERT';
    END
    ELSE
        SET @action = 'DELETE';

    INSERT INTO Audit (timestamp, author, action, description)
    VALUES (GETDATE(), USER_NAME(), @action, 'Affected record in table Credit_Card_Balance');
END;
GO

-- Previous_Application.Installment_Payment table
CREATE TRIGGER tr_Audit_Installment_Payment
ON Previous_Application.Installment_Payment
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @action VARCHAR(255);

    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        IF EXISTS (SELECT 1 FROM deleted)
            SET @action = 'UPDATE';
        ELSE
            SET @action = 'INSERT';
    END
    ELSE
        SET @action = 'DELETE';

    INSERT INTO Audit (timestamp, author, action, description)
    VALUES (GETDATE(), USER_NAME(), @action, 'Affected record in table Installment_Payment');
END;
GO

-- Application.Balance table
CREATE TRIGGER tr_Audit_Balance
ON Application.Balance
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @action VARCHAR(255);

    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        IF EXISTS (SELECT 1 FROM deleted)
            SET @action = 'UPDATE';
        ELSE
            SET @action = 'INSERT';
    END
    ELSE
        SET @action = 'DELETE';

    INSERT INTO Audit (timestamp, author, action, description)
    VALUES (GETDATE(), USER_NAME(), @action, 'Affected record in table Balance');
END;
GO

USE master;
GO