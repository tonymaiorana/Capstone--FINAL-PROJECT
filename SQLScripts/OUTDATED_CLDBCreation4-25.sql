USE [master]
GO
/****** Object:  Database [CircularLogic]    Script Date: 4/25/2016 11:00:47 AM ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 4/25/2016 11:00:47 AM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/25/2016 11:00:47 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/25/2016 11:00:47 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/25/2016 11:00:47 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/25/2016 11:00:47 AM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/25/2016 11:00:47 AM ******/
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
/****** Object:  Table [dbo].[BlogImage]    Script Date: 4/25/2016 11:00:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogImage](
	[BlogPostID] [int] NOT NULL,
	[ImageID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BlogPost]    Script Date: 4/25/2016 11:00:47 AM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 4/25/2016 11:00:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContentQueue]    Script Date: 4/25/2016 11:00:47 AM ******/
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
/****** Object:  Table [dbo].[Image]    Script Date: 4/25/2016 11:00:47 AM ******/
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
/****** Object:  Table [dbo].[PostTag]    Script Date: 4/25/2016 11:00:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTag](
	[BlogPostID] [int] NOT NULL,
	[TagID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QueueAction]    Script Date: 4/25/2016 11:00:47 AM ******/
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
/****** Object:  Table [dbo].[StaticImage]    Script Date: 4/25/2016 11:00:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaticImage](
	[StaticPageID] [int] NOT NULL,
	[ImageID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StaticPage]    Script Date: 4/25/2016 11:00:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StaticPage](
	[StaticPageID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](125) NOT NULL,
	[TextBody] [varchar](max) NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[DeletedTime] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_StaticPage] PRIMARY KEY CLUSTERED 
(
	[StaticPageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 4/25/2016 11:00:47 AM ******/
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
INSERT [dbo].[BlogImage] ([BlogPostID], [ImageID]) VALUES (1, 1)
GO
INSERT [dbo].[BlogImage] ([BlogPostID], [ImageID]) VALUES (4, 1)
GO
SET IDENTITY_INSERT [dbo].[BlogPost] ON 

GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (1, 2, N'The Dropkick Tables', N'<p><strong>SDAFGASDF</strong></p>\r\n<p style=\"text-align: right;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<ul>\r\n<li><strong>asdfasd</strong></li>\r\n</ul>', NULL, NULL, CAST(N'2016-04-20 16:47:00.000' AS DateTime), CAST(N'2016-04-20 16:47:00.000' AS DateTime), NULL, 0, 1, N'025bee71-8da8-447a-bf41-e09e601a6a60')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (3, 6, N'Will Project Ride Finally Dethrone Visual Studio?', N'<p><strong>SDAFGASDF</strong></p>\r\n<p style=\"text-align: right;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<ul>\r\n<li><strong>asdfasd</strong></li>\r\n</ul>', NULL, NULL, CAST(N'2016-04-20 16:47:00.000' AS DateTime), CAST(N'2016-04-20 16:47:00.000' AS DateTime), NULL, 0, 0, N'025bee71-8da8-447a-bf41-e09e601a6a60')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (4, 9, N'Is Twitter''s API Due for a Refresh?', N'<p><strong>SDAFGASDF</strong></p>\r\n<p style=\"text-align: right;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<ul>\r\n<li><strong>asdfasd</strong></li>\r\n</ul>', NULL, NULL, CAST(N'2016-04-20 16:47:00.000' AS DateTime), CAST(N'2016-04-20 16:47:00.000' AS DateTime), NULL, 0, 1, N'025bee71-8da8-447a-bf41-e09e601a6a60')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (7, 7, N'How Agile is Your Team?', N'<p><strong>SDAFGASDF</strong></p>\r\n<p style=\"text-align: right;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<ul>\r\n<li><strong>asdfasd</strong></li>\r\n</ul>', CAST(N'2016-04-21 16:47:00.000' AS DateTime), CAST(N'2016-04-22 16:47:00.000' AS DateTime), CAST(N'2016-04-21 16:47:00.000' AS DateTime), CAST(N'2016-04-21 16:47:00.000' AS DateTime), NULL, 0, 0, N'025bee71-8da8-447a-bf41-e09e601a6a60')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (16, 8, N'The Importance of Accurate Project Scope', N'<p><strong>SDAFGASDF</strong></p>\r\n<p style=\"text-align: right;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<ul>\r\n<li><strong>asdfasd</strong></li>\r\n</ul>', CAST(N'2016-05-21 16:47:00.000' AS DateTime), NULL, CAST(N'2016-04-21 16:47:00.000' AS DateTime), CAST(N'2016-04-21 16:47:00.000' AS DateTime), NULL, 0, 0, N'025bee71-8da8-447a-bf41-e09e601a6a60')
GO
INSERT [dbo].[BlogPost] ([BlogPostID], [CategoryID], [Title], [TextBody], [PostTime], [ExpirationTime], [UpdateTime], [CreationTime], [DeletedTime], [IsDeleted], [IsApproved], [UserID]) VALUES (17, 1, N'Will JavaScript Ever Die?', N'<p><strong>SDAFGASDF</strong></p>\r\n<p style=\"text-align: right;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\"><strong>asdf</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<ul>\r\n<li><strong>asdfasd</strong></li>\r\n</ul>', NULL, NULL, CAST(N'2016-04-21 16:47:00.000' AS DateTime), CAST(N'2016-04-21 16:47:00.000' AS DateTime), CAST(N'2016-04-22 16:47:00.000' AS DateTime), 1, 1, N'025bee71-8da8-447a-bf41-e09e601a6a60')
GO
SET IDENTITY_INSERT [dbo].[BlogPost] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Web Development')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Databases')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Object-oriented Programming')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'ASP.NET')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'.NET / C#')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'IDEs')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (7, N'Agile Methodology')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (8, N'Project Management')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (9, N'Web APIs')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[ContentQueue] ON 

