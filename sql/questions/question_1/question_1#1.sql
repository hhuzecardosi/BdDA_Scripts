-- les 10 villes les plus peuplées de France
select c.libelle, valeur::integer
from communes c 
join statistiques s on s.codgeo = c.com 
join indicateurs i on s.indicateur = i.code 
where i.code = 'POP'
and annee = 2018
order by valeur desc
limit 10;