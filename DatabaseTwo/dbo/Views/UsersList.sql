CREATE VIEW [dbo].[UsersList]
AS
	SELECT
		[Id] AS [UserId],
		[Username],
		[Email],
		[FullName] AS [Name],
		[Birthdate]
	FROM
		[dbo].[Users]