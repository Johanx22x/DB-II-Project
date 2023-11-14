USE HomeCredit;
GO

-- Create the DB Schemas: 
CREATE SCHEMA Client;
GO
-- Client contains tables:
    -- Client 
    -- Family
    -- Income
    -- Car 
    -- Region
    -- Job

CREATE SCHEMA Application;
GO 
-- Application contains tables:
    -- Application
    -- Application_Date
    -- Balance

CREATE SCHEMA Credit_Bureau;
GO 
-- Credit_Bureau contains tables:
    -- Credit_Bureau_Application
    -- Credit_Bureau_Balance

CREATE SCHEMA Previous_Application;
GO 
-- Previous_Application contains tables:
    -- Previous_Application
    -- Previous_Application_Date
    -- Previous_Application_Reject
    -- Credit_Card_Balance
    -- Installment_Payment

USE master;
GO