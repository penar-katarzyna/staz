BEGIN
 FOR rec IN (SELECT user_objects.object_name FROM user_objects WHERE (object_type='table' OR object_type='synonym' OR object_type='view'))
 LOOP 
	execute IMMEDIATE 'GRANT SELECT, UPDATE, INSERT ON '||rec.object_name||' TO BILADMIN';
 END LOOP;
  END;
/  

BEGIN
    FOR i IN (SELECT user_objects.object_name FROM user_objects WHERE object_type='PROCEDURE' OR oBJECT_TYPE='FUNCTION' OR object_type = 'package' )
    LOOP
        EXECUTE IMMEDIATE 'GRANT EXECUTE ON '||i.object_name||' TO BILADMIN';
    END LOOP;
END;

/