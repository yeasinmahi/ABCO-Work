USE [master]
GO
/****** Object:  Database [AbcoAccountingDB]    Script Date: 8/19/2015 3:58:30 PM ******/
CREATE DATABASE [AbcoAccountingDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AbcoAccountingDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\AbcoAccountingDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AbcoAccountingDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\AbcoAccountingDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AbcoAccountingDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AbcoAccountingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AbcoAccountingDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AbcoAccountingDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AbcoAccountingDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AbcoAccountingDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AbcoAccountingDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AbcoAccountingDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AbcoAccountingDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [AbcoAccountingDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AbcoAccountingDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AbcoAccountingDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AbcoAccountingDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AbcoAccountingDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AbcoAccountingDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AbcoAccountingDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AbcoAccountingDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AbcoAccountingDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AbcoAccountingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AbcoAccountingDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AbcoAccountingDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AbcoAccountingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AbcoAccountingDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AbcoAccountingDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AbcoAccountingDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AbcoAccountingDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AbcoAccountingDB] SET  MULTI_USER 
GO
ALTER DATABASE [AbcoAccountingDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AbcoAccountingDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AbcoAccountingDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AbcoAccountingDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [AbcoAccountingDB]
GO
/****** Object:  Table [dbo].[Expend_tbl]    Script Date: 8/19/2015 3:58:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expend_tbl](
	[expendId] [int] NOT NULL,
	[subHeadId] [int] NOT NULL,
	[expendDate] [datetime] NOT NULL,
	[amount] [decimal](16, 2) NOT NULL,
 CONSTRAINT [PK_Expend_tbl] PRIMARY KEY CLUSTERED 
(
	[expendId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Head_tbl]    Script Date: 8/19/2015 3:58:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Head_tbl](
	[headId] [int] IDENTITY(1,1) NOT NULL,
	[headName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Head_tbl] PRIMARY KEY CLUSTERED 
(
	[headId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Income_tbl]    Script Date: 8/19/2015 3:58:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Income_tbl](
	[incomeId] [int] IDENTITY(1,1) NOT NULL,
	[subHeadId] [int] NULL,
	[incomeDate] [date] NULL,
	[amount] [decimal](16, 2) NULL,
 CONSTRAINT [PK_Income_tbl] PRIMARY KEY CLUSTERED 
(
	[incomeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login_tbl]    Script Date: 8/19/2015 3:58:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login_tbl](
	[loginId] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](30) NOT NULL,
	[password] [varchar](30) NOT NULL,
	[type] [varchar](1) NOT NULL,
	[status] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Login_tbl] PRIMARY KEY CLUSTERED 
(
	[loginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubHead_tbl]    Script Date: 8/19/2015 3:58:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubHead_tbl](
	[subHeadId] [int] IDENTITY(1,1) NOT NULL,
	[headId] [int] NOT NULL,
	[subHeadName] [varchar](50) NULL,
 CONSTRAINT [PK_SubHead_tbl] PRIMARY KEY CLUSTERED 
(
	[subHeadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserInfo_tbl]    Script Date: 8/19/2015 3:58:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo_tbl](
	[userInfoId] [int] IDENTITY(1,1) NOT NULL,
	[fName] [varchar](30) NOT NULL,
	[lName] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](20) NULL,
	[loginId] [int] NOT NULL,
	[Image] [varchar](8) NOT NULL,
 CONSTRAINT [PK_UserInfo_tbl] PRIMARY KEY CLUSTERED 
(
	[userInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Login_tbl] ADD  CONSTRAINT [DF_Login_tbl_type]  DEFAULT ('d') FOR [type]
GO
ALTER TABLE [dbo].[Login_tbl] ADD  CONSTRAINT [DF_Login_tbl_status]  DEFAULT ('u') FOR [status]
GO
ALTER TABLE [dbo].[UserInfo_tbl] ADD  CONSTRAINT [DF_UserInfo_tbl_lName]  DEFAULT ('0.jpg') FOR [lName]
GO
ALTER TABLE [dbo].[Income_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Income_tbl_SubHead_tbl] FOREIGN KEY([subHeadId])
REFERENCES [dbo].[SubHead_tbl] ([subHeadId])
GO
ALTER TABLE [dbo].[Income_tbl] CHECK CONSTRAINT [FK_Income_tbl_SubHead_tbl]
GO
ALTER TABLE [dbo].[SubHead_tbl]  WITH CHECK ADD  CONSTRAINT [FK_SubHead_tbl_Expend_tbl] FOREIGN KEY([subHeadId])
REFERENCES [dbo].[Expend_tbl] ([expendId])
GO
ALTER TABLE [dbo].[SubHead_tbl] CHECK CONSTRAINT [FK_SubHead_tbl_Expend_tbl]
GO
ALTER TABLE [dbo].[SubHead_tbl]  WITH CHECK ADD  CONSTRAINT [FK_SubHead_tbl_Head_tbl] FOREIGN KEY([subHeadId])
REFERENCES [dbo].[Head_tbl] ([headId])
GO
ALTER TABLE [dbo].[SubHead_tbl] CHECK CONSTRAINT [FK_SubHead_tbl_Head_tbl]
GO
ALTER TABLE [dbo].[UserInfo_tbl]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_tbl_Login_tbl] FOREIGN KEY([loginId])
REFERENCES [dbo].[Login_tbl] ([loginId])
GO
ALTER TABLE [dbo].[UserInfo_tbl] CHECK CONSTRAINT [FK_UserInfo_tbl_Login_tbl]
GO
USE [master]
GO
ALTER DATABASE [AbcoAccountingDB] SET  READ_WRITE 
GO
