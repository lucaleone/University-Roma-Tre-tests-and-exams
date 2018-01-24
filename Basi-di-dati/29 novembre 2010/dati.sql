set search_path to "29 novembre 2010";

--creo la relazione professori
create table professori (
  IDProf character(20) not null primary key,
  cognome character(20) not null,
  nome character(20) not null,
  facolta character(3) not null
 );


--creo la relazione corsi
create table corsi (
  IDProf character(20) not null primary key,
  facolta character(3) not null,
  prof character(20) not null references professori(IDProf),
  crediti numeric not null
  );


--popolo la relazione professori
insert into professori values ('P001', 'Da Vinci','Leonardo', 'ING' );
insert into professori values ('P002', 'Galilei','Galileo', 'SCI' );
insert into professori values ('P003', 'Newton','Isacco', 'SCI' );

--popolo la relazione corsi
insert into corsi values ('C001', 'ING', 'P001', 5);
insert into corsi values ('C002', 'ING', 'P002', 6);
insert into corsi values ('C003', 'SCI', 'P002', 5);
insert into corsi values ('C004', 'SCI', 'P003', 9);
insert into corsi values ('C005', 'SCI', 'P003', 5);