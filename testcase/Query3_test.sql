--3. Display the least popular discussion thread in terms of visits and comments.
--Tests:
INSERT INTO THEATRETHREAD VALUES(1, 'user1', '1701 Spygate Dr.','Why is everything so darn expensive?',41,to_date('10-DEC-2015 07.15.15 AM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO THEATRETHREAD VALUES(2, 'user2', '28 Rush St.', 'WHERE ARE THE BATHROOMS?!??!',20,to_date('09-DEC-2015 04.44.22 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO THEATRETHREAD VALUES(3, 'user3', '28 Rush St.', 'Does this place have bathrooms?',20,to_date('07-DEC-2015 11.11.36 AM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO THEATRETHREAD VALUES(4, 'user4', '667 Seashell Dr.', 'When is the best time to visit the theatre? It''s always crowded.',80,to_date('10-DEC-2015 03.08.00 PM','DD-MM-YYYY HH.MI.SS AM'));

--A.  Threads have equal scores 
INSERT INTO THEATRETHREAD VALUES(1, 'user1', 'theatre1', 'comment1',20,to_date('09-DEC-2015 04.44.22 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO THEATRETHREAD VALUES(2, 'user2', 'theatre1', 'comment2',20,to_date('07-DEC-2015 11.11.36 AM','DD-MM-YYYY HH.MI.SS AM'));
--returns both

--B. Threads have unique scores
INSERT INTO THEATRETHREAD VALUES(1, 'user1', 'theatre1', 'comment1',41,to_date('09-DEC-2015 04.44.22 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO THEATRETHREAD VALUES(2, 'user2', 'theatre1', 'comment2',20,to_date('07-DEC-2015 11.11.36 AM','DD-MM-YYYY HH.MI.SS AM'));
--returns user1

--E. There are no threads
--message saying there are no threads
