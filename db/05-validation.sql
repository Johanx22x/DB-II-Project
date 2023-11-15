USE HomeCredit;
GO

-- Trigger for Application.Application table
CREATE TRIGGER TRG_Application_Application
ON Application.Application
AFTER INSERT
AS
BEGIN
    -- Validate credit amount
    IF (SELECT COUNT(*) FROM INSERTED WHERE credit_amount <= 0) > 0
    BEGIN
        PRINT('Credit amount must be greater than 0.')
        ROLLBACK;
    END

    -- Validate annuity amount
    IF (SELECT COUNT(*) FROM INSERTED WHERE annuity_amount <= 0) > 0
    BEGIN
        PRINT('Annuity amount must be greater than 0.')
        ROLLBACK;
    END

    -- Validate goods price
    IF (SELECT COUNT(*) FROM INSERTED WHERE goods_price <= 0) > 0
    BEGIN
        PRINT('Goods price must be greater than 0.')
        ROLLBACK;
    END
END;
GO

-- Trigger for Application.Application_Date table
CREATE TRIGGER TRG_Application_Application_Date
ON Application.Application_Date
AFTER INSERT
AS
BEGIN
    -- Validate weekday
    IF (SELECT COUNT(*) FROM INSERTED WHERE weekday NOT IN ('MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY', 'SUNDAY')) > 0
    BEGIN
        PRINT('Weekday must be one of the following: MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY.')
        ROLLBACK;
    END

    -- Validate hour
    IF (SELECT COUNT(*) FROM INSERTED WHERE hour < 0 OR hour > 23) > 0
    BEGIN
        PRINT('Hour must be between 0 and 23.')
        ROLLBACK;
    END
END;
GO

-- Trigger for Client.Client table
CREATE TRIGGER TRG_Client_Client
ON Client.Client
AFTER INSERT
AS
BEGIN
    -- Validate gender
    IF (SELECT COUNT(*) FROM INSERTED WHERE gender NOT IN ('M', 'F')) > 0
    BEGIN
        PRINT('Gender must be one of the following: M, F.')
        ROLLBACK;
    END
END;

