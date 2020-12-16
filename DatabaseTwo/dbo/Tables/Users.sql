CREATE TABLE [dbo].[Users] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [FullName]  NVARCHAR (200) NOT NULL,
    [Email]     VARCHAR (50)   NOT NULL,
    [Username]  VARCHAR (50)   NOT NULL,
    [Password]  VARCHAR (50)   NOT NULL,
    [Birthdate] DATE           NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([Id] ASC)
);



