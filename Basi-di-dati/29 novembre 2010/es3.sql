set search_path to "29 novembre 2010";


create view SommaCreidiProfessori as
(select  professori.IDProf, Cognome, Nome, professori.facolta, sum(crediti) as sommaCrediti 
from professori, corsi 
where professori.idprof = prof group by professori.IDProf);



select professori.idprof, professori.cognome, sum(crediti), SommaCreidiProfessori.sommaCrediti
from professori, corsi, SommaCreidiProfessori
where professori.facolta = corsi.facolta and
	professori.idprof = corsi.prof and	
	professori.idprof = SommaCreidiProfessori.IDProf
	group by professori.idprof, SommaCreidiProfessori.sommacrediti