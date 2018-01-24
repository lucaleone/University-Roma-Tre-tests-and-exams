set search_path to "25 novembre 2008";

CREATE OR REPLACE VIEW maxincassiperprod as (
SELECT vendite.codiceprod,
    max(vendite.incasso) AS maxincasso
   FROM vendite
  GROUP BY vendite.codiceprod);

select v.datavend, MaxIncasso
from vendite v join maxIncassiPerProd m on v.codiceprod = m.codiceprod
where incasso = MaxIncasso