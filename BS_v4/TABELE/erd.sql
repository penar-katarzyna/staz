CREATE TABLE typ_siatki (
  id NUMERIC   NOT NULL ,
  nazwa VARCHAR(255)   NOT NULL ,
  bool1 VARCHAR(255)    ,
  bool2 VARCHAR(255)    ,
  num1 VARCHAR(255)    ,
  num2 VARCHAR(255)    ,
  dec1 VARCHAR(255)    ,
  dec2 VARCHAR(255)    ,
  time1 VARCHAR(255)    ,
  time2 VARCHAR(255)    ,
  interval1 VARCHAR(255)    ,
  interval2 VARCHAR(255)    ,
  string1 VARCHAR(255)    ,
  string2 VARCHAR(255)      ,
PRIMARY KEY(id));


CREATE TABLE kara (
  id NUMERIC   NOT NULL ,
  nazwa VARCHAR(255)    ,
  kwota NUMBER(19,4)      ,
PRIMARY KEY(id));


CREATE TABLE typ_urzadzenia (
  id NUMERIC   NOT NULL ,
  nazwa VARCHAR(255)   NOT NULL   ,
PRIMARY KEY(id));


CREATE TABLE odsetki (
  id NUMERIC   NOT NULL ,
  nazwa VARCHAR(255)    ,
  procent NUMBER(19,4)      ,
PRIMARY KEY(id));


CREATE TABLE prefix (
  id NUMERIC   NOT NULL ,
  prefix VARCHAR(255)   NOT NULL   ,
PRIMARY KEY(id));


CREATE TABLE strefa (
  id NUMERIC   NOT NULL ,
  nazwa VARCHAR(255)   NOT NULL   ,
PRIMARY KEY(id));


CREATE TABLE stawka (
  id NUMERIC   NOT NULL ,
  nazwa VARCHAR(255)   NOT NULL   ,
PRIMARY KEY(id));


CREATE TABLE jednostka (
  id NUMERIC   NOT NULL ,
  nazwa VARCHAR(255)      ,
PRIMARY KEY(id));


CREATE TABLE taryfa (
  id NUMERIC   NOT NULL ,
  nazwa VARCHAR(255)   NOT NULL ,
  data_od TIMESTAMP   NOT NULL ,
  data_do TIMESTAMP      ,
PRIMARY KEY(id));


CREATE TABLE siatka (
  id NUMERIC   NOT NULL ,
  siatka__id NUMERIC   NOT NULL ,
  typ_siatki__id NUMERIC   NOT NULL ,
  bool1 NUMBER(1)    ,
  bool2 NUMBER(1)    ,
  num1 NUMERIC    ,
  num2 NUMERIC    ,
  dec1 NUMBER(19,4)    ,
  dec2 NUMBER(19,4)    ,
  time1 TIMESTAMP    ,
  time2 TIMESTAMP    ,
  interval1 INTERVAL DAY TO SECOND    ,
  interval2 INTERVAL DAY TO SECOND    ,
  string1 VARCHAR(255)    ,
  string2 VARCHAR(255)      ,
PRIMARY KEY(id),
  FOREIGN KEY(typ_siatki__id)
    REFERENCES typ_siatki(id),
  FOREIGN KEY(siatka__id)
    REFERENCES siatka(id));


CREATE TABLE reguly (
  id NUMERIC   NOT NULL ,
  siatka__id NUMERIC   NOT NULL ,
  nazwa VARCHAR(255)    ,
  a_post NUMBER(1)    ,
  post VARCHAR2(4000)    ,
  a_pre NUMBER(1)    ,
  pre VARCHAR2(4000)    ,
  pomin NUMBER(1)      ,
PRIMARY KEY(id),
  FOREIGN KEY(siatka__id)
    REFERENCES siatka(id));


CREATE TABLE typ_zdarzenia (
  id NUMERIC   NOT NULL ,
  reguly__id NUMERIC    ,
  nazwa VARCHAR(255)   NOT NULL   ,
PRIMARY KEY(id),
  FOREIGN KEY(reguly__id)
    REFERENCES reguly(id));