GO
INSERT [dbo].[ContentQueue] ([ContentQueueID], [OrigBlogPostID], [NewBlogPostID], [QueueActionID]) VALUES (1, NULL, 3, 1)
GO
INSERT [dbo].[ContentQueue] ([ContentQueueID], [OrigBlogPostID], [NewBlogPostID], [QueueActionID]) VALUES (2, 1, 16, 2)
GO
INSERT [dbo].[ContentQueue] ([ContentQueueID], [OrigBlogPostID], [NewBlogPostID], [QueueActionID]) VALUES (4, NULL, 7, 3)
GO
SET IDENTITY_INSERT [dbo].[ContentQueue] OFF
GO
SET IDENTITY_INSERT [dbo].[Image] ON 

GO
INSERT [dbo].[Image] ([ImageID], [Name], [ImageData]) VALUES (1, N'Test', N'http://standrewscitychurch.com/wp-content/uploads/2015/12/Testing.gif')
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
SET IDENTITY_INSERT [dbo].[Tag] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 4/25/2016 11:00:47 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 4/25/2016 11:00:47 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 4/25/2016 11:00:47 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 4/25/2016 11:00:47 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 4/25/2016 11:00:47 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 4/25/2016 11:00:47 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StaticPage] ADD  CONSTRAINT [DF_StaticPage_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
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
/****** Object:  StoredProcedure [dbo].[AddABlog]    Script Date: 4/25/2016 11:00:47 AM ******/
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
		@BlogID int output

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO dbo.BlogPost (CategoryID, UserID, Title, TextBody, UpdateTime, CreationTime)
	 VALUES(@CategoryID, @UserID, @Title, @TextBody, @UpdateTime, @CreationTime);
		SET @BlogID = SCOPE_IDENTITY();
END

GO
/****** Object:  StoredProcedure [dbo].[AddACategory]    Script Date: 4/25/2016 11:00:47 AM ******/
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
	@CategoryID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO  dbo.Category (CategoryName) VALUES(@Name);
	SET @CategoryID = SCOPE_IDENTITY();
	
END

GO
/****** Object:  StoredProcedure [dbo].[AddAnImage]    Script Date: 4/25/2016 11:00:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AddATag]    Script Date: 4/25/2016 11:00:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[BridgeBlogImage]    Script Date: 4/25/2016 11:00:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[BridgePostTag]    Script Date: 4/25/2016 11:00:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[CategoryCount]    Script Date: 4/25/2016 11:00:47 AM ******/
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
	GROUP BY c.CategoryID, c.CategoryName
	ORDER BY TotalMentions desc
END

GO
/****** Object:  StoredProcedure [dbo].[GetAllBlogPostByCategoryID]    Script Date: 4/25/2016 11:00:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllBlogPostByTagID]    Script Date: 4/25/2016 11:00:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllBlogs]    Script Date: 4/25/2016 11:00:47 AM ******/
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
	SELECT c.CategoryName, bp.Title, bp.UserID, bp.TextBody, bp.PostTime FROM BlogPost bp
	INNER JOIN Category c
	 ON c.CategoryID = bp.CategoryID
	  WHERE bp.IsApproved = 1 AND bp.IsDeleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[GetAllCategories]    Script Date: 4/25/2016 11:00:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllTagNameByBlogPostID]    Script Date: 4/25/2016 11:00:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllTags]    Script Date: 4/25/2016 11:00:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetBlogImageByBlogID]    Script Date: 4/25/2016 11:00:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteCategory]    Script Date: 4/25/2016 11:09:44 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetBlogPostByBlogPostID]    Script Date: 4/25/2016 11:00:47 AM ******/
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
	SELECT c.CategoryName, bp.Title, bp.TextBody
	,bp.UserID, bp.PostTime, bp.UpdateTime
	FROM BlogPost bp
	INNER JOIN Category c
	 ON c.CategoryID = bp.CategoryID
	WHERE @BlogID = bp.BlogPostID
END

GO
USE [master]
GO
ALTER DATABASE [CircularLogic] SET  READ_WRITE 
GO
