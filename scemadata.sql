USE [Prn231_Project_Final]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Concessions]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concessions](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[StockQuantity] [int] NOT NULL,
	[CategoryId] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon_User]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon_User](
	[CouponId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreateAt] [datetime] NULL,
	[UpdateAt] [datetime] NULL,
 CONSTRAINT [PK_Coupon_User] PRIMARY KEY CLUSTERED 
(
	[CouponId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupons]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupons](
	[CouponId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Discount] [decimal](5, 2) NOT NULL,
	[ExpirationDate] [date] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CouponId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](15) NULL,
	[Address] [nvarchar](255) NULL,
	[JobTitle] [nvarchar](100) NULL,
	[Salary] [decimal](18, 2) NULL,
	[IsActive] [bit] NULL,
	[HireDate] [date] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiftCard_User]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiftCard_User](
	[GiftCardId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreateAt] [datetime] NULL,
	[UpdateAt] [datetime] NULL,
 CONSTRAINT [PK_GiftCard_User] PRIMARY KEY CLUSTERED 
(
	[GiftCardId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiftCards]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiftCards](
	[GiftCardId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Balance] [decimal](10, 2) NOT NULL,
	[ExpirationDate] [date] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[GiftCardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie_Categories]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie_Categories](
	[MovieId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieReviews]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieReviews](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[ReviewText] [nvarchar](max) NULL,
	[ReviewDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Duration] [int] NOT NULL,
	[ReleaseDate] [date] NULL,
	[Language] [nvarchar](100) NULL,
	[Director] [nvarchar](255) NULL,
	[Cast] [nvarchar](max) NULL,
	[AgeRating] [nvarchar](50) NULL,
	[TrailerUrl] [nvarchar](max) NULL,
	[PosterUrl] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](255) NULL,
	[PublishedDate] [datetime] NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Concessions]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Concessions](
	[OrderConcessionId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ConcessionId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderConcessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Status]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ShowtimeId] [int] NOT NULL,
	[SeatId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[OrderDate] [datetime] NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[IsPaid] [bit] NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[StatusId] [int] NOT NULL,
	[CouponId] [int] NULL,
	[GiftCardId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[TheaterId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[SeatCapacity] [int] NOT NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seats]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[SeatId] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NOT NULL,
	[SeatTypeId] [int] NOT NULL,
	[SeatNumber] [nvarchar](10) NOT NULL,
	[Row] [nvarchar](5) NOT NULL,
	[IsAvailable] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[SeatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeatTypes]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeatTypes](
	[SeatTypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](10, 2) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[SeatTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Showtimes]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Showtimes](
	[ShowtimeId] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ShowtimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Theaters]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Theaters](
	[TheaterId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](15) NULL,
	[OpeningHour] [nvarchar](100) NULL,
	[ClosingHour] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[TheaterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/31/2024 11:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](15) NULL,
	[City] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[IsActive] [bit] NULL,
	[RoleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (1, N'Action', N'High-energy scenes with physical stunts and chases', CAST(N'2024-10-29T22:20:57.860' AS DateTime), CAST(N'2024-10-29T22:20:57.860' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (2, N'Adventure', N'Exciting stories with new experiences or exotic locales', CAST(N'2024-10-29T22:20:57.860' AS DateTime), CAST(N'2024-10-29T22:20:57.860' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (3, N'Animation', N'Movies created using animation techniques', CAST(N'2024-10-29T22:20:57.860' AS DateTime), CAST(N'2024-10-29T22:20:57.860' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (4, N'Biography', N'Films based on the lives of real people', CAST(N'2024-10-29T22:20:57.860' AS DateTime), CAST(N'2024-10-29T22:20:57.860' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (5, N'Comedy', N'Light-hearted and humorous content', CAST(N'2024-10-29T22:20:57.860' AS DateTime), CAST(N'2024-10-29T22:20:57.860' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (6, N'Crime', N'Stories about criminal activities and their consequences', CAST(N'2024-10-29T22:20:57.860' AS DateTime), CAST(N'2024-10-29T22:20:57.860' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (7, N'Documentary', N'Non-fiction films that document reality', CAST(N'2024-10-29T22:20:57.860' AS DateTime), CAST(N'2024-10-29T22:20:57.860' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (8, N'Drama', N'Serious, plot-driven stories with realistic characters', CAST(N'2024-10-29T22:20:57.860' AS DateTime), CAST(N'2024-10-29T22:20:57.860' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (9, N'Family', N'Movies suitable for all ages', CAST(N'2024-10-29T22:20:57.860' AS DateTime), CAST(N'2024-10-29T22:20:57.860' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (10, N'Fantasy', N'Stories set in imaginary worlds with magical elements', CAST(N'2024-10-29T22:20:57.860' AS DateTime), CAST(N'2024-10-29T22:20:57.860' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (11, N'History', N'Films based on historical events', CAST(N'2024-10-29T22:20:57.860' AS DateTime), CAST(N'2024-10-29T22:20:57.860' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (12, N'Horror', N'Movies designed to scare and thrill', CAST(N'2024-10-29T22:20:57.860' AS DateTime), CAST(N'2024-10-29T22:20:57.860' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (13, N'Musical', N'Films that feature songs sung by the characters', CAST(N'2024-10-29T22:20:57.860' AS DateTime), CAST(N'2024-10-29T22:20:57.860' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (14, N'Mystery', N'Stories focused on solving a puzzle or crime', CAST(N'2024-10-29T22:20:57.860' AS DateTime), CAST(N'2024-10-29T22:20:57.860' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (15, N'Romance', N'Love stories', CAST(N'2024-10-29T22:20:57.860' AS DateTime), CAST(N'2024-10-29T22:20:57.860' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (16, N'Sci-Fi', N'Science fiction films with futuristic elements', CAST(N'2024-10-29T22:20:57.860' AS DateTime), CAST(N'2024-10-29T22:20:57.860' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (17, N'Sport', N'Movies centered around sports and athletes', CAST(N'2024-10-29T22:20:57.860' AS DateTime), CAST(N'2024-10-29T22:20:57.860' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (18, N'Thriller', N'Films designed to keep you on the edge of your seat', CAST(N'2024-10-29T22:20:57.860' AS DateTime), CAST(N'2024-10-29T22:20:57.860' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (19, N'War', N'Movies about warfare and military conflicts', CAST(N'2024-10-29T22:20:57.860' AS DateTime), CAST(N'2024-10-29T22:20:57.860' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Concessions] ON 

INSERT [dbo].[Concessions] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1, N'Popcorn', N'Classic buttered popcorn', CAST(5000.00 AS Decimal(18, 2)), 100, 1, 1, CAST(N'2024-10-29T22:21:04.290' AS DateTime), CAST(N'2024-10-29T22:21:04.290' AS DateTime))
INSERT [dbo].[Concessions] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (2, N'Soda', N'Refreshing carbonated drink', CAST(30000.00 AS Decimal(18, 2)), 200, 1, 1, CAST(N'2024-10-29T22:21:04.290' AS DateTime), CAST(N'2024-10-29T22:21:04.290' AS DateTime))
INSERT [dbo].[Concessions] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (3, N'Nachos', N'Crispy nachos with cheese dip', CAST(4500.00 AS Decimal(18, 2)), 50, 1, 1, CAST(N'2024-10-29T22:21:04.290' AS DateTime), CAST(N'2024-10-29T22:21:04.290' AS DateTime))
INSERT [dbo].[Concessions] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (4, N'Hot Dog', N'Grilled hot dog with condiments', CAST(6000.00 AS Decimal(18, 2)), 75, 1, 1, CAST(N'2024-10-29T22:21:04.290' AS DateTime), CAST(N'2024-10-29T22:21:04.290' AS DateTime))
INSERT [dbo].[Concessions] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (5, N'Candy', N'Assorted candy selection', CAST(2500.00 AS Decimal(18, 2)), 150, 1, 1, CAST(N'2024-10-29T22:21:04.290' AS DateTime), CAST(N'2024-10-29T22:21:04.290' AS DateTime))
INSERT [dbo].[Concessions] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (6, N'Ice Cream', N'Various flavors of ice cream', CAST(3500.00 AS Decimal(18, 2)), 80, 1, 1, CAST(N'2024-10-29T22:21:04.290' AS DateTime), CAST(N'2024-10-29T22:21:04.290' AS DateTime))
INSERT [dbo].[Concessions] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (7, N'Pretzel', N'Soft pretzel with salt', CAST(4000.00 AS Decimal(18, 2)), 60, 1, 1, CAST(N'2024-10-29T22:21:04.290' AS DateTime), CAST(N'2024-10-29T22:21:04.290' AS DateTime))
INSERT [dbo].[Concessions] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (8, N'Water', N'Bottled water', CAST(2000.00 AS Decimal(18, 2)), 100, 1, 1, CAST(N'2024-10-29T22:21:04.290' AS DateTime), CAST(N'2024-10-29T22:21:04.290' AS DateTime))
INSERT [dbo].[Concessions] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (9, N'Coffee', N'Hot brewed coffee', CAST(2500.00 AS Decimal(18, 2)), 50, 1, 1, CAST(N'2024-10-29T22:21:04.290' AS DateTime), CAST(N'2024-10-29T22:21:04.290' AS DateTime))
INSERT [dbo].[Concessions] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (10, N'Tea', N'Hot brewed tea', CAST(2500.00 AS Decimal(18, 2)), 50, 1, 1, CAST(N'2024-10-29T22:21:04.290' AS DateTime), CAST(N'2024-10-29T22:21:04.290' AS DateTime))
INSERT [dbo].[Concessions] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (11, N'Combo 1', N'Popcorn and Soda', CAST(7000.00 AS Decimal(18, 2)), 50, 1, 1, CAST(N'2024-10-29T22:21:04.290' AS DateTime), CAST(N'2024-10-29T22:21:04.290' AS DateTime))
INSERT [dbo].[Concessions] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (12, N'Combo 2', N'Nachos and Soda', CAST(6500.00 AS Decimal(18, 2)), 50, 1, 1, CAST(N'2024-10-29T22:21:04.290' AS DateTime), CAST(N'2024-10-29T22:21:04.290' AS DateTime))
INSERT [dbo].[Concessions] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (13, N'Combo 3', N'Hot Dog and Soda', CAST(8000.00 AS Decimal(18, 2)), 50, 1, 1, CAST(N'2024-10-29T22:21:04.290' AS DateTime), CAST(N'2024-10-29T22:21:04.290' AS DateTime))
INSERT [dbo].[Concessions] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (14, N'Combo 4', N'Popcorn, Soda, and Candy', CAST(9000.00 AS Decimal(18, 2)), 50, 1, 1, CAST(N'2024-10-29T22:21:04.290' AS DateTime), CAST(N'2024-10-29T22:21:04.290' AS DateTime))
INSERT [dbo].[Concessions] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (15, N'Combo 5', N'Nachos, Soda, and Candy', CAST(8500.00 AS Decimal(18, 2)), 50, 1, 1, CAST(N'2024-10-29T22:21:04.290' AS DateTime), CAST(N'2024-10-29T22:21:04.290' AS DateTime))
INSERT [dbo].[Concessions] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (16, N'Combo 6', N'Chicken and Cola', CAST(150000.00 AS Decimal(18, 2)), 100, NULL, 1, CAST(N'2024-10-30T00:29:27.537' AS DateTime), CAST(N'2024-10-30T00:29:27.537' AS DateTime))
SET IDENTITY_INSERT [dbo].[Concessions] OFF
GO
SET IDENTITY_INSERT [dbo].[Coupons] ON 

INSERT [dbo].[Coupons] ([CouponId], [Code], [Discount], [ExpirationDate], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (1, N'DISCOUNT10', CAST(10.00 AS Decimal(5, 2)), CAST(N'2025-12-31' AS Date), CAST(N'2024-10-29T22:21:24.747' AS DateTime), CAST(N'2024-10-29T22:21:24.747' AS DateTime), 1)
INSERT [dbo].[Coupons] ([CouponId], [Code], [Discount], [ExpirationDate], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (2, N'SAVE20', CAST(20.00 AS Decimal(5, 2)), CAST(N'2025-12-31' AS Date), CAST(N'2024-10-29T22:21:24.747' AS DateTime), CAST(N'2024-10-29T22:21:24.747' AS DateTime), 1)
INSERT [dbo].[Coupons] ([CouponId], [Code], [Discount], [ExpirationDate], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (3, N'WEEKDAY15', CAST(15.00 AS Decimal(5, 2)), CAST(N'2025-12-31' AS Date), CAST(N'2024-10-29T22:21:24.747' AS DateTime), CAST(N'2024-10-29T22:21:24.747' AS DateTime), 1)
INSERT [dbo].[Coupons] ([CouponId], [Code], [Discount], [ExpirationDate], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (4, N'KIDSPECIAL5', CAST(5.00 AS Decimal(5, 2)), CAST(N'2025-12-31' AS Date), CAST(N'2024-10-29T22:21:24.747' AS DateTime), CAST(N'2024-10-29T22:21:24.747' AS DateTime), 1)
INSERT [dbo].[Coupons] ([CouponId], [Code], [Discount], [ExpirationDate], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (5, N'WELCOME10', CAST(10.00 AS Decimal(5, 2)), CAST(N'2025-12-31' AS Date), CAST(N'2024-10-29T22:21:24.747' AS DateTime), CAST(N'2024-10-29T22:21:24.747' AS DateTime), 1)
INSERT [dbo].[Coupons] ([CouponId], [Code], [Discount], [ExpirationDate], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (6, N'MOVIE20', CAST(20.00 AS Decimal(5, 2)), CAST(N'2025-11-30' AS Date), CAST(N'2024-10-29T22:21:24.747' AS DateTime), CAST(N'2024-10-29T22:21:24.747' AS DateTime), 1)
INSERT [dbo].[Coupons] ([CouponId], [Code], [Discount], [ExpirationDate], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (7, N'HOLIDAY25', CAST(25.00 AS Decimal(5, 2)), CAST(N'2025-12-25' AS Date), CAST(N'2024-10-29T22:21:24.747' AS DateTime), CAST(N'2024-10-29T22:21:24.747' AS DateTime), 1)
INSERT [dbo].[Coupons] ([CouponId], [Code], [Discount], [ExpirationDate], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (8, N'WINTER20', CAST(20.00 AS Decimal(5, 2)), CAST(N'2025-12-31' AS Date), CAST(N'2024-10-29T22:21:24.747' AS DateTime), CAST(N'2024-10-29T22:21:24.747' AS DateTime), 1)
INSERT [dbo].[Coupons] ([CouponId], [Code], [Discount], [ExpirationDate], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (10, N'MAA', CAST(10.00 AS Decimal(5, 2)), NULL, CAST(N'2024-10-31T11:48:38.953' AS DateTime), CAST(N'2024-10-31T11:48:38.953' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Coupons] OFF
GO
SET IDENTITY_INSERT [dbo].[GiftCards] ON 

INSERT [dbo].[GiftCards] ([GiftCardId], [Code], [Balance], [ExpirationDate], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (1, N'GIFT100', CAST(100000.00 AS Decimal(10, 2)), CAST(N'2025-12-31' AS Date), CAST(N'2024-10-29T22:21:24.750' AS DateTime), CAST(N'2024-10-29T22:21:24.750' AS DateTime), 1)
INSERT [dbo].[GiftCards] ([GiftCardId], [Code], [Balance], [ExpirationDate], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (2, N'GIFT50', CAST(50000.00 AS Decimal(10, 2)), CAST(N'2025-12-31' AS Date), CAST(N'2024-10-29T22:21:24.750' AS DateTime), CAST(N'2024-10-29T22:21:24.750' AS DateTime), 1)
INSERT [dbo].[GiftCards] ([GiftCardId], [Code], [Balance], [ExpirationDate], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (3, N'GIFT25', CAST(25000.00 AS Decimal(10, 2)), CAST(N'2025-12-31' AS Date), CAST(N'2024-10-29T22:21:24.750' AS DateTime), CAST(N'2024-10-29T22:21:24.750' AS DateTime), 1)
INSERT [dbo].[GiftCards] ([GiftCardId], [Code], [Balance], [ExpirationDate], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (4, N'GIFT200', CAST(200000.00 AS Decimal(10, 2)), CAST(N'2025-12-31' AS Date), CAST(N'2024-10-29T22:21:24.750' AS DateTime), CAST(N'2024-10-29T22:21:24.750' AS DateTime), 1)
INSERT [dbo].[GiftCards] ([GiftCardId], [Code], [Balance], [ExpirationDate], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (5, N'GIFT150', CAST(150000.00 AS Decimal(10, 2)), CAST(N'2025-12-31' AS Date), CAST(N'2024-10-29T22:21:24.750' AS DateTime), CAST(N'2024-10-29T22:21:24.750' AS DateTime), 1)
INSERT [dbo].[GiftCards] ([GiftCardId], [Code], [Balance], [ExpirationDate], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (6, N'GIFT75', CAST(750000.00 AS Decimal(10, 2)), CAST(N'2025-12-31' AS Date), CAST(N'2024-10-29T22:21:24.750' AS DateTime), CAST(N'2024-10-29T22:21:24.750' AS DateTime), 1)
INSERT [dbo].[GiftCards] ([GiftCardId], [Code], [Balance], [ExpirationDate], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (7, N'GIFT300', CAST(300000.00 AS Decimal(10, 2)), CAST(N'2025-12-31' AS Date), CAST(N'2024-10-29T22:21:24.750' AS DateTime), CAST(N'2024-10-29T22:21:24.750' AS DateTime), 1)
INSERT [dbo].[GiftCards] ([GiftCardId], [Code], [Balance], [ExpirationDate], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (8, N'GIFT500', CAST(500000.00 AS Decimal(10, 2)), CAST(N'2025-12-31' AS Date), CAST(N'2024-10-29T22:21:24.750' AS DateTime), CAST(N'2024-10-29T22:21:24.750' AS DateTime), 1)
INSERT [dbo].[GiftCards] ([GiftCardId], [Code], [Balance], [ExpirationDate], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (9, N'GIFT10', CAST(10000.00 AS Decimal(10, 2)), CAST(N'2025-12-31' AS Date), CAST(N'2024-10-29T22:21:24.750' AS DateTime), CAST(N'2024-10-29T22:21:24.750' AS DateTime), 1)
INSERT [dbo].[GiftCards] ([GiftCardId], [Code], [Balance], [ExpirationDate], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (10, N'GIFT20', CAST(20000.00 AS Decimal(10, 2)), CAST(N'2025-12-31' AS Date), CAST(N'2024-10-29T22:21:24.750' AS DateTime), CAST(N'2024-10-29T22:21:24.750' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[GiftCards] OFF
GO
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (1, 1)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (1, 2)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (1, 16)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (2, 8)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (2, 12)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (3, 1)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (3, 2)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (3, 16)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (4, 1)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (4, 2)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (4, 8)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (5, 2)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (5, 10)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (5, 16)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (6, 1)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (6, 2)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (6, 16)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (7, 1)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (7, 5)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (7, 18)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (8, 5)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (8, 16)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (9, 2)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (9, 8)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (10, 2)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (10, 8)
INSERT [dbo].[Movie_Categories] ([MovieId], [CategoryId]) VALUES (10, 10)
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieId], [Title], [Description], [Duration], [ReleaseDate], [Language], [Director], [Cast], [AgeRating], [TrailerUrl], [PosterUrl], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (1, N'Venom: Let There Be Carnage', N'Eddie Brock attempts to reignite his career by interviewing serial killer Cletus Kasady, who becomes the host of the symbiote Carnage and escapes prison after a failed execution.', 109, CAST(N'2024-10-25' AS Date), N'English', N'Andy Serkis', N'Tom Hardy, Woody Harrelson, Michelle Williams', N'PG-13', N'https://www.youtube.com/watch?v=-ezfi6FQ8Ds', N'https://image.tmdb.org/t/p/original//rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg', CAST(N'2024-10-29T22:21:24.750' AS DateTime), CAST(N'2024-10-29T22:21:24.750' AS DateTime), 1)
INSERT [dbo].[Movies] ([MovieId], [Title], [Description], [Duration], [ReleaseDate], [Language], [Director], [Cast], [AgeRating], [TrailerUrl], [PosterUrl], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (2, N'A Quiet Place Part II', N'Following the events at home, the Abbott family now face the terrors of the outside world. Forced to venture into the unknown, they realize that the creatures that hunt by sound are not the only threats lurking beyond the sand path.', 97, CAST(N'2024-10-25' AS Date), N'English', N'John Krasinski', N'Emily Blunt, Millicent Simmonds, Cillian Murphy', N'PG-13', N'https://www.youtube.com/watch?v=BpdDN9d9Jio', N'https://image.tmdb.org/t/p/original//4q2hz2m8hubgvijz8Ez0T2Os2Yv.jpg', CAST(N'2024-10-29T22:21:24.750' AS DateTime), CAST(N'2024-10-29T22:21:24.750' AS DateTime), 1)
INSERT [dbo].[Movies] ([MovieId], [Title], [Description], [Duration], [ReleaseDate], [Language], [Director], [Cast], [AgeRating], [TrailerUrl], [PosterUrl], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (3, N'Black Widow', N'Natasha Romanoff, also known as Black Widow, confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises.', 134, CAST(N'2024-10-25' AS Date), N'English', N'Cate Shortland', N'Scarlett Johansson, Florence Pugh, David Harbour', N'PG-13', N'https://www.youtube.com/watch?v=Fp9pNPdNwjI', N'https://image.tmdb.org/t/p/original//qAZ0pzat24kLdO3o8ejmbLxyOac.jpg', CAST(N'2024-10-29T22:21:24.750' AS DateTime), CAST(N'2024-10-29T22:21:24.750' AS DateTime), 1)
INSERT [dbo].[Movies] ([MovieId], [Title], [Description], [Duration], [ReleaseDate], [Language], [Director], [Cast], [AgeRating], [TrailerUrl], [PosterUrl], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (4, N'No Time to Die', N'James Bond has left active service. His peace is short-lived when Felix Leiter, an old friend from the CIA, turns up asking for help, leading Bond onto the trail of a mysterious villain armed with dangerous new technology.', 163, CAST(N'2024-10-25' AS Date), N'English', N'Cary Joji Fukunaga', N'Daniel Craig, Rami Malek, Léa Seydoux', N'PG-13', N'https://www.youtube.com/watch?v=BIhNsAtPbPI', N'https://image.tmdb.org/t/p/original//iUgygt3fscRoKWCV1d0C7FbM9TP.jpg', CAST(N'2024-10-29T22:21:24.750' AS DateTime), CAST(N'2024-10-29T22:21:24.750' AS DateTime), 1)
INSERT [dbo].[Movies] ([MovieId], [Title], [Description], [Duration], [ReleaseDate], [Language], [Director], [Cast], [AgeRating], [TrailerUrl], [PosterUrl], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (5, N'Dune', N'Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people.', 155, CAST(N'2024-10-25' AS Date), N'English', N'Denis Villeneuve', N'Timothée Chalamet, Rebecca Ferguson, Zendaya', N'PG-13', N'https://www.youtube.com/watch?v=n9xhJrPXop4', N'https://image.tmdb.org/t/p/original//d5NXSklXo0qyIYkgV94XAgMIckC.jpg', CAST(N'2024-10-29T22:21:24.750' AS DateTime), CAST(N'2024-10-29T22:21:24.750' AS DateTime), 1)
INSERT [dbo].[Movies] ([MovieId], [Title], [Description], [Duration], [ReleaseDate], [Language], [Director], [Cast], [AgeRating], [TrailerUrl], [PosterUrl], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (6, N'Shang-Chi and the Legend of the Ten Rings', N'Shang-Chi, the master of weaponry-based Kung Fu, is forced to confront his past after being drawn into the Ten Rings organization.', 132, CAST(N'2024-10-25' AS Date), N'English', N'Destin Daniel Cretton', N'Simu Liu, Awkwafina, Tony Leung', N'PG-13', N'https://www.youtube.com/watch?v=8YjFbMbfXaQ', N'https://image.tmdb.org/t/p/original//1BIoJGKbXjdFDAqUEiA2VHqkK1Z.jpg', CAST(N'2024-10-29T22:21:24.750' AS DateTime), CAST(N'2024-10-29T22:21:24.750' AS DateTime), 1)
INSERT [dbo].[Movies] ([MovieId], [Title], [Description], [Duration], [ReleaseDate], [Language], [Director], [Cast], [AgeRating], [TrailerUrl], [PosterUrl], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (7, N'The Suicide Squad', N'Supervillains Harley Quinn, Bloodsport, Peacemaker, and a collection of nutty cons at Belle Reve prison join the super-secret, super-shady Task Force X as they are dropped off at the remote, enemy-infused island of Corto Maltese.', 132, CAST(N'2024-10-25' AS Date), N'English', N'James Gunn', N'Margot Robbie, Idris Elba, John Cena', N'R', N'https://www.youtube.com/watch?v=JuDLepNa7hw', N'https://image.tmdb.org/t/p/original//kb4s0ML0iVZlG6wAKbbs9NAm6X.jpg', CAST(N'2024-10-29T22:21:24.750' AS DateTime), CAST(N'2024-10-29T22:21:24.750' AS DateTime), 1)
INSERT [dbo].[Movies] ([MovieId], [Title], [Description], [Duration], [ReleaseDate], [Language], [Director], [Cast], [AgeRating], [TrailerUrl], [PosterUrl], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (8, N'Free Guy', N'A bank teller discovers that he is actually an NPC inside a brutal, open world video game.', 115, CAST(N'2024-10-25' AS Date), N'English', N'Shawn Levy', N'Ryan Reynolds, Jodie Comer, Taika Waititi', N'PG-13', N'https://www.youtube.com/watch?v=cttnRmcr_ME', N'https://image.tmdb.org/t/p/original//xmbU4JTUm8rsdtn7Y3Fcm30GpeT.jpg', CAST(N'2024-10-29T22:21:24.750' AS DateTime), CAST(N'2024-10-29T22:21:24.750' AS DateTime), 0)
INSERT [dbo].[Movies] ([MovieId], [Title], [Description], [Duration], [ReleaseDate], [Language], [Director], [Cast], [AgeRating], [TrailerUrl], [PosterUrl], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (9, N'Jungle Cruise', N'Dr. Lily Houghton enlists the aid of wisecracking skipper Frank Wolff to take her down the Amazon in his dilapidated boat. Together, they search for an ancient tree that holds the power to heal – a discovery that will change the future of medicine.', 127, CAST(N'2024-10-25' AS Date), N'English', N'Jaume Collet-Serra', N'Dwayne Johnson, Emily Blunt, Edgar Ramírez', N'PG-13', N'https://www.youtube.com/watch?v=f_HvoipFcA8', N'https://image.tmdb.org/t/p/original//9dKCd55IuTT5QRs989m9Qlb7d2B.jpg', CAST(N'2024-10-29T22:21:24.750' AS DateTime), CAST(N'2024-10-29T22:21:24.750' AS DateTime), 0)
INSERT [dbo].[Movies] ([MovieId], [Title], [Description], [Duration], [ReleaseDate], [Language], [Director], [Cast], [AgeRating], [TrailerUrl], [PosterUrl], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (10, N'The Green Knight', N'A fantasy re-telling of the medieval story of Sir Gawain and the Green Knight.', 130, CAST(N'2024-10-25' AS Date), N'English', N'David Lowery', N'Dev Patel, Alicia Vikander, Joel Edgerton', N'R', N'https://www.youtube.com/watch?v=sS6ksY8xWCY', N'https://image.tmdb.org/t/p/original//xZ2KER2gOHbuHP2GJoODuXDSZCb.jpg', CAST(N'2024-10-29T22:21:24.750' AS DateTime), CAST(N'2024-10-29T22:21:24.750' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsId], [Title], [Content], [Author], [PublishedDate], [ImageUrl], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1, N'Special Discount: Get 10% Off!', N'Enjoy a special discount with the code DISCOUNT10! Get 10% off on all items. This offer is valid until December 31, 2025. Don’t miss out on this fantastic opportunity to save!', N'Don Quixote', CAST(N'2024-10-29T22:21:24.767' AS DateTime), N'https://example.com/images/discount10.jpg', 1, CAST(N'2024-10-29T22:21:24.767' AS DateTime), CAST(N'2024-10-29T22:21:24.767' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Content], [Author], [PublishedDate], [ImageUrl], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (2, N'Save Big: 20% Off on All Purchases!', N'Use the code SAVE20 to get 20% off on all purchases. This offer is valid until December 31, 2025. Shop now and save big on your favorite items!', N'Don Quixote', CAST(N'2024-10-29T22:21:24.767' AS DateTime), N'https://example.com/images/save20.jpg', 1, CAST(N'2024-10-29T22:21:24.767' AS DateTime), CAST(N'2024-10-29T22:21:24.767' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Content], [Author], [PublishedDate], [ImageUrl], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (3, N'Weekday Special: 15% Off!', N'Make your weekdays special with a 15% discount! Use the code WEEKDAY15 to enjoy this offer. Valid until December 31, 2025. Don’t miss out on this weekday treat!', N'Don Quixote', CAST(N'2024-10-29T22:21:24.767' AS DateTime), N'https://example.com/images/weekday15.jpg', 1, CAST(N'2024-10-29T22:21:24.767' AS DateTime), CAST(N'2024-10-29T22:21:24.767' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Content], [Author], [PublishedDate], [ImageUrl], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (4, N'Kids Special: 5% Off on Kids Items!', N'Get 5% off on all kids items with the code KIDSPECIAL5. This offer is valid until December 31, 2025. Shop now and save on your kids’ favorite items!', N'Don Quixote', CAST(N'2024-10-29T22:21:24.767' AS DateTime), N'https://example.com/images/kidspecial5.jpg', 1, CAST(N'2024-10-29T22:21:24.767' AS DateTime), CAST(N'2024-10-29T22:21:24.767' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Content], [Author], [PublishedDate], [ImageUrl], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (5, N'Welcome Offer: Get 10% Off Your First Purchase!', N'We are excited to welcome new customers with a special offer! Use the code WELCOME10 to get 10% off your first purchase. This offer is valid until December 31, 2025. Don’t miss out on this fantastic opportunity to save on your favorite items!', N'Don Quixote', CAST(N'2024-10-29T22:21:24.767' AS DateTime), N'https://example.com/images/welcome10.jpg', 1, CAST(N'2024-10-29T22:21:24.767' AS DateTime), CAST(N'2024-10-29T22:21:24.767' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Content], [Author], [PublishedDate], [ImageUrl], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (6, N'Movie Night Special: 20% Off Tickets!', N'Make your movie night even more special with a 20% discount on tickets! Use the code MOVIE20 to avail this offer. Valid until November 30, 2025. Book your tickets now and enjoy the show!', N'Don Quixote', CAST(N'2024-10-29T22:21:24.767' AS DateTime), N'https://example.com/images/movie20.jpg', 1, CAST(N'2024-10-29T22:21:24.767' AS DateTime), CAST(N'2024-10-29T22:21:24.767' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Content], [Author], [PublishedDate], [ImageUrl], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (7, N'Holiday Special: 25% Off on All Purchases!', N'Celebrate the holiday season with a special discount! Use the code HOLIDAY25 to get 25% off on all purchases. This offer is valid until December 25, 2025. Happy Holidays!', N'Don Quixote', CAST(N'2024-10-29T22:21:24.767' AS DateTime), N'https://example.com/images/holiday25.jpg', 1, CAST(N'2024-10-29T22:21:24.767' AS DateTime), CAST(N'2024-10-29T22:21:24.767' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Content], [Author], [PublishedDate], [ImageUrl], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (8, N'Winter Sale: Get 20% Off!', N'Stay warm this winter with a special discount! Use the code WINTER20 to get 20% off on all items. This offer is valid until December 31, 2025. Shop now and save big!', N'Don Quixote', CAST(N'2024-10-29T22:21:24.770' AS DateTime), N'https://example.com/images/winter20.jpg', 1, CAST(N'2024-10-29T22:21:24.770' AS DateTime), CAST(N'2024-10-29T22:21:24.770' AS DateTime))
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Concessions] ON 

INSERT [dbo].[Order_Concessions] ([OrderConcessionId], [OrderId], [ConcessionId], [Quantity], [Price]) VALUES (1, 3, 1, 1, CAST(50000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Order_Concessions] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Status] ON 

INSERT [dbo].[Order_Status] ([StatusId], [StatusName]) VALUES (1, N'Active')
INSERT [dbo].[Order_Status] ([StatusId], [StatusName]) VALUES (2, N'Used')
INSERT [dbo].[Order_Status] ([StatusId], [StatusName]) VALUES (3, N'Canceled')
INSERT [dbo].[Order_Status] ([StatusId], [StatusName]) VALUES (4, N'NotPay')
SET IDENTITY_INSERT [dbo].[Order_Status] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ShowtimeId], [SeatId], [Quantity], [Price]) VALUES (2, 3, 1, 1, 1, CAST(50000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [TotalAmount], [IsPaid], [PaymentMethod], [StatusId], [CouponId], [GiftCardId]) VALUES (3, 3, CAST(N'2024-10-30T00:00:00.000' AS DateTime), CAST(100000.00 AS Decimal(18, 2)), 1, N'Cash', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Staff')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Admin')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'Customer')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([RoomId], [TheaterId], [Name], [SeatCapacity], [IsActive]) VALUES (1, 1, N'Room A', 56, 1)
INSERT [dbo].[Rooms] ([RoomId], [TheaterId], [Name], [SeatCapacity], [IsActive]) VALUES (2, 1, N'Room B IMAX', 56, 1)
INSERT [dbo].[Rooms] ([RoomId], [TheaterId], [Name], [SeatCapacity], [IsActive]) VALUES (3, 1, N'Room C 4D', 56, 1)
INSERT [dbo].[Rooms] ([RoomId], [TheaterId], [Name], [SeatCapacity], [IsActive]) VALUES (4, 1, N'Room D Dolby Atmos', 25, 1)
INSERT [dbo].[Rooms] ([RoomId], [TheaterId], [Name], [SeatCapacity], [IsActive]) VALUES (5, 1, N'Room E D-Box', 25, 1)
INSERT [dbo].[Rooms] ([RoomId], [TheaterId], [Name], [SeatCapacity], [IsActive]) VALUES (6, 2, N'Room A', 56, 1)
INSERT [dbo].[Rooms] ([RoomId], [TheaterId], [Name], [SeatCapacity], [IsActive]) VALUES (7, 2, N'Room B 4D', 56, 1)
INSERT [dbo].[Rooms] ([RoomId], [TheaterId], [Name], [SeatCapacity], [IsActive]) VALUES (8, 2, N'Room C IMAX', 56, 1)
INSERT [dbo].[Rooms] ([RoomId], [TheaterId], [Name], [SeatCapacity], [IsActive]) VALUES (9, 2, N'Room D VIP', 25, 1)
INSERT [dbo].[Rooms] ([RoomId], [TheaterId], [Name], [SeatCapacity], [IsActive]) VALUES (10, 2, N'Room E Laser Projection', 100, 1)
INSERT [dbo].[Rooms] ([RoomId], [TheaterId], [Name], [SeatCapacity], [IsActive]) VALUES (11, 3, N'Room A', 56, 1)
INSERT [dbo].[Rooms] ([RoomId], [TheaterId], [Name], [SeatCapacity], [IsActive]) VALUES (12, 3, N'Room B', 56, 1)
INSERT [dbo].[Rooms] ([RoomId], [TheaterId], [Name], [SeatCapacity], [IsActive]) VALUES (13, 3, N'Room C IMAX', 56, 1)
INSERT [dbo].[Rooms] ([RoomId], [TheaterId], [Name], [SeatCapacity], [IsActive]) VALUES (14, 3, N'Room D ScreenX', 25, 1)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[Seats] ON 

INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (1, 1, 1, N'A1', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (2, 1, 1, N'A2', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (3, 1, 1, N'A7', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (4, 1, 1, N'A8', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (5, 1, 1, N'B1', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (6, 1, 1, N'B2', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (7, 1, 1, N'B7', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (8, 1, 1, N'B8', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (9, 1, 1, N'C1', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (10, 1, 1, N'C2', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (11, 1, 1, N'C7', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (12, 1, 1, N'C8', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (13, 1, 1, N'D1', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (14, 1, 1, N'D2', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (15, 1, 1, N'D7', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (16, 1, 1, N'D8', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (17, 1, 1, N'E1', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (18, 1, 1, N'E2', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (19, 1, 1, N'E7', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (20, 1, 1, N'E8', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (21, 1, 1, N'F1', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (22, 1, 1, N'F2', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (23, 1, 1, N'F7', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (24, 1, 1, N'F8', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (25, 1, 1, N'G1', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (26, 1, 1, N'G2', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (27, 1, 1, N'G7', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (28, 1, 1, N'G8', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (29, 1, 2, N'A3', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (30, 1, 2, N'A4', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (31, 1, 2, N'A5', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (32, 1, 2, N'A6', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (33, 1, 2, N'B3', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (34, 1, 2, N'B4', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (35, 1, 2, N'B5', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (36, 1, 2, N'B6', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (37, 1, 2, N'C3', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (38, 1, 2, N'C4', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (39, 1, 2, N'C5', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (40, 1, 2, N'C6', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (41, 1, 2, N'D3', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (42, 1, 2, N'D4', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (43, 1, 2, N'D5', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (44, 1, 2, N'D6', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (45, 1, 3, N'E3', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (46, 1, 3, N'E4', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (47, 1, 3, N'E5', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (48, 1, 3, N'E6', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (49, 1, 3, N'F3', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (50, 1, 3, N'F4', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (51, 1, 3, N'F5', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (52, 1, 3, N'F6', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (53, 1, 3, N'G3', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (54, 1, 3, N'G4', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (55, 1, 3, N'G5', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (56, 1, 3, N'G6', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (57, 1, 4, N'A1', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (58, 1, 4, N'A2', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (59, 1, 4, N'A7', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (60, 1, 4, N'A8', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (61, 1, 4, N'B1', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (62, 1, 4, N'B2', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (63, 1, 4, N'B7', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (64, 1, 4, N'B8', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (65, 1, 4, N'C1', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (66, 1, 4, N'C2', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (67, 1, 4, N'C7', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (68, 1, 4, N'C8', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (69, 1, 4, N'D1', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (70, 1, 4, N'D2', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (71, 1, 4, N'D7', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (72, 1, 4, N'D8', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (73, 1, 4, N'E1', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (74, 1, 4, N'E2', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (75, 1, 4, N'E7', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (76, 1, 4, N'E8', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (77, 1, 4, N'F1', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (78, 1, 4, N'F2', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (79, 1, 4, N'F7', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (80, 1, 4, N'F8', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (81, 1, 4, N'G1', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (82, 1, 4, N'G2', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (83, 1, 4, N'G7', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (84, 1, 4, N'G8', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (85, 2, 4, N'A1', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (86, 2, 4, N'A2', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (87, 2, 4, N'A7', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (88, 2, 4, N'A8', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (89, 2, 4, N'B1', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (90, 2, 4, N'B2', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (91, 2, 4, N'B7', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (92, 2, 4, N'B8', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (93, 2, 4, N'C1', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (94, 2, 4, N'C2', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (95, 2, 4, N'C7', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (96, 2, 4, N'C8', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (97, 2, 4, N'D1', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (98, 2, 4, N'D2', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (99, 2, 4, N'D7', N'D', 1)
GO
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (100, 2, 4, N'D8', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (101, 2, 4, N'E1', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (102, 2, 4, N'E2', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (103, 2, 4, N'E7', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (104, 2, 4, N'E8', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (105, 2, 4, N'F1', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (106, 2, 4, N'F2', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (107, 2, 4, N'F7', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (108, 2, 4, N'F8', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (109, 2, 4, N'G1', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (110, 2, 4, N'G2', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (111, 2, 4, N'G7', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (112, 2, 4, N'G8', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (113, 2, 5, N'A3', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (114, 2, 5, N'A4', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (115, 2, 5, N'A5', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (116, 2, 5, N'A6', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (117, 2, 5, N'B3', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (118, 2, 5, N'B4', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (119, 2, 5, N'B5', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (120, 2, 5, N'B6', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (121, 2, 5, N'C3', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (122, 2, 5, N'C4', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (123, 2, 5, N'C5', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (124, 2, 5, N'C6', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (125, 2, 5, N'D3', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (126, 2, 5, N'D4', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (127, 2, 5, N'D5', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (128, 2, 5, N'D6', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (129, 2, 6, N'E3', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (130, 2, 6, N'E4', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (131, 2, 6, N'E5', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (132, 2, 6, N'E6', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (133, 2, 6, N'F3', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (134, 2, 6, N'F4', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (135, 2, 6, N'F5', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (136, 2, 6, N'F6', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (137, 2, 6, N'G3', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (138, 2, 6, N'G4', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (139, 2, 6, N'G5', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (140, 2, 6, N'G6', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (141, 3, 7, N'A1', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (142, 3, 7, N'A2', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (143, 3, 7, N'A7', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (144, 3, 7, N'A8', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (145, 3, 7, N'B1', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (146, 3, 7, N'B2', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (147, 3, 7, N'B7', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (148, 3, 7, N'B8', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (149, 3, 7, N'C1', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (150, 3, 7, N'C2', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (151, 3, 7, N'C7', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (152, 3, 7, N'C8', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (153, 3, 7, N'D1', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (154, 3, 7, N'D2', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (155, 3, 7, N'D7', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (156, 3, 7, N'D8', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (157, 3, 7, N'E1', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (158, 3, 7, N'E2', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (159, 3, 7, N'E7', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (160, 3, 7, N'E8', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (161, 3, 7, N'F1', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (162, 3, 7, N'F2', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (163, 3, 7, N'F7', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (164, 3, 7, N'F8', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (165, 3, 7, N'G1', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (166, 3, 7, N'G2', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (167, 3, 7, N'G7', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (168, 3, 7, N'G8', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (169, 3, 8, N'A3', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (170, 3, 8, N'A4', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (171, 3, 8, N'A5', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (172, 3, 8, N'A6', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (173, 3, 8, N'B3', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (174, 3, 8, N'B4', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (175, 3, 8, N'B5', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (176, 3, 8, N'B6', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (177, 3, 8, N'C3', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (178, 3, 8, N'C4', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (179, 3, 8, N'C5', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (180, 3, 8, N'C6', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (181, 3, 8, N'D3', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (182, 3, 8, N'D4', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (183, 3, 8, N'D5', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (184, 3, 8, N'D6', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (185, 3, 9, N'E3', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (186, 3, 9, N'E4', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (187, 3, 9, N'E5', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (188, 3, 9, N'E6', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (189, 3, 9, N'F3', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (190, 3, 9, N'F4', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (191, 3, 9, N'F5', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (192, 3, 9, N'F6', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (193, 3, 9, N'G3', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (194, 3, 9, N'G4', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (195, 3, 9, N'G5', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (196, 3, 9, N'G6', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (197, 4, 10, N'A1', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (198, 4, 10, N'A2', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (199, 4, 10, N'A3', N'A', 1)
GO
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (200, 4, 10, N'A4', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (201, 4, 10, N'A5', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (202, 4, 10, N'B1', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (203, 4, 10, N'B2', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (204, 4, 10, N'B3', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (205, 4, 10, N'B4', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (206, 4, 10, N'B5', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (207, 4, 10, N'C1', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (208, 4, 10, N'C2', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (209, 4, 10, N'C3', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (210, 4, 10, N'C4', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (211, 4, 10, N'C5', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (212, 4, 11, N'D1', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (213, 4, 11, N'D2', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (214, 4, 11, N'D3', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (215, 4, 11, N'D4', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (216, 4, 11, N'D5', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (217, 4, 11, N'E1', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (218, 4, 11, N'E2', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (219, 4, 11, N'E3', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (220, 4, 11, N'E4', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (221, 4, 11, N'E5', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (222, 5, 16, N'A1', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (223, 5, 16, N'A2', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (224, 5, 16, N'A3', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (225, 5, 16, N'A4', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (226, 5, 16, N'A5', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (227, 5, 16, N'B1', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (228, 5, 16, N'B2', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (229, 5, 16, N'B3', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (230, 5, 16, N'B4', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (231, 5, 16, N'B5', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (232, 5, 16, N'C1', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (233, 5, 16, N'C2', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (234, 5, 16, N'C3', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (235, 5, 16, N'C4', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (236, 5, 16, N'C5', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (237, 5, 17, N'D1', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (238, 5, 17, N'D2', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (239, 5, 17, N'D3', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (240, 5, 17, N'D4', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (241, 5, 17, N'D5', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (242, 5, 17, N'E1', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (243, 5, 17, N'E2', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (244, 5, 17, N'E3', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (245, 5, 17, N'E4', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (246, 5, 17, N'E5', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (247, 6, 1, N'A1', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (248, 6, 1, N'A2', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (249, 6, 1, N'A7', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (250, 6, 1, N'A8', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (251, 6, 1, N'B1', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (252, 6, 1, N'B2', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (253, 6, 1, N'B7', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (254, 6, 1, N'B8', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (255, 6, 1, N'C1', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (256, 6, 1, N'C2', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (257, 6, 1, N'C7', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (258, 6, 1, N'C8', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (259, 6, 1, N'D1', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (260, 6, 1, N'D2', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (261, 6, 1, N'D7', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (262, 6, 1, N'D8', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (263, 6, 1, N'E1', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (264, 6, 1, N'E2', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (265, 6, 1, N'E7', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (266, 6, 1, N'E8', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (267, 6, 1, N'F1', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (268, 6, 1, N'F2', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (269, 6, 1, N'F7', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (270, 6, 1, N'F8', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (271, 6, 1, N'G1', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (272, 6, 1, N'G2', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (273, 6, 1, N'G7', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (274, 6, 1, N'G8', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (275, 6, 2, N'A3', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (276, 6, 2, N'A4', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (277, 6, 2, N'A5', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (278, 6, 2, N'A6', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (279, 6, 2, N'B3', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (280, 6, 2, N'B4', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (281, 6, 2, N'B5', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (282, 6, 2, N'B6', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (283, 6, 2, N'C3', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (284, 6, 2, N'C4', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (285, 6, 2, N'C5', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (286, 6, 2, N'C6', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (287, 6, 2, N'D3', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (288, 6, 2, N'D4', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (289, 6, 2, N'D5', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (290, 6, 2, N'D6', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (291, 6, 3, N'E3', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (292, 6, 3, N'E4', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (293, 6, 3, N'E5', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (294, 6, 3, N'E6', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (295, 6, 3, N'F3', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (296, 6, 3, N'F4', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (297, 6, 3, N'F5', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (298, 6, 3, N'F6', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (299, 6, 3, N'G3', N'G', 1)
GO
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (300, 6, 3, N'G4', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (301, 6, 3, N'G5', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (302, 6, 3, N'G6', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (303, 7, 7, N'A1', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (304, 7, 7, N'A2', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (305, 7, 7, N'A7', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (306, 7, 7, N'A8', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (307, 7, 7, N'B1', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (308, 7, 7, N'B2', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (309, 7, 7, N'B7', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (310, 7, 7, N'B8', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (311, 7, 7, N'C1', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (312, 7, 7, N'C2', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (313, 7, 7, N'C7', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (314, 7, 7, N'C8', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (315, 7, 7, N'D1', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (316, 7, 7, N'D2', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (317, 7, 7, N'D7', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (318, 7, 7, N'D8', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (319, 7, 7, N'E1', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (320, 7, 7, N'E2', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (321, 7, 7, N'E7', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (322, 7, 7, N'E8', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (323, 7, 7, N'F1', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (324, 7, 7, N'F2', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (325, 7, 7, N'F7', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (326, 7, 7, N'F8', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (327, 7, 7, N'G1', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (328, 7, 7, N'G2', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (329, 7, 7, N'G7', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (330, 7, 7, N'G8', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (331, 7, 8, N'A3', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (332, 7, 8, N'A4', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (333, 7, 8, N'A5', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (334, 7, 8, N'A6', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (335, 7, 8, N'B3', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (336, 7, 8, N'B4', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (337, 7, 8, N'B5', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (338, 7, 8, N'B6', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (339, 7, 8, N'C3', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (340, 7, 8, N'C4', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (341, 7, 8, N'C5', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (342, 7, 8, N'C6', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (343, 7, 8, N'D3', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (344, 7, 8, N'D4', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (345, 7, 8, N'D5', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (346, 7, 8, N'D6', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (347, 7, 9, N'E3', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (348, 7, 9, N'E4', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (349, 7, 9, N'E5', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (350, 7, 9, N'E6', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (351, 7, 9, N'F3', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (352, 7, 9, N'F4', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (353, 7, 9, N'F5', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (354, 7, 9, N'F6', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (355, 7, 9, N'G3', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (356, 7, 9, N'G4', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (357, 7, 9, N'G5', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (358, 7, 9, N'G6', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (359, 8, 4, N'A1', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (360, 8, 4, N'A2', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (361, 8, 4, N'A7', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (362, 8, 4, N'A8', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (363, 8, 4, N'B1', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (364, 8, 4, N'B2', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (365, 8, 4, N'B7', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (366, 8, 4, N'B8', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (367, 8, 4, N'C1', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (368, 8, 4, N'C2', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (369, 8, 4, N'C7', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (370, 8, 4, N'C8', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (371, 8, 4, N'D1', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (372, 8, 4, N'D2', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (373, 8, 4, N'D7', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (374, 8, 4, N'D8', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (375, 8, 4, N'E1', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (376, 8, 4, N'E2', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (377, 8, 4, N'E7', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (378, 8, 4, N'E8', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (379, 8, 4, N'F1', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (380, 8, 4, N'F2', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (381, 8, 4, N'F7', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (382, 8, 4, N'F8', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (383, 8, 4, N'G1', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (384, 8, 4, N'G2', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (385, 8, 4, N'G7', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (386, 8, 4, N'G8', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (387, 8, 5, N'A3', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (388, 8, 5, N'A4', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (389, 8, 5, N'A5', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (390, 8, 5, N'A6', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (391, 8, 5, N'B3', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (392, 8, 5, N'B4', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (393, 8, 5, N'B5', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (394, 8, 5, N'B6', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (395, 8, 5, N'C3', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (396, 8, 5, N'C4', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (397, 8, 5, N'C5', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (398, 8, 5, N'C6', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (399, 8, 5, N'D3', N'D', 1)
GO
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (400, 8, 5, N'D4', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (401, 8, 5, N'D5', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (402, 8, 5, N'D6', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (403, 8, 6, N'E3', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (404, 8, 6, N'E4', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (405, 8, 6, N'E5', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (406, 8, 6, N'E6', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (407, 8, 6, N'F3', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (408, 8, 6, N'F4', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (409, 8, 6, N'F5', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (410, 8, 6, N'F6', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (411, 8, 6, N'G3', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (412, 8, 6, N'G4', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (413, 8, 6, N'G5', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (414, 8, 6, N'G6', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (415, 9, 13, N'A1', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (416, 9, 13, N'A2', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (417, 9, 13, N'A3', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (418, 9, 13, N'A4', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (419, 9, 13, N'A5', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (420, 9, 13, N'B1', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (421, 9, 13, N'B2', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (422, 9, 13, N'B3', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (423, 9, 13, N'B4', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (424, 9, 13, N'B5', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (425, 9, 13, N'C1', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (426, 9, 13, N'C2', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (427, 9, 13, N'C3', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (428, 9, 13, N'C4', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (429, 9, 13, N'C5', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (430, 9, 14, N'D1', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (431, 9, 14, N'D2', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (432, 9, 14, N'D3', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (433, 9, 14, N'D4', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (434, 9, 14, N'D5', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (435, 9, 14, N'E1', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (436, 9, 14, N'E2', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (437, 9, 14, N'E3', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (438, 9, 14, N'E4', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (439, 9, 14, N'E5', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (440, 10, 18, N'A1', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (441, 10, 18, N'A2', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (442, 10, 18, N'A3', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (443, 10, 18, N'A10', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (444, 10, 18, N'A11', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (445, 10, 18, N'A12', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (446, 10, 18, N'B1', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (447, 10, 18, N'B2', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (448, 10, 18, N'B3', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (449, 10, 18, N'B10', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (450, 10, 18, N'B11', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (451, 10, 18, N'B12', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (452, 10, 18, N'C1', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (453, 10, 18, N'C2', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (454, 10, 18, N'C3', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (455, 10, 18, N'C10', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (456, 10, 18, N'C11', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (457, 10, 18, N'C12', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (458, 10, 18, N'D1', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (459, 10, 18, N'D2', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (460, 10, 18, N'D3', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (461, 10, 18, N'D10', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (462, 10, 18, N'D11', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (463, 10, 18, N'D12', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (464, 10, 18, N'E1', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (465, 10, 18, N'E2', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (466, 10, 18, N'E3', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (467, 10, 18, N'E10', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (468, 10, 18, N'E11', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (469, 10, 18, N'E12', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (470, 10, 18, N'F1', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (471, 10, 18, N'F2', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (472, 10, 18, N'F3', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (473, 10, 18, N'F10', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (474, 10, 18, N'F11', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (475, 10, 18, N'F12', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (476, 10, 18, N'G1', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (477, 10, 18, N'G2', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (478, 10, 18, N'G3', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (479, 10, 18, N'G10', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (480, 10, 18, N'G11', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (481, 10, 18, N'G12', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (482, 10, 18, N'H1', N'H', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (483, 10, 18, N'H2', N'H', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (484, 10, 18, N'H3', N'H', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (485, 10, 18, N'H10', N'H', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (486, 10, 18, N'H11', N'H', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (487, 10, 18, N'H12', N'H', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (488, 10, 18, N'I1', N'I', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (489, 10, 18, N'I2', N'I', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (490, 10, 18, N'I3', N'I', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (491, 10, 18, N'I10', N'I', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (492, 10, 18, N'I11', N'I', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (493, 10, 18, N'I12', N'I', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (494, 10, 19, N'A4', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (495, 10, 19, N'A5', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (496, 10, 19, N'A6', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (497, 10, 19, N'A7', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (498, 10, 19, N'A8', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (499, 10, 19, N'A9', N'A', 1)
GO
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (500, 10, 19, N'B4', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (501, 10, 19, N'B5', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (502, 10, 19, N'B6', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (503, 10, 19, N'B7', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (504, 10, 19, N'B8', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (505, 10, 19, N'B9', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (506, 10, 19, N'C4', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (507, 10, 19, N'C5', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (508, 10, 19, N'C6', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (509, 10, 19, N'C7', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (510, 10, 19, N'C8', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (511, 10, 19, N'C9', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (512, 10, 19, N'D4', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (513, 10, 19, N'D5', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (514, 10, 19, N'D6', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (515, 10, 19, N'D7', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (516, 10, 19, N'D8', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (517, 10, 19, N'D9', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (518, 10, 19, N'E4', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (519, 10, 19, N'E5', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (520, 10, 19, N'E6', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (521, 10, 19, N'E7', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (522, 10, 19, N'E8', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (523, 10, 19, N'E9', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (524, 10, 19, N'F4', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (525, 10, 19, N'F5', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (526, 10, 19, N'F6', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (527, 10, 19, N'F7', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (528, 10, 19, N'F8', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (529, 10, 19, N'F9', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (530, 10, 20, N'G4', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (531, 10, 20, N'G5', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (532, 10, 20, N'G6', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (533, 10, 20, N'G7', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (534, 10, 20, N'G8', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (535, 10, 20, N'G9', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (536, 10, 20, N'H4', N'H', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (537, 10, 20, N'H5', N'H', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (538, 10, 20, N'H6', N'H', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (539, 10, 20, N'H7', N'H', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (540, 10, 20, N'H8', N'H', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (541, 10, 20, N'H9', N'H', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (542, 10, 20, N'I4', N'I', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (543, 10, 20, N'I5', N'I', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (544, 10, 20, N'I6', N'I', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (545, 10, 20, N'I7', N'I', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (546, 10, 20, N'I8', N'I', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (547, 10, 20, N'I9', N'I', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (548, 11, 1, N'A1', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (549, 11, 1, N'A2', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (550, 11, 1, N'A7', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (551, 11, 1, N'A8', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (552, 11, 1, N'B1', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (553, 11, 1, N'B2', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (554, 11, 1, N'B7', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (555, 11, 1, N'B8', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (556, 11, 1, N'C1', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (557, 11, 1, N'C2', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (558, 11, 1, N'C7', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (559, 11, 1, N'C8', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (560, 11, 1, N'D1', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (561, 11, 1, N'D2', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (562, 11, 1, N'D7', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (563, 11, 1, N'D8', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (564, 11, 1, N'E1', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (565, 11, 1, N'E2', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (566, 11, 1, N'E7', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (567, 11, 1, N'E8', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (568, 11, 1, N'F1', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (569, 11, 1, N'F2', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (570, 11, 1, N'F7', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (571, 11, 1, N'F8', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (572, 11, 1, N'G1', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (573, 11, 1, N'G2', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (574, 11, 1, N'G7', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (575, 11, 1, N'G8', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (576, 11, 2, N'A3', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (577, 11, 2, N'A4', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (578, 11, 2, N'A5', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (579, 11, 2, N'A6', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (580, 11, 2, N'B3', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (581, 11, 2, N'B4', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (582, 11, 2, N'B5', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (583, 11, 2, N'B6', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (584, 11, 2, N'C3', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (585, 11, 2, N'C4', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (586, 11, 2, N'C5', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (587, 11, 2, N'C6', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (588, 11, 2, N'D3', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (589, 11, 2, N'D4', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (590, 11, 2, N'D5', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (591, 11, 2, N'D6', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (592, 11, 3, N'E3', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (593, 11, 3, N'E4', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (594, 11, 3, N'E5', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (595, 11, 3, N'E6', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (596, 11, 3, N'F3', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (597, 11, 3, N'F4', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (598, 11, 3, N'F5', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (599, 11, 3, N'F6', N'F', 1)
GO
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (600, 11, 3, N'G3', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (601, 11, 3, N'G4', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (602, 11, 3, N'G5', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (603, 11, 3, N'G6', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (604, 12, 1, N'A1', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (605, 12, 1, N'A2', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (606, 12, 1, N'A7', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (607, 12, 1, N'A8', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (608, 12, 1, N'B1', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (609, 12, 1, N'B2', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (610, 12, 1, N'B7', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (611, 12, 1, N'B8', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (612, 12, 1, N'C1', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (613, 12, 1, N'C2', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (614, 12, 1, N'C7', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (615, 12, 1, N'C8', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (616, 12, 1, N'D1', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (617, 12, 1, N'D2', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (618, 12, 1, N'D7', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (619, 12, 1, N'D8', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (620, 12, 1, N'E1', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (621, 12, 1, N'E2', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (622, 12, 1, N'E7', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (623, 12, 1, N'E8', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (624, 12, 1, N'F1', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (625, 12, 1, N'F2', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (626, 12, 1, N'F7', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (627, 12, 1, N'F8', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (628, 12, 1, N'G1', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (629, 12, 1, N'G2', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (630, 12, 1, N'G7', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (631, 12, 1, N'G8', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (632, 12, 2, N'A3', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (633, 12, 2, N'A4', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (634, 12, 2, N'A5', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (635, 12, 2, N'A6', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (636, 12, 2, N'B3', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (637, 12, 2, N'B4', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (638, 12, 2, N'B5', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (639, 12, 2, N'B6', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (640, 12, 2, N'C3', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (641, 12, 2, N'C4', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (642, 12, 2, N'C5', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (643, 12, 2, N'C6', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (644, 12, 2, N'D3', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (645, 12, 2, N'D4', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (646, 12, 2, N'D5', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (647, 12, 2, N'D6', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (648, 12, 3, N'E3', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (649, 12, 3, N'E4', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (650, 12, 3, N'E5', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (651, 12, 3, N'E6', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (652, 12, 3, N'F3', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (653, 12, 3, N'F4', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (654, 12, 3, N'F5', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (655, 12, 3, N'F6', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (656, 12, 3, N'G3', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (657, 12, 3, N'G4', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (658, 12, 3, N'G5', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (659, 12, 3, N'G6', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (660, 13, 4, N'A1', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (661, 13, 4, N'A2', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (662, 13, 4, N'A7', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (663, 13, 4, N'A8', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (664, 13, 4, N'B1', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (665, 13, 4, N'B2', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (666, 13, 4, N'B7', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (667, 13, 4, N'B8', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (668, 13, 4, N'C1', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (669, 13, 4, N'C2', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (670, 13, 4, N'C7', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (671, 13, 4, N'C8', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (672, 13, 4, N'D1', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (673, 13, 4, N'D2', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (674, 13, 4, N'D7', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (675, 13, 4, N'D8', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (676, 13, 4, N'E1', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (677, 13, 4, N'E2', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (678, 13, 4, N'E7', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (679, 13, 4, N'E8', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (680, 13, 4, N'F1', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (681, 13, 4, N'F2', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (682, 13, 4, N'F7', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (683, 13, 4, N'F8', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (684, 13, 4, N'G1', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (685, 13, 4, N'G2', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (686, 13, 4, N'G7', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (687, 13, 4, N'G8', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (688, 13, 5, N'A3', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (689, 13, 5, N'A4', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (690, 13, 5, N'A5', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (691, 13, 5, N'A6', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (692, 13, 5, N'B3', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (693, 13, 5, N'B4', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (694, 13, 5, N'B5', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (695, 13, 5, N'B6', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (696, 13, 5, N'C3', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (697, 13, 5, N'C4', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (698, 13, 5, N'C5', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (699, 13, 5, N'C6', N'C', 1)
GO
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (700, 13, 5, N'D3', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (701, 13, 5, N'D4', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (702, 13, 5, N'D5', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (703, 13, 5, N'D6', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (704, 13, 6, N'E3', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (705, 13, 6, N'E4', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (706, 13, 6, N'E5', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (707, 13, 6, N'E6', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (708, 13, 6, N'F3', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (709, 13, 6, N'F4', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (710, 13, 6, N'F5', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (711, 13, 6, N'F6', N'F', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (712, 13, 6, N'G3', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (713, 13, 6, N'G4', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (714, 13, 6, N'G5', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (715, 13, 6, N'G6', N'G', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (716, 14, 15, N'A1', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (717, 14, 15, N'A2', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (718, 14, 15, N'A3', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (719, 14, 15, N'A4', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (720, 14, 15, N'A5', N'A', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (721, 14, 15, N'B1', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (722, 14, 15, N'B2', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (723, 14, 15, N'B3', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (724, 14, 15, N'B4', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (725, 14, 15, N'B5', N'B', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (726, 14, 15, N'C1', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (727, 14, 15, N'C2', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (728, 14, 15, N'C3', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (729, 14, 15, N'C4', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (730, 14, 15, N'C5', N'C', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (731, 14, 16, N'D1', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (732, 14, 16, N'D2', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (733, 14, 16, N'D3', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (734, 14, 16, N'D4', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (735, 14, 16, N'D5', N'D', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (736, 14, 16, N'E1', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (737, 14, 16, N'E2', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (738, 14, 16, N'E3', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (739, 14, 16, N'E4', N'E', 1)
INSERT [dbo].[Seats] ([SeatId], [RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable]) VALUES (740, 14, 16, N'E5', N'E', 1)
SET IDENTITY_INSERT [dbo].[Seats] OFF
GO
SET IDENTITY_INSERT [dbo].[SeatTypes] ON 

INSERT [dbo].[SeatTypes] ([SeatTypeId], [TypeName], [Description], [Price], [IsActive]) VALUES (1, N'Economic', N'Cheaper seating option', CAST(50000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SeatTypes] ([SeatTypeId], [TypeName], [Description], [Price], [IsActive]) VALUES (2, N'Standard', N'Regular seating', CAST(100000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SeatTypes] ([SeatTypeId], [TypeName], [Description], [Price], [IsActive]) VALUES (3, N'Premium', N'Comfortable seating with extra legroom', CAST(150000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SeatTypes] ([SeatTypeId], [TypeName], [Description], [Price], [IsActive]) VALUES (4, N'IMAX Economic', N'Cheaper seating option in IMAX room', CAST(100000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SeatTypes] ([SeatTypeId], [TypeName], [Description], [Price], [IsActive]) VALUES (5, N'IMAX Standard', N'Regular seating in IMAX room', CAST(150000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SeatTypes] ([SeatTypeId], [TypeName], [Description], [Price], [IsActive]) VALUES (6, N'IMAX Premium', N'Comfortable seating with extra legroom in IMAX room', CAST(200000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SeatTypes] ([SeatTypeId], [TypeName], [Description], [Price], [IsActive]) VALUES (7, N'4D Economic', N'Cheaper seating option in 4D room', CAST(150000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SeatTypes] ([SeatTypeId], [TypeName], [Description], [Price], [IsActive]) VALUES (8, N'4D Standard', N'Regular seating in 4D room', CAST(200000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SeatTypes] ([SeatTypeId], [TypeName], [Description], [Price], [IsActive]) VALUES (9, N'4D Premium', N'Comfortable seating with extra legroom in 4D room', CAST(250000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SeatTypes] ([SeatTypeId], [TypeName], [Description], [Price], [IsActive]) VALUES (10, N'Dolby Atmos Standard', N'Regular seating in Dolby Atmos room', CAST(120000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SeatTypes] ([SeatTypeId], [TypeName], [Description], [Price], [IsActive]) VALUES (11, N'Dolby Atmos Premium', N'Comfortable seating with extra legroom in Dolby Atmos room', CAST(170000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SeatTypes] ([SeatTypeId], [TypeName], [Description], [Price], [IsActive]) VALUES (12, N'VIP Standard', N'Regular seating in VIP room', CAST(180000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SeatTypes] ([SeatTypeId], [TypeName], [Description], [Price], [IsActive]) VALUES (13, N'VIP Premium', N'Comfortable seating with extra legroom in VIP room', CAST(230000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SeatTypes] ([SeatTypeId], [TypeName], [Description], [Price], [IsActive]) VALUES (14, N'ScreenX Standard', N'Regular seating in ScreenX room', CAST(140000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SeatTypes] ([SeatTypeId], [TypeName], [Description], [Price], [IsActive]) VALUES (15, N'ScreenX Premium', N'Comfortable seating with extra legroom in ScreenX room', CAST(190000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SeatTypes] ([SeatTypeId], [TypeName], [Description], [Price], [IsActive]) VALUES (16, N'D-Box Standard', N'Regular seating in D-Box room', CAST(160000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SeatTypes] ([SeatTypeId], [TypeName], [Description], [Price], [IsActive]) VALUES (17, N'D-Box Premium', N'Comfortable seating with extra legroom in D-Box room', CAST(210000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SeatTypes] ([SeatTypeId], [TypeName], [Description], [Price], [IsActive]) VALUES (18, N'Laser Projection Economic', N'Cheaper seating option in Laser Projection room', CAST(100000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SeatTypes] ([SeatTypeId], [TypeName], [Description], [Price], [IsActive]) VALUES (19, N'Laser Projection Standard', N'Regular seating in Laser Projection room', CAST(130000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SeatTypes] ([SeatTypeId], [TypeName], [Description], [Price], [IsActive]) VALUES (20, N'Laser Projection Premium', N'Comfortable seating with extra legroom in Laser Projection room', CAST(180000.00 AS Decimal(10, 2)), 1)
SET IDENTITY_INSERT [dbo].[SeatTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Showtimes] ON 

INSERT [dbo].[Showtimes] ([ShowtimeId], [MovieId], [RoomId], [StartTime], [EndTime], [IsActive]) VALUES (1, 1, 1, CAST(N'2024-10-29T09:00:00.000' AS DateTime), CAST(N'2024-10-29T10:49:00.000' AS DateTime), 1)
INSERT [dbo].[Showtimes] ([ShowtimeId], [MovieId], [RoomId], [StartTime], [EndTime], [IsActive]) VALUES (2, 2, 2, CAST(N'2024-10-29T09:00:00.000' AS DateTime), CAST(N'2024-10-29T10:37:00.000' AS DateTime), 1)
INSERT [dbo].[Showtimes] ([ShowtimeId], [MovieId], [RoomId], [StartTime], [EndTime], [IsActive]) VALUES (3, 3, 3, CAST(N'2024-10-29T09:00:00.000' AS DateTime), CAST(N'2024-10-29T11:14:00.000' AS DateTime), 1)
INSERT [dbo].[Showtimes] ([ShowtimeId], [MovieId], [RoomId], [StartTime], [EndTime], [IsActive]) VALUES (4, 4, 4, CAST(N'2024-10-29T09:00:00.000' AS DateTime), CAST(N'2024-10-29T11:43:00.000' AS DateTime), 1)
INSERT [dbo].[Showtimes] ([ShowtimeId], [MovieId], [RoomId], [StartTime], [EndTime], [IsActive]) VALUES (5, 5, 5, CAST(N'2024-10-29T09:00:00.000' AS DateTime), CAST(N'2024-10-29T11:35:00.000' AS DateTime), 1)
INSERT [dbo].[Showtimes] ([ShowtimeId], [MovieId], [RoomId], [StartTime], [EndTime], [IsActive]) VALUES (6, 6, 1, CAST(N'2024-10-29T11:00:00.000' AS DateTime), CAST(N'2024-10-29T13:12:00.000' AS DateTime), 1)
INSERT [dbo].[Showtimes] ([ShowtimeId], [MovieId], [RoomId], [StartTime], [EndTime], [IsActive]) VALUES (7, 7, 2, CAST(N'2024-10-29T11:00:00.000' AS DateTime), CAST(N'2024-10-29T13:12:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Showtimes] OFF
GO
SET IDENTITY_INSERT [dbo].[Theaters] ON 

INSERT [dbo].[Theaters] ([TheaterId], [Name], [Address], [Phone], [OpeningHour], [ClosingHour], [IsActive]) VALUES (1, N'CGV Vincom Center', N'191 Bà Tri?u, Hai Bà Trung, Hà N?i', N'024-3974-9350', N'9:00 AM', N'11:00 PM', 1)
INSERT [dbo].[Theaters] ([TheaterId], [Name], [Address], [Phone], [OpeningHour], [ClosingHour], [IsActive]) VALUES (2, N'Lotte Cinema', N'229 Tây Son, Ð?ng Ða, Hà N?i', N'024-3562-3535', N'10:00 AM', N'12:00 AM', 1)
INSERT [dbo].[Theaters] ([TheaterId], [Name], [Address], [Phone], [OpeningHour], [ClosingHour], [IsActive]) VALUES (3, N'Galaxy Cinema', N'116 Nguy?n Du, Qu?n 1, TP. H? Chí Minh', N'028-3822-8533', N'9:30 AM', N'11:30 PM', 1)
SET IDENTITY_INSERT [dbo].[Theaters] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([CustomerId], [FirstName], [LastName], [Email], [Phone], [City], [CreatedAt], [UpdatedAt], [IsActive], [RoleId]) VALUES (1, N'John', N'Doe', N'john.doe@example.com', N'123-456-7890', N'Hanoi', CAST(N'2024-10-29T22:31:31.043' AS DateTime), CAST(N'2024-10-29T22:31:31.043' AS DateTime), 1, 1)
INSERT [dbo].[Users] ([CustomerId], [FirstName], [LastName], [Email], [Phone], [City], [CreatedAt], [UpdatedAt], [IsActive], [RoleId]) VALUES (2, N'Jane', N'Smith', N'jane.smith@example.com', N'098-765-4321', N'Hanoi', CAST(N'2024-10-29T22:32:04.387' AS DateTime), CAST(N'2024-10-29T22:32:04.387' AS DateTime), 1, 2)
INSERT [dbo].[Users] ([CustomerId], [FirstName], [LastName], [Email], [Phone], [City], [CreatedAt], [UpdatedAt], [IsActive], [RoleId]) VALUES (3, N'Joe', N'Hoe', N'joe.hoe@example.com', N'098-098-0987', N'Hanoi', CAST(N'2024-10-30T19:28:34.357' AS DateTime), CAST(N'2024-10-30T19:28:34.357' AS DateTime), 1, 3)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__A9D10534DA2E3FE2]    Script Date: 10/31/2024 11:57:26 AM ******/
ALTER TABLE [dbo].[Employees] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Customer_Movie]    Script Date: 10/31/2024 11:57:26 AM ******/
ALTER TABLE [dbo].[MovieReviews] ADD  CONSTRAINT [UQ_Customer_Movie] UNIQUE NONCLUSTERED 
(
	[MovieId] ASC,
	[CustomerId] ASC,
	[ReviewDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D105348B435CD1]    Script Date: 10/31/2024 11:57:26 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Concessions] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Concessions] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Concessions] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Coupons] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Coupons] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Coupons] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[GiftCards] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[GiftCards] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[GiftCards] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MovieReviews] ADD  DEFAULT (getdate()) FOR [ReviewDate]
GO
ALTER TABLE [dbo].[Movies] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Movies] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Movies] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT (getdate()) FOR [PublishedDate]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [IsPaid]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Seats] ADD  DEFAULT ((1)) FOR [IsAvailable]
GO
ALTER TABLE [dbo].[SeatTypes] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Showtimes] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Theaters] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Coupon_User]  WITH CHECK ADD  CONSTRAINT [FK_Coupon_User_Coupons] FOREIGN KEY([CouponId])
REFERENCES [dbo].[Coupons] ([CouponId])
GO
ALTER TABLE [dbo].[Coupon_User] CHECK CONSTRAINT [FK_Coupon_User_Coupons]
GO
ALTER TABLE [dbo].[Coupon_User]  WITH CHECK ADD  CONSTRAINT [FK_Coupon_User_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([CustomerId])
GO
ALTER TABLE [dbo].[Coupon_User] CHECK CONSTRAINT [FK_Coupon_User_Users]
GO
ALTER TABLE [dbo].[GiftCard_User]  WITH CHECK ADD  CONSTRAINT [FK_GiftCard_User_GiftCards] FOREIGN KEY([GiftCardId])
REFERENCES [dbo].[GiftCards] ([GiftCardId])
GO
ALTER TABLE [dbo].[GiftCard_User] CHECK CONSTRAINT [FK_GiftCard_User_GiftCards]
GO
ALTER TABLE [dbo].[GiftCard_User]  WITH CHECK ADD  CONSTRAINT [FK_GiftCard_User_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([CustomerId])
GO
ALTER TABLE [dbo].[GiftCard_User] CHECK CONSTRAINT [FK_GiftCard_User_Users]
GO
ALTER TABLE [dbo].[Movie_Categories]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Movie_Categories]  WITH CHECK ADD FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MovieReviews]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Users] ([CustomerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MovieReviews]  WITH CHECK ADD FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_Concessions]  WITH CHECK ADD FOREIGN KEY([ConcessionId])
REFERENCES [dbo].[Concessions] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_Concessions]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([SeatId])
REFERENCES [dbo].[Seats] ([SeatId])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ShowtimeId])
REFERENCES [dbo].[Showtimes] ([ShowtimeId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CouponId])
REFERENCES [dbo].[Coupons] ([CouponId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Users] ([CustomerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([GiftCardId])
REFERENCES [dbo].[GiftCards] ([GiftCardId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([StatusId])
REFERENCES [dbo].[Order_Status] ([StatusId])
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD FOREIGN KEY([TheaterId])
REFERENCES [dbo].[Theaters] ([TheaterId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([RoomId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD FOREIGN KEY([SeatTypeId])
REFERENCES [dbo].[SeatTypes] ([SeatTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Showtimes]  WITH CHECK ADD FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Showtimes]  WITH CHECK ADD FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([RoomId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Concessions]  WITH CHECK ADD CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[Concessions]  WITH CHECK ADD CHECK  (([StockQuantity]>=(0)))
GO
ALTER TABLE [dbo].[MovieReviews]  WITH CHECK ADD CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
GO
ALTER TABLE [dbo].[SeatTypes]  WITH CHECK ADD CHECK  (([Price]>(0)))
GO
