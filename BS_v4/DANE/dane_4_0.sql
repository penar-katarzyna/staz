-- USUWANIE DANYCH


CREATE OR REPLACE PROCEDURE usuwanie
IS
begin
for c in (select table_name, constraint_name from user_constraints where constraint_type='R') loop
execute immediate ('alter table '||c.table_name||' disable constraint '||c.constraint_name);
end loop;
for c in (select table_name from user_tables) loop
execute immediate ('truncate table '||c.table_name);
end loop;
for c in (select table_name, constraint_name from user_constraints where constraint_type='R') loop
execute immediate ('alter table '||c.table_name||' enable constraint '||c.constraint_name);
end loop;
End;
/

--call usuwanie();

-- Dodawanie Danych:

CREATE OR REPLACE PROCEDURE F_MIEJSCA
   IS
   V_KRAJ NUMBER;
   V_REGION NUMBER;
   V_MIASTO NUMBER;
   V_KOD NUMBER;
   V_PREF NUMBER;
   V_KLIENT NUMBER;
   V_KLIENT_B NUMBER;
   V_klient_edycja number;
BEGIN

V_PREF:=DODAJ_PREFIX('0048');
	V_KRAJ:=dodaj_kraj(V_PREF,'Polska','PLN');
		V_REGION:=DODAJ_REGION(V_KRAJ,'MALOPOLSKIE');
			V_MIASTO:=DODAJ_MIASTO(V_REGION,'KRAKÓW');
				V_KOD:=DODAJ_KOD(V_MIASTO,'30-050');
					V_KLIENT:=DODAJ_KLIENT(V_KOD,'Józek','Nowak','Długa','45/23a','84050845678','jozek@wp.pl','haslo');
					V_KLIENT:=DODAJ_KLIENT(V_KOD,'Józek','Nowak','Długa','45/23a','84050845678','joze!@#$','haslo');
					V_KLIENT:=DODAJ_KLIENT_BIZNESOWY(null,V_KOD,'JózkoPOL','Długa','48/21c','78984004578','jozek@jozkopol.pl','haslo');
					V_KLIENT:=DODAJ_KLIENT_BIZNESOWY(null,V_KOD,'JózkoPOL','Długa','48/21c','78984004578','jozekjozkopol.pl','haslo');			
				V_KOD:=DODAJ_KOD(V_MIASTO,'30-051');
				V_KOD:=DODAJ_KOD(V_MIASTO,'30-052');
				V_KOD:=DODAJ_KOD(V_MIASTO,'30-053');
				V_KOD:=DODAJ_KOD(V_MIASTO,'30-054');
				V_KOD:=DODAJ_KOD(V_MIASTO,'30-055');
					V_KLIENT:=DODAJ_KLIENT(V_KOD,'Adam','Nowak','Długa','45/2','84050845678','adam@wp.pl','haslo');
				V_KOD:=DODAJ_KOD(V_MIASTO,'31-070');
				V_KOD:=DODAJ_KOD(V_MIASTO,'31-071');
				V_KOD:=DODAJ_KOD(V_MIASTO,'31-072');
				V_KOD:=DODAJ_KOD(V_MIASTO,'31-073');
					V_KLIENT:=DODAJ_KLIENT(V_KOD,'Józek','Nowak','Krótka','35/23a','34050845678','jozek@onet.pl','haslo');
				V_KOD:=DODAJ_KOD(V_MIASTO,'31-074');
				V_KOD:=DODAJ_KOD(V_MIASTO,'31-075');
					V_KLIENT:=DODAJ_KLIENT_BIZNESOWY(null,V_KOD,'BiedoPOL SA','Lipna','13','78934004568','info@biedopol.pl','haslo');
			V_MIASTO:=DODAJ_MIASTO(V_REGION,'MYŚLENICE');
				V_KOD:=DODAJ_KOD(V_MIASTO,'32-050');
				V_KOD:=DODAJ_KOD(V_MIASTO,'32-051');
					V_KLIENT_B:=DODAJ_KLIENT_BIZNESOWY(null,V_KOD,'WCPOL SA','Wodna','132','99934004568','info@wcpol.pl','haslo');
					V_KLIENT:=DODAJ_KLIENT_BIZNESOWY(V_KLIENT_B,V_KOD,'WCPOL SA biuro','Wodna','133','99934004568','biuro@wcpol.pl','haslo');
					V_KLIENT:=DODAJ_KLIENT_BIZNESOWY(V_KLIENT_B,V_KOD,'WCPOL SA magazyn','Wodna','134','99934004568','magazyn@wcpol.pl','haslo');
				V_KOD:=DODAJ_KOD(V_MIASTO,'32-052');
				V_KOD:=DODAJ_KOD(V_MIASTO,'32-053');
				V_KOD:=DODAJ_KOD(V_MIASTO,'32-054');
				V_KOD:=DODAJ_KOD(V_MIASTO,'32-055');
				V_KOD:=DODAJ_KOD(V_MIASTO,'33-031');
				V_KOD:=DODAJ_KOD(V_MIASTO,'33-030');
				V_KOD:=DODAJ_KOD(V_MIASTO,'33-032');
				V_KOD:=DODAJ_KOD(V_MIASTO,'33-033');
					V_KLIENT:=DODAJ_KLIENT(V_KOD,'Adam','Żak','Kolorowa','45/2','84040845678','adam2@wp.pl','haslo');
				V_KOD:=DODAJ_KOD(V_MIASTO,'33-034');
				V_KOD:=DODAJ_KOD(V_MIASTO,'33-035');
		V_REGION:=DODAJ_REGION(V_KRAJ,'ŁÓDZKIE');
			V_MIASTO:=DODAJ_MIASTO(V_REGION,'ŁÓDŹ');
				V_KOD:=DODAJ_KOD(V_MIASTO,'60-030');
					V_KLIENT:=DODAJ_KLIENT_BIZNESOWY(V_KLIENT_B,V_KOD,'WCPOL SA Łódź','Stalowa','14/99d','99934004568','lodz@wcpol.pl','haslo');
				V_KOD:=DODAJ_KOD(V_MIASTO,'60-031');
				V_KOD:=DODAJ_KOD(V_MIASTO,'60-032');
				V_KOD:=DODAJ_KOD(V_MIASTO,'60-033');
				V_KOD:=DODAJ_KOD(V_MIASTO,'60-034');
				V_KOD:=DODAJ_KOD(V_MIASTO,'60-035');
				V_KOD:=DODAJ_KOD(V_MIASTO,'61-270');
				V_KOD:=DODAJ_KOD(V_MIASTO,'61-271');
				V_KOD:=DODAJ_KOD(V_MIASTO,'61-272');
				V_KOD:=DODAJ_KOD(V_MIASTO,'61-273');
				V_KOD:=DODAJ_KOD(V_MIASTO,'61-274');
				V_KOD:=DODAJ_KOD(V_MIASTO,'61-275');
			V_MIASTO:=DODAJ_MIASTO(V_REGION,'BUKOWIEC');
				V_KOD:=DODAJ_KOD(V_MIASTO,'62-080');
				V_KOD:=DODAJ_KOD(V_MIASTO,'62-081');
				V_KOD:=DODAJ_KOD(V_MIASTO,'62-082');
				V_KOD:=DODAJ_KOD(V_MIASTO,'62-083');
				V_KOD:=DODAJ_KOD(V_MIASTO,'62-084');
				V_KOD:=DODAJ_KOD(V_MIASTO,'62-085');
				V_KOD:=DODAJ_KOD(V_MIASTO,'63-041');
					--V_KLIENT:=DODAJ_KLIENT(V_KOD,'Karol','Kowalski','Długa','45/2','84053455678','kkrol@interia.pl');
				V_KOD:=DODAJ_KOD(V_MIASTO,'63-040');
				V_KOD:=DODAJ_KOD(V_MIASTO,'63-042');
				V_KOD:=DODAJ_KOD(V_MIASTO,'63-043');
				V_KOD:=DODAJ_KOD(V_MIASTO,'63-044');
				V_KOD:=DODAJ_KOD(V_MIASTO,'63-045');
		V_REGION:=DODAJ_REGION(V_KRAJ,'DOLNOŚLĄŚKIE');
			V_MIASTO:=DODAJ_MIASTO(V_REGION,'WROCŁAW');
				V_KOD:=DODAJ_KOD(V_MIASTO,'10-090');
				V_KOD:=DODAJ_KOD(V_MIASTO,'10-091');
				V_KOD:=DODAJ_KOD(V_MIASTO,'10-092');
				V_KOD:=DODAJ_KOD(V_MIASTO,'10-093');
				V_KOD:=DODAJ_KOD(V_MIASTO,'10-094');
				V_KOD:=DODAJ_KOD(V_MIASTO,'10-095');
				V_KOD:=DODAJ_KOD(V_MIASTO,'11-290');
				V_KOD:=DODAJ_KOD(V_MIASTO,'11-291');
				V_KOD:=DODAJ_KOD(V_MIASTO,'11-292');
				V_KOD:=DODAJ_KOD(V_MIASTO,'11-293');
				V_KOD:=DODAJ_KOD(V_MIASTO,'11-294');
				V_KOD:=DODAJ_KOD(V_MIASTO,'11-295');
			V_MIASTO:=DODAJ_MIASTO(V_REGION,'KRZYKI');
				V_KOD:=DODAJ_KOD(V_MIASTO,'12-080');
				V_KOD:=DODAJ_KOD(V_MIASTO,'12-081');
				V_KOD:=DODAJ_KOD(V_MIASTO,'12-082');
				V_KOD:=DODAJ_KOD(V_MIASTO,'12-083');
				V_KOD:=DODAJ_KOD(V_MIASTO,'12-084');
				V_KOD:=DODAJ_KOD(V_MIASTO,'12-085');
				V_KOD:=DODAJ_KOD(V_MIASTO,'13-041');
				V_KOD:=DODAJ_KOD(V_MIASTO,'13-040');
				V_KOD:=DODAJ_KOD(V_MIASTO,'13-042');
					V_KLIENT:=DODAJ_KLIENT(V_KOD,'Karol','Mały','Długa','45/2','840534545678','kkrol@interia.pl','haslo');
					V_KLIENT:=DODAJ_KLIENT(V_KOD,'Paweł','Kowalski','Mickiewicza','15/2','83353455678','pkow@interia.pl','haslo');
					V_KLIENT:=DODAJ_KLIENT(V_KOD,'Jerzy','Domagalski','Zawiła','42','84353446678','jarek@onet.pl','haslo');
					V_KLIENT:=DODAJ_KLIENT(V_KOD,'Karolina','Kowalska','Długa','4','64553455678','kkowalska@interia.pl','haslo');
					V_KLIENT:=DODAJ_KLIENT(V_KOD,'Marta','Kowalski','Długa','4/2','74053455678','martak@interia.pl','haslo');
