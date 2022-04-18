-- fonctions de triggers
drop function if exists fun_prevent cascade;
drop function if exists fun_call_proc_update_population cascade;

-- triggers
drop trigger if exists trig_prevent_regions on regions;
drop trigger if exists trig_prevent_departements on departements;
drop trigger if exists trig_update_population on statistiques;

-- procédure stockée
drop procedure if exists proc_update_population;

-- vues
drop view if exists vue_infos_regions;
drop view if exists vue_infos_departements;

-- modification des tables
alter table if exists regions
drop if exists population;
alter table if exists departements
drop if exists population;