USE [Enterprise]
GO

/****** Object:  Table [dbo].[JobDetail]    Script Date: 9/27/2018 08:11:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[JobDetail](
	[CompanyID] [nvarchar](36) NOT NULL,
	[DivisionID] [nvarchar](36) NOT NULL,
	[DepartmentID] [nvarchar](36) NOT NULL,
	[ProjectID] [nvarchar](36) NULL,
	[ProjectDetailID] [int] IDENTITY(1,1) NOT NULL,
	[DependsOn] [nvarchar](36) NULL,
	[Step] [int] NULL,
	[StepName] [nvarchar](80) NULL,
	[StepDescription] [nvarchar](250) NULL,
	[StepStartDate] [datetime] NULL,
	[StepCompleteDate] [datetime] NULL,
	[StepDueDate] [datetime] NULL,
	[StepNotes] [nvarchar](250) NULL,
	[StepStatus] [nvarchar](36) NULL,
	[StepComplete] [bit] NULL,
	[PercentComplete] [float] NULL,
	[Priority] [nvarchar](36) NULL,
	[EstimatedEffort] [int] NULL,
	[ActualEffort] [int] NULL,
	[Milestone] [bit] NULL,
	[EmployeeID] [nvarchar](36) NULL,
	[Billed] [bit] NULL,
	[OrderNumber] [nvarchar](36) NULL,
	[Paid] [bit] NULL,
	[InvoiceNumber] [nvarchar](36) NULL,
	[RequiredExpenses] [bit] NULL,
	[PurchaseNumber] [nvarchar](36) NULL,
	[OtherRelatedDocumentNumber] [nvarchar](36) NULL,
	[Approved] [bit] NULL,
	[ApprovedBy] [nvarchar](36) NULL,
	[ApprovedDate] [datetime] NULL,
	[LockedBy] [nvarchar](36) NULL,
	[LockTS] [datetime] NULL,
	[TransactionType] [nvarchar](36) NULL,
	[ItemID] [nvarchar](36) NULL,
	[Description] [nvarchar](50) NULL,
	[GLAccount] [nvarchar](36) NULL,
	[EstimatedQty] [float] NULL,
	[EstimatedValue] [money] NULL,
	[ActualQty] [float] NULL,
	[ActualValue] [money] NULL,
	[TransactionDate] [datetime] NULL,
	[HoursUsed] [float] NULL,
	[JobStartDate] [date] NULL,
	[JobEndDate] [date] NULL,
	[TransactionNumber] [nvarchar](36) NOT NULL,
 CONSTRAINT [PK_JobDetail_1] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC,
	[DivisionID] ASC,
	[DepartmentID] ASC,
	[ProjectDetailID] ASC,
	[TransactionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


