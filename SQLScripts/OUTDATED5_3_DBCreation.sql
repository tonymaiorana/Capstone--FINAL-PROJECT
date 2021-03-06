USE [master]
GO
/****** Object:  Database [CircularLogic]    Script Date: 5/3/2016 11:47:46 PM ******/
CREATE DATABASE [CircularLogic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CircularLogic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\CircularLogic.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CircularLogic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\CircularLogic_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CircularLogic] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CircularLogic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CircularLogic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CircularLogic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CircularLogic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CircularLogic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CircularLogic] SET ARITHABORT OFF 
GO
ALTER DATABASE [CircularLogic] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CircularLogic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CircularLogic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CircularLogic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CircularLogic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CircularLogic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CircularLogic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CircularLogic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CircularLogic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CircularLogic] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CircularLogic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CircularLogic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CircularLogic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CircularLogic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CircularLogic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CircularLogic] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CircularLogic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CircularLogic] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CircularLogic] SET  MULTI_USER 
GO
ALTER DATABASE [CircularLogic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CircularLogic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CircularLogic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CircularLogic] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CircularLogic] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CircularLogic]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BlogImage]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogImage](
	[BlogPostID] [int] NOT NULL,
	[ImageID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BlogPost]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BlogPost](
	[BlogPostID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Title] [varchar](150) NOT NULL,
	[TextBody] [varchar](max) NOT NULL,
	[PostTime] [datetime] NULL CONSTRAINT [DF_BlogPost_PostTime]  DEFAULT (NULL),
	[ExpirationTime] [datetime] NULL CONSTRAINT [DF_BlogPost_ExpirationTime]  DEFAULT (NULL),
	[UpdateTime] [datetime] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[DeletedTime] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_BlogPost_IsDeleted]  DEFAULT ((0)),
	[IsApproved] [bit] NOT NULL CONSTRAINT [DF_BlogPost_IsApproved]  DEFAULT ((0)),
	[UserID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_BlogPost] PRIMARY KEY CLUSTERED 
(
	[BlogPostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[Color] [nchar](6) NOT NULL CONSTRAINT [DF_Category_Color]  DEFAULT (N'e79c00'),
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContentQueue]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentQueue](
	[ContentQueueID] [int] IDENTITY(1,1) NOT NULL,
	[OrigBlogPostID] [int] NULL,
	[NewBlogPostID] [int] NOT NULL,
	[QueueActionID] [int] NOT NULL,
 CONSTRAINT [PK_ContentQueue] PRIMARY KEY CLUSTERED 
(
	[ContentQueueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Image]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Image](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ImageData] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostTag]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTag](
	[BlogPostID] [int] NOT NULL,
	[TagID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QueueAction]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QueueAction](
	[QueueActionID] [int] IDENTITY(1,1) NOT NULL,
	[ActionNeeded] [varchar](20) NOT NULL,
 CONSTRAINT [PK_QueueAction] PRIMARY KEY CLUSTERED 
(
	[QueueActionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StaticImage]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaticImage](
	[StaticPageID] [int] NOT NULL,
	[ImageID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StaticPage]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StaticPage](
	[StaticPageID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](150) NOT NULL,
	[TextBody] [varchar](max) NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[DeletedTime] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_StaticPage_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_StaticPage] PRIMARY KEY CLUSTERED 
(
	[StaticPageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tag](
	[TagID] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201604221432333_InitialCreate', N'CircularLogic.UI.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C596FE436127E5F60FF83A0A7ECC269F9D8194C8CEE19386D3B6BC417A6ED206F03B6C46E0B23518A44393682FCB23CE427E52FA42851170F1DDDEAC34180609A2C7E552C5691C552D17FFDF1E7F8D38BEF19CF388ADD804CCCA3D1A1696062078E4B961333A18B6F3F989F3EFEFB5FE30BC77F317ECAE94E181D8C24F1C47CA2343CB5ACD87EC23E8A47BE6B47411C2CE8C80E7C0B3981757C78F89D75746461803001CB30C69F13425D1FA73FE0E73420360E6982BC9BC0C15ECCDBA16796A21AB7C8C771886C3C31A76E64271E8AAE83A56B8F1EAF46D910D338F35C04E2CCB0B7300D4448401105614F1F633CA3514096B3101A90F7F01A62A05B202FC67C12A72579D7F91C1EB3F958E5C01CCA4E621AF83D018F4EB8822C71F84A6A360B05820A2F40D5F495CD3A55E3C4BC7270DAF439F0400122C3D3A91731E2897953B0388BC35B4C47F9C05106791901DCAF41F47554453C303A8F3B280CEA7874C8FE3B30A6894793084F084E6884BC03E33E997BAEFD237E7D08BE623239399A2F4E3EBC7B8F9C93F7FFC327EFAA3385B9025DAD019AEEA320C411C88617C5FC4DC3AA8FB3C481C5B0CA984C2B604BE01BA671835EAE3159D227F09AE30FA671E9BE60276FE1C6F5485C70251844A3047EDE269E87E61E2EFAAD469EECFF0D5C8FDFBD1F84EB2D7A7697E9D20BFCC17122F0ABCFD84B7BE32737CCDCABB6DE5F38D96514F8EC77DDBEB2DE2FB320896C3699404BF280A225A675E9C65669BC9D4C9A410D6FD639EAFE9B369354366F25299BD02A9E90B3D8B637E4F26E966F678B3B0B4358BCD4B498469A0C4E73628D0408B01081B034A2A3AE46446072FFE43DF1D28D62DAB231C23F3BB16EE6748DB6C4E8C247AE37C03EDF810BC4590B37F271B170DF07E05588F45E867B14C7B0CD39FF47F1D3C61534C3761281F7CD28F2C38D73BB7F0A08BE4DFC3973EAEDF11A6C691E7E0D2E914D83E882B0516BE35D07F6D720A117C43947143F523B07643F1F5CBF3BC020E29CD9368EE34B3066EC4C03B846E48057849E1CF786631BEFAEE3ACA9875C5F1D680947C4979CB40CB6D41452C0A52153055D4DA2B2938974133527D58B9A51B48ACAC9FA8ACAC0BA49CA29F582A604AD7266548385B1E90A0D1FC7A6B0FB1FC8AE178FE8F6828A1A67B043E21F30C1116C63CE3DA21447A45C812EFBC62EE29F74F918D38D9F4D29A79F90970CCD6A256F483781E1BD2185DD7F6F48C584E667D761514987DB5D4E0CF09DE8D517C7769F1324DBB63BD4A6B96DE6DBD90374EE7216C781EDA65EA0C8EBF1AC4C5D7E88E18CF6144D361B31CD0313034377D991072D30375334AA3B728E3D4CB171666779CF298A6DE4C86A8409393D04CB4F54856065BAA72EDC7F259E60E938628310BB04C5E0A92EA1B25BB8C47643E4B56A4918D9F10863732F78883DE738C484316CD54417E6EAEC0E13A0E0232C4A9B86C656C5E29A0D5113B5EAD6BC2D842DD75D4ABA6CC5265B62678D5DF2F86D2386D9ACB12D1867B34ABA08A0CD54EEC240F95DA5AB018817977D3350E1C6A431501E526DC540EB1ADB8181D655F2E60C34BBA2765D7FE1BEBA6FE659BF286FFF586F54D70E6CB3A68F3D33CD2CF684311446E04836CFF339EBC42F5471390339F9FD2CE6A1AE68220C7C86693D6553C6BBCA38D46A06118DA809B034B41650FE8D5302921CAA8770792EAF513A1E45F480CDF36E8DB07CEF17602B36206357BFF55608F55F8445E3EC74FB286656588364E49D2E0B151C8541889B577DE21D94A2CBCBCA8AE9120BF789862B13E38BD1A0A096C855A3A47C32836B2937CD762DA902B23E21D95A5A12C2278D96F2C90CAE256EA3ED4A5204053DC282B554543FC20772B63CD3519C3645DFD8CAEAC078C3D8D2148C8D6F5018BA64592920E32DC68C578F7D3BEB5F51E56718961D2B0AAB0A690B4E3488D0120BBDC01A244D3F5F9F238AE688E579A68E2F9129CF56CDF69FB3AC1E9FF222E6E7404ECDFECD73BC9ACA84DA812B47241CE812A6E9B3B026CDA52B8C403DDC60557D08B82AD2F7D3C04B7CA28FB2F4A3B38F78D5F1598B8C30B604F9A5284A529914EBD6F5DF697564CF1872A58A4866F5D5D243E8749EC7A155ADEB62533D4A9EAAAAA2E8D2573B5B3D5D48D37FC5C490B1FF82B5226CC6C32AA53755904A7377ACB2B8A60A55B67647E2D5335518DED413A35280218155FABAA3D66B64AA98F59EEE8842214C1552E8EA2165B5DCA52664B563253C8D46D514DD39C8052E5574B9B78755CAA52E35F394BB57C056C82CF675475554C3548115DDDDB1CBD218717FDFE393557BBD5AEF68CDAEE1EB9DAD1A8CCD6CD6C31CCD956A832A50A5B92716AF2790C078FB5E9A94F62EBA9E49652998F54C4A83A1DF836A1FEBEB5B506385811EB3F605BEB6CD375520E8F1FA19EE46CD43BA8F8A2405F7E25E2ADC3FC7FC2ED8E155937839CC484C2357231CF1AF31C5FE88118C66BF7853CFC56C43CF096E10711738A659D589797C78742CBC89DA9FF749561C3B9EE22EAD7BA4545FB32D1490916714D94F2892CB39D678C353824A99F22BE2E09789F95B3AEA344DBAB07FA5CD07C655FC48DC5F12E87888126CFC2E97A70EF3A6A1F926B8A72F50BA6BF5EAE72FD9D003E32E028F39350E055DAEB2C2F57729BDA4C986AE21CDCAAF55DEAE43490F4072E46F7CF4F29F2ADC2A8F3CD602AB3DE4504E58F0D5D5DF6DCC5D3AC89B8DB5E6AB7C97B116A2E2EDC5507883A850F7B662152CEDBB0A077ED2F45D454F5B56BEB3584534ED1B0B97F407135F5874DF21F3913B3C051577B66DEC96A99E5B2BD4D72A57DDF5B12915B2AFE5E872B17A0FB8350AD257B08C3756CB3DD8C1AD28D51E0C7B97A6BDF1FAEC7D29C92E8B65765B89BDCDE2EB86CF6AFFA89AEB3DA81254543DEDBEB27ADBB6A6CB33EF79796ABFFAE93D33365E0BB7FB2AE96D1B9B2E03BDE7C6D6AB167ACF6C6D57E7E78E2DADF311BAF3CA66B9484BF3BD4895A66EAB5CCE72FA70C39F0760045944993D385597CA3595F9B6302C49F44CF5357A2263C97124BE124533DB7E73E5077EE364394D335B4D656B136FBEFF37F2E634CDBC35F5A2BBA8B956566CAAEAE05BF6B1A622B2B754635D9B494B497F5BCCDAF8F1FF2D95540FA2949AF7683E5FBF9D0AEA415432A4EBF4A89896BF44C3D959F92B9C707EC7EEB284607F939360BB766A1634576411E487B720514E2264686E30450E1CA967117517C8A6D0CD72CCE98BF9346FC7BE74CCB17345EE121A2614A68CFDB9574B78B120A0897F5A165E97797C17A67FFC65882980982ECBCDDF91EF13D7730AB92F1539210D048B2E784697AD256599DDE56B81741B908E405C7D4550F480FDD003B0F88ECCD0335E453630BF6BBC44F66B9901D481B42F445DEDE373172D23E4C71CA31C0F3FC1861DFFE5E3DF804FDC4F8C560000, N'6.1.3-40302')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'Contributor')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3', N'User')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'025bee71-8da8-447a-bf41-e09e601a6a60', N'1')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a6e16f3d-c129-4d66-bd72-b28f2034eafd', N'2')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'025bee71-8da8-447a-bf41-e09e601a6a60', N'Admin', N'Admin', N'Admin@Admin.com', 0, N'AJzoSMwHSpIy/fV7dbl30UOsA5KF+lbLA6bOCChIshuXOAGelQ8NzkGpAmk+wGHgTA==', N'6ad1b914-0f30-4868-bc3f-2983c6d06047', NULL, 0, 0, NULL, 1, 0, N'Admin@Admin.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a6e16f3d-c129-4d66-bd72-b28f2034eafd', N'Bill', N'Poulson', N'wrpoulson@gmail.com', 0, N'ADesQFLBbRfXOrXiHLKssAr3gPSMJLwy+krfi7yx0L5MDZl1JWcNJhitvb+v/q20WQ==', N'a15d224f-3e28-428a-a620-fba2f6f7a98e', NULL, 0, 0, NULL, 1, 0, N'wrpoulson@gmail.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fd6ea708-ee42-4e08-a5c5-c1f4ba8c8f57', NULL, NULL, N'hseligson@gmail.com', 0, N'ACDd6Tcgnjfc6QHVmmxQQ+rhOIECAL0rfbBlLkkPy6y2TdpAmp0YPn2Zeet4lFvCCA==', N'03c98b27-85f8-4522-b9ef-be28fba53d48', NULL, 0, 0, NULL, 1, 0, N'hseligson@gmail.com')
