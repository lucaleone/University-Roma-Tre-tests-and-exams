set search_path to "29 novembre 2010";



select  professori.IDProf, Cognome, Nome, professori.facolta, sum(crediti)
from professori, corsi
where	professori.idprof = prof
group by professori.IDProf