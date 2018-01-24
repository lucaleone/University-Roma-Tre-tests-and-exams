set search_path to "esame2013";
--in SQL:  i progetti a cui lavora un solo impiegato, mostrandone il codice
create view imp1prog as 
select impiegato, progetto
from partecip 
where progetto <> all(
select  p1.progetto
from partecip as p1, partecip as p2 
where p1.progetto = P2.progetto and
	p1.impiegato<>p2.impiegato);

select progetto, cognome
from imp1prog, impiegati
where imp1prog.impiegato= impiegati.matricola