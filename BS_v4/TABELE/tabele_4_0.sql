--@D:\gdrive\Dysk Google\Staz\BS_v2\TABELE\tabele_2.6.sql
--@D:\gdrive\Dysk Google\Staz\BS_v2\FUNKCJE\funkcje_2.6.sql
--@D:\gdrive\Dysk Google\Staz\BS_v2\DANE\dane_2.6.sql

--@D:\gdrive\Dysk Google\Staz\BS_v3\skrypcik_3_4_jalo.sql

-- Tworzenie tabel
------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------
@D:\gdrive\Dysk Google\Staz\BS_v3\TABELE\erd.sql
------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------

-- AUTOMATYCZNE SEKWENCJE I TRIGERY DO TABEL
	
create or replace procedure create_seq(nazwa varchar2)
AUTHID CURRENT_USER as
begin
execute immediate 'create sequence ' || nazwa ||'_seq' || ' start with 1 increment by 1 nomaxvalue';
end;

/

create or replace procedure create_trig(nazwa varchar2)
AUTHID CURRENT_USER as
begin
execute immediate 'create or replace trigger ' || nazwa ||'_trig' || ' before insert on '||nazwa||' for each row 
begin 
  IF (:NEW.id IS NULL) THEN 
    select ' || nazwa||'_seq.nextval into :new.id from dual;
  END IF; 
end;';
end;

/

create or replace procedure create_autoinc(tabela varchar2)
AUTHID CURRENT_USER as
begin
create_seq(tabela);
create_trig(tabela);
end;

/


create or replace procedure tigery_sekwencje
AUTHID CURRENT_USER as
  cursor c_t is select TABLE_NAME from all_tables where owner =user;
begin

  for rec in c_t loop 
	--dbms_output.put_line(rec);
	create_autoinc(rec.TABLE_NAME);
  end loop;

end;

/

CALL tigery_sekwencje();
 
-- unikalne nazwy panstw
ALTER TABLE KRAJ ADD UNIQUE (NAZWA);
-- unikalne regiony w danym kraju
ALTER TABLE REGION ADD UNIQUE (NAZWA,KRAJ__ID);
-- unikalne kody w miescie
ALTER TABLE KOD ADD UNIQUE (KOD,MIASTO__ID);
-- unikalny prefix
ALTER TABLE PREFIX ADD UNIQUE (PREFIX);
-- unikalne nazwy jednostek
ALTER TABLE JEDNOSTKA ADD UNIQUE (NAZWA);

-- unikalne nazwy typow
ALTER TABLE TYP_URZADZENIA ADD UNIQUE (NAZWA);
ALTER TABLE TYP_ZDARZENIA ADD UNIQUE (NAZWA);

-- unikalne numery
ALTER TABLE IDENTYFIKATOR ADD UNIQUE (numer);


ALTER TABLE KLIENT ADD CONSTRAINTS BIZNESOWY CHECK ("IMIE" IS NOT NULL AND "NAZWISKO" IS NOT NULL AND "NAZWA_FIRMY" IS NULL OR "IMIE" IS NULL AND "NAZWISKO" IS NULL AND "NAZWA_FIRMY" IS NOT NULL);


ALTER TABLE ZDARZENIE 
ADD (prefix__id_miejsca NUMERIC NOT NULL); 

ALTER TABLE ZDARZENIE
ADD (FOREIGN KEY(prefix__id_miejsca) REFERENCES prefix(id));

ALTER TABLE KRAJ_KRAJ 
ADD (prefix__id_do NUMERIC NOT NULL); 
ALTER TABLE KRAJ_KRAJ
ADD (FOREIGN KEY(prefix__id_do) REFERENCES prefix(id));

ALTER TABLE KRAJ_KRAJ 
ADD (jednostka__id_rozmowa_in NUMERIC NOT NULL); 
ALTER TABLE KRAJ_KRAJ
ADD (FOREIGN KEY(jednostka__id_rozmowa_in) REFERENCES jednostka(id));

ALTER TABLE KRAJ_KRAJ 
ADD (jednostka__id_rozmowa_out NUMERIC NOT NULL); 
ALTER TABLE KRAJ_KRAJ
ADD (FOREIGN KEY(jednostka__id_rozmowa_out) REFERENCES jednostka(id));

ALTER TABLE KRAJ_KRAJ 
ADD (jednostka__id_sms_in NUMERIC NOT NULL); 
ALTER TABLE KRAJ_KRAJ
ADD (FOREIGN KEY(jednostka__id_sms_in) REFERENCES jednostka(id));

ALTER TABLE KRAJ_KRAJ 
ADD (jednostka__id_sms_out NUMERIC NOT NULL); 
ALTER TABLE KRAJ_KRAJ
ADD (FOREIGN KEY(jednostka__id_sms_out) REFERENCES jednostka(id));

ALTER TABLE KRAJ_KRAJ 
ADD (jednostka__id_mms_in NUMERIC NOT NULL); 
ALTER TABLE KRAJ_KRAJ
ADD (FOREIGN KEY(jednostka__id_mms_in) REFERENCES jednostka(id));

ALTER TABLE KRAJ_KRAJ 
ADD (jednostka__id_mms_out NUMERIC NOT NULL); 
ALTER TABLE KRAJ_KRAJ
ADD (FOREIGN KEY(jednostka__id_mms_out) REFERENCES jednostka(id));

ALTER TABLE KRAJ_KRAJ 
ADD (jednostka__id_dane NUMERIC NOT NULL); 
ALTER TABLE KRAJ_KRAJ
ADD (FOREIGN KEY(jednostka__id_dane) REFERENCES jednostka(id));


ALTER TABLE WYMIANA 
ADD (jednostka__id_2 NUMERIC NOT NULL); 

ALTER TABLE WYMIANA
ADD (FOREIGN KEY(jednostka__id_2) REFERENCES jednostka(id));

ALTER TABLE KLIENT 
ADD (klient__id_pierwotny NUMERIC); 

ALTER TABLE KLIENT
ADD (FOREIGN KEY(klient__id_pierwotny) REFERENCES klient(id));

