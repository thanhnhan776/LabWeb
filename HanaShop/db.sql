USE [master]
GO
/****** Object:  Database [Lab_HanaShop]    Script Date: 5/4/2020 23:39:48 ******/
CREATE DATABASE [Lab_HanaShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Lab_HanaShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Lab_HanaShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Lab_HanaShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Lab_HanaShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Lab_HanaShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Lab_HanaShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Lab_HanaShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Lab_HanaShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Lab_HanaShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Lab_HanaShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Lab_HanaShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [Lab_HanaShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Lab_HanaShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Lab_HanaShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Lab_HanaShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Lab_HanaShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Lab_HanaShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Lab_HanaShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Lab_HanaShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Lab_HanaShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Lab_HanaShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Lab_HanaShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Lab_HanaShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Lab_HanaShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Lab_HanaShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Lab_HanaShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Lab_HanaShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Lab_HanaShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Lab_HanaShop] SET RECOVERY FULL 
GO
ALTER DATABASE [Lab_HanaShop] SET  MULTI_USER 
GO
ALTER DATABASE [Lab_HanaShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Lab_HanaShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Lab_HanaShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Lab_HanaShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Lab_HanaShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Lab_HanaShop', N'ON'
GO
ALTER DATABASE [Lab_HanaShop] SET QUERY_STORE = OFF
GO
USE [Lab_HanaShop]
GO
/****** Object:  Table [dbo].[tbl_Category]    Script Date: 5/4/2020 23:39:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Order]    Script Date: 5/4/2020 23:39:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[PaymentMethodId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_OrderDetails]    Script Date: 5/4/2020 23:39:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_PaymentMethod]    Script Date: 5/4/2020 23:39:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_PaymentMethod](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 5/4/2020 23:39:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Image] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[CategoryId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
	[Status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 5/4/2020 23:39:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[Username] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Fullname] [nvarchar](500) NULL,
	[IsAdmin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Category] ON 
GO
INSERT [dbo].[tbl_Category] ([Id], [Name]) VALUES (1, N'Bánh mì')
GO
INSERT [dbo].[tbl_Category] ([Id], [Name]) VALUES (2, N'Tráng miệng')
GO
INSERT [dbo].[tbl_Category] ([Id], [Name]) VALUES (3, N'Froster')
GO
INSERT [dbo].[tbl_Category] ([Id], [Name]) VALUES (4, N'Nestlé')
GO
INSERT [dbo].[tbl_Category] ([Id], [Name]) VALUES (5, N'Mì')
GO
INSERT [dbo].[tbl_Category] ([Id], [Name]) VALUES (6, N'Sandwich')
GO
INSERT [dbo].[tbl_Category] ([Id], [Name]) VALUES (7, N'Món hấp')
GO
INSERT [dbo].[tbl_Category] ([Id], [Name]) VALUES (8, N'Trà')
GO
INSERT [dbo].[tbl_Category] ([Id], [Name]) VALUES (9, N'Cà phê')
GO
SET IDENTITY_INSERT [dbo].[tbl_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_PaymentMethod] ON 
GO
INSERT [dbo].[tbl_PaymentMethod] ([Id], [Name]) VALUES (1, N'Cash on delivery')
GO
SET IDENTITY_INSERT [dbo].[tbl_PaymentMethod] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Product] ON 
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'Bánh Mì Nem Nướng', N'img/1-bread/6.-BANH-MI-NEM-NUONG.png', N'Bánh mì Việt Nam không còn xa lạ với hầu hết người dân Việt Nam vì món ăn không chỉ ngon miệng mà còn bổ dưỡng để khởi đầu một ngày mới. Vỏ bánh mì giòn tan kết hơp với lớp nhân ngon lành của nem nướng thơm ngon,  mang đến cho bạn vị ngon khó cưỡng', 20000, 30, 1, CAST(N'2020-05-04T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'Bánh Mì Ốp La', N'img/1-bread/img/1-bread/6.-BANH-MI-NEM-NUONG.png', N'Bánh mì ốp la là món ăn quen thuộc với hầu hết người Việt Nam bởi nó không chỉ ngon mà còn cung cấp đủ năng lượng để khởi đầu ngày mới. Sự chế biến hoàn hảo của quả trứng với mặt dưới giòn nhẹ, phần lòng trắng và lòng đỏ hơi chín vừa kết hợp với dưa leo, cà chua, một chút muối tiêu, nước tương, tương ớt cùng với bánh mỳ Việt Nam giòn tan chắc chắn mang đến cho bạn sự ngon miệng.', 20000, 30, 1, CAST(N'2020-05-04T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'Táo', N'img/2-dessert/fruit_whole_nodish.png', N'Trái cây luôn mang lại nguồn chất xơ, vitamin và khoáng chất tự nhiên dồi dào cho cơ thể. Circle K có đa dạng các loại trái cây vô cùng an toàn và tiện lợi như: táo, lê, quýt, dừa, chuối …', 30000, 50, 2, CAST(N'2020-05-04T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'Táo Ta', N'img/2-dessert/15.-TAO-TA.png', N'Trái cây luôn mang lại nguồn chất xơ, vitamin và khoáng chất tự nhiên dồi dào cho cơ thể. Circle K có đa dạng các loại trái cây vô cùng an toàn và tiện lợi như: táo, lê, quýt, dừa, chuối, bưởi, táo ta, mít thái …', 25000, 23, 2, CAST(N'2020-02-04T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, N'Dừa', N'img/2-dessert/15.-DUA.png', N'Trái cây luôn mang lại nguồn chất xơ, vitamin và khoáng chất tự nhiên dồi dào cho cơ thể. Circle K có đa dạng các loại trái cây vô cùng an toàn và tiện lợi như: táo, lê, quýt, dừa, chuối, bưởi, táo ta, mít thái …', 27000, 10, 2, CAST(N'2020-02-04T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, N'Chuôi', N'img/2-dessert/single-banana.png', N'Trái cây luôn mang lại nguồn chất xơ, vitamin và khoáng chất tự nhiên dồi dào cho cơ thể. Circle K có đa dạng các loại trái cây vô cùng an toàn và tiện lợi như: táo, lê, quýt, dừa, chuối, bưởi, táo ta, mít thái …', 15000, 50, 2, CAST(N'2020-05-04T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (7, N'FROSTER Phúc Bồn Tử Xanh', N'img/3-froster/froster-blueberry.png', N'Froster là một thương hiệu giải khát riêng của Circle K được pha chế từ nguồn nguyên liệu si rô đã có danh tiếng gần 100 năm tại Mỹ, tạo ra những ly si rô tuyết Froster hấp dẫn mang hương vị trái cây tươi mát và đầy màu sắc. Bạn cũng có thể tự do tạo hương vị riêng của chính bạn bằng cách pha trộn những vị trái cây khác nhau, cho bạn những trải nghiệm hoàn toàn mới mà không thể tìm thấy ở bất cứ đâu.

Hiện tại Froster có rất nhiều mùi vị, bao gồm: dâu tây, phúc bồn tử xanh, đào, táo xanh, chanh dây, việt quất... thay đổi theo mùa.', 35000, 20, 3, CAST(N'2020-05-01T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, N'FROSTER Dâu Tây', N'img/3-froster/froster-strawberry.png', N'Froster là một thương hiệu giải khát riêng của Circle K được pha chế từ nguồn nguyên liệu si rô đã có danh tiếng gần 100 năm tại Mỹ, tạo ra những ly si rô tuyết Froster hấp dẫn mang hương vị trái cây tươi mát và đầy màu sắc. Bạn cũng có thể tự do tạo hương vị riêng của chính bạn bằng cách pha trộn những vị trái cây khác nhau, cho bạn những trải nghiệm hoàn toàn mới mà không thể tìm thấy ở bất cứ đâu.

Hiện tại Froster có rất nhiều mùi vị, bao gồm: dâu tây, phúc bồn tử xanh, đào, táo xanh, chanh dây, việt quất... thay đổi theo mùa.', 40000, 25, 3, CAST(N'2020-05-01T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (9, N'FROSTER Unicorn', N'img/3-froster/froster-unicorn.png', N'Froster – một loại thức uống mà bạn chỉ có thể tìm thấy tại hệ thống chuỗi cửa hàng tiện lợi Circle K, nay đã có thêm mùi vị mới với màu sắc vô cùng đáng yêu và vị cực thích. Lấy cảm hứng từ trào lưu Unicorn đang làm điên đảo giới trẻ toàn cầu, Circle K Việt Nam đã cho ra đời thức uống giải khát froster vị kẹo singum cho bạn thỏa sức sáng tạo, tự tay mix cho mình một ly Froster Unicorn theo phong cách riêng.', 45000, 26, 3, CAST(N'2020-05-01T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (10, N'Milo', N'img/4-netsle/Milo.png', N'Tại Circle K, những sản phẩm quen thuộc từ nhãn hàng Nestlé được pha chế theo công thức riêng mang lại cảm giác sảng khoái và tươi mát hơn.
Hiện tại có 2 dòng sản phẩm phổ biến: Trà Chanh và Milo.', 20000, 40, 4, CAST(N'2020-05-01T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (11, N'Trà Chanh', N'img/4-netsle/3.-THUCUONG-TRA-CHANH.png', N'Tại Circle K, những sản phẩm quen thuộc từ nhãn hàng Nestlé được pha chế theo công thức riêng mang lại cảm giác sảng khoái và tươi mát hơn.
Hiện tại có 2 dòng sản phẩm phổ biến: Trà Chanh và Milo.', 23000, 35, 4, CAST(N'2020-02-04T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (12, N'Mì Trộn Trứng Chiên', N'img/5-noodles/1.-MI-TRON-TRUNG.png', N'Mì Trộn thoạt nhìn có vẻ đơn giản nhưng lại mang một hương vị đặc trưng riêng. Một tô Mì Trộn hấp dẫn với giá cả rất phải chăng, thêm một chút giá, một chút hẹ, có thể dùng thêm sa tế cay cũng làm ấm lòng bạn vào bất kì giờ nào trong ngày. Sẽ tuyệt hơn nếu bạn kết hợp dùng Mì Trộn với một phần trứng chiên để làm tăng hương vị món ăn.', 30000, 10, 5, CAST(N'2020-05-04T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (13, N'Mì Trộn Xúc Xích Mini', N'img/5-noodles/1.-MI-TRON-TRUNG-XUC-XICH.png', N'Mì Trộn thoạt nhìn có vẻ đơn giản nhưng lại mang một hương vị đặc trưng riêng. Một tô Mì Trộn hấp dẫn với giá cả rất phải chăng, thêm một chút giá, một chút hẹ, có thể dùng thêm sa tế cay cũng làm ấm lòng bạn vào bất kì giờ nào trong ngày. Sẽ tuyệt hơn nếu bạn kết hợp dùng Mì Trộn với một phần xúc xích nướng để làm tăng hương vị món ăn.', 27000, 15, 5, CAST(N'2020-05-04T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (14, N'Mì Trộn Xúc Xích Trứng Chiên', N'img/5-noodles/1.-MI-TRON-XUC-XICH.png', N'Mì Trộn thoạt nhìn có vẻ đơn giản nhưng lại mang một hương vị đặc trưng riêng. Một tô Mì Trộn hấp dẫn với giá cả rất phải chăng, thêm một chút giá, một chút hẹ, có thể dùng thêm sa tế cay cũng làm ấm lòng bạn vào bất kì giờ nào trong ngày. Sẽ tuyệt hơn nếu bạn kết hợp dùng Mì Trộn với một phần trứng chiên và xúc xích nướng để làm tăng hương vị món ăn.', 32000, 17, 5, CAST(N'2020-05-04T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (15, N'Sandwich Trứng & Mayonnaise', N'img/6-sandwich/8.-SANDWICH-GIAM-BONG-PHO-MAI.png', N'Sandwich tại Circle K được chuẩn bị như chính bạn làm tại nhà với xà lách tươi, bắp ngọt, cá ngừ, thịt bò, thịt nguội, phô mai và các hương vị khác, bổ sung bằng các loại sốt đặc biệt cho bạn nhiều lựa chọn đa dạng. Đặc biệt, Sandwich được chế biến mới mỗi ngày và đóng gói trong những hộp nhựa hình tam giác xinh xắn, sạch sẽ, trong suốt với cam kết an toàn và chất lượng.', 22000, 5, 6, CAST(N'2020-05-01T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (16, N'Sandwich Giăm Bông & Phô Mai', N'img/6-sandwich/8.-SANDWICH-TRUNG-MAYO.png', N'Sandwich tại Circle K được chuẩn bị như chính bạn làm tại nhà với xà lách tươi, bắp ngọt, cá ngừ, thịt bò, thịt nguội, phô mai và các hương vị khác, bổ sung bằng các loại sốt đặc biệt cho bạn nhiều lựa chọn đa dạng. Đặc biệt, Sandwich được chế biến mới mỗi ngày và đóng gói trong những hộp nhựa hình tam giác xinh xắn, sạch sẽ, trong suốt với cam kết an toàn và chất lượng.', 26000, 5, 6, CAST(N'2020-03-04T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (17, N'Dimsum', N'img/7-steamed-bun/3.-DIMSUM.png', N'Dimsum 1 món ăn hấp dẫn luôn có mặt tại Circle K.
Vỏ bánh mỏng, mịn bao trọn phần nhân thịt đầy đặn bên trong. Đảm bảo giữ trọn hương vị tươi mới và ngon lành của món ăn.', 13000, 10, 7, CAST(N'2020-05-04T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (18, N'Bánh Giò', N'img/7-steamed-bun/4.-BANH-GIO.png', N'Bánh Giò được làm từ bột gạo tẻ với nhân làm từ thịt nạc kèm mộc nhĩ và hành khô. Món ăn thuần Việt này đã xuất hiện tại Circle K với phong cách phục vụ nhanh chóng, sạch sẽ, bánh nóng vừa ăn, luôn đảm bảo sự ngon miệng cho bạn.', 15000, 10, 7, CAST(N'2020-04-04T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (19, N'Xôi Lá Chuối', N'img/7-steamed-bun/XOI-GA_icon.png', N'Xôi lá chuối, món ăn dân dã của người Việt giờ đây đã sẵn sàng được phục vụ ở cửa hàng tiện lợi Circle K. Phần xôi mềm dẻo được bọc trong lớp lá chuối tươi được hấp chín kỹ. Nhân xôi đủ đầy với thịt gà xé dai dai, nấm đông cô lạ miệng cùng trứng muối  và tôm khô mằn mặn. Tất cả hòa quyện, tạo nên hương vị đặc trưng và thơm ngon. Còn gì bằng khi buổi sớm thức dậy được thưởng thức bữa sáng ấm nóng và ngon lành với món ăn truyền thống.', 18000, 12, 7, CAST(N'2020-04-04T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (20, N'Bánh Bao Khoai Môn', N'img/7-steamed-bun/303x303_Steam-bun-Taro.png', N'Bánh Bao Ca Dé và Bánh Bao Khoai Môn, có nhân làm từ đậu xanh và khoai môn là hai lựa chọn thơm ngon cho bạn bên cạnh Bánh Bao truyền thống. Bánh Bao tại Circle K luôn nóng hổi để phục vụ bạn bất cứ lúc nào trong ngày.', 22000, 14, 7, CAST(N'2020-05-01T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (21, N'Bánh Bao Ca Dé', N'img/7-steamed-bun/303x303_Steam-bun-Cade1.png', N'Bánh Bao Ca Dé và Bánh Bao Khoai Môn, có nhân làm từ đậu xanh và khoai môn là hai lựa chọn thơm ngon cho bạn bên cạnh Bánh Bao truyền thống. Bánh Bao tại Circle K luôn nóng hổi để phục vụ bạn bất cứ lúc nào trong ngày.', 22000, 15, 7, CAST(N'2020-05-04T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (22, N'Bánh Bao Trứng Cút', N'img/7-steamed-bun/303x303_Steam-bun-Quail-egg.png', N'Bánh Bao Trứng Cút có nhân được làm từ thịt heo, củ hành, trứng cút, và nấm. Sản phẩm luôn được giữ nóng trong tủ hâm riêng cho Bánh Bao, luôn được đảm bảo là bánh mới, chất lượng và an toàn để phục vụ bạn bất cứ lúc nào trong ngày.', 25000, 20, 7, CAST(N'2020-05-02T00:00:00.000' AS DateTime), NULL, NULL, N'active')
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (23, N'Bánh Bao Trứng Muối & Trứng Cút', N'img/7-steamed-bun/303x303_Steam-bun-quail-egg-and-satly-duck-egg.png', N'Bánh Bao Trứng Muối & Trứng Cút có nhân được làm từ thịt heo, củ hành, lòng đỏ trứng muối, và nấm. Sản phẩm luôn được giữ nóng trong tủ hâm riêng cho Bánh Bao, luôn được đảm bảo là bánh mới, chất lượng và an toàn để phục vụ bạn bất cứ lúc nào trong ngày.', 28000, 22, 7, CAST(N'2020-05-03T00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (24, N'Trà Sữa Thái (Đỏ)', N'img/8-tea/3.-THUCUONG-TRA-THAI-DO.png', N'Trà Sữa Thái là một trong những thức uống được giới trẻ ưa chuộng. Với Trà Sữa Thái Xanh hay Đỏ, bạn có thể tận hưởng được hương vị tươi mát, đậm chất ngọt ngào đặc trưng của trà sữa. Hơn thế nữa, sự kết hợp giữa Trà Sữa Thái với Kem Bồng Bềnh chắc chắn là lựa chọn độc đáo chỉ có tại Circle K.', 26000, 8, 8, CAST(N'2020-05-03T00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (25, N'Trà Sữa Thái (Xanh)', N'img/8-tea/3.-THUCUONG-TRA-THAI-XANH.png', N'Trà Sữa Thái là một trong những thức uống được giới trẻ ưa chuộng. Với Trà Sữa Thái Xanh hay Đỏ, bạn có thể tận hưởng được hương vị tươi mát, đậm chất ngọt ngào đặc trưng của trà sữa. Hơn thế nữa, sự kết hợp giữa Trà Sữa Thái với Kem Bồng Bềnh chắc chắn là lựa chọn độc đáo chỉ có tại Circle K.', 26000, 9, 8, CAST(N'2020-05-03T00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (26, N'Trà Đào', N'img/8-tea/303x303_peach-tea.png', N'Trà Đào được pha chế ngay tại cửa hàng với hương vị thơm ngon, mát lạnh. Không chỉ vậy, ly trà thêm phần đậm đà hơn với lát đào giòn ngọt được thêm vào. ', 30000, 10, 8, CAST(N'2020-05-03T00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (27, N'Sữa Tươi Cà Phê', N'img/9-coffee/CFVN_sua-da_new-logo_303x303.png', N'Người Việt Nam uống cà phê như một văn hóa. Một ly cà phê truyền thống đậm chất Việt Nam sẽ luôn luôn sẵn sàng cho bạn tại Circle K vào bất cứ lúc nào trong ngày. Hệ thống Circle K phục vụ các loại cà phê: Cà Phê Đen, Cà Phê Sữa (nóng và đá) và Sữa Tươi Cà Phê. Bạn có thể uống tại chỗ hoặc mang đi.', 15000, 11, 9, CAST(N'2020-05-03T00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (28, N'Cà Phê Phin Đen Nóng', N'img/9-coffee/CF-Den-nong_new-logo_303x303.png', N'Người Việt Nam uống cà phê như một văn hóa. Một ly cà phê truyền thống đậm chất Việt Nam sẽ luôn luôn sẵn sàng cho bạn tại Circle K vào bất cứ lúc nào trong ngày. Hệ thống Circle K phục vụ các loại cà phê: Cà Phê Đen, Cà Phê Sữa (nóng và đá) và Sữa Tươi Cà Phê. Bạn có thể uống tại chỗ hoặc mang đi.', 15000, 12, 9, CAST(N'2020-03-04T00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (29, N'Cà Phê Phin Sữa Nóng', N'img/9-coffee/CF-sua-nong_new-logo_303x303.png', N'Người Việt Nam uống cà phê như một văn hóa. Một ly cà phê truyền thống đậm chất Việt Nam sẽ luôn luôn sẵn sàng cho bạn tại Circle K vào bất cứ lúc nào trong ngày. Hệ thống Circle K phục vụ các loại cà phê: Cà Phê Đen, Cà Phê Sữa (nóng và đá) và Sữa Tươi Cà Phê. Bạn có thể uống tại chỗ hoặc mang đi.', 17000, 13, 9, CAST(N'2020-03-04T00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (30, N'Cà Phê Phin Sữa Đá', N'img/9-coffee/CFVN_milk_new-logo_dup_303x303-1.png', N'Người Việt Nam uống cà phê như một văn hóa. Một ly cà phê truyền thống đậm chất Việt Nam sẽ luôn luôn sẵn sàng cho bạn tại Circle K vào bất cứ lúc nào trong ngày. Hệ thống Circle K phục vụ các loại cà phê: Cà Phê Đen, Cà Phê Sữa (nóng và đá) và Sữa Tươi Cà Phê. Bạn có thể uống tại chỗ hoặc mang đi.', 17000, 14, 9, CAST(N'2020-03-04T00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_Product] ([Id], [Name], [Image], [Description], [Price], [Quantity], [CategoryId], [CreatedDate], [ModifiedDate], [ModifiedBy], [Status]) VALUES (31, N'Cà Phê Phin Đen Đá', N'img/9-coffee/CFVN_den-da-black_new-logo_dup_303x303.png', N'Người Việt Nam uống cà phê như một văn hóa. Một ly cà phê truyền thống đậm chất Việt Nam sẽ luôn luôn sẵn sàng cho bạn tại Circle K vào bất cứ lúc nào trong ngày. Hệ thống Circle K phục vụ các loại cà phê: Cà Phê Đen, Cà Phê Sữa (nóng và đá) và Sữa Tươi Cà Phê. Bạn có thể uống tại chỗ hoặc mang đi.', 16000, 15, 9, CAST(N'2020-03-04T00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[tbl_Product] OFF
GO
INSERT [dbo].[tbl_User] ([Username], [Password], [Fullname], [IsAdmin]) VALUES (N'admin', N'admin', N'Admin', 1)
GO
INSERT [dbo].[tbl_User] ([Username], [Password], [Fullname], [IsAdmin]) VALUES (N'admin2', N'admin2', N'Admin the Second', 1)
GO
INSERT [dbo].[tbl_User] ([Username], [Password], [Fullname], [IsAdmin]) VALUES (N'user01', N'user01', N'Bill Gates', 0)
GO
INSERT [dbo].[tbl_User] ([Username], [Password], [Fullname], [IsAdmin]) VALUES (N'user02', N'user02', N'Mark Zuckerberg', 0)
GO
ALTER TABLE [dbo].[tbl_User] ADD  DEFAULT ((0)) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[tbl_Order]  WITH CHECK ADD FOREIGN KEY([PaymentMethodId])
REFERENCES [dbo].[tbl_PaymentMethod] ([Id])
GO
ALTER TABLE [dbo].[tbl_Order]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[tbl_User] ([Username])
GO
ALTER TABLE [dbo].[tbl_OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[tbl_Order] ([Id])
GO
ALTER TABLE [dbo].[tbl_OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[tbl_Product] ([Id])
GO
ALTER TABLE [dbo].[tbl_Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[tbl_Category] ([Id])
GO
ALTER TABLE [dbo].[tbl_Product]  WITH CHECK ADD FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[tbl_User] ([Username])
GO
USE [master]
GO
ALTER DATABASE [Lab_HanaShop] SET  READ_WRITE 
GO
