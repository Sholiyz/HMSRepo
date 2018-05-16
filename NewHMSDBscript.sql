/******USE [master]
GO
 Object:  Database [HMSDB]    Script Date: 5/15/2018 8:04:14 PM 
CREATE DATABASE [HMSDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HMSDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HMSDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HMSDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HMSDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HMSDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HMSDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HMSDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HMSDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HMSDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HMSDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HMSDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HMSDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HMSDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HMSDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HMSDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HMSDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HMSDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HMSDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HMSDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HMSDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HMSDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HMSDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HMSDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HMSDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HMSDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HMSDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HMSDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HMSDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HMSDB] SET RECOVERY FULL 
GO
ALTER DATABASE [HMSDB] SET  MULTI_USER 
GO
ALTER DATABASE [HMSDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HMSDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HMSDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HMSDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HMSDB] SET DELAYED_DURABILITY = DISABLED 
GO******/
USE [HMSDB]
GO
/****** Object:  Table [dbo].[AuthRoles]    Script Date: 5/15/2018 8:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthRoles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[RoleDescription] [nvarchar](max) NULL,
	[CreatedByID] [int] NOT NULL,
	[ModifiedByID] [int] NULL,
	[CreatedDate] [date] NOT NULL,
	[ModifiedDate] [date] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_AuthRoles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AuthUsers]    Script Date: 5/15/2018 8:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthUsers](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[StaffID] [int] NOT NULL,
	[StaffRoleID] [int] NOT NULL,
	[CreatedByID] [int] NOT NULL,
	[ModifiedByID] [int] NULL,
	[CreatedDate] [date] NOT NULL,
	[ModifiedDate] [date] NULL,
	[FailedLoginCount] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_AuthUsers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Billing]    Script Date: 5/15/2018 8:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Billing](
	[ID] [int] IDENTITY(1001,1) NOT NULL,
	[BillingID] [varchar](50) NULL,
	[StaffID] [int] NOT NULL,
	[PatientID] [int] NOT NULL,
	[BillForID] [int] NOT NULL,
	[TransactionTypeID] [int] NOT NULL,
	[ConsultationID] [int] NULL,
	[BillingCost] [money] NOT NULL,
	[CreatedByID] [int] NOT NULL,
	[ModifiedByID] [int] NULL,
	[CreatedDate] [date] NOT NULL,
	[ModifiedDate] [date] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Billing] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Consultations]    Script Date: 5/15/2018 8:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultations](
	[ConsultationID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[ConsultantID] [int] NOT NULL,
	[Symptums] [nvarchar](max) NULL,
	[Diagnosis] [nvarchar](max) NULL,
	[Prescription] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[ConsultationForID] [int] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[CreatedByID] [int] NOT NULL,
	[ModifiedByID] [int] NULL,
	[CreatedDate] [date] NOT NULL,
	[ModifiedDate] [date] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Consultations] PRIMARY KEY CLUSTERED 
(
	[ConsultationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 5/15/2018 8:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Doctors](
	[DoctorID] [int] IDENTITY(1001,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[OtherNames] [nvarchar](50) NULL,
	[FullName] [nvarchar](150) NOT NULL,
	[Gender] [varchar](10) NULL,
	[PhoneNumber] [nvarchar](18) NULL,
	[Address] [nvarchar](50) NULL,
	[Picture] [image] NULL,
	[DOB] [date] NOT NULL,
	[DateEmployed] [date] NULL,
	[CreatedByID] [int] NOT NULL,
	[ModifiedByID] [int] NULL,
	[CreatedDate] [date] NOT NULL,
	[ModifiedDate] [date] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DutyType]    Script Date: 5/15/2018 8:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DutyType](
	[DutyTypeID] [int] IDENTITY(1,1) NOT NULL,
	[DutyTypeName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](150) NULL,
	[Duration] [int] NOT NULL,
	[StartTime] [time](0) NULL,
	[EndTime] [time](0) NULL,
	[CreatedByID] [int] NOT NULL,
	[ModifiedByID] [int] NULL,
	[CreatedDate] [date] NOT NULL,
	[ModifiesDate] [date] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_DutyType] PRIMARY KEY CLUSTERED 
(
	[DutyTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FamilyMembers]    Script Date: 5/15/2018 8:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FamilyMembers](
	[FamilyMemberID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[OtherNames] [nvarchar](50) NULL,
	[FullName] [nvarchar](150) NOT NULL,
	[Gender] [varchar](10) NULL,
	[PhoneNumber] [nvarchar](10) NULL,
	[Address] [nvarchar](10) NULL,
	[Picture] [image] NULL,
	[DOB] [date] NOT NULL,
	[CreatedByID] [int] NOT NULL,
	[ModifiedByID] [int] NULL,
	[CreatedDate] [date] NOT NULL,
	[ModifiedDate] [date] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_FamilyMembers] PRIMARY KEY CLUSTERED 
(
	[FamilyMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NurseDuty]    Script Date: 5/15/2018 8:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NurseDuty](
	[NurseDutyID] [int] IDENTITY(1,1) NOT NULL,
	[NurseID] [int] NOT NULL,
	[DutyTypeID] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CreatedByID] [int] NOT NULL,
	[ModifiedByID] [int] NULL,
	[CreatedByDate] [date] NOT NULL,
	[ModifiedByDate] [date] NULL,
 CONSTRAINT [PK_NurseDuty] PRIMARY KEY CLUSTERED 
(
	[NurseDutyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nurses]    Script Date: 5/15/2018 8:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nurses](
	[NurseID] [int] IDENTITY(1001,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[OtherNames] [nvarchar](50) NULL,
	[FullName] [nvarchar](150) NOT NULL,
	[Gender] [varchar](10) NULL,
	[PhoneNumber] [nvarchar](18) NULL,
	[Address] [nvarchar](50) NULL,
	[Picture] [image] NULL,
	[DOB] [date] NOT NULL,
	[DateEmployed] [date] NULL,
	[CreatedByID] [int] NOT NULL,
	[ModifiedByID] [int] NULL,
	[CreatedDate] [date] NOT NULL,
	[ModifiedDate] [date] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Nurses] PRIMARY KEY CLUSTERED 
(
	[NurseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientPlanType]    Script Date: 5/15/2018 8:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientPlanType](
	[PlanTypeID] [int] IDENTITY(1,1) NOT NULL,
	[PlanTypeName] [nvarchar](50) NOT NULL,
	[PlanTypeDescription] [nvarchar](150) NULL,
	[PlanTypeMaximumMember] [int] NOT NULL,
	[CreatedByID] [int] NOT NULL,
	[ModifiedByID] [int] NULL,
	[CreatedDate] [date] NOT NULL,
	[ModifiedDate] [date] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_PatientPlan] PRIMARY KEY CLUSTERED 
(
	[PlanTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patients]    Script Date: 5/15/2018 8:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patients](
	[PatientID] [int] IDENTITY(1001,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[OtherNames] [nvarchar](50) NULL,
	[FullName] [nvarchar](150) NOT NULL,
	[Gender] [varchar](10) NULL,
	[MaritalStatus] [varchar](10) NULL,
	[Occupation] [nchar](10) NULL,
	[PhoneNumber] [nvarchar](18) NULL,
	[Address] [nvarchar](50) NULL,
	[Picture] [image] NULL,
	[DOB] [date] NOT NULL,
	[NextofKinFullName] [nvarchar](150) NULL,
	[NextofKinPhoneNumber] [nvarchar](18) NULL,
	[CreatedByID] [int] NOT NULL,
	[ModifiedByID] [int] NULL,
	[CreatedDate] [date] NOT NULL,
	[ModifiedDate] [date] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrasactionType]    Script Date: 5/15/2018 8:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrasactionType](
	[TrasactionTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TrasactionTypeName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](150) NULL,
	[CreatedByID] [int] NOT NULL,
	[ModifiedByID] [int] NULL,
	[CreatedDate] [date] NOT NULL,
	[ModifiedDate] [date] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TrasactionType] PRIMARY KEY CLUSTERED 
(
	[TrasactionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[AuthRoles] ADD  CONSTRAINT [DF_AuthRoles_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AuthUsers] ADD  CONSTRAINT [DF_AuthUsers_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AuthUsers] ADD  CONSTRAINT [DF_Table_1_IsLockedOutCount]  DEFAULT ((0)) FOR [FailedLoginCount]
GO
ALTER TABLE [dbo].[AuthUsers] ADD  CONSTRAINT [DF_AuthUsers_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AuthUsers] ADD  CONSTRAINT [DF_AuthUsers_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Billing] ADD  CONSTRAINT [DF_Billing_BillingCost]  DEFAULT ((0)) FOR [BillingCost]
GO
ALTER TABLE [dbo].[Billing] ADD  CONSTRAINT [DF_Billing_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Billing] ADD  CONSTRAINT [DF_Billing_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Consultations] ADD  CONSTRAINT [DF_Consultations_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Doctors] ADD  CONSTRAINT [DF_Doctors_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Doctors] ADD  CONSTRAINT [DF_Doctors_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[DutyType] ADD  CONSTRAINT [DF_DutyType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[DutyType] ADD  CONSTRAINT [DF_DutyType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[FamilyMembers] ADD  CONSTRAINT [DF_FamilyMembers_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[FamilyMembers] ADD  CONSTRAINT [DF_FamilyMembers_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[NurseDuty] ADD  CONSTRAINT [DF_NurseDuty_CreatedByDate]  DEFAULT (getdate()) FOR [CreatedByDate]
GO
ALTER TABLE [dbo].[Nurses] ADD  CONSTRAINT [DF_Nurses_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Nurses] ADD  CONSTRAINT [DF_Nurses_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[PatientPlanType] ADD  CONSTRAINT [DF_PatientPlan_PlanMaximumMember]  DEFAULT ((1)) FOR [PlanTypeMaximumMember]
GO
ALTER TABLE [dbo].[PatientPlanType] ADD  CONSTRAINT [DF_PatientPlan_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PatientPlanType] ADD  CONSTRAINT [DF_PatientPlan_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Patients] ADD  CONSTRAINT [DF_Patients_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Patients] ADD  CONSTRAINT [DF_Patients_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TrasactionType] ADD  CONSTRAINT [DF_TrasactionType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
USE [master]
GO
ALTER DATABASE [HMSDB] SET  READ_WRITE 
GO
