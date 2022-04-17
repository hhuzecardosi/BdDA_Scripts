alter table if exists regions
drop population;
alter table if exists departements
drop population;
drop procedure if exists proc_update_population;
drop view if exists vue_infos_regions;
drop view if exists vue_infos_departements;