v_klient_edycja:=edytuj_klient(V_KLIENT,V_KOD,'miet','nowy','szybka','666','3242893468','mietek@nowy.pl', 'bardzoTrudneHaslo');
				V_KOD:=DODAJ_KOD(V_MIASTO,'13-043');
				V_KOD:=DODAJ_KOD(V_MIASTO,'13-044');
				V_KOD:=DODAJ_KOD(V_MIASTO,'13-045');
				
V_PREF:=DODAJ_PREFIX('0380');
	V_KRAJ:=dodaj_kraj(V_PREF,'UKRAINA','UAH');
		V_REGION:=DODAJ_REGION(V_KRAJ,'KIJOWSKIE');
			V_MIASTO:=DODAJ_MIASTO(V_REGION,'KIJÓW');
				V_KOD:=DODAJ_KOD(V_MIASTO,'307050');
				V_KOD:=DODAJ_KOD(V_MIASTO,'307051');
				V_KOD:=DODAJ_KOD(V_MIASTO,'307052');
				V_KOD:=DODAJ_KOD(V_MIASTO,'307053');
				V_KOD:=DODAJ_KOD(V_MIASTO,'307054');
				V_KOD:=DODAJ_KOD(V_MIASTO,'307055');
				V_KOD:=DODAJ_KOD(V_MIASTO,'317070');
				V_KOD:=DODAJ_KOD(V_MIASTO,'317071');
					V_KLIENT:=DODAJ_KLIENT_BIZNESOWY(V_KLIENT_B,V_KOD,'WCPOL SA Ukraina','Wodna','133','99934004568','ukraina@wcpol.pl','haslo');
				V_KOD:=DODAJ_KOD(V_MIASTO,'317072');
				V_KOD:=DODAJ_KOD(V_MIASTO,'317073');
				V_KOD:=DODAJ_KOD(V_MIASTO,'317074');
					V_KLIENT_B:=DODAJ_KLIENT_BIZNESOWY(null,V_KOD,'WCUK SA','Kijowska','672','59934004568','info@wcuk.ua','haslo');
					V_KLIENT:=DODAJ_KLIENT_BIZNESOWY(V_KLIENT_B,V_KOD,'WCUK SA biuro','Ukraińska','673','59934004568','biuro@wcuk.ua','haslo');
					V_KLIENT:=DODAJ_KLIENT_BIZNESOWY(V_KLIENT_B,V_KOD,'WCUK SA magazyn','Przemytnicza','674','59934004568','magazyn@wcuk.ua','haslo');
				V_KOD:=DODAJ_KOD(V_MIASTO,'317075');
			V_MIASTO:=DODAJ_MIASTO(V_REGION,'BOYARKA');
				V_KOD:=DODAJ_KOD(V_MIASTO,'327650');
				V_KOD:=DODAJ_KOD(V_MIASTO,'327651');
				V_KOD:=DODAJ_KOD(V_MIASTO,'327652');
					V_KLIENT:=DODAJ_KLIENT(V_KOD,'Karol','Mały','Długa','45/2','840534545678','kkrol@interia.pl','haslo');
					V_KLIENT:=DODAJ_KLIENT(V_KOD,'Paweł','Kowalski','Mickiewicza','15/2','83353455678','pkow@interia.pl','haslo');
					V_KLIENT:=DODAJ_KLIENT(V_KOD,'Jerzy','Domagalski','Zawiła','42','84353446678','jarek@onet.pl','haslo');
					V_KLIENT:=DODAJ_KLIENT(V_KOD,'Karolina','Kowalska','Długa','4','64553455678','kkowalska@interia.pl','haslo');
					V_KLIENT:=DODAJ_KLIENT(V_KOD,'Marta','Kowalski','Długa','4/2','74053455678','martak@interia.pl','haslo');
				V_KOD:=DODAJ_KOD(V_MIASTO,'327653');
				V_KOD:=DODAJ_KOD(V_MIASTO,'327654');
				V_KOD:=DODAJ_KOD(V_MIASTO,'327655');
				V_KOD:=DODAJ_KOD(V_MIASTO,'337631');
				V_KOD:=DODAJ_KOD(V_MIASTO,'337630');
				V_KOD:=DODAJ_KOD(V_MIASTO,'337632');
				V_KOD:=DODAJ_KOD(V_MIASTO,'337633');
				V_KOD:=DODAJ_KOD(V_MIASTO,'337634');
				V_KOD:=DODAJ_KOD(V_MIASTO,'337635');
		V_REGION:=DODAJ_REGION(V_KRAJ,'BRACŁAWSKIE');
			V_MIASTO:=DODAJ_MIASTO(V_REGION,'BRACŁAW');
				V_KOD:=DODAJ_KOD(V_MIASTO,'604030');
				V_KOD:=DODAJ_KOD(V_MIASTO,'604031');
				V_KOD:=DODAJ_KOD(V_MIASTO,'604032');
				V_KOD:=DODAJ_KOD(V_MIASTO,'604033');
				V_KOD:=DODAJ_KOD(V_MIASTO,'604034');
				V_KOD:=DODAJ_KOD(V_MIASTO,'604035');
					V_KLIENT:=DODAJ_KLIENT(V_KOD,'Jerzy','Domagała','Prosta','2','84352236678','jarus@stronka.ua','haslo');
				V_KOD:=DODAJ_KOD(V_MIASTO,'614270');
				V_KOD:=DODAJ_KOD(V_MIASTO,'614271');
				V_KOD:=DODAJ_KOD(V_MIASTO,'614272');
				V_KOD:=DODAJ_KOD(V_MIASTO,'614273');
				V_KOD:=DODAJ_KOD(V_MIASTO,'614274');
				V_KOD:=DODAJ_KOD(V_MIASTO,'614275');
			V_MIASTO:=DODAJ_MIASTO(V_REGION,'WINNICA');
				V_KOD:=DODAJ_KOD(V_MIASTO,'628080');
				V_KOD:=DODAJ_KOD(V_MIASTO,'628081');
				V_KOD:=DODAJ_KOD(V_MIASTO,'628082');
				V_KOD:=DODAJ_KOD(V_MIASTO,'628083');
				V_KOD:=DODAJ_KOD(V_MIASTO,'628084');
				V_KOD:=DODAJ_KOD(V_MIASTO,'628085');
				V_KOD:=DODAJ_KOD(V_MIASTO,'638041');
				V_KOD:=DODAJ_KOD(V_MIASTO,'638040');
				V_KOD:=DODAJ_KOD(V_MIASTO,'638042');
				V_KOD:=DODAJ_KOD(V_MIASTO,'638043');
				V_KOD:=DODAJ_KOD(V_MIASTO,'638044');
				V_KOD:=DODAJ_KOD(V_MIASTO,'638045');
