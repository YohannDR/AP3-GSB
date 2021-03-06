USE [GSB_gesAMM]
GO
/****** Object:  Table [dbo].[Decision]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Decision](
	[id] [int] NULL,
	[lbelle] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etape]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etape](
	[num] [int] NOT NULL,
	[libelle] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EtapeNormee]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EtapeNormee](
	[norme] [varchar](50) NULL,
	[dateNorme] [datetime] NULL,
	[numEtape] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[numEtape] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAMILLE]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAMILLE](
	[FAM_CODE] [nvarchar](3) NOT NULL,
	[FAM_LIBELLE] [nvarchar](80) NULL,
	[FAM_NBMEDIC] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historique]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historique](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dateModif] [datetime] NOT NULL,
	[utilisateur] [varchar](50) NOT NULL,
	[numEtape] [int] NOT NULL,
	[normeAvant] [varchar](100) NOT NULL,
	[normeApres] [varchar](100) NOT NULL,
	[dateNormeAvant] [datetime] NOT NULL,
	[dateNormeApres] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MEDICAMENT]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEDICAMENT](
	[MED_DEPOTLEGAL] [nvarchar](10) NOT NULL,
	[MED_NOMCOMMERCIAL] [nvarchar](25) NULL,
	[FAM_CODE] [nvarchar](3) NOT NULL,
	[MED_COMPOSITION] [nvarchar](255) NULL,
	[MED_EFFETS] [nvarchar](255) NULL,
	[MED_CONTREINDIC] [nvarchar](255) NULL,
	[MED_PRIXECHANTILLON] [real] NULL,
	[derniere_etape] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workflow]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workflow](
	[dateDecision] [date] NULL,
	[numEtape] [int] NULL,
	[idDecision] [int] NULL,
	[medDepotLegal] [nvarchar](10) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Decision] ([id], [lbelle]) VALUES (5, N'tour eiffel')
INSERT [dbo].[Decision] ([id], [lbelle]) VALUES (0, N'Refusée')
INSERT [dbo].[Decision] ([id], [lbelle]) VALUES (1, N'Validée')
GO
INSERT [dbo].[Etape] ([num], [libelle]) VALUES (1, N'Définition du protocole de validation')
INSERT [dbo].[Etape] ([num], [libelle]) VALUES (2, N'Pharmacologie expérimentale')
INSERT [dbo].[Etape] ([num], [libelle]) VALUES (3, N'Toxicologie')
INSERT [dbo].[Etape] ([num], [libelle]) VALUES (4, N'Pharmacocinétique')
INSERT [dbo].[Etape] ([num], [libelle]) VALUES (5, N'Expérimentation animale')
INSERT [dbo].[Etape] ([num], [libelle]) VALUES (6, N'Méthodes alternatives')
INSERT [dbo].[Etape] ([num], [libelle]) VALUES (7, N'Essais cliniques')
INSERT [dbo].[Etape] ([num], [libelle]) VALUES (8, N'Autorisation Mise sur le Marché')
GO
INSERT [dbo].[EtapeNormee] ([norme], [dateNorme], [numEtape]) VALUES (NULL, NULL, 1)
INSERT [dbo].[EtapeNormee] ([norme], [dateNorme], [numEtape]) VALUES (NULL, NULL, 2)
INSERT [dbo].[EtapeNormee] ([norme], [dateNorme], [numEtape]) VALUES (N'665/2005/CEA', CAST(N'2005-04-30T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[EtapeNormee] ([norme], [dateNorme], [numEtape]) VALUES (NULL, NULL, 4)
INSERT [dbo].[EtapeNormee] ([norme], [dateNorme], [numEtape]) VALUES (N'180/2012/CEE', CAST(N'2012-01-05T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[EtapeNormee] ([norme], [dateNorme], [numEtape]) VALUES (NULL, NULL, 6)
INSERT [dbo].[EtapeNormee] ([norme], [dateNorme], [numEtape]) VALUES (N'457/2008/CEE', CAST(N'2008-03-15T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[EtapeNormee] ([norme], [dateNorme], [numEtape]) VALUES (N'665/2005/CEA', CAST(N'2005-04-30T00:00:00.000' AS DateTime), 8)
GO
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NBMEDIC]) VALUES (N'AA', N'Antalgiques en association', 12)
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NBMEDIC]) VALUES (N'AAA', N'Antalgiques antipyrétiques en association', 10)
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NBMEDIC]) VALUES (N'AAC', N'Antidépresseur d''action centrale', 1)
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NBMEDIC]) VALUES (N'AAH', N'Antivertigineux antihistaminique H1', 0)
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NBMEDIC]) VALUES (N'ABA', N'Antibiotique antituberculeux', 6)
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NBMEDIC]) VALUES (N'ABC', N'Antibiotique antiacnéique local', 8)
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NBMEDIC]) VALUES (N'ABP', N'Antibiotique de la famille des béta-lactamines (pénicilline A)', 20)
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NBMEDIC]) VALUES (N'AFC', N'Antibiotique de la famille des cyclines', 41)
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NBMEDIC]) VALUES (N'AFM', N'Antibiotique de la famille des macrolides', 20)
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NBMEDIC]) VALUES (N'AH', N'Antihistaminique H1 local', 102)
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NBMEDIC]) VALUES (N'AIM', N'Antidépresseur imipraminique (tricyclique)', 1)
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NBMEDIC]) VALUES (N'AIN', N'Antidépresseur inhibiteur sélectif de la recapture de la sérotonine', 10)
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NBMEDIC]) VALUES (N'ALO', N'Antibiotique local (ORL)', 15)
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NBMEDIC]) VALUES (N'ANS', N'Antidépresseur IMAO non sélectif', 48)
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NBMEDIC]) VALUES (N'AO', N'Antibiotique ophtalmique', 68)
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NBMEDIC]) VALUES (N'AP', N'Antipsychotique normothymique', 78)
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NBMEDIC]) VALUES (N'AUM', N'Antibiotique urinaire minute', 54)
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NBMEDIC]) VALUES (N'CRT', N'Corticoïde, antibiotique et antifongique à  usage local', 13)
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NBMEDIC]) VALUES (N'HYP', N'Hypnotique antihistaminique', 65)
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NBMEDIC]) VALUES (N'PSA', N'Psychostimulant, antiasthénique', 0)
GO
SET IDENTITY_INSERT [dbo].[Historique] ON 

INSERT [dbo].[Historique] ([id], [dateModif], [utilisateur], [numEtape], [normeAvant], [normeApres], [dateNormeAvant], [dateNormeApres]) VALUES (26, CAST(N'2021-12-10T14:39:12.417' AS DateTime), N'Marvine', 3, N'665/2005/CEZ', N'665/2005/CEA', CAST(N'2006-04-30T00:00:00.000' AS DateTime), CAST(N'2005-04-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Historique] ([id], [dateModif], [utilisateur], [numEtape], [normeAvant], [normeApres], [dateNormeAvant], [dateNormeApres]) VALUES (31, CAST(N'2021-12-10T14:48:33.853' AS DateTime), N'Marvine', 8, N'665/2005/CEE', N'665/2005/CEA', CAST(N'2005-04-30T00:00:00.000' AS DateTime), CAST(N'2005-04-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Historique] ([id], [dateModif], [utilisateur], [numEtape], [normeAvant], [normeApres], [dateNormeAvant], [dateNormeApres]) VALUES (32, CAST(N'2021-12-11T16:58:29.557' AS DateTime), N'Marvine', 7, N'457/2008/CEE', N'457/2008/CEE', CAST(N'2008-03-15T00:00:00.000' AS DateTime), CAST(N'2008-03-15T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Historique] OFF
GO
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'3MYC7', N'TRIMYCINE', N'CRT', N'Triamcinolone (acétonide) + Néomycine + Nystatine', N'Ce médicament est un corticoïde à  activité forte ou très forte associé à  un antibiotique et un antifongique, utilisé en application locale dans certaines atteintes cutanées surinfectées.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants, d''infections de la peau ou de parasitisme non traités, d''acné. Ne pas appliquer sur une plaie, ni sous un pansement occlusif.', 1, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'ADIMOL9', N'ADIMOL', N'ABP', N'Amoxicilline + Acide clavulanique', N'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', N'Ce médicament est contre-indiqué en cas d''allergie aux pénicillines ou aux céphalosporines.', 15, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'AMOPIL7', N'AMOPIL', N'ABP', N'Amoxicilline', N'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', N'Ce médicament est contre-indiqué en cas d''allergie aux pénicillines. Il doit être administré avec prudence en cas d''allergie aux céphalosporines.', 14, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'AMOX45', N'AMOXAR', N'ABP', N'Amoxicilline', N'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', N'La prise de ce médicament peut rendre positifs les tests de dépistage du dopage.', 85, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'AMOXIG12', N'AMOXI Gé', N'ABP', N'Amoxicilline', N'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', N'Ce médicament est contre-indiqué en cas d''allergie aux pénicillines. Il doit être administré avec prudence en cas d''allergie aux céphalosporines.', 6, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'APATOUX22', N'APATOUX Vitamine C', N'ALO', N'Tyrothricine + Tétracaïne + Acide ascorbique (Vitamine C)', N'Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants, en cas de phénylcétonurie et chez l''enfant de moins de 6 ans.', 74, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'BACTIG10', N'BACTIGEL', N'ABC', N'Erythromycine', N'Ce médicament est utilisé en application locale pour traiter l''acné et les infections cutanées bactériennes associées.', N'Ce médicament est contre-indiqué en cas d''allergie aux antibiotiques de la famille des macrolides ou des lincosanides.', 5, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'BACTIV13', N'BACTIVIL', N'AFM', N'Erythromycine', N'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.', N'Ce médicament est contre-indiqué en cas d''allergie aux macrolides (dont le chef de file est l''érythromycine).', 9, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'BITALV', N'BIVALIC', N'AAA', N'Dextropropoxyphène + Paracétamol', N'Ce médicament est utilisé pour traiter les douleurs d''intensité modérée ou intense.', N'Ce médicament est contre-indiqué en cas d''allergie aux médicaments de cette famille, d''insuffisance hépatique ou d''insuffisance rénale.', 78, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'CARTION6', N'CARTION', N'AAA', N'Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol', N'Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.', N'Ce médicament est contre-indiqué en cas de troubles de la coagulation (tendances aux hémorragies), d''ulcère gastroduodénal, maladies graves du foie.', 5, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'CLAZER6', N'CLAZER', N'AFM', N'Clarithromycine', N'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques. Il est également utilisé dans le traitement de l''ulcère gastro-duodénal, en association avec d''autres médicaments.', N'Ce médicament est contre-indiqué en cas d''allergie aux macrolides (dont le chef de file est l''érythromycine).', 4, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'YOHANN', N'OUI', N'AA', N'TEST', N'TEST', N'TEST', 14, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'SALUT', N'OUI', N'AAA', N'test', N'test', N'test', 45, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'DEPRIL9', N'DEPRAMIL', N'AIM', N'Clomipramine', N'Ce médicament est utilisé pour traiter les épisodes dépressifs sévères, certaines douleurs rebelles, les troubles obsessionnels compulsifs et certaines énurésies chez l''enfant.', N'Ce médicament est contre-indiqué en cas de glaucome ou d''adénome de la prostate, d''infarctus récent, ou si vous avez reà§u un traitement par IMAO durant les 2 semaines précédentes ou en cas d''allergie aux antidépresseurs imipraminiques.', 23, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'DIMIRTAM6', N'DIMIRTAM', N'AAC', N'Mirtazapine', N'Ce médicament est utilisé pour traiter les épisodes dépressifs sévères.', N'La prise de ce produit est contre-indiquée en cas de d''allergie à  l''un des constituants.', 25, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'DOLRIL7', N'DOLORIL', N'AAA', N'Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol', N'Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.', N'Ce médicament est contre-indiqué en cas d''allergie au paracétamol ou aux salicylates.', 7, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'DORNOM8', N'NORMADOR', N'HYP', N'Doxylamine', N'Ce médicament est utilisé pour traiter l''insomnie chez l''adulte.', N'Ce médicament est contre-indiqué en cas de glaucome, de certains troubles urinaires (rétention urinaire) et chez l''enfant de moins de 15 ans.', 5, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'EQUILARX6', N'EQUILAR', N'AAH', N'Méclozine', N'Ce médicament est utilisé pour traiter les vertiges et pour prévenir le mal des transports.', N'Ce médicament ne doit pas être utilisé en cas d''allergie au produit, en cas de glaucome ou de rétention urinaire.', 7, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'EVILR7', N'EVEILLOR', N'PSA', N'Adrafinil', N'Ce médicament est utilisé pour traiter les troubles de la vigilance et certains symptomes neurologiques chez le sujet agé.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants.', 74, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'INSXT5', N'INSECTIL', N'AH', N'Diphénydramine', N'Ce médicament est utilisé en application locale sur les piqûres d''insecte et l''urticaire.', N'Ce médicament est contre-indiqué en cas d''allergie aux antihistaminiques.', 84, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'JOVAI8', N'JOVENIL', N'AFM', N'Josamycine', N'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.', N'Ce médicament est contre-indiqué en cas d''allergie aux macrolides (dont le chef de file est l''érythromycine).', 78, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'LIDOXY23', N'LIDOXYTRACINE', N'AFC', N'Oxytétracycline +Lidocaïne', N'Ce médicament est utilisé en injection intramusculaire pour traiter certaines infections spécifiques.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants. Il ne doit pas être associé aux rétinoïdes.', 96, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'LITHOR12', N'LITHORINE', N'AP', N'Lithium', N'Ce médicament est indiqué dans la prévention des psychoses maniaco-dépressives ou pour traiter les états maniaques.', N'Ce médicament ne doit pas être utilisé si vous êtes allergique au lithium. Avant de prendre ce traitement, signalez à  votre médecin traitant si vous souffrez d''insuffisance rénale, ou si vous avez un régime sans sel.', 85, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'PARMOL16', N'PARMOCODEINE', N'AA', N'Codéine + Paracétamol', N'Ce médicament est utilisé pour le traitement des douleurs lorsque des antalgiques simples ne sont pas assez efficaces.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants, chez l''enfant de moins de 15 Kg, en cas d''insuffisance hépatique ou respiratoire, d''asthme, de phénylcétonurie et chez la femme qui allaite.', 12, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'PHYSOI8', N'PHYSICOR', N'PSA', N'Sulbutiamine', N'Ce médicament est utilisé pour traiter les baisses d''activité physique ou psychique, souvent dans un contexte de dépression.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants.', 47, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'PIRIZ8', N'PIRIZAN', N'ABA', N'Pyrazinamide', N'Ce médicament est utilisé, en association à  d''autres antibiotiques, pour traiter la tuberculose.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants, d''insuffisance rénale ou hépatique, d''hyperuricémie ou de porphyrie.', 21, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'POMDI20', N'POMADINE', N'AO', N'Bacitracine', N'Ce médicament est utilisé pour traiter les infections oculaires de la surface de l''oeil.', N'Ce médicament est contre-indiqué en cas d''allergie aux antibiotiques appliqués localement.', 51, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'TROXT21', N'TROXADET', N'AIN', N'Paroxétine', N'Ce médicament est utilisé pour traiter la dépression et les troubles obsessionnels compulsifs. Il peut également être utilisé en prévention des crises de panique avec ou sans agoraphobie.', N'Ce médicament est contre-indiqué en cas d''allergie au produit.', 97, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'TXISOL22', N'TOUXISOL Vitamine C', N'ALO', N'Tyrothricine + Acide ascorbique (Vitamine C)', N'Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants et chez l''enfant de moins de 6 ans.', 52, 0)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [derniere_etape]) VALUES (N'URIEG6', N'URIREGUL', N'AUM', N'Fosfomycine trométamol', N'Ce médicament est utilisé pour traiter les infections urinaires simples chez la femme de moins de 65 ans.', N'La prise de ce médicament est contre-indiquée en cas d''allergie à  l''un des constituants et d''insuffisance rénale.', 44, 0)
GO
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2002-10-20' AS Date), 4, 5, N'BITALV')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2020-01-01' AS Date), 1, 1, N'3MYC7')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-01' AS Date), 2, 1, N'3MYC7')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 3, 1, N'3MYC7')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-01' AS Date), 5, 1, N'ADIMOL9')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-01' AS Date), 6, 1, N'ADIMOL9')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-01' AS Date), 7, 1, N'ADIMOL9')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'ADIMOL9')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'AMOPIL7')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'AMOX45')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'AMOXIG12')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'APATOUX22')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'BACTIG10')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'BACTIV13')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'BITALV')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'CARTION6')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'CLAZER6')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'DEPRIL9')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'DIMIRTAM6')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'DOLRIL7')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'DORNOM8')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'EQUILARX6')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'EVILR7')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'INSXT5')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'JOVAI8')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'LIDOXY23')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'LITHOR12')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'PARMOL16')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'PHYSOI8')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'PIRIZ8')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'POMDI20')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'TROXT21')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'TXISOL22')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-08' AS Date), 1, 1, N'URIEG6')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-01' AS Date), 7, 1, N'3MYC7')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-01' AS Date), 5, 1, N'3MYC7')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-01' AS Date), 6, 1, N'3MYC7')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-01' AS Date), 8, 1, N'3MYC7')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-01' AS Date), 2, 1, N'ADIMOL9')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-01' AS Date), 3, 1, N'ADIMOL9')
INSERT [dbo].[Workflow] ([dateDecision], [numEtape], [idDecision], [medDepotLegal]) VALUES (CAST(N'2021-12-01' AS Date), 4, 1, N'ADIMOL9')
GO
ALTER TABLE [dbo].[EtapeNormee]  WITH CHECK ADD  CONSTRAINT [FK1] FOREIGN KEY([numEtape])
REFERENCES [dbo].[Etape] ([num])
GO
ALTER TABLE [dbo].[EtapeNormee] CHECK CONSTRAINT [FK1]
GO
ALTER TABLE [dbo].[Historique]  WITH CHECK ADD  CONSTRAINT [fkEtape] FOREIGN KEY([numEtape])
REFERENCES [dbo].[Etape] ([num])
GO
ALTER TABLE [dbo].[Historique] CHECK CONSTRAINT [fkEtape]
GO
/****** Object:  StoredProcedure [dbo].[prc_afficher_med_encoure]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_afficher_med_encoure]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT [GSB_gesAMM].[dbo].[MEDICAMENT].[MED_DEPOTLEGAL], [GSB_gesAMM].[dbo].[MEDICAMENT].[MED_NOMCOMMERCIAL], [GSB_gesAMM].[dbo].[FAMILLE].[FAM_LIBELLE]
	from [GSB_gesAMM].[dbo].[MEDICAMENT]
	inner join FAMILLE on [GSB_gesAMM].[dbo].[FAMILLE].[FAM_CODE] = [GSB_gesAMM].[dbo].[MEDICAMENT].[FAM_CODE]
	where [GSB_gesAMM].[dbo].[MEDICAMENT].[FAM_CODE] = [GSB_gesAMM].[dbo].[FAMILLE].[FAM_CODE]
	and [GSB_gesAMM].[dbo].[MEDICAMENT].[derniere_etape] < 8
END
GO
/****** Object:  StoredProcedure [dbo].[prc_afficherFamille]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_afficherFamille] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

		select * FROM FAMILLE
    -- Insert statements for procedure here
END
GO
/****** Object:  StoredProcedure [dbo].[prc_afficherMedicament]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_afficherMedicament] (@codeFamille varchar(3))
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT *
	FROM MEDICAMENT
	WHERE @codeFamille = FAM_CODE
END
GO
/****** Object:  StoredProcedure [dbo].[prc_ajout_medicament]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_ajout_medicament] (@DepotLegal nvarchar(10), @NomCommercial nvarchar(25), @CodeFamille nvarchar(3), @PrixEchantillion Real, @CompoMed nvarchar(255), @EffetMed nvarchar(255), @ContreIndic nvarchar(255))
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
insert into [GSB_gesAMM].[dbo].[MEDICAMENT]
	Values (@DepotLegal, @NomCommercial, @CodeFamille, @CompoMed, @EffetMed, @ContreIndic, @PrixEchantillion, NULL)
END
GO
/****** Object:  StoredProcedure [dbo].[prc_all_famille]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_all_famille]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select * from [GSB_gesAMM].[dbo].[FAMILLE]
END
GO
/****** Object:  StoredProcedure [dbo].[prc_etape_getByID]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_etape_getByID] (@id integer)
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.Etape WHERE num = @id
END
GO
/****** Object:  StoredProcedure [dbo].[prc_famille_increment]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_famille_increment] (@codeFamille varchar(3))
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE dbo.FAMILLE SET FAM_NBMEDIC = FAM_NBMEDIC + 1 WHERE FAM_CODE = @codeFamille 
END
GO
/****** Object:  StoredProcedure [dbo].[prc_fetch_decisions]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_fetch_decisions]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT * from [GSB_gesAMM].[dbo].[Decision]
END
GO
/****** Object:  StoredProcedure [dbo].[prc_fetch_medicaments]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_fetch_medicaments]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * from [dbo].[MEDICAMENT]
END
GO
/****** Object:  StoredProcedure [dbo].[prc_fetch_workflow]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_fetch_workflow]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT * from [GSB_gesAMM].[dbo].[Workflow]
END
GO
/****** Object:  StoredProcedure [dbo].[prc_getMedicamentByDebot]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_getMedicamentByDebot](@depotLegal varchar(10))
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM dbo.MEDICAMENT
	WHERE MED_DEPOTLEGAL = @depotLegal
END
GO
/****** Object:  StoredProcedure [dbo].[prc_getMedicamentWorkflow]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_getMedicamentWorkflow] (@depotLegal varchar(10))
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT * FROM dbo.Workflow WHERE medDepotLegal = @depotLegal
ORDER BY numEtape
END
GO
/****** Object:  StoredProcedure [dbo].[prc_listeToutesEtapes]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prc_listeToutesEtapes]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- afficher les étapes par ordre alphabétique
--SELECT num, libelle, norme, dateNorme
--FROM EtapeNormee
--INNER JOIN Etape on NumEtape = num
--ORDER BY num ASC
SELECT * FROM dbo.Etape
INNER JOIN dbo.EtapeNormee ON num = numEtape
	
END
GO
/****** Object:  StoredProcedure [dbo].[prc_medicament_getLastEtape]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_medicament_getLastEtape](@depotLegal varchar(10))
AS
BEGIN
	SET NOCOUNT ON;

	SELECT derniere_etape FROM dbo.MEDICAMENT WHERE MED_DEPOTLEGAL = @depotLegal
END
GO
/****** Object:  StoredProcedure [dbo].[prc_medicament_incrementLastEtape]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_medicament_incrementLastEtape](@depotLegal varchar(10))
AS
BEGIN
	UPDATE dbo.MEDICAMENT SET derniere_etape = derniere_etape + 1 WHERE MED_DEPOTLEGAL = @depotLegal
END
GO
/****** Object:  StoredProcedure [dbo].[prc_updateEtapes]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_updateEtapes] (@id integer, @norme varchar(100), @date datetime)
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	UPDATE EtapeNormee
	SET norme = @norme, dateNorme = @date, numEtape = @id
	WHERE numEtape = @id
END
GO
/****** Object:  StoredProcedure [dbo].[prc_updateLastEtape]    Script Date: 11/12/2021 19:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_updateLastEtape](@depotLegal varchar(10), @decision integer, @date datetime, @numEtape integer)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO dbo.Workflow
	VALUES (@date, @numEtape, @decision, @depotLegal)
END
GO
