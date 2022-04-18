-- Empêcher la mise a jour des tables régions et départements
create or replace function fun_prevent() returns trigger as $prevent$
    begin
        RAISE EXCEPTION
            '% on % is not allowed.',
            TG_OP, TG_TABLE_NAME;
    end;
    return NULL;
$prevent$ language plpgsql;


create or replace trigger trig_prevent_regions before insert or update or delete on regions
    for each statement execute procedure fun_prevent();


create or replace trigger trig_prevent_departements before insert or update or delete on departements
    for each statement execute procedure fun_prevent();