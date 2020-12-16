-- Insert users
SET IDENTITY_INSERT [dbo].[Users] ON;

MERGE INTO [dbo].[Users] AS [Target]
USING (VALUES
	(1, N'Luella Jolie Martel', N'lmartel@mail.com', N'lmartel', N'123', CAST(N'1977-04-12' AS Date)),
	(2, N'Edna Isadora Sanderson', N'esanderson@mail.com', N'esanderson', N'123', CAST(N'1968-08-19' AS Date)),
	(3, N'Peyton Honey Sherburn', N'psherburn@mail.com', N'psherburn', N'123', CAST(N'1956-02-01' AS Date)),
	(4, N'Denice Harlan Brand', N'dbrand@mail.com', N'dbrand', N'123', CAST(N'1973-11-10' AS Date)),
	(5, N'Salome Reg Randall', N'srandall@mail.com', N'srandall', N'123', CAST(N'1985-05-16' AS Date)),
	(6, N'Darian Keri Savidge', N'dsavidge@mail.com', N'dsavidge', N'123', CAST(N'1977-06-09' AS Date)),
	(7, N'Trixie Mavis Rennold', N'trennold@mail.com', N'trennold', N'123', CAST(N'1953-11-27' AS Date)),
	(8, N'Kendra Minty Johnson', N'kjohnson@mail.com', N'kjohnson', N'123', CAST(N'1990-11-04' AS Date)),
	(9, N'Barnaby Dewey Bates', N'bbates@mail.com', N'bbates', N'123', CAST(N'1973-01-14' AS Date)),
	(10, N'Keefe Lisha Harley', N'kharley@mail.com', N'kharley', N'123', CAST(N'1976-07-19' AS Date)),
	(11, N'Jean Abraham Edwardson', N'jedwardson@mail.com', N'jedwardson', N'123', CAST(N'1979-04-19' AS Date))
) AS [Source] ([Id], [FullName], [Email], [Username], [Password], [Birthdate])
ON ([Target].[Id] = [Source].[Id])
WHEN NOT MATCHED BY TARGET THEN
	INSERT ([Id], [FullName], [Email], [Username], [Password], [Birthdate])
	VALUES ([Source].[Id], [Source].[FullName], [Source].[Email], [Source].[Username], [Source].[Password], [Source].[Birthdate]);

SET IDENTITY_INSERT [dbo].[Users] OFF;
