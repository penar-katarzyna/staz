-- Widoki
CREATE OR REPLACE VIEW W_DOSTEPNOSC_TARYFY AS
SELECT D.ID AS "IDENTYFIKATOR", 
  W_KOD.KOD_POCZTOWY AS "KOD POCZTOWY", 
  T.NAZWA AS "TARYFA", 
  D.DATA_OD, 
  D.DATA_DO 
FROM DOSTEPNOSC_TARYFY "D" 
JOIN W_KOD ON D.KOD__ID=W_KOD.IDENTYFIKATOR 
JOIN TARYFA "T" ON D.TARYFA__ID=T.ID;

CREATE OR REPLACE VIEW W_IDENTYFIKATOR AS
SELECT I.ID AS "IDENTYFIKATOR", 
  W_TYP_URZADZENIA.IDENTYFIKATOR "IDENTYFIKATOR URZ.", 
  W_TYP_URZADZENIA.nazwa "NAZWA URZ.",
  W_PREFIX.PREFIX,
  I.NUMER, 
  I.AKTYWNY 
FROM IDENTYFIKATOR "I" 
JOIN W_TYP_URZADZENIA ON W_TYP_URZADZENIA.IDENTYFIKATOR=I.TYP_URZADZENIA__ID 
JOIN W_PREFIX ON W_PREFIX.IDENTYFIKATOR=I.PREFIX__ID;

CREATE OR REPLACE VIEW W_JEDNOSTKA AS
SELECT J.ID AS "IDENTYFIKATOR", 
  J.NAZWA 
FROM JEDNOSTKA "J";

create or replace view W_KARA AS
SELECT ID AS IDENTYFIKATOR, 
  NAZWA, 
  KWOTA 
FROM KARA;

CREATE OR REPLACE VIEW W_KLIENT AS
SELECT k.ID AS IDENTYFIKATOR, 
  K.IMIE, 
  K.NAZWISKO, 
  w_kod.NAZWA_KRAJU "KRAJ", 
  w_kod.NAZWA_REGIONU "REGION", 
  w_kod.KOD_POCZTOWY, 
  w_kod.NAZWA_MIASTA "MIASTO",
  K.ULICA "ULICA", 
  K.NR_DOMU "NR_DOMU", 
  K.PESEL_NIP "PESEL", 
  K.DATA_OD, 
  K.DATA_DO, 
  K.KLIENT__ID_PIERWOTNY 
from KLIENT "K" 
JOIN w_kod on w_kod.identyfikator=K.kod__ID 
where "IMIE" IS NOT NULL 
AND "NAZWISKO" IS NOT NULL 
AND "NAZWA_FIRMY" IS NULL;

CREATE OR REPLACE VIEW W_KLIENT_BIZNESOWY AS
SELECT k.ID AS IDENTYFIKATOR, 
k.klient__id as "PODMIOT ZARZADZAJACY" , 
(SELECT KK.NAZWA_FIRMY FROM KLIENT "KK" WHERE ID=k.klient__id) AS "NAZWA ZARZADCY",
  K.NAZWA_FIRMY, 
  w_kod.NAZWA_KRAJU "KRAJ", 
  w_kod.NAZWA_REGIONU "REGION", 
  w_kod.KOD_POCZTOWY, 
  w_kod.NAZWA_MIASTA "MIASTO", 
  K.ULICA, 
  K.NR_DOMU, 
  K.PESEL_NIP "NIP", 
  K.DATA_OD, 
  K.DATA_DO, 
  K.KLIENT__ID_PIERWOTNY 
from KLIENT "K" 
JOIN w_kod on w_kod.identyfikator=K.kod__ID 
where "IMIE" IS NULL 
AND "NAZWISKO" IS NULL 
AND "NAZWA_FIRMY" IS NOT NULL;

CREATE OR REPLACE VIEW W_KOD AS
SELECT kod.id as identyfikator, 
  KRAJ.NAZWA AS NAZWA_KRAJU, 
  REGION.NAZWA AS NAZWA_REGIONU, 
  MIASTO.NAZWA AS NAZWA_MIASTA, 
  KOD.KOD AS KOD_POCZTOWY 
FROM KOD 
JOIN MIASTO ON MIASTO__ID=MIASTO.ID 
JOIN REGION ON REGION__ID=REGION.ID 
JOIN KRAJ ON KRAJ__ID=KRAJ.ID;

CREATE OR REPLACE VIEW W_KRAJ_PREFIX AS
SELECT KRAJ.NAZWA AS NAZWA_KRAJU,
  PREFIX.prefix AS KOD_KRAJU 
FROM KRAJ 
JOIN PREFIX ON KRAJ.prefix__id = PREFIX.id;

CREATE OR REPLACE VIEW W_KRAJ AS
SELECT K.ID "IDENTYFIKATOR", 
  P.PREFIX, 
  P.IDENTYFIKATOR "ID_PREFIXU", 
  K.nazwa, 
  K.WALUTA 
FROM KRAJ "K" 
JOIN W_PREFIX "P" ON K.PREFIX__ID=P.IDENTYFIKATOR;

--CREATE OR REPLACE VIEW W_KRAJ_KRAJ AS
--SELECT * FROM KRAJ_KRAJ; DOKONCZYC JAK BEDZIE STREFA, STAWKA


CREATE OR REPLACE VIEW W_REGION AS
SELECT R.ID "IDENTYFIKATOR", 
W_KRAJ.NAZWA "KRAJ", 
R.NAZWA "REGION" 
FROM REGION "R" 
JOIN W_KRAJ ON W_KRAJ.IDENTYFIKATOR=R.KRAJ__ID;


