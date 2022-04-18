-- Mettre a jour la population des régions et départements si une statisique de population est mise a jour
create or replace function fun_call_proc_update_population() returns trigger as $pop_update$
begin
    if (TG_OP = 'DELETE' and OLD.indicateur = 'POP') then
        call proc_update_population();
    elsif (TG_OP = 'UPDATE' and NEW.indicateur = 'POP') then
        call proc_update_population();
    elsif (TG_OP = 'INSERT' and NEW.indicateur = 'POP') then
        call proc_update_population();
    end if;
    return NULL;
end; $pop_update$ language plpgsql;

create or replace trigger trig_update_population before insert or update or delete on statistiques
    for each row execute procedure fun_call_proc_update_population();