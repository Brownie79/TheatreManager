--Wei Mei, Devanshu Bharel, Alex Nicoara

INSERT INTO movie VALUES('movie1','type1', 'movie descrip1');
INSERT INTO movie VALUES('movie2','type2', 'movie descrip2');
INSERT INTO movie VALUES('movie3','type3', 'movie descrip3');
INSERT INTO movie VALUES('movie4','type4', 'movie descrip4');

INSERT INTO membertype VALUES('bronze', 'descrip1', 0, 5);
INSERT INTO membertype VALUES('silver', 'descrip2', 20, 10);
INSERT INTO membertype VALUES('gold', 'descrip3', 40, 15);
INSERT INTO membertype VALUES('guest', 'descrip4', 0, 0);

INSERT INTO positions VALUES('register', 'descrip1', 2);
INSERT INTO positions VALUES('projectionist', 'descrip2', 2);
INSERT INTO positions VALUES('janitorial', 'descrip3', 2);
INSERT INTO positions VALUES('manager', 'manager descrip', 1);
INSERT INTO positions VALUES('owner', 'owner descrip', 0);

INSERT INTO star_ VALUES('movie1', 'star1');
INSERT INTO star_ VALUES('movie1', 'star2');
INSERT INTO star_ VALUES('movie2', 'star3');
INSERT INTO star_ VALUES('movie2', 'star4');
INSERT INTO star_ VALUES('movie3', 'star2');
INSERT INTO star_ VALUES('movie4', 'star5');

INSERT INTO director VALUES('movie1', 'name1');
INSERT INTO director VALUES('movie2', 'name1');
INSERT INTO director VALUES('movie3', 'name2');
INSERT INTO director VALUES('movie4', 'name3');

INSERT INTO user_ VALUES('jdoe1email', '1111222233334444','1112223333','john', 'doe', 'guest');
INSERT INTO user_ VALUES('asavage1email', '2222333344445555','2223334444','adam', 'savage', 'gold');
INSERT INTO user_ VALUES('jhyneman1email', '1111222233338989','1112224444','jaime', 'hyneman', 'silver');
INSERT INTO user_ VALUES('gimahara1email', '1111222233337777','1112229999','grant', 'imahara', 'bronze');

INSERT INTO creditcard VALUES('1111222233334444',to_date('2020/05/21','yyyy/mm/dd'),'visa');
INSERT INTO creditcard VALUES('2222333344445555',to_date('2017/03/27','yyyy/mm/dd'),'visa');
INSERT INTO creditcard VALUES('1111222233338989',to_date('2018/04/03','yyyy/mm/dd'),'mastercard');
INSERT INTO creditcard VALUES('1111222233337777',to_date('2020/01/10','yyyy/mm/dd'),'mastercard');


INSERT INTO registerinfo VALUES('asavage1email', 'asavage1','savagepass','savage home', 25, 100);
INSERT INTO registerinfo VALUES('jhyneman1email', 'jhyneman1','hynemanpass','hyneman home', 30, 30);
INSERT INTO registerinfo VALUES('gimahara1email', 'gimahara1','imaharapass','imahara home', 2, 12);

INSERT INTO moviehistory VALUES('asavage1', 'movie1');
INSERT INTO moviehistory VALUES('asavage1', 'movie2');
INSERT INTO moviehistory VALUES('asavage1', 'movie3');
INSERT INTO moviehistory VALUES('asavage1', 'movie4');
INSERT INTO moviehistory VALUES('jhyneman1', 'movie1');
INSERT INTO moviehistory VALUES('jhyneman1', 'movie2');
INSERT INTO moviehistory VALUES('gimahara1', 'movie1');

INSERT INTO theatre VALUES('theatre1', 11122, 2, 'owner1', 'manager1');	
INSERT INTO theatre VALUES('theatre2', 11133, 5, 'owner2', 'manager2');

INSERT INTO guestinfo VALUES('jdoe1email', 'theatre1');

