create or replace view vue_infos_regions as
            select annee, sum(valeur::integer) as population, r.libelle region, r.reg
                from statistiques s
                join communes c on s.codgeo = c.com
                join departements d on d.dep = c.dep
                join regions r on r.reg = d.reg
                where s.indicateur = 'POP'
        group by annee, region, r.reg;