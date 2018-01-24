set search_path to "22 settembre 2014";

select f1.nomeFarmaco, f1.produttore
from farmaci f1, farmaci f2
   except
      select f1.nomeFarmaco, f1.produttore
      from farmaci f1, farmaci f2
      where f1.produttore <> f2.produttore and
	    f1.molecola = f2.molecola and
	    f1.nomeFarmaco = f2.nomeFarmaco