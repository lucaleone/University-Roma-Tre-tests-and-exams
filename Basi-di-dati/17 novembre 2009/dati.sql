set search_path to "17 novembre 2009";

--creo la relazione prodotti
create table prodotti (
  sigla numeric not null primary key,
  nome character(1) not null,
  categoria character(20) not null
 );
 
--creo la relazione vendite
create table vendite (
  siglaProd numeric not null references prodotti(sigla),
  datavend date not null,
  quantita numeric not null
  );

--popolo la relazione prodotti
insert into prodotti values (101, 'A', 'Pasta');
insert into prodotti values (102, 'B', 'Bevanda');

--popolo la relazione vendite
insert into vendite values (101,'2009-11-13', 10);
insert into vendite values (101, '2009-11-14', 30);
insert into vendite values (102, '2009-11-13', 25);
insert into vendite values (102, '2009-11-14', 35);
	--per es 4.2
insert into vendite values (101,'2009-11-18', 0);
insert into vendite values (102, '2009-11-18', 0);
insert into vendite values (101, '2009-12-25', 0);
insert into vendite values (102, '2009-12-25', 0);

