--6. Display the theatre(s) that are showing most number of movies.
--Tests:


INSERT INTO movie VALUES('movie1','type1', 'movie descrip1', to_date('2015/11/03','yyyy/mm/dd'),1);
INSERT INTO movie VALUES('movie2','type2', 'movie descrip2', to_date('2015/11/05','yyyy/mm/dd'),2);
INSERT INTO movie VALUES('movie3','type3', 'movie descrip3', to_date('2015/11/13','yyyy/mm/dd'),3);
INSERT INTO movie VALUES('movie4','type4', 'movie descrip4', to_date('2015/11/23','yyyy/mm/dd'),4);

INSERT INTO screen VALUES('theatre1', 1, 10, 1);
INSERT INTO screen VALUES('theatre2', 1, 10, 2);
INSERT INTO screen VALUES('theatre3', 1, 10, 3);
INSERT INTO screen VALUES('theatre4', 1, 10, 4);
--A. Two or more theatres showing same number of movies

INSERT INTO movietimes VALUES('theatre1','1', 'movie1', to_date('2015/12/10','yyyy/mm/dd'), '08:00',1);
INSERT INTO movietimes VALUES('theatre1','1', 'movie2', to_date('2015/12/10', 'yyyy/mm/dd'), '10:00',2);
INSERT INTO movietimes VALUES('theatre2','1', 'movie3', to_date('2015/12/10','yyyy/mm/dd'), '20:00',3);
INSERT INTO movietimes VALUES('theatre2','1', 'movie4', to_date('2015/12/10', 'yyyy/mm/dd'), '22:00',4);
INSERT INTO movietimes VALUES('theatre3','1', 'movie1', to_date('2015/12/10','yyyy/mm/dd'), '08:00',5);
INSERT INTO movietimes VALUES('theatre4','1', 'movie2', to_date('2015/12/10', 'yyyy/mm/dd'), '09:00',6);
--returns both theatre1 and theatre2

--B. theatres showing different number of movies
INSERT INTO movietimes VALUES('theatre1','1', 'movie1', to_date('2015/12/10','yyyy/mm/dd'), '08:00',1);
INSERT INTO movietimes VALUES('theatre1','1', 'movie2', to_date('2015/12/10', 'yyyy/mm/dd'), '10:00',2);
INSERT INTO movietimes VALUES('theatre2','1', 'movie4', to_date('2015/12/10', 'yyyy/mm/dd'), '22:00',3);
INSERT INTO movietimes VALUES('theatre3','1', 'movie1', to_date('2015/12/10','yyyy/mm/dd'), '08:00',4);
INSERT INTO movietimes VALUES('theatre4','1', 'movie2', to_date('2015/12/10', 'yyyy/mm/dd'), '09:00',5);
--returns theatre1

--C. No movies are showing
--message : no movies are showing at any theatre
