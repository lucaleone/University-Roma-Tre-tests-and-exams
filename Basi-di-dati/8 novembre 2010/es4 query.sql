set search_path to "esame2013";
--in SQL: le eta' degli impiegati che lavorano al progetto Marte

select eta
from impiegati, partecip, progetti
where progetti.titolo ='Marte' and
	impiegati.matricola = partecip.impiegato and
	partecip.progetto = progetti.codice