drop view if exists vue_infos_departements;
create or replace view vue_infos_departements as
select departement, infos_pop_dep.annee, population, logements,logements_vacants, residences_principale,residences_secondaire, nombre_personne_par_residence_principale, infos_pop_dep.dep
from(
        select annee, sum(valeur::integer) as population, d.ncc departement, d.dep
        from statistiques s
        join communes c on s.codgeo = c.com
        join departements d on d.dep = c.dep
        where s.indicateur = 'POP'
        group by s.annee, departement, d.dep
) infos_pop_dep
join (
        select annee, sum(valeur::integer) as logements, d.dep
        from statistiques s
        join communes c on s.codgeo = c.com
        join departements d on d.dep = c.dep
        where s.indicateur = 'LOG'
        group by s.annee, d.dep
) infos_log_dep
on infos_pop_dep.dep = infos_log_dep.dep and infos_pop_dep.annee = infos_log_dep.annee
join (
        select annee, sum(valeur::integer) as logements_vacants, d.dep
        from statistiques s
        join communes c on s.codgeo = c.com
        join departements d on d.dep = c.dep
        where s.indicateur = 'LOGVAC'
        group by s.annee, d.dep
) infos_logvac_dep
on infos_pop_dep.dep = infos_logvac_dep.dep and infos_pop_dep.annee = infos_logvac_dep.annee
join (
        select annee, avg(valeur) as nombre_personne_par_residence_principale, d.dep
        from statistiques s
        join communes c on s.codgeo = c.com
        join departements d on d.dep = c.dep
        where s.indicateur = 'NPER'
        or s.indicateur = 'PMEN'
        group by s.annee, d.dep
) infos_nper_dep
on infos_pop_dep.dep = infos_nper_dep.dep and infos_pop_dep.annee = infos_nper_dep.annee
join (
        select annee, sum(valeur::integer) as residences_principale, d.dep
        from statistiques s
        join communes c on s.codgeo = c.com
        join departements d on d.dep = c.dep 
        where s.indicateur = 'RP'
        group by s.annee, d.dep
) infos_rp_dep
on infos_pop_dep.dep = infos_rp_dep.dep and infos_pop_dep.annee = infos_rp_dep.annee
join (
        select annee, sum(valeur::integer) as residences_secondaire, d.dep
        from statistiques s
        join communes c on s.codgeo = c.com
        join departements d on d.dep = c.dep
        where s.indicateur = 'RSECOCC'
        group by s.annee, d.dep
) infos_rsecocc_dep
on infos_pop_dep.dep = infos_rsecocc_dep.dep and infos_pop_dep.annee = infos_rsecocc_dep.annee
group by infos_pop_dep.annee, infos_pop_dep.departement, infos_pop_dep.dep, infos_pop_dep.population, infos_log_dep.logements, infos_logvac_dep.logements_vacants, infos_nper_dep.nombre_personne_par_residence_principale, infos_rp_dep.residences_principale, infos_rsecocc_dep.residences_secondaire
order by departement;