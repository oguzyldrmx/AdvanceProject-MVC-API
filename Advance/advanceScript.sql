
/****** Object:  Table [dbo].[Advance]    Script Date: 19.12.2023 18:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Advance]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Advance](
	[AdvanceID] [int] IDENTITY(1,1) NOT NULL,
	[TitleAmountApprovalRuleID] [int] NULL,
	[AdvanceAmount] [decimal](18, 0) NULL,
	[AdvanceExplanation] [nvarchar](max) COLLATE Turkish_CI_AS NULL,
	[WorkerID] [int] NULL,
	[RequestDate] [datetime] NULL,
	[DesiredDate] [datetime] NULL,
	[isApproved] [bit] NULL,
	[ProjectID] [int] NULL,
 CONSTRAINT [PK_Advance] PRIMARY KEY CLUSTERED 
(
	[AdvanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Advance] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[AdvanceApproveStatus]    Script Date: 19.12.2023 18:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdvanceApproveStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AdvanceApproveStatus](
	[ApproveStatusID] [int] IDENTITY(1,1) NOT NULL,
	[AdvanceID] [int] NULL,
	[ApproverOrRejecterID] [int] NULL,
	[ApprovalStatusID] [int] NULL,
	[Approved/DeclinedDate] [datetime] NULL,
	[ApprovedAmount] [decimal](18, 0) NULL,
	[NextApproverOrRejecterID] [int] NULL,
	[isProcess] [bit] NULL,
	[DeterminedPaymentDate] [datetime] NULL,
 CONSTRAINT [PK_AdvanceApproveStatus] PRIMARY KEY CLUSTERED 
(
	[ApproveStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[AdvanceApproveStatus] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[AdvanceReceipt]    Script Date: 19.12.2023 18:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdvanceReceipt]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AdvanceReceipt](
	[AdvanceID] [int] NULL,
	[PaybackReceiptID] [int] NULL,
	[PaymantReceiptID] [int] NULL,
	[PaybackDate] [datetime] NULL
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[AdvanceReceipt] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Amount]    Script Date: 19.12.2023 18:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Amount]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Amount](
	[AmountID] [int] IDENTITY(1,1) NOT NULL,
	[MinAmount] [decimal](18, 0) NULL,
	[MaxAmount] [decimal](18, 0) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Amount] PRIMARY KEY CLUSTERED 
(
	[AmountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Amount] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[ApprovalStatus]    Script Date: 19.12.2023 18:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApprovalStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ApprovalStatus](
	[ApprovalStatusID] [int] IDENTITY(1,1) NOT NULL,
	[ApprovalName] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[NextApprovalName] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[IsActive] [nchar](10) COLLATE Turkish_CI_AS NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_ApprovalStatus] PRIMARY KEY CLUSTERED 
(
	[ApprovalStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[ApprovalStatus] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Authorization]    Script Date: 19.12.2023 18:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Authorization]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Authorization](
	[AuthorizationID] [int] IDENTITY(1,1) NOT NULL,
	[AutherizationPath] [nvarchar](250) COLLATE Turkish_CI_AS NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Authorization] PRIMARY KEY CLUSTERED 
(
	[AuthorizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Authorization] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Message]    Script Date: 19.12.2023 18:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Message]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Message](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[MessageName] [nvarchar](100) COLLATE Turkish_CI_AS NULL,
	[MessageDescription] [nvarchar](max) COLLATE Turkish_CI_AS NULL,
	[MessageTakerID] [int] NULL,
	[MessageSenderID] [int] NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Message] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[PageAuthorization]    Script Date: 19.12.2023 18:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PageAuthorization]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PageAuthorization](
	[PageAuthorizationID] [int] IDENTITY(1,1) NOT NULL,
	[PageAuthrizationName] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[PageAuthorizationPath] [nvarchar](max) COLLATE Turkish_CI_AS NULL,
	[IsActive] [nchar](10) COLLATE Turkish_CI_AS NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_PageAuthorization] PRIMARY KEY CLUSTERED 
(
	[PageAuthorizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[PageAuthorization] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[PaybackReceipt]    Script Date: 19.12.2023 18:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaybackReceipt]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PaybackReceipt](
	[PaybackReceiptID] [int] IDENTITY(1,1) NOT NULL,
	[ReceiptDate] [datetime] NULL,
	[ReceiptDescription] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[IsActive] [nchar](10) COLLATE Turkish_CI_AS NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_PaybackReceipt] PRIMARY KEY CLUSTERED 
(
	[PaybackReceiptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[PaybackReceipt] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[PaymentReceipt]    Script Date: 19.12.2023 18:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaymentReceipt]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PaymentReceipt](
	[PaymentReceiptID] [int] NOT NULL,
	[ReceiptDate] [datetime] NULL,
	[ReceiptDescription] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[DeterminedPaybackDate] [datetime] NULL,
	[IsActive] [nchar](10) COLLATE Turkish_CI_AS NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_PaymentReceipt] PRIMARY KEY CLUSTERED 
(
	[PaymentReceiptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[PaymentReceipt] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Project]    Script Date: 19.12.2023 18:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Project]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Project](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ProjectExplanation] [nvarchar](max) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Project] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[ProjectWorker]    Script Date: 19.12.2023 18:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProjectWorker]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProjectWorker](
	[WorkerID] [int] NULL,
	[ProjectID] [int] NULL
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[ProjectWorker] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Report]    Script Date: 19.12.2023 18:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Report]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Report](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[WorkerID] [int] NULL,
	[AdvanceID] [int] NULL,
	[IsActive] [nchar](10) COLLATE Turkish_CI_AS NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Report] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Role]    Script Date: 19.12.2023 18:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[IsActive] [bit] NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Role] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[RoleAuthorization]    Script Date: 19.12.2023 18:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleAuthorization]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RoleAuthorization](
	[RoleID] [int] NOT NULL,
	[AuthorizationID] [int] NOT NULL,
	[PageAuthorizationID] [int] NOT NULL,
	[IsActive] [nchar](10) COLLATE Turkish_CI_AS NOT NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[RoleAuthorization] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Rule]    Script Date: 19.12.2023 18:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Rule](
	[RuleID] [int] IDENTITY(1,1) NOT NULL,
	[RuleName] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Rule] PRIMARY KEY CLUSTERED 
(
	[RuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Rule] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[RuleWorker]    Script Date: 19.12.2023 18:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RuleWorker]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RuleWorker](
	[RuleID] [int] NULL,
	[TitleID] [int] NULL,
	[ApprovalOrder] [tinyint] NULL
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[RuleWorker] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Title]    Script Date: 19.12.2023 18:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Title]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Title](
	[TitleID] [int] IDENTITY(1,1) NOT NULL,
	[TitleName] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[TitleDescription] [nvarchar](max) COLLATE Turkish_CI_AS NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_Title] PRIMARY KEY CLUSTERED 
(
	[TitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Title] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[TitleAmountApprovalRule]    Script Date: 19.12.2023 18:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TitleAmountApprovalRule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TitleAmountApprovalRule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AmountID] [int] NULL,
	[Date] [datetime] NULL,
	[TitleID] [int] NULL,
 CONSTRAINT [PK_TitleAmountApprovalRule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[TitleAmountApprovalRule] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 19.12.2023 18:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Unit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Unit](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[UnitExplanation] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Unit] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Worker]    Script Date: 19.12.2023 18:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Worker]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Worker](
	[WorkerID] [int] IDENTITY(1,1) NOT NULL,
	[WorkerName] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[WorkerEmail] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[WorkerPhonenumber] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[UnitID] [int] NULL,
	[TitleID] [int] NULL,
	[UpperWorkerID] [int] NULL,
	[PasswordSalt] [varbinary](max) NULL,
	[PasswordHash] [varbinary](max) NULL,
 CONSTRAINT [PK_Worker] PRIMARY KEY CLUSTERED 
(
	[WorkerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Worker] TO  SCHEMA OWNER 
GO
SET IDENTITY_INSERT [dbo].[Advance] ON 

INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (1, 4, CAST(10449 AS Decimal(18, 0)), N'Acil ', 14, CAST(N'2023-12-12T00:00:00.000' AS DateTime), CAST(N'2023-12-15T00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (2, 4, CAST(20000 AS Decimal(18, 0)), N'Avans', 10, CAST(N'2023-09-09T00:00:00.000' AS DateTime), CAST(N'2023-09-15T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (3, 3, CAST(10000 AS Decimal(18, 0)), N'fdsaf', 1, NULL, CAST(N'2023-12-18T00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (5, 3, CAST(5555 AS Decimal(18, 0)), N'fdsafas', 4, CAST(N'2023-12-16T21:10:44.730' AS DateTime), CAST(N'2023-12-16T18:10:17.887' AS DateTime), NULL, 1)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (13, 1, CAST(1000 AS Decimal(18, 0)), N'yeni', 10, CAST(N'2023-12-16T22:54:48.187' AS DateTime), CAST(N'2023-12-31T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (14, 2, CAST(2500 AS Decimal(18, 0)), N'yeni02', 10, CAST(N'2023-12-16T20:02:56.387' AS DateTime), CAST(N'2023-12-31T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (15, 4, CAST(151515 AS Decimal(18, 0)), N'enginim için', 10, CAST(N'2023-12-17T13:48:37.630' AS DateTime), CAST(N'2023-12-25T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (17, 4, CAST(15000 AS Decimal(18, 0)), N'Nakit', 21, CAST(N'2023-12-18T11:57:37.230' AS DateTime), CAST(N'2023-12-31T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (18, 4, CAST(30000 AS Decimal(18, 0)), N'yeni', 21, CAST(N'2023-12-18T13:36:12.060' AS DateTime), CAST(N'2023-12-30T00:00:00.000' AS DateTime), NULL, 3)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (19, 4, CAST(15000 AS Decimal(18, 0)), N'yeni', 19, CAST(N'2023-12-18T14:54:10.153' AS DateTime), CAST(N'2023-12-27T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (20, 4, CAST(22000 AS Decimal(18, 0)), N'yeni', 20, CAST(N'2023-12-18T15:27:53.880' AS DateTime), CAST(N'2023-12-24T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (21, 4, CAST(22222 AS Decimal(18, 0)), N'yeni', 21, CAST(N'2023-12-18T15:37:57.237' AS DateTime), CAST(N'2023-12-24T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (22, 4, CAST(12500 AS Decimal(18, 0)), N'yeni', 21, CAST(N'2023-12-19T08:26:49.220' AS DateTime), CAST(N'2023-12-28T00:00:00.000' AS DateTime), NULL, 3)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (23, 1, CAST(700 AS Decimal(18, 0)), N'yeni', 21, CAST(N'2023-12-19T10:42:10.863' AS DateTime), CAST(N'2023-12-28T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (24, 1, CAST(800 AS Decimal(18, 0)), N'yeni', 21, CAST(N'2023-12-19T10:45:43.130' AS DateTime), CAST(N'2023-12-31T00:00:00.000' AS DateTime), NULL, 3)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (25, 1, CAST(500 AS Decimal(18, 0)), N'yeni', 21, CAST(N'2023-12-19T11:29:42.853' AS DateTime), CAST(N'2023-11-06T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (26, 1, CAST(400 AS Decimal(18, 0)), N'yeni', 21, CAST(N'2023-12-19T11:40:41.247' AS DateTime), CAST(N'2023-12-20T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (27, 2, CAST(1500 AS Decimal(18, 0)), N'yeni', 19, CAST(N'2023-12-19T11:45:22.740' AS DateTime), CAST(N'2023-12-24T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (28, 2, CAST(1666 AS Decimal(18, 0)), N'yeni02', 18, CAST(N'2023-12-19T12:03:20.010' AS DateTime), CAST(N'2023-12-31T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (29, 2, CAST(1700 AS Decimal(18, 0)), N'dsafdas', 18, CAST(N'2023-12-19T12:22:14.907' AS DateTime), CAST(N'2023-12-20T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (30, 2, CAST(1800 AS Decimal(18, 0)), N'fdsafdasfdas', 18, CAST(N'2023-12-19T12:22:24.277' AS DateTime), CAST(N'2023-12-31T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (31, 2, CAST(1500 AS Decimal(18, 0)), N'gmy', 19, CAST(N'2023-12-19T12:44:26.017' AS DateTime), CAST(N'2023-12-27T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (32, 4, CAST(15000 AS Decimal(18, 0)), N'15k', 19, CAST(N'2023-12-19T12:59:53.567' AS DateTime), CAST(N'2023-12-27T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (33, 4, CAST(15000 AS Decimal(18, 0)), N'123', 19, CAST(N'2023-12-19T13:22:08.963' AS DateTime), CAST(N'2023-12-29T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (34, 4, CAST(20000 AS Decimal(18, 0)), N'20', 19, CAST(N'2023-12-19T13:34:48.253' AS DateTime), CAST(N'2023-12-27T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[Advance] ([AdvanceID], [TitleAmountApprovalRuleID], [AdvanceAmount], [AdvanceExplanation], [WorkerID], [RequestDate], [DesiredDate], [isApproved], [ProjectID]) VALUES (35, 3, CAST(8000 AS Decimal(18, 0)), N'yeni', 17, CAST(N'2023-12-19T13:37:49.570' AS DateTime), CAST(N'2023-12-20T00:00:00.000' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Advance] OFF
GO
SET IDENTITY_INSERT [dbo].[AdvanceApproveStatus] ON 

INSERT [dbo].[AdvanceApproveStatus] ([ApproveStatusID], [AdvanceID], [ApproverOrRejecterID], [ApprovalStatusID], [Approved/DeclinedDate], [ApprovedAmount], [NextApproverOrRejecterID], [isProcess], [DeterminedPaymentDate]) VALUES (145, 34, NULL, 1, CAST(N'2023-12-19T16:34:48.260' AS DateTime), NULL, 18, 1, NULL)
INSERT [dbo].[AdvanceApproveStatus] ([ApproveStatusID], [AdvanceID], [ApproverOrRejecterID], [ApprovalStatusID], [Approved/DeclinedDate], [ApprovedAmount], [NextApproverOrRejecterID], [isProcess], [DeterminedPaymentDate]) VALUES (146, 34, 18, 2, CAST(N'2023-12-19T16:35:23.140' AS DateTime), CAST(20000 AS Decimal(18, 0)), 17, 1, NULL)
INSERT [dbo].[AdvanceApproveStatus] ([ApproveStatusID], [AdvanceID], [ApproverOrRejecterID], [ApprovalStatusID], [Approved/DeclinedDate], [ApprovedAmount], [NextApproverOrRejecterID], [isProcess], [DeterminedPaymentDate]) VALUES (147, 34, 17, 3, CAST(N'2023-12-19T16:35:44.420' AS DateTime), CAST(20000 AS Decimal(18, 0)), 16, 1, NULL)
INSERT [dbo].[AdvanceApproveStatus] ([ApproveStatusID], [AdvanceID], [ApproverOrRejecterID], [ApprovalStatusID], [Approved/DeclinedDate], [ApprovedAmount], [NextApproverOrRejecterID], [isProcess], [DeterminedPaymentDate]) VALUES (148, 34, 17, 7, CAST(N'2023-12-19T16:35:44.423' AS DateTime), CAST(20000 AS Decimal(18, 0)), 16, 1, NULL)
INSERT [dbo].[AdvanceApproveStatus] ([ApproveStatusID], [AdvanceID], [ApproverOrRejecterID], [ApprovalStatusID], [Approved/DeclinedDate], [ApprovedAmount], [NextApproverOrRejecterID], [isProcess], [DeterminedPaymentDate]) VALUES (149, 34, 16, 8, CAST(N'2023-12-19T16:36:03.057' AS DateTime), CAST(20000 AS Decimal(18, 0)), 15, 1, CAST(N'2023-12-25T00:00:00.000' AS DateTime))
INSERT [dbo].[AdvanceApproveStatus] ([ApproveStatusID], [AdvanceID], [ApproverOrRejecterID], [ApprovalStatusID], [Approved/DeclinedDate], [ApprovedAmount], [NextApproverOrRejecterID], [isProcess], [DeterminedPaymentDate]) VALUES (150, 34, 15, 11, CAST(N'2023-12-19T16:36:39.033' AS DateTime), CAST(20000 AS Decimal(18, 0)), NULL, 1, CAST(N'2023-12-25T00:00:00.000' AS DateTime))
INSERT [dbo].[AdvanceApproveStatus] ([ApproveStatusID], [AdvanceID], [ApproverOrRejecterID], [ApprovalStatusID], [Approved/DeclinedDate], [ApprovedAmount], [NextApproverOrRejecterID], [isProcess], [DeterminedPaymentDate]) VALUES (151, 35, NULL, 1, CAST(N'2023-12-19T16:37:49.573' AS DateTime), NULL, 16, 1, NULL)
INSERT [dbo].[AdvanceApproveStatus] ([ApproveStatusID], [AdvanceID], [ApproverOrRejecterID], [ApprovalStatusID], [Approved/DeclinedDate], [ApprovedAmount], [NextApproverOrRejecterID], [isProcess], [DeterminedPaymentDate]) VALUES (152, 35, 16, 8, CAST(N'2023-12-19T16:38:11.267' AS DateTime), CAST(0 AS Decimal(18, 0)), 15, 1, CAST(N'2023-12-22T00:00:00.000' AS DateTime))
INSERT [dbo].[AdvanceApproveStatus] ([ApproveStatusID], [AdvanceID], [ApproverOrRejecterID], [ApprovalStatusID], [Approved/DeclinedDate], [ApprovedAmount], [NextApproverOrRejecterID], [isProcess], [DeterminedPaymentDate]) VALUES (153, 35, 15, 11, CAST(N'2023-12-19T16:38:26.517' AS DateTime), CAST(0 AS Decimal(18, 0)), NULL, 1, CAST(N'2023-12-22T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[AdvanceApproveStatus] OFF
GO
INSERT [dbo].[AdvanceReceipt] ([AdvanceID], [PaybackReceiptID], [PaymantReceiptID], [PaybackDate]) VALUES (2, 1, NULL, CAST(N'2023-10-13T00:00:00.000' AS DateTime))
INSERT [dbo].[AdvanceReceipt] ([AdvanceID], [PaybackReceiptID], [PaymantReceiptID], [PaybackDate]) VALUES (1, NULL, 4, NULL)
INSERT [dbo].[AdvanceReceipt] ([AdvanceID], [PaybackReceiptID], [PaymantReceiptID], [PaybackDate]) VALUES (17, NULL, 123, CAST(N'2023-12-26T00:00:00.000' AS DateTime))
INSERT [dbo].[AdvanceReceipt] ([AdvanceID], [PaybackReceiptID], [PaymantReceiptID], [PaybackDate]) VALUES (32, NULL, 321, CAST(N'2023-12-27T00:00:00.000' AS DateTime))
INSERT [dbo].[AdvanceReceipt] ([AdvanceID], [PaybackReceiptID], [PaymantReceiptID], [PaybackDate]) VALUES (32, NULL, 15, CAST(N'2024-01-07T00:00:00.000' AS DateTime))
INSERT [dbo].[AdvanceReceipt] ([AdvanceID], [PaybackReceiptID], [PaymantReceiptID], [PaybackDate]) VALUES (33, NULL, 133, CAST(N'2023-12-27T00:00:00.000' AS DateTime))
INSERT [dbo].[AdvanceReceipt] ([AdvanceID], [PaybackReceiptID], [PaymantReceiptID], [PaybackDate]) VALUES (33, NULL, 300, CAST(N'2023-12-27T00:00:00.000' AS DateTime))
INSERT [dbo].[AdvanceReceipt] ([AdvanceID], [PaybackReceiptID], [PaymantReceiptID], [PaybackDate]) VALUES (33, NULL, 1111, CAST(N'2023-12-27T00:00:00.000' AS DateTime))
INSERT [dbo].[AdvanceReceipt] ([AdvanceID], [PaybackReceiptID], [PaymantReceiptID], [PaybackDate]) VALUES (34, NULL, 666, CAST(N'2023-12-25T00:00:00.000' AS DateTime))
INSERT [dbo].[AdvanceReceipt] ([AdvanceID], [PaybackReceiptID], [PaymantReceiptID], [PaybackDate]) VALUES (35, NULL, 234, CAST(N'2023-12-22T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Amount] ON 

INSERT [dbo].[Amount] ([AmountID], [MinAmount], [MaxAmount], [Date]) VALUES (1, CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Amount] ([AmountID], [MinAmount], [MaxAmount], [Date]) VALUES (2, CAST(1001 AS Decimal(18, 0)), CAST(5000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Amount] ([AmountID], [MinAmount], [MaxAmount], [Date]) VALUES (3, CAST(5001 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Amount] ([AmountID], [MinAmount], [MaxAmount], [Date]) VALUES (4, CAST(10001 AS Decimal(18, 0)), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Amount] OFF
GO
SET IDENTITY_INSERT [dbo].[ApprovalStatus] ON 

INSERT [dbo].[ApprovalStatus] ([ApprovalStatusID], [ApprovalName], [NextApprovalName], [IsActive], [ModifiedBy], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1, N'Talep Olusturuldu', N'BM Onayı', N'1         ', NULL, CAST(N'2023-12-12T02:26:22.177' AS DateTime), CAST(N'2023-12-12T02:26:22.177' AS DateTime), NULL)
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusID], [ApprovalName], [NextApprovalName], [IsActive], [ModifiedBy], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (2, N'BM Onayladı', N'Direktör Onayı', N'1         ', NULL, CAST(N'2023-12-12T02:31:07.503' AS DateTime), CAST(N'2023-12-12T02:31:07.503' AS DateTime), NULL)
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusID], [ApprovalName], [NextApprovalName], [IsActive], [ModifiedBy], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (3, N'Direktör Onayladı', N'GMY Onayı', N'1         ', NULL, CAST(N'2023-12-12T02:31:07.503' AS DateTime), CAST(N'2023-12-12T02:31:07.503' AS DateTime), NULL)
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusID], [ApprovalName], [NextApprovalName], [IsActive], [ModifiedBy], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (4, N'GMY Onayladı', N'GM Onayı', N'1         ', NULL, CAST(N'2023-12-12T02:31:07.503' AS DateTime), CAST(N'2023-12-12T02:31:07.503' AS DateTime), NULL)
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusID], [ApprovalName], [NextApprovalName], [IsActive], [ModifiedBy], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (5, N'GM Onayladı', N'FM Tarih Belirlemesi', N'1         ', NULL, CAST(N'2023-12-12T02:31:07.503' AS DateTime), CAST(N'2023-12-12T02:31:07.503' AS DateTime), NULL)
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusID], [ApprovalName], [NextApprovalName], [IsActive], [ModifiedBy], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (6, N'FM Tarih Belirledi', N'Ön Muhasebe', N'1         ', NULL, CAST(N'2023-12-12T02:32:15.283' AS DateTime), CAST(N'2023-12-12T02:32:15.283' AS DateTime), NULL)
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusID], [ApprovalName], [NextApprovalName], [IsActive], [ModifiedBy], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (7, N'FM Tarih Belirlemesi Bekleniyor', N'FM Tarih Belirledi', N'1         ', NULL, CAST(N'2023-12-12T02:32:39.183' AS DateTime), CAST(N'2023-12-12T02:32:39.183' AS DateTime), NULL)
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusID], [ApprovalName], [NextApprovalName], [IsActive], [ModifiedBy], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (8, N'Finans Tarih Belirledi', N'Ön Mühasebe Bekleniyor', N'1         ', NULL, CAST(N'2023-12-12T02:33:49.520' AS DateTime), CAST(N'2023-12-12T02:33:49.520' AS DateTime), NULL)
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusID], [ApprovalName], [NextApprovalName], [IsActive], [ModifiedBy], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (10, N'Reddedildi', N'Kapandı', N'1         ', NULL, CAST(N'2023-12-18T13:49:28.783' AS DateTime), CAST(N'2023-12-18T13:49:28.783' AS DateTime), NULL)
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusID], [ApprovalName], [NextApprovalName], [IsActive], [ModifiedBy], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (11, N'Ön Mühasebe İşlemi Gerçekleştirdi', N'Avans Kapama', N'1         ', NULL, CAST(N'2023-12-19T16:13:09.750' AS DateTime), CAST(N'2023-12-19T16:13:09.750' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ApprovalStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[PaybackReceipt] ON 

INSERT [dbo].[PaybackReceipt] ([PaybackReceiptID], [ReceiptDate], [ReceiptDescription], [IsActive], [ModifiedBy], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1, CAST(N'2023-10-15T00:00:00.000' AS DateTime), N'Ödendi', N'1         ', NULL, CAST(N'2023-12-15T16:52:19.087' AS DateTime), CAST(N'2023-12-15T16:52:19.087' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[PaybackReceipt] OFF
GO
INSERT [dbo].[PaymentReceipt] ([PaymentReceiptID], [ReceiptDate], [ReceiptDescription], [DeterminedPaybackDate], [IsActive], [ModifiedBy], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1, CAST(N'2023-09-14T00:00:00.000' AS DateTime), N'Avans Verildi', CAST(N'2023-10-15T00:00:00.000' AS DateTime), N'1         ', NULL, CAST(N'2023-12-16T20:22:53.510' AS DateTime), CAST(N'2023-12-16T20:22:53.510' AS DateTime), NULL)
INSERT [dbo].[PaymentReceipt] ([PaymentReceiptID], [ReceiptDate], [ReceiptDescription], [DeterminedPaybackDate], [IsActive], [ModifiedBy], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (4, CAST(N'2023-12-19T12:39:08.683' AS DateTime), N'FDSAFADS', CAST(N'1894-07-01T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2023-12-19T12:39:08.683' AS DateTime), CAST(N'2023-12-19T12:39:08.683' AS DateTime), NULL)
INSERT [dbo].[PaymentReceipt] ([PaymentReceiptID], [ReceiptDate], [ReceiptDescription], [DeterminedPaybackDate], [IsActive], [ModifiedBy], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (15, CAST(N'2023-12-19T16:16:55.000' AS DateTime), NULL, CAST(N'2024-01-07T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2023-12-19T16:17:13.123' AS DateTime), CAST(N'2023-12-19T16:17:13.123' AS DateTime), NULL)
INSERT [dbo].[PaymentReceipt] ([PaymentReceiptID], [ReceiptDate], [ReceiptDescription], [DeterminedPaybackDate], [IsActive], [ModifiedBy], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (123, CAST(N'2023-12-19T13:36:27.000' AS DateTime), NULL, CAST(N'2023-12-26T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2023-12-19T13:37:11.080' AS DateTime), CAST(N'2023-12-19T13:37:11.080' AS DateTime), NULL)
INSERT [dbo].[PaymentReceipt] ([PaymentReceiptID], [ReceiptDate], [ReceiptDescription], [DeterminedPaybackDate], [IsActive], [ModifiedBy], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (133, CAST(N'2023-12-19T16:23:33.000' AS DateTime), NULL, CAST(N'2023-12-27T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2023-12-19T16:23:58.520' AS DateTime), CAST(N'2023-12-19T16:23:58.520' AS DateTime), NULL)
INSERT [dbo].[PaymentReceipt] ([PaymentReceiptID], [ReceiptDate], [ReceiptDescription], [DeterminedPaybackDate], [IsActive], [ModifiedBy], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (234, CAST(N'2023-12-19T16:38:21.000' AS DateTime), NULL, CAST(N'2023-12-22T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2023-12-19T16:38:26.520' AS DateTime), CAST(N'2023-12-19T16:38:26.520' AS DateTime), NULL)
INSERT [dbo].[PaymentReceipt] ([PaymentReceiptID], [ReceiptDate], [ReceiptDescription], [DeterminedPaybackDate], [IsActive], [ModifiedBy], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (300, CAST(N'2023-12-19T16:29:32.000' AS DateTime), NULL, CAST(N'2023-12-27T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2023-12-19T16:29:39.110' AS DateTime), CAST(N'2023-12-19T16:29:39.110' AS DateTime), NULL)
INSERT [dbo].[PaymentReceipt] ([PaymentReceiptID], [ReceiptDate], [ReceiptDescription], [DeterminedPaybackDate], [IsActive], [ModifiedBy], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (321, CAST(N'2023-12-19T16:14:29.000' AS DateTime), NULL, CAST(N'2023-12-27T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2023-12-19T16:14:49.920' AS DateTime), CAST(N'2023-12-19T16:14:49.920' AS DateTime), NULL)
INSERT [dbo].[PaymentReceipt] ([PaymentReceiptID], [ReceiptDate], [ReceiptDescription], [DeterminedPaybackDate], [IsActive], [ModifiedBy], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (666, CAST(N'2023-12-19T16:36:19.000' AS DateTime), NULL, CAST(N'2023-12-25T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2023-12-19T16:36:39.040' AS DateTime), CAST(N'2023-12-19T16:36:39.040' AS DateTime), NULL)
INSERT [dbo].[PaymentReceipt] ([PaymentReceiptID], [ReceiptDate], [ReceiptDescription], [DeterminedPaybackDate], [IsActive], [ModifiedBy], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1111, CAST(N'2023-12-19T16:30:25.000' AS DateTime), NULL, CAST(N'2023-12-27T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2023-12-19T16:30:31.163' AS DateTime), CAST(N'2023-12-19T16:30:31.163' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([ProjectID], [ProjectName], [StartDate], [EndDate], [ProjectExplanation]) VALUES (1, N'Fineksus', CAST(N'2023-12-12T00:00:00.000' AS DateTime), CAST(N'2023-12-19T00:00:00.000' AS DateTime), N'Bankacılık')
INSERT [dbo].[Project] ([ProjectID], [ProjectName], [StartDate], [EndDate], [ProjectExplanation]) VALUES (2, N'BilgeAdam', CAST(N'2022-12-12T00:00:00.000' AS DateTime), CAST(N'2023-12-25T00:00:00.000' AS DateTime), N'Danışmanlık')
INSERT [dbo].[Project] ([ProjectID], [ProjectName], [StartDate], [EndDate], [ProjectExplanation]) VALUES (3, N'SiberGüvenlik', CAST(N'2023-10-10T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), N'Güvenlik')
SET IDENTITY_INSERT [dbo].[Project] OFF
GO
INSERT [dbo].[ProjectWorker] ([WorkerID], [ProjectID]) VALUES (10, 1)
INSERT [dbo].[ProjectWorker] ([WorkerID], [ProjectID]) VALUES (10, 2)
INSERT [dbo].[ProjectWorker] ([WorkerID], [ProjectID]) VALUES (21, 3)
INSERT [dbo].[ProjectWorker] ([WorkerID], [ProjectID]) VALUES (21, 2)
INSERT [dbo].[ProjectWorker] ([WorkerID], [ProjectID]) VALUES (19, 2)
INSERT [dbo].[ProjectWorker] ([WorkerID], [ProjectID]) VALUES (20, 1)
INSERT [dbo].[ProjectWorker] ([WorkerID], [ProjectID]) VALUES (17, 1)
INSERT [dbo].[ProjectWorker] ([WorkerID], [ProjectID]) VALUES (18, 1)
GO
SET IDENTITY_INSERT [dbo].[Title] ON 

INSERT [dbo].[Title] ([TitleID], [TitleName], [TitleDescription], [RoleID]) VALUES (1, N'Calisan', NULL, NULL)
INSERT [dbo].[Title] ([TitleID], [TitleName], [TitleDescription], [RoleID]) VALUES (2, N'BM', NULL, NULL)
INSERT [dbo].[Title] ([TitleID], [TitleName], [TitleDescription], [RoleID]) VALUES (3, N'Direktör', NULL, NULL)
INSERT [dbo].[Title] ([TitleID], [TitleName], [TitleDescription], [RoleID]) VALUES (4, N'GMY', NULL, NULL)
INSERT [dbo].[Title] ([TitleID], [TitleName], [TitleDescription], [RoleID]) VALUES (5, N'GM', NULL, NULL)
INSERT [dbo].[Title] ([TitleID], [TitleName], [TitleDescription], [RoleID]) VALUES (6, N'FM', NULL, NULL)
INSERT [dbo].[Title] ([TitleID], [TitleName], [TitleDescription], [RoleID]) VALUES (7, N'Ön Muhasebe', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Title] OFF
GO
SET IDENTITY_INSERT [dbo].[TitleAmountApprovalRule] ON 

INSERT [dbo].[TitleAmountApprovalRule] ([ID], [AmountID], [Date], [TitleID]) VALUES (1, 1, NULL, 2)
INSERT [dbo].[TitleAmountApprovalRule] ([ID], [AmountID], [Date], [TitleID]) VALUES (2, 2, NULL, 3)
INSERT [dbo].[TitleAmountApprovalRule] ([ID], [AmountID], [Date], [TitleID]) VALUES (3, 3, NULL, 4)
INSERT [dbo].[TitleAmountApprovalRule] ([ID], [AmountID], [Date], [TitleID]) VALUES (4, 4, NULL, 5)
SET IDENTITY_INSERT [dbo].[TitleAmountApprovalRule] OFF
GO
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([UnitID], [UnitName], [UnitExplanation], [IsActive]) VALUES (1, N'Yazılım', NULL, 1)
INSERT [dbo].[Unit] ([UnitID], [UnitName], [UnitExplanation], [IsActive]) VALUES (2, N'Finans', NULL, 1)
INSERT [dbo].[Unit] ([UnitID], [UnitName], [UnitExplanation], [IsActive]) VALUES (3, N'IK', NULL, 1)
SET IDENTITY_INSERT [dbo].[Unit] OFF
GO
SET IDENTITY_INSERT [dbo].[Worker] ON 

INSERT [dbo].[Worker] ([WorkerID], [WorkerName], [WorkerEmail], [WorkerPhonenumber], [UnitID], [TitleID], [UpperWorkerID], [PasswordSalt], [PasswordHash]) VALUES (1, N'Burak ÇOBAN', N'burakcbn2834@gmail.com', N'54564546', 1, 5, 1, NULL, NULL)
INSERT [dbo].[Worker] ([WorkerID], [WorkerName], [WorkerEmail], [WorkerPhonenumber], [UnitID], [TitleID], [UpperWorkerID], [PasswordSalt], [PasswordHash]) VALUES (2, N'Oğuz Yıldırım', N'ogzyldr@gmail.com', N'8459151651', 1, 4, 1, NULL, NULL)
INSERT [dbo].[Worker] ([WorkerID], [WorkerName], [WorkerEmail], [WorkerPhonenumber], [UnitID], [TitleID], [UpperWorkerID], [PasswordSalt], [PasswordHash]) VALUES (3, N'İhsan Kuzucu', N'ihskz@gmail.com', N'65546546', 1, 2, 4, NULL, NULL)
INSERT [dbo].[Worker] ([WorkerID], [WorkerName], [WorkerEmail], [WorkerPhonenumber], [UnitID], [TitleID], [UpperWorkerID], [PasswordSalt], [PasswordHash]) VALUES (4, N'Fatih ', N'gathb@gmail.com', N'5664984', 2, 3, 2, NULL, NULL)
INSERT [dbo].[Worker] ([WorkerID], [WorkerName], [WorkerEmail], [WorkerPhonenumber], [UnitID], [TitleID], [UpperWorkerID], [PasswordSalt], [PasswordHash]) VALUES (7, N'Direktör Ahmet', N'string', N'string', 1, 3, 2, NULL, NULL)
INSERT [dbo].[Worker] ([WorkerID], [WorkerName], [WorkerEmail], [WorkerPhonenumber], [UnitID], [TitleID], [UpperWorkerID], [PasswordSalt], [PasswordHash]) VALUES (9, N'Mehmet', N'user@mail.com', N'123', 1, 6, 9, 0xABD540956C7460EDD9062D7DB38D8E4D4386FBA0D4F78CE69FEFB5E07A3F41C2061CDB2C3E551C05114E2EB177148CA70BEB50C627971C149968307BE35E84D852EE7A39F14E72583D84443562DA09974E0A289934BD5FAF5AC81EF2D0B1E8A04F4050D3CD3D497142E6D96CC224893C5CB037935B03106FE56D7E09EBA21593, 0x60CE5BE902D6FD89784EC7BE243A9647C5513DC5E09A6E44952EEA332CFF1F4FBD2295FF7D6399A5105175D8F68E44A2CC66700CD6512BAC6D465FB307AC01B2)
INSERT [dbo].[Worker] ([WorkerID], [WorkerName], [WorkerEmail], [WorkerPhonenumber], [UnitID], [TitleID], [UpperWorkerID], [PasswordSalt], [PasswordHash]) VALUES (10, N'BM Oğuz', N'user2@mail.com', N'123123', 1, 2, 7, 0xB4F27432AD8E3983CB863414346E05A79B28BE05836EDBD87AB7E7B62DF2E3F3CE27BDDA86A15DA74653488C26E0497C7BF4C6D871488A5E6A13D4A210D49EBF9BF5E37937E8DA2560B32C388320C7E2782A636A6AC7081CF2FDA49BDB166CE7FABEBB8845092378D19501C199D640DD0C86E06CDFF68354A3A38A65D549C4FF, 0x06F1451DE24BC5B833DAD469F70BA62C037625286AE8DF94D99DAB6CB867B66B5B42B5EF448EFABF02F7A44C8C7151289296CD1D7D8E4AE3B29F80792482A78E)
INSERT [dbo].[Worker] ([WorkerID], [WorkerName], [WorkerEmail], [WorkerPhonenumber], [UnitID], [TitleID], [UpperWorkerID], [PasswordSalt], [PasswordHash]) VALUES (12, N'ahmet', N'ahmet@mail.com', N'4234324', 3, 2, 7, 0xE24566987BB3BFD9A168C45FD68C55A17219B3972DDA034C1A52A437AF30FA23B28A928BB11C53F7F34569797397C73D4045A68ED3451EC1C108716A12B81C811A50D34D7ADBC2D9B0ED664FC6FF3D6B2B213DECC0580CE0B9D64EBDC42F1FE94CD91F39072A3EF468484D33135052BE2B14A0B32C82D4E449ADBDAAF93C500D, 0x045F7C016AEACB2FAEDD246B5DECB3839D59AC2DED20DC68729D4149C754D353B2EEC6D17FA2B2B73106A67694558888DF3AE3F5B54238592CDBD3E18E38FCB8)
INSERT [dbo].[Worker] ([WorkerID], [WorkerName], [WorkerEmail], [WorkerPhonenumber], [UnitID], [TitleID], [UpperWorkerID], [PasswordSalt], [PasswordHash]) VALUES (13, N'Sule', N'sule@mail.com', N'321321321', 1, 7, 13, 0x484E27AE6E0590642F36BBDF5F35B6CE79879EEBFCCD505D54113A5755A985197DDFA94DF24402F226175D1BCF6D0DC7941EA8C530A09EC52BC67DC3B733A9C5C0A3A177BF3D3779186CFB6E20C7FAE28B1BA52289884A4DC3C572792392CD006E55543B9AA519BCC94BB5E5B750B8E993E9CEE69AD98C4F894106CAF1AA00A6, 0x41D59FDB2FCA3856DB492C558E194799D3E769D826955707C0CCD1CFA68B7B7DB4668E6EE6193A63BB38A809690CEB240611E4CD2DCD6CB9D5C0D3482B6E2C74)
INSERT [dbo].[Worker] ([WorkerID], [WorkerName], [WorkerEmail], [WorkerPhonenumber], [UnitID], [TitleID], [UpperWorkerID], [PasswordSalt], [PasswordHash]) VALUES (14, N'Hüseyin', N'deneme@test.com', N'2132412321', 1, 1, 1, 0xAC33B1F388D2ADF8FDBC1EC308F695477FB0BB5DDE7BE428833B0E55EE56DEFBC3741CB80C88976B63CEC346AD58E7F4FC47622E9FC76B30F67A3405B0A5BFCF8156D1D51D5298DBEE0DCDFE4C70E9DE3965ADD362F0199538D56FAEFC6F3F4336D08739B9BC08EF151E44CA8BA12EE66105E0252647AABBB422C0B9D379E287, 0x29A0FF445EECF713C18DF1A2672F3C2829D7B5AF2C192C6002293FDB88C9E12E3E986334398504BC1EF8BCA6DE86072330F47AA597287DA856EED03206541621)
INSERT [dbo].[Worker] ([WorkerID], [WorkerName], [WorkerEmail], [WorkerPhonenumber], [UnitID], [TitleID], [UpperWorkerID], [PasswordSalt], [PasswordHash]) VALUES (15, N'OnMuhasebe X', N'onmuhasebe@mail.com', N'321321321', 1, 7, 15, 0x8D5A77DD07E8BD5E64CF1DC9028D984AC25DA7BAF541198D2CC7D114AAD12FD14DBE098392B9F9D183E18F305D7791989BAF27C9BD6A1DAC1B9BF364EC28A08B7304EF59906B49D06DF7CC2B75DB06E34B20839842306E04C63FE62D9FDF14EF44FB699D3BA7D2265BE2FA7619AA1CBB62A10A7D339654257ADBB82E38BDB779, 0x30D866D2D15CD0CED19609C5A4CEA2562430D509AA434E0903E773DD69FD9386E1A026D869D165732FD5C41E7F248345C7BD6FE5C22A9BEB2ED1AF1CEBA5B0A1)
INSERT [dbo].[Worker] ([WorkerID], [WorkerName], [WorkerEmail], [WorkerPhonenumber], [UnitID], [TitleID], [UpperWorkerID], [PasswordSalt], [PasswordHash]) VALUES (16, N'Finans X', N'finans@mail.com', N'321321321', 1, 6, 15, 0x17C52B2788A9F8EA3526C5BB96CFBE83F26E1BD401773C4135107BEA7F3601D98806F170284002610D70C29B7F24B1B585DA6296D644355ED39751B9947E5C7C95C381BE960C28BA05BBC5729DABEE9BCC8A14D757D5C6B1F7EA363893052B56C400D719F9FED70A7D136A6271D15D532DC1B1307F0B636296512A47D90E7D02, 0xA19136D582DA7567D79932E29B4428032FB87074DCD3EC6030F2F34A8DECD43AE5F2369CDF991A8ECC9F3E1435C1550111377EF47E38DE8A4D3DDBB1095C7821)
INSERT [dbo].[Worker] ([WorkerID], [WorkerName], [WorkerEmail], [WorkerPhonenumber], [UnitID], [TitleID], [UpperWorkerID], [PasswordSalt], [PasswordHash]) VALUES (17, N'GM X', N'gm@mail.com', N'321321321', 1, 5, 16, 0x4B7A6B60AC2AAC38E0B9611C9AE978A37B627CEB105009DE5D654A622E7C2FC4CCC17EEB89459F656A9C1A3109B0EFDB3EFA4E02313F49F3814515529C6DF7D9710424530106E6D088DE7835F29E86671145283C909F37C9315A5B2B937707B07AAF931C7EBDC720273095A78B2EEF1A8BC6C4FE67951E7BDBA49C6E78EE8E00, 0x998FB1D5F84DDFDEEABF989EDF5483745D1E876A7723F8EFC2A64C5960E7F57F633C300B6352C1335E7FEA4A0C7F3C50A1BB55D8FDD84EAA1F87EEA578A45E39)
INSERT [dbo].[Worker] ([WorkerID], [WorkerName], [WorkerEmail], [WorkerPhonenumber], [UnitID], [TitleID], [UpperWorkerID], [PasswordSalt], [PasswordHash]) VALUES (18, N'GMY X', N'gmy@mail.com', N'321321321', 1, 4, 17, 0x23C3D2DD15B284AF3F8D46AD4BAEAC0DCCAB2D237705D0CEC6064E384096E49910E56C3E30C66BB1A47748EED081265544A4B82632A3604A5560A873442B43595CF43E289E1731B6A5453E8793929353D75EAFDD72F81ECB89621B3E68B7E3AD935760796B1B9A08F8B15D7175C36A63024148342E30A4E5062E3B945A6E37F4, 0x584BF69E79EBCC8E503E56EE8DDF6A46658691C1FA08308A7591FA90DBE21A2BCBA81799384EEDA6752C98282E4800EC9B74F63451A63D55E5B2692C7613AC65)
INSERT [dbo].[Worker] ([WorkerID], [WorkerName], [WorkerEmail], [WorkerPhonenumber], [UnitID], [TitleID], [UpperWorkerID], [PasswordSalt], [PasswordHash]) VALUES (19, N'Direktor X', N'direktor@mail.com', N'321321321', 1, 3, 18, 0xD73A199EB014C7C8BD4161A74C2DAF570394C5CC33CB68669698C6DBD73B7016C09872F996D8D159FC50B0FF4EBD55C0AF1D9D5D3A144D9691B957C277F19F12E4E1001F429D6A2198D02066B715E39677C17FCB2BD4795E90A66EAEB9EF42C0387CA4F1CDAE70981AD797FEA5825892D014C831A063A68A2E8C904276D30D78, 0xA2697F617FCA7B267241333C79C226B3E4F74C3E13889E34C9EB1FABD747F0DF8ECCBCF680D2C8DC2BDE309F87703B9D179FD01A2022C3BE4494A10E19096784)
INSERT [dbo].[Worker] ([WorkerID], [WorkerName], [WorkerEmail], [WorkerPhonenumber], [UnitID], [TitleID], [UpperWorkerID], [PasswordSalt], [PasswordHash]) VALUES (20, N'BM X', N'bm@mail.com', N'321321321', 1, 2, 19, 0xA2A057C0F760518AAEBD9064B0C2B768743D62C8AC20F1D50DB345BF4334EFB893E7EC42CF2ADC109A972698DDE3CE7A14C7C9168849F91E24C8BB64CC9A1519C1DE64B3A6DB2B02D5D7050E96DA1B6666A1E4DF06C78E365879B1946E7B3D688C53279837A5FB5EBC0EFBD105C3B8AF0B9C55FC9DA8D1444D19A3C9B7E60E58, 0x522EFB090DBFC134FAA901958FAF11D3F53835DCBC9E5B8A57C401F70C417FBC469EEE968F8E5F5471A25CABED3B9D900D2872AD891016B4BE0D033B12D4A908)
INSERT [dbo].[Worker] ([WorkerID], [WorkerName], [WorkerEmail], [WorkerPhonenumber], [UnitID], [TitleID], [UpperWorkerID], [PasswordSalt], [PasswordHash]) VALUES (21, N'Calisan X', N'calisan@mail.com', N'321321321', 1, 1, 20, 0x948A3969B034F670E1BD47A77C041C16CE3785FC32BC94B8059BDE3F55903F9B04A937FC9A5427C7140BD20307CFFE9A882E80690BF1CD5185CCAD02018AFE5AD258FD748BD8908F8E6DA60AB259880E29074E7B362EE445E8791EECA4D8353E638C26CDF9659FBAE7DF903A885775321D52B43C6E334D3B78470009AC178C85, 0xB94033319643673CF6106AB0AF267FD3DF3F63674DB27C8BD0CAC66E5BAABB3D0964ABF10C1E07FDC67AED02609FFE59DB418BDA3A1DC3054527FF65AC3257B8)
SET IDENTITY_INSERT [dbo].[Worker] OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ApprovalStatus_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ApprovalStatus] ADD  CONSTRAINT [DF_ApprovalStatus_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ApprovalStatus_ModifiedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ApprovalStatus] ADD  CONSTRAINT [DF_ApprovalStatus_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Authorization_CreatedDate_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Authorization] ADD  CONSTRAINT [DF_Authorization_CreatedDate_1]  DEFAULT (getdate()) FOR [CreatedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Authorization_IsActive_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Authorization] ADD  CONSTRAINT [DF_Authorization_IsActive_1]  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PageAuthorization_CreatedDate_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PageAuthorization] ADD  CONSTRAINT [DF_PageAuthorization_CreatedDate_1]  DEFAULT (getdate()) FOR [CreatedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PageAuthorization_ModifiedDate_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PageAuthorization] ADD  CONSTRAINT [DF_PageAuthorization_ModifiedDate_1]  DEFAULT (getdate()) FOR [ModifiedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PaybackReceipt_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PaybackReceipt] ADD  CONSTRAINT [DF_PaybackReceipt_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PaybackReceipt_ModifiedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PaybackReceipt] ADD  CONSTRAINT [DF_PaybackReceipt_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PaymentReceipt_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PaymentReceipt] ADD  CONSTRAINT [DF_PaymentReceipt_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PaymentReceipt_ModifiedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PaymentReceipt] ADD  CONSTRAINT [DF_PaymentReceipt_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Report_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Report] ADD  CONSTRAINT [DF_Report_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Report_ModifiedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Report] ADD  CONSTRAINT [DF_Report_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Role_CreatedDate_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_CreatedDate_1]  DEFAULT (getdate()) FOR [CreatedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Role_ModifiedDate_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_ModifiedDate_1]  DEFAULT (getdate()) FOR [ModifiedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_RoleAuthorization_CreatedDate_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RoleAuthorization] ADD  CONSTRAINT [DF_RoleAuthorization_CreatedDate_1]  DEFAULT (getdate()) FOR [CreatedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_RoleAuthorization_ModifiedDate_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RoleAuthorization] ADD  CONSTRAINT [DF_RoleAuthorization_ModifiedDate_1]  DEFAULT (getdate()) FOR [ModifiedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Advance_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[Advance]'))
ALTER TABLE [dbo].[Advance]  WITH CHECK ADD  CONSTRAINT [FK_Advance_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ProjectID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Advance_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[Advance]'))
ALTER TABLE [dbo].[Advance] CHECK CONSTRAINT [FK_Advance_Project]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Advance_TitleAmountApprovalRule]') AND parent_object_id = OBJECT_ID(N'[dbo].[Advance]'))
ALTER TABLE [dbo].[Advance]  WITH CHECK ADD  CONSTRAINT [FK_Advance_TitleAmountApprovalRule] FOREIGN KEY([TitleAmountApprovalRuleID])
REFERENCES [dbo].[TitleAmountApprovalRule] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Advance_TitleAmountApprovalRule]') AND parent_object_id = OBJECT_ID(N'[dbo].[Advance]'))
ALTER TABLE [dbo].[Advance] CHECK CONSTRAINT [FK_Advance_TitleAmountApprovalRule]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Advance_Worker]') AND parent_object_id = OBJECT_ID(N'[dbo].[Advance]'))
ALTER TABLE [dbo].[Advance]  WITH CHECK ADD  CONSTRAINT [FK_Advance_Worker] FOREIGN KEY([WorkerID])
REFERENCES [dbo].[Worker] ([WorkerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Advance_Worker]') AND parent_object_id = OBJECT_ID(N'[dbo].[Advance]'))
ALTER TABLE [dbo].[Advance] CHECK CONSTRAINT [FK_Advance_Worker]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvanceApproveStatus_Advance]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvanceApproveStatus]'))
ALTER TABLE [dbo].[AdvanceApproveStatus]  WITH CHECK ADD  CONSTRAINT [FK_AdvanceApproveStatus_Advance] FOREIGN KEY([AdvanceID])
REFERENCES [dbo].[Advance] ([AdvanceID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvanceApproveStatus_Advance]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvanceApproveStatus]'))
ALTER TABLE [dbo].[AdvanceApproveStatus] CHECK CONSTRAINT [FK_AdvanceApproveStatus_Advance]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvanceApproveStatus_ApprovalStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvanceApproveStatus]'))
ALTER TABLE [dbo].[AdvanceApproveStatus]  WITH CHECK ADD  CONSTRAINT [FK_AdvanceApproveStatus_ApprovalStatus] FOREIGN KEY([ApprovalStatusID])
REFERENCES [dbo].[ApprovalStatus] ([ApprovalStatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvanceApproveStatus_ApprovalStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvanceApproveStatus]'))
ALTER TABLE [dbo].[AdvanceApproveStatus] CHECK CONSTRAINT [FK_AdvanceApproveStatus_ApprovalStatus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvanceApproveStatus_Worker]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvanceApproveStatus]'))
ALTER TABLE [dbo].[AdvanceApproveStatus]  WITH CHECK ADD  CONSTRAINT [FK_AdvanceApproveStatus_Worker] FOREIGN KEY([ApproverOrRejecterID])
REFERENCES [dbo].[Worker] ([WorkerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvanceApproveStatus_Worker]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvanceApproveStatus]'))
ALTER TABLE [dbo].[AdvanceApproveStatus] CHECK CONSTRAINT [FK_AdvanceApproveStatus_Worker]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvanceApproveStatus_Worker1]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvanceApproveStatus]'))
ALTER TABLE [dbo].[AdvanceApproveStatus]  WITH CHECK ADD  CONSTRAINT [FK_AdvanceApproveStatus_Worker1] FOREIGN KEY([NextApproverOrRejecterID])
REFERENCES [dbo].[Worker] ([WorkerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvanceApproveStatus_Worker1]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvanceApproveStatus]'))
ALTER TABLE [dbo].[AdvanceApproveStatus] CHECK CONSTRAINT [FK_AdvanceApproveStatus_Worker1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvanceReceipt_Advance]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvanceReceipt]'))
ALTER TABLE [dbo].[AdvanceReceipt]  WITH CHECK ADD  CONSTRAINT [FK_AdvanceReceipt_Advance] FOREIGN KEY([AdvanceID])
REFERENCES [dbo].[Advance] ([AdvanceID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvanceReceipt_Advance]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvanceReceipt]'))
ALTER TABLE [dbo].[AdvanceReceipt] CHECK CONSTRAINT [FK_AdvanceReceipt_Advance]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvanceReceipt_PaybackReceipt]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvanceReceipt]'))
ALTER TABLE [dbo].[AdvanceReceipt]  WITH CHECK ADD  CONSTRAINT [FK_AdvanceReceipt_PaybackReceipt] FOREIGN KEY([PaybackReceiptID])
REFERENCES [dbo].[PaybackReceipt] ([PaybackReceiptID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvanceReceipt_PaybackReceipt]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvanceReceipt]'))
ALTER TABLE [dbo].[AdvanceReceipt] CHECK CONSTRAINT [FK_AdvanceReceipt_PaybackReceipt]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvanceReceipt_PaymentReceipt]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvanceReceipt]'))
ALTER TABLE [dbo].[AdvanceReceipt]  WITH CHECK ADD  CONSTRAINT [FK_AdvanceReceipt_PaymentReceipt] FOREIGN KEY([PaymantReceiptID])
REFERENCES [dbo].[PaymentReceipt] ([PaymentReceiptID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvanceReceipt_PaymentReceipt]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvanceReceipt]'))
ALTER TABLE [dbo].[AdvanceReceipt] CHECK CONSTRAINT [FK_AdvanceReceipt_PaymentReceipt]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Message_Worker]') AND parent_object_id = OBJECT_ID(N'[dbo].[Message]'))
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Worker] FOREIGN KEY([MessageTakerID])
REFERENCES [dbo].[Worker] ([WorkerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Message_Worker]') AND parent_object_id = OBJECT_ID(N'[dbo].[Message]'))
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Worker]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Message_Worker1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Message]'))
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Worker1] FOREIGN KEY([MessageSenderID])
REFERENCES [dbo].[Worker] ([WorkerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Message_Worker1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Message]'))
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Worker1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProjectWorker_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProjectWorker]'))
ALTER TABLE [dbo].[ProjectWorker]  WITH CHECK ADD  CONSTRAINT [FK_ProjectWorker_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ProjectID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProjectWorker_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProjectWorker]'))
ALTER TABLE [dbo].[ProjectWorker] CHECK CONSTRAINT [FK_ProjectWorker_Project]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProjectWorker_Worker]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProjectWorker]'))
ALTER TABLE [dbo].[ProjectWorker]  WITH CHECK ADD  CONSTRAINT [FK_ProjectWorker_Worker] FOREIGN KEY([WorkerID])
REFERENCES [dbo].[Worker] ([WorkerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProjectWorker_Worker]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProjectWorker]'))
ALTER TABLE [dbo].[ProjectWorker] CHECK CONSTRAINT [FK_ProjectWorker_Worker]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Report_Advance]') AND parent_object_id = OBJECT_ID(N'[dbo].[Report]'))
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Advance] FOREIGN KEY([AdvanceID])
REFERENCES [dbo].[Advance] ([AdvanceID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Report_Advance]') AND parent_object_id = OBJECT_ID(N'[dbo].[Report]'))
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Advance]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Report_Worker]') AND parent_object_id = OBJECT_ID(N'[dbo].[Report]'))
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Worker] FOREIGN KEY([WorkerID])
REFERENCES [dbo].[Worker] ([WorkerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Report_Worker]') AND parent_object_id = OBJECT_ID(N'[dbo].[Report]'))
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Worker]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RoleAuthorization_Authorization]') AND parent_object_id = OBJECT_ID(N'[dbo].[RoleAuthorization]'))
ALTER TABLE [dbo].[RoleAuthorization]  WITH CHECK ADD  CONSTRAINT [FK_RoleAuthorization_Authorization] FOREIGN KEY([AuthorizationID])
REFERENCES [dbo].[Authorization] ([AuthorizationID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RoleAuthorization_Authorization]') AND parent_object_id = OBJECT_ID(N'[dbo].[RoleAuthorization]'))
ALTER TABLE [dbo].[RoleAuthorization] CHECK CONSTRAINT [FK_RoleAuthorization_Authorization]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RoleAuthorization_PageAuthorization]') AND parent_object_id = OBJECT_ID(N'[dbo].[RoleAuthorization]'))
ALTER TABLE [dbo].[RoleAuthorization]  WITH CHECK ADD  CONSTRAINT [FK_RoleAuthorization_PageAuthorization] FOREIGN KEY([PageAuthorizationID])
REFERENCES [dbo].[PageAuthorization] ([PageAuthorizationID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RoleAuthorization_PageAuthorization]') AND parent_object_id = OBJECT_ID(N'[dbo].[RoleAuthorization]'))
ALTER TABLE [dbo].[RoleAuthorization] CHECK CONSTRAINT [FK_RoleAuthorization_PageAuthorization]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RoleAuthorization_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[RoleAuthorization]'))
ALTER TABLE [dbo].[RoleAuthorization]  WITH CHECK ADD  CONSTRAINT [FK_RoleAuthorization_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RoleAuthorization_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[RoleAuthorization]'))
ALTER TABLE [dbo].[RoleAuthorization] CHECK CONSTRAINT [FK_RoleAuthorization_Role]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RuleWorker_Rule]') AND parent_object_id = OBJECT_ID(N'[dbo].[RuleWorker]'))
ALTER TABLE [dbo].[RuleWorker]  WITH CHECK ADD  CONSTRAINT [FK_RuleWorker_Rule] FOREIGN KEY([RuleID])
REFERENCES [dbo].[Rule] ([RuleID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RuleWorker_Rule]') AND parent_object_id = OBJECT_ID(N'[dbo].[RuleWorker]'))
ALTER TABLE [dbo].[RuleWorker] CHECK CONSTRAINT [FK_RuleWorker_Rule]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RuleWorker_Title]') AND parent_object_id = OBJECT_ID(N'[dbo].[RuleWorker]'))
ALTER TABLE [dbo].[RuleWorker]  WITH CHECK ADD  CONSTRAINT [FK_RuleWorker_Title] FOREIGN KEY([TitleID])
REFERENCES [dbo].[Title] ([TitleID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RuleWorker_Title]') AND parent_object_id = OBJECT_ID(N'[dbo].[RuleWorker]'))
ALTER TABLE [dbo].[RuleWorker] CHECK CONSTRAINT [FK_RuleWorker_Title]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Title_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[Title]'))
ALTER TABLE [dbo].[Title]  WITH CHECK ADD  CONSTRAINT [FK_Title_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Title_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[Title]'))
ALTER TABLE [dbo].[Title] CHECK CONSTRAINT [FK_Title_Role]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TitleAmountApprovalRule_Amount]') AND parent_object_id = OBJECT_ID(N'[dbo].[TitleAmountApprovalRule]'))
ALTER TABLE [dbo].[TitleAmountApprovalRule]  WITH CHECK ADD  CONSTRAINT [FK_TitleAmountApprovalRule_Amount] FOREIGN KEY([AmountID])
REFERENCES [dbo].[Amount] ([AmountID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TitleAmountApprovalRule_Amount]') AND parent_object_id = OBJECT_ID(N'[dbo].[TitleAmountApprovalRule]'))
ALTER TABLE [dbo].[TitleAmountApprovalRule] CHECK CONSTRAINT [FK_TitleAmountApprovalRule_Amount]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TitleAmountApprovalRule_Title]') AND parent_object_id = OBJECT_ID(N'[dbo].[TitleAmountApprovalRule]'))
ALTER TABLE [dbo].[TitleAmountApprovalRule]  WITH CHECK ADD  CONSTRAINT [FK_TitleAmountApprovalRule_Title] FOREIGN KEY([TitleID])
REFERENCES [dbo].[Title] ([TitleID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TitleAmountApprovalRule_Title]') AND parent_object_id = OBJECT_ID(N'[dbo].[TitleAmountApprovalRule]'))
ALTER TABLE [dbo].[TitleAmountApprovalRule] CHECK CONSTRAINT [FK_TitleAmountApprovalRule_Title]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Worker_Title]') AND parent_object_id = OBJECT_ID(N'[dbo].[Worker]'))
ALTER TABLE [dbo].[Worker]  WITH CHECK ADD  CONSTRAINT [FK_Worker_Title] FOREIGN KEY([TitleID])
REFERENCES [dbo].[Title] ([TitleID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Worker_Title]') AND parent_object_id = OBJECT_ID(N'[dbo].[Worker]'))
ALTER TABLE [dbo].[Worker] CHECK CONSTRAINT [FK_Worker_Title]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Worker_Unit]') AND parent_object_id = OBJECT_ID(N'[dbo].[Worker]'))
ALTER TABLE [dbo].[Worker]  WITH CHECK ADD  CONSTRAINT [FK_Worker_Unit] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Worker_Unit]') AND parent_object_id = OBJECT_ID(N'[dbo].[Worker]'))
ALTER TABLE [dbo].[Worker] CHECK CONSTRAINT [FK_Worker_Unit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Worker_Worker]') AND parent_object_id = OBJECT_ID(N'[dbo].[Worker]'))
ALTER TABLE [dbo].[Worker]  WITH CHECK ADD  CONSTRAINT [FK_Worker_Worker] FOREIGN KEY([UpperWorkerID])
REFERENCES [dbo].[Worker] ([WorkerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Worker_Worker]') AND parent_object_id = OBJECT_ID(N'[dbo].[Worker]'))
ALTER TABLE [dbo].[Worker] CHECK CONSTRAINT [FK_Worker_Worker]
GO
/****** Object:  StoredProcedure [dbo].[SP_CheckApproveOrder]    Script Date: 19.12.2023 18:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_CheckApproveOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_CheckApproveOrder] AS' 
END
GO
ALTER PROCEDURE [dbo].[SP_CheckApproveOrder]
	@id [int]
WITH EXECUTE AS CALLER
AS
begin

select a.AdvanceID,w.WorkerID,w.WorkerName as WorkerName,t.TitleName as TitleName,u.UnitName as UnitName,aps.ApprovalStatusID,aps.ApprovalName,a.AdvanceAmount,a.RequestDate,a.DesiredDate,p.ProjectName,a.AdvanceExplanation,aas.ApproverOrRejecterID as LastApproverOrRejecterID,ww.WorkerName as LastApproverOrRejecterName,tt.TitleName as LastApproverOrRejecterTitle,aas.[Approved/DeclinedDate] as LastApprovedDate,aas.ApprovedAmount as ApprovedAmount,aas.DeterminedPaymentDate,pr.ReceiptDate from Advance a 
join Worker w on w.WorkerID=a.WorkerID
join Title t on t.TitleID = w.TitleID
join Unit u on u.UnitID = w.UnitID
join AdvanceApproveStatus aas on aas.AdvanceID = a.AdvanceID
left join Worker ww on ww.WorkerID=aas.ApproverOrRejecterID
left join Title tt on tt.TitleID=ww.TitleID
left join ApprovalStatus aps on aps.ApprovalStatusID = aas.ApprovalStatusID
join Project p on p.ProjectID = a.ProjectID
left join AdvanceReceipt ar on ar.AdvanceID = a.AdvanceID
left join PaymentReceipt pr on pr.PaymentReceiptID = ar.PaymantReceiptID
where aas.NextApproverOrRejecterID = @id and isProcess=0
end
GO
ALTER AUTHORIZATION ON [dbo].[SP_CheckApproveOrder] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[SP_CheckApproveOrder] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetDetails]    Script Date: 19.12.2023 18:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_GetDetails] AS' 
END
GO
ALTER PROCEDURE [dbo].[SP_GetDetails]
	@advanceId [int]
WITH EXECUTE AS CALLER
AS
begin 

   SELECT 
    a.AdvanceID,
        a.AdvanceAmount,
        a.RequestDate,
        a.DesiredDate,
        a.AdvanceExplanation ,
        p.ProjectName,
        aas.ApprovalName,
        aas.NextApprovalName ,
        aps.[Approved/DeclinedDate] as ApprovedDeclinedDate,
        ww.WorkerName AS ApprovalRejectedName,
        wr.WorkerName as NextApprovalRejectedName,
        t.TitleName AS ApprovalRejectedTitle,
        aps.ApprovedAmount,
        payment.DeterminedPaybackDate,
        payment.PaymentReceiptID 

    FROM Advance a
    LEFT JOIN Worker w ON w.WorkerID = a.WorkerID
    JOIN Project p ON p.ProjectID = a.ProjectID
    JOIN AdvanceApproveStatus aps ON aps.AdvanceID = a.AdvanceID
    JOIN ApprovalStatus aas ON aas.ApprovalStatusID = aps.ApprovalStatusID
    LEFT JOIN Worker ww ON ww.WorkerID = aps.ApproverOrRejecterID
    LEFT  JOIN Worker wr on wr.WorkerID=aps.NextApproverOrRejecterID
    LEFT JOIN TitleAmountApprovalRule tar ON tar.ID = a.TitleAmountApprovalRuleID
    LEFT JOIN Title t ON t.TitleID = ww.TitleID
    LEFT JOIN AdvanceReceipt ar ON ar.AdvanceID = a.AdvanceID
    LEFT JOIN PaybackReceipt payback ON payback.PaybackReceiptID = ar.PaybackReceiptID
    LEFT JOIN PaymentReceipt payment ON payment.PaymentReceiptID = ar.PaymantReceiptID
    WHERE a.AdvanceID = @advanceId
    ORDER BY aps.ApproveStatusID 

end
GO
ALTER AUTHORIZATION ON [dbo].[SP_GetDetails] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[SP_GetDetails] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetWorkerAdvances]    Script Date: 19.12.2023 18:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetWorkerAdvances]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_GetWorkerAdvances] AS' 
END
GO
ALTER PROCEDURE [dbo].[SP_GetWorkerAdvances]
	@workerId [int]
WITH EXECUTE AS CALLER
AS
begin 
select
a.AdvanceID,
a.AdvanceAmount,
a.RequestDate ,
a.DesiredDate ,
p.ProjectName,
aas.ApprovalName ,
ww.WorkerName as ApprovalRejectedName,
t.TitleName as ApprovalRejectedTitle,
aps.ApprovedAmount ,
aps.[Approved/DeclinedDate] as ApprovedDeclinedDate,
aps.DeterminedPaymentDate,
ar.PaybackDate as PaybackDate,
case
    WHEN payback.ReceiptDate IS NOT NULL THEN 'Ödendi'
    ELSE 'Ödenmedi'
  END AS PaybackStatus


from Advance a
left join Worker w on w.WorkerID = a.WorkerID
join Project p on p.ProjectID = a.ProjectID
join AdvanceApproveStatus aps on aps.AdvanceID = a.AdvanceID
join ApprovalStatus aas on aas.ApprovalStatusID = aps.ApprovalStatusID
left join Worker ww on ww.WorkerID=aps.ApproverOrRejecterID
left join TitleAmountApprovalRule tar on tar.ID = a.TitleAmountApprovalRuleID
left join Title t on t.TitleID=ww.TitleID
left join AdvanceReceipt ar on ar.AdvanceID = a.AdvanceID
left join PaybackReceipt payback on payback.PaybackReceiptID = ar.PaybackReceiptID
left join PaymentReceipt payment on payment.PaymentReceiptID = ar.PaymantReceiptID
where 
w.WorkerID =@workerId  and aps.[Approved/DeclinedDate] In(select MAX(aps.[Approved/DeclinedDate])from AdvanceApproveStatus aps
join Advance a on a.AdvanceID=aps.AdvanceID
where a.WorkerID=@workerId
group by aps.AdvanceID)

end

GO
ALTER AUTHORIZATION ON [dbo].[SP_GetWorkerAdvances] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[SP_GetWorkerAdvances] TO  SCHEMA OWNER 
GO
/****** Object:  Trigger [dbo].[TRG_UpdateAdvanceDetail]    Script Date: 19.12.2023 18:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TRG_UpdateAdvanceDetail]'))
EXEC dbo.sp_executesql @statement = N'CREATE trigger [dbo].[TRG_UpdateAdvanceDetail]
on [dbo].[AdvanceApproveStatus]
after insert
as 
begin
	SET NOCOUNT ON;

    -- Set isProcess = 1 for all related records except the newly inserted one
    UPDATE a
    SET isProcess = 1
    FROM AdvanceApproveStatus a
    INNER JOIN inserted i ON a.AdvanceID = i.AdvanceID
    WHERE a.ApprovalStatusID <> i.ApprovalStatusID;

end


' 
GO
ALTER TABLE [dbo].[AdvanceApproveStatus] ENABLE TRIGGER [TRG_UpdateAdvanceDetail]
GO
