-- Les villes de chaque régions avec la population la plus élevée
-- ne retourne que 17 lignes car mayotte n'a pas de ville dans la db

select c.com, c.libelle, r.ncc region,valeur_max::integer population
from communes c
join departements d using(dep)
join regions r using(reg)
join statistiques s on c.com = s.codgeo 
join indicateurs i on s.indicateur = i.code
inner join
    (select reg, max(valeur) as valeur_max
    from communes c1
    join departements d using(dep)
    join statistiques s on c1.com = s.codgeo 
    join indicateurs i on s.indicateur = i.code 
    where s.annee = 2018
    and i.code = 'POP'
    group by reg) groupe_region_population 
on d.reg = groupe_region_population.reg 
and s.annee = 2018
and i.code = 'POP'
and s.valeur = groupe_region_population.valeur_max
order by groupe_region_population.valeur_max desc;