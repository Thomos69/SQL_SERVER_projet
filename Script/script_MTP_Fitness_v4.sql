USE [master]
GO
/****** Object:  Database [FITNESS MONTPELLIER]    Script Date: 12/07/2021 16:05:57 ******/
CREATE DATABASE [FITNESS MONTPELLIER]
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FITNESS MONTPELLIER].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET ARITHABORT OFF 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET RECOVERY FULL 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET  MULTI_USER 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FITNESS MONTPELLIER', N'ON'
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET QUERY_STORE = OFF
GO
USE [FITNESS MONTPELLIER]
GO
/****** Object:  Table [dbo].[club_prestation]    Script Date: 12/07/2021 16:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[club_prestation](
	[ID_club] [int] NOT NULL,
	[ID_prestation] [int] NOT NULL,
 CONSTRAINT [PK_club_prestation] PRIMARY KEY CLUSTERED 
(
	[ID_prestation] ASC,
	[ID_club] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prestation]    Script Date: 12/07/2021 16:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prestation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](255) NOT NULL,
	[prix_mensuel] [money] NOT NULL,
 CONSTRAINT [PK_prestation_entretien] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[club]    Script Date: 12/07/2021 16:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[club](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](255) NOT NULL,
	[adresse] [varchar](255) NOT NULL,
	[numero_telephone] [varchar](20) NOT NULL,
	[surface_locaux] [smallint] NOT NULL,
	[loyer] [money] NOT NULL,
 CONSTRAINT [PK_club] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Unique_nom_club] UNIQUE NONCLUSTERED 
(
	[nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Unique_tel_club] UNIQUE NONCLUSTERED 
(
	[numero_telephone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[get_prestation_prix]    Script Date: 12/07/2021 16:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[get_prestation_prix]
(
@nom_club varchar(255)
)
RETURNS TABLE
AS
RETURN
(
select prestation.prix_mensuel from club_prestation,club,prestation where club.nom = @nom_club and ID_club = club.ID and prestation.ID = ID_prestation
)
GO
/****** Object:  Table [dbo].[club_adherent]    Script Date: 12/07/2021 16:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[club_adherent](
	[ID_club] [int] NOT NULL,
	[ID_adherent] [int] NOT NULL,
	[note] [numeric](2, 1) NULL,
 CONSTRAINT [PK_club_adherent] PRIMARY KEY CLUSTERED 
(
	[ID_club] ASC,
	[ID_adherent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[nb_inscrits_par_club]    Script Date: 12/07/2021 16:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[nb_inscrits_par_club]
AS
select club.nom as 'Nom du club', count(*) as "Nombre d'inscrits" from club_adherent, club where ID_club = club.ID group by club.nom ORDER by [Nombre d'inscrits] DESC OFFSET 0 ROWS;
GO
/****** Object:  Table [dbo].[club_employes]    Script Date: 12/07/2021 16:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[club_employes](
	[ID_club] [int] NOT NULL,
	[ID_employes] [int] NOT NULL,
 CONSTRAINT [PK_club_employes] PRIMARY KEY CLUSTERED 
(
	[ID_employes] ASC,
	[ID_club] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[nb_employes_par_club]    Script Date: 12/07/2021 16:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Voir le nombres d'employes par club

CREATE view [dbo].[nb_employes_par_club]
AS
select club.nom as 'Nom du club', count(*) as "Nombre d'employes" from club_employes, club where ID_club = club.ID group by club.nom ORDER by [Nombre d'employes] DESC OFFSET 0 ROWS;
GO
/****** Object:  Table [dbo].[club_materiel]    Script Date: 12/07/2021 16:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[club_materiel](
	[ID_club] [int] NOT NULL,
	[ID_materiel] [int] NOT NULL,
 CONSTRAINT [PK_club_materiel] PRIMARY KEY CLUSTERED 
(
	[ID_club] ASC,
	[ID_materiel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[nb_machines_par_club]    Script Date: 12/07/2021 16:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Voir le nombres de machines par club

CREATE view [dbo].[nb_machines_par_club]
AS
select club.nom as 'Nom du club', count(*) as 'Nombre machines' from club_materiel, club where ID_club = club.ID group by club.nom ORDER by [Nombre machines] DESC OFFSET 0 ROWS;
GO
/****** Object:  Table [dbo].[options]    Script Date: 12/07/2021 16:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[options](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](255) NOT NULL,
	[prix] [money] NOT NULL,
 CONSTRAINT [PK_options] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adherents_options]    Script Date: 12/07/2021 16:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adherents_options](
	[ID_adherents] [int] NOT NULL,
	[ID_options] [int] NOT NULL,
 CONSTRAINT [PK_adherents_options] PRIMARY KEY CLUSTERED 
(
	[ID_adherents] ASC,
	[ID_options] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[nb_achats_options]    Script Date: 12/07/2021 16:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Voir le nombres d'achats par options

CREATE view [dbo].[nb_achats_options]
AS
select options.nom as "Nom de l'option", COUNT(*) as "Nombre d'achats" from options, adherents_options where options.ID = ID_options Group by options.nom order by [Nombre d'achats] DESC OFFSET 0 ROWS;
GO
/****** Object:  View [dbo].[surface_club_locaux]    Script Date: 12/07/2021 16:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Voir la surface de chaque locaux

CREATE view [dbo].[surface_club_locaux]
AS
select club.nom as 'Nom du club', club.surface_locaux as 'Surface des locaux ( m² )' from club ORDER by [Surface des locaux ( m² )] DESC OFFSET 0 ROWS;
GO
/****** Object:  View [dbo].[moyenne_note_club]    Script Date: 12/07/2021 16:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Moyennes des notes des différents clubs

CREATE view [dbo].[moyenne_note_club]
AS
select club.nom as 'Nom du Club', CAST(AVG(note) as decimal(2,1)) as 'Moyenne des notes' from club_adherent, club where club.ID = ID_club GROUP BY club.nom ORDER BY [Moyenne des notes] DESC OFFSET 0 ROWS;
GO
/****** Object:  UserDefinedFunction [dbo].[get_nb_personne_max_covid]    Script Date: 12/07/2021 16:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[get_nb_personne_max_covid](@club_nom varchar(255))
RETURNS TABLE
AS
RETURN (select club.nom, club.surface_locaux/4 as 'Nombre de personnes autorisées' from club WHERE club.nom = @club_nom);
GO
/****** Object:  View [dbo].[nb_personne_covid]    Script Date: 12/07/2021 16:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[nb_personne_covid]
AS
select club.nom as 'Nom du Club', [Nombre de personnes autorisées] from club CROSS APPLY get_nb_personne_max_covid(club.nom) ORDER by [Nombre de personnes autorisées] DESC OFFSET 0 ROWS;
GO
/****** Object:  Table [dbo].[adherents]    Script Date: 12/07/2021 16:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adherents](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](255) NOT NULL,
	[prenom] [varchar](255) NOT NULL,
	[numero_telephone] [varchar](20) NOT NULL,
	[date_de_naissance] [date] NOT NULL,
	[date_inscription] [date] NOT NULL,
	[licence_valide] [bit] NOT NULL,
 CONSTRAINT [PK_adherants] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Unique_tel_adherants] UNIQUE NONCLUSTERED 
(
	[numero_telephone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[prix_par_adherent]    Script Date: 12/07/2021 16:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[prix_par_adherent]
AS
select CONCAT(adherents.nom, ' ',adherents.prenom) as 'Nom Prenom', SUM(options.prix) as 'Prix total', COUNT(options.prix) as "Nombre d'options achetées"
from options, adherents, adherents_options 
where adherents.ID = ID_adherents and options.ID = ID_options 
GROUP BY CONCAT(adherents.nom, ' ',adherents.prenom)
ORDER BY [Prix total] DESC OFFSET 0 ROWS
GO
/****** Object:  Table [dbo].[employes]    Script Date: 12/07/2021 16:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](255) NOT NULL,
	[prenom] [varchar](255) NOT NULL,
	[date_de_naissance] [date] NOT NULL,
	[numero_telephone] [varchar](20) NOT NULL,
	[date_recrutement] [date] NOT NULL,
	[salaire] [money] NOT NULL,
 CONSTRAINT [PK_employes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_employes] UNIQUE NONCLUSTERED 
(
	[numero_telephone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[materiel]    Script Date: 12/07/2021 16:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materiel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](255) NOT NULL,
	[description] [text] NULL,
	[etat] [varchar](255) NOT NULL,
 CONSTRAINT [PK_materiel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[adherents_options]  WITH CHECK ADD  CONSTRAINT [FK_adherents_options_adherents] FOREIGN KEY([ID_adherents])
REFERENCES [dbo].[adherents] ([ID])
GO
ALTER TABLE [dbo].[adherents_options] CHECK CONSTRAINT [FK_adherents_options_adherents]
GO
ALTER TABLE [dbo].[adherents_options]  WITH CHECK ADD  CONSTRAINT [FK_adherents_options_options] FOREIGN KEY([ID_options])
REFERENCES [dbo].[options] ([ID])
GO
ALTER TABLE [dbo].[adherents_options] CHECK CONSTRAINT [FK_adherents_options_options]
GO
ALTER TABLE [dbo].[club_adherent]  WITH CHECK ADD  CONSTRAINT [FK_club_adherent_adherants] FOREIGN KEY([ID_adherent])
REFERENCES [dbo].[adherents] ([ID])
GO
ALTER TABLE [dbo].[club_adherent] CHECK CONSTRAINT [FK_club_adherent_adherants]
GO
ALTER TABLE [dbo].[club_adherent]  WITH CHECK ADD  CONSTRAINT [FK_club_adherent_club] FOREIGN KEY([ID_club])
REFERENCES [dbo].[club] ([ID])
GO
ALTER TABLE [dbo].[club_adherent] CHECK CONSTRAINT [FK_club_adherent_club]
GO
ALTER TABLE [dbo].[club_employes]  WITH CHECK ADD  CONSTRAINT [FK_club_employes_club] FOREIGN KEY([ID_club])
REFERENCES [dbo].[club] ([ID])
GO
ALTER TABLE [dbo].[club_employes] CHECK CONSTRAINT [FK_club_employes_club]
GO
ALTER TABLE [dbo].[club_employes]  WITH CHECK ADD  CONSTRAINT [FK_club_employes_employes] FOREIGN KEY([ID_employes])
REFERENCES [dbo].[employes] ([ID])
GO
ALTER TABLE [dbo].[club_employes] CHECK CONSTRAINT [FK_club_employes_employes]
GO
ALTER TABLE [dbo].[club_materiel]  WITH CHECK ADD  CONSTRAINT [FK_club_materiel_club] FOREIGN KEY([ID_club])
REFERENCES [dbo].[club] ([ID])
GO
ALTER TABLE [dbo].[club_materiel] CHECK CONSTRAINT [FK_club_materiel_club]
GO
ALTER TABLE [dbo].[club_materiel]  WITH CHECK ADD  CONSTRAINT [FK_club_materiel_materiel] FOREIGN KEY([ID_materiel])
REFERENCES [dbo].[materiel] ([ID])
GO
ALTER TABLE [dbo].[club_materiel] CHECK CONSTRAINT [FK_club_materiel_materiel]
GO
ALTER TABLE [dbo].[club_prestation]  WITH CHECK ADD  CONSTRAINT [FK_club_prestation_club] FOREIGN KEY([ID_club])
REFERENCES [dbo].[club] ([ID])
GO
ALTER TABLE [dbo].[club_prestation] CHECK CONSTRAINT [FK_club_prestation_club]
GO
ALTER TABLE [dbo].[club_prestation]  WITH CHECK ADD  CONSTRAINT [FK_club_prestation_prestation_entretien] FOREIGN KEY([ID_prestation])
REFERENCES [dbo].[prestation] ([ID])
GO
ALTER TABLE [dbo].[club_prestation] CHECK CONSTRAINT [FK_club_prestation_prestation_entretien]
GO
USE [master]
GO
ALTER DATABASE [FITNESS MONTPELLIER] SET  READ_WRITE 
GO
