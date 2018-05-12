USE [master]
GO

/****** Object:  Database [HMSDB]    Script Date: 5/12/2018 6:21:38 AM ******/
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
GO

ALTER DATABASE [HMSDB] SET  READ_WRITE 
GO

