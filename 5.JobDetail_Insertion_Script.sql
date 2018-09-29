Use TestData
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Oluwasegun O>
-- Create date: <Create Date,23-09-2018,>
-- Description:	<Description,[JobDetail_Insertion] >
-- =============================================

Alter PROCEDURE [JobDetail_Insertion]
	@CompanyID NVARCHAR(36),
	@DivisionID NVARCHAR(36),
	@DepartmentID NVARCHAR(36),
	@EmployeeID NVARCHAR(36),
	@ProjectID NVARCHAR(36)

AS

Declare 
@ApprovedBy NVARCHAR(36)


-- 	Create a stored procedure you will need to save employee time entry from a client application
--- Insert Job per projectID considering Company/division/Department and validate for duplicate 
   IF NOT EXISTS (select [ProjectID] from [JobHeader]
				where companyid = 'PCMN' and divisionid = 'DEFAULT' and departmentid = 'DEFAULT' and 
			   [ProjectID] = @ProjectID)
	   BEGIN  
	    -- insert for Job Header per employee
		 INSERT INTO [JobHeader](CompanyID,DivisionID,DepartmentID,[ProjectID]) values
		 ( 'PCMN','DEFAULT','DEFAULT',@ProjectID)
		 
		  -- insert for Job Detail
		insert into [JobDetail] (CompanyID,DivisionID,DepartmentID,[ProjectID],EmployeeID,
		[Description],
		[JobStartDate],
		[JobEndDate],
		[HoursUsed],
		[ApprovedBy],
		[EstimatedEffort],
		[PercentComplete],
		[ActualValue]
		) values (@CompanyID,@DivisionID,@DepartmentID,@ProjectID,@EmployeeID,'','','','','','','','')	 

	   END
   ELSE 

   --- Insert Job Detail only  and validate for duplicate
    IF NOT EXISTS (select EmployeeID from [JobDetail]
				where companyid = 'PCMN' and divisionid = 'DEFAULT' and departmentid = 'DEFAULT' and EmployeeID = @EmployeeID ) 
	   BEGIN   

	    --- insert for Job Detail
		insert into [JobDetail] (CompanyID,DivisionID,DepartmentID,[ProjectID],EmployeeID,
		[Description],
		[JobStartDate],
		[JobEndDate],
		[HoursUsed],
		[ApprovedBy],
		[EstimatedEffort],
		[PercentComplete],
		[ActualValue]
		) values (@CompanyID,@DivisionID,@DepartmentID,@ProjectID,@EmployeeID,'','','','','','','','')	 

END