v_klient_edycja:=edytuj_klient(V_KLIENT,V_KOD,'Maniek','Pompka','Ćwiartki','3/4','3246456','maniek.pompka@email.pl', 'jeszczeTrudniejszeHaslo');



EXCEPTION
	WHEN OTHERS THEN
	raise_application_error(-20001,'BLAD - '||SQLCODE||' -ERROR- '||SQLERRM);
END;
/

--call F_MIEJSCA();


CREATE OR REPLACE PROCEDURE F_KRAJE
   IS
   V_kraj number;
   V_PREF NUMBER;
BEGIN
V_PREF := dodaj_prefix('0048');
V_kraj := dodaj_kraj(V_PREF,'POLSKA', 'PLN');
V_PREF := dodaj_prefix('00380');
V_kraj := dodaj_kraj(V_PREF,'UKRAINA', 'UAH');
V_PREF := dodaj_prefix('0093');
V_kraj := dodaj_kraj(V_PREF,'AFGANISTAN', null);
V_PREF := dodaj_prefix('001907');
V_kraj := dodaj_kraj(V_PREF,'ALASKA', null);
V_PREF := dodaj_prefix('00355');
V_kraj := dodaj_kraj(V_PREF,'ALBANIA', null);
V_PREF := dodaj_prefix('00213');
V_kraj := dodaj_kraj(V_PREF,'ALGIERIA', null);
V_PREF := dodaj_prefix('00376');
V_kraj := dodaj_kraj(V_PREF,'ANDORA', null);
V_PREF := dodaj_prefix('00244');
V_kraj := dodaj_kraj(V_PREF,'ANGOLA', null);
V_PREF := dodaj_prefix('001264');
V_kraj := dodaj_kraj(V_PREF,'ANGUILLA', null);
V_PREF := dodaj_prefix('00966');
V_kraj := dodaj_kraj(V_PREF,'ARABIA SAUDYJSKA', null);
V_PREF := dodaj_prefix('0054');
V_kraj := dodaj_kraj(V_PREF,'ARGENTYNA', null);
V_PREF := dodaj_prefix('00374');
V_kraj := dodaj_kraj(V_PREF,'ARMENIA', null);
V_PREF := dodaj_prefix('00297');
V_kraj := dodaj_kraj(V_PREF,'ARUBA', null);
V_PREF := dodaj_prefix('0061');
V_kraj := dodaj_kraj(V_PREF,'AUSTRALIA', null);
V_PREF := dodaj_prefix('0043');
V_kraj := dodaj_kraj(V_PREF,'AUSTRIA', null);
V_PREF := dodaj_prefix('00994');
V_kraj := dodaj_kraj(V_PREF,'AZERBEJDŻAN', null);
V_PREF := dodaj_prefix('001242');
V_kraj := dodaj_kraj(V_PREF,'BAHAMA', null);
V_PREF := dodaj_prefix('00973');
V_kraj := dodaj_kraj(V_PREF,'BAHRAJN', null);
V_PREF := dodaj_prefix('00880');
V_kraj := dodaj_kraj(V_PREF,'BANGLADESZ', null);
V_PREF := dodaj_prefix('001246');
V_kraj := dodaj_kraj(V_PREF,'BARBADOS', null);
V_PREF := dodaj_prefix('00680');
V_kraj := dodaj_kraj(V_PREF,'BELAU', null);
V_PREF := dodaj_prefix('0032');
V_kraj := dodaj_kraj(V_PREF,'BELGIA', null);
V_PREF := dodaj_prefix('00501');
V_kraj := dodaj_kraj(V_PREF,'BELIZE', null);
V_PREF := dodaj_prefix('00229');
V_kraj := dodaj_kraj(V_PREF,'BENIN', null);
V_PREF := dodaj_prefix('001441');
V_kraj := dodaj_kraj(V_PREF,'BERMUDY', null);
V_PREF := dodaj_prefix('00975');
V_kraj := dodaj_kraj(V_PREF,'BUTAN', null);
V_PREF := dodaj_prefix('00375');
V_kraj := dodaj_kraj(V_PREF,'BIAŁORUŚ', null);
V_PREF := dodaj_prefix('00591');
V_kraj := dodaj_kraj(V_PREF,'BOLIWIA', null);
V_PREF := dodaj_prefix('00387');
V_kraj := dodaj_kraj(V_PREF,'BOŚNIA I HERCEGOWINA', null);
V_PREF := dodaj_prefix('00267');
V_kraj := dodaj_kraj(V_PREF,'BOTSWANA', null);
V_PREF := dodaj_prefix('0055');
V_kraj := dodaj_kraj(V_PREF,'BRAZYLIA', null);
V_PREF := dodaj_prefix('00673');
V_kraj := dodaj_kraj(V_PREF,'BRUNEI', null);
V_PREF := dodaj_prefix('00359');
V_kraj := dodaj_kraj(V_PREF,'BUŁGARIA', null);
V_PREF := dodaj_prefix('00226');
V_kraj := dodaj_kraj(V_PREF,'BURKINA FASO', null);
V_PREF := dodaj_prefix('00257');
V_kraj := dodaj_kraj(V_PREF,'BURUNDI', null);
V_PREF := dodaj_prefix('0056');
V_kraj := dodaj_kraj(V_PREF,'CHILE', null);
V_PREF := dodaj_prefix('0086');
V_kraj := dodaj_kraj(V_PREF,'CHINY', null);
V_PREF := dodaj_prefix('00385');
V_kraj := dodaj_kraj(V_PREF,'CHORWACJA', null);
V_PREF := dodaj_prefix('00357');
V_kraj := dodaj_kraj(V_PREF,'CYPR', null);
V_PREF := dodaj_prefix('00235');
V_kraj := dodaj_kraj(V_PREF,'CZAD', null);
V_PREF := dodaj_prefix('00420');
V_kraj := dodaj_kraj(V_PREF,'CZECHY', null);
V_PREF := dodaj_prefix('0045');
V_kraj := dodaj_kraj(V_PREF,'DANIA', null);
V_PREF := dodaj_prefix('001767');
V_kraj := dodaj_kraj(V_PREF,'DOMINIKA', null);
V_PREF := dodaj_prefix('1809');
V_kraj := dodaj_kraj(V_PREF,'DOMINIKANA', null);
V_PREF := dodaj_prefix('00253');
V_kraj := dodaj_kraj(V_PREF,'DZIBUTI', null);
V_PREF := dodaj_prefix('0020');
V_kraj := dodaj_kraj(V_PREF,'EGIPT', null);
V_PREF := dodaj_prefix('00593');
V_kraj := dodaj_kraj(V_PREF,'EKWADOR', null);
V_PREF := dodaj_prefix('00291');
V_kraj := dodaj_kraj(V_PREF,'ERYTREA', null);
V_PREF := dodaj_prefix('00372');
V_kraj := dodaj_kraj(V_PREF,'ESTONIA', null);
V_PREF := dodaj_prefix('00251');
V_kraj := dodaj_kraj(V_PREF,'ETIOPIA', null);
V_PREF := dodaj_prefix('00500');
V_kraj := dodaj_kraj(V_PREF,'FALKLANDY', null);
V_PREF := dodaj_prefix('00679');
V_kraj := dodaj_kraj(V_PREF,'FIDŻI', null);
V_PREF := dodaj_prefix('0063');
V_kraj := dodaj_kraj(V_PREF,'FILIPINY', null);
V_PREF := dodaj_prefix('00358');
V_kraj := dodaj_kraj(V_PREF,'FINLANDIA', null);
V_PREF := dodaj_prefix('0033');
V_kraj := dodaj_kraj(V_PREF,'FRANCJA', null);
V_PREF := dodaj_prefix('00241');
V_kraj := dodaj_kraj(V_PREF,'GABON', null);
V_PREF := dodaj_prefix('00220');
V_kraj := dodaj_kraj(V_PREF,'GAMBIA', null);
V_PREF := dodaj_prefix('00233');
V_kraj := dodaj_kraj(V_PREF,'GHANA', null);
V_PREF := dodaj_prefix('00350');
V_kraj := dodaj_kraj(V_PREF,'GIBRALTAR', null);
V_PREF := dodaj_prefix('0030');
V_kraj := dodaj_kraj(V_PREF,'GRECJA', null);
V_PREF := dodaj_prefix('001473');
V_kraj := dodaj_kraj(V_PREF,'GRENADA', null);
V_PREF := dodaj_prefix('00299');
V_kraj := dodaj_kraj(V_PREF,'GRENLANDIA', null);
V_PREF := dodaj_prefix('00995');
V_kraj := dodaj_kraj(V_PREF,'GRUZJA', null);
V_PREF := dodaj_prefix('001671');
V_kraj := dodaj_kraj(V_PREF,'GUAM', null);
V_PREF := dodaj_prefix('00592');
V_kraj := dodaj_kraj(V_PREF,'GUJANA', null);
V_PREF := dodaj_prefix('00590');
V_kraj := dodaj_kraj(V_PREF,'GWADELUPA', null);
V_PREF := dodaj_prefix('00502');
V_kraj := dodaj_kraj(V_PREF,'GWATEMALA', null);
V_PREF := dodaj_prefix('00224');
V_kraj := dodaj_kraj(V_PREF,'GWINEA (REPUBLIKA)', null);
V_PREF := dodaj_prefix('00245');
V_kraj := dodaj_kraj(V_PREF,'GWINEA BISSAU', null);
V_PREF := dodaj_prefix('00240');
V_kraj := dodaj_kraj(V_PREF,'GWINEA RÓWNIKOWA', null);
V_PREF := dodaj_prefix('00509');
V_kraj := dodaj_kraj(V_PREF,'HAITI', null);
V_PREF := dodaj_prefix('001808');
V_kraj := dodaj_kraj(V_PREF,'HAWAJE', null);
V_PREF := dodaj_prefix('0034');
V_kraj := dodaj_kraj(V_PREF,'HISZPANIA', null);
V_PREF := dodaj_prefix('0031');
V_kraj := dodaj_kraj(V_PREF,'HOLANDIA', null);
V_PREF := dodaj_prefix('00504');
V_kraj := dodaj_kraj(V_PREF,'HONDURAS', null);
V_PREF := dodaj_prefix('00852');
V_kraj := dodaj_kraj(V_PREF,'HONG-KONG', null);
V_PREF := dodaj_prefix('0091');
V_kraj := dodaj_kraj(V_PREF,'INDIE', null);
V_PREF := dodaj_prefix('0062');
V_kraj := dodaj_kraj(V_PREF,'INDONEZJA', null);
V_PREF := dodaj_prefix('00964');
V_kraj := dodaj_kraj(V_PREF,'IRAK', null);
V_PREF := dodaj_prefix('0098');
V_kraj := dodaj_kraj(V_PREF,'IRAN', null);
v_PREF := dodaj_prefix('00353');
V_kraj := dodaj_kraj(V_PREF,'IRLANDIA', null);
V_PREF := dodaj_prefix('00354');
V_kraj := dodaj_kraj(V_PREF,'ISLANDIA', null);
V_PREF := dodaj_prefix('00972');
V_kraj := dodaj_kraj(V_PREF,'IZRAEL', null);
V_PREF := dodaj_prefix('001876');
V_kraj := dodaj_kraj(V_PREF,'JAMAJKA', null);
V_PREF := dodaj_prefix('0081');
V_kraj := dodaj_kraj(V_PREF,'JAPONIA', null);
V_PREF := dodaj_prefix('00967');
V_kraj := dodaj_kraj(V_PREF,'JEMEN', null);
V_PREF := dodaj_prefix('00962');
V_kraj := dodaj_kraj(V_PREF,'JORDANIA', null);
V_PREF := dodaj_prefix('001345');
V_kraj := dodaj_kraj(V_PREF,'KAJMANY', null);
V_PREF := dodaj_prefix('00855');
V_kraj := dodaj_kraj(V_PREF,'KAMBODŻA', null);
V_PREF := dodaj_prefix('00237');
V_kraj := dodaj_kraj(V_PREF,'KAMERUN', null);
V_PREF := dodaj_prefix('001');
V_kraj := dodaj_kraj(V_PREF,'KANADA', null);
V_PREF := dodaj_prefix('0034');
V_kraj := dodaj_kraj(V_PREF,'KANARYJSKIE WYSPY', null);
V_PREF := dodaj_prefix('00974');
V_kraj := dodaj_kraj(V_PREF,'KATAR', null);
V_PREF := dodaj_prefix('007');
V_kraj := dodaj_kraj(V_PREF,'KAZACHSTAN', null);
V_PREF := dodaj_prefix('00254');
V_kraj := dodaj_kraj(V_PREF,'KENIA', null);
V_PREF := dodaj_prefix('00996');
V_kraj := dodaj_kraj(V_PREF,'KIRGISTAN', null);
V_PREF := dodaj_prefix('00686');
V_kraj := dodaj_kraj(V_PREF,'KIRIBATI', null);
V_PREF := dodaj_prefix('0057');
V_kraj := dodaj_kraj(V_PREF,'KOLUMBIA', null);
V_PREF := dodaj_prefix('00269');
V_kraj := dodaj_kraj(V_PREF,'KOMORY (WYSPY)', null);
V_PREF := dodaj_prefix('00242');
V_kraj := dodaj_kraj(V_PREF,'KONGO', null);
V_PREF := dodaj_prefix('00243');
V_kraj := dodaj_kraj(V_PREF,'KONGO REP.DEM.', null);
V_PREF := dodaj_prefix('0082');
V_kraj := dodaj_kraj(V_PREF,'KOREA PŁD.', null);
V_PREF := dodaj_prefix('00850');
V_kraj := dodaj_kraj(V_PREF,'KOREAŃSKA REP.LUD.DEM.', null);
V_PREF := dodaj_prefix('00506');
V_kraj := dodaj_kraj(V_PREF,'KOSTARYKA', null);
V_PREF := dodaj_prefix('0053');
V_kraj := dodaj_kraj(V_PREF,'KUBA', null);
V_PREF := dodaj_prefix('00965');
V_kraj := dodaj_kraj(V_PREF,'KUWEJT', null);
V_PREF := dodaj_prefix('00856');
V_kraj := dodaj_kraj(V_PREF,'LAOS', null);
V_PREF := dodaj_prefix('00266');
V_kraj := dodaj_kraj(V_PREF,'LESOTHO', null);
V_PREF := dodaj_prefix('00961');
V_kraj := dodaj_kraj(V_PREF,'LIBAN', null);
V_PREF := dodaj_prefix('00231');
V_kraj := dodaj_kraj(V_PREF,'LIBERIA', null);
V_PREF := dodaj_prefix('00218');
V_kraj := dodaj_kraj(V_PREF,'LIBIA', null);
V_PREF := dodaj_prefix('00352');
V_PREF := dodaj_prefix('00423');
V_kraj := dodaj_kraj(V_PREF,'LICHTENSTEIN', null);
V_PREF := dodaj_prefix('00370');
V_kraj := dodaj_kraj(V_PREF,'LITWA', null);
V_PREF := dodaj_prefix('00352');
V_kraj := dodaj_kraj(V_PREF,'LUXEMBURG', null);
V_PREF := dodaj_prefix('00371');
V_kraj := dodaj_kraj(V_PREF,'ŁOTWA', null);
V_PREF := dodaj_prefix('00389');
V_kraj := dodaj_kraj(V_PREF,'MACEDONIA', null);
V_PREF := dodaj_prefix('00261');
V_kraj := dodaj_kraj(V_PREF,'MADAGASKAR', null);
V_PREF := dodaj_prefix('00853');
V_kraj := dodaj_kraj(V_PREF,'MAKAO', null);
V_PREF := dodaj_prefix('00265');
V_kraj := dodaj_kraj(V_PREF,'MALAWI', null);
V_PREF := dodaj_prefix('00960');
V_kraj := dodaj_kraj(V_PREF,'MALEDIWY', null);
V_PREF := dodaj_prefix('0060');
V_kraj := dodaj_kraj(V_PREF,'MALEZJA', null);
V_PREF := dodaj_prefix('00223');
V_kraj := dodaj_kraj(V_PREF,'MALI', null);
V_PREF := dodaj_prefix('00356');
V_kraj := dodaj_kraj(V_PREF,'MALTA', null);
V_PREF := dodaj_prefix('00212');
V_kraj := dodaj_kraj(V_PREF,'MAROKO', null);
V_PREF := dodaj_prefix('00692');
V_kraj := dodaj_kraj(V_PREF,'MARSCHALA WYSPY', null);
V_PREF := dodaj_prefix('00596');
V_kraj := dodaj_kraj(V_PREF,'MARTYNIKA', null);
V_PREF := dodaj_prefix('00222');
V_kraj := dodaj_kraj(V_PREF,'MAURETANIA', null);
V_PREF := dodaj_prefix('00230');
V_kraj := dodaj_kraj(V_PREF,'MAURITIUS', null);
V_PREF := dodaj_prefix('0052');
V_kraj := dodaj_kraj(V_PREF,'MEKSYK', null);
V_PREF := dodaj_prefix('00691');
V_kraj := dodaj_kraj(V_PREF,'MIKRONEZJA', null);
V_PREF := dodaj_prefix('00373');
V_kraj := dodaj_kraj(V_PREF,'MOŁDAWIA', null);
V_PREF := dodaj_prefix('00377');
V_kraj := dodaj_kraj(V_PREF,'MONAKO', null);
V_PREF := dodaj_prefix('00976');
V_kraj := dodaj_kraj(V_PREF,'MONGOLIA', null);
V_PREF := dodaj_prefix('001664');
V_kraj := dodaj_kraj(V_PREF,'MONTSERRAT', null);
V_PREF := dodaj_prefix('00258');
V_kraj := dodaj_kraj(V_PREF,'MOZAMBIK', null);
V_PREF := dodaj_prefix('0095');
V_kraj := dodaj_kraj(V_PREF,'MYANMAR', null);
V_PREF := dodaj_prefix('00264');
V_kraj := dodaj_kraj(V_PREF,'NAMIBIA', null);
V_PREF := dodaj_prefix('00674');
V_kraj := dodaj_kraj(V_PREF,'NAURU', null);
V_PREF := dodaj_prefix('00977');
V_kraj := dodaj_kraj(V_PREF,'NEPAL', null);
V_PREF := dodaj_prefix('0049');
V_kraj := dodaj_kraj(V_PREF,'NIEMCY', null);
V_PREF := dodaj_prefix('00227');
V_kraj := dodaj_kraj(V_PREF,'NIGER', null);
V_PREF := dodaj_prefix('00234');
V_kraj := dodaj_kraj(V_PREF,'NIGERIA', null);
V_PREF := dodaj_prefix('00505');
V_kraj := dodaj_kraj(V_PREF,'NIKARAGUA', null);
V_PREF := dodaj_prefix('00683');
V_kraj := dodaj_kraj(V_PREF,'NIUE', null);
V_PREF := dodaj_prefix('00672');
V_kraj := dodaj_kraj(V_PREF,'NORFOLK WYSPA', null);
V_PREF := dodaj_prefix('0047');
V_kraj := dodaj_kraj(V_PREF,'NORWEGIA', null);
V_PREF := dodaj_prefix('00687');
V_kraj := dodaj_kraj(V_PREF,'NOWA KALEDONIA', null);
V_PREF := dodaj_prefix('0064');
V_kraj := dodaj_kraj(V_PREF,'NOWA ZELANDIA', null);
V_PREF := dodaj_prefix('00968');
V_kraj := dodaj_kraj(V_PREF,'OMAN', null);
V_PREF := dodaj_prefix('0092');
V_kraj := dodaj_kraj(V_PREF,'PAKISTAN', null);
V_PREF := dodaj_prefix('00970');
V_kraj := dodaj_kraj(V_PREF,'PALESTYNA', null);
V_PREF := dodaj_prefix('00507');
V_kraj := dodaj_kraj(V_PREF,'PANAMA', null);
V_PREF := dodaj_prefix('00675');
V_kraj := dodaj_kraj(V_PREF,'PAPUA NOWA GWINEA', null);
V_PREF := dodaj_prefix('00595');
V_kraj := dodaj_kraj(V_PREF,'PARAGWAJ', null);
V_PREF := dodaj_prefix('0051');
V_kraj := dodaj_kraj(V_PREF,'PERU', null);
V_PREF := dodaj_prefix('00689');
V_kraj := dodaj_kraj(V_PREF,'POLINEZJA FRANCUSKA', null);
V_PREF := dodaj_prefix('00351');
V_kraj := dodaj_kraj(V_PREF,'PORTUGALIA', null);
V_PREF := dodaj_prefix('001787');
V_kraj := dodaj_kraj(V_PREF,'PUERTO RICO', null);
V_PREF := dodaj_prefix('00236');
V_kraj := dodaj_kraj(V_PREF,'REP. ŚRODKOWO-AFRYKAŃSKA', null);
V_PREF := dodaj_prefix('00262');
V_kraj := dodaj_kraj(V_PREF,'REUNION', null);
V_PREF := dodaj_prefix('007');
V_kraj := dodaj_kraj(V_PREF,'ROSJA', null);
V_PREF := dodaj_prefix('0027');
V_kraj := dodaj_kraj(V_PREF,'RPA', null);
V_PREF := dodaj_prefix('0040');
V_kraj := dodaj_kraj(V_PREF,'RUMUNIA', null);
V_PREF := dodaj_prefix('00250');
V_kraj := dodaj_kraj(V_PREF,'RWANDA', null);
V_PREF := dodaj_prefix('001869');
V_kraj := dodaj_kraj(V_PREF,'SAINT KITTS I NEVIS', null);
V_PREF := dodaj_prefix('001758');
V_kraj := dodaj_kraj(V_PREF,'SAINT LUCIA', null);
V_PREF := dodaj_prefix('001670');
V_kraj := dodaj_kraj(V_PREF,'SAJPAN', null);
V_PREF := dodaj_prefix('00503');
V_kraj := dodaj_kraj(V_PREF,'SALWADOR', null);
V_PREF := dodaj_prefix('00684');
V_kraj := dodaj_kraj(V_PREF,'SAMOA AMERYKAŃSKIE', null);
V_PREF := dodaj_prefix('00685');
V_kraj := dodaj_kraj(V_PREF,'SAMOA ZACHODNIE', null);
V_PREF := dodaj_prefix('00378');
V_kraj := dodaj_kraj(V_PREF,'SAN MARINO', null);
V_PREF := dodaj_prefix('00221');
V_kraj := dodaj_kraj(V_PREF,'SENEGAL', null);
V_PREF := dodaj_prefix('00381');
V_kraj := dodaj_kraj(V_PREF,'SERBIA I CZARNOGÓRA', null);
V_PREF := dodaj_prefix('00248');
V_kraj := dodaj_kraj(V_PREF,'SESZELE', null);
V_PREF := dodaj_prefix('00232');
V_kraj := dodaj_kraj(V_PREF,'SIERRA LEONE', null);
V_PREF := dodaj_prefix('0065');
V_kraj := dodaj_kraj(V_PREF,'SINGAPUR', null);
V_PREF := dodaj_prefix('00421');
V_kraj := dodaj_kraj(V_PREF,'SłOWACJA', null);
V_PREF := dodaj_prefix('00386');
V_kraj := dodaj_kraj(V_PREF,'SŁOWENIA', null);
V_PREF := dodaj_prefix('00252');
V_kraj := dodaj_kraj(V_PREF,'SOMALIA', null);
V_PREF := dodaj_prefix('0094');
V_kraj := dodaj_kraj(V_PREF,'SRI LANKA', null);
V_PREF := dodaj_prefix('001784');
V_kraj := dodaj_kraj(V_PREF,'ST. VINCENT', null);
V_PREF := dodaj_prefix('001');
V_kraj := dodaj_kraj(V_PREF,'STANY ZJEDNOCZONE', null);
V_PREF := dodaj_prefix('00249');
V_kraj := dodaj_kraj(V_PREF,'SUDAN', null);
V_PREF := dodaj_prefix('00597');
V_kraj := dodaj_kraj(V_PREF,'SURINAM', null);
V_PREF := dodaj_prefix('00268');
V_kraj := dodaj_kraj(V_PREF,'SWAZILAND', null);
V_PREF := dodaj_prefix('00963');
V_kraj := dodaj_kraj(V_PREF,'SYRIA', null);
V_PREF := dodaj_prefix('0041');
V_kraj := dodaj_kraj(V_PREF,'SZWAJCARIA', null);
V_PREF := dodaj_prefix('0046');
V_kraj := dodaj_kraj(V_PREF,'SZWECJA', null);
V_PREF := dodaj_prefix('00992');
V_kraj := dodaj_kraj(V_PREF,'TADŻYKISTAN', null);
V_PREF := dodaj_prefix('0066');
V_kraj := dodaj_kraj(V_PREF,'TAJLANDIA', null);
V_PREF := dodaj_prefix('00886');
V_kraj := dodaj_kraj(V_PREF,'TAJWAN', null);
V_PREF := dodaj_prefix('00255');
V_kraj := dodaj_kraj(V_PREF,'TANZANIA', null);
V_PREF := dodaj_prefix('00228');
V_kraj := dodaj_kraj(V_PREF,'TOGO', null);
V_PREF := dodaj_prefix('00690');
V_kraj := dodaj_kraj(V_PREF,'TOKELAU', null);
V_PREF := dodaj_prefix('00676');
V_kraj := dodaj_kraj(V_PREF,'TONGA', null);
V_PREF := dodaj_prefix('001868');
V_kraj := dodaj_kraj(V_PREF,'TRYNIDAD I TOBAGO', null);
V_PREF := dodaj_prefix('00216');
V_kraj := dodaj_kraj(V_PREF,'TUNEZJA', null);
V_PREF := dodaj_prefix('0090');
V_kraj := dodaj_kraj(V_PREF,'TURCJA', null);
V_PREF := dodaj_prefix('00993');
V_kraj := dodaj_kraj(V_PREF,'TURKMENISTAN', null);
V_PREF := dodaj_prefix('00688');
V_kraj := dodaj_kraj(V_PREF,'TUVALU', null);
V_PREF := dodaj_prefix('00256');
V_kraj := dodaj_kraj(V_PREF,'UGANDA', null);
V_PREF := dodaj_prefix('00598');
V_kraj := dodaj_kraj(V_PREF,'URUGWAJ', null);
V_PREF := dodaj_prefix('00998');
V_kraj := dodaj_kraj(V_PREF,'UZBEKISTAN', null);
V_PREF := dodaj_prefix('00678');
V_kraj := dodaj_kraj(V_PREF,'VANUATU', null);
V_PREF := dodaj_prefix('00681');
V_kraj := dodaj_kraj(V_PREF,'WALLIS I FUTUNA', null);
V_PREF := dodaj_prefix('0039');
V_kraj := dodaj_kraj(V_PREF,'WATYKAN', null);
V_PREF := dodaj_prefix('0036');
V_kraj := dodaj_kraj(V_PREF,'WEGRY', null);
V_PREF := dodaj_prefix('0058');
V_kraj := dodaj_kraj(V_PREF,'WENEZUELA', null);
V_PREF := dodaj_prefix('0044');
V_kraj := dodaj_kraj(V_PREF,'WIELKA BRYTANIA', null);
V_PREF := dodaj_prefix('0084');
V_kraj := dodaj_kraj(V_PREF,'WIETNAM', null);
V_PREF := dodaj_prefix('0039');
V_kraj := dodaj_kraj(V_PREF,'WŁOCHY', null);
V_PREF := dodaj_prefix('00225');
V_kraj := dodaj_kraj(V_PREF,'WYBRZEŻE KOŚCI SŁONIOWEJ', null);
V_PREF := dodaj_prefix('00290');
V_kraj := dodaj_kraj(V_PREF,'WYSPA ŚW. HELENY', null);
V_PREF := dodaj_prefix('00239');
V_kraj := dodaj_kraj(V_PREF,'WYSPA ŚW. TOMASZA', null);
V_PREF := dodaj_prefix('00692');
V_kraj := dodaj_kraj(V_PREF,'WYSPY MARSHALLA', null);
V_PREF := dodaj_prefix('00298');
V_kraj := dodaj_kraj(V_PREF,'WYSPY OWCZE', null);
V_PREF := dodaj_prefix('00677');
V_kraj := dodaj_kraj(V_PREF,'WYSPY SALOMONA', null);
V_PREF := dodaj_prefix('00508');
V_kraj := dodaj_kraj(V_PREF,'WYSPY ŚW.PIOTRA I MIK.', null);
V_PREF := dodaj_prefix('001649');
V_kraj := dodaj_kraj(V_PREF,'WYSPY TURKS', null);
V_PREF := dodaj_prefix('00247');
V_kraj := dodaj_kraj(V_PREF,'WYSPY WNIEBOWSTĄPIENIA', null);
V_PREF := dodaj_prefix('00238');
V_kraj := dodaj_kraj(V_PREF,'WYSPY ZIELONEGO PRZYLĄDKA', null);
V_PREF := dodaj_prefix('260');
V_kraj := dodaj_kraj(V_PREF,'ZAMBIA', null);
V_PREF := dodaj_prefix('00255');
V_kraj := dodaj_kraj(V_PREF,'ZANZIBAR', null);
V_PREF := dodaj_prefix('00263');
V_kraj := dodaj_kraj(V_PREF,'ZIMBABWE', null);
V_PREF := dodaj_prefix('00971');
V_kraj := dodaj_kraj(V_PREF,'ZJEDN.EMIRATY ARABSKIE', null);


