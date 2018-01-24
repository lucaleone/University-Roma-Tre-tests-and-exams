set search_path to "17 novembre 2009";


select Sigla, nome, avg(quantita)
from prodotti join vendite on sigla = siglaprod
group by  Sigla
order by Sigla