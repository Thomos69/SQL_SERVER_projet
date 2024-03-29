-- Voir le nombres d'inscrits par club

--DBCC CHECKIDENT ('club_employes', RESEED, 0);
--GO



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
select club.nom as 'Nom du club', club.surface_locaux as 'Surface des locaux ( m� )' from club ORDER by [Surface des locaux ( m� )] DESC OFFSET 0 ROWS;
GO

-- Moyennes des notes des diff�rents clubs

CREATE view moyenne_note_club
AS
select club.nom as 'Nom du Club', CAST(AVG(note) as decimal(2,1)) as 'Moyenne des notes' from club_adherent, club where club.ID = ID_club GROUP BY club.nom ORDER BY [Moyenne des notes] DESC OFFSET 0 ROWS;
GO

-- Nombre de personne autoris�e par salle 

CREATE view nb_personne_covid
AS
select club.nom as 'Nom du Club', [Nombre de personnes autoris�es] from club CROSS APPLY get_nb_personne_max_covid(club.ID) ORDER by [Nombre de personnes autoris�es] DESC OFFSET 0 ROWS;
GO


-- Prix pay� en fonction des adh�rents

CREATE view prix_par_adherent
AS
select CONCAT(adherents.nom, ' ',adherents.prenom) as 'Nom Prenom', SUM(options.prix) as 'Prix total', COUNT(options.prix) as "Nombre d'options achet�es"
from options, adherents, adherents_options 
where adherents.ID = ID_adherents and options.ID = ID_options 
GROUP BY CONCAT(adherents.nom, ' ',adherents.prenom)
ORDER BY [Prix total] DESC OFFSET 0 ROWS
GO


-- Moyenne des prix pay� par club

--select club.nom, avg("Prix total") as "Prix total"
--from club, adherents, club_adherent, prix_par_adherent
--where club.ID = ID_club and adherents.ID = ID_adherent and prix_par_adherent.[Nom Prenom] = CONCAT(adherents.nom, ' ',adherents.prenom)
--group by club.nom
--order by [Prix total] DESC

CREATE view prix_moyen_paye_par_adherent
AS
select club.nom, CAST(AVG("Prix total") as DECIMAL(4,2)) as "Prix moyen"
from club, club_adherent, adherents CROSS APPLY get_prix_paye_par_adherent(adherents.ID)
where club.ID = ID_club and adherents.ID = ID_adherent
GROUP BY club.nom
ORDER BY "Prix moyen" DESC OFFSET 0 ROWS;
GO


-- Comptabilit�

CREATE view infos_comptabilite
AS
select club.nom as 'Nom du Club', club.loyer as 'Prix du loyer', prestation.prix_mensuel as 'Prix prestation entretien',[Salaires a payer],[Charges mensuelles] as 'Charges mensuelles totales',[Chiffre d'affaire],([Chiffre d'affaire] - [Charges mensuelles]) as "B�nefice mensuel"
from club, prestation, club_prestation CROSS APPLY get_charges_mensuelle(ID_club) CROSS APPLY get_chiffre_affaire_club(ID_club) CROSS APPLY get_salaire_a_payer_par_club(ID_club)
where club.ID = ID_club
and prestation.ID = ID_prestation
order by "B�nefice mensuel" DESC OFFSET 0 ROWS;
GO


-- Nombre personnes dans la salle 

CREATE view personne_dans_la_salle
AS
select get_nb_personne_dans_salle.*, ([Nombre de personnes autoris�es] - [Personne dans la salle]) as 'Places disponibles', [Nombre de personnes autoris�es] as 'Nombre de place maximum'
from club CROSS APPLY get_nb_personne_dans_salle(club.ID) CROSS APPLY get_nb_personne_max_covid(club.ID)
order by [Personne dans la salle] DESC OFFSET 0 ROWS;
GO