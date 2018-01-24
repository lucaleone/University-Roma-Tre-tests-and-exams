set search_path to "25 novembre 2008";

--creo la relazione prodotti
create table prodotti (
  codice numeric not null primary key,
  nome character(1) not null,
  categoria character(20) not null
 );
 
--creo la relazione vendite
create table vendite (
  codiceprod numeric not null references prodotti(codice),
  datavend date not null,
  incasso numeric not null
  );

--popolo la relazione prodotti
insert into prodotti values (101, 'A', 'Bevanda');
insert into prodotti values (102, 'B', 'Bevanda');
insert into prodotti values (103, 'C', 'Pasta');
insert into prodotti values (104, 'D', 'Biscotti');

--popolo la relazione vendite
insert into vendite values (101,'2008-11-24', 2000);
insert into vendite values (101, '2008-11-25', 1000);
insert into vendite values (102, '2008-11-23', 2500);
insert into vendite values (102, '2008-11-24', 4000);
insert into vendite values (103, '2008-11-25', 1320);

