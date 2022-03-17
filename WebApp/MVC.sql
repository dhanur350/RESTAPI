INSERT into [dbo].[CommandItems]
VALUES('How to generate a migration in EF Core',
        '.Net Core EF', 'dotnet ef migrations add DB');
SELECT *
from dbo.CommandItems;
INSERT into dbo.CommandItems
VALUES('How to update the database (run migrations)'
, '.Net Core EF', 'dotnet ef database update');
DELETE from dbo.CommandItems WHERE Id=1004;
SELECT *
from CommandItems;
UPDATE CommandItems SET Id=3 WHERE Id=1004;
SET IDENTITY_INSERT CommandItems ON;
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE=OFF;
DBCC CHECKIDENT('CommandItems', RESEED, NEW_RESEED_VALUE)
INSERT into dbo.CommandItems
    (Id,HowTo,plateform,Commandline)
VALUES(3, 'How to build a .NET Core App'
, '.Net Core', 'dotnet build');
select *
from CommandItems;
insert into CommandItems
    (Id,HowTo,plateform,Commandline)
VALUES(1, 'How to add EF in .NET Core', '.NEt Core EF', 'dotnet ef');
SET IDENTITY_INSERT CommandItems ON;
delete from CommandItems WHERE Id=2;