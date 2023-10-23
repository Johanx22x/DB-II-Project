-- MSSQL Home Credit Database
CREATE DATABASE HomeCredit;
GO

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

-- Create the Application table
CREATE TABLE Application.Application (
    id              INT IDENTITY NOT NULL,
    type            VARCHAR(255) NOT NULL,
    credit_amount   FLOAT NOT NULL,
    annuity_amount  FLOAT NOT NULL,
    goods_price     INT NOT NULL,
    companion       VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
GO

-- Create the Application_Date table
CREATE TABLE Application.Application_Date (
    application_id  INT NOT NULL,
    weekday         VARCHAR(255) NOT NULL,
    hour            INT NOT NULL,
    PRIMARY KEY (application_id, weekday),
    CONSTRAINT FK_application_id FOREIGN KEY (application_id) REFERENCES Application.Application(id)
);
GO

-- Create the Client table
CREATE TABLE Client.Client (
    application_id  INT NOT NULL,
    gender          VARCHAR(255) NOT NULL,
    education       VARCHAR(255) NOT NULL,
    housing_type    VARCHAR(255) NOT NULL,
    occupation      VARCHAR(255) NOT NULL,
    PRIMARY KEY (application_id),
    CONSTRAINT FK_application_id FOREIGN KEY (application_id) REFERENCES Application.Application(id)
);
GO

-- Create the Family table
CREATE TABLE Client.Family (
    client_id       INT NOT NULL,
    children_count  INT NOT NULL,
    status          VARCHAR(255) NOT NULL,
    members_count   INT NOT NULL,
    PRIMARY KEY (client_id),
    CONSTRAINT FK_client_id FOREIGN KEY (client_id) REFERENCES Client.Client(application_id)
);
GO

-- Create the Income table
CREATE TABLE Client.Income (
    client_id       INT NOT NULL,
    amount          FLOAT NOT NULL,
    type            VARCHAR(255) NOT NULL,
    PRIMARY KEY (client_id),
    CONSTRAINT FK_client_id FOREIGN KEY (client_id) REFERENCES Client.Client(application_id)
);
GO

-- Create the Car table
CREATE TABLE Client.Car (
    client_id       INT NOT NULL,
    age             INT NOT NULL,
    PRIMARY KEY (client_id),
    CONSTRAINT FK_client_id FOREIGN KEY (client_id) REFERENCES Client.Client(application_id)
);
GO

-- Create the Region table
CREATE TABLE Client.Region (
    client_id           INT NOT NULL,
    rating              INT NOT NULL,
    rating_with_city    INT NOT NULL,
    PRIMARY KEY (client_id),
    CONSTRAINT FK_client_id FOREIGN KEY (client_id) REFERENCES Client.Client(application_id)
);
GO

-- Create the Job table
CREATE TABLE Client.Job (
    client_id       INT NOT NULL,
    type            VARCHAR(255),
    PRIMARY KEY (client_id),
    CONSTRAINT FK_client_id FOREIGN KEY (client_id) REFERENCES Client.Client(application_id)
);
GO

-- Create the Credit_Bureau_Application table
CREATE TABLE Credit_Bureau.Credit_Bureau_Application (
    id                      INT IDENTITY NOT NULL,
    application_id          INT NOT NULL,
    status                  VARCHAR(255) NOT NULL,
    currency                VARCHAR(255) NOT NULL,
    days_from_application   INT NOT NULL,
    max_overdue             FLOAT NOT NULL,
    times_prolonged         INT NOT NULL,
    amount                  FLOAT NOT NULL,
    debt                    FLOAT NOT NULL,
    credit_limit            FLOAT,
    credit_type             VARCHAR(255) NOT NULL,
    days_from_update        INT NOT NULL,
    annuity                 FLOAT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_application_id FOREIGN KEY (application_id) REFERENCES Application.Application(id)
);
GO

-- Create the Credit_Bureau_Balance table
CREATE TABLE Credit_Bureau.Credit_Bureau_Balance (
    credit_bureau_id    INT NOT NULL,
    months_balance      INT NOT NULL,
    status              VARCHAR(255) NOT NULL,
    PRIMARY KEY (credit_bureau_id, months_balance),
    CONSTRAINT FK_credit_bureau_id FOREIGN KEY (credit_bureau_id) REFERENCES Credit_Bureau.Credit_Bureau_Application(id)
);
GO

-- Create the Previous_Application table
CREATE TABLE Previous_Application.Previous_Application (
    id                  INT IDENTITY NOT NULL,
    application_id      INT NOT NULL,
    type                VARCHAR(255) NOT NULL,
    annuity_amount      FLOAT NOT NULL,
    application_amount  FLOAT NOT NULL,
    credit_amount       FLOAT NOT NULL,
    down_payment        FLOAT NOT NULL,
    goods_price         FLOAT NOT NULL,
    purpose             VARCHAR(255) NOT NULL,
    status              VARCHAR(255) NOT NULL,
    payment_type        VARCHAR(255) NOT NULL,
    companion           VARCHAR(255) NOT NULL,
    client_type         VARCHAR(255) NOT NULL,
    goods_type          VARCHAR(255) NOT NULL,
    portfolio           VARCHAR(255) NOT NULL,
    product_type        VARCHAR(255) NOT NULL,
    channel             VARCHAR(255) NOT NULL,
    seller_area         INT NOT NULL,
    seller_industry     VARCHAR(255) NOT NULL,
    payment_count       INT NOT NULL,
    yield_group         VARCHAR(255) NOT NULL,
    product_combination VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_application_id FOREIGN KEY (application_id) REFERENCES Application.Application(id)
);
GO

-- Create the Reject table
CREATE TABLE Previous_Application.Reject (
    id          INT AUTO_INCREMENT NOT NULL,
    reason      VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
GO

-- Create the Previous_Application_Reject table
CREATE TABLE Previous_Application.Previous_Application_Reject (
    previous_application_id     INT NOT NULL,
    reject_id                   INT NOT NULL,
    PRIMARY KEY (previous_application_id),
    CONSTRAINT FK_previous_application_id FOREIGN KEY (previous_application_id) REFERENCES Previous_Application.Previous_Application(id),
    CONSTRAINT FK_reject_id FOREIGN KEY (reject_id) REFERENCES Previous_Application.Reject(id)
);
GO

-- Create the Previous_Application_Date table
CREATE TABLE Previous_Application.Previous_Application_Date (
    previous_application_id     INT NOT NULL,
    weekday                     VARCHAR(255) NOT NULL,
    hour                        INT NOT NULL,
    PRIMARY KEY (previous_application_id, weekday),
    CONSTRAINT FK_previous_application_id FOREIGN KEY (previous_application_id) REFERENCES Previous_Application.Previous_Application(id)
);
GO

-- Create the Credit_Card_Balance table
CREATE TABLE Previous_Application.Credit_Card_Balance (
    previous_application_id     INT NOT NULL,
    months_balance              INT NOT NULL,
    balance                     FLOAT NOT NULL,
    credit_limit                FLOAT NOT NULL,
    drawings_atm                FLOAT NOT NULL,
    drawings                    FLOAT NOT NULL,
    drawings_other              FLOAT NOT NULL,
    drawings_goods              FLOAT NOT NULL,
    min_installment             FLOAT NOT NULL,
    payment                     FLOAT NOT NULL,
    total_payment               FLOAT NOT NULL,
    principal_receivable        FLOAT NOT NULL,
    receivable                  FLOAT NOT NULL,
    total_receivable            FLOAT NOT NULL,
    drawings_atm_count          INT NOT NULL,
    drawings_count              INT NOT NULL,
    drawings_other_count        INT NOT NULL,
    drawings_goods_count        INT NOT NULL,
    total_installment_count     INT NOT NULL,
    status                      VARCHAR(255) NOT NULL,
    days_past_due               INT NOT NULL,
    days_past_due_debts         INT NOT NULL,
    PRIMARY KEY (previous_application_id, months_balance),
    CONSTRAINT FK_previous_application_id FOREIGN KEY (previous_application_id) REFERENCES Previous_Application.Previous_Application(id)
);
GO

-- Create the Installment_Payment table
CREATE TABLE Previous_Application.Installment_Payment (
    previous_application_id     INT NOT NULL,
    version                     FLOAT NOT NULL,
    number                      INT NOT NULL,
    days_from_application       INT NOT NULL,
    days_from_payment           INT NOT NULL,
    amount                      FLOAT NOT NULL,
    payment_amount              FLOAT NOT NULL,
    PRIMARY KEY (previous_application_id, version, number),
    CONSTRAINT FK_previous_application_id FOREIGN KEY (previous_application_id) REFERENCES Previous_Application.Previous_Application(id)
);
GO

-- Create the Balance table
CREATE TABLE Application.Balance (
    previous_application_id     INT NOT NULL,
    months_balance              INT NOT NULL,
    installment_count           INT NOT NULL,
    future_installment_count    INT NOT NULL,
    status                      VARCHAR(255) NOT NULL,
    days_past_due               INT NOT NULL,
    days_past_due_debts         INT NOT NULL,
    PRIMARY KEY (previous_application_id, months_balance),
    CONSTRAINT FK_previous_application_id FOREIGN KEY (previous_application_id) REFERENCES Previous_Application.Previous_Application(id)
);
GO