CREATE OR REPLACE VIEW W_MIASTO AS
SELECT M.ID "IDENTYFIKATOR", 
M.nazwa "NAZWA_MIASTA", 
R.region, 
R.kraj 
from miasto "M" 
join w_region "R" on M.region__id=R.IDENTYFIKATOR;

create or replace view W_ODSETKI AS
SELECT ID AS IDENTYFIKATOR, 
NAZWA, 
PROCENT 
FROM ODSETKI;

CREATE OR REPLACE VIEW W_PREFIX AS
SELECT P.ID AS "IDENTYFIKATOR", 
P.PREFIX 
FROM PREFIX "P";

CREATE OR REPLACE VIEW W_REGION AS
SELECT R.ID "IDENTYFIKATOR", 
W_KRAJ.NAZWA "KRAJ", 
R.NAZWA "REGION" 
FROM REGION "R" 
JOIN W_KRAJ ON W_KRAJ.IDENTYFIKATOR=R.KRAJ__ID;

CREATE OR REPLACE view W_REGULY AS
SELECT R.ID AS "IDENTYFIKATOR",
R.nazwa,
R.A_POST,
R.POST,
R.A_PRE,
R.PRE,
R.poMIN
FROM REGULY "R";

--DOKONCZYC JAK BEDZIE W_TARYFA!!!!!!!!!!!!!!
--CREATE OR REPLACE VIEW W_ROZLICZENIE AS
--SELECT * FROM ROZLICZENIE "R";

--DOKONCZYC JAK BEDZIE W_TYP_SIATKI!!!!!!!!!!!
--CREATE OR REPLACE VIEW SIATKA AS
--SELECT S.ID AS "IDENTYFIKATOR",
--FROM SIATKA "S";

CREATE OR REPLACE VIEW W_SKALOWANIE AS
SELECT S.ID AS "IDENTYFIKATOR",
J.IDENTYFIKATOR "IDENTYFIKATOR JEDNOSTKI",
J.nazwa,
S.WARTOSC1,
S.WARTOSC2
FROM SKALOWANIE "S"
JOIN W_JEDNOSTKA "J" ON S.JEDNOSTKA__ID = J.IDENTYFIKATOR;

create or replace VIEW W_TYP_URZADZENIA AS 
SELECT ID AS IDENTYFIKATOR, 
  NAZWA 
FROM TYP_URZADZENIA;

CREATE OR REPLACE VIEW W_TYP_ZDARZENIA AS
SELECT ID AS IDENTYFIKATOR, 
  NAZWA 
FROM TYP_ZDARZENIA;

CREATE OR REPLACE VIEW W_FAKTURA AS
SELECT F.ID AS "IDENTYFIKATOR", 
  K.IMIE, 
  K.NAZWISKO, 
  K.KRAJ, 
  K.REGION, 
  K.KOD_POCZTOWY,
  K.MIASTO, 
  K.ULICA,
  K.NR_DOMU,
  K.PESEL,
  SZ.NAZWA, 
  to_char(F.data_wystawienia,'dd-mm-yyyy hh24:mi:ss') AS "DATA_WYSTAWIENIA", 
  F.KWOTA, 
  F.niedoplata, 
  F.ODSETKI, 
  F.zaplacona, 
  F.numer_faktury FROM FAKTURA "F" 
JOIN w_klient "K" on f.KLIENT__ID=K.identyfikator
JOIN szablon_faktury "SZ" ON F.numer_faktury = SZ.ID;


CREATE OR REPLACE VIEW W_PLATNOSC AS
SELECT P.ID AS "IDENTYFIKATOR", 
  K.IMIE,
  K.NAZWISKO,
  K.NAZWA_FIRMY,
  K.PESEL_NIP,
  P.KWOTA AS "KWOTA_PLATNOSCI" 
FROM PLATNOSC "P"
JOIN KLIENT "K" ON K.ID=P.KLIENT__ID;





CREATE OR REPLACE FUNCTION DODAJ_KRAJ
   ( V_PREFIX IN KRAJ.PREFIX__ID%TYPE,
   V_NAZWA IN KRAJ.NAZWA%TYPE,
   V_WALUTA IN KRAJ.WALUTA%TYPE)
   RETURN NUMBER IS
   V_COUNT NUMBER;
   V_ID number;
BEGIN
  --sprawdza czy dany kraj juz nie wystepuje w bazie i zwraca jego id
  BEGIN 
  SELECT ID INTO V_ID FROM KRAJ WHERE NAZWA=UPPER(V_NAZWA);
  return V_ID;
  EXCEPTION
  WHEN OTHERS THEN
	select  kraj_seq.nextval into V_ID from dual;
    INSERT INTO KRAJ VALUES (V_ID, V_PREFIX, UPPER(V_NAZWA), UPPER(V_WALUTA));
    return V_ID;
  END;

EXCEPTION
  WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  raise_application_error(-20001,'BLAD - DODAJ KRAJ '||SQLCODE||' -ERROR- '||SQLERRM);
END;
/

CREATE OR REPLACE FUNCTION DODAJ_REGION
   (V_KRAJ_ID IN NUMBER,
   V_NAZWA IN REGION.NAZWA%TYPE)
   RETURN NUMBER IS  
   V_COUNT NUMBER;
   V_ID number;
BEGIN
  --sprawdza czy dany region juz nie wystepuje w bazie i zwraca jego id
  BEGIN 
  SELECT ID INTO V_ID FROM REGION WHERE REGION.NAZWA=UPPER(V_NAZWA) AND KRAJ__ID=V_KRAJ_ID;
  return V_ID;
  EXCEPTION
  WHEN OTHERS THEN
	select  region_seq.nextval into V_ID from dual;
    INSERT INTO REGION VALUES (V_ID, V_KRAJ_ID, UPPER(V_NAZWA));
    return V_ID;
  END;

