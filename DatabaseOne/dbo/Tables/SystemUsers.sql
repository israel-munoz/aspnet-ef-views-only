CREATE TABLE [dbo].[SystemUsers] (
    [UserId]   INT            NOT NULL,
    [PersonId] INT            NOT NULL,
    [Username] VARCHAR (50)   NOT NULL,
    [Email]    VARCHAR (50)   NOT NULL,
    [Password] NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_SystemUsers] PRIMARY KEY CLUSTERED ([PersonId] ASC),
    CONSTRAINT [FK_SystemUsers_People] FOREIGN KEY ([PersonId]) REFERENCES [dbo].[People] ([PersonId])
);



