USE [master]
GO
/****** Object:  Database [ManageStudentServiceDB]    Script Date: 6/26/2017 9:10:53 AM ******/
CREATE DATABASE [ManageStudentServiceDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ManageStudentServiceDB', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ManageStudentServiceDB.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ManageStudentServiceDB_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ManageStudentServiceDB_log.ldf' , SIZE = 560KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ManageStudentServiceDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ManageStudentServiceDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ManageStudentServiceDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ManageStudentServiceDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ManageStudentServiceDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ManageStudentServiceDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ManageStudentServiceDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ManageStudentServiceDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ManageStudentServiceDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ManageStudentServiceDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ManageStudentServiceDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ManageStudentServiceDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ManageStudentServiceDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ManageStudentServiceDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ManageStudentServiceDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ManageStudentServiceDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ManageStudentServiceDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ManageStudentServiceDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ManageStudentServiceDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ManageStudentServiceDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ManageStudentServiceDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ManageStudentServiceDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ManageStudentServiceDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ManageStudentServiceDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ManageStudentServiceDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ManageStudentServiceDB] SET  MULTI_USER 
GO
ALTER DATABASE [ManageStudentServiceDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ManageStudentServiceDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ManageStudentServiceDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ManageStudentServiceDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ManageStudentServiceDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ManageStudentServiceDB]
GO
/****** Object:  Table [dbo].[StudentTbl]    Script Date: 6/26/2017 9:10:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentTbl](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[SName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Pass] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[StudentTbl] ON 

INSERT [dbo].[StudentTbl] ([StudentID], [SName], [Email], [Pass]) VALUES (2, N'Pappu123', N'pappu@gmail.com', N'321')
SET IDENTITY_INSERT [dbo].[StudentTbl] OFF
/****** Object:  StoredProcedure [dbo].[AddNewStudent]    Script Date: 6/26/2017 9:10:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewStudent]
@SName varchar(50),
@Pass varchar(50),
@Email varchar(50)
as
insert into StudentTbl values(@SName,@Email,@Pass)
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudent]    Script Date: 6/26/2017 9:10:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteStudent]
@SID int
as
delete from  StudentTbl where StudentID=@SID
GO
/****** Object:  StoredProcedure [dbo].[GetAllStudents]    Script Date: 6/26/2017 9:10:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllStudents]
as
select * from StudentTbl
GO
/****** Object:  StoredProcedure [dbo].[UpdateStudent]    Script Date: 6/26/2017 9:10:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStudent]
@SID int,
@SName varchar(50),
@Email varchar(50),
@Pass varchar(50)
as
update StudentTbl set SName=@SName,Pass=@Pass where StudentID=@SID and Email=@Email
GO
USE [master]
GO
ALTER DATABASE [ManageStudentServiceDB] SET  READ_WRITE 
GO
