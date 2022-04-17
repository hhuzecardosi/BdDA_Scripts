drop procedure if exists update_population;
CREATE PROCEDURE update_population(type integer)
LANGUAGE SQL
AS $$
declare pop = (select population
            from (
                select annee, sum(valeur::integer) as population
                from statistiques s
                join communes c on s.codgeo = c.com
                join departements d on d.dep = c.dep
                join regions r on r.reg = d.reg
                where s.indicateur = 'POP'
                and regions.reg::integer = 1 
            group by annee, r.reg) infos_aquitaine
        group by infos_aquitaine.annee, infos_aquitaine.population );
update regions
set population = pop
set
$$;