-- Trigger for Client.Family table
CREATE TRIGGER TRG_Client_Family
ON Client.Family
AFTER INSERT
AS
BEGIN
    -- Validate status
    IF (SELECT COUNT(*) FROM INSERTED WHERE status NOT IN ('SINGLE', 'MARRIED', 'WIDOWED', 'DIVORCED', 'CIVIL PARTNERSHIP')) > 0
    BEGIN
        PRINT('Status must be one of the following: SINGLE, MARRIED, WIDOWED, DIVORCED, CIVIL PARTNERSHIP.')
        ROLLBACK;
    END

    -- Validate children count
    IF (SELECT COUNT(*) FROM INSERTED WHERE children_count < 0) > 0
    BEGIN
        PRINT('Children count must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate members count
    IF (SELECT COUNT(*) FROM INSERTED WHERE members_count < 0) > 0
    BEGIN
        PRINT('Members count must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate members count
    IF (SELECT COUNT(*) FROM INSERTED WHERE members_count < children_count) > 0
    BEGIN
        PRINT('Members count must be greater than or equal to children count.')
        ROLLBACK;
    END
END;
GO

-- Trigger for Client.Income table
CREATE TRIGGER TRG_Client_Income
ON Client.Income
AFTER INSERT
AS
BEGIN 
    -- Validate amount
    IF (SELECT COUNT(*) FROM INSERTED WHERE amount <= 0) > 0
    BEGIN
        PRINT('Amount must be greater than 0.')
        ROLLBACK;
    END
END;
GO

-- Trigger for Client.Car table
CREATE TRIGGER TRG_Client_Car
ON Client.Car
AFTER INSERT
AS
BEGIN
    -- Validate age
    IF (SELECT COUNT(*) FROM INSERTED WHERE age < 0) > 0
    BEGIN
        PRINT('Age must be greater than or equal to 0.')
        ROLLBACK;
    END
END;
GO

-- Trigger for Client.Region table
CREATE TRIGGER TRG_Client_Region
ON Client.Region
AFTER INSERT
AS
BEGIN 
    -- Validate rating
    IF (SELECT COUNT(*) FROM INSERTED WHERE rating < 0) > 0
    BEGIN
        PRINT('Rating must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate rating with city
    IF (SELECT COUNT(*) FROM INSERTED WHERE rating_with_city < 0) > 0
    BEGIN
        PRINT('Rating with city must be greater than or equal to 0.')
        ROLLBACK;
    END
END;
GO

-- Trigger for Client.Job table
-- CREATE TRIGGER TRG_Client_Job
-- ON Client.Job
-- AFTER INSERT
-- AS
-- BEGIN 
-- END;
-- GO

-- Trigger for Credit_Bureau.Credit_Bureau_Application table
CREATE TRIGGER TRG_Credit_Bureau_Credit_Bureau_Application
ON Credit_Bureau.Credit_Bureau_Application
AFTER INSERT
AS
BEGIN 
    -- Validate status
    IF (SELECT COUNT(*) FROM INSERTED WHERE status NOT IN ('APPROVED', 'REJECTED', 'CANCELED')) > 0
    BEGIN
        PRINT('Status must be one of the following: APPROVED, REJECTED, CANCELED.')
        ROLLBACK;
    END

    -- Validate amount
    IF (SELECT COUNT(*) FROM INSERTED WHERE amount <= 0) > 0
    BEGIN
        PRINT('Amount must be greater than 0.')
        ROLLBACK;
    END

    -- Validate debt
    IF (SELECT COUNT(*) FROM INSERTED WHERE debt < 0) > 0
    BEGIN
        PRINT('Debt must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate max overdue
    IF (SELECT COUNT(*) FROM INSERTED WHERE max_overdue < 0) > 0
    BEGIN
        PRINT('Max overdue must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate times prolonged
    IF (SELECT COUNT(*) FROM INSERTED WHERE times_prolonged < 0) > 0
    BEGIN
        PRINT('Times prolonged must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate annuity
    IF (SELECT COUNT(*) FROM INSERTED WHERE annuity <= 0) > 0
    BEGIN
        PRINT('Annuity must be greater than 0.')
        ROLLBACK;
    END
END;
GO

-- Trigger for Credit_Bureau.Credit_Bureau_Balance table
CREATE TRIGGER TRG_Credit_Bureau_Credit_Bureau_Balance
ON Credit_Bureau.Credit_Bureau_Balance
AFTER INSERT
AS
BEGIN 
    -- Validate months_balance
    IF (SELECT COUNT(*) FROM INSERTED WHERE months_balance < 0) > 0
    BEGIN
        PRINT('Months balance must be greater than or equal to 0.')
        ROLLBACK;
    END
END;
GO

-- Trigger for Previous_Application.Previous_Application table
CREATE TRIGGER TRG_Previous_Application_Previous_Application
ON Previous_Application.Previous_Application
AFTER INSERT
AS
BEGIN 
    -- Validate annuity_amount
    IF (SELECT COUNT(*) FROM INSERTED WHERE annuity_amount <= 0) > 0
    BEGIN
        PRINT('Annuity amount must be greater than 0.')
        ROLLBACK;
    END

    -- Validate application_amount
    IF (SELECT COUNT(*) FROM INSERTED WHERE application_amount <= 0) > 0
    BEGIN
        PRINT('Application amount must be greater than 0.')
        ROLLBACK;
    END

    -- Validate goods_price
    IF (SELECT COUNT(*) FROM INSERTED WHERE goods_price <= 0) > 0
    BEGIN
        PRINT('Goods price must be greater than 0.')
        ROLLBACK;
    END

    -- Validate credit_amount
    IF (SELECT COUNT(*) FROM INSERTED WHERE credit_amount <= 0) > 0
    BEGIN
        PRINT('Credit amount must be greater than 0.')
        ROLLBACK;
    END

    -- Validate down_payment
    IF (SELECT COUNT(*) FROM INSERTED WHERE down_payment < 0) > 0
    BEGIN
        PRINT('Down payment must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate payment_count
    IF (SELECT COUNT(*) FROM INSERTED WHERE payment_count < 0) > 0
    BEGIN
        PRINT('Payment count must be greater than or equal to 0.')
        ROLLBACK;
    END
END;
GO

-- Trigger for Previous_Application.Previous_Application_Date table
CREATE TRIGGER TRG_Previous_Application_Previous_Application_Date
ON Previous_Application.Previous_Application_Date
AFTER INSERT
AS
BEGIN 
    -- Validate weekday
    IF (SELECT COUNT(*) FROM INSERTED WHERE weekday NOT IN ('MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY', 'SUNDAY')) > 0
    BEGIN
        PRINT('Weekday must be one of the following: MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY.')
        ROLLBACK;
    END

    -- Validate hour
    IF (SELECT COUNT(*) FROM INSERTED WHERE hour < 0 OR hour > 23) > 0
    BEGIN
        PRINT('Hour must be between 0 and 23.')
        ROLLBACK;
    END
END;
GO

-- Trigger for Previous_Application.Credit_Card_Balance table
CREATE TRIGGER TRG_Previous_Application_Credit_Card_Balance
ON Previous_Application.Credit_Card_Balance
AFTER INSERT
AS
BEGIN 
    -- Validate months_balance
    IF (SELECT COUNT(*) FROM INSERTED WHERE months_balance < 0) > 0
    BEGIN
        PRINT('Months balance must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate balance
    IF (SELECT COUNT(*) FROM INSERTED WHERE balance < 0) > 0
    BEGIN
        PRINT('Balance must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate credit_limit
    IF (SELECT COUNT(*) FROM INSERTED WHERE credit_limit < 0) > 0
    BEGIN
        PRINT('Credit limit must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate drawings_atm
    IF (SELECT COUNT(*) FROM INSERTED WHERE drawings_atm < 0) > 0
    BEGIN
        PRINT('Drawings ATM must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate drawings
    IF (SELECT COUNT(*) FROM INSERTED WHERE drawings < 0) > 0
    BEGIN
        PRINT('Drawings must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate drawings_other
    IF (SELECT COUNT(*) FROM INSERTED WHERE drawings_other < 0) > 0
    BEGIN
        PRINT('Drawings other must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate drawings_goods
    IF (SELECT COUNT(*) FROM INSERTED WHERE drawings_goods < 0) > 0
    BEGIN
        PRINT('Drawings goods must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate min_installment
    IF (SELECT COUNT(*) FROM INSERTED WHERE min_installment < 0) > 0
    BEGIN
        PRINT('Min installment must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate payment
    IF (SELECT COUNT(*) FROM INSERTED WHERE payment < 0) > 0
    BEGIN
        PRINT('Payment must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate total_payment
    IF (SELECT COUNT(*) FROM INSERTED WHERE total_payment < 0) > 0
    BEGIN
        PRINT('Total payment must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate principal_receivable
    IF (SELECT COUNT(*) FROM INSERTED WHERE principal_receivable < 0) > 0
    BEGIN
        PRINT('Principal receivable must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate receivable
    IF (SELECT COUNT(*) FROM INSERTED WHERE receivable < 0) > 0
    BEGIN
        PRINT('Receivable must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate total_receivable
    IF (SELECT COUNT(*) FROM INSERTED WHERE total_receivable < 0) > 0
    BEGIN
        PRINT('Total receivable must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate drawings_atm_count
    IF (SELECT COUNT(*) FROM INSERTED WHERE drawings_atm_count < 0) > 0
    BEGIN
        PRINT('Drawings ATM count must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate drawings_count
    IF (SELECT COUNT(*) FROM INSERTED WHERE drawings_count < 0) > 0
    BEGIN
        PRINT('Drawings count must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate drawings_other_count
    IF (SELECT COUNT(*) FROM INSERTED WHERE drawings_other_count < 0) > 0
    BEGIN
        PRINT('Drawings other count must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate drawings_goods_count
    IF (SELECT COUNT(*) FROM INSERTED WHERE drawings_goods_count < 0) > 0
    BEGIN
        PRINT('Drawings goods count must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate total_installment_count
    IF (SELECT COUNT(*) FROM INSERTED WHERE total_installment_count < 0) > 0
    BEGIN
        PRINT('Total installment count must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate days_past_due
    IF (SELECT COUNT(*) FROM INSERTED WHERE days_past_due < 0) > 0
    BEGIN
        PRINT('Days past due must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate days_past_due_debts
    IF (SELECT COUNT(*) FROM INSERTED WHERE days_past_due_debts < 0) > 0
    BEGIN
        PRINT('Days past due debts must be greater than or equal to 0.')
        ROLLBACK;
    END
END;
GO

-- Trigger for Previous_Application.Installment_Payment table
CREATE TRIGGER TRG_Previous_Application_Installment_Payment
ON Previous_Application.Installment_Payment
AFTER INSERT
AS
BEGIN 
    -- Validate version
    IF (SELECT COUNT(*) FROM INSERTED WHERE version < 0) > 0
    BEGIN
        PRINT('Version must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate number
    IF (SELECT COUNT(*) FROM INSERTED WHERE number < 0) > 0
    BEGIN
        PRINT('Number must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate days_from_application
    IF (SELECT COUNT(*) FROM INSERTED WHERE days_from_application < 0) > 0
    BEGIN
        PRINT('Days from application must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate days_from_payment
    IF (SELECT COUNT(*) FROM INSERTED WHERE days_from_payment < 0) > 0
    BEGIN
        PRINT('Days from payment must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate amount
    IF (SELECT COUNT(*) FROM INSERTED WHERE amount < 0) > 0
    BEGIN
        PRINT('Amount must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate payment_amount
    IF (SELECT COUNT(*) FROM INSERTED WHERE payment_amount < 0) > 0
    BEGIN
        PRINT('Payment amount must be greater than or equal to 0.')
        ROLLBACK;
    END
END;
GO

-- Trigger for Application.Balance table
CREATE TRIGGER TRG_Application_Balance
ON Application.Balance
AFTER INSERT
AS
BEGIN 
    -- Validate months_balance
    IF (SELECT COUNT(*) FROM INSERTED WHERE months_balance < 0) > 0
    BEGIN
        PRINT('Months balance must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate installment_count
    IF (SELECT COUNT(*) FROM INSERTED WHERE installment_count < 0) > 0
    BEGIN
        PRINT('Installment count must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate future_installment_count
    IF (SELECT COUNT(*) FROM INSERTED WHERE future_installment_count < 0) > 0
    BEGIN
        PRINT('Future installment count must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate days_past_due
    IF (SELECT COUNT(*) FROM INSERTED WHERE days_past_due < 0) > 0
    BEGIN
        PRINT('Days past due must be greater than or equal to 0.')
        ROLLBACK;
    END

    -- Validate days_past_due_debts
    IF (SELECT COUNT(*) FROM INSERTED WHERE days_past_due_debts < 0) > 0
    BEGIN
        PRINT('Days past due debts must be greater than or equal to 0.')
        ROLLBACK;
    END
END;
GO

USE master;
GO