create or replace view vue_infos_nouvelle_aquitaine as
        select annee, population
            from (
                select annee, sum(valeur::integer) as population
                from statistiques s
                join communes c on s.codgeo = c.com
                join departements d on d.dep = c.dep
                join regions r on r.reg = d.reg
                where s.indicateur = 'POP'
                and r.reg::integer = 75
            group by annee) infos_aquitaine
        group by infos_aquitaine.annee, infos_aquitaine.population;