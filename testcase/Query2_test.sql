--2. Display the 3 most recent discussion/comments from all discussion threads.
--Tests:
INSERT INTO THEATRETHREAD VALUES(1, 'user1', 'theatre1','topic1',41,to_date('10-DEC-2015 07.15.15 AM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO THEATRETHREAD VALUES(2, 'user2', '28 Rush St.', 'topic2',20,to_date('09-DEC-2015 04.44.22 PM','DD-MM-YYYY HH.MI.SS AM'));

--A. No Comments in the threads 

--B. Less than 3 comments in the threads 
INSERT INTO TheatreResponses Values (1, 2, 'user1', 'comment1', to_date('10-DEC-2015 06.15.02 PM','DD-MM-YYYY HH.MI.SS AM'));

--C. More than 3 comments in the threads

INSERT INTO TheatreReponses VALUES(2,1, 'user2', 'comment2', to_date('10-DEC-2015 02.22.10 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO TheatreReponses VALUES(3,1, 'user3', 'comment3', to_date('10-DEC-2015 05.17.10 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO TheatreReponses VALUES(4,1, 'user4', 'comment4', to_date('10-DEC-2015 06.22.30 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO TheatreReponses VALUES(5,1, 'user2', 'comment5', to_date('10-DEC-2015 09.27.10 PM','DD-MM-YYYY HH.MI.SS AM'));


--D. No Threads exist 

