USE [Enterprise]
GO

/****** Object:  Table [dbo].[JobHeader]    Script Date: 9/27/2018 08:11:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[JobHeader](
	[CompanyID] [nvarchar](36) NOT NULL,
	[DivisionID] [nvarchar](36) NOT NULL,
	[DepartmentID] [nvarchar](36) NOT NULL,
	[ProjectID] [nvarchar](36) NULL,
	[ProjectName] [nvarchar](50) NULL,
	[ProjectDescription] [nvarchar](50) NULL,
	[EmployeeID] [nvarchar](36) NULL,
	[CustomerID] [nvarchar](50) NULL,
	[ProjectTypeID] [nvarchar](36) NULL,
	[ProjectStartDate] [datetime] NULL,
	[ProjectCompleteDate] [datetime] NULL,
	[CurrencyID] [nvarchar](3) NULL,
	[CurrencyExchangeRate] [float] NULL,
	[ProjectEstRevenue] [money] NULL,
	[ProjectActualRevenue] [money] NULL,
	[ProjectEstCost] [money] NULL,
	[ProjectActualCost] [money] NULL,
	[ProjectNotes] [nvarchar](250) NULL,
	[GLSalesAccount] [nvarchar](36) NULL,
	[ProjectOpen] [bit] NULL,
	[Memorize] [bit] NULL,
	[LockedBy] [nvarchar](36) NULL,
	[LockTS] [datetime] NULL,
	[OrderNumber] [nvarchar](36) NULL,
	[ProjectOrderValue] [money] NULL,
	[ProjectAbsorbedCost] [money] NULL,
	[GLCOSAccount] [nvarchar](36) NULL,
	[Approved] [bit] NULL,
	[ApprovedBy] [nvarchar](36) NULL,
	[ApprovedDate] [datetime] NULL,
	[Cleared] [bit] NULL,
	[EnteredBy] [nvarchar](36) NULL,
	[ClearedDate] [datetime] NULL,
	[Void] [bit] NULL,
	[Commission] [float] NULL,
	[ProjectsDetailDescription] [nvarchar](36) NULL,
	[TransactionNumber] [nvarchar](36) NOT NULL,
 CONSTRAINT [PK_JobHeader] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC,
	[DivisionID] ASC,
	[DepartmentID] ASC,
	[TransactionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[JobHeader] ADD  CONSTRAINT [DF_JobHeader_ProjectStartDate]  DEFAULT (getdate()) FOR [ProjectStartDate]
GO


