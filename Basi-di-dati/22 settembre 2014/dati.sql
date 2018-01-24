set search_path to "22 settembre 2014";

--creo la relazione produttori
create table produttori (
  codProduttore numeric not null primary key,
  nome character(20) not null,
  nazione character(20) not null
  );
--creo la relazione molecole
create table molecole (
  ID character(10) not null primary key,
  nomeMolecola character(20) not null,
  Categoria character(20) not null
  );
  
  --creo la relazione farmaci
create table farmaci (
  codice numeric not null primary key,
  nomeFarmaco character(20) not null,
  molecola character(10) not null references Molecole(id),
  produttore numeric not null references produttori(codProduttore),
  prezzo numeric not null
 );
  
--popolo la relazione produttori
insert into produttori values (1, 'marco', 'italia');
insert into produttori values (2, 'giovanni', 'francia');
insert into produttori values (3, 'franco', 'spagna');
insert into produttori values (4, 'titto', 'germania');

--popolo la relazione molecole
insert into molecole values ('h2o', 'acqua', 'liquido');
insert into molecole values ('h2o2', 'acqua ossigenata', 'liquido');
insert into molecole values ('co2', 'anidride carbonica', 'gas');
insert into molecole values ('h2', 'idrogeno', 'gas');
insert into molecole values ('nacr', 'sale', 'solido');
insert into molecole values ('c6', 'diamante ', 'solido');

--popolo la relazione vendite
insert into farmaci values (01,'tachipirina', 'h2o', 1, 14);
insert into farmaci values (02,'farmaco2', 'nacr', 1, 52);
insert into farmaci values (03,'farmaco3', 'c6', 1, 7);
insert into farmaci values (04,'tachipirina', 'h2o', 4, 33);
insert into farmaci values (05,'farmaco2', 'nacr', 4, 14);
insert into farmaci values (06,'farmaco6', 'nacr', 3, 20);
insert into farmaci values (07,'farmaco7', 'c6', 3, 11);
insert into farmaci values (08,'farmaco8', 'co2', 2, 85);
insert into farmaci values (09,'farmaco9', 'c6', 2, 52);


