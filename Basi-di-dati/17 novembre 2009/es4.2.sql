set search_path to "17 novembre 2009";

select distinct v1.datavend
from vendite as v1, vendite as v2
where v1.datavend = v2.datavend and
	v1.siglaprod <> v2.siglaprod and
	v1.quantita = v2.quantita and
	v1.quantita =0