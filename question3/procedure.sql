-- Question #3: PROCEDURE
CREATE OR REPLACE PROCEDURE MemTypeAndCP(firstName VARCHAR2, lastName VARCHAR2) IS
  mType VARCHAR2(32);
  cPoints INTEGER;
BEGIN
	-- retrieve data
	SELECT TYPE_ INTO mType
	FROM USER_
	WHERE (USER_.F_NAME = firstName) AND (USER_.L_NAME = lastName);
	
	SELECT POINTEARNED INTO cPoints
	FROM REGISTERINFO
	WHERE REGISTERINFO.EMAIL = (SELECT EMAIL
								FROM USER_
								WHERE (USER_.F_NAME = firstName) AND (USER_.L_NAME = lastName));
	
	-- output functions
	DBMS_OUTPUT.PUT_LINE('Name Entered: ' || firstName || ' ' || lastName);
	DBMS_OUTPUT.PUT_LINE('Member Type: ' || mType);
	DBMS_OUTPUT.PUT_LINE('Credit Points: ' || cPoints);
END;
/
