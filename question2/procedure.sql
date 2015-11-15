-- Question #2: PROCEDURE
CREATE OR REPLACE PROCEDURE SeeSchedule(t_location VARCHAR2) IS
  sName VARCHAR2(32);
  sType VARCHAR2(16);
  ssTemp VARCHAR2(9);
  Start_Time TIMESTAMP(6);
  End_Time TIMESTAMP(6);
  totalRows INTEGER;
  counter INTEGER := 0;
BEGIN
  dbms_output.put_line('Work Schedule at ' || t_location);
  
  -- get total number of rows to iterate
  SELECT COUNT(*) INTO totalRows
  FROM SCHEDULE;
  
  -- iterate through all of the tuples
  LOOP
    -- retrieve information
    SELECT START_ INTO Start_Time
    FROM SCHEDULE
    WHERE SCHEDULE.ID_ = counter;
    
    SELECT END_ INTO End_Time
    FROM SCHEDULE
    WHERE SCHEDULE.ID_ = counter;
    
    SELECT SSN INTO ssTemp
    FROM SCHEDULE
    WHERE SCHEDULE.ID_ = counter;

    SELECT NAME_ into sName
    FROM STAFF
    WHERE STAFF.SSN = ssTemp;
    
    SELECT TYPE_ into sType
    FROM STAFF
    WHERE STAFF.SSN = ssTemp;
    
    -- print out stuff
    dbms_output.put_line(' ');
    dbms_output.put_line('Name: ' || sName || ' Position: ' || sType);
    dbms_output.put_line('Start Time: ' || Start_Time || ' End Time: ' || End_Time);
    dbms_output.put_line(' ');
    
    counter := counter+1;
    EXIT WHEN counter = totalRows;
  END LOOP;
  
END;
/
