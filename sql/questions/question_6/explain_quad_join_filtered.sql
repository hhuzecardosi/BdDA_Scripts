explain select * 
from communes
join departements using(dep)
join regions using(reg)
join statistiques on statistiques.codgeo = communes.com
where communes.ncc LIKE 'B%';