EXCEPTION
  WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  raise_application_error(-20001,'BLAD - DODAJ REGION '||SQLCODE||' -ERROR- '||SQLERRM);
END;
/
   
CREATE OR REPLACE FUNCTION DODAJ_MIASTO
   ( V_REG_ID IN NUMBER,
	 V_NAZWA IN MIASTO.NAZWA%TYPE)
   RETURN NUMBER IS
   V_COUNT NUMBER;
   V_ID number; 
BEGIN
    select  miasto_seq.nextval into V_ID from dual;
   INSERT INTO MIASTO VALUES (V_ID, V_REG_ID, UPPER(V_NAZWA));
   return V_ID;
EXCEPTION
	WHEN OTHERS THEN
	 raise_application_error(-20001,'BLAD - DODAJ MIASTO'||SQLCODE||' -ERROR- '||SQLERRM);
END;
/   
   

CREATE OR REPLACE FUNCTION DODAJ_KOD
   ( V_MIASTO_ID IN NUMBER,
	 V_KOD IN KOD.KOD%TYPE)
   RETURN NUMBER IS
   V_COUNT NUMBER;
   V_ID number; 
BEGIN
  --sprawdza czy dany region juz nie wystepuje w miescie i zwraca jego id
  BEGIN 
  SELECT ID INTO v_ID FROM kod WHERE kod.kod=V_KOD AND MIASTO__ID=V_MIASTO_ID;
  return V_ID;
  EXCEPTION
  WHEN OTHERS THEN
		select  kod_seq.nextval into V_ID from dual;
  		INSERT INTO KOD VALUES (V_ID, V_MIASTO_ID, V_KOD);
    return V_ID;
  END;

EXCEPTION
  WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  raise_application_error(-20001,'BLAD - DODAJ KOD '||SQLCODE||' -ERROR- '||SQLERRM);
END;
/   
   

CREATE OR REPLACE FUNCTION DODAJ_PREFIX
   (V_PREFIX IN varchar2)
   RETURN NUMBER IS 
   V_ID number; 
   V_P number;
   l_exst number(1);
BEGIN

select case 
  when  exists  (select 1 from prefix where prefix=V_PREFIX) 
    then 0
    else 1
  end into l_exst
from dual;
  
  if l_exst = 1 
    then
      DBMS_OUTPUT.put_line('YES YOU CAN');
      SELECT PREFIX_SEQ.NEXTVAL INTO V_ID FROM DUAL;
      INSERT INTO PREFIX VALUES (V_ID, V_PREFIX);
      return V_ID;
    
    else
        DBMS_OUTPUT.put_line('YOU CANNOT');
      select id into V_P from prefix where prefix=V_prefix;
      return V_P;   
  end if;

EXCEPTION
  WHEN OTHERS THEN
   raise_application_error(-20001,'BLAD - DODAJ PREFIX'||SQLCODE||' -ERROR- '||SQLERRM);
END;
/

CREATE OR REPLACE FUNCTION DODAJ_IDENTYFIKATOR(
    P_NUMER VARCHAR2,
    P_TYP_URZADZENIA__ID NUMBER,
    AKTYWNY NUMBER DEFAULT 0) 
RETURN NUMBER 
IS
    V_PREFIX__ID NUMBER;
    V_COUNT NUMBER;
    V_ID NUMBER;

    BEGIN
        SELECT COUNT(*) INTO V_COUNT FROM IDENTYFIKATOR WHERE NUMER=P_NUMER;
    
	    IF  V_COUNT<1  THEN 
            SELECT PREFIX.ID INTO V_PREFIX__ID FROM PREFIX WHERE PREFIX.PREFIX='NIEZNANY'; 
	        SELECT IDENTYFIKATOR_SEQ.NEXTVAL INTO V_ID FROM DUAL;
            INSERT INTO IDENTYFIKATOR VALUES(V_ID, P_TYP_URZADZENIA__ID, V_PREFIX__ID, P_NUMER,  AKTYWNY);
        END IF; 
        
        RETURN V_ID;
        
        EXCEPTION
        	WHEN OTHERS THEN
	         DBMS_OUTPUT.PUT_LINE('BLAD');
	         raise_application_error(-20001,'BLAD - DODAJ_IDENTYFIKATOR'||SQLCODE||' -ERROR- '||SQLERRM);
    END DODAJ_IDENTYFIKATOR;
/

CREATE OR REPLACE FUNCTION DODAJ_KLIENT(
  V_KOD__ID in NUMBER,
    V_IMIE in VARCHAR2,
    V_NAZWISKO in VARCHAR2,
    V_ULICA in VARCHAR2,
    V_NR_DOMU in VARCHAR2,
    V_NIP_PESEL in VARCHAR2,
    V_EMAIL in VARCHAR2,
    V_HASLO IN VARCHAR2
  ) 
RETURN NUMBER 
IS
    V_ID NUMBER;
  v_data_od_temp VARCHAR2(255);
BEGIN
  v_data_od_temp := to_char(SYSDATE,'dd-mm-yyyy hh24:mi:ss');

    IF REGEXP_LIKE(UPPER(V_EMAIL),'[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}') = true
      THEN
        SELECT KLIENT_SEQ.NEXTVAL INTO V_ID FROM DUAL;
        INSERT INTO KLIENT VALUES(V_ID, NULL, V_KOD__ID, V_IMIE, V_NAZWISKO, NULL, V_ULICA, V_NR_DOMU, V_NIP_PESEL, V_EMAIL, to_timestamp(v_data_od_temp,'dd-mm-yyyy hh24:mi:ss'), NULL, V_HASLO,NULL);    
        RETURN V_ID;
      ELSE
        DBMS_OUTPUT.PUT_LINE('zly e-mail');
        RETURN -1;
      END IF;

EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('BLAD');
    raise_application_error(-20001,'BLAD - DODAJ_KLIENT'||SQLCODE||' -ERROR- '||SQLERRM);

END DODAJ_KLIENT;
/

CREATE OR REPLACE FUNCTION DODAJ_KLIENT_BIZNESOWY(
    V_KLIENT__ID in NUMBER,
    V_KOD__ID in NUMBER,
    V_NAZWA_FIRMY in VARCHAR2,
    V_ULICA in VARCHAR2,
    V_NR_DOMU in VARCHAR2,
    V_NIP_PESEL in VARCHAR2,
    V_EMAIL in VARCHAR2,
  V_HASLO IN VARCHAR2) 
RETURN NUMBER 
IS
    V_ID NUMBER;
  v_data_od_temp VARCHAR2(255);
BEGIN
   v_data_od_temp := to_char(SYSDATE,'dd-mm-yyyy hh24:mi:ss');

    IF REGEXP_LIKE(UPPER(V_EMAIL),'[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}') = true
      THEN
        SELECT KLIENT_SEQ.NEXTVAL INTO V_ID FROM DUAL;
          INSERT INTO KLIENT VALUES(V_ID, V_KLIENT__ID, V_KOD__ID, NULL, NULL, V_NAZWA_FIRMY, V_ULICA, V_NR_DOMU, V_NIP_PESEL, V_EMAIL, to_timestamp(v_data_od_temp,'dd-mm-yyyy hh24:mi:ss'), null, V_HASLO,null);   
        RETURN V_ID;
      ELSE
        DBMS_OUTPUT.PUT_LINE('zly e-mail');
        RETURN -1;
      END IF;
EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('BLAD');
    raise_application_error(-20001,'BLAD - DODAJ_KLIENT_BIZNESOWY'||SQLCODE||' -ERROR- '||SQLERRM);

END DODAJ_KLIENT_BIZNESOWY;
/

CREATE OR REPLACE FUNCTION EDYTUJ_KLIENT(
    V_ID_SZUKANY IN NUMBER,
    V_KOD__ID in NUMBER,
    V_IMIE in VARCHAR2,
    V_NAZWISKO in VARCHAR2,
    V_ULICA in VARCHAR2,
    V_NR_DOMU in VARCHAR2,
    V_NIP_PESEL in VARCHAR2,
    V_EMAIL in VARCHAR2,
    V_HASLO IN VARCHAR2
  ) 
RETURN NUMBER 
IS
    V_ID NUMBER;
  v_data_od_temp VARCHAR2(255);
BEGIN
  v_data_od_temp := to_char(SYSDATE,'dd-mm-yyyy hh24:mi:ss');

    IF REGEXP_LIKE(UPPER(V_EMAIL),'[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}') = true
      THEN
        SELECT KLIENT_SEQ.NEXTVAL INTO V_ID FROM DUAL;
          --WSTAWIENIE NOWEGO
          INSERT INTO KLIENT VALUES(V_ID, NULL, V_KOD__ID, V_IMIE, V_NAZWISKO, NULL, V_ULICA, V_NR_DOMU, V_NIP_PESEL, V_EMAIL, to_timestamp(v_data_od_temp,'dd-mm-yyyy hh24:mi:ss'), NULL, V_HASLO, V_ID_SZUKANY);    
          --AKTUALIZACJA STAREGO
          UPDATE KLIENT SET DATA_DO = to_timestamp(v_data_od_temp,'dd-mm-yyyy hh24:mi:ss') WHERE ID=V_ID_SZUKANY;
        RETURN V_ID;
      ELSE
        DBMS_OUTPUT.PUT_LINE('zly e-mail');
        RETURN -1;
      END IF;

EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('BLAD');
    raise_application_error(-20001,'BLAD - EDYTUJ_KLIENT'||SQLCODE||' -ERROR- '||SQLERRM);

END EDYTUJ_KLIENT;
/

CREATE OR REPLACE FUNCTION EDYTUJ_KLIENT_BIZNESOWY(
    V_ID_SZUKANY IN NUMBER,
    V_KLIENT__ID in NUMBER,
    V_KOD__ID in NUMBER,
    V_NAZWA_FIRMY in VARCHAR2,
    V_ULICA in VARCHAR2,
    V_NR_DOMU in VARCHAR2,
    V_NIP_PESEL in VARCHAR2,
    V_EMAIL in VARCHAR2,
  V_DATA_OD IN TIMESTAMP,
  V_DATA_DO IN TIMESTAMP,
  V_HASLO IN VARCHAR2) 
RETURN NUMBER 
IS
    V_ID NUMBER;
  v_data_od_temp VARCHAR2(255);
BEGIN
   v_data_od_temp := to_char(SYSDATE,'dd-mm-yyyy hh24:mi:ss');

    IF REGEXP_LIKE(UPPER(V_EMAIL),'[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}') = true
      THEN
        SELECT KLIENT_SEQ.NEXTVAL INTO V_ID FROM DUAL;
          --WSTAWIENIE NOWEGO
          INSERT INTO KLIENT VALUES(V_ID, V_KLIENT__ID, V_KOD__ID, NULL, NULL, V_NAZWA_FIRMY, V_ULICA, V_NR_DOMU, V_NIP_PESEL, V_EMAIL, to_timestamp(v_data_od_temp,'dd-mm-yyyy hh24:mi:ss'), null, V_HASLO, V_ID_SZUKANY);    
          --AKTUALIZACJA STAREGO
          UPDATE KLIENT SET DATA_DO = to_timestamp(v_data_od_temp,'dd-mm-yyyy hh24:mi:ss') WHERE ID=V_ID_SZUKANY;
        RETURN V_ID;
      ELSE
        DBMS_OUTPUT.PUT_LINE('zly e-mail');
        RETURN -1;
      END IF;
EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('BLAD');
    raise_application_error(-20001,'BLAD - EDYTUJ_KLIENT_BIZNESOWY'||SQLCODE||' -ERROR- '||SQLERRM);

END EDYTUJ_KLIENT_BIZNESOWY;
/

CREATE or REPLACE FUNCTION DODAJ_TYP_URZADZENIA
  ( v_nazwa IN varchar2 )
  RETURN  number IS    
  V_ID number; 
  V_P NUMBER;
  l_exst number(1);
BEGIN
SELECT case 
  when  exists  (select 1 from TYP_URZADZENIA where NAZWA=V_NAZWA)
    then 0
    else 1
  end into l_exst
from dual;
  
  if l_exst = 1 
    then
      SELECT TYP_URZADZENIA_SEQ.NEXTVAL INTO V_ID FROM DUAL;
      INSERT INTO TYP_URZADZENIA VALUES (V_ID, V_NAZWA);
      return V_ID;
    
    else
      select id into V_P from TYP_URZADZENIA where NAZWA=V_NAZWA;
      return V_P;   
  end if;

EXCEPTION
   WHEN OTHERS THEN
  raise_application_error(-20001,'BLAD - DODAJ_TYP_URZADZENIA'||SQLCODE||' -ERROR- '||SQLERRM);
END;
/

CREATE or REPLACE FUNCTION DODAJ_TYP_ZDARZENIA
  ( v_indentyfikator in number,
    v_nazwa IN VARCHAR2,
    v_SQL IN varchar2
    )
  RETURN  number IS    
BEGIN
   INSERT INTO TYP_ZDARZENIA VALUES (v_indentyfikator, V_NAZWA, v_SQL);
   DBMS_OUTPUT.put_line('rerturn V_ID '||v_indentyfikator);
   RETURN v_indentyfikator;  
EXCEPTION
   WHEN OTHERS THEN
  raise_application_error(-20001,'BLAD - DODAJ_TYP_ZDARZENIA'||SQLCODE||' -ERROR- '||SQLERRM);
END;
/

-- SYSTEMOWE TYPY DANYCH
CREATE OR REPLACE PROCEDURE F_NIEZNANE
   IS
   V_kraj number;
   V_PREF NUMBER;
   V_TYP_ZDARZENIA NUMBER;
   V_TYP_URZADZENIA NUMBER;
BEGIN
V_PREF:=DODAJ_PREFIX('NIEZNANY');
V_KRAJ:=dodaj_kraj(V_PREF,'NIEZNANY','NIEZNANA');

V_TYP_ZDARZENIA := dodaj_TYP_ZDARZENIA(0,'NIEZNANY',null);
V_TYP_URZADZENIA := dodaj_TYP_URZADZENIA('NIEZNANY');


EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.put_line('JuÅ¼ dodane');
	--raise_application_error(-20001,'BLAD - '||SQLCODE||' -ERROR- '||SQLERRM);
END;
/

CREATE OR REPLACE FUNCTION DODAJ_KARA
   ( V_NAZWA IN VARCHAR2,
   V_KWOTA IN NUMBER)
   RETURN NUMBER IS
   V_ID number; 
BEGIN
    select  KARA_seq.nextval into V_ID from dual;
   INSERT INTO KARA VALUES (V_ID, UPPER(V_NAZWA), V_KWOTA);
   return V_ID;
EXCEPTION
  WHEN OTHERS THEN
   raise_application_error(-20001,'BLAD - DODAJ_KARA'||SQLCODE||' -ERROR- '||SQLERRM);
END;
/

CREATE OR REPLACE FUNCTION DODAJ_ODSETKI
   ( V_NAZWA IN VARCHAR2,
   V_PROCENT IN NUMBER)
   RETURN NUMBER IS
   V_ID number; 
BEGIN
    select  ODSETKI_seq.nextval into V_ID from dual;
   INSERT INTO KARA VALUES (V_ID, UPPER(V_NAZWA), V_PROCENT);
   return V_ID;
EXCEPTION
  WHEN OTHERS THEN
   raise_application_error(-20001,'BLAD - DODAJ_ODSETKI'||SQLCODE||' -ERROR- '||SQLERRM);
END;
/

CREATE OR REPLACE FUNCTION DODAJ_TARYFA (v_naz IN VARCHAR2, v_od IN VARCHAR2, v_do IN VARCHAR2)
   RETURN NUMBER
IS
   v_id        NUMBER;
   v_nazwa	   VARCHAR(255);
   v_c_t       TIMESTAMP;
   v_temptime  TIMESTAMP;
   v_data_od   TIMESTAMP;
   v_data_do   TIMESTAMP;
BEGIN
   v_data_od := TO_TIMESTAMP (v_od, 'dd-mm-yyyy hh24:mi:ss');
   v_data_do := TO_TIMESTAMP (v_do, 'dd-mm-yyyy hh24:mi:ss');
   v_nazwa:=UPPER (v_naz);
   SELECT CURRENT_TIMESTAMP
     INTO v_c_t
     FROM DUAL;

   IF v_data_od < v_c_t OR v_data_od>v_data_do
   THEN
		DBMS_OUTPUT.put_line('ZÅE DATY!');
		raise_application_error (-20001,'BLAD - ZÅE DATY!' || SQLCODE || ' -ERROR- ' || SQLERRM);
							  --RETURN -1;
   END IF;

	--usun wszytskie pomiedzy
	DELETE FROM TARYFA WHERE NAZWA=V_NAZWA AND DATA_OD>V_DATA_OD AND DATA_DO<V_DATA_DO;

	--podziel wieksze
	begin


	SELECT data_do INTO v_temptime FROM taryfa WHERE nazwa = v_nazwa AND data_do > v_data_do AND data_od < v_data_od;


	UPDATE taryfa
		  SET data_do = v_data_od
		WHERE nazwa = v_nazwa AND data_do > v_data_do AND data_od < v_data_od;
		   
	SELECT taryfa_seq.NEXTVAL
		 INTO v_id
		 FROM DUAL;

	INSERT INTO taryfa
		   VALUES (v_id,v_nazwa, v_data_do, v_temptime);
		   
		   EXCEPTION
	   WHEN OTHERS
	   THEN
		  null;--raise_application_error (-20001,'BLAD - ' || SQLCODE || ' -ERROR- ' || SQLERRM  );
	END;


