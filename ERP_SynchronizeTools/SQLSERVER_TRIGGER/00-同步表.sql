USE [TESTDB]
GO

/****** Object:  Table [dbo].[Synchronize_DataTable]    Script Date: 2019-05-31 09:27:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Synchronize_DataTable](
	[ID] [INT] IDENTITY(1,1) NOT NULL,
	[SynType] [VARCHAR](10) NULL,
	[JsonText] [NVARCHAR](MAX) NULL,
	[IsFinish] [NUMERIC](1, 0) NULL,
	[ErrorMsg] [VARCHAR](1000) NULL,
	[DataType] [VARCHAR](20) NULL,
	[DateInsert] [VARCHAR](24) NULL,
	[Remark] [VARCHAR](10) NULL DEFAULT (''),
	[FinishCode_test] [VARCHAR](10) NULL,
	[ErrorMsg_test] [VARCHAR](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


