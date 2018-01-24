set search_path to "17 novembre 2009";

select sigla, nome, categoria
from prodotti join vendite on sigla = siglaProd 
where quantita>10