--skroc stare do
   UPDATE taryfa
      SET data_do = v_data_od
    WHERE nazwa = v_nazwa AND data_do > v_data_od AND data_do < v_data_do;

--skroc nowsze od
   UPDATE taryfa
      SET data_od = v_data_do
    WHERE nazwa = v_nazwa AND data_od < v_data_do AND data_do > v_data_do;

   SELECT taryfa_seq.NEXTVAL
     INTO v_id
     FROM DUAL;

   INSERT INTO taryfa
        VALUES (v_id,v_nazwa, v_data_od, v_data_do);

   RETURN v_id;
EXCEPTION
   WHEN OTHERS
   THEN
   
      raise_application_error (-20001,
                               'BLAD - DODAJ_TARYFA' || SQLCODE || ' -ERROR- ' || SQLERRM
                              );


END;
/

CREATE OR REPLACE FUNCTION Dodaj_fakture(
        p_klient__id NUMBER , 
        p_grupa_faktur NUMBER)
RETURN NUMBER 
IS
    v_numer_faktury VARCHAR(255);
    v_tmp VARCHAR2(6);
    v_szablon_faktury__id NUMBER;
    v_count NUMBER;
    v_exists NUMBER(1);
    v_niedoplata NUMBER(19,4);
    v_do_zaplaty NUMBER(19,4);
    v_typ_klienta varchar(255);
    v_faktura__id NUMBER;
    v_id NUMBER;

BEGIN
    SELECT to_char(extract( year from SYSDATE )) INTO v_tmp FROM dual;
    
    SELECT to_char(extract( month from SYSDATE )) INTO v_numer_faktury  FROM dual;
    
    v_numer_faktury := p_klient__id||'/'||v_numer_faktury||'/'||v_tmp||'/'||p_grupa_faktur||'1';
    
    SELECT COUNT(*)INTO v_count FROM faktura WHERE faktura.numer_faktury = v_numer_faktury;
    SELECT COUNT(*) INTO v_exists FROM klient WHERE klient.id=p_klient__id;    
    IF (v_count < 1) AND (v_exists > 0) 
    THEN
   
    SELECT klient.nazwa_firmy INTO v_typ_klienta FROM klient WHERE klient.id=p_klient__id ;
    SELECT NVL2(v_typ_klienta, 1, 0) INTO v_typ_klienta FROM DUAL;
    
    SELECT szablon_faktury.id INTO v_szablon_faktury__id FroM szablon_faktury 
        WHERE SZABLON_FAKTURY.typ_klienta = v_typ_klienta -- mamy zaloÅ¼enie Å¼e biznesowy ma 1 a n/b 0
                AND szablon_faktury.kraj__id = (SELECT kraj.id FROM kraj 
                    JOIN region ON kraj.id = region.kraj__id 
                    JOIN miasto ON region.id = miasto.region__id 
                    JOIN kod ON miasto.id = kod.miasto__id
                    JOIN klient ON kod.id = klient.kod__id 
                        WHERE klient.id = p_klient__id);
						
	SELECT NVL(v_szablon_faktury__id, 0) INTO v_szablon_faktury__id FROM dual;
	
	IF (v_szablon_faktury__id = 0)
	THEN
		DBMS_OUTPUT.PUT_LINE('Nie mozna znalezc szablonu dla podanego klienta'); --upewnic sie ¿e szablon mo¿e byc nullem!
	END IF;
	
    SELECT SUM(platnosc.kwota) INTO v_niedoplata FROM platnosc 
        WHERE platnosc.data_wplaty < SYSDATE 
            AND platnosc.data_wplaty = (SELECT max(faktura.data_wystawienia) FROM faktura 
                    WHERE faktura.klient__id = p_klient__id 
                        AND faktura.numer_faktury LIKE (p_klient__id||'%'||p_grupa_faktur));
    
    SELECT NVL(v_niedoplata, 0) INTO v_niedoplata FROM dual; 
    
    SELECT MAX(faktura.id) INTO v_faktura__id FROM faktura 
        WHERE faktura.klient__id = p_klient__id
        AND faktura.numer_faktury LIKE (p_klient__id||'%'||p_grupa_faktur) 
    ORDER BY (data_wystawienia) desc;
    
    IF v_faktura__id != 0
    THEN 
    SELECT (kwota+niedoplata) into v_do_zaplaty FROM faktura 
           WHERE faktura.id = v_faktura__id;
   
    SELECT NVL(v_do_zaplaty, 0) INTO v_do_zaplaty FROM dual; 
   
    v_niedoplata := v_niedoplata - v_do_zaplaty;
    END IF;
    SELECT faktura_SEQ.NEXTVAL INTO V_ID FROM DUAL;
    
    INSERT INTO  faktura(
        id,
        numer_faktury,
        szablon_faktury__id,
        klient__id , 
        data_wystawienia,
        kwota,
        niedoplata,
        odsetki,
        zaplacona)
  VALUES(
        v_id,
        v_numer_faktury,
        v_szablon_faktury__id,
        p_klient__id,
        SYSDATE,
        0,
        v_niedoplata,
        0,
        0);
    
    RETURN v_id;
    
    ELSE IF (v_count >0) THEN DBMS_OUTPUT.put_line('Faktura o numerze '||v_numer_faktury ||' juz istnieje');
    RETURN 0;
    ELSE DBMS_OUTPUT.put_line('Klient o podanym numerze ' || p_klient__id ||' nie istnieje');
    RETURN 0;
    END IF;
    END IF;
    
    EXCEPTION
        WHEN OTHERS THEN
        raise_application_error(-20001,'BLAD - Dodaj_fakture'||SQLCODE||' -ERROR- '||SQLERRM);
    
