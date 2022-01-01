USE [master]
GO
/****** Object:  Database [Discount_Service_Db]    Script Date: 12/8/2021 11:05:53 PM ******/
CREATE DATABASE [Discount_Service_Db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Discount_Service_Db', FILENAME = N'/var/opt/mssql/data/Discount_Service_Db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Discount_Service_Db_log', FILENAME = N'/var/opt/mssql/data/Discount_Service_Db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Discount_Service_Db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Discount_Service_Db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Discount_Service_Db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Discount_Service_Db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Discount_Service_Db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Discount_Service_Db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Discount_Service_Db] SET ARITHABORT OFF 
GO
ALTER DATABASE [Discount_Service_Db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Discount_Service_Db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Discount_Service_Db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Discount_Service_Db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Discount_Service_Db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Discount_Service_Db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Discount_Service_Db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Discount_Service_Db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Discount_Service_Db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Discount_Service_Db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Discount_Service_Db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Discount_Service_Db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Discount_Service_Db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Discount_Service_Db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Discount_Service_Db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Discount_Service_Db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Discount_Service_Db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Discount_Service_Db] SET RECOVERY FULL 
GO
ALTER DATABASE [Discount_Service_Db] SET  MULTI_USER 
GO
ALTER DATABASE [Discount_Service_Db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Discount_Service_Db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Discount_Service_Db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Discount_Service_Db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Discount_Service_Db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Discount_Service_Db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Discount_Service_Db', N'ON'
GO
ALTER DATABASE [Discount_Service_Db] SET QUERY_STORE = OFF
GO
USE [Discount_Service_Db]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 12/8/2021 11:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[id] [nvarchar](255) NOT NULL,
	[vendorId] [nvarchar](255) NULL,
	[discountName] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[priority] [int] NULL,
	[allowedUses] [int] NULL,
	[modifier] [int] NULL,
	[discountRule] [int] NULL,
	[unit] [nvarchar](3) NULL,
	[startDate] [datetimeoffset](7) NULL,
	[endDate] [datetimeoffset](7) NULL,
	[isFlatAmount] [bit] NULL,
	[isActive] [bit] NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDiscounts]    Script Date: 12/8/2021 11:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDiscounts](
	[adjustmentAmount] [int] NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[discountId] [nvarchar](255) NOT NULL,
	[productId] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[discountId] ASC,
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/8/2021 11:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [nvarchar](255) NOT NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductDiscounts]  WITH CHECK ADD FOREIGN KEY([discountId])
REFERENCES [dbo].[Discounts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductDiscounts]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[uspGetDiscountForProduct]    Script Date: 12/8/2021 11:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[uspGetDiscountForProduct]
    @productId UNIQUEIDENTIFIER
AS
BEGIN
    SELECT Discounts.modifier,MAX(Discounts.priority) as 'priority',Discounts.discountRule,Discounts.isFlatAmount,Discounts.unit
    FROM ProductDiscounts,Discounts
    WHERE ProductDiscounts.productId = @productId
    AND Discounts.id = ProductDiscounts.discountId
    -- AND Discounts.isActive = 1
    GROUP BY Discounts.modifier, Discounts.priority, Discounts.discountRule,Discounts.isFlatAmount,Discounts.unit
END
GO
USE [master]
GO
ALTER DATABASE [Discount_Service_Db] SET  READ_WRITE 
GO
