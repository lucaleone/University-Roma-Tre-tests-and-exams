set search_path to "25 novembre 2008";

select categoria, datavend, sum(incasso) as incassoComplessivo
from prodotti p join vendite v on codice = codiceprod
group by categoria, datavend