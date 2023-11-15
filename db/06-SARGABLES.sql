USE HomeCredit;
GO

-- Query to obtain the number of approved and rejected credit applications by day of the week
SELECT 
    AD.weekday,
    SUM(CASE WHEN CB.status = ? THEN 1 ELSE 0 END) AS consult -- ? = Active or Closed
FROM 
    Application.Application A
JOIN 
    Application.Application_Date AD ON A.id = AD.application_id
LEFT JOIN 
    Credit_Bureau.Credit_Bureau_Application CB ON A.id = CB.application_id
GROUP BY 
    AD.weekday;

-- Query to obtain the number of credit applications by type of work and application status
SELECT 
    J.type AS JobType,
    CB.status AS CreditStatus,
    COUNT(A.id) AS ApplicationCount
FROM 
    Application.Application A
JOIN 
    Client.Job J ON A.id = J.client_id
LEFT JOIN 
    Credit_Bureau.Credit_Bureau_Application CB ON A.id = CB.application_id
WHERE
	CB.status IS NOT NULL AND CB.status = ? -- ? = Active or Closed
GROUP BY 
    J.type, CB.status
ORDER BY 
    ApplicationCount DESC;

-- Query to obtain the number of credit applications by client gender
SELECT 
    C.gender,
    COUNT(A.id) AS ApplicationCount
FROM 
    Application.Application A
JOIN 
    Client.Client C ON A.id = C.application_id
LEFT JOIN 
    Credit_Bureau.Credit_Bureau_Application CB ON A.id = CB.application_id
LEFT JOIN 
    Previous_Application.Previous_Application PA ON A.id = PA.application_id
GROUP BY 
    C.gender;

-- Query to obtain the number of credit applications by goods type ordered by day of the week
SELECT 
    AD.weekday,
    COUNT(A.id) AS ApplicationCount
FROM 
    Application.Application A
JOIN 
    Application.Application_Date AD ON A.id = AD.application_id
LEFT JOIN 
    Previous_Application.Previous_Application PA ON A.id = PA.application_id
LEFT JOIN 
	Credit_Bureau.Credit_Bureau_Application CBA ON CBA.id = PA.application_id
WHERE
	A.type = ? -- ? = Cash loans or Revolving loans
GROUP BY 
    AD.weekday;

-- Query to obtain the number of credit applications by family status and loan type
SELECT 
    F.status AS FamilyStatus,
    COUNT(A.id) AS ApplicationCount
FROM 
    Application.Application A
JOIN 
    Client.Family F ON A.id = F.client_id
JOIN 
    Previous_Application.Previous_Application P ON A.id = P.application_id
WHERE
	P.type = ? -- ? = Consumer loans, Revolving loans or Cash loans
GROUP BY 
    F.status;

USE master;
GO