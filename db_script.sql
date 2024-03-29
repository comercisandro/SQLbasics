USE [master]
GO
/****** Object:  Database [Web_scraping]    Script Date: 5/10/2021 11:58:27 AM ******/
CREATE DATABASE [Web_scraping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Web_scraping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Web_scraping.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Web_scraping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Web_scraping_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Web_scraping] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Web_scraping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Web_scraping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Web_scraping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Web_scraping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Web_scraping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Web_scraping] SET ARITHABORT OFF 
GO
ALTER DATABASE [Web_scraping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Web_scraping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Web_scraping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Web_scraping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Web_scraping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Web_scraping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Web_scraping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Web_scraping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Web_scraping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Web_scraping] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Web_scraping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Web_scraping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Web_scraping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Web_scraping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Web_scraping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Web_scraping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Web_scraping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Web_scraping] SET RECOVERY FULL 
GO
ALTER DATABASE [Web_scraping] SET  MULTI_USER 
GO
ALTER DATABASE [Web_scraping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Web_scraping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Web_scraping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Web_scraping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Web_scraping] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Web_scraping] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Web_scraping', N'ON'
GO
ALTER DATABASE [Web_scraping] SET QUERY_STORE = OFF
GO
USE [Web_scraping]
GO
/****** Object:  Table [dbo].[Aka]    Script Date: 5/10/2021 11:58:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aka](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title_id] [nvarchar](50) NOT NULL,
	[country] [nvarchar](max) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Aka] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cast_and_crew]    Script Date: 5/10/2021 11:58:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cast_and_crew](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[person_id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[title_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cast_and_crew] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company_credit]    Script Date: 5/10/2021 11:58:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_credit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [nvarchar](50) NOT NULL,
	[title_id] [nvarchar](50) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Company_credits] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Config]    Script Date: 5/10/2021 11:58:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[images_local_path] [nvarchar](max) NOT NULL,
	[images_per_title] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Connection]    Script Date: 5/10/2021 11:58:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Connection](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[connection_id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[title_id] [nvarchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[External_site]    Script Date: 5/10/2021 11:58:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[External_site](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title_id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[url] [nvarchar](max) NULL,
 CONSTRAINT [PK_External_site] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Filming_location]    Script Date: 5/10/2021 11:58:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filming_location](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title_id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 5/10/2021 11:58:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](max) NOT NULL,
	[local_url] [nvarchar](max) NULL,
	[people] [nvarchar](max) NULL,
	[languages] [nvarchar](max) NULL,
	[title_id] [nvarchar](50) NOT NULL,
	[width] [int] NULL,
	[height] [int] NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parents_section]    Script Date: 5/10/2021 11:58:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parents_section](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title_id] [nvarchar](50) NOT NULL,
	[section_title] [nvarchar](50) NOT NULL,
	[advisory_severity] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Parents_section] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Release]    Script Date: 5/10/2021 11:58:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Release](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[country] [nvarchar](50) NOT NULL,
	[date] [nvarchar](50) NOT NULL,
	[title_id] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Release] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Soundtrack]    Script Date: 5/10/2021 11:58:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Soundtrack](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title_id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[produced_by] [nvarchar](max) NULL,
	[music_by] [nvarchar](max) NULL,
	[performed_by] [nvarchar](max) NULL,
	[written_by] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tagline]    Script Date: 5/10/2021 11:58:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tagline](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title_id] [nvarchar](50) NOT NULL,
	[tagline] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Technical_specs]    Script Date: 5/10/2021 11:58:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Technical_specs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title_id] [nvarchar](50) NOT NULL,
	[runtime] [nvarchar](max) NULL,
	[sound_mix] [nvarchar](max) NULL,
	[color] [nvarchar](max) NULL,
	[aspect_ratio] [nvarchar](max) NULL,
	[camera] [nvarchar](max) NULL,
	[laboratory] [nvarchar](max) NULL,
	[film_length] [nvarchar](max) NULL,
	[negative_format] [nvarchar](max) NULL,
	[cinematographic_process] [nvarchar](max) NULL,
	[printed_film_format] [nvarchar](max) NULL,
 CONSTRAINT [PK_Technical_specs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Title]    Script Date: 5/10/2021 11:58:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Title](
	[id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[full_name] [nvarchar](max) NOT NULL,
	[date] [nvarchar](50) NULL,
	[type] [nvarchar](50) NOT NULL,
	[duration] [nvarchar](50) NULL,
	[rating] [nchar](10) NULL,
	[genres] [nvarchar](max) NULL,
	[storyline] [nvarchar](max) NULL,
	[summary] [nvarchar](max) NULL,
	[url] [nvarchar](max) NOT NULL,
	[plot_keywords] [nvarchar](max) NULL,
	[episode_of] [nvarchar](50) NULL,
	[session_number] [int] NULL,
	[episode_number] [int] NULL,
	[countries] [nvarchar](max) NULL,
	[languages] [nvarchar](max) NULL,
 CONSTRAINT [PK_Title] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Web_scraping] SET  READ_WRITE 
GO