GO
INSERT [dbo].[BlogImage] ([BlogPostID], [ImageID]) VALUES (1, 1)
GO
INSERT [dbo].[BlogImage] ([BlogPostID], [ImageID]) VALUES (4, 2)
GO
INSERT [dbo].[BlogImage] ([BlogPostID], [ImageID]) VALUES (3, 3)
GO
INSERT [dbo].[BlogImage] ([BlogPostID], [ImageID]) VALUES (9, 4)
GO
INSERT [dbo].[BlogImage] ([BlogPostID], [ImageID]) VALUES (10, 5)
GO
INSERT [dbo].[BlogImage] ([BlogPostID], [ImageID]) VALUES (11, 6)
GO
INSERT [dbo].[BlogImage] ([BlogPostID], [ImageID]) VALUES (12, 7)
GO
INSERT [dbo].[BlogImage] ([BlogPostID], [ImageID]) VALUES (13, 8)
GO
INSERT [dbo].[BlogImage] ([BlogPostID], [ImageID]) VALUES (14, 9)
GO
INSERT [dbo].[BlogImage] ([BlogPostID], [ImageID]) VALUES (16, 11)
GO
INSERT [dbo].[BlogImage] ([BlogPostID], [ImageID]) VALUES (18, 13)
GO
INSERT [dbo].[BlogImage] ([BlogPostID], [ImageID]) VALUES (20, 15)
GO
INSERT [dbo].[BlogImage] ([BlogPostID], [ImageID]) VALUES (15, 10)
GO
INSERT [dbo].[BlogImage] ([BlogPostID], [ImageID]) VALUES (17, 12)
GO
INSERT [dbo].[BlogImage] ([BlogPostID], [ImageID]) VALUES (19, 14)
GO
INSERT [dbo].[BlogImage] ([BlogPostID], [ImageID]) VALUES (21, 16)
GO
SET IDENTITY_INSERT [dbo].[BlogPost] ON 

GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (1, 2, N'The Dropkick Tables', N'<p><strong>SDAFGASDF</strong></p>\r\n<p style=\"text-align: right;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<ul>\r\n<li><strong>asdfasd</strong></li>\r\n</ul>', NULL, NULL, CAST(N'2016-04-20 16:47:00.000' AS DateTime), CAST(N'2016-04-20 16:47:00.000' AS DateTime), NULL, 0, 0, N'025bee71-8da8-447a-bf41-e09e601a6a60')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (2, 8, N'The Importance of Accurate Project Scope', N'<p><strong>SDAFGASDF</strong></p>\r\n<p style=\"text-align: right;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<ul>\r\n<li><strong>asdfasd</strong></li>\r\n</ul>', CAST(N'2016-05-21 16:47:00.000' AS DateTime), NULL, CAST(N'2016-04-21 16:47:00.000' AS DateTime), CAST(N'2016-04-21 16:47:00.000' AS DateTime), NULL, 0, 0, N'025bee71-8da8-447a-bf41-e09e601a6a60')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (3, 6, N'Will Project Ride Finally Dethrone Visual Studio?', N'<p><strong>SDAFGASDF</strong></p>\r\n<p style=\"text-align: right;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<ul>\r\n<li><strong>asdfasd</strong></li>\r\n</ul>', NULL, NULL, CAST(N'2016-04-20 16:47:00.000' AS DateTime), CAST(N'2016-04-20 16:47:00.000' AS DateTime), NULL, 0, 0, N'025bee71-8da8-447a-bf41-e09e601a6a60')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (4, 9, N'Is Twitter''s API Due for a Refresh?', N'<p><strong>SDAFGASDF</strong></p>\r\n<p style=\"text-align: right;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<ul>\r\n<li><strong>asdfasd</strong></li>\r\n</ul>', NULL, NULL, CAST(N'2016-04-20 16:47:00.000' AS DateTime), CAST(N'2016-04-20 16:47:00.000' AS DateTime), NULL, 0, 0, N'025bee71-8da8-447a-bf41-e09e601a6a60')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (5, 1, N'Will JavaScript Ever Die?', N'<p><strong>SDAFGASDF</strong></p>\r\n<p style=\"text-align: right;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<ul>\r\n<li><strong>asdfasd</strong></li>\r\n</ul>', NULL, NULL, CAST(N'2016-04-21 16:47:00.000' AS DateTime), CAST(N'2016-04-21 16:47:00.000' AS DateTime), CAST(N'2016-04-22 16:47:00.000' AS DateTime), 1, 1, N'025bee71-8da8-447a-bf41-e09e601a6a60')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (6, 4, N'The Difference Between TempData and Session Data in MVC', N'<p><span style="text-decoration: underline;"><strong>TempData</strong></span></p>
<p><span>TempData allow us to persisting data for the duration of single subsequent request.</span></p>
<p><span>ASP.net MVC will automatically expire the value of tempdata once consecutive request returned the result (it means, it alive only till the target view is fully loaded).</span></p>
<p>TempData has Keep method to retention the value of TempData.</p>
<p><strong>Example:</strong></p>
<ul>
<li>TempData.Keep()</li>
<li>TempData.Keep(&ldquo;EmpName&rdquo;)</li>
</ul>
<p>TempData internally stored the value in to Session variable.</p>
<p>&nbsp;</p>
<p><span style="text-decoration: underline;"><strong>Session Data</strong></span></p>
<p>Session is able to store data much more long time, until user session is not expire.</p>
<p>Session will be expire after the session time out occurred.</p>
<p>Session varible are stored in SessionStateItemCollection object (Which is exposed through the HttpContext.Session property of page).</p>
<p>&nbsp;</p>
<p><span style="text-decoration: underline;"><strong>Conclusion:</strong></span></p>
<p><span>TempData and session, both required typecasting for getting data and check for null values to avoid run time exception.</span></p>
<p>&nbsp;</p>
<p>&nbsp;</p>', NULL, NULL, CAST(N'2016-04-26 10:59:20.233' AS DateTime), CAST(N'2016-04-26 10:59:20.233' AS DateTime), NULL, 0, 0, N'fd6ea708-ee42-4e08-a5c5-c1f4ba8c8f57')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (7, 7, N'How Agile is Your Team?', N'<p><strong>SDAFGASDF</strong></p>\r\n<p style=\"text-align: right;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<ul>\r\n<li><strong>asdfasd</strong></li>\r\n</ul>', CAST(N'2016-04-21 16:47:00.000' AS DateTime), CAST(N'2016-04-22 16:47:00.000' AS DateTime), CAST(N'2016-04-21 16:47:00.000' AS DateTime), CAST(N'2016-04-21 16:47:00.000' AS DateTime), NULL, 0, 0, N'025bee71-8da8-447a-bf41-e09e601a6a60')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (8, 4, N'The Difference Between TempData and Session Data in MVC', N'<p><span style="text-decoration: underline;"><strong>TempData</strong></span></p>
<p><span>TempData allow us to persisting data for the duration of single subsequent request.</span></p>
<p><span>ASP.net MVC will automatically expire the value of tempdata once consecutive request returned the result (it means, it alive only till the target view is fully loaded).</span></p>
<p>TempData has Keep method to retention the value of TempData.</p>
<p><strong>Example:</strong></p>
<ul>
<li>TempData.Keep()</li>
<li>TempData.Keep(&ldquo;EmpName&rdquo;)</li>
</ul>
<p>TempData internally stored the value in to Session variable.</p>
<p>&nbsp;</p>
<p><span style="text-decoration: underline;"><strong>Session Data</strong></span></p>
<p>Session is able to store data much more long time, until user session is not expire.</p>
<p>Session will be expire after the session time out occurred.</p>
<p>Session varible are stored in SessionStateItemCollection object (Which is exposed through the HttpContext.Session property of page).</p>
<p>&nbsp;</p>
<p><span style="text-decoration: underline;"><strong>Conclusion:</strong></span></p>
<p><span>TempData and session, both required typecasting for getting data and check for null values to avoid run time exception.</span></p>
<p>&nbsp;</p>
<p>&nbsp;</p>', NULL, NULL, CAST(N'2016-04-26 11:00:38.413' AS DateTime), CAST(N'2016-04-26 11:00:38.413' AS DateTime), NULL, 0, 0, N'fd6ea708-ee42-4e08-a5c5-c1f4ba8c8f57')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (9, 5, N'Introducing the Microsoft .NET Framework Repair Tool Version 1.3', N'<div id="ipsum">
<p>Substring curry function data type operator precedence bom back-face culling forth actionscript. Hex editor ide eval scratch clojure compilation method overloading variable pascal case pickling. Mumps ambient occlusion generation language eq first generation language if else java reserved words process. Cocoa touch ascii transcompiler absolute address systems engineer ruby programming in logic switch statement oop. Dump circuit satisfiability problem jscript gw basic 1gl code refactoring sgml reserved character. Xml if else thread block action statement base address bugfairy camel book pseudo-operation jre.</p>
<p>Pod autohotkey gang of four declare object code gang of four data flow diagram. Program listing agile development methods turing completeness high-level language applet subprogram data flow diagram. Dataflow programming parenthesis run time dereference operator special purpose language operator associatively. Cocoa cobol bom generation language first-class object babel c++ local optimum machine language. Javascript nda gcc captured variable source code jscript regular expression lambda calculus base address. Hash 5gl debugging stubroutine alert interpreted character encoding personaljava flag discrete optimization magic quotes.</p>
<p>Source front end nbsp xna persistent memory zombie picojava literal agile development methods batch job. Indirection operator program csat compile applet data source servlet logic programming shebang pascal. Flag cpan genetic programming f programming language operator eclipse escape php memoization pseudo-operation underflow. Pdl random seed die middleware revision control picojava random nested loop join.</p>
<p>Hwclock inheritance comment intermediate language rem true c++ html csat matlab rom basic automata-based programming. Bit shift bom void chaos model general-purpose language open database connectivity autohotkey module jcl flat file. Curly bracket dylan programming language process tcl/tk assembly nda mbean switch statement java native language. Server side absolute address personaljava false open database connectivity jvm object file backpropagation neural network. Scheme programming language routine systems engineer else if reia assembler source data lookup table.</p>
</div>', NULL, NULL, CAST(N'2015-08-27 03:07:44.373' AS DateTime), CAST(N'2015-08-27 03:07:44.373' AS DateTime), NULL, 0, 1, N'a6e16f3d-c129-4d66-bd72-b28f2034eafd')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (10, 2, N'Security and flexibility with SQL Server 2016’s hybrid cloud solutions', N'<div class="container" style="box-sizing: border-box; margin-right: auto; margin-left: auto; padding-left: 15px; padding-right: 15px; width: 1170px; color: #333333; font-family: ''Open Sans'', sans-serif; font-size: 14px; line-height: 20px;">
<div class="row" style="box-sizing: border-box; margin-left: -15px; margin-right: -15px;">
<div class="col-xs-10" style="box-sizing: border-box; position: relative; min-height: 1px; padding-left: 15px; padding-right: 15px; float: left; width: 975px;">
<div id="ipsum" style="box-sizing: border-box;">
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-size: 18px; line-height: 30px;">Agile manifesto heuristic evaluation cocoa touch api newline generation language language processor instructions. Server side scripting jsr gtk pseudocode vhdl generation language webgl eight queens problem. Glitch comment source computer code refactoring complementarity prolog do smalltalk automated unit testing. Dump false smalltalk javac bit shift lexical analysis mbean jdk backpropagation neural network.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-size: 18px; line-height: 30px;">Lua true turing completeness software library native compiler html head source data. Pickling html procedure gtk public c++ commutative operation memoization persistent memory debugger lexical analysis. Hex editor hiew floating-point automata-based programming reia scratch machine language go language module. Linker null pointer true debug actionscript pick relational algebra brooks hungarian notation.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-size: 18px; line-height: 30px;">Syntax error reia stdin if else jdbc sparse matrix reserved character html element source data. Escape character octave xslt classpath algorithm inheritance algorithm alert programmer comment generation language sql. Purebasic hard code acm first-class object bracket loop errorlevel for bind seed escape sequence debugging. Ternary operator gcc build computer void subscript spooling api subversion javax object module integer. Gang of four loop reserved character acm pointer python transcompiler advanced scsi programming interface gw basic. Background thread scheme programming language dead code conditional expression constructor chaining xslt exception spooling.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-size: 18px; line-height: 30px;">Standard attribute jdbc bytecode class for event listener camelcase xoxo subprogram dissembler html thread. Hungarian notation standard attribute hex editor language processor exception handling coffeescript webgl immutable object pascal case. Recursive void magic quotes lookup table jit nonexecutable statement spl operator datalog interpreted instance. Command language tail recursion glitch constructor chaining tcl/tk data source pseudocode sandbox ge. System development embedded java 4gl captured variable eight queens problem isapi xml /r data source.</p>
</div>
</div>
</div>
</div>
<footer style="box-sizing: border-box; padding: 2em 0px; position: relative; z-index: 1; color: #333333; font-family: ''Open Sans'', sans-serif; font-size: 14px; line-height: 20px;"></footer>', NULL, NULL, CAST(N'2016-02-12 03:59:18.237' AS DateTime), CAST(N'2016-02-12 03:59:18.237' AS DateTime), NULL, 0, 1, N'a6e16f3d-c129-4d66-bd72-b28f2034eafd')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (11, 3, N'News from Xamarin Evolve: What’s next for Visual Studio and Xamarin', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Ide systems engineer java turbo pascal wml servlet declaration go language assembly. Programmer lut systems programming language algol agile manifesto server side scripting parse scheme programming language. Software life cycle logo errorlevel seed nda seed pixel shader inherent error. .net eq hiew exception handling debugging circuit satisfiability problem eq prolog debug msvc integer. Elsif p-code rpg front end event qt framework reia substring genetic programming lexicon.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Tcl/tk reserved character qt octave django chaos model sparse matrix nodelist unary operator. Vhdl xor operator mbean mercurial pseudocode jni bind function or operator html form element. Perl 5gl lisp lexical analysis sql agile development methods applet odbc oop epoch. Background thread abend object module odbc karel f# background thread tcl/tk shell scripts.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Run time ge else if loop invalid bean safe font int recursive real number. Xsl event eq inheritance event rcs object file fortran sdk programming in logic eclipse. Procedure module machine language integer circuit satisfiability problem javascript push perl bool curry. Source computer lexical analysis high-level language bug tracking ge ocaml common business oriented language. Hdml segfault operand code refactoring object module input/output statement noncontiguous data structure reserved character developer.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Django sgml nan label 4gl fifth generation language recursion false turbo pascal immutable object. Bracket jsr nested function haskell inheritance invalid module thread unit test instance shell scripts. Substring underflow array backend parse low-level language dde jsr flag api bugfairy. Agile development methods noncontiguous data structure webgl ecmascript declare lua json subprogram data type. Quick-and-dirty hello world p-code pipe switch statement short-circuit operator char non-disclosure agreement.</p>', NULL, NULL, CAST(N'2015-10-02 03:43:04.567' AS DateTime), CAST(N'2015-10-02 03:43:04.567' AS DateTime), NULL, 0, 1, N'a6e16f3d-c129-4d66-bd72-b28f2034eafd')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (12, 6, N'Anatomy of a Low Impact Visual Studio Install', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Language processor %1 opengl polygon tk middleware lisp debugging code loophole software development phases. Syntax error workspace declare /n simulated annealing loop nan block false pointer eval. Glue code declare bcpl object code module overload lut intellij idea reia cocoa touch. Qt code refactoring xslt polymorphism complementarity jscript revision control instantiation logical operation. Java event handler pixel shader one-pass compiler segfault short-circuit operator map tcl. Cocoa special purpose language forth inherent error curry decompiler dump rad functional programming.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Phrase tag monte carlo method msvc front end kit control flow command language. Unary operator spaghetti code msdn s-expression agile development methods no-operation instructions c sharp expression instructions. .net floating-point newline separator kludge programming hello world xsl c sharp exception handling. Remark scanf dde cocoa sgml crapplet discrete optimization server side scripting ascii quick-and-dirty. Segfault node.js camelcase ecmascript epoch xoxo forth turing completeness branch datalog bugfairy jil safe font.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Inherent error cpl bitwise operators shell scripts smalltalk autohotkey /n nested loop join. Lambda calculus agile manifesto node.js dribbleware goto exception handling reserved character bind lisp parenthesis. Method access violation revision control for pick instructions variable function religion of chi run time. Endless loop language quick-and-dirty reverse engineering $1 actionscript p-code whole number objective-c. Common business oriented language reia phrase tag systems engineer array of pointers object-oriented programming. General-purpose language if statement eq overflow error shebang compiler first generation language conditional expression exec.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Personaljava jni automata-based programming switch statement sgml object file event listener abend. Reserved character 5gl segfault object-oriented programming acm general-purpose language d stdin ternary operator. F# inherent error escape character haskell applet personaljava pop jdbc spooling dead code array. Epoch qt sparsity qt thread picojava camelcase hdml $1 jbuilder newline gigo ide fifth generation language. Dml stylesheet stack pointer declare object file ocaml declare nbsp foreach gaussian pyramid direct address.</p>', NULL, NULL, CAST(N'2015-12-17 03:52:36.590' AS DateTime), CAST(N'2015-12-17 03:52:36.590' AS DateTime), NULL, 0, 1, N'a6e16f3d-c129-4d66-bd72-b28f2034eafd')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (13, 1, N'Angular 2 + Meteor: the Javascript stack of the future', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Mutex forth generation language gt bcpl software library lt low-level language while. Operator associatively nested function cpl dataflow programming null prolog karel bracket ruby persistent memory. Dml css editor s-expression null pointer operand high-level language pod aspi django phrase tag. If else for xoxo fortran constructor chaining push instance compiler dereference operator pointer. Die cc literal server side magic quotes mutex mutex repl hdml exception handling r programming language.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Sgml pipe token language processor reserved word servlet cc label gcc jbuilder eof programming in logic. Nonexecutable statement rcs variable c sharp opengl polygon hypertext markup language command language. Inherent error simulated annealing vb short-circuit operator package cvs seed reserved character. Random char exception handling dml while nodelist switch statement private object file invalid. Class babel dhtml gpl simulated annealing bean regex direct address coffeescript batch file. Automated unit testing return address routing algorithm rust kit nonexecutable statement automata-based programming.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Debug metalanguage scanf debugging quick-and-dirty camelcase brooks math element forth debug loophole dhtml. Declare jsp pastebin game of life stylesheet exists implicit parallelism diff else applet math. Systems engineer rom basic transcompiler floating-point shell scripts pascal case pseudolanguage personaljava object code. Jscript repl second generation language autohotkey random or operator matlab special purpose language matlab pastebin. Stylesheet gaussian pyramid python bug escape character software engineering subversion declare spl ge gcc.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Camel book \1 assembly program listing hex editor integer common business oriented language race condition. Dereference operator zombie ada race condition substring security descriptor definition language base address haskell. Ada diff declaration \1 prolog ternary operator hiew dead code command language boolean ipc overflow error. Source superclass subroutine procedure javax event listener escape absolute coding ipc curly bracket declaration.</p>', NULL, NULL, CAST(N'2015-11-11 03:47:18.217' AS DateTime), CAST(N'2015-11-11 03:47:18.217' AS DateTime), NULL, 0, 1, N'a6e16f3d-c129-4d66-bd72-b28f2034eafd')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (14, 1, N'How to create a simple blog using ASP.NET MVC', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Stack xna escape character ruby stack sql assembly lut wml karel cpl programming tools. Logo 4gl backend json schema matching exception logo no-operation instructions implicit parallelism turing completeness routing algorithm. 4gl regex c# visual studio xoxo msvc return address map json dribbleware transcompiler gcc jdk. Immutable object c# function nested loop join high-level language python html element floating-point. Escape bug xslt /r reia process linker low-level language object module ecmascript parenthesis.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Meta-character instantiation module constructor chaining epoch server side scripting css editor lexical analysis workspace. 2gl array of pointers natural language aggregation direct address event handler cc. Pointer loop compiler data type c sharp operator associatively or operator bytecode strong typed language. General-purpose language /r implicit parallelism mumps visual basic high-level language single step. Absolute address p-code direct address shell scripts repl nbsp expression glue code monte carlo method.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Method whole number cocoa touch nan heap decompiler parse natural language server side scripting overflow error. Servlet backpropagation neural network remark sandbox lambda calculus while 4gl software development phases discrete optimization. Nda c# css editor statement chaos model null general-purpose language constructor chaining instructions hypertext markup language. Integer declaration error pointer procedural language agile manifesto array ecmascript linker java champion. Nan forth generation language camel book integer soap sgml smalltalk sgml gang of four direct address.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Concurrency cocoa touch no-operation instructions msvc ipc lua ide loosely typed language. Instantiation closure back-face culling machine language interpreted ada reserved word java native language. Markup language pseudo-operation common gateway interface purebasic glitch java me thread native compiler rom basic. True lua return address interpreted linker smalltalk ide polymorphism complementarity decompiler recursion beanshell.</p>', NULL, NULL, CAST(N'2016-01-25 03:55:19.813' AS DateTime), CAST(N'2016-01-25 03:55:19.813' AS DateTime), NULL, 0, 1, N'a6e16f3d-c129-4d66-bd72-b28f2034eafd')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (15, 1, N'Disabling session affinity in Azure App Service Web Apps (Websites)', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Dereference operator intermediate language pick 4gl procedure class hash program listing node.js. Instance javascriptcore \1 socket p-code char jit objective-c heap map xhtml real number stubroutine. Html head cpl lambda calculus whole number lisp glue code subscript software development phases. Null character array of pointers lexical analysis instantiation bracket ipc third-generation language. Xsl ge natural language dynamic dump scanf captured variable jil pseudo-operation endian classpath. Revision control lookup table non-disclosure agreement boolean jvm regex loophole 2gl run time.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Meta-character repeat counter activex subversion programming ascii gw basic isapi safe font computer science. Pseudocode false seed overload interpreter r programming language character encoding 3gl exception. Go language source data ipc nested function mercurial mutex phrase tag software life cycle. Soft action statement visual studio eight queens problem pointer fortran ada cocoa picojava. Random seed purebasic real number gang of four absolute address command language.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Ide compiler subprogram eight queens problem process agile manifesto absolute address recursive boolean. Object-oriented programming java revision control inherent error pascal case algorithm sgml ternary operator. Datalog api software development process javac declarative programming parenthesis dissembler algorithm server side scripting mutex. Section map sgml lisp safe font activex middleware ecmascript functional programming css compressor logic programming. Html element java reserved words activex software engineering goto stubroutine true basic. Routing algorithm event event-driven programming dragon book rom basic go language standard attribute fortran stubroutine.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Reverse engineering signedness phrase tag logic programming quick-and-dirty php flat file thread gt /r. Substring object module source data substring wml reserved word pascal case repeat counter recursive. Spl pod middleware rom basic csat signedness programming in logic abend html form element 1gl. Tuple cocoa backend xor operator random logical operation jsp flat file exponential backoff. Method single step pascal object module nested function floating-point algorithm batch job vb pdl.</p>', NULL, NULL, CAST(N'2016-03-05 04:02:37.270' AS DateTime), CAST(N'2016-03-05 04:02:37.270' AS DateTime), NULL, 0, 1, N'a6e16f3d-c129-4d66-bd72-b28f2034eafd')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (16, 1, N'The Holy Trinity of Web Development', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Llvm css editor lexicon mumps bracket compute aggregation void third-generation language base address. Local optimum input/output statement hard code unit test public bean or operator. Discrete optimization algol jcl stdin visual studio if else lambda calculus unary operator django. Visual studio inline source recursive code dissembler rpg char endless loop char nan open database connectivity. Vb vb gcc special purpose language odbc visual basic rust software life cycle.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Reverse engineering run time jdbc pascal case kludge captured variable implicit parallelism jdk switch statement. Karel z-buffering cocoa touch stack bug tracking dde procedure subprogram software development phases. Absolute coding intellij idea error assembly ecmascript babel metalanguage iteration dynamic dump p-code loop. Return statement glitch python pickling background thread superclass int phrase tag security descriptor definition language.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Programming systems engineer boolean algol ipc curry library declarative programming spooling data source. Reia security descriptor definition language gcc activex system development assembler metaclass tcl %1 xhtml. Common business oriented language function hard code local optimum memoization /r common gateway interface. Rpg generation language noncontiguous data structure arithmetic operator beanshell autohotkey kluge ada software engineering.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Hungarian notation exists karel sandbox dense matrix jhtml rem discrete optimization algol. Remark exception routing algorithm hash oop security descriptor definition language qi hungarian notation concatenation language processor. Natural language statement pointer action statement imperative programming ocaml node.js intermediate language turing completeness. Fifth generation language xhtml c# metalanguage workspace gt javafx ne f programming language. Operator precedence jcl spaghetti code beanshell bracket relational algebra background thread control flow.</p>', NULL, NULL, CAST(N'2015-09-21 03:38:33.283' AS DateTime), CAST(N'2015-09-21 03:38:33.283' AS DateTime), NULL, 0, 1, N'a6e16f3d-c129-4d66-bd72-b28f2034eafd')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (17, 3, N'Understanding the Git Workflow', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Interpreter if statement conditional statement software development process r programming language coffeescript assembly applet. Natural language dissembler common gateway interface dependent variable loophole pixel shader alert jscript. Standard attribute random seed rust xna access violation java reserved words circuit satisfiability problem. Reverse engineering base address input/output statement agile development methods shebang closure common business oriented language. Developer javascriptcore jsr jdbc sql c++ css compressor repeat counter dde jre metalanguage exists.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Abend purebasic push javac jdk for sparsity persistent memory c++ system development argument. C# private underflow thread heap go language label binary search html head gtk r programming language. Jhtml dragon book dereference operator eq machine language scala programmable /n phrase tag. Xml pop soap closure aop dml subroutine fortran language processor kludge procedural language literal private. General-purpose language /n nan 3gl programmer no-operation instructions haskell gigo lambda calculus phrase tag.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Xslt debugging xml epoch iteration bugfairy perl separator coffeescript bom exception multi-pass compiler ocaml. Systems engineer operator associatively curry logo error source computer crapplet heap live script. Objective-c aspi algol pipe simulated annealing lisp c# gaussian pyramid html form element rcs. Automated unit testing tail recursion intermediate language gaussian pyramid stylesheet ocaml forth while exception handling.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Mbean escape sequence debugger associative operation ne module nonexecutable statement diff meta-character. Rcs codepage compile bracket instructions stubroutine natural language inheritance iteration low-level language circuit satisfiability problem. Rom basic programmer bugfairy int invalid error lookup table system development nil pointer. Flag map pseudo-operation 2gl server side scripting c++ character code flat file markup language. Fifth generation language perl curly bracket pseudocode circuit satisfiability problem else z-buffering branch source computer. Elsif css compressor conditional expression rust scheme programming language html form element game of life.</p>', NULL, NULL, CAST(N'2015-12-02 03:51:09.280' AS DateTime), CAST(N'2015-12-02 03:51:09.280' AS DateTime), NULL, 0, 1, N'a6e16f3d-c129-4d66-bd72-b28f2034eafd')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (18, 3, N'Writing Great Unit Tests: Best and Worst Practices', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Rom basic dhtml \1 repl polymorphism value aop if statement mutex loop cc nonexecutable statement. Underflow function run time lexicon bracket random command language javascriptcore repeat counter endless loop. Dribbleware reserved character library objective-c spooling xoxo high-level language meta-character push interpreted datalog. Return address interpreter object file third-generation language source code gaussian pyramid kluge dissembler.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Dml bool second generation language lut ne /r bcpl metalanguage high-level language algol. Subscript base address bugfairy method overloading loony bin html form element darkbasic declaration eof babel. Ruby f programming language true 2gl source computer mumps parse comment instance lt subprogram. Framework diff mercurial subversion kluge recursive exception math object-oriented programming nodelist exponential backoff. Captured variable local optimum obfuscated code associative operation node.js access violation program generator. Invalid hello world else regular expression loosely typed language system development kludge standard attribute.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Genetic programming java ee else haskell race condition nested loop join base address source pop. R programming language stack program generator foreach hiew pipe object module endless loop standard attribute. Source computer esac language processor function babel true basic null character server side scripting monte carlo method. Operator metaclass high-level language routing algorithm 4gl mutex framework integer opengl polygon mutex linker whole number.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Syntax error event listener php language processor jit value event listener rust. Signedness pastebin object code substring pastebin jil nodelist hiew package middleware eight queens problem. Javax algol loophole api subversion instructions first-class object forth python background thread immutable object. Inherent error security descriptor definition language bean repl concat random xsl arithmetic operator. Clr constructor chaining jvm hungarian notation compile spooling prolog monte carlo method java native language. Pointer operator associatively aop stdin absolute address branch endian shebang assembler do javac.</p>', NULL, NULL, CAST(N'2015-10-23 03:44:19.480' AS DateTime), CAST(N'2015-10-23 03:44:19.480' AS DateTime), NULL, 0, 1, N'a6e16f3d-c129-4d66-bd72-b28f2034eafd')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (19, 2, N'LINQ vs Java''s Lambda Expressions', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">C servlet tk fortran element foreach cpan boolean pseudolanguage xslt coffeescript epoch. Data type loosely typed language for p-code api real number racket quick-and-dirty pixel shader dhtml. Push gtk array nda pseudocode magic quotes logic programming language processor cpl. Conditional expression label kit jre pascal case data flow diagram syntax error.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Pointer sparse matrix hal char gigo pod pseudocode garbage collection xna mercurial. Common gateway interface backpropagation neural network jre interpreted real number jdbc perl curry pseudolanguage flat file. Reia else if event 3gl return address lookup table declarative programming command language back-face culling. Object file eq flag html jsp exception invalid native language parse non-disclosure agreement first generation language. Perl inline logic programming switch statement front end non-disclosure agreement camel book alert compiler.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Instantiation safe font garbage collection eq tcl nonexecutable statement camel book subscript hungarian notation. Logical operation first-class object rom basic %1 intermediate language bracket rad comment ne signedness sql. Public pod dhtml curly bracket gaussian pyramid xhtml ide debugger true concat repeat counter pascal. Library functional programming programmable tcl/tk exception pseudocode reserved word json immutable object first-class object.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">/n aspi endless loop picojava objective-c intermediate language program listing loony bin clr phrase tag. Dml operator precedence html element s-expression embedded java procedure pdl ecmascript gtk octave matlab interpreter. Dense matrix java operator language processor magic quotes jhtml purebasic nested loop join. Conditional statement nested loop join non-disclosure agreement logo /n %1 live script. Segfault eof bool dribbleware gt binary search argument iteration inherent error endless loop. Lookup table or operator public mumps soap pointer floating-point public operator precedence haskell.</p>', NULL, NULL, CAST(N'2016-04-17 04:11:29.950' AS DateTime), CAST(N'2016-04-17 04:11:29.950' AS DateTime), NULL, 0, 1, N'a6e16f3d-c129-4d66-bd72-b28f2034eafd')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (20, 3, N'Why Understanding Dependency Injection is Important', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Null label flag back-face culling back-face culling lua boolean computer science recursion goto beanshell. Compiler inline thread cc dylan programming language pick pickling aop javax if statement local optimum. Concatenation bug relational algebra heap django soap void operator associatively real number declare. Soap loop local optimum one-pass compiler .net method overloading one-pass compiler escape sequence software development process. Eight queens problem pastebin superclass hal hypertext markup language xna circuit satisfiability problem. Nested function concat push relational algebra imperative programming hypertext markup language go language.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Heap object-oriented programming segfault method overloading lt hello world third-generation language html form element ambient occlusion. Karel routing algorithm purebasic die vim pascal method overloading reverse engineering general-purpose language. Common gateway interface switch statement if statement statement undefined revision control character code non-disclosure agreement. Source computer kludge recursive automated unit testing endless loop false relational algebra stdin. Event kit object code goto /r int pseudocode d forth generation language forth generation language. Java me html xsl dynamic dump reserved character tcl/tk character code exists.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">Source computer native language aop jsr void functional programming loop oop visual studio pop. Dead code bug tracking object-oriented programming pickling signedness source code sparsity inline single step bitwise operators. Boolean nested function transcompiler background thread revision control ternary operator object-oriented programming debugger data flow diagram. Servlet html head tcl/tk floating-point array of pointers sandbox compilation escape character stdin. Socket direct address schema matching $1 pdl ada dom subversion race condition event listener.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: ''Open Sans'', sans-serif; font-size: 18px; line-height: 30px; color: #333333;">/n jre sparse matrix curly bracket ipc native compiler node.js stylesheet library sgml. Javabean css event handler alert standard attribute eof node.js batch job automated unit testing dereference operator. Esac imperative programming rom basic json jhtml debug machine language pseudo-operation obfuscated code. Conditional statement java me function soft cocoa c# jni public software development phases. Sparsity live script overload jdk system development glue code complementarity hard code. Camel book bcpl true basic automata-based programming object module spaghetti code developer java reserved words.</p>', NULL, NULL, CAST(N'2016-03-26 04:07:26.990' AS DateTime), CAST(N'2016-03-26 04:07:26.990' AS DateTime), NULL, 0, 1, N'a6e16f3d-c129-4d66-bd72-b28f2034eafd')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (21, 9, N'Getting Started with ASP.NET Web API 2', N'<div id="ipsum">
<p>Null character sparse matrix .net label visual studio sparse matrix boolean operand agile development methods. Operator literal backend magic quotes character code for 4gl transcompiler octave workspace functional programming. Regular expression class captured variable xslt integer for acm s-expression gcc event-driven programming. Vb dataflow programming systems engineer return address babel syntax error single step jni pseudolanguage quick-and-dirty. Error bean native language jcl dml false debugging random seed noncontiguous data structure forth generation language. Character code source flag server side scripting jdk functional programming superclass jni vhdl.</p>
<p>Input/output statement jsr alert jdbc eight queens problem magic quotes scheme programming language. Interpreter subprogram javabean single step strong typed language jit operator associatively subprogram overload. Scanf ocaml inline decompiler hex editor programming in logic floating-point race condition node.js. Compile inherent error base address event-driven programming object module pipe wml recursion. Ne jil dead code array of pointers cpl first-class object logical operation non-disclosure agreement. Backpropagation neural network magic quotes bug tracking embedded java /r exception token absolute address.</p>
<p>Spl whole number curry jvm racket dml jdbc jit noncontiguous data structure source computer overload. Code refactoring overflow error coffeescript ocaml assembly race condition operator associatively dynamic dump sparse matrix. Alert syntax error base address jre \1 matlab noncontiguous data structure input/output statement syntactic sugar. Tcl declarative programming expression escape live script code refactoring agile manifesto nodelist operand z-buffering. Void interpreted cocoa action statement karel sdk loosely typed language \1 bean haskell subversion.</p>
<p>Syntactic sugar smil recursion procedural language oop data flow diagram source code programming language servlet. Actionscript single step build computer stdin literal hungarian notation z-buffering systems engineer lut. Purebasic jre meta-character procedure floating-point pastebin 5gl common gateway interface turbo pascal algol functional programming. Nested function source computer jcl imperative programming concatenation jvm regular expression literal kluge xml.</p>
</div>', NULL, NULL, CAST(N'2016-05-01 04:14:50.417' AS DateTime), CAST(N'2016-05-01 04:14:50.417' AS DateTime), NULL, 0, 1, N'a6e16f3d-c129-4d66-bd72-b28f2034eafd')
GO
SET IDENTITY_INSERT [dbo].[BlogPost] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Color]) VALUES (1, N'Web Development', N'ce0043')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Color]) VALUES (2, N'Databases', N'2e8b57')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Color]) VALUES (3, N'Object-oriented Programming', N'e79c00')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Color]) VALUES (4, N'ASP.NET', N'1b65ff')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Color]) VALUES (5, N'.NET / C#', N'e79c00')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Color]) VALUES (6, N'IDEs', N'e7c200')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Color]) VALUES (7, N'Agile Methodology', N'e79c00')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Color]) VALUES (8, N'Project Management', N'e79c00')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Color]) VALUES (9, N'Web APIs', N'1b65ff')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Color]) VALUES (11, N'Synchronicity', N'ff69f2')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[ContentQueue] ON 

