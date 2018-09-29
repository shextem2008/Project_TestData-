Use TestData

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Oluwasegun O>
-- Create date: <Create Date,23-09-2018,>
-- Description:	<Description,[JobDetail_Time_Retrieve]>
-- =============================================

Alter PROCEDURE [JobDetail_Time_Retrieve]
	@CompanyID NVARCHAR(36),
	@DivisionID NVARCHAR(36),
	@DepartmentID NVARCHAR(36),
	@EmployeeID NVARCHAR(36),
	@ProjectID NVARCHAR(36)

AS

Declare 
@vDateYear NVARCHAR(36)

--•	Create a stored procedure to retrieve an employee's time for each day of each week for the previous four weeks.

-- Validate if employees exist
  IF NOT EXISTS (select EmployeeID from [JobDetail]
				where companyid = 'PCMN' and divisionid = 'DEFAULT' and departmentid = 'DEFAULT' and EmployeeID = @EmployeeID ) 
	   BEGIN   
	   -- A retrieve an employee's time for each day of each week for the previous four weeks 	

		 --inner join
		select A.ProjectID,A.ProjectName,A.EmployeeID,A.CustomerID,A.ProjectStartDate, A.ProjectCompleteDate,B.Description,B.JobStartDate As TimeStart,B.JobEndDate As TimeEnd,DATEDIFF(hour, CAST( B.JobStartDate  AS TIME),CAST( B.JobEndDate AS TIME)) as TotalWorkhour, B.ApprovedBy,DATEADD(day,-27,convert(datetime,GETDATE())) as DayDiff
		from [JobHeader] A inner join [JobDetail] B on  
		 A.companyid = B.companyid and A.divisionid = B.divisionid and A.departmentid = B.departmentid and A.ProjectID = B.ProjectID 
		 where  A.ProjectStartDate >= DATEADD(day,-28,convert(datetime,GETDATE()))
		 
		--Update TotalWorkhour column for employees 
		Update B set B.HoursUsed = DATEDIFF(hour, CAST( B.JobStartDate  AS TIME),CAST( B.JobEndDate AS TIME)) 
		from [JobHeader] A inner join [JobDetail] B on  
		 A.companyid = B.companyid and A.divisionid = B.divisionid and A.departmentid = B.departmentid and A.ProjectID = B.ProjectID 
		 where  A.ProjectStartDate >= DATEADD(day,-28,convert(datetime,GETDATE()))
	  
	   End

