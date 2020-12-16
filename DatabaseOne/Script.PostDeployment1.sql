-- Insert people
MERGE INTO [dbo].[People] AS [Target]
USING (VALUES
	(1, N'Greg', N'Eve', N'Morrison', CAST(N'1980-11-16' AS Date)),
	(2, N'Sonny', N'Natalia', N'White', CAST(N'1995-04-08' AS Date)),
	(3, N'Adrianne', N'Joslyn', N'Appleton', CAST(N'1960-07-13' AS Date)),
	(4, N'Shaw', N'Milani', N'Hunter', CAST(N'1961-02-10' AS Date)),
	(5, N'John', N'', N'Willey', CAST(N'1963-06-22' AS Date)),
	(6, N'Adriana', N'Ally', N'Mullins', CAST(N'1987-06-12' AS Date)),
	(7, N'Layla', N'Tracie', N'Huxley', CAST(N'1994-05-04' AS Date)),
	(8, N'Thomasina', N'Joselyn', N'Shirley', CAST(N'1978-01-03' AS Date)),
	(9, N'Katy', N'Abegail', N'Matthewson', CAST(N'1989-07-04' AS Date))
) AS [Source] ([PersonId], [FirstName], [MiddleName], [LastName], [Birthdate])
ON ([Target].[PersonId] = [Source].[PersonId])
WHEN NOT MATCHED BY TARGET THEN
	INSERT ([PersonId], [FirstName], [MiddleName], [LastName], [Birthdate])
	VALUES([Source].[PersonId], [Source].[FirstName], [Source].[MiddleName], [Source].[LastName], [Source].[Birthdate]);

-- Insert users
MERGE INTO [dbo].[SystemUsers] AS Target
USING (VALUES
	(1, 1, N'gmorrison', N'gmorrison@mail.com', N'123'),
	(2, 2, N'swhite', N'swhite@mail.com', N'123'),
	(3, 3, N'aappleton', N'aappleton@mail.com', N'123'),
	(4, 4, N'shunter', N'shunter@mail.com', N'123'),
	(5, 5, N'jwilley', N'jwilley@mail.com', N'123'),
	(6, 6, N'amullins', N'amullins@mail.com', N'123'),
	(7, 7, N'lhuxley', N'lhuxley@mail.com', N'123'),
	(8, 8, N'tshirley', N'tshirley@mail.com', N'123'),
	(9, 9, N'kmatthewson', N'kmatthewson@mail.com', N'123')
) AS Source ([UserId], [PersonId], [Username], [Email], [Password])
ON ([Target].[UserId] = [Source].[UserId])
WHEN NOT MATCHED BY TARGET THEN
	INSERT ([UserId], [PersonId], [Username], [Email], [Password])
	VALUES([Source].[UserId], [Source].[PersonId], [Source].[Username], [Source].[Email], [Source].[Password]);
