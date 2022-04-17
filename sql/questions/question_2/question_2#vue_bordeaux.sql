create or replace view vue_infos_bordeaux as
        select annee, population, naissances, deces
        from (
            select annee, valeur::integer as population
            from statistiques s
            join communes c on s.codgeo = c.com
            where s.indicateur = 'POP'
            and c.ncc = 'BORDEAUX'
        group by annee, s.valeur) infos_aquitaine_population
        join (
            select annee annee_naissances, valeur::integer as naissances
            from statistiques s
            join communes c on s.codgeo = c.com
            where s.indicateur = 'NAIS'
            and c.ncc = 'BORDEAUX'
        group by annee_naissances, s.valeur) infos_aquitaine_naissances
        on infos_aquitaine_population.annee = infos_aquitaine_naissances.annee_naissances
        join (
            select annee annee_deces, valeur::integer as deces
            from statistiques s
            join communes c on s.codgeo = c.com
            where s.indicateur = 'DECE'
            and c.ncc = 'BORDEAUX'
        group by annee_deces, s.valeur) infos_aquitaine_deces
        on infos_aquitaine_population.annee = infos_aquitaine_deces.annee_deces
        group by infos_aquitaine_population.annee, infos_aquitaine_population.population, infos_aquitaine_naissances.naissances, infos_aquitaine_deces.deces;