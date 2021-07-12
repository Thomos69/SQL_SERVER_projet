-- Voir le nombres d'inscrits par club

CREATE view nb_inscrits_par_club
AS
select club.nom as 'Nom du club', count(*) as "Nombre d'inscrits" from club_adherent, club where ID_club = club.ID group by club.nom ORDER by [Nombre d'inscrits] DESC OFFSET 0 ROWS;
GO


-- Voir le nombres d'employes par club

CREATE view nb_employes_par_club
AS
select club.nom as 'Nom du club', count(*) as "Nombre d'employes" from club_employes, club where ID_club = club.ID group by club.nom ORDER by [Nombre d'employes] DESC OFFSET 0 ROWS;
GO
-- Voir le nombres de machines par club

CREATE view nb_machines_par_club
AS
select club.nom as 'Nom du club', count(*) as 'Nombre machines' from club_materiel, club where ID_club = club.ID group by club.nom ORDER by [Nombre machines] DESC OFFSET 0 ROWS;
GO

-- Voir le nombres d'achats par options

CREATE view nb_achats_options
AS
select options.nom as "Nom de l'option", COUNT(*) as "Nombre d'achats" from options, adherents_options where options.ID = ID_options Group by options.nom order by [Nombre d'achats] DESC OFFSET 0 ROWS;
Go

-- Voir la surface de chaque locaux

CREATE view surface_club_locaux
AS
select club.nom as 'Nom du club', club.surface_locaux as 'Surface des locaux ( m² )' from club ORDER by [Surface des locaux ( m² )] DESC OFFSET 0 ROWS;
GO

-- Moyennes des notes des différents clubs

CREATE view moyenne_note_club
AS
select club.nom as 'Nom du Club', CAST(AVG(note) as decimal(2,1)) as 'Moyenne des notes' from club_adherent, club where club.ID = ID_club GROUP BY club.nom ORDER BY [Moyenne des notes] DESC OFFSET 0 ROWS;
GO

-- Nombre de personne autorisée par salle 

CREATE view nb_personne_covid
AS
select club.nom as 'Nom du Club', [Nombre de personnes autorisées] from club CROSS APPLY get_nb_personne_max_covid(club.nom) ORDER by [Nombre de personnes autorisées] DESC OFFSET 0 ROWS;
GO


-- Prix payé en fonction des adhérents

CREATE view prix_par_adherent
AS
select CONCAT(adherents.nom, ' ',adherents.prenom) as 'Nom Prenom', SUM(options.prix) as 'Prix total', COUNT(options.prix) as "Nombre d'options achetées"
from options, adherents, adherents_options 
where adherents.ID = ID_adherents and options.ID = ID_options 
GROUP BY CONCAT(adherents.nom, ' ',adherents.prenom)
ORDER BY [Prix total] DESC OFFSET 0 ROWS
GO