END;

/


/*
if typ_zdarzenia is null then id=id(nieznany)
if typ_zdarzenia is unknown then id=id(nieznany_nr(uk))
if identyfikator is null then do not insert [pass]
if identyfikator is unknown then add(identyfiaktor, prefix(uk), typ_urzadzenia(uk)) 
if prefix_miejsca is null then id=id(nieznany)
if prefix_miejsca is unknown then add(prefix)
if numer_obcy is null then insert null
if prefix_obcy is unknown then id=id(nieznany)
if czas_od/czas is null then do not insert [pass]
if dane/koszt is null then insert null
*/
CREATE or replace PROCEDURE zaladuj_plik (
 p_filename IN VARCHAR2,
 p_directory IN VARCHAR2 DEFAULT 'OPER_DIR',
 p_ignore_headerlines IN INTEGER DEFAULT 0,
 p_delimiter IN VARCHAR2 DEFAULT '|')
IS
 v_filehandle UTL_FILE.file_type;
 v_text VARCHAR2(32767);
 v_eof BOOLEAN := FALSE;
 v_fields DBMS_SQL.varchar2a; --tablica
 v_field_index INTEGER;
 v_length INTEGER;
 v_start INTEGER;
 v_index INTEGER;
 v_enclosed_start INTEGER;
 v_enclosed_end INTEGER;
 v_identyfikator__id INTEGER ;
 v_prefix__id_miejsca INTEGER ;
 v_prefix__id_obcy INTEGER ;
 V_TYP_ZDARZENIA__ID INTEGER;
 v_typ_urzadzenia__id INTEGER ;
 v_count INTEGER;
BEGIN
    v_filehandle := UTL_FILE.fopen(p_directory, p_filename, 'r', 32767);
     
    IF p_ignore_headerlines > 0 --poMIN
     THEN
        BEGIN
            FOR i IN 1 .. p_ignore_headerlines
                LOOP
                     UTL_FILE.get_line(v_filehandle, v_text);
                END LOOP;
        EXCEPTION
         WHEN NO_DATA_FOUND
            THEN
            v_eof := TRUE;
        END;
     END IF;
     
    WHILE NOT v_eof
     LOOP
     BEGIN
     DBMS_OUTPUT.put_line('------------------------------------------------------------------');
     UTL_FILE.get_line(v_filehandle, v_text);
     DBMS_OUTPUT.put_line('v_text=' || v_text);
     v_fields.delete;
     v_field_index := 0;
     v_length := LENGTH(v_text);
     v_start := 1;
     v_enclosed_start := INSTR(v_text, '"', 1);
     v_enclosed_end := INSTR(v_text, '"', v_enclosed_start + 1);
     
    WHILE (v_start <= v_length)
     LOOP 
         v_index := INSTR(v_text, p_delimiter, v_start);
         
        IF v_enclosed_end != 0
         AND v_index > v_enclosed_start
         AND v_index < v_enclosed_end
         THEN
         v_index := INSTR(v_text, p_delimiter, v_enclosed_end);
         v_enclosed_start := INSTR(v_text, '"', v_enclosed_end + 1);
         
        IF v_enclosed_start != 0
         THEN
         v_enclosed_end :=INSTR(v_text, '"', v_enclosed_start + 1);
         END IF;
         END IF;
         
        IF v_index = 0
         THEN
             v_fields(v_field_index) :=
             TRIM(LTRIM(RTRIM(SUBSTR(v_text, v_start), '"'), '"'));
             v_start := v_length + LENGTH(p_delimiter);
         ELSE
             v_fields(v_field_index) :=
             TRIM(
             LTRIM(
             RTRIM(
             SUBSTR(v_text, v_start, v_index - v_start),
             '"'),
             '"'));
             v_start := v_index + LENGTH(p_delimiter);
         END IF;
        v_field_index := v_field_index + 1;
     END LOOP;
    
    
    /***********************************************************
    sprawdzanie danych wejœciowych i uzupelnianie
    ************************************************************/
    IF ((v_fields(1) is NULL OR  v_fields(4) IS NULL) OR v_fields(5) IS NULL) 
    THEN 
        EXIT;
    END IF; 
    
    SELECT COUNT(*) INTO  v_count FROM typ_zdarzenia where typ_zdarzenia.id=v_fields(0); --typ zdarzenia
    IF v_count!=0 
    THEN 
        SELECT typ_zdarzenia.id  INTO  v_typ_zdarzenia__id  
        FROM typ_zdarzenia 
        where typ_zdarzenia.id=v_fields(0);
    ELSE IF v_fields(0) IS NULL
    THEN
        SELECT typ_zdarzenia.id INTO v_typ_zdarzenia__id
        from typ_zdarzenia 
        where typ_zdarzenia.nazwa='NIEZNANY';
    ELSE 
        v_typ_zdarzenia__id:=dodaj_typ_zdarzenia(V_fields(0), 'NIEZNANY_'||V_FIELDS(0),null);
    END IF;
    END IF;
    
    /*************************************************************/
    SELECT COUNT(*) INTO v_count from identyfikator where identyfikator.numer=v_fields(1);
    IF v_count=0 
    THEN 
        SELECT typ_urzadzenia.id into V_TYP_URZADZENIA__ID 
        FROM typ_URZADZENIA 
        WHERE typ_URZADZENIA.nazwa='NIEZNANY';
        v_identyfikator__id:= dodaj_identyfikator(v_fields(1), v_typ_urzadzenia__id);
    ELSE 
        SELECT identyfikator.id INTO v_identyfikator__id from identyfikator where identyfikator.numer=v_fields(1);
    END IF;
    
    /*************************************************************/
    
    SELECT COUNT(*) INTO  v_count FROM PREFIX WHERE v_fields(2) like (prefix.prefix||'%'); --prefix_miejsca
    IF v_count!=0 
    THEN 
        SELECT max(prefix.id)  INTO  v_prefix__id_miejsca
        FROM prefix
        WHERE v_fields(2) like (prefix.prefix||'%') order by LENGTH(prefix.prefix) desc;
    ELSE 
        IF v_fields(2) IS NULL 
        THEN
            SELECT prefix.id INTO v_prefix__id_miejsca
            from prefix 
            where prefix.prefix='NIEZNANY';
        ELSE 
            v_prefix__id_miejsca:=dodaj_prefix(V_FIELDS(2));
        END IF; 
    END IF;
    
    
    /*************************************************************/
    SELECT COUNT(*) INTO  v_count FROM PREFIX  WHERE v_fields(3) like (prefix.prefix||'%'); --prefix_obcy
    IF v_count!=0 
    THEN 
        SELECT max(prefix.id) INTO v_prefix__id_obcy
        FROM prefix 
        WHERE v_fields(3) like (prefix.prefix||'%') order by LENGTH(prefix.prefix) desc;
    ELSE 
        SELECT prefix.id INTO v_prefix__id_obcy
        from prefix 
        where prefix.prefix='NIEZNANY';
    END IF;
    
    /*************************************************************
     koniec sprawdzania i uzupelniania parametrow
     ************************************************************/
    
    
     INSERT
     INTO ZDARZENIE(TYP_ZDARZENIA__ID, --0
                    IDENTYFIKATOR__ID, --1
                    PREFIX__ID_MIEJSCA, --2
                    NUMER_OBCY, --3
                    PREFIX__ID, --3..
                    DATA_OD, --4
                    CZAS, --5
                    DANE, --6
                    KOSZT)--7
      VALUES (v_typ_zdarzenia__id,
             v_identyfikator__id,
             v_prefix__id_miejsca,
             v_fields(3),
             v_prefix__id_obcy,
             TO_TIMESTAMP(v_fields(4), 'DD-MM-RR HH24:MI:SS'),
             TO_DSINTERVAL(v_fields(5)),
             v_fields(6),
             v_fields(7)
             );
    
    DBMS_OUTPUT.put_line(
 '------------------------------------------------------------------');
 EXCEPTION
    WHEN NO_DATA_FOUND
    THEN 
            v_eof := TRUE;

    WHEN OTHERS
    THEN
        raise_application_error(-20001,'BLAD - zaladuj_plik-in'||SQLCODE||' -ERROR- '||SQLERRM);
 END;
 END LOOP;