CREATE TABLE kraj (
  id NUMERIC   NOT NULL ,
  prefix__id NUMERIC   NOT NULL ,
  nazwa VARCHAR(255)    ,
  waluta VARCHAR(255)    ,
  data_od TIMESTAMP   NOT NULL ,
  data_do TIMESTAMP      ,
PRIMARY KEY(id),
  FOREIGN KEY(prefix__id)
    REFERENCES prefix(id));


CREATE TABLE wymiana (
  id NUMERIC   NOT NULL ,
  jednostka__id NUMERIC   NOT NULL ,
  wartosc1 NUMERIC    ,
  wartosc2 NUMERIC    ,
  data_od TIMESTAMP    ,
  data_do TIMESTAMP      ,
PRIMARY KEY(id),
  FOREIGN KEY(jednostka__id)
    REFERENCES jednostka(id),
  FOREIGN KEY(jednostka__id)
    REFERENCES jednostka(id));


CREATE TABLE umowa (
  id NUMERIC   NOT NULL ,
  kara__id NUMERIC   NOT NULL ,
  odsetki__id NUMERIC   NOT NULL ,
  data_od TIMESTAMP    ,
  data_do TIMESTAMP    ,
  numer VARCHAR(255)    ,
  odnawialna NUMBER(1)      ,
PRIMARY KEY(id),
  FOREIGN KEY(odsetki__id)
    REFERENCES odsetki(id),
  FOREIGN KEY(kara__id)
    REFERENCES kara(id));


CREATE TABLE identyfikator (
  id NUMERIC   NOT NULL ,
  typ_urzadzenia__id NUMERIC   NOT NULL ,
  prefix__id NUMERIC   NOT NULL ,
  numer VARCHAR(255)   NOT NULL ,
  aktywny NUMBER(1)   NOT NULL   ,
PRIMARY KEY(id),
  FOREIGN KEY(prefix__id)
    REFERENCES prefix(id),
  FOREIGN KEY(typ_urzadzenia__id)
    REFERENCES typ_urzadzenia(id));


CREATE TABLE kraj_kraj (
  id NUMERIC   NOT NULL ,
  strefa__id NUMERIC   NOT NULL ,
  prefix__id NUMERIC   NOT NULL   ,
PRIMARY KEY(id),
  FOREIGN KEY(prefix__id)
    REFERENCES prefix(id),
  FOREIGN KEY(strefa__id)
    REFERENCES strefa(id));


CREATE TABLE szablon_faktury (
  id NUMERIC   NOT NULL ,
  reguly__id NUMERIC    ,
  kraj__id NUMERIC   NOT NULL ,
  nazwa VARCHAR(255)    ,
  naglowek VARCHAR(255)    ,
  tresc VARCHAR(255)    ,
  stopka VARCHAR(255)    ,
  podpis VARCHAR(255)    ,
  typ_klienta NUMBER(1)   NOT NULL ,
  sprzedawca VARCHAR(255)    ,
  odbiorca VARCHAR(255)    ,
  tabela_bilingowa VARCHAR(255)    ,
  podsumowanie VARCHAR(255)    ,
  zbiorcza VARCHAR(255)    ,
  termin_platnosci VARCHAR(255)    ,
  layout VARCHAR(4000)      ,
PRIMARY KEY(id),
  FOREIGN KEY(kraj__id)
    REFERENCES kraj(id),
  FOREIGN KEY(reguly__id)
    REFERENCES reguly(id));


CREATE TABLE skalowanie (
  id NUMERIC   NOT NULL ,
  jednostka__id NUMERIC   NOT NULL ,
  wartosc1 NUMERIC    ,
  wartosc2 NUMERIC      ,
PRIMARY KEY(id),
  FOREIGN KEY(jednostka__id)
    REFERENCES jednostka(id),
  FOREIGN KEY(jednostka__id)
    REFERENCES jednostka(id));


