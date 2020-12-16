CREATE VIEW [dbo].[UsersList]
AS
	SELECT
		[u].[UserId],
		[u].[Username],
		[u].[Email],
		[p].[FirstName] + CASE WHEN [p].[MiddleName] IS NULL THEN '' ELSE ' ' + [p].[MiddleName] END + [p].[LastName] AS [Name],
		[p].[Birthdate]
	FROM
		[dbo].[SystemUsers] AS [u]
		INNER JOIN [dbo].[People] AS [p] ON [u].[PersonId] = [p].[PersonId]