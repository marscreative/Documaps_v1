USE [master]
GO
/****** Object:  Database [Documap]    Script Date: 5/28/2023 9:56:19 AM ******/
CREATE DATABASE [Documap]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'documap', FILENAME = N'C:\Users\marvi\Documents\documaps\database\documap.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'documap_log', FILENAME = N'C:\Users\marvi\Documents\documaps\database\documap_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Documap] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Documap].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Documap] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Documap] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Documap] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Documap] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Documap] SET ARITHABORT OFF 
GO
ALTER DATABASE [Documap] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Documap] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Documap] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Documap] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Documap] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Documap] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Documap] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Documap] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Documap] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Documap] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Documap] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Documap] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Documap] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Documap] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Documap] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Documap] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Documap] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Documap] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Documap] SET  MULTI_USER 
GO
ALTER DATABASE [Documap] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Documap] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Documap] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Documap] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Documap] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Documap] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Documap] SET QUERY_STORE = OFF
GO
USE [Documap]
GO
/****** Object:  Table [dbo].[tblResident]    Script Date: 5/28/2023 9:56:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblResident](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nid] [varchar](50) NULL,
	[lname] [varchar](50) NULL,
	[fname] [varchar](50) NULL,
	[mname] [varchar](50) NULL,
	[alias] [varchar](50) NULL,
	[bdate] [date] NULL,
	[bplace] [text] NULL,
	[age] [int] NULL,
	[civilstatus] [varchar](50) NULL,
	[gender] [varchar](50) NULL,
	[religion] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[contact] [varchar](50) NULL,
	[voters] [varchar](50) NULL,
	[precinct] [varchar](50) NULL,
	[purok] [varchar](50) NULL,
	[educational] [text] NULL,
	[occupation] [text] NULL,
	[address] [text] NULL,
	[category] [varchar](50) NULL,
	[house] [varchar](50) NULL,
	[head] [varchar](50) NULL,
	[disability] [varchar](50) NULL,
	[status] [varchar](50) NULL,
	[pic] [image] NULL,
 CONSTRAINT [PK_tblResident] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVaccine]    Script Date: 5/28/2023 9:56:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVaccine](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[rid] [int] NOT NULL,
	[vaccine] [varchar](50) NULL,
	[status] [varchar](50) NULL,
 CONSTRAINT [PK_tblVaccine] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwvaccination]    Script Date: 5/28/2023 9:56:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwvaccination] as select r.id, r.lname, r.fname, r.mname, isnull(v.vaccine,'')vaccine, isnull(v.status,'NOT YET VACCINATED') status from tblresident r left join tblvaccine v on r.id = v.rid
GO
/****** Object:  Table [dbo].[tblblotter]    Script Date: 5/28/2023 9:56:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblblotter](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fileno] [varchar](50) NOT NULL,
	[barangay] [varchar](50) NULL,
	[purok] [varchar](50) NULL,
	[incident] [text] NULL,
	[place] [text] NULL,
	[idate] [date] NULL,
	[itime] [varchar](50) NULL,
	[complainant] [varchar](50) NULL,
	[witness1] [varchar](50) NULL,
	[witness2] [varchar](50) NULL,
	[narrative] [text] NULL,
	[status] [varchar](50) NULL,
 CONSTRAINT [PK_tblblotter_1] PRIMARY KEY CLUSTERED 
(
	[fileno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOfficial]    Script Date: 5/28/2023 9:56:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOfficial](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[chairmanship] [varchar](100) NULL,
	[position] [varchar](50) NULL,
	[termstart] [date] NULL,
	[termend] [date] NULL,
	[status] [varchar](50) NULL,
 CONSTRAINT [PK_tblOfficial] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPayment]    Script Date: 5/28/2023 9:56:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[refno] [varchar](50) NOT NULL,
	[name] [varchar](100) NULL,
	[type] [varchar](50) NULL,
	[amount] [decimal](18, 2) NULL,
	[sdate] [date] NULL,
	[suser] [varchar](50) NULL,
 CONSTRAINT [PK_tblPayment] PRIMARY KEY CLUSTERED 
(
	[refno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPurok]    Script Date: 5/28/2023 9:56:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPurok](
	[purok] [varchar](50) NOT NULL,
	[chairman] [varchar](100) NULL,
 CONSTRAINT [PK_tblPurok] PRIMARY KEY CLUSTERED 
(
	[purok] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblblotter] ADD  CONSTRAINT [DF_tblblotter_status]  DEFAULT ('Unsettled') FOR [status]
GO
USE [master]
GO
ALTER DATABASE [Documap] SET  READ_WRITE 
GO
