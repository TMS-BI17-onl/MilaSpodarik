--1

SELECT [Person].[Person].[FirstName],[Person].[Person].[LastName], [Person].[PersonPhone].[PhoneNumber]
FROM [Person].[Person] JOIN [Person].[PersonPhone] ON [Person].[Person].[BusinessEntityID] = [Person].[PersonPhone].BusinessEntityID
WHERE [PhoneNumber] LIKE '4_5%'


--2 

SELECT [HumanResources].[Employee].[BusinessEntityID],[NationalIDNumber], BirthDate,year(getdate())-year(BirthDate) as age,
    CASE WHEN year(getdate())-year(BirthDate) BETWEEN 17 AND 21 THEN 'Adolescence'
		 WHEN year(getdate())-year(BirthDate) BETWEEN 22 AND 59 THEN 'Adults'
		 WHEN year(getdate())-year(BirthDate) BETWEEN 60 AND 75 THEN 'Elderly'
		 WHEN year(getdate())-year(BirthDate) BETWEEN 75 AND 90 THEN 'Senile'
		 ELSE 'N/A'
	END AS Category
	FROM [HumanResources].[Employee]


--3
SELECT StandardCost, Color, Name
FROM    
(SELECT  StandardCost, Color, Name,
        ROW_NUMBER() OVER (PARTITION BY Color ORDER BY StandardCost DESC) ROW_NUM
FROM [Production].[Product]) allProducts
WHERE ROW_NUM = 1



SELECT MAX(StandardCost) as MAXCost, Color
FROM [Production].[Product]
GROUP BY [Color]










