-- Jointure entre 2 petites tables card(18:18)
explain select * from regions
join regions_cheflieu using(reg)
where regions.ncc LIKE '%BRETA%'
order by reg;