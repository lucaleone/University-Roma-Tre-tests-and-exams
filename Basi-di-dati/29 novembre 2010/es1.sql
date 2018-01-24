set search_path to "29 novembre 2010";

select  IDProf, Cognome, Nome, facolta
from professori
except
select  professori.IDProf, Cognome, Nome, professori.facolta
from professori, corsi
where professori.facolta <> corsi.facolta and
	professori.idprof = prof