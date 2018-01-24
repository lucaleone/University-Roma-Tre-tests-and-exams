set search_path to "17 novembre 2009";

create view mediaProdotti as  (
select Sigla, nome, avg(quantita) as media
from prodotti join vendite on sigla = siglaprod
group by  Sigla
order by Sigla
);

create view prodinferiori as  (
select Datavend, SiglaProd
from vendite, mediaProdotti
where SiglaProd = sigla and
	quantita < media 
);

select count (siglaprod), Datavend
from prodinferiori
group by Datavend