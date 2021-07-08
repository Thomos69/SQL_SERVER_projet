-- Voir le nombres d'inscrits par club

select club.nom as 'Nom du club', count(*) as 'Nombre inscrits' from club_adherent, club where ID_club = club.ID group by club.nom ORDER by [Nombre inscrits] ASC


-- Voir le nombres d'employes par club + surface locaux

select club.surface_locaux, club.nom as 'Nom du club', count(*) as 'Nombre employes' from club_employes, club where ID_club = club.ID group by club.nom,club.surface_locaux ORDER by club.surface_locaux ASC

-- Voir le nombres de machines par club

select club.nom as 'Nom du club', count(*) as 'Nombre machines' from club_materiel, club where ID_club = club.ID group by club.nom ORDER by [Nombre machines] ASC

-- Voir le nombres d'achats par options

select options.nom, COUNT(*) as 'Nombre achats' from options, adherents_options where options.ID = ID_options Group by options.nom order by [Nombre achats] ASC