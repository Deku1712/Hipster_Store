USE [master]
GO
/****** Object:  Database [Final_Project]    Script Date: 7/13/2023 5:26:52 PM ******/
CREATE DATABASE [Final_Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Final_Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Final_Project.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Final_Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Final_Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Final_Project] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Final_Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Final_Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Final_Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Final_Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Final_Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Final_Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [Final_Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Final_Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Final_Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Final_Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Final_Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Final_Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Final_Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Final_Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Final_Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Final_Project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Final_Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Final_Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Final_Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Final_Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Final_Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Final_Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Final_Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Final_Project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Final_Project] SET  MULTI_USER 
GO
ALTER DATABASE [Final_Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Final_Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Final_Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Final_Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Final_Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Final_Project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Final_Project] SET QUERY_STORE = ON
GO
ALTER DATABASE [Final_Project] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Final_Project]
GO
/****** Object:  Table [dbo].[Cart_Table]    Script Date: 7/13/2023 5:26:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_Table](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
 CONSTRAINT [PK__Cart_Tab__2EF52A273A5F696E] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartUser_Table]    Script Date: 7/13/2023 5:26:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartUser_Table](
	[cart_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[size] [int] NOT NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC,
	[product_id] ASC,
	[size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentCreator_Table]    Script Date: 7/13/2023 5:26:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentCreator_Table](
	[username] [nvarchar](50) NULL,
	[title] [nvarchar](1000) NULL,
	[img] [nvarchar](200) NULL,
	[content] [nvarchar](3000) NULL,
	[created_at] [date] NULL,
	[update_at] [date] NULL,
	[detail_title] [nvarchar](3000) NULL,
	[content_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ContentCreator_Table] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeeShip_Table]    Script Date: 7/13/2023 5:26:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeeShip_Table](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[city] [nvarchar](50) NULL,
	[fee_shipping] [float] NULL,
 CONSTRAINT [PK_FeeShip_Table] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification_Table]    Script Date: 7/13/2023 5:26:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification_Table](
	[notification_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[title] [nvarchar](50) NULL,
	[noti_content] [nvarchar](250) NULL,
	[create_at] [date] NULL,
 CONSTRAINT [PK_Notification_Table] PRIMARY KEY CLUSTERED 
(
	[notification_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Table]    Script Date: 7/13/2023 5:26:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Table](
	[order_id] [nvarchar](50) NOT NULL,
	[username] [nvarchar](50) NULL,
	[status_order] [nvarchar](50) NULL,
	[delivery_address] [nvarchar](100) NULL,
	[total_price] [float] NULL,
	[created_at] [date] NULL,
	[update_at] [date] NULL,
	[status_Payment] [nvarchar](50) NULL,
 CONSTRAINT [PK__Order_Ta__465962297359E237] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems_Table]    Script Date: 7/13/2023 5:26:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems_Table](
	[order_id] [nvarchar](50) NOT NULL,
	[product_id] [int] NOT NULL,
	[size] [int] NOT NULL,
	[quantity] [int] NULL,
	[id_price] [int] NULL,
 CONSTRAINT [PK__OrderIte__EE06C68838BD2F0C] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC,
	[size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Price_Table]    Script Date: 7/13/2023 5:26:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price_Table](
	[id_price] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[input_price] [float] NULL,
	[startofdate] [date] NULL,
	[endofdate] [date] NULL,
 CONSTRAINT [PK__Price_Ta__D8A23E8367B72773] PRIMARY KEY CLUSTERED 
(
	[id_price] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Table]    Script Date: 7/13/2023 5:26:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Table](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[brand] [nvarchar](50) NULL,
	[product_description] [nvarchar](1000) NULL,
	[profit_price] [float] NULL,
	[img] [nvarchar](200) NULL,
	[quantity] [int] NULL,
	[created_at] [date] NULL,
	[update_at] [date] NULL,
	[color] [nvarchar](50) NULL,
 CONSTRAINT [PK__Product___47027DF575BC9C54] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail_Table]    Script Date: 7/13/2023 5:26:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail_Table](
	[product_id] [int] NOT NULL,
	[size] [int] NOT NULL,
	[quantityOfSize] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rank_Table]    Script Date: 7/13/2023 5:26:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rank_Table](
	[rankId] [int] NOT NULL,
	[username] [nvarchar](50) NULL,
	[rank] [nvarchar](50) NULL,
 CONSTRAINT [PK_Rank_Table] PRIMARY KEY CLUSTERED 
(
	[rankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ship_Table]    Script Date: 7/13/2023 5:26:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ship_Table](
	[ship_id] [int] IDENTITY(1,1) NOT NULL,
	[shipper] [nvarchar](50) NULL,
	[order_id] [nvarchar](50) NULL,
	[time_pick_order] [date] NULL,
	[reason] [nvarchar](200) NULL,
	[phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Ship_Table] PRIMARY KEY CLUSTERED 
(
	[ship_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Table]    Script Date: 7/13/2023 5:26:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Table](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[role] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[created_at] [date] NULL,
	[update_at] [date] NULL,
	[phone] [nvarchar](50) NULL,
	[img] [nvarchar](400) NULL,
 CONSTRAINT [PK_User_Table] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart_Table] ON 

INSERT [dbo].[Cart_Table] ([cart_id], [username]) VALUES (4, N'ngoctamqb123@gmail.com')
INSERT [dbo].[Cart_Table] ([cart_id], [username]) VALUES (6, N'tamtvnde160577@fpt.edu.vn')
INSERT [dbo].[Cart_Table] ([cart_id], [username]) VALUES (7, N'quantade160213@fpt.edu.vn')
INSERT [dbo].[Cart_Table] ([cart_id], [username]) VALUES (8, N'thanhvnde160635@fpt.edu.vn')
SET IDENTITY_INSERT [dbo].[Cart_Table] OFF
GO
INSERT [dbo].[CartUser_Table] ([cart_id], [product_id], [size], [quantity]) VALUES (7, 1, 41, 15)
GO
INSERT [dbo].[ContentCreator_Table] ([username], [title], [img], [content], [created_at], [update_at], [detail_title], [content_id]) VALUES (NULL, N'Never Done Iterating', N'./images/blog-01.jpg', N'Nike Dunk Low Next Nature is a groundbreaking sneaker that seamlessly blends urban style with elements inspired by the natural world. Its design takes cues from the beauty of nature, incorporating earthy tones and sustainable materials like recycled polyester. The shoe features innovative design elements, including a leaf-inspired pattern on the Swoosh logo and a rugged outsole for added traction. Comfort and performance are not compromised, with a cushioned midsole providing support and impact absorption. The Dunk Low Next Nature encourages wearers to embrace exploration and find inspiration in the outdoors. It represents the perfect fusion of style, sustainability, and the spirit of adventure.', CAST(N'2023-05-05' AS Date), CAST(N'2023-05-05' AS Date), N'Over the past four decades, the Pegasus went from a utility running shoe, to an afterthought, and is now one of Nike''s most beloved staples. Explore the history of our most popular running shoe ever.', N'1')
INSERT [dbo].[ContentCreator_Table] ([username], [title], [img], [content], [created_at], [update_at], [detail_title], [content_id]) VALUES (NULL, N'Hip Hop''s Superstar: How Music Influenced Sneaker Style', N'./images/blog-02.jpg', N'Immerse yourself in the captivating world of "Hip Hop''s Superstar: How Music Influenced Sneaker Style" and uncover the profound impact that hip hop has had on sneaker culture. This remarkable book takes you on a journey through the dynamic relationship between music and fashion, showcasing how hip hop artists like Run DMC, Jay-Z, and Kanye West have shaped sneaker style.

From the streets of New York City to global stages, hip hop artists have become style icons, redefining what it means to be fashionable. Sneakers have played a pivotal role in this transformation, becoming more than just footwear—they have become symbols of identity and self-expression within the hip hop community.

Through vivid storytelling and captivating visuals, "Hip Hop''s Superstar" highlights the iconic moments that have defined the fusion of music and sneaker style. Explore legendary collaborations between hip hop artists and sneaker brands, resulting in exclusive designs that have become highly coveted collectibles.

From the Air Jordan line to Adidas Superstars and Puma Clydes, discover the stories behind these legendary sneakers that have become staples in the wardrobes of hip hop artists and enthusiasts alike. These sneakers go beyond mere fashion choices; they represent cultural markers, signifying authenticity and street credibility.

This book also delves into the cultural significance of sneaker style within hip hop. It showcases how artists have used their influence to break down barriers, challenge societal norms, and pave the way for future generations. Sneakers have become a medium of self-expression, allowing artists to connect with their audience on a deeper level.

Additionally, "Hip Hop''s Superstar" explores the craftsmanship and design elements that make sneakers true works of art. From custom colorways to innovative materials, sneaker designers have embraced the spirit of hip hop, pushing the boundaries of creativity and setting new trends.

Featuring interviews and insights from hip hop pioneers, designers, and collectors, this book offers a comprehensive look into the indelible impact of hip hop on sneaker culture. Gain a deeper understanding of the cultural nuances and symbolism embedded within each pair of sneakers, elevating them from mere footwear to cultural artifacts.
', CAST(N'2023-05-21' AS Date), CAST(N'2023-05-21' AS Date), N'Since entering the hip-hop scene in its early stages, adidas has evolved alongside the community. As hip-hop culture so have the Superstars.', N'2')
INSERT [dbo].[ContentCreator_Table] ([username], [title], [img], [content], [created_at], [update_at], [detail_title], [content_id]) VALUES (NULL, N'The Vans Knu Skool', N'./images/blog-03.jpg', N'The Vans Knu Skool is a cutting-edge product that combines style and functionality. Designed for the modern urban lifestyle, these shoes offer a perfect blend of comfort and durability. With their sleek design and high-quality materials, the Vans Knu Skool shoes are a must-have for trendsetters and sneaker enthusiasts alike. Whether you''re hitting the streets or hanging out with friends, these shoes will elevate your look and keep you comfortable all day long. Experience the ultimate fusion of fashion and comfort with the Vans Knu Skool. The Vans Knu Skool is not just about style, but also about performance. Equipped with advanced cushioning technology and a sturdy outsole, these sneakers provide optimal support and traction for your every step. Whether you''re skating, walking, or exploring the city streets, the Knu Skool is designed to keep up with your active lifestyle.', CAST(N'2023-06-10' AS Date), CAST(N'2023-06-10' AS Date), N'The Knu Skool is a modern interpretation of a classic 90s style, defined by its puffed up tongue and 3D-molded Sidestripe™, and tied off with oversized, chunky laces. With its in-your-face profile and dramatic style details, the Knu Skool plays off of the original Old Skool™ while blending an icon of the past with today’s trends.', N'3')
GO
SET IDENTITY_INSERT [dbo].[FeeShip_Table] ON 

INSERT [dbo].[FeeShip_Table] ([city_id], [city], [fee_shipping]) VALUES (1, N'Đà Nẵng', 5)
INSERT [dbo].[FeeShip_Table] ([city_id], [city], [fee_shipping]) VALUES (2, N'Hà Nội', 10)
INSERT [dbo].[FeeShip_Table] ([city_id], [city], [fee_shipping]) VALUES (3, N'Hồ Chí Minh', 10)
SET IDENTITY_INSERT [dbo].[FeeShip_Table] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification_Table] ON 

INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (29, N'ngoctamqb123@gmail.com', N'Not enough.', N'The product:''Adidas N''Superstar Shoes_size: ''38 you selected is currently unavailable in the store. And that product will be removed from your cart. Please choose another product', CAST(N'2023-06-22' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (30, N'ngoctamqb123@gmail.com', N'Order Success', N'Hellongoctamqb123@gmail.com , OrderYExc7XBl8W has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-06-22' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (31, N'ngoctamqb123@gmail.com', N'Not enough.', N'The product:''Adidas N''Superstar Shoes_size: ''38 you selected is currently unavailable in the store. And that product will be removed from your cart. Please choose another product', CAST(N'2023-06-22' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (32, N'ngoctamqb123@gmail.com', N'Not enough.', N'The product:''Adidas Forum Mid Shoes_size: ''38 you selected is currently unavailable in the store. And that product will be removed from your cart. Please choose another product', CAST(N'2023-06-22' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (33, N'ngoctamqb123@gmail.com', N'Not enough.', N'The product:''Adidas N''Superstar Shoes_size: ''38 you selected is currently unavailable in the store. And that product will be removed from your cart. Please choose another product', CAST(N'2023-06-22' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (34, N'ngoctamqb123@gmail.com', N'Not enough.', N'The product:''Adidas N''Superstar Shoes_size: ''38 you selected is currently unavailable in the store. And that product will be removed from your cart. Please choose another product', CAST(N'2023-06-25' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (35, N'ngoctamqb123@gmail.com', N'Order Success', N'Hello : ngoctamqb123@gmail.com , Order '' tC5CJUKG8j '' has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-06-25' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (36, N'ngoctamqb123@gmail.com', N'Order Success', N'Hellongoctamqb123@gmail.com , OrderoirL0X69eE has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-06-25' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (37, N'ngoctamqb123@gmail.com', N'Not enough.', N'The product:''Adidas N''Superstar Shoes_size: ''38 you selected is currently unavailable in the store. And that product will be removed from your cart. Please choose another product', CAST(N'2023-06-25' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (38, N'ngoctamqb123@gmail.com', N'Order Success', N'Hello : ngoctamqb123@gmail.com , Order '' fxRCiHlPYj '' has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-06-26' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (39, N'ngoctamqb123@gmail.com', N'Order Success', N'Hellongoctamqb123@gmail.com , OrderAAGDtaKnYi has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-06-26' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (40, N'ngoctamqb123@gmail.com', N'Update profile Success', N'Update profile success, view your change in your profile', CAST(N'2023-06-28' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (41, N'ngoctamqb123@gmail.com', N'Order Success', N'Hellongoctamqb123@gmail.com , Order209XL0KKnO has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-06-28' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (42, N'tamtvnde160577@fpt.edu.vn', N'Order Success', N'Hellotamtvnde160577@fpt.edu.vn , OrderBO96QIp5oV has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-06-28' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (43, N'tamtvnde160577@fpt.edu.vn', N'Order Success', N'Hellotamtvnde160577@fpt.edu.vn , OrderQuU0cOYXiI has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-06-28' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (44, N'tamtvnde160577@fpt.edu.vn', N'Order Success', N'Hellotamtvnde160577@fpt.edu.vn , OrderQulbldcN27 has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-06-28' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (45, N'ngoctamqb123@gmail.com', N'Order Success', N'Hello : ngoctamqb123@gmail.com , Order '' 92FoueCr2m '' has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-06-29' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (46, N'thanhvnde160635@fpt.edu.vn', N'Order Success', N'Hello : thanhvnde160635@fpt.edu.vn , Order '' jkRYfqjoYe '' has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-06-29' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (47, N'thanhvnde160635@fpt.edu.vn', N'Update profile Success', N'Update profile success, view your change in your profile', CAST(N'2023-06-29' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (48, N'thanhvnde160635@fpt.edu.vn', N'Order Success', N'Hellothanhvnde160635@fpt.edu.vn , OrderjTWf8LefP6 has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-06-29' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (49, N'thanhvnde160635@fpt.edu.vn', N'Order Success', N'Hellothanhvnde160635@fpt.edu.vn , OrderhreQhMgD9y has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-06-29' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (50, N'ngoctamqb123@gmail.com', N'Order Success', N'Hellongoctamqb123@gmail.com , OrdergoN5cG3UAa has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-06-29' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (51, N'ngoctamqb123@gmail.com', N'Order Success', N'Hellongoctamqb123@gmail.com , OrderQRnshVLQO7 has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (52, N'ngoctamqb123@gmail.com', N'Order Success', N'Hellongoctamqb123@gmail.com , Order4kFCqbC7PW has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (53, N'ngoctamqb123@gmail.com', N'Order Success', N'Hellongoctamqb123@gmail.com , OrderxdZs5mOcla has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (54, N'ngoctamqb123@gmail.com', N'Order Success', N'Hellongoctamqb123@gmail.com , Order7Hlkx8mGWe has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (55, N'quantade160213@fpt.edu.vn', N'Order Success', N'Helloquantade160213@fpt.edu.vn , Order7R3UAPEOL4 has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (56, N'quantade160213@fpt.edu.vn', N'Order Success', N'Helloquantade160213@fpt.edu.vn , OrderlJ1wVqbOC2 has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (57, N'quantade160213@fpt.edu.vn', N'Order Success', N'Helloquantade160213@fpt.edu.vn , OrderHgbYlMBsyc has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (58, N'tamtvnde160577@fpt.edu.vn', N'Order Success', N'Hellotamtvnde160577@fpt.edu.vn , OrderZDhmA0MRPB has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (59, N'tamtvnde160577@fpt.edu.vn', N'Order Success', N'Hellotamtvnde160577@fpt.edu.vn , OrderkrGURD70R7 has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (60, N'tamtvnde160577@fpt.edu.vn', N'Order Success', N'Hellotamtvnde160577@fpt.edu.vn , Orderox6ZGQhR1k has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (61, N'tamtvnde160577@fpt.edu.vn', N'Order Success', N'Hellotamtvnde160577@fpt.edu.vn , OrderpepQoU9nAa has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (62, N'tamtvnde160577@fpt.edu.vn', N'Order Success', N'Hello : tamtvnde160577@fpt.edu.vn , Order '' rZO7RRS5k7 '' has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (63, N'tamtvnde160577@fpt.edu.vn', N'Not enough.', N'The product:''tam tetst_size: ''45 you selected is currently unavailable in the store. And that product will be removed from your cart. Please choose another product', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (64, N'tamtvnde160577@fpt.edu.vn', N'Order Success', N'Hellotamtvnde160577@fpt.edu.vn , OrderFKFTishvAS has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (65, N'tamtvnde160577@fpt.edu.vn', N'Order Success', N'Hellotamtvnde160577@fpt.edu.vn , Order18tOUmZIuz has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (66, N'tamtvnde160577@fpt.edu.vn', N'Cancel Orders', N'Order: -18tOUmZIuz- was canceled for some reason in the store, Sorry for the inconvenience. ', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (67, N'tamtvnde160577@fpt.edu.vn', N'Order Success', N'Hello : tamtvnde160577@fpt.edu.vn , Order '' ysAJGWlFLv '' has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (68, N'tamtvnde160577@fpt.edu.vn', N'Received orders', N'Order: -ysAJGWlFLv- has been received, it will be delivered to you soon in the next few days', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (69, N'tamtvnde160577@fpt.edu.vn', N'Order Success', N'Hellotamtvnde160577@fpt.edu.vn , Order6RadjRD3YX has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-12' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (70, N'tamtvnde160577@fpt.edu.vn', N'Received orders', N'Order: -6RadjRD3YX- has been received, it will be delivered to you soon in the next few days', CAST(N'2023-07-12' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (71, N'thanhvnde160635@fpt.edu.vn', N'Order Success', N'Hellothanhvnde160635@fpt.edu.vn , OrderXzCvfSrlqK has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (72, N'thanhvnde160635@fpt.edu.vn', N'Received orders', N'Order: -XzCvfSrlqK- has been received, it will be delivered to you soon in the next few days', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (73, N'thanhvnde160635@fpt.edu.vn', N'Received orders', N'Order: -XzCvfSrlqK- has been received, it will be delivered to you soon in the next few days', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (74, N'thanhvnde160635@fpt.edu.vn', N'Order Success', N'Hellothanhvnde160635@fpt.edu.vn , OrderlNsgKOZY9K has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (75, N'thanhvnde160635@fpt.edu.vn', N'Received orders', N'Order: -lNsgKOZY9K- has been received, it will be delivered to you soon in the next few days', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (76, N'thanhvnde160635@fpt.edu.vn', N'Order Success', N'Hellothanhvnde160635@fpt.edu.vn , Orderf8p1UEoCHo has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (77, N'thanhvnde160635@fpt.edu.vn', N'Received orders', N'Order: -f8p1UEoCHo- has been received, it will be delivered to you soon in the next few days', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (78, N'thanhvnde160635@fpt.edu.vn', N'Order Success', N'Hellothanhvnde160635@fpt.edu.vn , OrderclAlQE9Zh9 has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (79, N'thanhvnde160635@fpt.edu.vn', N'Received orders', N'Order: -clAlQE9Zh9- has been received, it will be delivered to you soon in the next few days', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (80, N'thanhvnde160635@fpt.edu.vn', N'Order Success', N'Hellothanhvnde160635@fpt.edu.vn , OrdereJegPCtD7w has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (81, N'thanhvnde160635@fpt.edu.vn', N'Received orders', N'Order: -eJegPCtD7w- has been received, it will be delivered to you soon in the next few days', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (82, N'thanhvnde160635@fpt.edu.vn', N'Received orders', N'Order: -eJegPCtD7w- has been received, it will be delivered to you soon in the next few days', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (83, N'thanhvnde160635@fpt.edu.vn', N'Order Success', N'Hellothanhvnde160635@fpt.edu.vn , OrderaB3JYI2JfV has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (84, N'thanhvnde160635@fpt.edu.vn', N'Received orders', N'Order: -aB3JYI2JfV- has been received, it will be delivered to you soon in the next few days', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (85, N'thanhvnde160635@fpt.edu.vn', N'Order Success', N'Hellothanhvnde160635@fpt.edu.vn , Orderrh2ctzF0Ta has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (86, N'thanhvnde160635@fpt.edu.vn', N'Received orders', N'Order: -rh2ctzF0Ta- has been received, it will be delivered to you soon in the next few days', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (87, N'thanhvnde160635@fpt.edu.vn', N'Order Success', N'Hellothanhvnde160635@fpt.edu.vn , OrderRdn4TGe0Vg has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (88, N'thanhvnde160635@fpt.edu.vn', N'Received orders', N'Order: -Rdn4TGe0Vg- has been received, it will be delivered to you soon in the next few days', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (89, N'thanhvnde160635@fpt.edu.vn', N'Order Success', N'Hellothanhvnde160635@fpt.edu.vn , Order7zqZIFRjNB has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (90, N'thanhvnde160635@fpt.edu.vn', N'Received orders', N'Order: -7zqZIFRjNB- has been received, it will be delivered to you soon in the next few days', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (91, N'thanhvnde160635@fpt.edu.vn', N'Received orders', N'Order: -7zqZIFRjNB- has been received, it will be delivered to you soon in the next few days', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (92, N'ngoctamqb123@gmail.com', N'Order Success', N'Hellongoctamqb123@gmail.com , Orderz7dvNkLHAM has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (93, N'ngoctamqb123@gmail.com', N'Received orders', N'Order: -z7dvNkLHAM- has been received, it will be delivered to you soon in the next few days', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (94, N'ngoctamqb123@gmail.com', N'Order Success', N'Hellongoctamqb123@gmail.com , OrdertdVwW4Dx11 has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Notification_Table] ([notification_id], [username], [title], [noti_content], [create_at]) VALUES (95, N'ngoctamqb123@gmail.com', N'Received orders', N'Order: -tdVwW4Dx11- has been received, it will be delivered to you soon in the next few days', CAST(N'2023-07-13' AS Date))
SET IDENTITY_INSERT [dbo].[Notification_Table] OFF
GO
INSERT [dbo].[Order_Table] ([order_id], [username], [status_order], [delivery_address], [total_price], [created_at], [update_at], [status_Payment]) VALUES (N'7zqZIFRjNB', N'thanhvnde160635@fpt.edu.vn', N'success', N'adfasdfasfd', 140, CAST(N'2023-07-13' AS Date), CAST(N'2023-07-13' AS Date), N'COD')
INSERT [dbo].[Order_Table] ([order_id], [username], [status_order], [delivery_address], [total_price], [created_at], [update_at], [status_Payment]) VALUES (N'tdVwW4Dx11', N'ngoctamqb123@gmail.com', N'success', N'ddđ', 130, CAST(N'2023-07-13' AS Date), CAST(N'2023-07-13' AS Date), N'COD')
INSERT [dbo].[Order_Table] ([order_id], [username], [status_order], [delivery_address], [total_price], [created_at], [update_at], [status_Payment]) VALUES (N'z7dvNkLHAM', N'ngoctamqb123@gmail.com', N'faild', N'ádfasdfsa', 730, CAST(N'2023-07-13' AS Date), CAST(N'2023-07-13' AS Date), N'COD')
GO
INSERT [dbo].[OrderItems_Table] ([order_id], [product_id], [size], [quantity], [id_price]) VALUES (N'7zqZIFRjNB', 36, 38, 1, 90)
INSERT [dbo].[OrderItems_Table] ([order_id], [product_id], [size], [quantity], [id_price]) VALUES (N'tdVwW4Dx11', 2, 38, 1, 92)
INSERT [dbo].[OrderItems_Table] ([order_id], [product_id], [size], [quantity], [id_price]) VALUES (N'z7dvNkLHAM', 1, 43, 4, 91)
INSERT [dbo].[OrderItems_Table] ([order_id], [product_id], [size], [quantity], [id_price]) VALUES (N'z7dvNkLHAM', 3, 38, 1, 93)
GO
SET IDENTITY_INSERT [dbo].[Price_Table] ON 

INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (9, 1, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (10, 2, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (11, 3, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (12, 4, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (13, 5, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (14, 6, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (15, 7, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (16, 8, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (17, 9, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (18, 10, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (19, 11, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (20, 12, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (21, 13, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (22, 14, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (23, 15, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (24, 16, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (25, 17, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (26, 18, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (27, 19, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (28, 20, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (29, 21, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (30, 22, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (31, 32, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (32, 33, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (33, 34, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (34, 35, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (35, 36, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (36, 37, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (37, 38, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (38, 39, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (39, 40, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (40, 41, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (41, 42, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (42, 43, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (43, 44, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (44, 45, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (45, 46, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (46, 47, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (47, 48, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (48, 49, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (49, 50, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (50, 51, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (89, 52, 75, CAST(N'2023-06-28' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (90, 36, 80, CAST(N'2023-06-29' AS Date), CAST(N'2023-07-31' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (91, 1, 100, CAST(N'2023-05-15' AS Date), CAST(N'2023-07-15' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (92, 2, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-07-20' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (93, 3, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-07-22' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (94, 4, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-07-26' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (95, 11, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-07-22' AS Date))
INSERT [dbo].[Price_Table] ([id_price], [product_id], [input_price], [startofdate], [endofdate]) VALUES (96, 14, 75, CAST(N'2023-05-15' AS Date), CAST(N'2023-07-19' AS Date))
SET IDENTITY_INSERT [dbo].[Price_Table] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Table] ON 

INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (1, N'tam tetst', N'Adidas - ', N'tam day tam day tam day', 150, N'./imgs/R.jpg', 633, CAST(N'2023-05-15' AS Date), CAST(N'2023-07-11' AS Date), N'white-')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (2, N'Adidas Superstar Shoes', N'Adidas ', N'Originally made for basketball courts in the ''70s. Celebrated by hip hop royalty in the ''80s. The adidas Superstar shoe is now a lifestyle staple for streetwear enthusiasts. The world-famous shell toe feature remains, providing style and protection. Just like it did on the B-ball courts back in the day. Now, whether at a festival or walking in the street you can enjoy yourself without the fear of being stepped on. The serrated 3-Stripes detail and adidas Superstar box logo adds OG authenticity to your look. ', 125, N'./imgs/shoes01.jpg
', 784, CAST(N'2023-05-15' AS Date), CAST(N'2023-07-11' AS Date), N'white')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (3, N'Adidas Forum Mid Shoes', N'Adidas ', N'Let''s take a moment to honor an icon. Is it the gravity-defying B-ball legend from the ''80s? Or perhaps the status shoe that adorned the feet of rappers? Both, in fact. The adidas Forum shoes have dominated the hardwood and the streets, and they''re back in a mid top version to take your moves to the next level. Slip into the unmistakable style, now in luxurious coated leather, and flaunt that pure class.', 125, N'./imgs/shoes02.jpg
', 791, CAST(N'2023-05-15' AS Date), CAST(N'2023-07-11' AS Date), N'white')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (4, N'Adidas Nizza Platform Shoes', N'Adidas ', N'What do skinny jeans and flowy skirts have in common? Both look fantastic with a trendy platform like these adidas Nizza shoes. Step up, step out and give every outfit a little lift. Even if you''re just knocking around town.', 125, N'./imgs/shoes03.jpg
', 792, CAST(N'2023-05-15' AS Date), CAST(N'2023-07-11' AS Date), N'white')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (5, N'Adidas Ultraboost Light Running Shoes', N'Adidas ', N'Experience epic energy with the new Ultraboost Light, our lightest Ultraboost ever. The magic lies in the Light BOOST midsole, a new generation of adidas BOOST. Its unique molecule design achieves the lightest BOOST foam to date. With hundreds of BOOST capsules bursting with energy and ultimate cushioning and comfort, some feet really can have it all.', 125, N'./imgs/shoes04.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'white')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (6, N'Adidas Nizza Platform Shoes', N'Adidas ', N'What do skinny jeans and flowy skirts have in common? Both look fantastic with a trendy platform like these adidas Nizza shoes. Step up, step out and give every outfit a little lift. Even if you''re just knocking around town.', 125, N'./imgs/shoes05.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-28' AS Date), N'white')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (7, N'Adidas Ultraboost 1.0 Shoes', N'Adidas ', N'From a walk in the park to a weekend run with friends, these adidas Ultraboost 1.0 shoes are designed to keep you comfortable. An adidas PRIMEKNIT upper gently hugs your feet while BOOST on the midsole cushions from the first step to the last mile. The Stretchweb outsole flexes naturally for an energized ride, and Continental™ Rubber gives you the traction you need to keep that pep in your step.', 125, N'./imgs/shoes06.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'red')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (8, N'Adidas Samba Golf Shoes', N'Adidas ', N'The celebrated adidas Samba comes to the golf course. Made for social rounds and casual days, these adidas Samba Golf Shoes combine heritage football style with course-ready details. The spikeless outsole and cushioned midsole complement a leather upper and set you up to roll from the course to the clubhouse and beyond without looking like you just played a round.', 125, N'./imgs/shoes07.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'white')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (9, N'Adidas Campus 00s Shoes', N'Adidas ', N'Proportions are getting bigger. People are getting bolder. Inspired by the current mindset, these shoes remix the iconic adidas Campus 80s style for a fresh look that fits today''s style and culture. We''ve updated the proportions and color palette to the leather upper. Classic 3-Stripes paired with Y2K branding create a new Campus identity for you to define.', 125, N'./imgs/shoes08.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'white')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (10, N'Adidas Superstar Golf Shoes', N'Adidas ', N'Elevate your game with style. Set the tone on the course with the iconic look of the adidas Superstar Golf Shoes. From their rubber shell-toe to their classic 3-Stripes design, these hardwood-inspired golf shoes blend unmistakable adidas heritage with a spiked outsole that sets you up with a strong stance for powerful drives and accurate putts.', 125, N'./imgs/shoes09.jpg
', 796, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'white')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (11, N'Nike Y-3 QASA-ediy', N'Nike-edit', N'ádfasdfasfasfsaf', 125, N'./imgs/menu3.jpg', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-07-12' AS Date), N'red-edit')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (12, N'Nike Blazer Low ''77 Vintage', N'Nike', N'Praised for its classic simplicity and comfort, the original hoops look is your tried-and-tested wardrobe staple. With a low-profile design and a plush collar, it''s your no-brainer.', 125, N'./imgs/shoes11.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'yellow')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (13, N'Nike Air Jordan Low SE', N'Nike', N'Get into some summery fun in your new fave AJ1s. Made with a combination of suede and canvas, this pair gives you the comfort you know and love with a seasonal update.', 125, N'./imgs/shoes12.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-28' AS Date), N'green')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (14, N'Nike Air Jordan 1 Low FlyEase', N'Nike', N'Lock in your style with this AJ1. We kept everything you love about the classic design—premium leather, Air cushioning, iconic Wings logo—while adding the Nike FlyEase closure system to make on and off a breeze. Getting out the door is now quicker than ever: just strap and zip.', 125, N'./imgs/shoes13.jpg
', 798, CAST(N'2023-05-15' AS Date), CAST(N'2023-07-12' AS Date), N'green')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (15, N'Nike Dunk Low', N'Nike-edity', N'Created for the hardwood but taken to the streets, the ''80s basketball icon returns with classic details and throwback hoops flair. Channelling vintage style back onto the streets, its padded, low-cut collar lets you take your game anywhere—in comfort.', 125, N'./imgs/shoes14.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-28' AS Date), N'red')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (16, N'Nike Air Jordan 1 Low', N'Nike', N'An iconic look that lasts. This AJ1 pairs the classic design of the original with premium materials that will keep you going all day.', 125, N'./imgs/shoes15.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'blue')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (17, N'Nike Dunk Mid', N'Nike ', N'tam ne tam ne tam ne ', 125, N'./imgs/menu4.jpg', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'blue ')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (18, N'Nike Air Jordan 1 Low SE', N'Nike', N'Get into some summery fun in your new fave AJ1s. Made with a combination of suede and canvas, this pair gives you the comfort you know and love with a seasonal update.', 125, N'./imgs/shoes17.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'red')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (19, N'Nike Force 1', N'Nike', N'Lace up little feet in the Nike Force 1 for the classic look and feel of the legendary AF-1.Soft cushioning helps keep their steps feeling smooth, and leather is easy to clean.', 125, N'./imgs/shoes18.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'red')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (20, N'Nike Gamma Force', N'Nike', N'Layers upon layers of dimensional style—that''s a force to be reckoned with. Offering both comfort and versatility, these kicks are rooted in heritage basketball culture. Collar materials pay homage to vintage sport while the subtle platform elevates your look, literally. The Gamma Force is forging its own legacy: court style that can be worn all day, wherever you go.', 125, N'./imgs/shoes19.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'white')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (21, N'Nike Air Force 1 ''07 SE', N'Nike', N'Rev your ''fit, hit the club, step back to the ''00s—this AF-1 brings ritz and glitz to any occasion. Metallic Silver throughout gives your step a modern edge, while black accents and an iced outsole keep you rooted to hoops DNA. What can we say, metallic is in (as if it ever left).', 125, N'./imgs/shoes20.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'blue')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (22, N'Converse Unisex CONS AS-1 Pro Low Top White', N'Converse ', N'Meticulously designed by professional skateboarder, CONS team rider, and multidisciplinary artist Alexis Sablone.
Designed as a throwback to ''80s basketball shoes, with a ''90s-inspired cupsole, the AS-1 Pro brings timeless retro style to your look.
Designed by Alexis Sablone the AS-1 Pro mixes Alexis’ attention to detail and passion for design with Converse heritage and modern technology for skateboarding. Starting with Alexis’ affinity for the unique aesthetics of ‘90s cupsole skate shoes, the AS-1 Pro adds considered performance details and updated tech to create a cushioned close-to-the-board feel that reacts on impact. The AS-1 Pro melds functionality with versatility using a vintage court-inspired upper, responsive herringbone tread pattern for grip, TPU pods for optimal ollie cushioning in high-abrasion areas.', 125, N'./imgs/shoes21.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'blue')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (32, N'Vintas Jazico - High Top - Royal White', N'Ananas', N'The "VINTAS JAZICO - HIGH TOP - ROYAL WHITE" is a type of sneaker or athletic shoe that features a high top design and a combination of white and brown colors. The upper part of the shoe is made of a combination of synthetic leather and mesh fabric, which provides durability and breathability. The shoe also features a lace-up closure system that ensures a secure and comfortable fit, while the rubber sole provides good traction and grip on various surfaces. Additionally, the shoe has a cushioned insole that provides extra comfort during long walks. Overall, the "VINTAS JAZICO - HIGH TOP - ROYAL WHITE" is a stylish and functional shoe that is suitable for various types of activities.', 125, N'./imgs/shoes31.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'red')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (33, N'Track 6 Jazico - Low Top - Royal White', N'Ananas', N'This is a high-quality shoe product designed to provide comfort and style for the user. The shoe is made from premium materials, including leather or high-quality fabric, to ensure durability and breathability for the feet.

The design of the shoe is a sophisticated blend of style and practicality, with intricate stitching and elegant colors that make the product suitable for various types of outfits and occasions. The sole of the shoe is made from rubber or other elastic materials, making it more comfortable to walk in and reducing foot fatigue.

The product comes in a variety of sizes to fit different types of feet and can be used for various activities, from going to work or going out to engaging in light sports activities. If you are looking for a versatile, high-quality, and fashionable shoe product, then this is the perfect choice for you.', 125, N'./imgs/shoes32.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'white')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (34, N'Urbas Corluray Mix - High Top - Corluray Mix', N'Ananas', N'This is a stylish and practical sneaker designed to provide comfort and style for the wearer. The shoe is made from fabric material that ensures longevity and breathability for the feet.

The design of the sneaker is versatile, with a variety of colors and styles to choose from that suit different tastes and preferences. The product features a cushioned sole with high elasticity, which reduces fatigue and provides stability during walking or exercising.

The sneaker has a simple and easy-to-pair design, making it easy to mix and match with different outfits, from sportswear to casual wear. Additionally, the product has anti-slip and good traction features, enabling users to have better control on the street and other surfaces.

If you are looking for a stylish and practical sneaker, then this is undoubtedly an excellent choice for you.', 125, N'./imgs/shoes33.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'green')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (35, N'Track 6 I.S.E.E - Pure White/Icy Blue', N'Ananas', N'', 125, N'./imgs/R.jpg', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'green')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (36, N'Vintas Landforms - Low Top - Green Moss', N'Ananas', N'This sneaker is perfect for everyday wear and is designed to provide comfort and support for your feet. The shoe is made from high-quality materials, including a durable fabric upper and a cushioned sole, making it ideal for walking and other light activities.The simple and clean design of the sneaker makes it a versatile choice for various occasions and outfits. The neutral color of the shoe makes it easy to pair with different clothing styles, from casual wear to business attire.The cushioned sole of the sneaker provides excellent shock absorption, reducing impact on your feet during walking or standing. The flexible and lightweight outsole also ensures a natural range of motion, making it easy to move around comfortably.The sneaker''s breathable material ensures optimal air flow, preventing excessive sweating and odor build-up. The reliable grip and traction of the outsole also help to prevent slips and falls, ensuring safe and stable movement on different surfaces.', 130, N'./imgs/shoes35.jpg
', 763, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-29' AS Date), N'brown')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (37, N'Urbas SC - High Top - Aloe Wash', N'Ananas', N'rafted from high-quality and breathable fabric material, this sneaker offers flexibility and comfort, perfect for everyday use. Its light blue color gives it a refreshing and calming appearance, while the white and blue sole adds a pop of color and contrast, creating a chic and fashionable look.

The cushioned sole ensures a comfortable and supportive feel for your feet, making it ideal for walking and other light activities. The outsole is also designed to provide reliable grip and traction on different surfaces, ensuring safety and stability.

This high-top sneaker''s versatile design makes it easy to match with a variety of outfits, from casual to semi-formal wear. Its unique design and colorway make it a statement piece in any outfit, adding a touch of personality and style.', 125, N'./imgs/shoes36.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'brown')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (38, N'Urbas SC - High Top - Foliage', N'Ananas', N'Step up your shoe game with this trendy and fashionable high-low sneaker, featuring a vibrant blue fabric upper and a white sole. Designed with a high-top silhouette, this sneaker not only looks stylish but also provides support and comfort to your feet.

Crafted from high-quality fabric material, this sneaker is soft and breathable, making it perfect for everyday wear. The cushioned sole ensures a comfortable feel, while the outsole provides reliable grip and traction on different surfaces, making it a safe and stable option for walking and light activities.

The blue color gives this sneaker a bold and eye-catching appearance, while the white sole adds contrast and style, making it a standout piece in any outfit. Its versatile design allows it to be paired with different outfits, from casual to semi-formal wear, making it a practical and stylish option for any occasion.', 125, N'./imgs/shoes37.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'sliver')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (39, N'Pattas Living Journey - High Top - Vaporous Gray', N'Ananas', N'This sneaker features a clean white fabric upper with a matching white sole, and a pop of color in the form of a blue stripe around the sole. The sneaker also boasts a unique honeybee pattern, with the words "Let it" printed on the side, giving it a playful and whimsical vibe.

Crafted from high-quality and durable fabric material, this sneaker is soft and comfortable, perfect for everyday wear. The cushioned sole ensures a comfortable feel, while the outsole provides reliable grip and traction on different surfaces, making it a safe and stable option for walking and light activities.

The combination of white and blue in this sneaker makes it a versatile piece that can be paired with a variety of outfits, from casual to semi-formal wear. The playful honeybee pattern adds a touch of fun and personality to the shoe, making it stand out from the crowd.', 125, N'./imgs/shoes38.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'white')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (40, N'Basas Evergreen - High Top - Evergreen', N'Ananas', N'This particular sneaker is a versatile choice for those who value comfort and style. The high-low cut design creates a modern silhouette that is both eye-catching and functional. The upper is made from a soft and lightweight pale green fabric that provides a breathable and comfortable fit for all-day wear.

In terms of style, this sneaker is a great choice for those who appreciate a minimalist and understated look. The pale green color is subtle yet eye-catching, and the white sole provides a clean and crisp contrast. The overall design of the sneaker is sleek and streamlined, making it a versatile choice for a wide range of outfits and occasions.', 125, N'./imgs/shoes39.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'white')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (41, N'Vintas Flannel - High Top - Cement', N'Ananas', N'Put on a new layer of shoes literally with a design that marks the first appearance of Flannel fabric on familiar product shapes from Ananas. Promoting the comfort and durability advantages of "thousands of people love" Flannel fabric, along with the characteristic warm color scheme, Vintas Flannel Pack is an interesting choice for young people who love a calm and calm style. but still full of charm.', 125, N'./imgs/shoes40.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'red')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (42, N'Hunter Street Z Collection High White', N'Bitis', N'The Biti''s Hunter Street Z Collection High White is a sleek and stylish men''s athletic shoe designed for those who want to make a statement. The shoe features a white upper made from high-quality materials, which provides both durability and breathability. The upper is accented with the Biti''s logo in black, adding a subtle touch of contrast to the design.

The shoe also features a high-top cut, providing additional ankle support for active movements. The sole is made from a durable material that provides excellent traction and support for a wide range of physical activities. The outsole is also designed with a unique pattern that enhances grip on various surfaces, ensuring stability and balance during exercise.', 125, N'./imgs/shoes41.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'red')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (43, N'Biti''s Hunter Layered Upper', N'Bitis', N'Biti''s Hunter Layered Upper is a men''s sports shoe from the Biti''s Hunter brand. This is a specially designed version of premium sneakers with multi-layer overlays for a distinctive and fashionable effect. The main color of the shoe is white, creating a youthful and dynamic feeling.

Biti''s Hunter Layered Upper shoes are made of high-quality synthetic leather, providing comfort and durability. The sole is made of synthetic rubber material, with good adhesion and high friction to help users move easily and safely.

This product is designed in a modern and stylish sports style, suitable for sports activities such as running, walking, climbing, or simply daily wear. The Biti''s Hunter Layered Upper is the perfect choice for those who love comfort and unique style.', 125, N'./imgs/shoes42.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'yellow')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (44, N'Hunter Festive Low-Cut Frosty White', N'Bitis', N'Biti''s Hunter Festive Low-Cut Frosty White is a sport shoe of Biti''s shoe brand in Vietnam. The design of the shoe has a low profile and snow white color, suitable for going out, walking, or participating in sports activities.

The upper is made from a combination of synthetic leather and mesh fabric, making the shoes breathable and comfortable for the wearer. The sole is made of durable rubber, providing excellent grip and positioning on different surfaces.

The shoes are also decorated with Biti''s logos on the sides and tongue, along with a soft cushion for added comfort. The shoelace design can adjust the width of the', 125, N'./imgs/shoes43.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'orange')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (45, N'Hunter X', N'Bitis', N'Hunter X is a special version of Biti''s Hunter line of sneakers. Launched on the occasion of its 40th anniversary, these shoes offer a design full of personality and originality.

The shoe has a modern shape and a pure white color, decorated with typical Biti''s lines. The upper part of the shoe is made of synthetic leather and mesh fabric, making the shoes breathable and comfortable for the foot. The sole is made from high-quality rubber, providing excellent grip and positioning on a variety of surfaces.

The upper is decorated with Biti''s and Hunter logos along with specific details such as a long metal bar on the sole and reflective heel. In particular, the shoes also have a beautiful black leather patch at the back, creating a difference and attraction.', 125, N'./imgs/shoes44.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'orange')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (46, N'Hunter Core 3D-Airmesh Grey', N'Bitis', N'Hunter Core 3D-Airmesh Grey is a latest sports product from the Biti''s brand in Vietnam. With modern and stylish design, these shoes will be a perfect choice for those who love sports and fashion.

The upper part of the shoe is made of unique 3D-Airmesh fabric, which provides high breathability and comfort for the feet. The unique grey color is suitable for various fashion styles. The sole of the shoe is made of durable rubber material, providing excellent grip and positioning on different surfaces.

The shoes are also decorated with Biti''s and Hunter logos, along with shiny chrome details, creating a fashion highlight for the product. The shoe lace design can be adjusted for width to fit the size of the wearer''s feet.', 125, N'./imgs/shoes45.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'black')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (47, N'Vans Knu Skool Black/True White', N'Vans', N'VANS Old Skool Black/True White is a classic and iconic skateboarding shoe from the VANS brand. It features a black suede and canvas upper with the iconic white VANS side stripe. The shoe is designed with a low-top lace-up silhouette and padded collar for added comfort and support.

The shoe also has a reinforced toe cap to withstand the wear and tear of skateboarding and other activities. The sole is made of durable rubber and has a waffle tread pattern for excellent grip on a variety of surfaces.

The VANS Old Skool Black/True White is a versatile and stylish shoe that can be worn for skateboarding or casual occasions. Its timeless design has made it a popular choice for generations, and it continues to be a staple in the VANS shoe collection.', 125, N'./imgs/shoes46.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'black')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (48, N'Vans Old Skool Sentry WC Black/Marshmallow', N'Vans', N'VANS Old Skool Sentry WC Black/Marshmallow is a modern take on the classic Old Skool skateboarding shoe from the VANS brand. It features a black suede and canvas upper with the iconic white VANS side stripe, as well as a marshmallow-colored leather accent on the heel and toe.

The shoe is designed with a low-top lace-up silhouette and padded collar for added comfort and support. The Sentry WC version also has a modified sole unit that provides additional cushioning and comfort, as well as improved grip on a variety of surfaces.

The VANS Old Skool Sentry WC Black/Marshmallow is a stylish and versatile shoe that can be worn for skateboarding or casual occasions. Its updated design and added comfort features make it a great choice for those looking for a modern twist on a classic shoe.', 125, N'./imgs/shoes47.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'black')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (49, N'Vans SK8-Hi Vintage Pop Marshmallow Turtledove', N'Vans', N'The VANS SK8-HI Vintage Pop Marshmallow Turtle Dove is a classic high-top sneaker from the VANS brand, featuring a vintage-inspired colorway. The shoe has a marshmallow-colored canvas and suede upper with a turtle dove-colored VANS side stripe.

The shoe is designed with a high-top lace-up silhouette and padded collar for added comfort and support. The VANS signature waffle outsole provides excellent grip on a variety of surfaces.

The SK8-HI Vintage Pop Marshmallow Turtle Dove is a versatile and stylish shoe that can be worn for skateboarding or casual occasions. Its classic design and unique colorway make it a standout choice for those looking for a retro-inspired sneaker.', 125, N'./imgs/shoes48.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'white')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (50, N'Vans Old Skool Varsity Canvas Blue/Green', N'Vans', N'The VANS Old Skool Varsity Canvas Blue/Green is a classic and stylish skateboarding shoe from the VANS brand. The upper part of the shoe is made of durable canvas material with a blue and green color scheme, and the iconic white VANS side stripe.

The shoe is designed with a low-top lace-up silhouette and padded collar for added comfort and support. The reinforced toe cap and durable rubber sole make it ideal for skateboarding and other high-intensity activities.

The VANS Old Skool Varsity Canvas Blue/Green is a versatile and fashionable shoe that can be worn for skateboarding or casual occasions. Its unique colorway and timeless design make it a great choice for those who want a stylish and durable shoe.', 125, N'./imgs/shoes49.jpg
', 800, CAST(N'2023-05-15' AS Date), CAST(N'2023-06-26' AS Date), N'white')
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (51, N'Vans Authentic Stackform Black/True White', N'Vans', N'The VANS Authentic Stackform Black/True White is a modern update on the classic Authentic skateboarding shoe from the VANS brand. The shoe features a black canvas upper with the iconic white VANS side stripe, and a unique "Stackform" sole that provides added cushioning and support.

The shoe is designed with a low-top lace-up silhouette and padded collar for added comfort and support. The sole is made of durable rubber with a unique tread pattern for excellent grip on a variety of surfaces.

The VANS Authentic Stackform Black/True White is a versatile and stylish shoe that can be worn for skateboarding or casual occasions. Its updated design and added comfort features make it a great choice for those looking for a modern twist on a classic shoe.', 125, N'./imgs/shoes50.jpg
', 800, NULL, CAST(N'2023-06-26' AS Date), NULL)
INSERT [dbo].[Product_Table] ([product_id], [product_name], [brand], [product_description], [profit_price], [img], [quantity], [created_at], [update_at], [color]) VALUES (52, N'ádfasdfasdf', N'Nike', N'sdfgsdfgs', 125, N'./imgs/R (2).jpg', 3456, CAST(N'2023-06-28' AS Date), CAST(N'2023-06-29' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Product_Table] OFF
GO
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (1, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (1, 37, 3)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (1, 38, 59)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (1, 39, 91)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (1, 40, 93)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (1, 41, 92)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (1, 42, 99)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (1, 43, 96)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (2, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (2, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (2, 38, 84)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (2, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (2, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (2, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (2, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (2, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (3, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (3, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (3, 38, 91)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (3, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (3, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (3, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (3, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (3, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (4, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (4, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (4, 38, 96)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (4, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (4, 40, 96)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (4, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (4, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (4, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (5, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (5, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (5, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (5, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (5, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (5, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (5, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (5, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (6, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (6, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (6, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (6, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (6, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (6, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (6, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (6, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (7, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (7, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (7, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (7, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (7, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (7, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (7, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (7, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (8, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (8, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (8, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (8, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (8, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (8, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (8, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (8, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (9, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (9, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (9, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (9, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (9, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (9, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (9, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (9, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (10, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (10, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (10, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (10, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (10, 40, 96)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (10, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (10, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (10, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (11, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (11, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (11, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (11, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (11, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (11, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (11, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (11, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (12, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (12, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (12, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (12, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (12, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (12, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (12, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (12, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (13, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (13, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (13, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (13, 39, 100)
GO
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (13, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (13, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (13, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (13, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (14, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (14, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (14, 38, 99)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (14, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (14, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (14, 41, 99)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (14, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (14, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (15, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (15, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (15, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (15, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (15, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (15, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (15, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (15, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (16, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (16, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (16, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (16, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (16, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (16, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (16, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (16, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (17, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (17, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (17, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (17, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (17, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (17, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (17, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (17, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (18, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (18, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (18, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (18, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (18, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (18, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (18, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (18, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (19, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (19, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (19, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (19, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (19, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (19, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (19, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (19, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (20, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (20, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (20, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (20, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (20, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (20, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (20, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (20, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (21, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (21, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (21, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (21, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (21, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (21, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (21, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (21, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (22, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (22, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (22, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (22, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (22, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (22, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (22, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (22, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (32, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (32, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (32, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (32, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (32, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (32, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (32, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (32, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (33, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (33, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (33, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (33, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (33, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (33, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (33, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (33, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (34, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (34, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (34, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (34, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (34, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (34, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (34, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (34, 43, 100)
GO
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (35, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (35, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (35, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (35, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (35, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (35, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (35, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (35, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (36, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (36, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (36, 38, 68)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (36, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (36, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (36, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (36, 42, 95)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (36, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (37, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (37, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (37, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (37, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (37, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (37, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (37, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (37, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (38, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (38, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (38, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (38, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (38, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (38, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (38, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (38, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (39, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (39, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (39, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (39, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (39, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (39, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (39, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (39, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (40, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (40, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (40, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (40, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (40, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (40, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (40, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (40, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (41, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (41, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (41, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (41, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (41, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (41, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (41, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (41, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (42, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (42, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (42, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (42, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (42, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (42, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (42, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (42, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (43, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (43, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (43, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (43, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (43, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (43, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (43, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (43, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (44, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (44, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (44, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (44, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (44, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (44, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (44, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (44, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (45, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (45, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (45, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (45, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (45, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (45, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (45, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (45, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (46, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (46, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (46, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (46, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (46, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (46, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (46, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (46, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (47, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (47, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (47, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (47, 39, 100)
GO
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (47, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (47, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (47, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (47, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (48, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (48, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (48, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (48, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (48, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (48, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (48, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (48, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (49, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (49, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (49, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (49, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (49, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (49, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (49, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (49, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (50, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (50, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (50, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (50, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (50, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (50, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (50, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (50, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (51, 36, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (51, 37, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (51, 38, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (51, 39, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (51, 40, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (51, 41, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (51, 42, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (51, 43, 100)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (52, 36, 32)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (52, 37, 32)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (52, 38, 32)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (52, 39, 32)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (52, 40, 32)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (52, 41, 3232)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (52, 42, 32)
INSERT [dbo].[ProductDetail_Table] ([product_id], [size], [quantityOfSize]) VALUES (52, 43, 32)
GO
SET IDENTITY_INSERT [dbo].[Ship_Table] ON 

INSERT [dbo].[Ship_Table] ([ship_id], [shipper], [order_id], [time_pick_order], [reason], [phone]) VALUES (9, N'tamtvnde160577@fpt.edu.vn', N'7zqZIFRjNB', CAST(N'2023-07-13' AS Date), N'', NULL)
INSERT [dbo].[Ship_Table] ([ship_id], [shipper], [order_id], [time_pick_order], [reason], [phone]) VALUES (10, N'tamtvnde160577@fpt.edu.vn', N'z7dvNkLHAM', CAST(N'2023-07-13' AS Date), N'no rep', NULL)
INSERT [dbo].[Ship_Table] ([ship_id], [shipper], [order_id], [time_pick_order], [reason], [phone]) VALUES (11, N'tamtvnde160577@fpt.edu.vn', N'tdVwW4Dx11', CAST(N'2023-07-13' AS Date), N'', NULL)
SET IDENTITY_INSERT [dbo].[Ship_Table] OFF
GO
INSERT [dbo].[User_Table] ([username], [password], [role], [email], [fullname], [address], [created_at], [update_at], [phone], [img]) VALUES (N'ngoctamqb123@gmail.com', N'123456', N'admin', N'ngoctamqb123@gmail.com', N'Tran Viet Ngoc Tam', N'73 Nguyễn Tạo, Ngũ Hành Sơn, Đà Nẵng', CAST(N'2023-06-06' AS Date), CAST(N'2023-07-12' AS Date), N'0944549140', N'./imgs/R (1).jpg')
INSERT [dbo].[User_Table] ([username], [password], [role], [email], [fullname], [address], [created_at], [update_at], [phone], [img]) VALUES (N'quantade160213@fpt.edu.vn', N'88888888888888', N'customer', N'quantade160213@fpt.edu.vn', N'Trinh Anh Quan (K16 DN)', NULL, CAST(N'2023-06-29' AS Date), CAST(N'2023-06-29' AS Date), NULL, N'./imgs/ava_user.jpg')
INSERT [dbo].[User_Table] ([username], [password], [role], [email], [fullname], [address], [created_at], [update_at], [phone], [img]) VALUES (N'tamtvnde160577@fpt.edu.vn', N'123456', N'shipper', N'tamtvnde160577@fpt.edu.vn', N'Tran Viet Ngoc Tam (K16 DN)', NULL, CAST(N'2023-06-26' AS Date), CAST(N'2023-07-12' AS Date), NULL, NULL)
INSERT [dbo].[User_Table] ([username], [password], [role], [email], [fullname], [address], [created_at], [update_at], [phone], [img]) VALUES (N'thanhvnde160635@fpt.edu.vn', N'88888888888888', N'customer', N'thanhvnde160635@fpt.edu.vn', N'Trinh quan', N'lạdkfaaa', CAST(N'2023-06-29' AS Date), CAST(N'2023-06-29' AS Date), N'0945454552', N'./imgs/R (1).jpg')
GO
ALTER TABLE [dbo].[Cart_Table]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Table_User_Table] FOREIGN KEY([username])
REFERENCES [dbo].[User_Table] ([username])
GO
ALTER TABLE [dbo].[Cart_Table] CHECK CONSTRAINT [FK_Cart_Table_User_Table]
GO
ALTER TABLE [dbo].[CartUser_Table]  WITH CHECK ADD  CONSTRAINT [FK__CartUser___cart___45F365D3] FOREIGN KEY([cart_id])
REFERENCES [dbo].[Cart_Table] ([cart_id])
GO
ALTER TABLE [dbo].[CartUser_Table] CHECK CONSTRAINT [FK__CartUser___cart___45F365D3]
GO
ALTER TABLE [dbo].[CartUser_Table]  WITH CHECK ADD  CONSTRAINT [FK__CartUser___produ__46E78A0C] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product_Table] ([product_id])
GO
ALTER TABLE [dbo].[CartUser_Table] CHECK CONSTRAINT [FK__CartUser___produ__46E78A0C]
GO
ALTER TABLE [dbo].[ContentCreator_Table]  WITH CHECK ADD  CONSTRAINT [FK_ContentCreator_Table_User_Table] FOREIGN KEY([username])
REFERENCES [dbo].[User_Table] ([username])
GO
ALTER TABLE [dbo].[ContentCreator_Table] CHECK CONSTRAINT [FK_ContentCreator_Table_User_Table]
GO
ALTER TABLE [dbo].[Notification_Table]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Table_User_Table] FOREIGN KEY([username])
REFERENCES [dbo].[User_Table] ([username])
GO
ALTER TABLE [dbo].[Notification_Table] CHECK CONSTRAINT [FK_Notification_Table_User_Table]
GO
ALTER TABLE [dbo].[Order_Table]  WITH CHECK ADD  CONSTRAINT [FK_Order_Table_User_Table] FOREIGN KEY([username])
REFERENCES [dbo].[User_Table] ([username])
GO
ALTER TABLE [dbo].[Order_Table] CHECK CONSTRAINT [FK_Order_Table_User_Table]
GO
ALTER TABLE [dbo].[OrderItems_Table]  WITH CHECK ADD  CONSTRAINT [FK__OrderItem__order__4CA06362] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order_Table] ([order_id])
GO
ALTER TABLE [dbo].[OrderItems_Table] CHECK CONSTRAINT [FK__OrderItem__order__4CA06362]
GO
ALTER TABLE [dbo].[OrderItems_Table]  WITH CHECK ADD  CONSTRAINT [FK__OrderItem__produ__4D94879B] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product_Table] ([product_id])
GO
ALTER TABLE [dbo].[OrderItems_Table] CHECK CONSTRAINT [FK__OrderItem__produ__4D94879B]
GO
ALTER TABLE [dbo].[Price_Table]  WITH CHECK ADD  CONSTRAINT [FK__Price_Tab__produ__75A278F5] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product_Table] ([product_id])
GO
ALTER TABLE [dbo].[Price_Table] CHECK CONSTRAINT [FK__Price_Tab__produ__75A278F5]
GO
ALTER TABLE [dbo].[ProductDetail_Table]  WITH CHECK ADD  CONSTRAINT [FK__ProductDe__produ__3F466844] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product_Table] ([product_id])
GO
ALTER TABLE [dbo].[ProductDetail_Table] CHECK CONSTRAINT [FK__ProductDe__produ__3F466844]
GO
ALTER TABLE [dbo].[Rank_Table]  WITH CHECK ADD  CONSTRAINT [FK_Rank_Table_User_Table] FOREIGN KEY([username])
REFERENCES [dbo].[User_Table] ([username])
GO
ALTER TABLE [dbo].[Rank_Table] CHECK CONSTRAINT [FK_Rank_Table_User_Table]
GO
ALTER TABLE [dbo].[Ship_Table]  WITH CHECK ADD  CONSTRAINT [FK_Ship_Table_Order_Table] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order_Table] ([order_id])
GO
ALTER TABLE [dbo].[Ship_Table] CHECK CONSTRAINT [FK_Ship_Table_Order_Table]
GO
ALTER TABLE [dbo].[Ship_Table]  WITH CHECK ADD  CONSTRAINT [FK_Ship_Table_User_Table] FOREIGN KEY([shipper])
REFERENCES [dbo].[User_Table] ([username])
GO
ALTER TABLE [dbo].[Ship_Table] CHECK CONSTRAINT [FK_Ship_Table_User_Table]
GO
USE [master]
GO
ALTER DATABASE [Final_Project] SET  READ_WRITE 
GO
