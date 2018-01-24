set search_path to "esame2013";
--in SQL:  i progetti a cui lavora un solo impiegato, mostrandone il codice

select progetto
from partecip
group by progetto having count(impiegato) = 1