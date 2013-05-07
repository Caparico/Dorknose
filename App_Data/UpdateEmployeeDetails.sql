CREATE PROCEDURE UpdateEmployeeDetails
(
	@EmployeeID Int,
	@NewAddress nvarchar(50),
	@NewCity nvarchar(50),
	@NewState nvarchar(50),
	@NewZip nvarchar(50),
	@NewHomePhone nvarchar(50),
	@NewExtension nvarchar(50)
)
AS
UPDATE Employees
SET Address = @NewAddress, City = @NewCity, State = @NewState, Zip = @NewZip, HomePhone = @NewHomePhone, Extension = @NewExtension
WHERE EmployeeID = @EmployeeID 
