set search_path to "esame2013";

--creo la relazione impiegati
create table impiegati (
  matricola numeric not null primary key,
  cognome character(20) not null,
  nome character(20) not null,
  eta numeric
 );

--creo la relazione progetti
create table progetti (
  codice character(1) not null primary key,
  titolo character(20) not null,
  costo numeric not null
);

--creo la relazione partecip
create table partecip (
  impiegato numeric(20) not null references impiegati(matricola),
  progetto character(1) not null references progetti(codice),
  primary key (impiegato, progetto)
  );




--popolo la relazione impiegati
insert into impiegati values (101,'Rossi', 'Mario', 35 );
insert into impiegati values (102,'Rossi', 'Luca', 42 );
insert into impiegati values (103,'Neri', 'Mario', 34 );
insert into impiegati values (104,'Verdi', 'Gino', 45 );

--popolo la relazione progetti
insert into progetti values ('A', 'Luca',70);
insert into progetti values ('B', 'Marte',90);
insert into progetti values ('C', 'Giove',90);
insert into progetti values ('D', 'Venere',90);

--popolo la relazione partecip
insert into partecip values (101, 'A');
insert into partecip values (101, 'B');
insert into partecip values (102, 'A');
insert into partecip values (103, 'B');
insert into partecip values (103, 'D');


