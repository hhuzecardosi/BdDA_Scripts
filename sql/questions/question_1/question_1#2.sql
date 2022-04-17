-- évolution de la population française au fil des années
-- si dans naissance et dece on prend annee_fin au lieu d'annee on perd les données de 1968
select years_increase.annee, total,augmentation, ((augmentation * 100)::float / total::float) as "augmentation (%)", total_naissances, total_deces
from (
    select annee, total, total - lag(total) over (order by annee ) as augmentation
        from (
            select annee, sum(valeur::integer) as total
            from statistiques s
            where s.indicateur = 'POP'
        group by annee) years_data
) years_increase
join (
    select s1.annee annee, sum(valeur::integer) as total_naissances
    from statistiques s1
    where s1.indicateur = 'NAIS'
    group by s1.annee
) births
on births.annee::integer = years_increase.annee::integer
join (
    select s2.annee annee, sum(valeur::integer) as total_deces
    from statistiques s2
    where s2.indicateur = 'DECE'
    group by s2.annee
) deaths
on deaths.annee::integer = years_increase.annee::integer
group by years_increase.annee, years_increase.total,years_increase.augmentation, births.total_naissances, deaths.total_deces;