GO
INSERT [dbo].[ContentQueue] ([ContentQueueID], [OrigBlogPostID], [NewBlogPostID], [QueueActionID]) VALUES (1, NULL, 3, 1)
GO
INSERT [dbo].[ContentQueue] ([ContentQueueID], [OrigBlogPostID], [NewBlogPostID], [QueueActionID]) VALUES (2, 1, 6, 2)
GO
INSERT [dbo].[ContentQueue] ([ContentQueueID], [OrigBlogPostID], [NewBlogPostID], [QueueActionID]) VALUES (3, NULL, 7, 3)
GO
INSERT [dbo].[ContentQueue] ([ContentQueueID], [OrigBlogPostID], [NewBlogPostID], [QueueActionID]) VALUES (4, NULL, 9, 1)
GO
INSERT [dbo].[ContentQueue] ([ContentQueueID], [OrigBlogPostID], [NewBlogPostID], [QueueActionID]) VALUES (5, NULL, 10, 1)
GO
INSERT [dbo].[ContentQueue] ([ContentQueueID], [OrigBlogPostID], [NewBlogPostID], [QueueActionID]) VALUES (6, NULL, 11, 1)
GO
INSERT [dbo].[ContentQueue] ([ContentQueueID], [OrigBlogPostID], [NewBlogPostID], [QueueActionID]) VALUES (7, NULL, 12, 1)
GO
INSERT [dbo].[ContentQueue] ([ContentQueueID], [OrigBlogPostID], [NewBlogPostID], [QueueActionID]) VALUES (8, NULL, 13, 1)
GO
INSERT [dbo].[ContentQueue] ([ContentQueueID], [OrigBlogPostID], [NewBlogPostID], [QueueActionID]) VALUES (9, NULL, 14, 1)
GO
INSERT [dbo].[ContentQueue] ([ContentQueueID], [OrigBlogPostID], [NewBlogPostID], [QueueActionID]) VALUES (10, NULL, 15, 1)
GO
INSERT [dbo].[ContentQueue] ([ContentQueueID], [OrigBlogPostID], [NewBlogPostID], [QueueActionID]) VALUES (11, NULL, 16, 1)
GO
INSERT [dbo].[ContentQueue] ([ContentQueueID], [OrigBlogPostID], [NewBlogPostID], [QueueActionID]) VALUES (12, NULL, 17, 1)
GO
INSERT [dbo].[ContentQueue] ([ContentQueueID], [OrigBlogPostID], [NewBlogPostID], [QueueActionID]) VALUES (13, NULL, 18, 1)
GO
INSERT [dbo].[ContentQueue] ([ContentQueueID], [OrigBlogPostID], [NewBlogPostID], [QueueActionID]) VALUES (14, NULL, 19, 1)
GO
INSERT [dbo].[ContentQueue] ([ContentQueueID], [OrigBlogPostID], [NewBlogPostID], [QueueActionID]) VALUES (15, NULL, 20, 1)
GO
INSERT [dbo].[ContentQueue] ([ContentQueueID], [OrigBlogPostID], [NewBlogPostID], [QueueActionID]) VALUES (16, NULL, 21, 1)
GO
SET IDENTITY_INSERT [dbo].[ContentQueue] OFF
GO
SET IDENTITY_INSERT [dbo].[Image] ON 

GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (1, N'Test', N'http://standrewscitychurch.com/wp-content/uploads/2015/12/Testing.gif')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (2, N'Picture', N'http://e2ua.com/data/wallpapers/22/WDF_701465.jpg')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (3, N'JonBenet Ramsey', N'http://www.dotnet-tricks.com/Content/images/mvc/ViewData-ViewBag-TempData-Session.png')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (4, N'.netFramework', N'http://i.neoseeker.com/n/8/newdotnetlogo_22.png')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (5, N'sql2008', N'https://objcsharp.files.wordpress.com/2013/10/sqlserver.png?w=510&h=313')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (6, N'xamarinAndMicrosoft', N'https://s3.amazonaws.com/blog.xamarin.com/wp-content/uploads/2016/02/24100131/xamarin-joins-microsoft.png')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (7, N'visualStudio', N'http://almrocks.com/wp-content/uploads/2015/10/Visual-Studio.jpg')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (8, N'angular', N'https://yellowpencil.com/assets/blog/banners/banner-angularjs.jpg')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (9, N'mvc', N'https://basicsofwebdevelopment.files.wordpress.com/2015/01/mvc_role_diagram.png')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (10, N'azure', N'https://blog.barracuda.com/wp-content/uploads/2016/02/azure.png')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (11, N'trinity', N'http://frutbunn.tk/wp-content/uploads/2015/06/js.png')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (12, N'git', N'https://www.perforce.com/sites/default/files/git-beyond6.jpg')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (13, N'testPyramid', N'http://2.bp.blogspot.com/-KacRWqCfmig/T3F0tPjF7uI/AAAAAAAAADQ/aiXs2TaOKHQ/s1600/pyramide.png')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (14, N'linq', N'http://www.jaimeweise.com/Images/linq.png')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (15, N'dependencyInjection', N'http://fulltrusthostingasp.net/wp-content/uploads/How-To-Use-Dependency-Injection-in-ASP.NET-MVC-6.jpg')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (16, N'webapi', N'http://2.bp.blogspot.com/-Mf6N0A9UOm0/VGxvI2z7t0I/AAAAAAAACiw/zdpSNyZqdsk/s1600/Web-APIs-v5_0.png')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (17, N'Test', N'test')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (18, N'Hello Again', N'And Again')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (19, N'cloud storage', N'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQUSJjvOgqrmN6kZqXqFm9xiubBXeZF3zoK_xZKq9mvr_hADx5P')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (20, N'webrtc', N'http://www.learningmy.com/wp-content/uploads/2013/05/webrtc.png')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (21, N'nodejs', N'http://benznext.com/wp-content/uploads/2015/04/nodejs_logo_green.jpg')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (22, N'angularjs', N'http://www.cenito.se/wp-content/uploads/2014/12/angularjs-xs.png')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (23, N'nodejs', N'http://benznext.com/wp-content/uploads/2015/04/nodejs_logo_green.jpg')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (24, N'nodejs', N'http://benznext.com/wp-content/uploads/2015/04/nodejs_logo_green.jpg')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (25, N'Hello Again', N'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQUSJjvOgqrmN6kZqXqFm9xiubBXeZF3zoK_xZKq9mvr_hADx5P')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (26, N'Hello Again', N'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQUSJjvOgqrmN6kZqXqFm9xiubBXeZF3zoK_xZKq9mvr_hADx5P')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (27, N'nodejs', N'http://benznext.com/wp-content/uploads/2015/04/nodejs_logo_green.jpg')
GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (28, N'nodejs', N'http://benznext.com/wp-content/uploads/2015/04/nodejs_logo_green.jpg')
GO
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (1, 1)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (1, 6)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (3, 6)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (3, 7)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (9, 6)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (9, 16)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (9, 17)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (9, 18)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (9, 19)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (10, 20)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (10, 21)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (11, 25)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (11, 26)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (11, 6)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (11, 27)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (11, 16)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (11, 7)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (12, 6)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (12, 26)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (12, 16)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (12, 17)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (12, 27)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (14, 1)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (14, 29)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (14, 27)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (14, 16)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (14, 17)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (16, 2)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (16, 3)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (16, 4)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (16, 29)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (16, 1)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (16, 31)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (18, 36)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (18, 37)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (18, 38)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (18, 39)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (18, 40)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (20, 43)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (20, 44)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (20, 27)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (20, 45)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (10, 22)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (10, 6)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (10, 23)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (10, 24)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (13, 28)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (13, 2)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (13, 29)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (13, 1)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (15, 30)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (15, 29)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (15, 27)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (15, 6)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (15, 23)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (17, 14)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (17, 15)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (17, 32)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (17, 33)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (17, 34)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (17, 35)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (19, 41)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (19, 42)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (19, 6)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (19, 16)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (19, 17)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (21, 29)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (21, 46)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (21, 47)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (21, 48)
GO
INSERT [dbo].[PostTag] ([BlogPostID], [TagID]) VALUES (21, 49)
GO
SET IDENTITY_INSERT [dbo].[QueueAction] ON 

GO
INSERT [dbo].[QueueAction] ([QueueActionID], [ActionNeeded]) VALUES (1, N'New')
GO
INSERT [dbo].[QueueAction] ([QueueActionID], [ActionNeeded]) VALUES (2, N'Edit')
GO
INSERT [dbo].[QueueAction] ([QueueActionID], [ActionNeeded]) VALUES (3, N'Delete')
GO
SET IDENTITY_INSERT [dbo].[QueueAction] OFF
GO
INSERT [dbo].[StaticImage] ([StaticPageID], [ImageID]) VALUES (1, 17)
GO
INSERT [dbo].[StaticImage] ([StaticPageID], [ImageID]) VALUES (2, 18)
GO
INSERT [dbo].[StaticImage] ([StaticPageID], [ImageID]) VALUES (3, 19)
GO
INSERT [dbo].[StaticImage] ([StaticPageID], [ImageID]) VALUES (4, 20)
GO
INSERT [dbo].[StaticImage] ([StaticPageID], [ImageID]) VALUES (6, 22)
GO
INSERT [dbo].[StaticImage] ([StaticPageID], [ImageID]) VALUES (5, 28)
GO
SET IDENTITY_INSERT [dbo].[StaticPage] ON 

