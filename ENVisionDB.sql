/* Check whether the database already exists */
IF EXISTS(SELECT 1 FROM master.dbo.sysdatabases 
		  WHERE name = 'ENVision')
BEGIN
DROP DATABASE [ENVision]
print '' print '*** Dropping Database ENVision'
END
GO

print '' print '*** Creating Database ENVision'
GO

CREATE DATABASE [ENVision]
GO

print '' print '*** Using Database ENVision'
GO

USE [ENVision]
GO

print '' print '*** Creating tUser Table'
GO
CREATE TABLE [dbo].[tUser](
	[UserId] 		[int] IDENTITY(1000000,1) 	NOT NULL,
	[FirstName] 	[nvarchar](50) 				NOT NULL,
	[LastName] 		[nvarchar](50) 				NOT NULL,
	[PhoneNumber] 	[nvarchar](11)				NOT NULL,
	[Email]			[nvarchar](250)				NOT NULL,
	[PasswordHash]	[nvarchar](100)				NOT NULL
		DEFAULT '9C9064C59F1FFA2E174EE754D2979BE80DD30DB552EC03E7E327E9B1A4BD594E',
	[Active]		[bit]						NOT NULL DEFAULT 1,
	CONSTRAINT [pk_UserId] PRIMARY KEY([UserId] ASC),
	CONSTRAINT [ak_Email] UNIQUE([Email] ASC)
)
GO
print '' print '*** Adding Index for LastName on tUser'
GO
CREATE NONCLUSTERED INDEX [ix_lastName] ON [tUser]([LastName] ASC)
GO

print '' print '*** Creating tVolunteerOpp Table'
GO
CREATE TABLE [dbo].[tVolunteerOpp](
	[VolOppId] 		[int] IDENTITY(1000000,1) 	NOT NULL,
	[VolOppName] 	[nvarchar](50) 				NOT NULL,
	[OppLocation]	[nvarchar](100)				NOT NULL,
	[OppDate] 		[DATE] 						NOT NULL,
	[Organizer] 	[nvarchar](50)				NOT NULL,
	[Description]	[nvarchar](500)					NULL,
	[Active]		[bit]						NOT NULL DEFAULT 1,
	CONSTRAINT [pk_VolOppId] PRIMARY KEY([VolOppId] ASC),
)
GO

print '' print '*** Creating tFriend'
GO
CREATE TABLE [dbo].[tFriend](
	[UserNumOne] 		[int] 				NOT NULL,
	[UserNumTwo]		[int] 				NOT NULL,
	CONSTRAINT [pk_FriendId] PRIMARY KEY([UserNumOne],[UserNumTwo] ASC)
)
GO

print '' print '*** Creating VolOppUser Table'
GO
CREATE TABLE [dbo].[tVolOppUser](
	[VolOppId] 		[int] 					 	NOT NULL,
	[UserId] 		[int] 						NOT NULL,
	CONSTRAINT [pk_VolOppUserId] PRIMARY KEY([VolOppId] ASC,[UserId]),
	CONSTRAINT [fk_tUser_UserId] FOREIGN KEY([UserId]) 
		REFERENCES [tUser]([UserId]),
	CONSTRAINT [fk_tVolonteerOpp_VolOppId] FOREIGN KEY([VolOppId]) 
		REFERENCES [tVolunteerOpp]([VolOppId]) ON UPDATE CASCADE /*maybe not cascade?*/
)
GO

print '' print '*** Creating Sample tUser Records'
GO
INSERT INTO [dbo].[tUser]
	([FirstName], [LastName], [PhoneNumber], [Email])
	VALUES
	('Admin', 'User', '13191230000','admin@gmail.com'),
	('Ethan', 'Holmes', '13191230000','ethanholmes7@gmail.com'),
	('Billy', 'Russo', '13191230000','brusso@gmail.com'),
	('Tony', 'Golobic', '13191230000','tgolobic@greatamerica.com'),
	('Justin', 'Balvanz', '13191230000','jbalvanz@greatamerica.com')
	
GO

/*
print '' print '*** Creating Sample Deactivated Employee'
GO
INSERT INTO [dbo].[Employee]
	([FirstName], [LastName], [PhoneNumber], [Email], [Active])
	VALUES
	('Boris', 'Badworker', '13191239999','boris@company.com', 0)
GO

print '' print '*** Creating Sample Role Records'
GO
INSERT INTO [dbo].[Role]
	([RoleID])
	VALUES
	('Administrator'),
	('Manager'),
	('Rental'),
	('CheckOut'),
	('Inspection'),
	('Prep'),
	('Maintenance')
GO

print '' print '*** Inserting Sample EmployeeRole Records'
GO
INSERT INTO [dbo].[EmployeeRole]
	([EmployeeID], [RoleID])
	VALUES
	(1000000, 'Administrator'),
	(1000001, 'Manager'),
	(1000001, 'Rental'),
	(1000002, 'CheckOut'),
	(1000002, 'Inspection'),
	(1000002, 'Prep'),
	(1000003, 'Prep'),
	(1000003, 'Maintenance')
GO
*/

/*STORED PROCEDURES*/
print '' print '*** Creating sp_select_user_by_email'
GO
CREATE PROCEDURE [sp_select_user_by_email]
(
	@Email 			[nvarchar](250)
)
AS
BEGIN
	SELECT 	[UserId], [FirstName], [LastName], [PhoneNumber]
	FROM 	[dbo].[tUser]
	WHERE 	[Email] = @Email
END
GO

