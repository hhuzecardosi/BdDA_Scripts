drop procedure if exists proc_update_population;
drop view if exists vue_infos_regions;
drop view if exists vue_infos_departements;
alter table if exists regions
drop if exists population;
alter table if exists departements
drop if exists population;