CREATE TABLE usluga (
  id NUMERIC   NOT NULL ,
  reguly__id NUMERIC    ,
  typ_zdarzenia__id NUMERIC    ,
  wymiana__id NUMERIC    ,
  nazwa VARCHAR(255)   NOT NULL ,
  ilosc NUMERIC    ,
  aktywna NUMBER(1)   NOT NULL ,
  data_od TIMESTAMP   NOT NULL ,
  data_do TIMESTAMP    ,
  cena NUMBER(19,4)    ,
  numer NUMERIC    ,
  mnoznik NUMBER(19,4)    ,
  okres_dni INTERVAL DAY TO SECOND    ,
  waznosc_dni INTERVAL DAY TO SECOND    ,
  okres_miesiecy INTERVAL YEAR TO MONTH    ,
  waznosc_miesiecy INTERVAL YEAR TO MONTH    ,
  priorytet NUMERIC      ,
PRIMARY KEY(id),
  FOREIGN KEY(wymiana__id)
    REFERENCES wymiana(id),
  FOREIGN KEY(typ_zdarzenia__id)
    REFERENCES typ_zdarzenia(id),
  FOREIGN KEY(reguly__id)
    REFERENCES reguly(id));


CREATE TABLE cennik_miedzynarodowy (
  id NUMERIC   NOT NULL ,
  kraj__id NUMERIC   NOT NULL ,
  stawka__id NUMERIC   NOT NULL ,
  typ_zdarzenia__id NUMERIC   NOT NULL ,
  jednostka__id NUMERIC   NOT NULL ,
  kraj_kraj__id NUMERIC   NOT NULL ,
  cena NUMBER(19,4)    ,
  data_od TIMESTAMP    ,
  data_do TIMESTAMP      ,
PRIMARY KEY(id),
  FOREIGN KEY(kraj_kraj__id)
    REFERENCES kraj_kraj(id),
  FOREIGN KEY(jednostka__id)
    REFERENCES jednostka(id),
  FOREIGN KEY(typ_zdarzenia__id)
    REFERENCES typ_zdarzenia(id),
  FOREIGN KEY(stawka__id)
    REFERENCES stawka(id),
  FOREIGN KEY(kraj__id)
    REFERENCES kraj(id));


CREATE TABLE region (
  id NUMERIC   NOT NULL ,
  kraj__id NUMERIC   NOT NULL ,
  nazwa VARCHAR(255)      ,
PRIMARY KEY(id),
  FOREIGN KEY(kraj__id)
    REFERENCES kraj(id));


CREATE TABLE miasto (
  id NUMERIC   NOT NULL ,
  region__id NUMERIC   NOT NULL ,
  nazwa VARCHAR(255)      ,
PRIMARY KEY(id),
  FOREIGN KEY(region__id)
    REFERENCES region(id));


CREATE TABLE taryfa_usluga (
  id NUMERIC   NOT NULL ,
  usluga__id NUMERIC   NOT NULL ,
  taryfa__id NUMERIC   NOT NULL ,
  data_od TIMESTAMP    ,
  data_do TIMESTAMP      ,
PRIMARY KEY(id),
  FOREIGN KEY(taryfa__id)
    REFERENCES taryfa(id),
  FOREIGN KEY(usluga__id)
    REFERENCES usluga(id));


CREATE TABLE kod (
  id NUMERIC   NOT NULL ,
  miasto__id NUMERIC   NOT NULL ,
  kod VARCHAR(255)      ,
PRIMARY KEY(id),
  FOREIGN KEY(miasto__id)
    REFERENCES miasto(id));


CREATE TABLE dostepnosc_taryfy (
  id NUMERIC   NOT NULL ,
  kod__id NUMERIC   NOT NULL ,
  taryfa__id NUMERIC   NOT NULL ,
  data_od TIMESTAMP    ,
  data_do TIMESTAMP      ,
PRIMARY KEY(id),
  FOREIGN KEY(taryfa__id)
    REFERENCES taryfa(id),
  FOREIGN KEY(kod__id)
    REFERENCES kod(id));


CREATE TABLE klient (
  id NUMERIC   NOT NULL ,
  klient__id NUMERIC    ,
  kod__id NUMERIC   NOT NULL ,
  imie VARCHAR(255)    ,
  nazwisko VARCHAR(255)    ,
  nazwa_firmy VARCHAR(255)    ,
  ulica VARCHAR(255)    ,
  nr_domu VARCHAR(255)    ,
  pesel_nip VARCHAR(255)   NOT NULL ,
  email VARCHAR(255)    ,
  data_od TIMESTAMP    ,
  data_do TIMESTAMP    ,
  haslo VARCHAR(255)      ,
PRIMARY KEY(id),
  FOREIGN KEY(kod__id)
    REFERENCES kod(id),
  FOREIGN KEY(klient__id)
    REFERENCES klient(id));


