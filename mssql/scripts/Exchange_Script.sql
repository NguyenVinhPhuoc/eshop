USE [master]
GO
/****** Object:  Database [Exchange_Rate_Service_Db]    Script Date: 12/8/2021 11:06:42 PM ******/
CREATE DATABASE [Exchange_Rate_Service_Db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Exchange_Rate_Service_Db', FILENAME = N'/var/opt/mssql/data/Exchange_Rate_Service_Db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Exchange_Rate_Service_Db_log', FILENAME = N'/var/opt/mssql/data/Exchange_Rate_Service_Db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Exchange_Rate_Service_Db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET ARITHABORT OFF 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET RECOVERY FULL 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET  MULTI_USER 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Exchange_Rate_Service_Db', N'ON'
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET QUERY_STORE = OFF
GO
USE [Exchange_Rate_Service_Db]
GO
/****** Object:  Table [dbo].[ExchangeRates]    Script Date: 12/8/2021 11:06:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExchangeRates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[currency] [nvarchar](3) NULL,
	[rate] [decimal](18, 5) NULL,
	[date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Exchange_Rate_Service_Db] SET  READ_WRITE 
GO
