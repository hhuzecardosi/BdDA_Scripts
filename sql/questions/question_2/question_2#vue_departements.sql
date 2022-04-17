create or replace view vue_infos_departements as
                select annee, sum(valeur::integer) as population, d.ncc departement, d.dep
                from statistiques s
                join communes c on s.codgeo = c.com
                join departements d on d.dep = c.dep
                where s.indicateur = 'POP'
        group by annee, departement, d.dep;