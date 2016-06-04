SELECT * 
FROM
(
SELECT  DENSE_RANK() OVER ( ORDER BY Street) AS rn
      ,'Address Line' + CAST(ID AS NVARCHAR(10)) AS AddressLines
      , [Data]
FROM dbo.Splitters
            CROSS APPLY dbo.func_split(Street, CHAR(32))c
)Q
PIVOT (MAX([Data])
      FOR AddressLines
      IN ([Address Line1],[Address Line2],[Address Line3]
             ,[Address Line4],[Address Line5],[Address Line6])
      )p