USE [master]
GO
/****** Object:  Database [Documap]    Script Date: 10/30/2021 8:37:19 AM ******/
CREATE DATABASE [Documap]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'documap', FILENAME = N'C:\Users\marvi\Documents\documaps\database\documap.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'documap_log', FILENAME = N'C:\Users\marvi\Documents\documaps\database\documap_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [documap] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [documap].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [documap] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [documap] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [documap] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [documap] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [documap] SET ARITHABORT OFF 
GO
ALTER DATABASE [documap] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [documap] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [documap] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [documap] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [documap] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [documap] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [documap] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [documap] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [documap] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [documap] SET  DISABLE_BROKER 
GO
ALTER DATABASE [documap] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [documap] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [documap] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [documap] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [documap] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [documap] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [documap] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [documap] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [documap] SET  MULTI_USER 
GO
ALTER DATABASE [documap] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [documap] SET DB_CHAINING OFF 
GO
ALTER DATABASE [documap] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [documap] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [documap] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [documap] SET QUERY_STORE = OFF
GO
USE [documap]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [documap]
GO
/****** Object:  Table [dbo].[tblResident]    Script Date: 10/30/2021 8:37:20 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblVaccine]    Script Date: 10/30/2021 8:37:20 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vwvaccination]    Script Date: 10/30/2021 8:37:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwvaccination] as select r.id, r.lname, r.fname, r.mname, isnull(v.vaccine,'')vaccine, isnull(v.status,'NOT YET VACCINATED') status from tblresident r left join tblvaccine v on r.id = v.rid
GO
/****** Object:  Table [dbo].[tblOfficial]    Script Date: 10/30/2021 8:37:20 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPurok]    Script Date: 10/30/2021 8:37:20 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [documap] SET  READ_WRITE 
GO
