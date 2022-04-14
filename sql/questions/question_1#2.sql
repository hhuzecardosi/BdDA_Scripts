-- évolution de la population française au fil des années

select annee, total,augmentation, ((augmentation * 100)::float / total::float) as "augmentation (%)"
from (
    select annee, total, total - lag(total) over (order by annee ) as augmentation
        from (
            select annee, sum(valeur::integer) as total
            from statistiques s
            where s.indicateur = 'POP'
        group by annee) years_data
) years_increase
group by years_increase.annee, years_increase.total,years_increase.augmentation;

