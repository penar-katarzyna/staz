BEGIN
dbms_scheduler.drop_job('zdarzenia_co_1_min');
EXCEPTION
    WHEN OTHERS
    THEN
    NULL;
END;
/

--KASOWANIE
declare
  v_ItemCount integer;
begin
  SELECT count(*)
    INTO v_ItemCount
    FROM ALL_OBJECTS AO
   WHERE AO.OWNER = USER
     AND AO.OBJECT_TYPE NOT IN ('INDEX')
     AND AO.OBJECT_NAME NOT LIKE 'BIN$%';
  while (v_ItemCount > 0) loop
    for v_Cmd in (SELECT 'drop ' || AO.OBJECT_TYPE || ' ' || AO.OBJECT_NAME ||
                         DECODE(AO.OBJECT_TYPE,
                                'TABLE',
                                ' CASCADE CONSTRAINTS',
                                '') as DROPCMD
                    FROM ALL_OBJECTS AO
                   WHERE AO.OWNER = USER
                     AND AO.OBJECT_TYPE NOT IN ('INDEX')
                     AND AO.OBJECT_NAME NOT LIKE 'BIN$%') loop
      begin
        execute immediate v_Cmd.dropcmd;
      exception
        when others then
          null; -- ignore errors
      end;
    end loop;
    SELECT count(*)
      INTO v_ItemCount
      FROM ALL_OBJECTS AO
     WHERE AO.OWNER = USER
       AND AO.OBJECT_TYPE NOT IN ('INDEX')
       AND AO.OBJECT_NAME NOT LIKE 'BIN$%';
  end loop;


  execute immediate 'purge recyclebin';
end;

/

CREATE OR replace synonym SYSBIL.x$krbmsft for sys.xkrbmsft; 


DROP USER BILADMIN CASCADE;
CREATE USER BILADMIN IDENTIFIED BY defaultPass;
CREATE OR replace DIRECTORY OPER_DIR AS 'D:\operator';
CREATE OR replace DIRECTORY TRASH_DIR AS 'D:\trash';
GRANT READ, WRITE ON DIRECTORY oper_dir TO BILADMIN;
GRANT READ, WRITE ON DIRECTORY trash_dir TO BILADMIN;
GRANT execute on utl_file TO BILADMIN;

CREATE OR replace type file_array as table of varchar2(100);
/
CREATE OR REPLACE FUNCTION LIST_FILES (lp_string IN VARCHAR2 default null)
RETURN file_array pipelined AS
 
lv_pattern VARCHAR2(1024);
lv_ns VARCHAR2(1024);
 
BEGIN
 
SELECT directory_path
INTO lv_pattern
FROM dba_directories
WHERE directory_name = 'OPER_DIR'; -- katalog główny dla plików od operatora
 
SYS.DBMS_BACKUP_RESTORE.SEARCHFILES(lv_pattern, lv_ns);
 
FOR file_list IN (SELECT FNAME_KRBMSFT AS file_name
FROM X$KRBMSFT
WHERE FNAME_KRBMSFT LIKE '%'|| NVL(lp_string, FNAME_KRBMSFT)||'%' ) LOOP
PIPE ROW(file_list.file_name);
END LOOP;
 
END;
/
GRANT execute on LIST_FILES to BILADMIN;
CREATE or replace public synonym list_files for SYSBIL.LIST_FILES;