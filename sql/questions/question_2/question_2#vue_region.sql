drop view if exists vue_infos_regions;
create or replace view vue_infos_regions as
select region, infos_pop_reg.annee, population, logements,logements_vacants, residences_principale,residences_secondaire, nombre_personne_par_residence_principale, infos_pop_reg.reg
from(
        select annee, sum(valeur::integer) as population, r.libelle region, r.reg
        from statistiques s
        join communes c on s.codgeo = c.com
        join departements d on d.dep = c.dep
        join regions r on r.reg = d.reg
        where s.indicateur = 'POP'
        group by s.annee, region, r.reg
) infos_pop_reg
join (
        select annee, sum(valeur::integer) as logements, r.reg
        from statistiques s
        join communes c on s.codgeo = c.com
        join departements d on d.dep = c.dep
        join regions r on r.reg = d.reg
        where s.indicateur = 'LOG'
        group by s.annee, r.reg
) infos_log_reg
on infos_pop_reg.reg = infos_log_reg.reg and infos_pop_reg.annee = infos_log_reg.annee
join (
        select annee, sum(valeur::integer) as logements_vacants, r.reg
        from statistiques s
        join communes c on s.codgeo = c.com
        join departements d on d.dep = c.dep
        join regions r on r.reg = d.reg
        where s.indicateur = 'LOGVAC'
        group by s.annee, r.reg
) infos_logvac_reg
on infos_pop_reg.reg = infos_logvac_reg.reg and infos_pop_reg.annee = infos_logvac_reg.annee
join (
        select annee, avg(valeur) as nombre_personne_par_residence_principale, r.reg
        from statistiques s
        join communes c on s.codgeo = c.com
        join departements d on d.dep = c.dep
        join regions r on r.reg = d.reg
        where s.indicateur = 'NPER'
        or s.indicateur = 'PMEN'
        group by s.annee, r.reg
) infos_nper_reg
on infos_pop_reg.reg = infos_nper_reg.reg and infos_pop_reg.annee = infos_nper_reg.annee
join (
        select annee, sum(valeur::integer) as residences_principale, r.reg
        from statistiques s
        join communes c on s.codgeo = c.com
        join departements d on d.dep = c.dep 
        join regions r on r.reg = d.reg
        where s.indicateur = 'RP'
        group by s.annee, r.reg
) infos_rp_reg
on infos_pop_reg.reg = infos_rp_reg.reg and infos_pop_reg.annee = infos_rp_reg.annee
join (
        select annee, sum(valeur::integer) as residences_secondaire, r.reg
        from statistiques s
        join communes c on s.codgeo = c.com
        join departements d on d.dep = c.dep
        join regions r on r.reg = d.reg
        where s.indicateur = 'RSECOCC'
        group by s.annee, r.reg
) infos_rsecocc_reg
on infos_pop_reg.reg = infos_rsecocc_reg.reg and infos_pop_reg.annee = infos_rsecocc_reg.annee
group by infos_pop_reg.annee, infos_pop_reg.region, infos_pop_reg.reg, infos_pop_reg.population, infos_log_reg.logements, infos_logvac_reg.logements_vacants, infos_nper_reg.nombre_personne_par_residence_principale, infos_rp_reg.residences_principale, infos_rsecocc_reg.residences_secondaire
order by region;