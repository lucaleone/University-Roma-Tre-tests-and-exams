set search_path to "22 settembre 2014";

select f.nomeFarmaco, m.nomeMolecola
from farmaci f , molecole m, produttori p
where f.molecola = m.ID and
f.produttore = p.codProduttore and 
p.nazione='italia'