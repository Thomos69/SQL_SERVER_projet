USE [FITNESS MONTPELLIER]
GO
/****** Object:  Table [dbo].[adherents]    Script Date: 12/07/2021 19:48:04 ******/
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
/****** Object:  Table [dbo].[adherents_options]    Script Date: 12/07/2021 19:48:04 ******/
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
/****** Object:  Table [dbo].[club]    Script Date: 12/07/2021 19:48:04 ******/
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
/****** Object:  Table [dbo].[club_adherent]    Script Date: 12/07/2021 19:48:04 ******/
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
/****** Object:  Table [dbo].[club_employes]    Script Date: 12/07/2021 19:48:04 ******/
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
/****** Object:  Table [dbo].[club_materiel]    Script Date: 12/07/2021 19:48:04 ******/
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
/****** Object:  Table [dbo].[club_prestation]    Script Date: 12/07/2021 19:48:04 ******/
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
/****** Object:  Table [dbo].[employes]    Script Date: 12/07/2021 19:48:04 ******/
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
/****** Object:  Table [dbo].[entree_sortie]    Script Date: 12/07/2021 19:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entree_sortie](
	[entree] [datetime] NOT NULL,
	[sortie] [datetime] NULL,
	[ID_adherents] [int] NOT NULL,
 CONSTRAINT [PK_entree_sortie_1] PRIMARY KEY CLUSTERED 
(
	[entree] ASC,
	[ID_adherents] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[materiel]    Script Date: 12/07/2021 19:48:04 ******/
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
/****** Object:  Table [dbo].[options]    Script Date: 12/07/2021 19:48:04 ******/
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
/****** Object:  Table [dbo].[prestation]    Script Date: 12/07/2021 19:48:04 ******/
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
ALTER TABLE [dbo].[entree_sortie]  WITH CHECK ADD  CONSTRAINT [FK_entree_sortie_adherents] FOREIGN KEY([ID_adherents])
REFERENCES [dbo].[adherents] ([ID])
GO
ALTER TABLE [dbo].[entree_sortie] CHECK CONSTRAINT [FK_entree_sortie_adherents]
GO
