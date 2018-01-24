set search_path to "25 novembre 2008";

select codiceprod,sum(incasso) as incassoComplessivo
from vendite
group by codiceprod
order by codiceprod