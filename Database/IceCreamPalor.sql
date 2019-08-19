USE [master]
GO
/****** Object:  Database [PrjiceCream]    Script Date: 04/08/2019 19:40:49 PM ******/
CREATE DATABASE [PrjiceCream]
ALTER DATABASE [PrjiceCream] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PrjiceCream].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PrjiceCream] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PrjiceCream] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PrjiceCream] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PrjiceCream] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PrjiceCream] SET ARITHABORT OFF 
GO
ALTER DATABASE [PrjiceCream] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PrjiceCream] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PrjiceCream] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PrjiceCream] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PrjiceCream] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PrjiceCream] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PrjiceCream] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PrjiceCream] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PrjiceCream] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PrjiceCream] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PrjiceCream] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PrjiceCream] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PrjiceCream] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PrjiceCream] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PrjiceCream] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PrjiceCream] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PrjiceCream] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PrjiceCream] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PrjiceCream] SET  MULTI_USER 
GO
ALTER DATABASE [PrjiceCream] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PrjiceCream] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PrjiceCream] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PrjiceCream] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PrjiceCream] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PrjiceCream]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 04/08/2019 19:40:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 04/08/2019 19:40:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CateId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 04/08/2019 19:40:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerEmail] [varchar](50) NULL,
	[CustomerPassword] [varchar](50) NULL,
	[CustomerName] [varchar](50) NULL,
	[CustomerPhone] [varchar](10) NULL,
	[CustomerAddress] [varchar](100) NULL,
	[DateRegister] [datetime] NULL,
	[CustomerRole] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 04/08/2019 19:40:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FeedBack](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[Subject] [varchar](50) NOT NULL,
	[Content] [varchar](30) NOT NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvoiceDetailBook]    Script Date: 04/08/2019 19:40:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetailBook](
	[InvoiceDetailId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[SubTotal] [float] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_InvoiceDetailBook] PRIMARY KEY CLUSTERED 
(
	[InvoiceDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Manufacture]    Script Date: 04/08/2019 19:40:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Manufacture](
	[ManuId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Email] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ManuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 04/08/2019 19:40:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](20) NOT NULL,
	[CustomerAddress] [varchar](30) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[Payment] [varchar](20) NOT NULL,
	[OrderStatus] [bit] NOT NULL,
	[Total] [int] NOT NULL,
	[CustomerId] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 04/08/2019 19:40:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CateId] [int] NOT NULL,
	[ManuId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Date] [date] NOT NULL,
	[Price] [float] NOT NULL,
	[Description] [varchar](1000) NOT NULL,
	[Image] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Recipes]    Script Date: 04/08/2019 19:40:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Recipes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NULL,
	[Content] [text] NULL,
	[Imag] [text] NULL,
	[LinkYT] [text] NULL,
	[Status] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Admin] ([Username], [Password]) VALUES (N'admin', N'123456')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CateId], [Name]) VALUES (1, N'Book')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [CustomerEmail], [CustomerPassword], [CustomerName], [CustomerPhone], [CustomerAddress], [DateRegister], [CustomerRole]) VALUES (1, N'phong2397@gmail.com', N'123456', N'Chau Thanh Phong', N'0123456781', N'331 Vung Tau', CAST(N'2019-07-23 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customer] ([CustomerId], [CustomerEmail], [CustomerPassword], [CustomerName], [CustomerPhone], [CustomerAddress], [DateRegister], [CustomerRole]) VALUES (2, N'kenzytien35@gmail.com', N'123456', N'mai hoang minh tien', N'1234567891', N'aishdoaisjdoias', CAST(N'2019-07-25 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Customer] ([CustomerId], [CustomerEmail], [CustomerPassword], [CustomerName], [CustomerPhone], [CustomerAddress], [DateRegister], [CustomerRole]) VALUES (3, N'hyouka@gmail.com', N'123456', N'mai hoang minh tien', N'0347669551', N'minhtien', CAST(N'2019-07-25 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Customer] ([CustomerId], [CustomerEmail], [CustomerPassword], [CustomerName], [CustomerPhone], [CustomerAddress], [DateRegister], [CustomerRole]) VALUES (4, N'kenzy@gmail.com', N'123456', N'Tien', N'0347669551', N'331 Vung Tau', CAST(N'2019-07-25 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Customer] ([CustomerId], [CustomerEmail], [CustomerPassword], [CustomerName], [CustomerPhone], [CustomerAddress], [DateRegister], [CustomerRole]) VALUES (6, N'tien6399@gmail.com', N'123456', N'mai hoang minh tien', N'0347669551', N'0347669551', CAST(N'2019-07-25 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customer] ([CustomerId], [CustomerEmail], [CustomerPassword], [CustomerName], [CustomerPhone], [CustomerAddress], [DateRegister], [CustomerRole]) VALUES (7, N'lam123@gmail.com', N'123456', N'Ly Tien Dat', N'0347669551', N'Ap Phong Phu', CAST(N'2019-07-26 00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[FeedBack] ON 

INSERT [dbo].[FeedBack] ([ContactId], [CustomerId], [Subject], [Content]) VALUES (1, NULL, N'Vani', N'Good')
INSERT [dbo].[FeedBack] ([ContactId], [CustomerId], [Subject], [Content]) VALUES (2, NULL, N'Book Dessert', N'Order faster than i think')
INSERT [dbo].[FeedBack] ([ContactId], [CustomerId], [Subject], [Content]) VALUES (3, NULL, N'Video', N'it''s made my all day')
INSERT [dbo].[FeedBack] ([ContactId], [CustomerId], [Subject], [Content]) VALUES (4, 1, N'Website', N'design eco with customer')
INSERT [dbo].[FeedBack] ([ContactId], [CustomerId], [Subject], [Content]) VALUES (11, NULL, N'dsadasda', N'dsadasda')
INSERT [dbo].[FeedBack] ([ContactId], [CustomerId], [Subject], [Content]) VALUES (12, 2, N'dsadads', N'dasdasda')
INSERT [dbo].[FeedBack] ([ContactId], [CustomerId], [Subject], [Content]) VALUES (13, 2, N'Website', N'Order faster than i think')
INSERT [dbo].[FeedBack] ([ContactId], [CustomerId], [Subject], [Content]) VALUES (14, NULL, N'Recipes Vanila', N'So delicous and easy for do it')
SET IDENTITY_INSERT [dbo].[FeedBack] OFF
SET IDENTITY_INSERT [dbo].[InvoiceDetailBook] ON 

INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (30, 21, 1, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (31, 22, 1, 50, 50, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (32, 21, 3, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (33, 22, 6, 50, 50, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (34, 6, 6, 105, 105, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (35, 17, 7, 130, 65, 2)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (36, 23, 8, 65, 65, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (37, 17, 8, 130, 65, 2)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (38, 17, 9, 65, 65, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (39, 11, 10, 95, 95, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (40, 18, 10, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (41, 17, 11, 65, 65, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (42, 24, 11, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (43, 21, 12, 150, 75, 2)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (44, 17, 12, 65, 65, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (45, 6, 13, 105, 105, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (46, 23, 14, 65, 65, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (47, 17, 14, 65, 65, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (48, 24, 15, 225, 75, 3)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (49, 13, 15, 50, 50, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (50, 21, 15, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (51, 18, 16, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (52, 19, 17, 50, 50, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (53, 20, 18, 130, 65, 2)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (54, 14, 19, 65, 65, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (55, 21, 19, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (56, 7, 20, 50, 50, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (57, 14, 20, 130, 65, 2)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (58, 19, 21, 50, 50, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (59, 11, 22, 95, 95, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (60, 23, 23, 65, 65, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (61, 20, 24, 65, 65, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (62, 18, 24, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (63, 20, 25, 65, 65, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (64, 21, 25, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (65, 18, 27, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (66, 10, 27, 85, 85, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (67, 19, 29, 50, 50, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (68, 23, 29, 65, 65, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (69, 19, 30, 50, 50, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (70, 10, 30, 85, 85, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (71, 15, 31, 150, 75, 2)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (72, 18, 31, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (73, 22, 32, 50, 50, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (74, 23, 33, 130, 65, 2)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (75, 11, 34, 95, 95, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (76, 18, 35, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (77, 5, 35, 95, 95, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (78, 3, 36, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (79, 24, 38, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (80, 24, 39, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (81, 24, 40, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (82, 23, 41, 65, 65, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (83, 22, 42, 50, 50, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (84, 24, 43, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (85, 24, 44, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (86, 24, 45, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (87, 24, 46, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (88, 22, 47, 50, 50, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (89, 22, 48, 50, 50, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (90, 24, 49, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (91, 24, 50, 75, 75, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (92, 17, 51, 65, 65, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (93, 23, 52, 130, 65, 2)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (94, 7, 53, 150, 50, 3)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (95, 23, 54, 65, 65, 1)
INSERT [dbo].[InvoiceDetailBook] ([InvoiceDetailId], [ProductId], [InvoiceId], [SubTotal], [Price], [Quantity]) VALUES (96, 22, 54, 50, 50, 1)
SET IDENTITY_INSERT [dbo].[InvoiceDetailBook] OFF
SET IDENTITY_INSERT [dbo].[Manufacture] ON 

INSERT [dbo].[Manufacture] ([ManuId], [Name], [Address], [Phone], [Email]) VALUES (1, N'HarperCollins', N'Ho Chi Minh City', N'0985147862', N'HarperCollins@gmail.com')
INSERT [dbo].[Manufacture] ([ManuId], [Name], [Address], [Phone], [Email]) VALUES (2, N'Penguin Random House UK', N'Ha Noi City', N'0904721684', N'prhuk@gmail.com')
INSERT [dbo].[Manufacture] ([ManuId], [Name], [Address], [Phone], [Email]) VALUES (3, N'Design Media Publishing Ltd', N'Da Nang City', N'0925417629', N'daphaco@gmail.com')
INSERT [dbo].[Manufacture] ([ManuId], [Name], [Address], [Phone], [Email]) VALUES (4, N'Penguin Random House US', N'Japan', N'0958412673', N'prhus@gmail.com')
INSERT [dbo].[Manufacture] ([ManuId], [Name], [Address], [Phone], [Email]) VALUES (5, N'Eiichiro Oda', N'Germany', N'0914752687', N'elichirooda@gmail.com')
INSERT [dbo].[Manufacture] ([ManuId], [Name], [Address], [Phone], [Email]) VALUES (6, N'Bloomsbury', N'Australia', N'0987156423', N'bloombury@gmail.com')
SET IDENTITY_INSERT [dbo].[Manufacture] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (1, N'Tien', N'331 Vung Tau', CAST(N'2019-07-25' AS Date), N'debit-card', 0, 125, 1)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (3, N'Chau Thanh Phong', N'12 Nguyen Kim', CAST(N'2019-07-25' AS Date), N'visa', 0, 75, 1)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (6, N'', N'', CAST(N'2019-07-25' AS Date), N'credit-card', 0, 155, 1)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (7, N'Chau Thanh Phong', N'12 Nguyen Kim', CAST(N'2019-07-25' AS Date), N'debit-card', 0, 130, 2)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (8, N'Chau Thanh Phong', N'12 Nguyen Kim', CAST(N'2019-07-26' AS Date), N'debit-card', 0, 195, 2)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (9, N'Chau Thanh Phong', N'12 Vinh Long', CAST(N'2019-07-26' AS Date), N'debit-card', 0, 65, 2)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (10, N'Chau Thanh Phong', N'331 Vung Tau', CAST(N'2019-07-26' AS Date), N'credit-card', 0, 170, 1)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (11, N'Chau Thanh Phong', N'12 Nguyen Kim', CAST(N'2019-07-26' AS Date), N'visa', 0, 140, 1)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (12, N'Tien', N'Dong nai', CAST(N'2019-07-26' AS Date), N'visa', 0, 215, 2)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (13, N'Chau Thanh Phong', N'331 Vung Tau', CAST(N'2019-07-26' AS Date), N'visa', 0, 105, 1)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (14, N'Chau Thanh Phong', N'12 Nguyen Kim', CAST(N'2019-07-26' AS Date), N'debit-card', 0, 130, 1)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (15, N'Tien', N'133 asd', CAST(N'2019-07-26' AS Date), N'credit-card', 0, 350, 2)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (16, N'Tien', N'133 asd', CAST(N'2019-07-26' AS Date), N'credit-card', 0, 75, 2)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (17, N'Chau Thanh Phong', N'12 Nguyen Kim', CAST(N'2019-07-26' AS Date), N'credit-card', 0, 50, 1)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (18, N'Chau Thanh Phong', N'12 Nguyen Kim', CAST(N'2019-07-26' AS Date), N'credit-card', 0, 130, 2)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (19, N'Ly Tien Dat', N'Ap Phong Phu', CAST(N'2019-07-26' AS Date), N'credit-card', 0, 140, 7)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (20, N'Tien', N'133 asd', CAST(N'2019-07-26' AS Date), N'visa', 0, 180, 6)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (21, N'Tien', N'12 Nguyen Kim', CAST(N'2019-07-26' AS Date), N'credit-card', 0, 50, 6)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (22, N'Chau Thanh Phong', N'12 Nguyen Kim', CAST(N'2019-07-26' AS Date), N'visa', 0, 95, 1)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (23, N'Chau Thanh Phong', N'12 Nguyen Kim', CAST(N'2019-07-26' AS Date), N'visa', 0, 65, 1)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (24, N'Chau Thanh Phong', N'12 Nguyen Kim', CAST(N'2019-07-26' AS Date), N'credit-card', 0, 140, 1)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (25, N'Lâm', N'12 Vinh Long', CAST(N'2019-07-26' AS Date), N'credit-card', 0, 140, 6)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (27, N'Tien', N'331 Vung Tau', CAST(N'2019-07-26' AS Date), N'credit-card', 0, 160, 6)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (29, N'Tien', N'dsdad', CAST(N'2019-07-26' AS Date), N'debit-card', 0, 115, 6)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (30, N'Tien', N'133 asd', CAST(N'2019-07-26' AS Date), N'credit-card', 0, 135, 6)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (31, N'Tien', N'Dong Nai', CAST(N'2019-07-26' AS Date), N'visa', 0, 225, 6)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (32, N'Chau Thanh Phong', N'12 Nguyen Kim', CAST(N'2019-07-27' AS Date), N'visa', 0, 50, 1)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (33, N'Chau Thanh Phong', N'331 Vung Tau', CAST(N'2019-07-27' AS Date), N'visa', 0, 130, 1)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (34, N'Chau Thanh Phong', N'331 Vung Tau', CAST(N'2019-07-29' AS Date), N'debit-card', 0, 95, 1)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (35, N'Chau Thanh Phong', N'Ap Phong Phu', CAST(N'2019-07-29' AS Date), N'visa', 0, 170, 1)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (36, N'Tien', N'sdadasd', CAST(N'2019-07-30' AS Date), N'visa', 0, 75, 2)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (38, N'Chau Thanh Phong', N'12 Nguyen Kim', CAST(N'2019-07-30' AS Date), N'credit-card', 0, 75, NULL)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (39, N'Tien', N'331 Vung Tau', CAST(N'2019-07-30' AS Date), N'credit-card', 0, 75, NULL)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (40, N'Tien', N'331 Vung Tau', CAST(N'2019-07-30' AS Date), N'credit-card', 0, 75, 2)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (41, N'Chau Thanh Phong', N'331 Vung Tau', CAST(N'2019-07-30' AS Date), N'debit-card', 0, 65, 2)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (42, N'Chau Thanh Phong', N'331 Vung Tau', CAST(N'2019-07-30' AS Date), N'credit-card', 0, 50, 2)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (43, N'Tien', N'100 CMT8', CAST(N'2019-07-30' AS Date), N'credit-card', 0, 75, 2)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (44, N'Tien', N'100 CMT8', CAST(N'2019-07-30' AS Date), N'credit-card', 0, 75, 2)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (45, N'Tien', N'100 CMT8', CAST(N'2019-07-30' AS Date), N'credit-card', 0, 75, 2)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (46, N'Tien', N'Ap Phong Phu', CAST(N'2019-07-30' AS Date), N'credit-card', 0, 75, 2)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (47, N'Chau Thanh Phong', N'12 Nguyen Kim', CAST(N'2019-07-30' AS Date), N'credit-card', 0, 50, 1)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (48, N'Chau Thanh Phong', N'12 Nguyen Kim', CAST(N'2019-07-30' AS Date), N'credit-card', 0, 50, 1)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (49, N'Chau Thanh Phong', N'12 Nguyen Kim', CAST(N'2019-07-30' AS Date), N'credit-card', 0, 75, 1)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (50, N'Chau Thanh Phong', N'12 Nguyen Kim', CAST(N'2019-07-30' AS Date), N'credit-card', 0, 75, 1)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (51, N'Dnag Vo Dan Linh', N'Dam Sen', CAST(N'2019-07-30' AS Date), N'visa', 0, 65, NULL)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (52, N'Phuong The Vi', N'12 Nguyen Kim', CAST(N'2019-07-30' AS Date), N'visa', 0, 130, NULL)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (53, N'Tien', N'Quan 12', CAST(N'2019-07-30' AS Date), N'debit-card', 0, 150, 2)
INSERT [dbo].[Order] ([InvoiceId], [CustomerName], [CustomerAddress], [OrderDate], [Payment], [OrderStatus], [Total], [CustomerId]) VALUES (54, N'Linh', N'Hoc Mon', CAST(N'2019-08-04' AS Date), N'visa', 0, 115, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (1, 1, 1, N'Queijadas', N'Wfafle', CAST(N'2017-02-07' AS Date), 50, N'Preheat oven to 325 degrees F (165 degrees C).
In a blender, combine eggs, sugar and butter. Blend until smooth. Pour in flour and milk, a little at a time, blending until smooth again. Stir in vanilla.
Pour into muffin tins, filling 3/4 full. Bake in preheated oven 45 minutes, until golden brown. Serve hot or cold.', N'/Images/1480.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (2, 1, 5, N'Brownie Cupcakes', N'Cupcake', CAST(N'2019-07-10' AS Date), 65, N'Preheat oven to 325 degrees F (165 degrees C). Line 18 cupcake cups with paper liners.
Melt butter and chocolate chips together in a saucepan over low heat, stirring until smooth; let cool.
Beat eggs and sugar together in a mixing bowl until thoroughly combined. Mix flour and vanilla extract into egg mixture. Fold in chocolate mixture until batter is smooth. Pour batter into prepared cupcake cups, filling them about 1/2 full.
Bake in the preheated oven until a toothpick inserted into the center of a cupcake comes out clean or with moist crumbs, about 30 minutes.', N'/Images/1120857.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (3, 1, 6, N'Fresh Strawberry Coffee Cake', N'Cake', CAST(N'2019-01-11' AS Date), 75, N'Preheat oven to 350 degrees F (175 degrees C). Grease a 9-inch baking pan.
Beat 1/4 cup butter in a bowl until creamy; add 3/4 cup sugar and egg. Beat until fully incorporated.
Mix 1 1/2 cup flour, baking powder, and salt together in a separate bowl. Stir flour mixture, alternating with milk, into butter mixture until combined. Pour batter into prepared baking pan. Arrange strawberries atop the batter.
Mix 1/2 cup flour, 1/2 cup sugar, 1/4 cup butter, and coconut together in a bowl. Sprinkle topping over strawberries.
Bake in the preheated oven until a toothpick inserted in the center of the cake comes out clean, about 35 minutes.', N'/Images/1018067.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (4, 1, 5, N'Homemade Melt-In-Your-Mouth Dark ', N'Chocolate', CAST(N'2018-11-08' AS Date), 85, N'Flavor by adding orange zest, peanut butter, dried coconut, chopped nuts, cinnamon, cayenne pepper, etc. to taste and consistency desired. Add after melting coconut oil, cocoa powder, honey, and vanilla together.
Maple syrup can be used in place of honey.
Number of servings depends on thickness of mold(s) used, as does set up time.
Not recommended for baking. Must be kept refrigerated.', N'/Images/1112044.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (5, 1, 1, N'Cake Mix Cookies VII', N'Cake', CAST(N'2019-07-06' AS Date), 95, N'Oxford Learner''s Pocket Dictionary: A Pocket-sized Reference to English Vocabulary (French Edition)

Up-to-date vocabulary with new words from British and American English Oxford 3000 keywords (the most important words to learn in English) are marked with a key symbol Corpus-based examples show how words are used Lots of help with irregular forms and spelling Explains thousands of idioms and phrasal verbs', N'/Images/2444026.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (6, 1, 6, N'Chef John''s Easy Apple Pie', N'Pie', CAST(N'2019-07-12' AS Date), 105, N'Preheat oven to 425 degrees F (220 degrees C).
Melt butter in saucepan over medium heat. Stir in white sugar, brown sugar, salt, cinnamon, and water. Bring the syrup to a boil, stirring constantly to dissolve sugar, then remove from heat.
Unroll pie crusts, press one into a 9-inch pie dish, and place the apples into the crust. Unroll the second crust on a work surface, and cut into about 8 1-inch wide strips. Criss-cross the strips over the apples, or weave into a lattice crust. Crimp the bottom crust over the lattice strips with your fingers. Spoon caramel sauce over pie, covering lattice portion of top crust; let remaining sauce drizzle through the crust.', N'/Images/1052119.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (7, 1, 4, N'Brigadeiro', N'Economics', CAST(N'2019-07-20' AS Date), 50, N'In a medium saucepan over medium heat, combine cocoa, butter and condensed milk. Cook, stirring, until thickened, about 10 minutes. Remove from heat and let rest until cool enough to handle. Form into small balls and eat at once or chill until serving.', N'/Images/5840958.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (8, 1, 1, N'Peach Cobbler VI', N'Cake', CAST(N'2019-07-02' AS Date), 65, N'Preheat oven to 400 degrees F (200 degrees C). Grease a 9x9-inch baking dish.
In a large bowl, combine flour, brown sugar, white sugar, baking powder, salt, and vanilla. Pour milk into dry ingredients, and then stir in melted margarine. Mix thoroughly.
Pour mixture into prepared baking pan. Arrange peaches on top and sprinkle with cinnamon. Bake in preheated oven until golden brown, about 30 minutes.', N'/Images/1101703.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (9, 1, 4, N'Banana Pudding IV', N'Pudding', CAST(N'2019-07-28' AS Date), 75, N'In a large bowl, beat cream cheese until fluffy. Beat in condensed milk, pudding mix, cold milk and vanilla until smooth. Fold in 1/2 of the whipped topping.
Line the bottom of a 9x13 inch dish with vanilla wafers. Arrange sliced bananas evenly over wafers. Spread with pudding mixture. Top with remaining whipped topping. Chill.', N'/Images/3066452.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (10, 1, 1, N'One Bowl Chocolate Cake III', N'Cake', CAST(N'2019-07-15' AS Date), 85, N'Preheat oven to 350 degrees F (175 degrees C). Grease and flour two nine inch round pans.
In a large bowl, stir together the sugar, flour, cocoa, baking powder, baking soda and salt. Add the eggs, milk, oil and vanilla, mix for 2 minutes on medium speed of mixer. Stir in the boiling water last. Batter will be thin. Pour evenly into the prepared pans.
Bake 30 to 35 minutes in the preheated oven, until the cake tests done with a toothpick. Cool in the pans for 10 minutes, then remove to a wire rack to cool completely.', N'/Images/708879.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (11, 1, 3, N'Milly''s Oatmeal Brownies', N'OATS', CAST(N'2019-05-09' AS Date), 95, N'Preheat oven to 350 degrees F (175 degrees C). Grease and flour a 9x13-inch baking pan.
In a large bowl, beat the butter, brown sugar, and white sugar until thoroughly mixed and creamy. Beat in the eggs, one at a time, mixing well after each addition. Stir in the vanilla extract until well mixed, and mix in salt, baking soda, baking powder, flour, rolled oats, plus chocolate chips, raisins, and chopped nuts if desired. Mix well to moisten all ingredients, and spread into the prepared baking pan.
Bake in the preheated oven until golden brown, 20 to 25 minutes. Let cool in the pan for about 5 minutes before cutting into bars.', N'/Images/849829.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (12, 1, 1, N'Chocolate Fudge Cookies', N'Cookies', CAST(N'2019-07-24' AS Date), 105, N'Preheat oven to 350 degrees F (175 degrees C). Grease cookie sheets.
In a medium bowl, stir together the cake mix, eggs and oil until well blended. Fold in the chocolate chips. Roll the dough into walnut sized balls. Place the cookies 2 inches apart on the cookie sheet.
Bake for 8 to 10 minutes in the preheated oven. Allow cookies to cool on baking sheet for 5 minutes before removing to a wire rack to cool completely.', N'/Images/2078257.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (13, 1, 1, N'Blackberry Cobbler II', N'Novel', CAST(N'2019-07-06' AS Date), 50, N'Preheat oven to 400 degrees F (200 degrees C). Line a baking sheet with aluminum foil.
In a large bowl, mix the flour, 1/2 cup sugar, baking powder, and salt. Cut in butter until the mixture resembles coarse crumbs. Stir in 1/4 cup boiling water just until mixture is evenly moist.
In a separate bowl, dissolve the cornstarch in cold water. Mix in remaining 1 cup sugar, lemon juice, and blackberries. Transfer to a cast iron skillet, and bring to a boil, stirring frequently. Drop dough into the skillet by spoonfuls. Place skillet on the foil lined baking sheet.
Bake 25 minutes in the preheated oven, until dough is golden brown.', N'/Images/5463715.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (14, 1, 2, N'Chocolate Delight', N'Cheesecake', CAST(N'2019-04-12' AS Date), 65, N'Milk and Honey is a collection of poetry and prose about survival. About the experience of violence, abuse, love, loss, and femininity.

The book is divided into four chapters, and each chapter serves a different purpose. Deals with a different pain. Heals a different heartache. Milk and Honey takes readers through a journey of the most bitter moments in life and finds sweetness in them because there is sweetness everywhere if you are just willing to look.', N'/Images/592566.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (15, 1, 3, N'Best Peanut Butter Cookies', N'Cookies', CAST(N'2019-07-13' AS Date), 75, N'Preheat oven to 350 degrees F (175 degrees C). Grease cookie sheets.
In a medium bowl, stir peanut butter and sugar together until smooth. Beat in the eggs, one at a time, then stir in the baking soda, salt, and vanilla. Roll dough into 1 inch balls and place them 2 inches apart onto the prepared cookie sheets. Press a criss-cross into the top using the back of a fork.
Bake for 8 to 10 minutes in the preheated oven. Allow cookies to cool on baking sheet for 5 minutes before removing to a wire rack to cool completely.', N'/Images/3620748.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (16, 1, 1, N'Momofuku Milk Bar', N'Milk', CAST(N'2019-07-04' AS Date), 50, N'The highly anticipated complement to the New York Times bestselling Momofuku cookbook, Momofuku Milk Bar reveals the recipes for the innovative, addictive cookies, pies, cakes, ice creams, and more from the wildly popular bakery.', N'/Images/2783679.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (17, 1, 2, N'Quick Whoopie Pies', N'Cookies', CAST(N'2019-07-22' AS Date), 65, N'Love whoopee pies but don''t have time to bake? Here''s a quick and easy recipe for making a delicious three-ingredient homemade filling for purchased soft cookies. (PS, there''s a peanut butter variation, too.)
ingredients
1/2 of an 8-ounce package reduced-fat cream cheese (Neufchatel), softened
1/4 cup butter, softened
1/2 of a 7-ounce jar marshmallow creme
12 soft chocolate cookies or your favorite soft cookies
directions
For filling, in a medium mixing bowl beat cream cheese and butter with an electric mixer on medium to high speed until smooth and fluffy. Fold in marshmallow creme.
Spread filling on bottoms of half of the cookies. Top with the remaining cookies, bottom sides down. For firmer filling, wrap and chill about 2 hours before serving.', N'/Images/ss_RU266155.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (18, 1, 3, N'Schaum Torte', N'Cake', CAST(N'2019-07-03' AS Date), 75, N'Our double-decker version of a Wisconsin supper club classic stacks two semisoft meringue "cake" layers, vanilla ice cream, whipped cream and fruit. You can make the whipped cream and meringue layers 24 hours ahead (tightly cover the latter). But wait to assemble the torte until right before serving--and invite plenty of friends. It''s a quick-to-melt, eat-it-all-at-once kind of dessert.', N'/Images/Schaum-Torte-RU303843.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (19, 1, 1, N'Easy Bittersweet Chocolate Tart', N'Tart', CAST(N'2019-02-13' AS Date), 50, N'While the crust bakes, finely chop 7 ounces of bittersweet chocolate. Set aside. Heat 1 cup half-and-half and 2 tablespoons sugar in a medium saucepan over medium-low heat, stirring occasionally. Simmer for 3 minutes, stirring constantly. Remove from heat. Add chocolate; stir until mixture is smooth and glossy. In a medium bowl, whisk 1 egg until foamy. Whisk 2 tablespoons of the warm chocolate mixture into the egg. Drizzling slowly, whisk in remaining chocolate mixture.

Tip: Janice recommends using good-quality chocolate that is  60 to 70 percent cacao. Chop into uniform small pieces for even melting. If flecks remain after stirring, return pan to low heat for a moment to finish.', N'/Images/pizzafruit.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (20, 1, 2, N'Valentine’s Day Marshmallow Treats', N'Marhmallow', CAST(N'2019-01-10' AS Date), 65, N'Dress up rice cereal hearts with frosting, pretzels, peanut butter, chocolate and other toppings for Valentine''s Day sweets.', N'/Images/550_RU269540_0.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (21, 1, 3, N'Kulfi', N'Oreo', CAST(N'2019-08-17' AS Date), 75, N'Combine evaporated milk, condensed milk and whipped topping in a blender and blend in pieces of bread until smooth. 
Pour mixture into a 9x13 inch baking dish or two plastic ice cube trays, sprinkle with cardamom and freeze for 8 hours or overnight.', N'/Images/india5.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (22, 1, 1, N'Kheer (Rice Pudding)', N'Cake', CAST(N'2018-09-06' AS Date), 50, N'Bring the coconut milk, milk and sugar to a boil in a large saucepan. Add Basmati rice, and simmer over low heat until the mixture thickens and the rice is tender, about 20 minutes.
Stir in the raisins, cardamom and rose water, and cook for a few more minutes. Ladle into serving bowls, and garnish with almonds and pistachios.', N'/Images/india3.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (23, 1, 4, N'Rasgullas', N'Cupcake', CAST(N'2019-01-03' AS Date), 65, N'I can’t even begin to contain my excitement over this coming summer. And not just because of berry season. This summer is going to be so jam packed with all the goodness that a toddler can bring!', N'/Images/india2.jpg')
INSERT [dbo].[Product] ([ProductId], [CateId], [ManuId], [Name], [Type], [Date], [Price], [Description], [Image]) VALUES (24, 1, 4, N'Indian Coconut Fudge', N'Tarts', CAST(N'2019-08-10' AS Date), 75, N'Grease a 9 inch pan. Stir together the coconut and condensed milk in a large, microwave-safe bowl. Cook on High in the microwave for 7 minutes, stirring every 30 seconds. When the coconut mixture is hot and bubbling, stir in the almonds and cardamom. Pour into the prepared pan, and smooth the top with a spatula.
Cool for 1 hour in the refrigerator, then cut into 1 inch squares with a greased knife.', N'/Images/india1.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Recipes] ON 

INSERT [dbo].[Recipes] ([Id], [Title], [Content], [Imag], [LinkYT], [Status]) VALUES (1, N'Vanilla Ice-Cream Recipe', N'Combine 1 1/2 cups heavy cream, 1 cup whole milk, 1/4 cup sugar', N'/Images/Vanilla.jpg', N'https://www.youtube.com/watch?v=6XwFsl2S9Ro', N'VIP')
INSERT [dbo].[Recipes] ([Id], [Title], [Content], [Imag], [LinkYT], [Status]) VALUES (2, N'Chocolate Ice-Cream Recipe', N'Combine sugar, milk, salt, and cocoa powder in a saucepan over medium heat', N'/Images/Chocolate.jpeg', N'https://www.youtube.com/watch?v=X9KBvedOAOE', N'Free')
INSERT [dbo].[Recipes] ([Id], [Title], [Content], [Imag], [LinkYT], [Status]) VALUES (4, N'Strawbery Ice-Cream Recipe', N'Can you tell that I’ve been on an ice cream kick lately? If you', N'/Images/strabery.jpeg', N'https://www.youtube.com/watch?v=xDW-BZuEIns', N'Free')
INSERT [dbo].[Recipes] ([Id], [Title], [Content], [Imag], [LinkYT], [Status]) VALUES (5, N'Chocolate Chip Ice-Cream Recipe', N'This ice cream version of the popular chocolate-flecked stracciatella gelato...', N'/Images/ChocoChip.jpeg', N'https://www.youtube.com/watch?v=X9KBvedOAOE', N'VIP')
INSERT [dbo].[Recipes] ([Id], [Title], [Content], [Imag], [LinkYT], [Status]) VALUES (6, N'Mango Ice-Cream Recipe', N'Combine the NESTLÉ MILKMAID Sweetened Condensed Milk, milk and mango puree in a bowl...', N'/Images/Mango.jpg', N'https://www.youtube.com/watch?v=QtLHSYbdCPI', N'Free')
INSERT [dbo].[Recipes] ([Id], [Title], [Content], [Imag], [LinkYT], [Status]) VALUES (17, N'Coffee Ice-Cream Recipe', N'David has provided helpful advice for me on practically every ice cream recipe on this...', N'https://www.seriouseats.com/recipes/images/2015/06/20150609-coffee-ice-cream-vicky-wasik-4.jpg', N'https://www.youtube.com/watch?v=AMMECm7Huhk', N'VIP')
INSERT [dbo].[Recipes] ([Id], [Title], [Content], [Imag], [LinkYT], [Status]) VALUES (18, N'Black Currant Ice-Cream Recipe', N'Looking for a new ice cream flavor? What about homemade blackcurrant ice cream?', N'http://www.tasty-indian-recipes.com/wp-content/uploads/2012/05/black-currant-ice-cream.jpg', N'https://www.youtube.com/watch?v=tyXaEBgSN0A', N'VIP')
INSERT [dbo].[Recipes] ([Id], [Title], [Content], [Imag], [LinkYT], [Status]) VALUES (19, N'Cherry Ice-Cream Recipe', N'Place the cherry juice, milk, yogurt, and heavy cream into the bowl of a blender. Add the', N'https://www.kitchentreaty.com/wp-content/uploads/2010/07/fresh-bing-cherry-ice-cream_square-660x430.jpg', N'https://www.youtube.com/watch?v=lQ_SaD3FUBo', N'VIP')
INSERT [dbo].[Recipes] ([Id], [Title], [Content], [Imag], [LinkYT], [Status]) VALUES (20, N'Butterscotch Ice Cream Recipe', N'Butter and brown sugar meld in this ice cream recipe to create delicious butterscotch', N'https://d1wv4dwa0ti2j0.cloudfront.net/live/img/production/detail/ice-cream/cartons_rich-creamy_butterscotch-swirl.jpg', N'https://www.youtube.com/watch?v=37ZC2edidm4', N'Free')
INSERT [dbo].[Recipes] ([Id], [Title], [Content], [Imag], [LinkYT], [Status]) VALUES (21, N'Walnut Ice-Cream Recipe', N'The walnuts do add a nice crunch and nuttiness to this recipe', N'https://www.seriouseats.com/recipes/images/2015/05/20150511-nut-ice-cream-vicky-wasik-6-1500x1125.jpg', N'https://www.youtube.com/watch?v=Ic4FdoBn7-M', N'Free')
INSERT [dbo].[Recipes] ([Id], [Title], [Content], [Imag], [LinkYT], [Status]) VALUES (22, N'Vanilla And Strawberry (two in one) Ice-Cream Recipe', N'CRUSH  55 wafers finely; place crumbs in medium bowl', N'http://sugarywinzy.com/wp-content/uploads/2015/12/SugaryWinzy-Strawberry-Vanilla-Ice-Cream-Duo.jpg', N'https://www.youtube.com/watch?v=iyypG7DMbIg', N'VIP')
INSERT [dbo].[Recipes] ([Id], [Title], [Content], [Imag], [LinkYT], [Status]) VALUES (23, N'Pistachio Ice-Cream Recipe', N'This recipe originally accompanied Warm Chocolate Soufflés with Pistachio Ice Cream', N'https://i0.wp.com/angsarap.net/wp-content/uploads/2013/01/pistachio-ice-cream.jpg', N'https://www.youtube.com/watch?v=7vmBnWlRQro', N'VIP')
INSERT [dbo].[Recipes] ([Id], [Title], [Content], [Imag], [LinkYT], [Status]) VALUES (24, N'Banana Ice-Cream Recipe', N'A few years ago I shared my favorite magic trick in the kitchen:', N'https://cdn.apartmenttherapy.info/image/fetch/f_auto,q_auto:eco,c_fill,g_auto,w_760/https://storage.googleapis.com/gen-atmedia/3/2014/07/c093b6c989030f71c0336df4b473b469e7a6dadb.jpeg', N'https://www.youtube.com/watch?v=fze-kncNLRY', N'VIP')
INSERT [dbo].[Recipes] ([Id], [Title], [Content], [Imag], [LinkYT], [Status]) VALUES (25, N'Banana Chocolate Chip Ice-Cream Recipe', N'his peanut butter banana ice cream with chocolate chips might sound indulgent', N'https://www.carolinescooking.com/wp-content/uploads/2017/07/Peanut-butter-banana-ice-cream-with-chocolate-chips-pic.jpg', N'https://www.youtube.com/watch?v=DnaP_VVCr3I', N'VIP')
INSERT [dbo].[Recipes] ([Id], [Title], [Content], [Imag], [LinkYT], [Status]) VALUES (26, N'Chocolate Almond Ice-Cream Recipe', N'Loaded with chopped almonds, chocolate chunks and a touch of sea salt,', N'https://reciperunner.com/wp-content/uploads/2016/07/Salted-Double-Chocolate-Almond-Ice-Cream.jpg', N'https://www.youtube.com/watch?v=pJSTBIYLIOU', N'VIP')
INSERT [dbo].[Recipes] ([Id], [Title], [Content], [Imag], [LinkYT], [Status]) VALUES (27, N'chocolate Truffle Ice-Cream Recipe', N'I think it would be difficult to find someone who disagrees with that statement.', N'https://i0.wp.com/lifecurrentsblog.com/wp-content/uploads/2011/09/IMG_3681_4.jpg?w=600&ssl=1', N'https://www.youtube.com/watch?v=6O5c8kZu5t4', N'VIP')
INSERT [dbo].[Recipes] ([Id], [Title], [Content], [Imag], [LinkYT], [Status]) VALUES (28, N'Kiwi Fruit Ice-Cream Recipe', N'Exotic kiwifruit, also known as Chinese gooseberries or simply "kiwi,"', N'https://www.thespruceeats.com/thmb/4KTLwmGfgWRWiV63bFqpIov9tmU=/960x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/scoop-of-kiwi-ice-cream-with-kiwi-slices-74352584-581a2ca43df78cc2e81ef713.jpg', N'https://www.youtube.com/watch?v=6ZlJigD0ToA', N'VIP')
INSERT [dbo].[Recipes] ([Id], [Title], [Content], [Imag], [LinkYT], [Status]) VALUES (29, N'Pineapple Ice-Cream Recipe', N'This homemade pineapple ice cream is inspired by Disney’s soft serve dole whip', N'https://onesweetappetite.com/wp-content/uploads/2018/07/Pineapple-Ice-Cream-One-Sweet-Appetite.jpg', N'https://www.youtube.com/watch?v=irBhq7H90kI', N'VIP')
INSERT [dbo].[Recipes] ([Id], [Title], [Content], [Imag], [LinkYT], [Status]) VALUES (30, N'Fruit And Nut Ice-Cream Recipe', N'This ultra-scrumptious no-churn Fruit & Nut ice cream has become a traditional treat in ', N'https://i1.wp.com/thekiwicook.com/wp-content/uploads/2013/12/018submitmed.jpg', N'https://www.youtube.com/watch?v=Qf4_A_o0mmQ', N'VIP')
INSERT [dbo].[Recipes] ([Id], [Title], [Content], [Imag], [LinkYT], [Status]) VALUES (31, N'Caramel Cashew Crunch Ice-Cream Recipe', N'Rich and creamy cashew infused ice cream swirled with caramel and packed with cashew', N'https://www.completelydelicious.com/wp-content/uploads/2015/06/caramel-cashew-ice-cream-4.jpg', N'https://www.youtube.com/watch?v=ROVOF8plrnA', N'VIP')
SET IDENTITY_INSERT [dbo].[Recipes] OFF
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK_FeedBack_Customer]
GO
ALTER TABLE [dbo].[InvoiceDetailBook]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetailBook_InvoiceDetailBook] FOREIGN KEY([InvoiceDetailId])
REFERENCES [dbo].[InvoiceDetailBook] ([InvoiceDetailId])
GO
ALTER TABLE [dbo].[InvoiceDetailBook] CHECK CONSTRAINT [FK_InvoiceDetailBook_InvoiceDetailBook]
GO
ALTER TABLE [dbo].[InvoiceDetailBook]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetailBook_Order] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Order] ([InvoiceId])
GO
ALTER TABLE [dbo].[InvoiceDetailBook] CHECK CONSTRAINT [FK_InvoiceDetailBook_Order]
GO
ALTER TABLE [dbo].[InvoiceDetailBook]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetailBook_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[InvoiceDetailBook] CHECK CONSTRAINT [FK_InvoiceDetailBook_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CateId])
REFERENCES [dbo].[Category] ([CateId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CateId])
REFERENCES [dbo].[Category] ([CateId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([ManuId])
REFERENCES [dbo].[Manufacture] ([ManuId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([ManuId])
REFERENCES [dbo].[Manufacture] ([ManuId])
GO
USE [master]
GO
ALTER DATABASE [PrjiceCream] SET  READ_WRITE 
GO