print '' print '*** Creating sp_update_password'
GO
CREATE PROCEDURE [sp_update_password]
(
	@UserId				[int],
	@OldPasswordHash	[nvarchar](100),
	@NewPasswordHash	[nvarchar](100)
)
AS
BEGIN
	UPDATE 	[dbo].[tUser]
	SET 	[PasswordHash] 	= @NewPasswordHash
	WHERE	[UserId] 	= @UserId
	  AND	[PasswordHash] 	= @OldPasswordHash
	  AND	[Active] = 1
	RETURN @@ROWCOUNT
END
GO

print '' print '*** Creating sp_authenticate_user'
GO
CREATE PROCEDURE [sp_authenticate_user]
(
	@Email 				[nvarchar](250),
	@PasswordHash		[nvarchar](100)
)
AS
BEGIN
	SELECT 	COUNT([UserId])
	FROM 	[dbo].[tUser]
	WHERE	[Email] = @Email
	  AND	[PasswordHash] = @PasswordHash
	  AND	[Active] = 1
END
GO


print '' print '*** Creating sp_insert_user'
GO
CREATE PROCEDURE [sp_insert_user]
(
	@FirstName 		[nvarchar](50),
	@LastName  		[nvarchar](50),
	@PhoneNumber	[nvarchar](11),
	@Email			[nvarchar](250)
)
AS
BEGIN
	INSERT INTO [dbo].[tUser]
		([FirstName], [LastName], [PhoneNumber], [Email], [PasswordHash])
	VALUES
		(@FirstName, @LastName, @PhoneNumber, @Email, '9C9064C59F1FFA2E174EE754D2979BE80DD30DB552EC03E7E327E9B1A4BD594E')
	SELECT SCOPE_IDENTITY()
END 
GO

print '' print '*** Creating sp_insert_vol_opp'
GO
CREATE PROCEDURE [sp_insert_vol_opp]
(
	@VolOppName 	[nvarchar](50),
	@OppDate  		[DATE],
	@Organizer		[nvarchar](50),
	@OppLocation 	[nvarchar](100),
	@Description	[nvarchar](500)
)
AS
BEGIN
	INSERT INTO [dbo].[tVolunteerOpp]
		([VolOppName], [OppLocation], [Organizer], [OppDate], [Description])
	VALUES
		(@VolOppName,@OppLocation , @Organizer, @OppDate, @Description)
	SELECT SCOPE_IDENTITY()
END 
GO

print '' print '*** Creating sp_select_all_vol_opps'
GO
CREATE PROCEDURE [sp_select_all_vol_opps]
AS
BEGIN
	SELECT 	[VolOppId],[VolOppName], [OppDate], [OppLocation], [Organizer], [Description]
	FROM 	[dbo].[tVolunteerOpp]	
END
GO

print '' print '*** Creating sp_select_vol_opp_by_id'
GO
CREATE PROCEDURE [sp_select_vol_opp_by_id]
(
	@VolOppId int 
)
AS
BEGIN
	SELECT 	[VolOppId],[VolOppName], [OppDate], [Organizer], [OppLocation], [Description], [Active]
	FROM 	[dbo].[tVolunteerOpp]
	WHERE 	[VolOppId] = @VolOppId
END
GO

print '' print '*** Creating sp_update_vol_opp_by_id'
GO
CREATE PROCEDURE [sp_update_vol_opp_by_id]
(
	@VolOppId [int] ,
	@VolOppName [nvarchar](50),
	@OppLocation [nvarchar](100),
	@OppDate [DATE],
	@Organizer [nvarchar](50),
	@Description [nvarchar](500)

)
AS
BEGIN
	UPDATE [dbo].[tVolunteerOpp] 	
	SET 
	[VolOppName] = @VolOppName WHERE 	[VolOppId] = @VolOppId
	
	UPDATE [dbo].[tVolunteerOpp]
	SET 
	[OppDate] = @OppDate WHERE 	[VolOppId] = @VolOppId
	
	UPDATE [dbo].[tVolunteerOpp] 	
	SET 
	[Organizer] = @Organizer WHERE 	[VolOppId] = @VolOppId
	
	UPDATE [dbo].[tVolunteerOpp] 	
	SET 
	[OppLocation] = @OppLocation WHERE 	[VolOppId] = @VolOppId
	
	UPDATE [dbo].[tVolunteerOpp] 	
	SET 
	[Description] = @Description WHERE 	[VolOppId] = @VolOppId

	RETURN @@ROWCOUNT
END
GO
				

print '' print '*** Creating Sample tVolunteerOpp Records'
GO
INSERT INTO [dbo].[tVolunteerOpp]
	([VolOppName], [OppLocation], [Organizer], [OppDate], [Description])
	VALUES
	('Pick Up The Trash', 'Iowa City, IA 52246', 'Ethan Holmes','12-12-2019','Clean up trash and STOP pollution around Iowa City area.'),
	('Terry Trueblood Cleanup', 'Iowa City, IA 52246', 'Mrs. Env Sci Teacher','12-13-2019','Help remove invasive species of plants and weeds around Terry Trueblood Lake.'),
	('Pollution Police Patrol', 'North Liberty, IA 52132', 'Bob Ross','12-12-2019','Clean up trash and STOP pollution around North Liberty area.'),
	('Winter Shelter Volunteer', 'Iowa City, IA 52246', 'Some Person','12-13-2019','Help by volunteering at a winter homeless Shelter.'),
	('Food Bank Volunteer', 'Coralville, IA 52246', 'Josh Jackson','12-12-2019','Volunteer opprotunity, help out at a food bank.'),
	('Random Volunteer Opp', 'Iowa City, IA 52246', 'Zachary B','12-12-2019','Clean up trash and STOP pollution around Iowa City area.')
	
GO