CREATE TABLE faktura (
  id NUMERIC   NOT NULL ,
  klient__id NUMERIC   NOT NULL ,
  szablon_faktury__id NUMERIC    ,
  data_wystawienia TIMESTAMP    ,
  kwota NUMBER(19,4)    ,
  niedoplata NUMBER(19,4)    ,
  odsetki NUMBER(19,4)    ,
  zaplacona NUMBER(1)    ,
  numer_faktury VARCHAR(255)   NOT NULL   ,
PRIMARY KEY(id),
  FOREIGN KEY(szablon_faktury__id)
    REFERENCES szablon_faktury(id),
  FOREIGN KEY(klient__id)
    REFERENCES klient(id));


CREATE TABLE taryfa_klienta (
  id NUMERIC   NOT NULL ,
  kod__id NUMERIC   NOT NULL ,
  identyfikator__id NUMERIC   NOT NULL ,
  umowa__id NUMERIC   NOT NULL ,
  taryfa__id NUMERIC   NOT NULL ,
  klient__id NUMERIC   NOT NULL ,
  data_od TIMESTAMP    ,
  data_do TIMESTAMP    ,
  grupa_faktur NUMERIC  DEFAULT '1'  ,
  okres_rozliczeniowy INTERVAL YEAR TO MONTH      ,
PRIMARY KEY(id),
  FOREIGN KEY(klient__id)
    REFERENCES klient(id),
  FOREIGN KEY(taryfa__id)
    REFERENCES taryfa(id),
  FOREIGN KEY(umowa__id)
    REFERENCES umowa(id),
  FOREIGN KEY(identyfikator__id)
    REFERENCES identyfikator(id),
  FOREIGN KEY(kod__id)
    REFERENCES kod(id));


CREATE TABLE platnosc (
  id NUMERIC   NOT NULL ,
  klient__id NUMERIC    ,
  data_wplaty TIMESTAMP    ,
  kwota NUMBER(19,4)   NOT NULL   ,
PRIMARY KEY(id),
  FOREIGN KEY(klient__id)
    REFERENCES klient(id));


CREATE TABLE usluga_klienta (
  id NUMERIC   NOT NULL ,
  usluga__id NUMERIC   NOT NULL ,
  taryfa_klienta__id NUMERIC   NOT NULL ,
  data_od TIMESTAMP   NOT NULL ,
  data_do TIMESTAMP    ,
  pozostalo NUMERIC    ,
  wykorzystane NUMERIC    ,
  numer VARCHAR(255)    ,
  mnoznik NUMBER(19,4)    ,
  aktywna NUMBER(1)      ,
PRIMARY KEY(id),
  FOREIGN KEY(taryfa_klienta__id)
    REFERENCES taryfa_klienta(id),
  FOREIGN KEY(usluga__id)
    REFERENCES usluga(id));


CREATE TABLE rozliczenie (
  id NUMERIC   NOT NULL ,
  taryfa_klienta__id NUMERIC   NOT NULL ,
  faktura__id NUMERIC   NOT NULL ,
  data_od TIMESTAMP    ,
  data_do TIMESTAMP      ,
PRIMARY KEY(id),
  FOREIGN KEY(faktura__id)
    REFERENCES faktura(id),
  FOREIGN KEY(taryfa_klienta__id)
    REFERENCES taryfa_klienta(id));


CREATE TABLE zdarzenie (
  id NUMERIC   NOT NULL ,
  usluga_klienta__id NUMERIC    ,
  typ_zdarzenia__id NUMERIC   NOT NULL ,
  identyfikator__id NUMERIC   NOT NULL ,
  prefix__id NUMERIC    ,
  numer_obcy VARCHAR(255)    ,
  data_od TIMESTAMP   NOT NULL ,
  czas INTERVAL DAY TO SECOND   NOT NULL ,
  dane VARCHAR(255)    ,
  koszt VARCHAR(255)      ,
PRIMARY KEY(id),
  FOREIGN KEY(prefix__id)
    REFERENCES prefix(id),
  FOREIGN KEY(typ_zdarzenia__id)
    REFERENCES typ_zdarzenia(id),
  FOREIGN KEY(identyfikator__id)
    REFERENCES identyfikator(id),
  FOREIGN KEY(usluga_klienta__id)
    REFERENCES usluga_klienta(id));



