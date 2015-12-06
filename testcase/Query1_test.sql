
-- 1. Display the 3 most recent discussions/comments from a specific discussion thread.

--Tests:
-- A. No Comments in the thread


-- B. Less than or up to 3 comments in the thread
INSERT INTO THEATRETHREAD VALUES(1, 'user1', 'theatre1', 'topic1',20,to_date('09-DEC-2015 04.44.22 PM','DD-MM-YYYY HH.MI.SS AM'));

INSERT INTO TheatreResponses Values (1, 1, 'user2', 'comment1', to_date('10-DEC-2015 06.15.02 PM','DD-MM-YYYY HH.MI.SS AM'));

-- C. More than 3 comments in the thread.

INSERT INTO TheatreReponses VALUES(2,1, 'user3', 'comment2', to_date('10-DEC-2015 02.22.10 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO TheatreReponses VALUES(3,1, 'user4', 'comment3', to_date('10-DEC-2015 05.17.10 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO TheatreReponses VALUES(4,1, 'user1', 'comment4', to_date('10-DEC-2015 06.22.30 PM','DD-MM-YYYY HH.MI.SS AM'));


-- D. Thread does not exist 

