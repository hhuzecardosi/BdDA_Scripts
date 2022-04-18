-- Jointure entre la plus petite table et la plus grande card(10:~2M)
-- La cardinalité de statisiques dépend des années importées, lors de ce test toutes les années sont importées et la table a une cardinalité de 2.446.361
explain select * 
from statistiques
join indicateurs on indicateurs.code = statistiques.indicateur;