INSERT INTO screen VALUES('theatre1', 1, 10);
INSERT INTO screen VALUES('theatre1', 2, 20);
INSERT INTO screen VALUES('theatre2', 1, 10);
INSERT INTO screen VALUES('theatre2', 2, 20);
INSERT INTO screen VALUES('theatre2', 3, 30);
INSERT INTO screen VALUES('theatre2', 4, 40);
INSERT INTO screen VALUES('theatre2', 5, 50);

INSERT INTO theatrereviews VALUES (0, 'theatre1', 'asavage1', 2, 0, 'this theatre sucks, it has sticky everything');
INSERT INTO theatrereviews VALUES (1, 'theatre2', 'asavage1', 10, 2, 'this theatre is awesome');
INSERT INTO theatrereviews VALUES (2, 'theatre1', 'jhyneman1', 2, 0, 'its meh');

INSERT INTO moviereviews VALUES (0, 'movie1', 'jhyneman1', 2, 10, 'fav movie');
INSERT INTO moviereviews VALUES (1, 'movie2', 'gimahara1', 0, 0, 'its alright');


INSERT INTO movietimes VALUES('theatre1','1', 'movie1', to_date('2015/12/10-8:00 AM','yyyy/mm/dd-HH:MI AM'));
INSERT INTO movietimes VALUES('theatre1','2', 'movie2', to_date('2015/12/10-9:00 AM','yyyy/mm/dd-HH:MI AM'));
INSERT INTO movietimes VALUES('theatre2','3', 'movie3', to_date('2015/12/11-7:00 PM','yyyy/mm/dd-HH:MI AM'));
INSERT INTO movietimes VALUES('theatre2','4', 'movie4', to_date('2015/12/11-8:00 PM','yyyy/mm/dd-HH:MI AM'));

INSERT INTO moviethread VALUES(0,'asavage1','movie1','all the spoilers here',to_date('2015/11/12-2:32 PM','yyyy/mm/dd-HH:MI AM'));
INSERT INTO moviethread VALUES(1,'jhyneman1','movie2','the 3d makes my head hurt',to_date('2015/11/12-5:04 PM','yyyy/mm/dd-HH:MI AM'));

INSERT INTO movieresponses VALUES(0,0,'gimahara1','this guy dies at the end',to_date('2015/11/12-2:48 PM','yyyy/mm/dd-HH:MI AM'));

INSERT INTO theatrethread VALUES(0,'jhyneman1','theatre2', 'this theatre''s workers are weird',to_date('2015/11/01-6:01 PM','yyyy/mm/dd-HH:MI AM'));

INSERT INTO theatreresponses VALUES(0,0,'gimahara1','yep',to_date('2015/11/05-8:48 PM','yyyy/mm/dd-HH:MI AM'));

INSERT INTO manager_ VALUES('111223333','bob','theatre1', 'manhome1','1113338989');
INSERT INTO manager_ VALUES('222334444','tom', 'theatre2', 'manhome2', '2223334545');

INSERT INTO staff VALUES('333445555','peter', 'register','111223333','theatre1','shome1','2221112323');
INSERT INTO staff VALUES('777889999','james', 'jantorial','111223333','theatre1','shome2','9998887766');
INSERT INTO staff VALUES('666768787','steve', 'projectionist','111223333', 'theatre1','shome3', '6756903004');

INSERT INTO schedule VALUES('333445555',to_date('2015/12/11-8:00 AM','yyyy/mm/dd-HH:MI AM'), to_date('2015/12/11-5:00 PM','yyyy/mm/dd-HH:MI AM'),'register','theatre1',0);
INSERT INTO schedule VALUES('333445555',to_date('2015/12/13-4:00 PM','yyyy/mm/dd-HH:MI AM'), to_date('2015/12/13-12:00 AM','yyyy/mm/dd-HH:MI AM'),'register','theatre1',1);
INSERT INTO schedule VALUES('777889999',to_date('2015/12/11-8:00 AM','yyyy/mm/dd-HH:MI AM'), to_date('2015/12/11-4:00 PM','yyyy/mm/dd-HH:MI AM'),'janitorial','theatre1',2);








