set search_path to "17 novembre 2009";

create view mediaProdotti as  (
select Sigla, nome, avg(quantita) as media
from prodotti join vendite on sigla = siglaprod
group by  Sigla
order by Sigla
);

select Datavend, SiglaProd
from vendite, mediaProdotti
where SiglaProd = sigla and
	quantita < media 
