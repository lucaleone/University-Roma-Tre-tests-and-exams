set search_path to "22 settembre 2014";

create or replace view PrezzoMaxMolecole as 
select f.molecola, max(prezzo) prezzoMax
from farmaci f
group by f.molecola;

select f.nomeFarmaco, f.molecola, p.nome, pMax.prezzoMax
from farmaci f,  PrezzoMaxMolecole pMax, produttori p
where f.prezzo = pMax.prezzoMax and 
	f.molecola = pmax.molecola and
	f.produttore = p.codProduttore