EXCEPTION
    WHEN OTHERS
    THEN
        raise_application_error(-20001,'BLAD - zaladuj_plik'||SQLCODE||' -ERROR- '||SQLERRM);
    IF UTL_FILE.is_open(v_filehandle)
    THEN
        UTL_FILE.fclose(v_filehandle);
    END IF;
 
RAISE;
END zaladuj_plik;
 
/

CREATE or replace procedure przegladaj_pliki  
IS
    v_file VARCHAR2(100);

BEGIN 
    FOR rec in (SELECT column_value from table(list_files) where column_value like '%dat') 
    LOOP   
        v_file := SUBSTR(to_char(rec.column_value), INSTR(to_char(rec.column_value), '\', -1)+ LENGTH('\'));
        ZALADUJ_PLIK(v_file, 'OPER_DIR');
        UTL_FILE.FRENAME(
                            'OPER_DIR',
                            v_file, 
                            'TRASH_DIR',
                            v_file||'_'||TO_CHAR(SYSDATE)
                        );
    END LOOP;

END;
/
--'

CREATE OR REPLACE FUNCTION DODAJ_SZABLON_FAKTURY(
    p_nazwa                          VARCHAR2,
    p_naglowek                       VARCHAR2,
    p_tresc                          VARCHAR2,
    p_stopka                         VARCHAR2,
    p_podpis                         VARCHAR2,
    p_kraj__id                       NUMBER,
    p_typ_klienta                    NUMBER,
    p_sprzedawca                     VARCHAR2,
    p_odbiorca                       VARCHAR2,
    p_termin_platnosci               VARCHAR2,
    p_podsumowanie                   VARCHAR2,
    p_zbiorcza                       VARCHAR2,
    p_tabela_bilingowa               VARCHAR2 DEFAULT '',
	p_layout			             VARCHAR2,
	p_sql				             VARCHAR2
)
RETURN NUMBER
AS
    v_id number;
BEGIN
    SELECT szablon_faktury_seq.nextval INTO V_ID FROM dual;
    INSERT INTO SZABLON_FAKTURY VALUES (
        v_id,                             
        p_nazwa,
        p_naglowek,
        p_tresc,
        p_stopka,
        p_podpis,
        p_kraj__id,
        p_typ_klienta,
        p_sprzedawca,
        p_odbiorca,
        p_tabela_bilingowa,
        p_podsumowanie,
        p_zbiorcza,
        p_termin_platnosci,
		p_layout,
        p_sql);
    
	return v_id;
	
    EXCEPTION
     WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
         raise_application_error(-20001,'BLAD - DODAJ_SZABLON_FAKTURY '||SQLCODE||' -ERROR- '||SQLERRM);


END;
/