USE HomeCredit;
GO

--region PROCEDURE Application.usp_Application_Select
IF OBJECT_ID('Application.usp_Application_Select') IS NOT NULL
BEGIN 
    DROP PROC Application.usp_Application_Select 
END
GO
CREATE PROC Application.usp_Application_Select
    @id int
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    SELECT id, type, credit_amount, annuity_amount, goods_price, companion
    FROM   Application.Application
    WHERE  id = @id 

    COMMIT
GO
--endregion

--region PROCEDURE Application.usp_Application_Insert
IF OBJECT_ID('Application.usp_Application_Insert') IS NOT NULL
BEGIN 
    DROP PROC Application.usp_Application_Insert
END 
GO
CREATE PROC Application.usp_Application_Insert
    @type varchar(255),
    @credit_amount float,
    @annuity_amount float,
    @goods_price float,
    @companion varchar(255)
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    INSERT INTO Application.Application (type, credit_amount, annuity_amount, goods_price, companion)
    SELECT @type, @credit_amount, @annuity_amount, @goods_price, @companion

    /*
    -- Begin Return row code block

    SELECT id, type, credit_amount, annuity_amount, goods_price, companion
    FROM   Application.Application
    WHERE  id = @id AND type = @type AND credit_amount = @credit_amount AND annuity_amount = @annuity_amount AND 
           goods_price = @goods_price AND companion = @companion

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Application.usp_Application_Update
IF OBJECT_ID('Application.usp_Application_Update') IS NOT NULL
BEGIN 
    DROP PROC Application.usp_Application_Update
END
GO
CREATE PROC Application.usp_Application_Update
@id int,
@type varchar(255),
@credit_amount float,
@annuity_amount float,
@goods_price float,
@companion varchar(255)
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    UPDATE Application.Application
    SET    type = @type, credit_amount = @credit_amount, annuity_amount = @annuity_amount, goods_price = @goods_price, 
           companion = @companion
    WHERE  id = @id

    /*
    -- Begin Return row code block

    SELECT type, credit_amount, annuity_amount, goods_price, companion
    FROM   Application.Application
    WHERE  id = @id

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Application.usp_Application_Delete
IF OBJECT_ID('Application.usp_Application_Delete') IS NOT NULL
BEGIN 
    DROP PROC Application.usp_Application_Delete
END 
GO
CREATE PROC Application.usp_Application_Delete
@id int
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    DELETE
    FROM   Application.Application
    WHERE  id = @id

    COMMIT
GO
--endregion

--region PROCEDURE Application.usp_Application_Date_Select
IF OBJECT_ID('Application.usp_Application_Date_Select') IS NOT NULL
BEGIN 
    DROP PROC Application.usp_Application_Date_Select 
END
GO
CREATE PROC Application.usp_Application_Date_Select
    @application_id int,
    @weekday varchar(255)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    SELECT application_id, weekday, hour
    FROM   Application.Application_Date
    WHERE  application_id = @application_id AND weekday = @weekday 

    COMMIT
GO
--endregion

--region PROCEDURE Application.usp_Application_Date_Insert
IF OBJECT_ID('Application.usp_Application_Date_Insert') IS NOT NULL
BEGIN 
    DROP PROC Application.usp_Application_Date_Insert
END 
GO
CREATE PROC Application.usp_Application_Date_Insert
    @application_id int,
    @weekday varchar(255),
    @hour float
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    INSERT INTO Application.Application_Date (application_id, weekday, hour)
    SELECT @application_id, @weekday, @hour

    /*
    -- Begin Return row code block

    SELECT application_id, weekday, hour
    FROM   Application.Application_Date
    WHERE  application_id = @application_id AND weekday = @weekday AND hour = @hour

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Application.usp_Application_Date_Update
IF OBJECT_ID('Application.usp_Application_Date_Update') IS NOT NULL
BEGIN 
    DROP PROC Application.usp_Application_Date_Update
END
GO
CREATE PROC Application.usp_Application_Date_Update
@application_id int,
@weekday varchar(255),
@hour float
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    UPDATE Application.Application_Date
    SET    hour = @hour
    WHERE  application_id = @application_id AND weekday = @weekday

    /*
    -- Begin Return row code block

    SELECT hour
    FROM   Application.Application_Date
    WHERE  application_id = @application_id AND weekday = @weekday

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Application.usp_Application_Date_Delete
IF OBJECT_ID('Application.usp_Application_Date_Delete') IS NOT NULL
BEGIN 
    DROP PROC Application.usp_Application_Date_Delete
END 
GO
CREATE PROC Application.usp_Application_Date_Delete
@application_id int,
@weekday varchar(255)
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    DELETE
    FROM   Application.Application_Date
    WHERE  application_id = @application_id AND weekday = @weekday

    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Client_Select
IF OBJECT_ID('Client.usp_Client_Select') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Client_Select 
END
GO
CREATE PROC Client.usp_Client_Select
    @application_id int
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    SELECT application_id, gender, education, housing_type, occupation
    FROM   Client.Client
    WHERE  application_id = @application_id 

    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Client_Insert
IF OBJECT_ID('Client.usp_Client_Insert') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Client_Insert
END 
GO
CREATE PROC Client.usp_Client_Insert
    @application_id int,
    @gender varchar(255),
    @education varchar(255),
    @housing_type varchar(255),
    @occupation varchar(255)
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    INSERT INTO Client.Client (application_id, gender, education, housing_type, occupation)
    SELECT @application_id, @gender, @education, @housing_type, @occupation

    /*
    -- Begin Return row code block

    SELECT application_id, gender, education, housing_type, occupation
    FROM   Client.Client
    WHERE  application_id = @application_id AND gender = @gender AND education = @education AND housing_type = @housing_type AND 
           occupation = @occupation

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Client_Update
IF OBJECT_ID('Client.usp_Client_Update') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Client_Update
END
GO
CREATE PROC Client.usp_Client_Update
@application_id int,
@gender varchar(255),
@education varchar(255),
@housing_type varchar(255),
@occupation varchar(255)
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    UPDATE Client.Client
    SET    gender = @gender, education = @education, housing_type = @housing_type, occupation = @occupation
    WHERE  application_id = @application_id

    /*
    -- Begin Return row code block

    SELECT gender, education, housing_type, occupation
    FROM   Client.Client
    WHERE  application_id = @application_id

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Client_Delete
IF OBJECT_ID('Client.usp_Client_Delete') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Client_Delete
END 
GO
CREATE PROC Client.usp_Client_Delete
@application_id int
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    DELETE
    FROM   Client.Client
    WHERE  application_id = @application_id

    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Family_Select
IF OBJECT_ID('Client.usp_Family_Select') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Family_Select 
END
GO
CREATE PROC Client.usp_Family_Select
    @client_id int
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    SELECT client_id, children_count, status, members_count
    FROM   Client.Family
    WHERE  client_id = @client_id 

    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Family_Insert
IF OBJECT_ID('Client.usp_Family_Insert') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Family_Insert
END 
GO
CREATE PROC Client.usp_Family_Insert
    @client_id int,
    @children_count float,
    @status varchar(255),
    @members_count float
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    INSERT INTO Client.Family (client_id, children_count, status, members_count)
    SELECT @client_id, @children_count, @status, @members_count

    /*
    -- Begin Return row code block

    SELECT client_id, children_count, status, members_count
    FROM   Client.Family
    WHERE  client_id = @client_id AND children_count = @children_count AND status = @status AND members_count = @members_count

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Family_Update
IF OBJECT_ID('Client.usp_Family_Update') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Family_Update
END
GO
CREATE PROC Client.usp_Family_Update
@client_id int,
@children_count float,
@status varchar(255),
@members_count float
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    UPDATE Client.Family
    SET    children_count = @children_count, status = @status, members_count = @members_count
    WHERE  client_id = @client_id

    /*
    -- Begin Return row code block

    SELECT children_count, status, members_count
    FROM   Client.Family
    WHERE  client_id = @client_id

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Family_Delete
IF OBJECT_ID('Client.usp_Family_Delete') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Family_Delete
END 
GO
CREATE PROC Client.usp_Family_Delete
@client_id int
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    DELETE
    FROM   Client.Family
    WHERE  client_id = @client_id

    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Income_Select
IF OBJECT_ID('Client.usp_Income_Select') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Income_Select 
END
GO
CREATE PROC Client.usp_Income_Select
    @client_id int
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    SELECT client_id, amount, type
    FROM   Client.Income
    WHERE  client_id = @client_id 

    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Income_Insert
IF OBJECT_ID('Client.usp_Income_Insert') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Income_Insert
END 
GO
CREATE PROC Client.usp_Income_Insert
    @client_id int,
    @amount float,
    @type varchar(255)
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    INSERT INTO Client.Income (client_id, amount, type)
    SELECT @client_id, @amount, @type

    /*
    -- Begin Return row code block

    SELECT client_id, amount, type
    FROM   Client.Income
    WHERE  client_id = @client_id AND amount = @amount AND type = @type

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Income_Update
IF OBJECT_ID('Client.usp_Income_Update') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Income_Update
END
GO
CREATE PROC Client.usp_Income_Update
@client_id int,
@amount float,
@type varchar(255)
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    UPDATE Client.Income
    SET    amount = @amount, type = @type
    WHERE  client_id = @client_id

    /*
    -- Begin Return row code block

    SELECT amount, type
    FROM   Client.Income
    WHERE  client_id = @client_id

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Income_Delete
IF OBJECT_ID('Client.usp_Income_Delete') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Income_Delete
END 
GO
CREATE PROC Client.usp_Income_Delete
@client_id int
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    DELETE
    FROM   Client.Income
    WHERE  client_id = @client_id

    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Car_Select
IF OBJECT_ID('Client.usp_Car_Select') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Car_Select 
END
GO
CREATE PROC Client.usp_Car_Select
    @client_id int
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    SELECT client_id, age
    FROM   Client.Car
    WHERE  client_id = @client_id 

    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Car_Insert
IF OBJECT_ID('Client.usp_Car_Insert') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Car_Insert
END 
GO
CREATE PROC Client.usp_Car_Insert
    @client_id int,
    @age float
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    INSERT INTO Client.Car (client_id, age)
    SELECT @client_id, @age

    /*
    -- Begin Return row code block

    SELECT client_id, age
    FROM   Client.Car
    WHERE  client_id = @client_id AND age = @age

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Car_Update
IF OBJECT_ID('Client.usp_Car_Update') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Car_Update
END
GO
CREATE PROC Client.usp_Car_Update
@client_id int,
@age float
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    UPDATE Client.Car
    SET    age = @age
    WHERE  client_id = @client_id

    /*
    -- Begin Return row code block

    SELECT age
    FROM   Client.Car
    WHERE  client_id = @client_id

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Car_Delete
IF OBJECT_ID('Client.usp_Car_Delete') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Car_Delete
END 
GO
CREATE PROC Client.usp_Car_Delete
@client_id int
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    DELETE
    FROM   Client.Car
    WHERE  client_id = @client_id

    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Region_Select
IF OBJECT_ID('Client.usp_Region_Select') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Region_Select 
END
GO
CREATE PROC Client.usp_Region_Select
    @client_id int
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    SELECT client_id, rating, rating_with_city
    FROM   Client.Region
    WHERE  client_id = @client_id 

    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Region_Insert
IF OBJECT_ID('Client.usp_Region_Insert') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Region_Insert
END 
GO
CREATE PROC Client.usp_Region_Insert
    @client_id int,
    @rating int,
    @rating_with_city int
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    INSERT INTO Client.Region (client_id, rating, rating_with_city)
    SELECT @client_id, @rating, @rating_with_city

    /*
    -- Begin Return row code block

    SELECT client_id, rating, rating_with_city
    FROM   Client.Region
    WHERE  client_id = @client_id AND rating = @rating AND rating_with_city = @rating_with_city

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Region_Update
IF OBJECT_ID('Client.usp_Region_Update') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Region_Update
END
GO
CREATE PROC Client.usp_Region_Update
@client_id int,
@rating int,
@rating_with_city int
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    UPDATE Client.Region
    SET    rating = @rating, rating_with_city = @rating_with_city
    WHERE  client_id = @client_id

    /*
    -- Begin Return row code block

    SELECT rating, rating_with_city
    FROM   Client.Region
    WHERE  client_id = @client_id

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Region_Delete
IF OBJECT_ID('Client.usp_Region_Delete') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Region_Delete
END 
GO
CREATE PROC Client.usp_Region_Delete
@client_id int
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    DELETE
    FROM   Client.Region
    WHERE  client_id = @client_id

    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Job_Select
IF OBJECT_ID('Client.usp_Job_Select') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Job_Select 
END
GO
CREATE PROC Client.usp_Job_Select
    @client_id int
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    SELECT client_id, type
    FROM   Client.Job
    WHERE  client_id = @client_id 

    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Job_Insert
IF OBJECT_ID('Client.usp_Job_Insert') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Job_Insert
END 
GO
CREATE PROC Client.usp_Job_Insert
    @client_id int,
    @type varchar(255)
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    INSERT INTO Client.Job (client_id, type)
    SELECT @client_id, @type

    /*
    -- Begin Return row code block

    SELECT client_id, type
    FROM   Client.Job
    WHERE  client_id = @client_id AND type = @type

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Job_Update
IF OBJECT_ID('Client.usp_Job_Update') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Job_Update
END
GO
CREATE PROC Client.usp_Job_Update
@client_id int,
@type varchar(255)
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    UPDATE Client.Job
    SET    type = @type
    WHERE  client_id = @client_id

    /*
    -- Begin Return row code block

    SELECT type
    FROM   Client.Job
    WHERE  client_id = @client_id

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Client.usp_Job_Delete
IF OBJECT_ID('Client.usp_Job_Delete') IS NOT NULL
BEGIN 
    DROP PROC Client.usp_Job_Delete
END 
GO
CREATE PROC Client.usp_Job_Delete
@client_id int
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    DELETE
    FROM   Client.Job
    WHERE  client_id = @client_id

    COMMIT
GO
--endregion

--region PROCEDURE Credit_Bureau.usp_Credit_Bureau_Application_Select
IF OBJECT_ID('Credit_Bureau.usp_Credit_Bureau_Application_Select') IS NOT NULL
BEGIN 
    DROP PROC Credit_Bureau.usp_Credit_Bureau_Application_Select 
END
GO
CREATE PROC Credit_Bureau.usp_Credit_Bureau_Application_Select
    @id int
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    SELECT id, application_id, status, currency, days_from_application, max_overdue, times_prolonged, amount, debt, credit_limit, type, days_from_update, annuity
    FROM   Credit_Bureau.Credit_Bureau_Application
    WHERE  id = @id 

    COMMIT
GO
--endregion

--region PROCEDURE Credit_Bureau.usp_Credit_Bureau_Application_Insert
IF OBJECT_ID('Credit_Bureau.usp_Credit_Bureau_Application_Insert') IS NOT NULL
BEGIN 
    DROP PROC Credit_Bureau.usp_Credit_Bureau_Application_Insert
END 
GO
CREATE PROC Credit_Bureau.usp_Credit_Bureau_Application_Insert
    @application_id int,
    @status varchar(255),
    @currency varchar(255),
    @days_from_application int,
    @max_overdue float,
    @times_prolonged int,
    @amount float,
    @debt float,
    @credit_limit float,
    @type varchar(255),
    @days_from_update int,
    @annuity float
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    INSERT INTO Credit_Bureau.Credit_Bureau_Application (application_id, status, currency, days_from_application, 
                                                         max_overdue, times_prolonged, amount, debt, 
                                                         credit_limit, type, days_from_update, annuity)
    SELECT @application_id, @status, @currency, @days_from_application, @max_overdue, @times_prolonged, 
           @amount, @debt, @credit_limit, @type, @days_from_update, @annuity

    /*
    -- Begin Return row code block

    SELECT id, application_id, status, currency, days_from_application, max_overdue, times_prolonged, 
           amount, debt, credit_limit, type, days_from_update, annuity
    FROM   Credit_Bureau.Credit_Bureau_Application
    WHERE  id = @id AND application_id = @application_id AND status = @status AND currency = @currency AND 
           days_from_application = @days_from_application AND max_overdue = @max_overdue AND times_prolonged = @times_prolonged AND 
           amount = @amount AND debt = @debt AND credit_limit = @credit_limit AND type = @type AND days_from_update = @days_from_update AND 
           annuity = @annuity

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Credit_Bureau.usp_Credit_Bureau_Application_Update
IF OBJECT_ID('Credit_Bureau.usp_Credit_Bureau_Application_Update') IS NOT NULL
BEGIN 
    DROP PROC Credit_Bureau.usp_Credit_Bureau_Application_Update
END
GO
CREATE PROC Credit_Bureau.usp_Credit_Bureau_Application_Update
@id int,
@application_id int,
@status varchar(255),
@currency varchar(255),
@days_from_application int,
@max_overdue float,
@times_prolonged int,
@amount float,
@debt float,
@credit_limit float,
@type varchar(255),
@days_from_update int,
@annuity float
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    UPDATE Credit_Bureau.Credit_Bureau_Application
    SET    application_id = @application_id, status = @status, currency = @currency, days_from_application = @days_from_application, 
           max_overdue = @max_overdue, times_prolonged = @times_prolonged, amount = @amount, debt = @debt, 
           credit_limit = @credit_limit, type = @type, days_from_update = @days_from_update, annuity = @annuity
    WHERE  id = @id

    /*
    -- Begin Return row code block

    SELECT application_id, status, currency, days_from_application, max_overdue, times_prolonged, amount, 
           debt, credit_limit, type, days_from_update, annuity
    FROM   Credit_Bureau.Credit_Bureau_Application
    WHERE  id = @id

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Credit_Bureau.usp_Credit_Bureau_Application_Delete
IF OBJECT_ID('Credit_Bureau.usp_Credit_Bureau_Application_Delete') IS NOT NULL
BEGIN 
    DROP PROC Credit_Bureau.usp_Credit_Bureau_Application_Delete
END 
GO
CREATE PROC Credit_Bureau.usp_Credit_Bureau_Application_Delete
@id int
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    DELETE
    FROM   Credit_Bureau.Credit_Bureau_Application
    WHERE  id = @id

    COMMIT
GO
--endregion

--region PROCEDURE Credit_Bureau.usp_Credit_Bureau_Balance_Select
IF OBJECT_ID('Credit_Bureau.usp_Credit_Bureau_Balance_Select') IS NOT NULL
BEGIN 
    DROP PROC Credit_Bureau.usp_Credit_Bureau_Balance_Select 
END
GO
CREATE PROC Credit_Bureau.usp_Credit_Bureau_Balance_Select
    @id int
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    SELECT id, credit_bureau_id, months_balance, status
    FROM   Credit_Bureau.Credit_Bureau_Balance
    WHERE  id = @id 

    COMMIT
GO
--endregion

--region PROCEDURE Credit_Bureau.usp_Credit_Bureau_Balance_Insert
IF OBJECT_ID('Credit_Bureau.usp_Credit_Bureau_Balance_Insert') IS NOT NULL
BEGIN 
    DROP PROC Credit_Bureau.usp_Credit_Bureau_Balance_Insert
END 
GO
CREATE PROC Credit_Bureau.usp_Credit_Bureau_Balance_Insert
    @id int,
    @credit_bureau_id int,
    @months_balance int,
    @status varchar(255)
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    INSERT INTO Credit_Bureau.Credit_Bureau_Balance (id, credit_bureau_id, months_balance, status)
    SELECT @id, @credit_bureau_id, @months_balance, @status

    /*
    -- Begin Return row code block

    SELECT id, credit_bureau_id, months_balance, status
    FROM   Credit_Bureau.Credit_Bureau_Balance
    WHERE  id = @id AND credit_bureau_id = @credit_bureau_id AND months_balance = @months_balance AND 
           status = @status

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Credit_Bureau.usp_Credit_Bureau_Balance_Update
IF OBJECT_ID('Credit_Bureau.usp_Credit_Bureau_Balance_Update') IS NOT NULL
BEGIN 
    DROP PROC Credit_Bureau.usp_Credit_Bureau_Balance_Update
END
GO
CREATE PROC Credit_Bureau.usp_Credit_Bureau_Balance_Update
@id int,
@credit_bureau_id int,
@months_balance int,
@status varchar(255)
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    UPDATE Credit_Bureau.Credit_Bureau_Balance
    SET    credit_bureau_id = @credit_bureau_id, months_balance = @months_balance, status = @status
    WHERE  id = @id

    /*
    -- Begin Return row code block

    SELECT credit_bureau_id, months_balance, status
    FROM   Credit_Bureau.Credit_Bureau_Balance
    WHERE  id = @id

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Credit_Bureau.usp_Credit_Bureau_Balance_Delete
IF OBJECT_ID('Credit_Bureau.usp_Credit_Bureau_Balance_Delete') IS NOT NULL
BEGIN 
    DROP PROC Credit_Bureau.usp_Credit_Bureau_Balance_Delete
END 
GO
CREATE PROC Credit_Bureau.usp_Credit_Bureau_Balance_Delete
@id int
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    DELETE
    FROM   Credit_Bureau.Credit_Bureau_Balance
    WHERE  id = @id

    COMMIT
GO
--endregion

--region PROCEDURE Previous_Application.usp_Previous_Application_Select
IF OBJECT_ID('Previous_Application.usp_Previous_Application_Select') IS NOT NULL
BEGIN 
    DROP PROC Previous_Application.usp_Previous_Application_Select 
END
GO
CREATE PROC Previous_Application.usp_Previous_Application_Select
    @id int
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    SELECT id, application_id, type, annuity_amount, application_amount, credit_amount, down_payment, goods_price, purpose, status, payment_type, companion, client_type, goods_type, portfolio, product_type, channel, reject_reason, seller_area, seller_industry, payment_count, yield_group, product_combination
    FROM   Previous_Application.Previous_Application
    WHERE  id = @id 

    COMMIT
GO
--endregion

--region PROCEDURE Previous_Application.usp_Previous_Application_Insert
IF OBJECT_ID('Previous_Application.usp_Previous_Application_Insert') IS NOT NULL
BEGIN 
    DROP PROC Previous_Application.usp_Previous_Application_Insert
END 
GO
CREATE PROC Previous_Application.usp_Previous_Application_Insert
    @application_id int,
    @type varchar(255),
    @annuity_amount float,
    @application_amount float,
    @credit_amount float,
    @down_payment float,
    @goods_price float,
    @purpose varchar(255),
    @status varchar(255),
    @payment_type varchar(255),
    @companion varchar(255),
    @client_type varchar(255),
    @goods_type varchar(255),
    @portfolio varchar(255),
    @product_type varchar(255),
    @channel varchar(255),
    @reject_reason varchar(255),
    @seller_area int,
    @seller_industry varchar(255),
    @payment_count float,
    @yield_group varchar(255),
    @product_combination varchar(255)
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    INSERT INTO Previous_Application.Previous_Application (application_id, type, annuity_amount, 
                                                           application_amount, credit_amount, down_payment, 
                                                           goods_price, purpose, status, payment_type, 
                                                           companion, client_type, goods_type, portfolio, 
                                                           product_type, channel, reject_reason, seller_area, 
                                                           seller_industry, payment_count, yield_group, 
                                                           product_combination)
    SELECT @application_id, @type, @annuity_amount, @application_amount, @credit_amount, @down_payment, 
           @goods_price, @purpose, @status, @payment_type, @companion, @client_type, @goods_type, @portfolio, 
           @product_type, @channel, @reject_reason, @seller_area, @seller_industry, @payment_count, 
           @yield_group, @product_combination

    /*
    -- Begin Return row code block

    SELECT id, application_id, type, annuity_amount, application_amount, credit_amount, down_payment, 
           goods_price, purpose, status, payment_type, companion, client_type, goods_type, portfolio, 
           product_type, channel, reject_reason, seller_area, seller_industry, payment_count, yield_group, 
           product_combination
    FROM   Previous_Application.Previous_Application
    WHERE  id = @id AND application_id = @application_id AND type = @type AND annuity_amount = @annuity_amount AND 
           application_amount = @application_amount AND credit_amount = @credit_amount AND down_payment = @down_payment AND 
           goods_price = @goods_price AND purpose = @purpose AND status = @status AND payment_type = @payment_type AND 
           companion = @companion AND client_type = @client_type AND goods_type = @goods_type AND portfolio = @portfolio AND 
           product_type = @product_type AND channel = @channel AND reject_reason = @reject_reason AND 
           seller_area = @seller_area AND seller_industry = @seller_industry AND payment_count = @payment_count AND 
           yield_group = @yield_group AND product_combination = @product_combination

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Previous_Application.usp_Previous_Application_Update
IF OBJECT_ID('Previous_Application.usp_Previous_Application_Update') IS NOT NULL
BEGIN 
    DROP PROC Previous_Application.usp_Previous_Application_Update
END
GO
CREATE PROC Previous_Application.usp_Previous_Application_Update
@id int,
@application_id int,
@type varchar(255),
@annuity_amount float,
@application_amount float,
@credit_amount float,
@down_payment float,
@goods_price float,
@purpose varchar(255),
@status varchar(255),
@payment_type varchar(255),
@companion varchar(255),
@client_type varchar(255),
@goods_type varchar(255),
@portfolio varchar(255),
@product_type varchar(255),
@channel varchar(255),
@reject_reason varchar(255),
@seller_area int,
@seller_industry varchar(255),
@payment_count float,
@yield_group varchar(255),
@product_combination varchar(255)
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    UPDATE Previous_Application.Previous_Application
    SET    application_id = @application_id, type = @type, annuity_amount = @annuity_amount, application_amount = @application_amount, 
           credit_amount = @credit_amount, down_payment = @down_payment, goods_price = @goods_price, 
           purpose = @purpose, status = @status, payment_type = @payment_type, companion = @companion, 
           client_type = @client_type, goods_type = @goods_type, portfolio = @portfolio, product_type = @product_type, 
           channel = @channel, reject_reason = @reject_reason, seller_area = @seller_area, seller_industry = @seller_industry, 
           payment_count = @payment_count, yield_group = @yield_group, product_combination = @product_combination
    WHERE  id = @id

    /*
    -- Begin Return row code block

    SELECT application_id, type, annuity_amount, application_amount, credit_amount, down_payment, goods_price, 
           purpose, status, payment_type, companion, client_type, goods_type, portfolio, product_type, 
           channel, reject_reason, seller_area, seller_industry, payment_count, yield_group, product_combination
    FROM   Previous_Application.Previous_Application
    WHERE  id = @id

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Previous_Application.usp_Previous_Application_Delete
IF OBJECT_ID('Previous_Application.usp_Previous_Application_Delete') IS NOT NULL
BEGIN 
    DROP PROC Previous_Application.usp_Previous_Application_Delete
END 
GO
CREATE PROC Previous_Application.usp_Previous_Application_Delete
@id int
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    DELETE
    FROM   Previous_Application.Previous_Application
    WHERE  id = @id

    COMMIT
GO
--endregion

--region PROCEDURE Previous_Application.usp_Previous_Application_Date_Select
IF OBJECT_ID('Previous_Application.usp_Previous_Application_Date_Select') IS NOT NULL
BEGIN 
    DROP PROC Previous_Application.usp_Previous_Application_Date_Select 
END
GO
CREATE PROC Previous_Application.usp_Previous_Application_Date_Select
    @previous_application_id int,
    @weekday varchar(255)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    SELECT previous_application_id, weekday, hour
    FROM   Previous_Application.Previous_Application_Date
    WHERE  previous_application_id = @previous_application_id AND weekday = @weekday 

    COMMIT
GO
--endregion

--region PROCEDURE Previous_Application.usp_Previous_Application_Date_Insert
IF OBJECT_ID('Previous_Application.usp_Previous_Application_Date_Insert') IS NOT NULL
BEGIN 
    DROP PROC Previous_Application.usp_Previous_Application_Date_Insert
END 
GO
CREATE PROC Previous_Application.usp_Previous_Application_Date_Insert
    @previous_application_id int,
    @weekday varchar(255),
    @hour int
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    INSERT INTO Previous_Application.Previous_Application_Date (previous_application_id, weekday, hour)
    SELECT @previous_application_id, @weekday, @hour

    /*
    -- Begin Return row code block

    SELECT previous_application_id, weekday, hour
    FROM   Previous_Application.Previous_Application_Date
    WHERE  previous_application_id = @previous_application_id AND weekday = @weekday AND hour = @hour

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Previous_Application.usp_Previous_Application_Date_Update
IF OBJECT_ID('Previous_Application.usp_Previous_Application_Date_Update') IS NOT NULL
BEGIN 
    DROP PROC Previous_Application.usp_Previous_Application_Date_Update
END
GO
CREATE PROC Previous_Application.usp_Previous_Application_Date_Update
@previous_application_id int,
@weekday varchar(255),
@hour int
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    UPDATE Previous_Application.Previous_Application_Date
    SET    hour = @hour
    WHERE  previous_application_id = @previous_application_id AND weekday = @weekday

    /*
    -- Begin Return row code block

    SELECT hour
    FROM   Previous_Application.Previous_Application_Date
    WHERE  previous_application_id = @previous_application_id AND weekday = @weekday

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Previous_Application.usp_Previous_Application_Date_Delete
IF OBJECT_ID('Previous_Application.usp_Previous_Application_Date_Delete') IS NOT NULL
BEGIN 
    DROP PROC Previous_Application.usp_Previous_Application_Date_Delete
END 
GO
CREATE PROC Previous_Application.usp_Previous_Application_Date_Delete
@previous_application_id int,
@weekday varchar(255)
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    DELETE
    FROM   Previous_Application.Previous_Application_Date
    WHERE  previous_application_id = @previous_application_id AND weekday = @weekday

    COMMIT
GO
--endregion

--region PROCEDURE Previous_Application.usp_Credit_Card_Balance_Select
IF OBJECT_ID('Previous_Application.usp_Credit_Card_Balance_Select') IS NOT NULL
BEGIN 
    DROP PROC Previous_Application.usp_Credit_Card_Balance_Select 
END
GO
CREATE PROC Previous_Application.usp_Credit_Card_Balance_Select
    @previous_application_id int,
    @months_balance float
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    SELECT previous_application_id, months_balance, balance, credit_limit, drawings_atm, drawings, drawings_other, drawings_goods, min_installment, payment, total_payment, principal_receivable, receivable, total_receivable, drawings_atm_count, drawings_count, drawings_other_count, drawings_goods_count, total_installment_count, status, days_past_due, days_past_due_debts
    FROM   Previous_Application.Credit_Card_Balance
    WHERE  previous_application_id = @previous_application_id AND months_balance = @months_balance 

    COMMIT
GO
--endregion

--region PROCEDURE Previous_Application.usp_Credit_Card_Balance_Insert
IF OBJECT_ID('Previous_Application.usp_Credit_Card_Balance_Insert') IS NOT NULL
BEGIN 
    DROP PROC Previous_Application.usp_Credit_Card_Balance_Insert
END 
GO
CREATE PROC Previous_Application.usp_Credit_Card_Balance_Insert
    @previous_application_id int,
    @months_balance float,
    @balance float,
    @credit_limit float,
    @drawings_atm float,
    @drawings float,
    @drawings_other float,
    @drawings_goods float,
    @min_installment float,
    @payment float,
    @total_payment float,
    @principal_receivable float,
    @receivable float,
    @total_receivable float,
    @drawings_atm_count float,
    @drawings_count float,
    @drawings_other_count float,
    @drawings_goods_count float,
    @total_installment_count float,
    @status varchar(255),
    @days_past_due float,
    @days_past_due_debts float
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    INSERT INTO Previous_Application.Credit_Card_Balance (previous_application_id, months_balance, balance, 
                                                          credit_limit, drawings_atm, drawings, drawings_other, 
                                                          drawings_goods, min_installment, payment, 
                                                          total_payment, principal_receivable, receivable, 
                                                          total_receivable, drawings_atm_count, drawings_count, 
                                                          drawings_other_count, drawings_goods_count, 
                                                          total_installment_count, status, days_past_due, 
                                                          days_past_due_debts)
    SELECT @previous_application_id, @months_balance, @balance, @credit_limit, @drawings_atm, @drawings, 
           @drawings_other, @drawings_goods, @min_installment, @payment, @total_payment, @principal_receivable, 
           @receivable, @total_receivable, @drawings_atm_count, @drawings_count, @drawings_other_count, 
           @drawings_goods_count, @total_installment_count, @status, @days_past_due, @days_past_due_debts

    /*
    -- Begin Return row code block

    SELECT previous_application_id, months_balance, balance, credit_limit, drawings_atm, drawings, drawings_other, 
           drawings_goods, min_installment, payment, total_payment, principal_receivable, receivable, 
           total_receivable, drawings_atm_count, drawings_count, drawings_other_count, drawings_goods_count, 
           total_installment_count, status, days_past_due, days_past_due_debts
    FROM   Previous_Application.Credit_Card_Balance
    WHERE  previous_application_id = @previous_application_id AND months_balance = @months_balance AND 
           balance = @balance AND credit_limit = @credit_limit AND drawings_atm = @drawings_atm AND 
           drawings = @drawings AND drawings_other = @drawings_other AND drawings_goods = @drawings_goods AND 
           min_installment = @min_installment AND payment = @payment AND total_payment = @total_payment AND 
           principal_receivable = @principal_receivable AND receivable = @receivable AND total_receivable = @total_receivable AND 
           drawings_atm_count = @drawings_atm_count AND drawings_count = @drawings_count AND drawings_other_count = @drawings_other_count AND 
           drawings_goods_count = @drawings_goods_count AND total_installment_count = @total_installment_count AND 
           status = @status AND days_past_due = @days_past_due AND days_past_due_debts = @days_past_due_debts

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Previous_Application.usp_Credit_Card_Balance_Update
IF OBJECT_ID('Previous_Application.usp_Credit_Card_Balance_Update') IS NOT NULL
BEGIN 
    DROP PROC Previous_Application.usp_Credit_Card_Balance_Update
END
GO
CREATE PROC Previous_Application.usp_Credit_Card_Balance_Update
@previous_application_id int,
@months_balance float,
@balance float,
@credit_limit float,
@drawings_atm float,
@drawings float,
@drawings_other float,
@drawings_goods float,
@min_installment float,
@payment float,
@total_payment float,
@principal_receivable float,
@receivable float,
@total_receivable float,
@drawings_atm_count float,
@drawings_count float,
@drawings_other_count float,
@drawings_goods_count float,
@total_installment_count float,
@status varchar(255),
@days_past_due float,
@days_past_due_debts float
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    UPDATE Previous_Application.Credit_Card_Balance
    SET    balance = @balance, credit_limit = @credit_limit, drawings_atm = @drawings_atm, drawings = @drawings, 
           drawings_other = @drawings_other, drawings_goods = @drawings_goods, min_installment = @min_installment, 
           payment = @payment, total_payment = @total_payment, principal_receivable = @principal_receivable, 
           receivable = @receivable, total_receivable = @total_receivable, drawings_atm_count = @drawings_atm_count, 
           drawings_count = @drawings_count, drawings_other_count = @drawings_other_count, drawings_goods_count = @drawings_goods_count, 
           total_installment_count = @total_installment_count, status = @status, days_past_due = @days_past_due, 
           days_past_due_debts = @days_past_due_debts
    WHERE  previous_application_id = @previous_application_id AND months_balance = @months_balance

    /*
    -- Begin Return row code block

    SELECT balance, credit_limit, drawings_atm, drawings, drawings_other, drawings_goods, min_installment, 
           payment, total_payment, principal_receivable, receivable, total_receivable, drawings_atm_count, 
           drawings_count, drawings_other_count, drawings_goods_count, total_installment_count, status, 
           days_past_due, days_past_due_debts
    FROM   Previous_Application.Credit_Card_Balance
    WHERE  previous_application_id = @previous_application_id AND months_balance = @months_balance

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Previous_Application.usp_Credit_Card_Balance_Delete
IF OBJECT_ID('Previous_Application.usp_Credit_Card_Balance_Delete') IS NOT NULL
BEGIN 
    DROP PROC Previous_Application.usp_Credit_Card_Balance_Delete
END 
GO
CREATE PROC Previous_Application.usp_Credit_Card_Balance_Delete
@previous_application_id int,
@months_balance float
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    DELETE
    FROM   Previous_Application.Credit_Card_Balance
    WHERE  previous_application_id = @previous_application_id AND months_balance = @months_balance

    COMMIT
GO
--endregion

--region PROCEDURE Previous_Application.usp_Installment_Payment_Select
IF OBJECT_ID('Previous_Application.usp_Installment_Payment_Select') IS NOT NULL
BEGIN 
    DROP PROC Previous_Application.usp_Installment_Payment_Select 
END
GO
CREATE PROC Previous_Application.usp_Installment_Payment_Select
    @previous_application_id int,
    @version float,
    @number int
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    SELECT previous_application_id, version, number, days_from_application, days_from_payment, amount, payment_amount
    FROM   Previous_Application.Installment_Payment
    WHERE  previous_application_id = @previous_application_id AND version = @version AND number = @number 

    COMMIT
GO
--endregion

--region PROCEDURE Previous_Application.usp_Installment_Payment_Insert
IF OBJECT_ID('Previous_Application.usp_Installment_Payment_Insert') IS NOT NULL
BEGIN 
    DROP PROC Previous_Application.usp_Installment_Payment_Insert
END 
GO
CREATE PROC Previous_Application.usp_Installment_Payment_Insert
    @previous_application_id int,
    @version float,
    @number int,
    @days_from_application float,
    @days_from_payment float,
    @amount float,
    @payment_amount float
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    INSERT INTO Previous_Application.Installment_Payment (previous_application_id, version, number, 
                                                          days_from_application, days_from_payment, 
                                                          amount, payment_amount)
    SELECT @previous_application_id, @version, @number, @days_from_application, @days_from_payment, 
           @amount, @payment_amount

    /*
    -- Begin Return row code block

    SELECT previous_application_id, version, number, days_from_application, days_from_payment, amount, 
           payment_amount
    FROM   Previous_Application.Installment_Payment
    WHERE  previous_application_id = @previous_application_id AND version = @version AND number = @number AND 
           days_from_application = @days_from_application AND days_from_payment = @days_from_payment AND 
           amount = @amount AND payment_amount = @payment_amount

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Previous_Application.usp_Installment_Payment_Update
IF OBJECT_ID('Previous_Application.usp_Installment_Payment_Update') IS NOT NULL
BEGIN 
    DROP PROC Previous_Application.usp_Installment_Payment_Update
END
GO
CREATE PROC Previous_Application.usp_Installment_Payment_Update
@previous_application_id int,
@version float,
@number int,
@days_from_application float,
@days_from_payment float,
@amount float,
@payment_amount float
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    UPDATE Previous_Application.Installment_Payment
    SET    days_from_application = @days_from_application, days_from_payment = @days_from_payment, amount = @amount, 
           payment_amount = @payment_amount
    WHERE  previous_application_id = @previous_application_id AND version = @version AND number = @number

    /*
    -- Begin Return row code block

    SELECT days_from_application, days_from_payment, amount, payment_amount
    FROM   Previous_Application.Installment_Payment
    WHERE  previous_application_id = @previous_application_id AND version = @version AND number = @number

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Previous_Application.usp_Installment_Payment_Delete
IF OBJECT_ID('Previous_Application.usp_Installment_Payment_Delete') IS NOT NULL
BEGIN 
    DROP PROC Previous_Application.usp_Installment_Payment_Delete
END 
GO
CREATE PROC Previous_Application.usp_Installment_Payment_Delete
@previous_application_id int,
@version float,
@number int
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    DELETE
    FROM   Previous_Application.Installment_Payment
    WHERE  previous_application_id = @previous_application_id AND version = @version AND number = @number

    COMMIT
GO
--endregion

--region PROCEDURE Credit_Bureau.usp_Credit_Bureau_Balance_Select
IF OBJECT_ID('Credit_Bureau.usp_Credit_Bureau_Balance_Select') IS NOT NULL
BEGIN 
    DROP PROC Credit_Bureau.usp_Credit_Bureau_Balance_Select 
END
GO
CREATE PROC Credit_Bureau.usp_Credit_Bureau_Balance_Select
    @id int
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    SELECT id, credit_bureau_id, months_balance, status
    FROM   Credit_Bureau.Credit_Bureau_Balance
    WHERE  id = @id 

    COMMIT
GO
--endregion

--region PROCEDURE Credit_Bureau.usp_Credit_Bureau_Balance_Insert
IF OBJECT_ID('Credit_Bureau.usp_Credit_Bureau_Balance_Insert') IS NOT NULL
BEGIN 
    DROP PROC Credit_Bureau.usp_Credit_Bureau_Balance_Insert
END 
GO
CREATE PROC Credit_Bureau.usp_Credit_Bureau_Balance_Insert
    @id int,
    @credit_bureau_id int,
    @months_balance int,
    @status varchar(255)
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    INSERT INTO Credit_Bureau.Credit_Bureau_Balance (id, credit_bureau_id, months_balance, status)
    SELECT @id, @credit_bureau_id, @months_balance, @status

    /*
    -- Begin Return row code block

    SELECT id, credit_bureau_id, months_balance, status
    FROM   Credit_Bureau.Credit_Bureau_Balance
    WHERE  id = @id AND credit_bureau_id = @credit_bureau_id AND months_balance = @months_balance AND 
           status = @status

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Credit_Bureau.usp_Credit_Bureau_Balance_Update
IF OBJECT_ID('Credit_Bureau.usp_Credit_Bureau_Balance_Update') IS NOT NULL
BEGIN 
    DROP PROC Credit_Bureau.usp_Credit_Bureau_Balance_Update
END
GO
CREATE PROC Credit_Bureau.usp_Credit_Bureau_Balance_Update
@id int,
@credit_bureau_id int,
@months_balance int,
@status varchar(255)
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    UPDATE Credit_Bureau.Credit_Bureau_Balance
    SET    credit_bureau_id = @credit_bureau_id, months_balance = @months_balance, status = @status
    WHERE  id = @id

    /*
    -- Begin Return row code block

    SELECT credit_bureau_id, months_balance, status
    FROM   Credit_Bureau.Credit_Bureau_Balance
    WHERE  id = @id

    -- End Return row code block

    */
    COMMIT
GO
--endregion

--region PROCEDURE Credit_Bureau.usp_Credit_Bureau_Balance_Delete
IF OBJECT_ID('Credit_Bureau.usp_Credit_Bureau_Balance_Delete') IS NOT NULL
BEGIN 
    DROP PROC Credit_Bureau.usp_Credit_Bureau_Balance_Delete
END 
GO
CREATE PROC Credit_Bureau.usp_Credit_Bureau_Balance_Delete
@id int
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    DELETE
    FROM   Credit_Bureau.Credit_Bureau_Balance
    WHERE  id = @id

    COMMIT
GO
--endregion

USE master;
GO