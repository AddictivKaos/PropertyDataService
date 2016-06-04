sp_configure 'Show Advanced Options', 1;
RECONFIGURE;
GO
sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;
GO
EXEC sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'AllowInProcess', 1
GO
EXEC sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'DynamicParameters', 1
GO
SELECT * INTO dbo.['PriceFinderOwnership'] FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
'Excel 8.0;Database=e:\downloads\everton park splitters.xls', [Ownership Search$])