EXCEPTION
	WHEN OTHERS THEN
	raise_application_error(-20001,'BLAD - '||SQLCODE||' -ERROR- '||SQLERRM);
END;
/

--call F_kraje();

/*
1. WYCHODZĄCE
2. PRZYCHODZĄCE
3. SMS WYCHODZĄCE
4. SMS PRZYCHODZĄCE
5. MMS WYCHODZĄCE
6. MMS PRZYCHODZĄCE
7. TRANSFER DANYCH
8. VOD
9. SMS PREMIUM
10. POŁĄCZENIE PREMIUM
11. DOŁADOWANIE
12. PRZELEW ŚRODKÓW
*/

/*
1. TELEFON KOMÓRKOWY 
2. TELEFON STACJONARNY
3. MODEM GSM
4. MODEM xDSL
5. DEKODER TV
6. NUMER PREMIUM
7. PRODUKT 

*/

CREATE OR REPLACE PROCEDURE F_TYPY
   IS
   V_TYP_U number;
   V_TYP_Z NUMBER;
BEGIN
V_TYP_U := dodaj_typ_urzadzenia('TELEFON KOMÓRKOWY');
V_TYP_U := dodaj_typ_urzadzenia('TELEFON STACJONARNY');
V_TYP_U := dodaj_typ_urzadzenia('MODEM GSM');
V_TYP_U := dodaj_typ_urzadzenia('MODEM xDSL');
V_TYP_U := dodaj_typ_urzadzenia('DEKODER TV');
V_TYP_U := dodaj_typ_urzadzenia('NUMER PREMIUM');
V_TYP_U := dodaj_typ_urzadzenia('PRODUKT');
V_TYP_Z := dodaj_typ_zdarzenia(1,'WYCHODZĄCE',null);
V_TYP_Z := dodaj_typ_zdarzenia(2,'PRZYCHODZĄCE',null);
V_TYP_Z := dodaj_typ_zdarzenia(3,'SMS WYCHODZĄCE',null);
V_TYP_Z := dodaj_typ_zdarzenia(4,'SMS PRZYCHODZĄCE',null);
V_TYP_Z := dodaj_typ_zdarzenia(5,'MMS WYCHODZĄCE',null);
V_TYP_Z := dodaj_typ_zdarzenia(6,'MMS PRZYCHODZĄCE',null);
V_TYP_Z := dodaj_typ_zdarzenia(7,'TRANSFER DANYCH',null);
V_TYP_Z := dodaj_typ_zdarzenia(8,'VOD',null);
V_TYP_Z := dodaj_typ_zdarzenia(9,'SMS PREMIUM',null);
V_TYP_Z := dodaj_typ_zdarzenia(10,'POŁĄCZENIE PREMIUM',null);
V_TYP_Z := dodaj_typ_zdarzenia(11,'DOŁADOWANIE',null);
V_TYP_Z := dodaj_typ_zdarzenia(12,'PRZELEW ŚRODKÓW',null);

EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.put_line('Już dodane');
	--raise_application_error(-20001,'BLAD - '||SQLCODE||' -ERROR- '||SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE F_TARYFY
   IS
   V_TARYFA number;
   V_USLUGA NUMBER;
BEGIN
V_TARYFA := dodaj_taryfa('POP','1-lip-2014 14:54:35','3-lip-2014 14:54:35');
V_TARYFA := dodaj_taryfa('POP','2-lip-2014 14:54:35','7-lip-2014 14:54:35');
V_TARYFA := dodaj_taryfa('POP','5-lip-2014 14:54:35','10-lip-2014 14:54:35');
V_TARYFA := dodaj_taryfa('POP','12-lip-2014 14:54:35','18-lip-2014 14:54:35');
V_TARYFA := dodaj_taryfa('POP','3-lip-2014 14:54:35','19-lip-2014 14:54:35');
V_TARYFA := dodaj_taryfa('POP','8-lip-2014 14:54:35','12-lip-2014 14:54:35');

--V_TARYFA := dodaj_taryfa('MIX','8-lipsd4:35','12-ld14:54:35');
--V_TARYFA := dodaj_taryfa('ABONAMENT','8-lip-2013 14:54:35','12-lip-2014 14:54:35');
V_TARYFA := dodaj_taryfa('MIX','8-wrz-2013 14:54:35','12-lip-2014 14:54:35');
V_TARYFA := dodaj_taryfa('MIX MIKOŁAJKOWY','6-gru-2013 00:00:00','6-gru-2013 23:59:59');


DBMS_OUTPUT.put_line('dodano taryfy');
EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
	
	--raise_application_error(-20001,'BLAD - DODAWANIE TARYF'||SQLCODE||' -ERROR- '||SQLERRM);
END;
/


---------------------------------------------------------------------------------
-- WYPELNIANIE DANYCH DANYCH
CREATE OR REPLACE PROCEDURE F_DANE
   IS
BEGIN
usuwanie();
F_NIEZNANE();
F_MIEJSCA();
F_KRAJE();
F_TYPY();
F_TARYFY();
EXCEPTION
	WHEN OTHERS THEN
	raise_application_error(-20001,'BLAD - DODAWANIE DANYCH '||SQLCODE||' -ERROR- '||SQLERRM);
END;
/

CALL F_DANE();

-- WYWOLANIA


--CALL F_MIEJSCA();



--SELECT last_number INTO v FROM all_sequences WHERE sequence_owner = 'BIL' AND sequence_name = 'GLOBALSEQUENCE';


--call DODAJ_REGION(sekwencja('GLOBALSEQUENCE'),'malopolska');


-- kraje

-- regiony

-- miasta

-- kody


-- numery kom (najpierw identyfikator)

-- numery sta (najpierw identyfikator)

-- numery tv (najpierw identyfikator)

-- numery net (najpierw identyfikator)


-- klienci

-- taryfy

-- uslugi

-- dostepnosc taryf

-- kary

-- odsetki

-- umowy

-- taryfy klientow

-- uslugi klientow
