--5. Display the registered guest who has contributed most comments.
--Tests:
INSERT INTO THEATRETHREAD VALUES(1, 'user1', 'theatre1', 'comment1',20,to_date('09-DEC-2015 04.44.22 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO THEATRETHREAD VALUES(2, 'user2', 'theatre1', 'comment2',20,to_date('07-DEC-2015 11.11.36 AM','DD-MM-YYYY HH.MI.SS AM'));

--A. two or more users have equal comments
INSERT INTO TheatreResponses Values (1, 1, 'user3', 'comment1', to_date('10-DEC-2015 06.15.02 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO TheatreResponses VALUES(2,1, 'user4', 'comment2', to_date('10-DEC-2015 07.17.10 PM','DD-MM-YYYY HH.MI.SS AM'));
-- returns both

--B. All users have unique amount of comments
INSERT INTO TheatreResponses Values (1, 1, 'user3', 'comment1', to_date('10-DEC-2015 06.15.02 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO TheatreResponses VALUES(2,1, 'user3', 'comment2', to_date('10-DEC-2015 07.17.10 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO TheatreResponses Values (3, 1, 'user4', 'comment3', to_date('10-DEC-2015 06.17.02 PM','DD-MM-YYYY HH.MI.SS AM'));
-- returns user3

--C.There are no comments made
--return error message
