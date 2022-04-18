create or replace procedure proc_update_population()
language plpgsql
as $$
  declare
    pop record;
begin
for pop in (select reg , population from vue_infos_regions vr where annee = 2018) loop

                    update regions
                    set population = pop.population
                    where regions.reg = pop.reg;

                end loop;

for pop in (select dep,population from vue_infos_departements vd where annee = 2018) loop

                    update departements
                    set population = pop.population
                    where departements.dep = pop.dep;

                end loop;
            end;
$$;