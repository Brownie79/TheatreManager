-- Question #3
create or replace PROCEDURE FindMembershipCP(
firstName in out VARCHAR2(32),
lastName in out VARCHAR2(32),
mType out VARCHAR2(16),
cPoints out NUMBER
)
AS 
BEGIN
	SELECT TYPE_ INTO mType
	FROM USER_
	WHERE (USER_.F_NAME = firstName) AND (USER_.L_NAME = lastName)
	
	SELECT POINTEARNED INTO cPoints
	FROM REGISTERINFO
	WHERE REGISTERINFO.EMAIL = (SELECT EMAIL
								FROM USER_
								WHERE USER_.F_NAME = firstName AND USER_.L_NAME = lastName)
	
	DBMS_OUTPUT.PUT_LINE('First Name Entered: ');
	DBMS_OUTPUT.PUT_LINE(firstName);
	
	DBMS_OUTPUT.PUT_LINE('Last Name Entered: ');
	DBMS_OUTPUT.PUT_LINE(lastName);
	
	DBMS_OUTPUT.PUT_LINE('Membership Type: ');
	DBMS_OUTPUT.PUT_LINE(mType);
	
	DBMS_OUTPUT.PUT_LINE('Credit Points: ');
	DBMS_OUTPUT.PUT_LINE(cPoints);
END;