GO
INSERT [dbo].[StaticPage] ([StaticPageID], [Title], [TextBody], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted]) VALUES (1, N'Test', N'<p>Test</p>', CAST(N'2016-05-02 07:05:49.753' AS DateTime), CAST(N'2016-05-02 07:05:49.753' AS DateTime), CAST(N'2016-05-03 15:46:38.403' AS DateTime), 1)
GO
INSERT [dbo].[StaticPage] ([StaticPageID], [Title], [TextBody], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted]) VALUES (2, N'Oh Hello', N'<p>Testing.</p>', CAST(N'2016-05-02 18:50:34.707' AS DateTime), CAST(N'2016-05-02 18:50:34.707' AS DateTime), CAST(N'2016-05-03 15:46:41.877' AS DateTime), 1)
GO
INSERT [dbo].[StaticPage] ([StaticPageID], [Title], [TextBody], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted]) VALUES (3, N'Is Cloud Storage Safe?', N'<p style="margin: 0px; padding: 5px 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; line-height: 20px; font-family: Arial, Helvetica, Verdana, sans-serif; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0px 0px; background-repeat: initial;">In the not-so-distant past, my main employer, considered the possibility of moving our data stores in the cloud.The reason was two-fold: not only would it cost less, but we would also spend less time managing it ourselves.&nbsp; It sounded like a good idea, but ultimately, we abandoned the idea because cloud storage was deemed as too risky for our liking.</p>
<p style="margin: 0px; padding: 5px 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; line-height: 20px; font-family: Arial, Helvetica, Verdana, sans-serif; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0px 0px; background-repeat: initial;">There were just too many implications created by having a third-party hosting our protected and confidential data. Implication brought about by troubling questions that no one could answer to our satisfaction. For instance, if a security breech were to occur, who would be responsible and how much of a guarantee could the provider give us that our data would be safe from prying eyes?&nbsp;&nbsp;</p>
<p style="margin: 0px; padding: 5px 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; line-height: 20px; font-family: Arial, Helvetica, Verdana, sans-serif; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0px 0px; background-repeat: initial;">As more and more companies look to the cloud for their data storage needs, these same questions are being asked over and over again. Now, with new hacking and theft incidents on some of the largest players being reported on a weekly basis, everyone is taking a step back and re-evaluating their risk tolerance. If you can relate, then read on to find out where we stand right now on the issue of cyber-security and who you should trust with your sensitive data.</p>
<h2 style="margin: 10px 0px 1px; padding: 0px; font-size: 20px; border: 0px; outline: 0px; vertical-align: baseline; font-stretch: normal; font-family: arial, helvetica, tahoma, verdana, sans-serif; font-style: italic; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0px 0px; background-repeat: initial;">Risks vs. Rewards</h2>
<p style="margin: 0px; padding: 5px 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; line-height: 20px; font-family: Arial, Helvetica, Verdana, sans-serif; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0px 0px; background-repeat: initial;">For many businesses, the lure of&nbsp;cloud computing&nbsp;is hard to resist. It''s many benefits include instantaneous 24/7 access to data, anywhere the Internet is accessible, scalable &ndash; practically unlimited &ndash; storage capacity, improved collaboration, and the cost benefits associated with the elimination of a data center IT team required to manage it.</p>
<p style="margin: 0px; padding: 5px 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; line-height: 20px; font-family: Arial, Helvetica, Verdana, sans-serif; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0px 0px; background-repeat: initial;">As tempting as these niceties may sound, one must consider all of the potential risks that come along with them. The one at the forefront of the industry''s collection consciousness right now is cyber theft. It seems that every time we turn on the TV to watch the news, the anchorman/woman tells us that we had better change our passwords because of the new vulnerability and/or hacking incident. That''s an annoying occurrence to be sure, but what happens to personal information that is stolen, such as credit or debit card account details, or social security numbers? Remember when hackers managed to get their hands on 40 million credit and debit cards belonging to Target shoppers who bought merchandise in its stores between Nov. 27 and Dec. 15 2013? The compromised cards wound up being marketed online along with information on the state, city and ZIP code of the Target store where they were used. That allowed them to be used illegally longer without raising the usual alarm bells that would go off due to activity being registered outside of the genuine account holder&rsquo;s geographic location.</p>
<h2 style="margin: 10px 0px 1px; padding: 0px; font-size: 20px; border: 0px; outline: 0px; vertical-align: baseline; font-stretch: normal; font-family: arial, helvetica, tahoma, verdana, sans-serif; font-style: italic; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0px 0px; background-repeat: initial;">Cyber Attacks, Security Breaches and WikiLeaks</h2>
<p style="margin: 0px; padding: 5px 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; line-height: 20px; font-family: Arial, Helvetica, Verdana, sans-serif; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0px 0px; background-repeat: initial;">Almost as prevalent as cyber attacks, security breaches from the inside are steadily garnering more and more headlines as well.&nbsp;Edward Snowden&nbsp;is the former NSA contractor behind one of the biggest leaks of classified intelligence in American history. According to Snowden, his motive for leaking the documents was "to inform the public as to that which is done in their name and that which is done against them." Those words bear a strong resemblance to WikiLeaks founder Jullian Assange, who also sought to expose government and corporate wrongdoing through "ethical hacking". Some may argue that their hearts were in the right place, but in airing the dirty laundry of the powers-that-be, there is inevitably collateral damage. In the case of WikiLeaks, government agents were put in harms way as a result of being named in the leaked documents. The ramifications are that you and the company you work for may be in jeopardy just by virtue of being documented somewhere that you have no control over.</p>
<p style="margin: 0px; padding: 5px 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; line-height: 20px; font-family: Arial, Helvetica, Verdana, sans-serif; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0px 0px; background-repeat: initial;">Other groups or individuals may be less interested in leaking the data but focused on the partial or total destruction of the cloud facilities of a particular company.</p>
<p style="margin: 0px; padding: 5px 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; line-height: 20px; font-family: Arial, Helvetica, Verdana, sans-serif; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0px 0px; background-repeat: initial;">Once an incident has occurred, in its aftermath, lawsuits are inevitably filed by or against you. At that point you''ve not only lost data as well as your customers'' trust, but now your finances are going to be hit hard.</p>
<h2 style="margin: 10px 0px 1px; padding: 0px; font-size: 20px; border: 0px; outline: 0px; vertical-align: baseline; font-stretch: normal; font-family: arial, helvetica, tahoma, verdana, sans-serif; font-style: italic; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0px 0px; background-repeat: initial;">How to Protect Yourself</h2>
<p style="margin: 0px; padding: 5px 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; line-height: 20px; font-family: Arial, Helvetica, Verdana, sans-serif; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0px 0px; background-repeat: initial;">Once you''ve entrusted your data with a third party, its safety is pretty much in that provider''s hands. Therefore, your best defense is to be diligent in assessing potential data storage and service providers.</p>
<h2 style="margin: 10px 0px 1px; padding: 0px; font-size: 20px; border: 0px; outline: 0px; vertical-align: baseline; font-stretch: normal; font-family: arial, helvetica, tahoma, verdana, sans-serif; font-style: italic; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0px 0px; background-repeat: initial;">Encryption is Essential</h2>
<p style="margin: 0px; padding: 5px 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; line-height: 20px; font-family: Arial, Helvetica, Verdana, sans-serif; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0px 0px; background-repeat: initial;">Since the earliest days of data protection, when Julius Caesar used a substitution cipher to protect his private correspondence, encryption has played a key role in keeping data contents unintelligible to all but those who knew how to unlock it. Today, encryption is an essential component of any data security and management strategy. Luckily, finding a data hosting service that utilizes encryption is easy; even those who cater to the general public &ndash; such as Dropbox and Google Drive &ndash; employ encryption.</p>
<p style="margin: 0px; padding: 5px 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; line-height: 20px; font-family: Arial, Helvetica, Verdana, sans-serif; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0px 0px; background-repeat: initial;">Some companies go even further by promising "100% private" cloud storage. An extra level of privacy is achieved by adopting a zero knowledge policy whereby even the folder and file names are stored as meaningless strings of obfuscated text.</p>
<p style="margin: 0px; padding: 5px 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; line-height: 20px; font-family: Arial, Helvetica, Verdana, sans-serif; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0px 0px; background-repeat: initial;">Companies who want to go even further can seek out cloud services that don''t store passwords anywhere on their servers. That would essentially force a data thief to break the encryption algorithm &ndash; a herculean task that, while not impossible, could take a very long time to accomplish. The price for the added security is that if a client of the service (that''s you) ever forgets his or her login credentials, the onus to break the encryption algorithm falls on you because that&rsquo;s the only way that you&rsquo;ll ever retrieve your data.&nbsp;</p>
<h2 style="margin: 10px 0px 1px; padding: 0px; font-size: 20px; border: 0px; outline: 0px; vertical-align: baseline; font-stretch: normal; font-family: arial, helvetica, tahoma, verdana, sans-serif; font-style: italic; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0px 0px; background-repeat: initial;">Finding a Balance<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: 0px 0px;"><br style="margin: 0px;" /></strong></h2>
<p style="margin: 0px; padding: 5px 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; line-height: 20px; font-family: Arial, Helvetica, Verdana, sans-serif; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0px 0px; background-repeat: initial;">Information security, whether within your own organization or in the cloud, has always been about finding a balance between ease of access and information sharing versus data which is completely locked down and virtually inaccessible to anyone. In this post 9/11 world, it''s become painfully apparent that the more you have of one, the less you have of the other.</p>', CAST(N'2016-05-03 18:43:18.943' AS DateTime), CAST(N'2016-05-03 15:19:34.037' AS DateTime), NULL, 0)
GO
INSERT [dbo].[StaticPage] ([StaticPageID], [Title], [TextBody], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted]) VALUES (4, N'WebRTC', N'<p><span style="color: #333333; font-family: Arial, Verdana, sans-serif; font-size: 13px; line-height: 18px;">It&rsquo;s still going to be some time before WebRTC technology starts to deliver cool apps, but even today developers are quickly moving from the realm of cool WebRTC experiments, like the Mozilla/Google phone call demo</span><span style="color: #333333; font-family: Arial, Verdana, sans-serif; font-size: 13px; line-height: 18px;">, to useful apps like&nbsp;Codassium</span><span style="color: #333333; font-family: Arial, Verdana, sans-serif; font-size: 13px; line-height: 18px;">.</span></p>
<p style="margin: 0px 0px 18px; padding: 0px; font-size: 13px; line-height: 18px; color: #333333; font-family: Arial, Verdana, sans-serif;">&nbsp;</p>
<p style="margin: 0px 0px 18px; padding: 0px; font-size: 13px; line-height: 18px; color: #333333; font-family: Arial, Verdana, sans-serif;">WebRTC&nbsp;is a proposed standard &mdash; currently being refined by the W3C &mdash; with the goal of providing a web-based set of tools that any device can use to share audio, video and data in real time. It&rsquo;s still in the early stages, but WebRTC has the potential to supplant Skype, Flash and many native apps with web-based alternatives that work on any device.</p>
<p style="margin: 0px 0px 18px; padding: 0px; font-size: 13px; line-height: 18px; color: #333333; font-family: Arial, Verdana, sans-serif;">Codassium uses WebRTC to bring together WebRTC-based video chat and Mozilla''s ace code editor. The result is what&nbsp;Wreally Studios, creators of Codassium, call &ldquo;a better way to conduct remote interviews.&rdquo; Of course Codassium could be used for more than just interviews &mdash; think code reviews, remote pair programming or even just discussing code with remote employees.</p>
<p style="margin: 0px 0px 18px; padding: 0px; font-size: 13px; line-height: 18px; color: #333333; font-family: Arial, Verdana, sans-serif;">To use Codassium you&rsquo;ll need to be using a web browser that supports WebRTC &mdash; recent versions of Firefox and Chrome will both work. Head on over to&nbsp;Codassium, click the Start button and allow the site to access your camera and microphone. Once the video chat and Ace editor load, just click the Invite button and send the resulting link to the person you&rsquo;d like to work with.</p>', CAST(N'2016-05-03 15:34:39.250' AS DateTime), CAST(N'2016-05-03 15:34:39.250' AS DateTime), NULL, 0)
GO
INSERT [dbo].[StaticPage] ([StaticPageID], [Title], [TextBody], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted]) VALUES (5, N'Why is Node.JS currently the coldest thing these days?', N'<p>It''s JavaScript</p>
<p>&nbsp;</p>
<p>The language isn''t particularly good, but it''s highly accessible. Given a fresh install of any meaningful, mainstream OS I can guide a programming-illiterate person through creating "hello.js" that will render some simple markup when viewed in the browser their OS came installed with. No terminal. No server. This ridiculously low barrier to entry makes programming accessible. The ability to create something "meaningful" (most people seem to think text on a web page is more meaningful than stdout in a console) is addicting.</p>
<p>&nbsp;</p>
<p>It''s JavaScript</p>
<p>&nbsp;</p>
<p>The language isn''t particularly good, but it''s directly relevant. I wouldn''t use Python to aggregate a pool of numbers and then switch to PHP to crunch them into meaningful data. I wouldn''t use C++ to craft a physics engine and then switch to Ruby to handle rendering. So why use JavaScript to build a web page/app and then switch to another language to serve it to users?</p>
<p>&nbsp;</p>
<p>Making less contextual switches is very convenient. You can feel free to disagree, but there are already enough people writing tools that translate their language of choice into JavaScript - not because their language is better (obviously, since it''s being turned into JavaScript) but because they don''t want to have to use JavaScript itself because it''s not what they enjoy.</p>
<p>&nbsp;</p>
<p>It''s JavaScript</p>
<p>&nbsp;</p>
<p>The language isn''t particularly good, but it''s vaguely familiar. Most developers that have thus far eluded the chains of corporate programming (where Java and C# reign with an iron fist) have done so using PHP, Python, and Ruby. And like those, JavaScript is an object-oriented, dynamically typed language. Thus, if you were already in the game, JavaScript is really easy to pick up, give a whirl, and then decide whether or not to continue on with it.</p>
<p>&nbsp;</p>
<p>And let''s face it, everything is a browser...</p>
<p>&nbsp;</p>
<p>You can use HTML, CSS, and JavaScript to build web applications with any browser and use Node.js as a back-end with npm as a package manager.</p>
<p>&nbsp;</p>
<p>You can use HTML, CSS, and JavaScript to build desktop applications with Electron and use Node.js as a back-end with npm as a package manager.</p>
<p>&nbsp;</p>
<p>You can use HTML, CSS, and JavaScript to build desktop applications with React Native (among others) and use Node.js as a back-end with npm as a package manager.</p>
<p>&nbsp;</p>
<p>The Hype</p>
<p>&nbsp;</p>
<p>Programming has never been as easy to get into as it is now, and the accessibility of JavaScript and utility of Node.js has definitely helped on that front. This dramatic lowering of barriers has produced a massive surge of interest in web development - and that''s a good thing. What makes Node.js great is that it has brought fresh minds, fresh ideas, and fresh meat into the world of programming.</p>
<p>&nbsp;</p>
<p>Eventually, many of these developers will branch out into other languages. We''re already seeing a large amount of interest in Python and R for Data Sciences. Several are moving to C# and Java as they make transitions into corporate programming. There has been a rise of interest in (comparatively) "new shiny" languages, such as Go and Rust. And as people flock to these languages they sometimes come back to JavaScript with great ideas that lead to the development of tools, styles, and opinions that help the greater JavaScript community flourish and build greater applications.</p>
<p>&nbsp;</p>
<p>Eventually, just like what happened with Ruby on Rails, the hype train will depart. Maybe it will head towards Web Assembly for even more internet goodness. Maybe it will be for an explosion (not literally, hopefully) in Internet of Things. Perhaps some breakthroughs in AI and the rise of our savior-overlord Robot Jesus. Or perhaps it''s something we''ve yet to see or consider just yet. Hell, it might even just settle down and give rise to a time where programmers can come to respect one another''s choices in languages and tools... though I won''t hold my breath on that front.</p>', CAST(N'2016-05-03 19:36:41.923' AS DateTime), CAST(N'2016-05-03 15:46:04.733' AS DateTime), NULL, 0)
GO
INSERT [dbo].[StaticPage] ([StaticPageID], [Title], [TextBody], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted]) VALUES (6, N'AngularJS JavaScript (programming language) Web Development What is replacing $watch in Angular 2.0?', N'<p>AngularJS</p>
<p>JavaScript (programming language)</p>
<p>Web Development</p>
<p>What is replacing $watch in Angular 2.0?</p>
<p>There is only componenet. How one component can "watch" other component from being changed?</p>
<p>Request</p>
<p>Follow13</p>
<p>Comment</p>
<p>ShareDownvote</p>
<p>Can you answer this question?</p>
<p>Answer</p>
<p>2 Answers</p>
<p>Bhushan Chaudhari</p>
<p>Bhushan Chaudhari, I use javascript extensively</p>
<p>437 Views</p>
<p>AngularJS 2.0 does not have a "$watch" for change detection. It has change detector class created per component in the application. To understand how it works, please continue reading.</p>
<p>&nbsp;</p>
<p>Mainly, application state can be changed by following three things:</p>
<p>&nbsp;</p>
<p>Events</p>
<p>AJAX</p>
<p>Timeouts (setTimeouts, setIntervals)</p>
<p>Now in angular 2 when any of the above three things happen, Javascript VM processes the events and updates the model then in the next turn angularJS change detector syncs the model with the component and component with the DOM in browser. If you notice carefully, you will see that in this case the updates are happening only in one direction i.e. model is not modified when components/views are changed so there is no interleaving of view updates and model updates. In a way, all application/model updates are completely different from the DOM changes and done one after the other.</p>
<p>&nbsp;</p>
<p>This was not the case with Angular 1.x, because in that case, it had a flow of data in both the directions; model updating the DOM and DOM updating the model and moreover, these updates were interleaved and hard to understand while debugging or investigating an issue (I personally have found it very tedious to reason about these updates whenever I faced challenges while using Angular 1.2).</p>
<p>&nbsp;</p>
<p>So in the change detection graph there were cycles as a result of which we had to loop through all of our bindings until model gets stabilized and re-render the view again and again. This was handled using a digest loop with the help of watchers ($watch) on the bindings.</p>
<p>&nbsp;</p>
<p>On the contrary, Angular version 2.0 follows "data down actions(events) up" approach which has a unidirectional data flow as a result of which, angularJS change detector graph does not have cycles and it is a just a component tree. So whenever a model/application state changes, in the next VM turn, angularjs checks all the components in a tree for the change and updates the DOM properly.</p>
<p>&nbsp;</p>
<p>In this case there is no loop as there is a clear separation between the application state/ model update and DOM update which happens one after the other in the same order. So as a result of this, in a single pass, application state gets stabilzed and it gives you an average constant amount of time per binding to detect a change, as you don''t have a digest loop anymore rather there is only one iteration of a digest loop that gets executed. Though some might argue that it is very inefficient to go and check all the components in a component tree every time, angular team claims that it is done efficiently by writing a very Javascript VM friendly code which is optimized for the runtime and takes few milliseconds only.</p>
<p>&nbsp;</p>
<p>In addition to that, AngularJS 2.0 has shifted the onus on the users to make application more efficient by enabling the use of Immutable objects and Observable objects which can be any object which reports its changes whenever that particular object changes. For example. RxJS/ember models, Object.observe() and notifying the angular framework of such usage.</p>
<p>&nbsp;</p>
<p>Use of "Immutable objects" in applications helps angularJS change detector making smarter decisions while checking the change in model because, AngularJS change detector can totally skip the change detection for the model which is immutable because it has to simply check for the references of the old model with new model; if it is not changed, immutability property guarantees that no property inside the object has changed. This makes a huge performance improvements in angularJS change detector strategy. Similarly for the observable objects, framework marks the entire path from the object to root for the change detection.</p>
<p>&nbsp;</p>
<p>AngularJS 2.0 though does not enforce use of special types of objects, it is good to use them if needed. You can even mix and match both types of objects; using immutable objects for the data that doesn''t change for example, static content and observable objects for data fetched from a backend or a service.</p>', CAST(N'2016-05-03 15:55:11.913' AS DateTime), CAST(N'2016-05-03 15:55:11.913' AS DateTime), CAST(N'2016-05-03 16:36:37.657' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[StaticPage] OFF
GO
SET IDENTITY_INSERT [dbo].[Tag] ON 

GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (1, N'MVC')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (2, N'JAVASCRIPT')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (3, N'HTML')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (4, N'CSS')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (5, N'ADO.NET')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (6, N'MICROSOFT')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (7, N'BUILD')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (8, N'JQUERY')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (9, N'AGILE')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (10, N'SLACK')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (11, N'HIPCHAT')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (12, N'ATLASSIAN')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (13, N'CHROME')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (14, N'GIT')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (15, N'SOURCECONTROL')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (16, N'.net')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (17, N'.net framework')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (18, N'Class libraries')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (19, N'Releases')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (20, N'Sql')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (21, N'Databases')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (22, N'Sqlserver')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (23, N'Cloud')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (24, N'Security')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (25, N'Xamarin')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (26, N'Visual studio')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (27, N'C#')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (28, N'Angular')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (29, N'Web development')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (30, N'Azure')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (31, N'Front end')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (32, N'Rebase')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (33, N'Merge')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (34, N'Push')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (35, N'Pull')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (36, N'Testing')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (37, N'Nunit')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (38, N'Test driven development')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (39, N'Tdd')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (40, N'Unit tests')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (41, N'Linq')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (42, N'Linq query')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (43, N'Dependency injection')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (44, N'Interfaces')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (45, N'Object oriented programming')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (46, N'Web api')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (47, N'Mobile development')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (48, N'Rest')
GO
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (49, N'Asp.net')
GO
SET IDENTITY_INSERT [dbo].[Tag] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/3/2016 11:47:46 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 5/3/2016 11:47:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 5/3/2016 11:47:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 5/3/2016 11:47:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 5/3/2016 11:47:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/3/2016 11:47:46 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BlogImage]  WITH CHECK ADD  CONSTRAINT [FK_BlogImage_BlogPost] FOREIGN KEY([BlogPostID])
REFERENCES [dbo].[BlogPost] ([BlogPostID])
GO
ALTER TABLE [dbo].[BlogImage] CHECK CONSTRAINT [FK_BlogImage_BlogPost]
GO
ALTER TABLE [dbo].[BlogImage]  WITH CHECK ADD  CONSTRAINT [FK_BlogImage_Image] FOREIGN KEY([ImageID])
REFERENCES [dbo].[Image] ([ImageID])
GO
ALTER TABLE [dbo].[BlogImage] CHECK CONSTRAINT [FK_BlogImage_Image]
GO
ALTER TABLE [dbo].[BlogPost]  WITH CHECK ADD  CONSTRAINT [FK_BlogPost_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BlogPost] CHECK CONSTRAINT [FK_BlogPost_AspNetUsers]
GO
ALTER TABLE [dbo].[BlogPost]  WITH CHECK ADD  CONSTRAINT [FK_BlogPost_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[BlogPost] CHECK CONSTRAINT [FK_BlogPost_Category]
GO
ALTER TABLE [dbo].[ContentQueue]  WITH CHECK ADD  CONSTRAINT [FK_ContentQueue_BlogPost] FOREIGN KEY([NewBlogPostID])
REFERENCES [dbo].[BlogPost] ([BlogPostID])
GO
ALTER TABLE [dbo].[ContentQueue] CHECK CONSTRAINT [FK_ContentQueue_BlogPost]
GO
ALTER TABLE [dbo].[ContentQueue]  WITH CHECK ADD  CONSTRAINT [FK_ContentQueue_BlogPost1] FOREIGN KEY([NewBlogPostID])
REFERENCES [dbo].[BlogPost] ([BlogPostID])
GO
ALTER TABLE [dbo].[ContentQueue] CHECK CONSTRAINT [FK_ContentQueue_BlogPost1]
GO
ALTER TABLE [dbo].[ContentQueue]  WITH CHECK ADD  CONSTRAINT [FK_ContentQueue_QueueAction] FOREIGN KEY([QueueActionID])
REFERENCES [dbo].[QueueAction] ([QueueActionID])
GO
ALTER TABLE [dbo].[ContentQueue] CHECK CONSTRAINT [FK_ContentQueue_QueueAction]
GO
ALTER TABLE [dbo].[PostTag]  WITH CHECK ADD  CONSTRAINT [FK_PostTag_BlogPost] FOREIGN KEY([BlogPostID])
REFERENCES [dbo].[BlogPost] ([BlogPostID])
GO
ALTER TABLE [dbo].[PostTag] CHECK CONSTRAINT [FK_PostTag_BlogPost]
GO
ALTER TABLE [dbo].[PostTag]  WITH CHECK ADD  CONSTRAINT [FK_PostTag_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([TagID])
GO
ALTER TABLE [dbo].[PostTag] CHECK CONSTRAINT [FK_PostTag_Tag]
GO
ALTER TABLE [dbo].[StaticImage]  WITH CHECK ADD  CONSTRAINT [FK_StaticImage_Image] FOREIGN KEY([ImageID])
REFERENCES [dbo].[Image] ([ImageID])
GO
ALTER TABLE [dbo].[StaticImage] CHECK CONSTRAINT [FK_StaticImage_Image]
GO
ALTER TABLE [dbo].[StaticImage]  WITH CHECK ADD  CONSTRAINT [FK_StaticImage_StaticPage] FOREIGN KEY([StaticPageID])
REFERENCES [dbo].[StaticPage] ([StaticPageID])
GO
ALTER TABLE [dbo].[StaticImage] CHECK CONSTRAINT [FK_StaticImage_StaticPage]
GO
/****** Object:  StoredProcedure [dbo].[AddABlog]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Tony Maiorana
-- Create date: 4/22/2016
-- Description:	Insert a new blog
-- =============================================
CREATE PROCEDURE [dbo].[AddABlog] 
	-- Add the parameters for the stored procedure here
		@CategoryID int,
		@UserID varchar(128),
		@Title varchar(150), 
		@TextBody varchar(max),
		@UpdateTime datetime,
		@CreationTime datetime,
		@IsApproved bit,
		@IsEdit bit = 0,
		@BlogPostID int = null,
		@BlogID int output

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO dbo.BlogPost (CategoryID, UserID, Title, TextBody, UpdateTime, CreationTime, IsApproved)
	 VALUES(@CategoryID, @UserID, @Title, @TextBody, @UpdateTime, @CreationTime, @IsApproved);
		SET @BlogID = SCOPE_IDENTITY();

	IF @IsApproved != 1
		BEGIN
			IF @IsEdit = 1
				BEGIN
					INSERT INTO dbo.ContentQueue (NewBlogPostID, QueueActionID, OrigBlogPostID)
					VALUES(@BlogID, 2, @BlogPostID)
				END
			ELSE
				BEGIN
					INSERT INTO dbo.ContentQueue (NewBlogPostID, QueueActionID)
					VALUES(@BlogID, 1)
				END
		END
END











GO
/****** Object:  StoredProcedure [dbo].[AddACategory]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/22/2016>
-- Description:	<Description,,Add a Category>
-- =============================================
CREATE PROCEDURE [dbo].[AddACategory] 
	-- Add the parameters for the stored procedure here
	@Name varchar(50),
	@Color nchar(6),
	@CategoryID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO  dbo.Category (CategoryName, Color) VALUES(@Name, @Color);
	SET @CategoryID = SCOPE_IDENTITY();
	
END










GO
/****** Object:  StoredProcedure [dbo].[AddAnImage]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/22/2016>
-- Description:	<Description,,Add An Image>
-- =============================================
CREATE PROCEDURE [dbo].[AddAnImage] 
	-- Add the parameters for the stored procedure here
	@Name varchar(50),
	@ImageData varchar(max),
	@ImageID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO dbo.Image (Name, ImageData) VALUES(@Name, @ImageData)
	SET @ImageID = SCOPE_IDENTITY();
END










GO
/****** Object:  StoredProcedure [dbo].[AddAStaticPage]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		William Poulson
-- Create date: 4/29/2016
-- Description:	Used for adding a new static page
-- =============================================
CREATE PROCEDURE [dbo].[AddAStaticPage] 
	-- Add the parameters for the stored procedure here
		@Title varchar(150), 
		@TextBody varchar(max),
		@UpdateTime datetime,
		@CreationTime datetime,
		@StaticPageID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		INSERT INTO dbo.StaticPage (Title, TextBody, UpdateTime, CreationTime)
	 VALUES(@Title, @TextBody, @UpdateTime, @CreationTime);
		SET @StaticPageID = SCOPE_IDENTITY();
END






GO
/****** Object:  StoredProcedure [dbo].[AddATag]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/22/2016>
-- Description:	<Description,,Add A Tag>
-- =============================================
CREATE PROCEDURE [dbo].[AddATag]
	-- Add the parameters for the stored procedure here
	@Name varchar(50),
	@TagID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO dbo.Tag (TagName) VALUES(@Name)
	SET @TagID = SCOPE_IDENTITY();
END










GO
/****** Object:  StoredProcedure [dbo].[AdminQueueUpdate]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AdminQueueUpdate]
	-- Add the parameters for the stored procedure here
	@ContentQueueID int,
	@Allow bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

DECLARE @NewBlogPostID int
DECLARE @OrigBlogID int
SET @NewBlogPostID = (SELECT NewBlogPostID FROM ContentQueue c WHERE @ContentQueueID = c.ContentQueueID)
SET @OrigBlogID = (SELECT OrigBlogPostID FROM ContentQueue c WHERE @ContentQueueID = c.ContentQueueID)

IF @Allow = 1
	BEGIN
	DECLARE @QueueAction int
	SET @QueueAction = (SELECT QueueActionID FROM ContentQueue  WHERE @ContentQueueID = ContentQueueID);
	IF @QueueAction != 2
		BEGIN
			UPDATE BlogPost SET 
				IsDeleted = CASE WHEN (@QueueAction) = 3 THEN 1 ELSE 0 END,
				IsApproved = 1
			WHERE BlogPostID = @NewBlogPostID
		END
	ELSE
		BEGIN
		UPDATE BlogPost 
			SET 
				IsDeleted = 0 ,
				IsApproved = 1,
				[Title] = copy.Title,
				[CategoryID] = copy.CategoryID ,
				[TextBody] = copy.TextBody ,
				[PostTime] = copy.PostTime,
				[ExpirationTime] = copy.ExpirationTime,
				[UpdateTime] = copy.UpdateTime,
				[CreationTime] = copy.CreationTime,
				[UserID] = copy.UserID
			FROM (SELECT Title, TextBody, PostTime, ExpirationTime, UpdateTime, CreationTime, UserID, CategoryID 
					FROM BlogPost 
					WHERE BlogPostID = @NewBlogPostID
				) copy
		WHERE BlogPostID = @OrigBlogID

		IF @QueueAction = 2
			BEGIN
				DELETE FROM PostTag WHERE BlogPostID = @OrigBlogID
				DELETE FROM BlogImage Where BlogPostID = @OrigBlogID
				UPDATE PostTag SET BlogPostID = @OrigBlogID WHERE BlogPostID = @NewBlogPostID
				UPDATE BlogImage SET BlogPostID = @OrigBlogID WHERE BlogPostID = @NewBlogPostID
			END
		END
	END
ELSE
	BEGIN
		DELETE FROM PostTag WHERE BlogPostID = @NewBlogPostID
		DELETE FROM BlogImage Where BlogPostID = @NewBlogPostID
	END



DELETE FROM ContentQueue Where ContentQueueID = @ContentQueueID

IF @QueueAction != 1
	BEGIN
		DELETE FROM BlogPost Where BlogPostID = @NewBlogPostID 
		DELETE FROM PostTag WHERE BlogPostID = @NewBlogPostID
		DELETE FROM BlogImage Where BlogPostID = @NewBlogPostID
	END

END










GO
/****** Object:  StoredProcedure [dbo].[BridgeBlogImage]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/22/2016>
-- Description:	<Description,,Bridge BlogPost and Image>
-- =============================================
CREATE PROCEDURE [dbo].[BridgeBlogImage]
	-- Add the parameters for the stored procedure here
	@BlogID int,
	@ImageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO dbo.BlogImage(BlogPostID,ImageID) VALUES(@BlogID, @ImageID)
END










GO
/****** Object:  StoredProcedure [dbo].[BridgePostTag]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/22/2016>
-- Description:	<Description,,Bridge BlogPost and Tag>
-- =============================================
CREATE PROCEDURE [dbo].[BridgePostTag]
	-- Add the parameters for the stored procedure here
	@BlogID int,
	@TagID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO dbo.PostTag (BlogPostID,TagID) VALUES(@BlogID, @TagID)
END










GO
/****** Object:  StoredProcedure [dbo].[BridgeStaticImage]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		William Poulson
-- Create date: 4/29/2016
-- Description:	adds record to bridge static page table to image table
-- =============================================
CREATE PROCEDURE [dbo].[BridgeStaticImage] 
	-- Add the parameters for the stored procedure here
	@StaticPageID int,
	@ImageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO StaticImage(StaticPageID, ImageID) VALUES(@StaticPageID, @ImageID)
END





GO
/****** Object:  StoredProcedure [dbo].[CategoryCount]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CategoryCount] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT c.*, count(b.CategoryID) AS TotalMentions FROM Category c
	Left JOIN BlogPost b on b.CategoryID = c.CategoryID
	GROUP BY c.CategoryID, c.CategoryName, c.Color
	ORDER BY TotalMentions desc
END










GO
/****** Object:  StoredProcedure [dbo].[DeleteABlog]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteABlog]

	@BlogPostID int,
	@IsAdmin bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @IsAdmin = 1
		BEGIN
			UPDATE BlogPost SET IsDeleted = 1, DeletedTime = GETDATE();
		END
	ELSE
		BEGIN
			INSERT INTO dbo.ContentQueue (NewBlogPostID, QueueActionID)
				VALUES(@BlogPostID, 3)
		END
END







GO
/****** Object:  StoredProcedure [dbo].[DeleteAStaticPage]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		William Poulson
-- Create date: 4/29/2016
-- Description:	soft deletes a static page
-- =============================================
CREATE PROCEDURE [dbo].[DeleteAStaticPage] 
	-- Add the parameters for the stored procedure here
	@StaticPageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE StaticPage
		SET IsDeleted = 1, DeletedTime = GETDATE()
	WHERE StaticPageID = @StaticPageID
END






GO
/****** Object:  StoredProcedure [dbo].[DeleteCategory]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCategory]
	-- Add the parameters for the stored procedure here
	@CategoryID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Category Where CategoryID = @CategoryID


END










GO
/****** Object:  StoredProcedure [dbo].[GetAdminQueue]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAdminQueue] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM BlogPost bp
		INNER JOIN Category c ON c.CategoryID = bp.CategoryID
		INNER JOIN ContentQueue q ON bp.BlogPostID = q.NewBlogPostID
		WHERE bp.IsApproved = 0 AND bp.IsDeleted = 0
END









GO
/****** Object:  StoredProcedure [dbo].[GetAllBlogPostByCategoryID]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/24/2016>
-- Description:	<Description,,Get All BlogPost by CategoryID>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllBlogPostByCategoryID] 
	-- Add the parameters for the stored procedure here
	@CategoryID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM BlogPost bp
	INNER JOIN Category c
	 ON c.CategoryID = bp.CategoryID
	WHERE @CategoryID = bp.CategoryID
END










GO
/****** Object:  StoredProcedure [dbo].[GetAllBlogPostByTagID]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/24/2016>
-- Description:	<Description,,Get All BlogPost By TagID>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllBlogPostByTagID]
	-- Add the parameters for the stored procedure here
	@TagID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT BlogPostID FROM PostTag
WHERE @TagID = TagID
END










GO
/****** Object:  StoredProcedure [dbo].[GetAllBlogs]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/24/2016>
-- Description:	<Description,,Get All Blogs>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllBlogs]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT c.CategoryName, c.Color, bp.BlogPostID, bp.Title, bp.UserID, bp.TextBody, bp.UpdateTime, bp.ExpirationTime, c.CategoryID, bp.CreationTime, bp.IsApproved, bp.PostTime FROM BlogPost bp
	INNER JOIN Category c
	 ON c.CategoryID = bp.CategoryID
	  WHERE bp.IsApproved = 1 AND bp.IsDeleted = 0
END










GO
/****** Object:  StoredProcedure [dbo].[GetAllCategories]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/25/2016>
-- Description:	<Description,,Get All Categories>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllCategories]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Category
END










GO
/****** Object:  StoredProcedure [dbo].[GetAllStaticPages]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author, Hannah>
-- Create date: <5/1/2016>
-- Description:	<Getting all static pages>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllStaticPages] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 SELECT        StaticPage.*
FROM            StaticPage
WHERE IsDeleted = 0
END



GO
/****** Object:  StoredProcedure [dbo].[GetAllSumOfTags]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author, Hannah>
-- Create date: <4/30/2016>
-- Description:	<Sum of all Tags>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllSumOfTags] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
SELECT        Tag.TagID, Tag.TagName, COUNT(PostTag.BlogPostID) AS Weight
FROM            Tag LEFT OUTER JOIN
                         PostTag ON Tag.TagID = PostTag.TagID
GROUP BY Tag.TagName, Tag.TagID
END




GO
/****** Object:  StoredProcedure [dbo].[GetAllTagNameByBlogPostID]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/24/2016>
-- Description:	<Description,,Get All TagName by BlogPostID>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllTagNameByBlogPostID] 
	-- Add the parameters for the stored procedure here
	@BlogID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT t.TagID, t.TagName FROM Tag t
	LEFT JOIN PostTag pt ON pt.TagID = t.TagID
	WHERE @BlogID = pt.BlogPostID
END










GO
/****** Object:  StoredProcedure [dbo].[GetAllTags]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/25/2016>
-- Description:	<Description,,Get All Tags>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllTags]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Tag
END










GO
/****** Object:  StoredProcedure [dbo].[GetBlogImageByBlogID]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/24/2016>
-- Description:	<Description,,Get Blog Image By BlogID>
-- =============================================
CREATE PROCEDURE [dbo].[GetBlogImageByBlogID]
	-- Add the parameters for the stored procedure here
	@BlogID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT i.ImageData, i.ImageID, i.Name FROM [Image] i
	LEFT JOIN BlogImage bi
	 ON bi.ImageID = i.ImageID
	WHERE @BlogID = bi.BlogPostID
END










GO
/****** Object:  StoredProcedure [dbo].[GetBlogPostByBlogPostID]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/24/2016>
-- Description:	<Description,,Get BlogPost by BlogPostID>
-- =============================================
CREATE PROCEDURE [dbo].[GetBlogPostByBlogPostID]
	-- Add the parameters for the stored procedure here
	@BlogID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        bp.BlogPostID, bp.ExpirationTime, bp.CreationTime, c.CategoryID, c.CategoryName, c.Color, bp.Title, bp.TextBody, bp.UserID, bp.PostTime, bp.UpdateTime, bp.IsApproved, AspNetUsers.UserName
FROM            BlogPost AS bp INNER JOIN
                         Category AS c ON c.CategoryID = bp.CategoryID
						  INNER JOIN AspNetUsers ON bp.UserID = AspNetUsers.Id
WHERE        (@BlogID = bp.BlogPostID)
END










GO
/****** Object:  StoredProcedure [dbo].[GetStaticImageByStaticPageID]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		William Poulson
-- Create date: 4/29/2016
-- Description:	fetches the image associated with a static page
-- =============================================
CREATE PROCEDURE [dbo].[GetStaticImageByStaticPageID] 
	-- Add the parameters for the stored procedure here
	@StaticPageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT i.ImageData, i.ImageID, i.Name
	FROM [Image] AS i
	LEFT JOIN StaticImage AS si
	 ON si.ImageID = i.ImageID
	WHERE @StaticPageID = si.StaticPageID
END






GO
/****** Object:  StoredProcedure [dbo].[GetStaticPageByStaticPageID]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		William Poulson
-- Create date: 4/29/2016
-- Description:	Grabs a static page by id passed
-- =============================================
CREATE PROCEDURE [dbo].[GetStaticPageByStaticPageID]
	-- Add the parameters for the stored procedure here
	@StaticPageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM StaticPage AS sp
	WHERE (@StaticPageID = sp.StaticPageID)
END






GO
/****** Object:  StoredProcedure [dbo].[UpdateAStaticPage]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author, Hannah>
-- Create date: <Create 5/3/2016>
-- Description:	<Description, Updating a static page>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateAStaticPage]
	-- Add the parameters for the stored procedure here
                @StaticPageID int,
                @Title varchar(150),
                @TextBody varchar(max),
                @UpdateTime datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE       StaticPage
SET                Title = @Title, TextBody = @TextBody, UpdateTime = @UPDATETIME
WHERE        (StaticPageID = @StaticPageID)
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateStaticPageContent]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		William Poulson
-- Create date: 4/29/2016
-- Description:	updates content for static pages 
-- =============================================
CREATE PROCEDURE [dbo].[UpdateStaticPageContent]
	-- Add the parameters for the stored procedure here
	@StaticPageID int,
	@Title varchar(150),
	@TextBody varchar(MAX),
	@UpdateTime datetime,
	@Name varchar(50),
	@ImageData varchar(max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE StaticPage
	SET Title = @Title, TextBody = @TextBody, UpdateTime = @UpdateTime
		WHERE StaticPageID = @StaticPageID
			
END






GO
/****** Object:  StoredProcedure [dbo].[UpdateStaticPageImage]    Script Date: 5/3/2016 11:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		William Poulson
-- Create date: 4/29/2016
-- Description:	updates image associated with a static page
-- =============================================
CREATE PROCEDURE [dbo].[UpdateStaticPageImage] 
	-- Add the parameters for the stored procedure here
	@StaticPageID int,
	@Name varchar(50),
	@ImageData varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [Image]
		SET ImageData = @ImageData, Name = @Name
			WHERE ImageID = (SELECT si.ImageID FROM StaticImage si WHERE si.StaticPageID = @StaticPageID)
END






GO
USE [master]
GO
ALTER DATABASE [CircularLogic] SET  READ_WRITE 
GO
