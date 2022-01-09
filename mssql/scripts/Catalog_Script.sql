USE [master]
GO
/****** Object:  Database [Catalog_Service_Db]    Script Date: 12/8/2021 11:04:31 PM ******/
CREATE DATABASE [Catalog_Service_Db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Catalog_Service_Db', FILENAME = N'/var/opt/mssql/data/Catalog_Service_Db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Catalog_Service_Db_log', FILENAME = N'/var/opt/mssql/data/Catalog_Service_Db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Catalog_Service_Db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Catalog_Service_Db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Catalog_Service_Db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Catalog_Service_Db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Catalog_Service_Db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Catalog_Service_Db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Catalog_Service_Db] SET ARITHABORT OFF 
GO
ALTER DATABASE [Catalog_Service_Db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Catalog_Service_Db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Catalog_Service_Db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Catalog_Service_Db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Catalog_Service_Db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Catalog_Service_Db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Catalog_Service_Db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Catalog_Service_Db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Catalog_Service_Db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Catalog_Service_Db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Catalog_Service_Db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Catalog_Service_Db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Catalog_Service_Db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Catalog_Service_Db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Catalog_Service_Db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Catalog_Service_Db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Catalog_Service_Db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Catalog_Service_Db] SET RECOVERY FULL 
GO
ALTER DATABASE [Catalog_Service_Db] SET  MULTI_USER 
GO
ALTER DATABASE [Catalog_Service_Db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Catalog_Service_Db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Catalog_Service_Db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Catalog_Service_Db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Catalog_Service_Db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Catalog_Service_Db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Catalog_Service_Db', N'ON'
GO
ALTER DATABASE [Catalog_Service_Db] SET QUERY_STORE = OFF
GO
USE [Catalog_Service_Db]
GO
/****** Object:  UserDefinedTableType [dbo].[productsTemp]    Script Date: 12/8/2021 11:04:31 PM ******/
CREATE TYPE [dbo].[productsTemp] AS TABLE(
	[id] [uniqueidentifier] NULL,
	[total] [int] NULL,
	[maxPrice] [decimal](18, 0) NULL
)
GO
/****** Object:  Table [dbo].[Attributes]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attributes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productId] [uniqueidentifier] NULL,
	[name] [nvarchar](250) NOT NULL,
	[value] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [uniqueidentifier] NOT NULL,
	[parentId] [uniqueidentifier] NULL,
	[name] [nvarchar](250) NOT NULL,
	[slug] [nvarchar](250) NULL,
	[depth] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryProduct]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryProduct](
	[categoryId] [uniqueidentifier] NULL,
	[productId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductGroups]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductGroups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [uniqueidentifier] NOT NULL,
	[groupId] [int] NULL,
	[name] [nvarchar](250) NOT NULL,
	[briefDescription] [nvarchar](250) NOT NULL,
	[detailDescription] [nvarchar](max) NULL,
	[price] [decimal](18, 0) NOT NULL,
	[stock] [int] NOT NULL,
	[active] [bit] NULL,
	[unit] [nvarchar](3) NOT NULL,
	[slug] [nvarchar](250) NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[brandId] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[ProductGroups] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[ProductGroups] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [active]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[CategoryProduct]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[CategoryProduct]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
/****** Object:  StoredProcedure [dbo].[SP_AddAttribute]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[SP_AddAttribute]
   @name NVARCHAR(250),
   @value NVARCHAR(MAX),
   @productId UNIQUEIDENTIFIER
AS
BEGIN
    DECLARE @attribute TABLE(
        id INT
    )

    INSERT INTO Attributes 
    (
        [name],[value],[productId]
    )OUTPUT inserted.id INTO @attribute
    VALUES
    (
        @name,@value,@productId
    )

    -- Select rows from a Table or View '[TableOrViewName]' in schema '[dbo]'
    SELECT a.* 
    FROM Attributes a, @attribute ab 
    WHERE a.id = ab.id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddCategory]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[SP_AddCategory]
    @parentName NVARCHAR(250) = NULL,
    @name NVARCHAR(250),
    @slug NVARCHAR(250)
AS
BEGIN
    DECLARE @exist BIT
    SET @exist = ISNULL((
    SELECT 1 
    FROM Categories 
    WHERE Categories.name=@name
    GROUP BY Categories.name
    ),0);

    IF (@exist=0)
    BEGIN
        DECLARE @insertedCategory TABLE (
            id UNIQUEIDENTIFIER
        )
        IF @parentName IS NULL
        BEGIN
            INSERT INTO Categories
            (
                [name],[depth], [slug]
            ) OUTPUT inserted.id INTO @insertedCategory
            VALUES
            (
                @name,1,@slug
            )
        END
        ELSE
        BEGIN
            DECLARE @parentId UNIQUEIDENTIFIER
            DECLARE @depth INT

            SELECT @parentId = id,@depth = depth
            FROM Categories 
            WHERE @parentName = [name]

            INSERT INTO Categories
            (
                [parentId],[name],[depth],[slug]
            ) OUTPUT inserted.id INTO @insertedCategory
            VALUES
            (
                @parentId, @name, @depth+1, @slug
            )
        END
        DECLARE @categoryId UNIQUEIDENTIFIER
        SELECT @categoryId = id 
        FROM @insertedCategory
        SELECT * FROM Categories WHERE id = @categoryId
    END
    ELSE
    BEGIN
        SELECT TOP 1 * 
        FROM Categories 
        WHERE [name] = @name
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddPointForUser]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Create the stored procedure in the specified schema
CREATE   PROCEDURE [dbo].[SP_AddPointForUser]
    @email NVARCHAR(255),
    @basePoint INT
AS
BEGIN
    DECLARE @AccumulatePoint TABLE (
        id NVARCHAR(36)
    )

            INSERT INTO [dbo].[AccumulatePoint]
            ( -- Columns to insert data into
                [email],[basePoint]
            )
            OUTPUT inserted.id INTO @AccumulatePoint
            VALUES
            ( 
                @email,@basePoint
            )
    
    DECLARE @insertedId NVARCHAR(36)
    SET @insertedId = (
        SELECT id 
        FROM @AccumulatePoint
    )

    SELECT email, basePoint as 'totalPoint'
    FROM AccumulatePoint
    WHERE @email = email
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddPointForUser_Details]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[SP_AddPointForUser_Details]
    @orderId NVARCHAR(36),
    @totalPrice DECIMAL(18,2),
    @unit NVARCHAR(3)
AS
BEGIN
    DECLARE @AccumulatePoint TABLE (
        id NVARCHAR(36)
    )

            INSERT INTO [dbo].[AccumulatePoint_Details]
            ( -- Columns to insert data into
                [orderId],[totalPrice],[unit]
            )
            OUTPUT inserted.id INTO @AccumulatePoint
            VALUES
            ( 
                @orderId,@totalPrice,@unit
            )
    
    DECLARE @insertedId NVARCHAR(36)
    SET @insertedId = (
        SELECT id 
        FROM @AccumulatePoint
    )
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddProduct]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[SP_AddProduct]
    @name NVARCHAR(250),
    @briefDescription NVARCHAR(250),
    @detailDescription NVARCHAR(MAX),
    @price DECIMAL(18,0),
    @stock INT,
    @slug NVARCHAR(250),
    @unit NVARCHAR(3),
    @brandId UNIQUEIDENTIFIER
AS
BEGIN
    DECLARE  @insertedProduct TABLE (
        id NVARCHAR(36)
    )
    -- Insert rows into table 'Products' in schema '[dbo]'
    INSERT INTO [dbo].[Products]
    ( -- Columns to insert data into
    [name], [briefDescription],[detailDescription], [price], [stock], [unit], [slug], [brandId]
    )
    OUTPUT  inserted.id INTO @insertedProduct
    VALUES
    ( -- First row: values for the columns in the list above
    @name, @briefDescription,@detailDescription, @price, @stock, @unit, @slug, @brandId
    )

    SELECT * FROM Products,@insertedProduct ip
    WHERE Products.id = ip.id
    
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddProductToCategory]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[SP_AddProductToCategory]
    @productId UNIQUEIDENTIFIER,
    @categoryId UNIQUEIDENTIFIER
AS
BEGIN
    DECLARE @cateId UNIQUEIDENTIFIER
    DECLARE @depth INT
    DECLARE @parentId UNIQUEIDENTIFIER
    DECLARE @count INT 
    SET @count = 0

    SELECT @cateId = id, @depth = depth 
    FROM Categories 
    WHERE id = @categoryId

    WHILE @depth >= 1
    BEGIN
    -- Chua xong

        INSERT INTO [dbo].[CategoryProduct]
        ( 
         [productId], [categoryId]
        )
        VALUES
        (
         @productId,@cateId
        )

        SELECT @cateId = parentId 
        FROM Categories
        WHERE @cateId = id

        SET @depth = @depth - 1
        SET @count = @count + 1
    END
    SELECT * FROM Categories WHERE id = @categoryId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AdjustProductAmount]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[SP_AdjustProductAmount]
   @id UNIQUEIDENTIFIER,
   @amount INT
AS
BEGIN
    DECLARE @Updated TABLE (
        oldStock INT,
        newStock INT
    )

    UPDATE [dbo].[Products]
    SET
        [stock]=stock - @amount
    OUTPUT deleted.stock as 'oldStock', inserted.stock as 'newStock'
    INTO @Updated
    WHERE id = @id
    
    SELECT* FROM @Updated
    FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CalculatePointForUser]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Create the stored procedure in the specified schema
CREATE   PROCEDURE [dbo].[SP_CalculatePointForUser]
   @email NVARCHAR(36)
AS
BEGIN
    SELECT SUM(computePoint) as 'TotalPoint',COUNT(orderId) as 'TotalOrder'
    FROM AccumulatePoint
    WHERE @email =email
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CountProductByCategory]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[SP_CountProductByCategory]
   @id UNIQUEIDENTIFIER
AS
BEGIN
    SELECT COUNT(Products.id) AS 'count'
    FROM Products,CategoryProduct
    WHERE  [CategoryProduct].categoryId = @id
    AND CategoryProduct.productId = Products.id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllCategories]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetAllCategories]
AS
BEGIN
    SELECT *,(
        SELECT ISNULL(
            (SELECT *,(
                SELECT ISNULL(
                (SELECT *, (
                    SELECT ISNULL(
                    (
                    SELECT * 
                    FROM Categories ggc
                    WHERE ggc.parentId =gc.id
                    FOR JSON PATH
                    ),'[]')AS 'children'
                    )AS 'children'
                FROM Categories gc
                WHERE gc.parentId = c.id
                FOR JSON PATH)    
                ,'[]')
            )AS 'children' 
            FROM Categories c
            WHERE c.parentId = p.id
            FOR JSON PATH)
            ,'[]')
        )AS 'children' 
    FROM Categories p
    WHERE parentId IS NULL
    FOR JSON PATH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetProductById]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[SP_GetProductById]
    @productId UNIQUEIDENTIFIER
AS
BEGIN
    SELECT Products.id, Products.name, Products.briefDescription, Products.detailDescription, Products.stock, Products.price AS 'price.amount',Products.unit AS 'price.unit', Products.slug, Products.brandId,
    (
        SELECT Attributes.[name],Attributes.[value]
        FROM Attributes 
        WHERE Attributes.productId = Products.id
        FOR JSON PATH
    ) AS 'attributes',
    (
        SELECT Categories.name
        FROM CategoryProduct,Categories
        WHERE CategoryProduct.productId = Products.id
        AND Categories.id = Products.id
        FOR JSON PATH
    )AS'category'
    FROM Products
    WHERE Products.id = @productId
    FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetTotalPointForUser]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Create the stored procedure in the specified schema
CREATE   PROCEDURE [dbo].[SP_GetTotalPointForUser]
    @email NVARCHAR(255)
AS
BEGIN
        SELECT  distinct basePoint as 'totalPoint',COUNT(orderId) as 'totalOrder'
        FROM AccumulatePoint
        WHERE @email = email
        GROUP BY email,basePoint
END
GO
/****** Object:  StoredProcedure [dbo].[SP_IncreaseQuantity]    Script Date: 12/8/2021 11:04:31 PM ******/
/****** Object:  StoredProcedure [dbo].[SP_NameAutoSearch]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[SP_NameAutoSearch]
    @name NVARCHAR(250)
AS
BEGIN
   DECLARE @categoryName TABLE (
       categoryName NVARCHAR(250)
   )

   INSERT INTO @categoryName(categoryName)
    SELECT DISTINCT Categories.name
    FROM Categories,Products,CategoryProduct
    WHERE Products.name LIKE @name +'%'
    AND Products.id = CategoryProduct.productId
    AND Categories.id = CategoryProduct.categoryId
    AND Categories.depth = 1

    DECLARE @products TABLE(
        productId UNIQUEIDENTIFIER,
        productName NVARCHAR(250),
        categoryName NVARCHAR(250)
    )

    INSERT INTO @products(productId,productName,categoryName)
    SELECT Products.id,Products.name,cn.categoryName
    FROM Products,Categories,@categoryName cn,CategoryProduct
    WHERE Products.name LIKE @name+'%'
    AND Products.id = CategoryProduct.productId
    AND Categories.name = cn.categoryName
    AND CategoryProduct.categoryId = Categories.id
    
    SELECT cn.categoryName AS 'category',(
    SELECT p.productId as 'id',p.productName as 'name'
    FROM @products p
    WHERE p.categoryName = cn.categoryName
    FOR JSON PATH
    ) AS 'products'
    FROM @categoryName cn
    FOR JSON PATH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ProductCount]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[SP_ProductCount]
   @productName NVARCHAR(250)
AS
BEGIN
    SELECT COUNT(Products.id) AS 'total'
    FROM Products
    WHERE Products.name LIKE (ISNULL(@productName,'') +'%')
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ProductFilter]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[SP_ProductFilter]
    @productName NVARCHAR(250),
    @categoryId UNIQUEIDENTIFIER,
    @gt DECIMAL(18,0),
    @lt DECIMAL(18,0),
    @limit INT,
    @offset INT,
    @sort NVARCHAR(250),
    @order NVARCHAR(250),
    @brandId UNIQUEIDENTIFIER
    -- @cateSlug NVARCHAR(250)
AS
BEGIN

    DECLARE @products AS productsTemp
    DECLARE @jsonData NVARCHAR(MAX)
    DECLARE @maxPrice DECIMAL(18,0)
    INSERT INTO @products(id,total,maxPrice)
    SELECT Products.id, COUNT(Products.id) AS 'total', MAX(Products.price) as 'maxPrice'
    FROM Products, CategoryProduct
    WHERE Products.name LIKE (ISNULL(@productName,'') +'%')
    AND Products.id = CategoryProduct.productId
    AND ((@categoryId IS NULL) OR (CategoryProduct.categoryId = @categoryId))
    AND ((@gt IS NULL) OR (Products.price >= @gt))
    AND ((@lt IS NULL) OR (Products.price <= @lt))
    AND ((@brandId IS NULL) OR (Products.brandId = @brandId))
    GROUP BY Products.id


DECLARE @sqlCmd NVARCHAR(MAX)    
SET @sqlCmd = 
   'SET @json =(SELECT Products.id, Products.name, Products.briefDescription, Products.stock, Products.price AS ''price.amount'',Products.unit AS ''price.unit'', Products.slug, Products.brandId
    FROM Products
    WHERE Products.id IN (SELECT id FROM @products)
    ORDER BY Products.'+ ISNULL(LOWER(@sort),'id') +' '+ISNULL(UPPER(@order),'')+' 
    OFFSET '+CONVERT(NVARCHAR(250),@offset * @limit) +' ROWS 
    FETCH NEXT '+CONVERT(nvarchar(250),@limit) +' ROWS ONLY 
    FOR JSON PATH)'
    EXECUTE sp_executesql @sqlCmd,N'@products productsTemp READONLY,@json NVARCHAR(MAX) OUTPUT',@products, @json = @jsonData OUTPUT
    PRINT @jsonData

    DECLARE  @jsonTotal NVARCHAR(MAX)
    SET @jsonTotal = (
        SELECT COUNT(total) as 'total'
        FROM @products
        FOR JSON PATH,WITHOUT_ARRAY_WRAPPER)
    DECLARE @jsonMaxprice NVARCHAR(MAX)
    SET @jsonMaxprice = (
        SELECT MAX(maxPrice) as 'maxPrice'
        FROM @products
        FOR JSON PATH,WITHOUT_ARRAY_WRAPPER
    )
    
    SELECT ISNULL(JSON_QUERY(@jsonData),'[]') as 'data', JSON_QUERY(@jsonTotal) as 'pagination', JSON_QUERY(@jsonMaxprice) as 'meta'
    FOR JSON PATH,WITHOUT_ARRAY_WRAPPER
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCategoryProduct]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[SP_UpdateCategoryProduct]
    @productId UNIQUEIDENTIFIER,
    @categoryName NVARCHAR(250)
AS
BEGIN
    DELETE FROM [dbo].[CategoryProduct]
    WHERE productId = @productId
    
    EXEC SP_AddProductToCategory @productId,@categoryName
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetCategoryListForVendor]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[uspGetCategoryListForVendor]
    @brandId UNIQUEIDENTIFIER
AS
BEGIN
    DECLARE @product TABLE(
        id UNIQUEIDENTIFIER
    )
    INSERT INTO @product 
    SELECT id  FROM Products WHERE brandId = @brandId

    SELECT DISTINCT c.id , c.name 
    FROM @product p, CategoryProduct cp, Categories c
    WHERE p.id = cp.productId
    AND cp.categoryId = c.id
    AND c.[depth] = 1
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetNonUsdProduct]    Script Date: 12/8/2021 11:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[uspGetNonUsdProduct]
AS
BEGIN
    SELECT id, price, unit
    FROM Products
    WHERE Products.unit <> 'USD'
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.uspRemoveProduct
    @id UNIQUEIDENTIFIER
AS
BEGIN
    -- Delete rows from table '[TableName]' in schema '[dbo]'
    DELETE FROM [dbo].[CategoryProduct]
    WHERE productId = @id
    
    -- Delete rows from table '[TableName]' in schema '[dbo]'
    DELETE FROM [dbo].[Attributes]
    WHERE productId = @id
    
    SELECT * 
    FROM Products 
    WHERE id = @id

    -- Delete rows from table '[TableName]' in schema '[dbo]'
    DELETE FROM [dbo].[Products]
    WHERE id = @id
END
GO
