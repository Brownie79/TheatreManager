-- This file is used to insert data into the database, feel free to add on data.
-- I haven't done data for every table, so don't add this stuff in just yet

-- Theatre Data
INSERT INTO Theatre VALUES ('667 Seashell Dr.',60610,10,'Russell Wilson','302425250', '8.00',25, 1);
INSERT INTO Theatre VALUES ('28 Rush St.',60616,10,'Adrian Peterson','978133765', '8.00',40, 2);
INSERT INTO Theatre VALUES ('188 Victory Ln.',60651,12,'Peyton Manning','190343658', '10.00',20, 3);
INSERT INTO Theatre VALUES ('1701 Spygate Dr.',60660,6,'Thomas Brady','163732568', '9.00',40, 4);

-- Movies Data
-- movietypes: Family, Action, Adventure, Horror, Drama, Comedy, Other
INSERT INTO Movies VALUES ('The Peanuts Movie','Family','Charlie Brown, the world’s most beloved underdog, embarks upon an epic and heroic quest, while his best pal, the lovable beagle Snoopy, takes to the skies to pursue his arch-nemesis, the Red Baron.',to_date('2015/11/06','yyyy/mm/dd'),1);
INSERT INTO Movies VALUES ('James Bond: Spectre','Action','A cryptic message from Bond’s past sends him on a trail to uncover a sinister organisation. While M battles political forces to keep the secret service alive, Bond peels back the layers of deceit to reveal the terrible truth behind SPECTRE.', to_date('2015/11/0','yyyy/mm/dd'),2);
INSERT INTO Movies VALUES ('Hunger Games: Mockingjay pt 2','Action','After being symbolized as the "Mockingjay", Katniss Everdeen and District 13 engage in an all-out revolution against the autocratic Capitol.', to_date('2015/11/20','yyyy/mm/dd'),3);
INSERT INTO Movies VALUES ('The Martian','Adventure','During a manned mission to Mars, Astronaut Mark Watney is presumed dead after a fierce storm and left behind by his crew. But Watney has survived and finds himself stranded and alone on the hostile planet.', to_date('2015/10/02','yyyy/mm/dd'),4);
INSERT INTO Movies VALUES ('Creed','Drama','Adonis Johnson never knew his famous father, world heavyweight champion Apollo Creed, who died before he was born.', to_date('2015/11/25','yyyy/mm/dd'),5);
INSERT INTO Movies VALUES ('The Good Dinosaur','Adventure','The Good Dinosaur asks the generations-old question: What if the asteroid that forever changed life on Earth missed the planet completely and giant dinosaurs never became extinct?', to_date('2015/11/25','yyyy/mm/dd'),6);
INSERT INTO Movies VALUES ('Pan','Adventure','Peter is a mischievous 12-year-old boy with an irrepressible rebellious streak, but in the bleak London orphanage where he has lived his whole life those qualities do not exactly fly.', to_date('2015/10/09','yyyy/mm/dd'),7);
INSERT INTO Movies VALUES ('Love the Coopers','Comedy','Love the Coopers follows the Cooper clan as four generations of extended family come together for their annual Christmas Eve celebration. As the evening unfolds, a series of unexpected visitors and unlikely events turn the night upside down.', to_date('2015/11/13','yyyy/mm/dd'),8);
INSERT INTO Movies VALUES ('Star Wars: The Force Awakens','Action','Lucasfilm and visionary director J.J. Abrams join forces to take you back again to a galaxy far, far away as Star Wars returns to the big screen with Star Wars: The Force Awakens.',to_date('2015/12/18','yyyy/mm/dd'),9);
INSERT INTO Movies VALUES ('Concussion','Drama','Will Smith stars in Concussion, a dramatic thriller based on the incredible true David vs. Goliath story of American immigrant Dr. Bennet Omalu, the brilliant forensic neuropathologist who made the first discovery of CTE.', to_date('2015/12/25','yyyy/mm/dd'),10);
INSERT INTO Movies VALUES ('Joy','Drama','JOY is the story of a family across four generations and the woman who rises to become founder and matriarch of a powerful family business dynasty. JOY stars Jennifer Lawrence in a film written and directed by David O. Russell.', to_date('2015/12/25','yyyy/mm/dd'),11);
INSERT INTO Movies VALUES ('Hunger Games: Mockingjay pt 1','Action','The worldwide phenomenon of The Hunger Games continues to set the world on fire with The Hunger Games: Mockingjay - Part 1, which finds Katniss Everdeen (Jennifer Lawrence) in District 13 after she literally shatters the games forever.', to_date('2014/11/21','yyyy/mm/dd'),12);
INSERT INTO Movies VALUES ('Hunger Games: Catching Fire','Action','As rebellion simmers, a cruel change in the Hunger Games may change Panem forever.', to_date('2013/11/22','yyyy/mm/dd'),13);
INSERT INTO Movies VALUES ('Little Boy','Drama','LITTLE BOY is a powerful and moving film about a little boy who is willing to do whatever it takes to bring his dad home from World War II alive.', to_date('2015/04/24','yyyy/mm/dd'),14);
INSERT INTO Movies VALUES ('Freddy vs Jason','Horror','Razor-clawed Freddy (Robert Englund) battles masked killer Jason (Ken Kirzinger).', to_date('2015/08/03','yyyy/mm/dd'),15);
INSERT INTO Movies VALUES ('Scream 4','Horror','Ten years have passed, and Sidney Prescott, who has put herself back together thanks in part to her writing, is visited by the Ghostface Killer.', to_date('2015/04/11','yyyy/mm/dd'),16);
INSERT INTO Movies VALUES ('Earth','Other','Animal mothers struggle to raise their young in an increasingly harsh environment.', to_date('2014/07/07','yyyy/mm/dd'),17);

-- Positions

-- priveleges_: 
-- 0, can add/drop shifts on timetable
-- 1, can modify 0's shifts on timetable and can add/drop personal shifts
-- 2, can access and modify the movie database, but cannot touch the 0's and 1's shifts

INSERT INTO Positions VALUES ('Cashier','Responsible for greeting customers and operating the cash register for ticket sales',0,1);
INSERT INTO Positions VALUES ('Concessions','Responsible for selling snacks and drinks to the customers',0,2);
INSERT INTO Positions VALUES ('Janitor','Responsible for maintaining the cleanliness of the movie theater',3);
INSERT INTO Positions VALUES ('Screens Operator','Responsible for playing/operating the movies at the screens',0,4);
INSERT INTO Positions VALUES ('Party Host','Responsible for coordinating/organizing parties at the theatre',0,5);
INSERT INTO Positions VALUES ('Security','Responsible for keeping the theatre safe and secure',0,6);
INSERT INTO Positions VALUES ('Manager','Responsible for managing employees and scheduling their shifts',1,7);
INSERT INTO Positions VALUES ('Web Admin','Responsible for updating/modifying the database and the movies at the theatre',2, 8);

-- Russell Wilson's Theatre (i.e my fantasy team)
INSERT INTO staff VALUES ('102030121','Johnny Manziel','Cashier','302425250','667 Seashell Dr.','123 Round Ln.','8827689834',1);
INSERT INTO staff VALUES ('541090292','Stevan Ridley','Concessions','302425250','667 Seashell Dr.','244 Peach Tree Ln.','8994202185',2);
INSERT INTO staff VALUES ('235348701','Julio Jones','Janitor','302425250','667 Seashell Dr.','105 Apple Rd.','8338658426',3);
INSERT INTO staff VALUES ('437188797','Andre Johnson','Screens Operator','302425250','667 Seashell Dr.','65 Shaw Blvd.','8445018305',4);
INSERT INTO staff VALUES ('147269562','Tyler Lockett','Party Host','302425250','667 Seashell Dr.','34 Payton Ave.','8996415755',5);
INSERT INTO staff VALUES ('543680853','Anthony Barr','Web Admin','302425250','667 Seashell Dr.','555 South St.','8114807566',6);
INSERT INTO staff VALUES ('939016016','Ndamukong Suh','Security','302425250','667 Seashell Dr.','329 Kangaroo Rd.','8009757193',7);
-- All Day's Theatre
INSERT INTO staff VALUES ('492648375','Andrew Luck','Cashier','978133765','28 Rush St.','29 Jump St.','4224537586',8);
INSERT INTO staff VALUES ('227598761','LeVeon Bell','Concessions','978133765','28 Rush St.','201 Blue Dr.','2285560965',9);
INSERT INTO staff VALUES ('400532123','Dez Bryant','Janitor','978133765','28 Rush St.','412 Wabash Ave.','2281006710',10);
INSERT INTO staff VALUES ('603434567','AJ Green','Screens Operator','978133765','28 Rush St.','77 Wallace Cir.','2257779091',11);
INSERT INTO staff VALUES ('552506071','Jeremy Hill','Party Host','978133765','28 Rush St.','541 Vegas Ln.','2267815111',12);
INSERT INTO staff VALUES ('323216456','Kellen Davis','Web Admin','978133765','28 Rush St.','80 Maple Rd.','2267053090',13);
INSERT INTO staff VALUES ('145468792','Patrick Willis','Security','978133765','28 Rush St.','11 Banana Rd.','8005053111',14);
-- Peyton's Theatre
INSERT INTO staff VALUES ('432504393','Corey Fuller','Cashier','090343658','188 Victory Ln.','18 Manning Wy.','4224537586',15);
INSERT INTO staff VALUES ('834772374','Wes Welker','Concessions','090343658','188 Victory Ln.','9 School Blvd.','2285560965',16);
INSERT INTO staff VALUES ('238483884','Clay Matthews','Janitor','090343658','188 Victory Ln.','66 Triangle Pkwy.','2281006710',17);
INSERT INTO staff VALUES ('586325156','Omar Bolden','Screens Operator','090343658','188 Victory Ln.','2010 1st St.','2257779091',18);
INSERT INTO staff VALUES ('235356969','Jason Witten','Party Host','090343658','188 Victory Ln.','598 Jameson Dr.','2267815111',19);
INSERT INTO staff VALUES ('253745355','DeMaryius Thomas','Web Admin','090343658','188 Victory Ln.','600 Sigma St.','2267053090',20);
INSERT INTO staff VALUES ('844525234','DeMarcus Ware','Security','090343658','188 Victory Ln.','31 Granola Dr.','8005053111',21);
-- Brady's Theatre
INSERT INTO staff VALUES ('153647453','Seb Vollmer','Cashier','163732568','1701 Spygate Dr.','522 Ghost Dr.','4224537586',22);
INSERT INTO staff VALUES ('765435434','Ryan Clark','Concessions','163732568','1701 Spygate Dr.','81 London Dr.','2285560965',23);
INSERT INTO staff VALUES ('554647807','Brandon Lafell','Janitor','163732568','1701 Spygate Dr.','50 Peach Tree Ln.','2281006710',24);
INSERT INTO staff VALUES ('235264574','Danny Amendola','Screens Operator','163732568','1701 Spygate Dr.','12 Flavor Ln.','2257779091',25);
INSERT INTO staff VALUES ('657534521','Julian Edelman','Party Host','163732568','1701 Spygate Dr.','109 Weaving Ave.','2267815111',26);
INSERT INTO staff VALUES ('325262626','Chandler Jones','Web Admin','163732568','1701 Spygate Dr.','44 Timmon Ave.','2267053090',27);
INSERT INTO staff VALUES ('174241235','Rob Ninkovich','Security','163732568','1701 Spygate Dr.','35 Wright Pkwy.','8005053111',28);


-- manager:
INSERT INTO Manager_ VALUES ('302425250','Richard Sherman','667 Seashell Dr.','816 Fulton St.','2246730201',1);
INSERT INTO Manager_ VALUES ('978133765','Reggie Bush','28 Rush St.','452 Highland Dr.','5550650054',2);
INSERT INTO Manager_ VALUES ('190343658','Aaron Wroggers','188 Victory Ln.','75 Hillcrest Dr.','2507503005',3);
INSERT INTO Manager_ VALUES ('163732568','Bill Belichick','1701 Spygate Dr.','959 Pine St.','8003005283',4);

-- schedule:
-- work day: 12pm (noon) to 12 (midnight) since theatres open late morning

--Membertypes
INSERT INTO membertype VALUES('Platinum', 'A qualified member who has been an active consumer in our industry who regulary watches movies and reviews them.', 200, 25, 1);
INSERT INTO membertype VALUES('Gold', 'A very experienced member who regularly attends movies and posts reviews on the threads.', 100, 10, 2);
INSERT INTO membertype VALUES('Silver', 'An experienced member who is attending movies often or a regular on the reviews threads.', 50, 5, 3);
INSERT INTO membertype VALUES('Novice', 'The status of a newly acquinted member or member who is not a regular to the theatre', 0, 5, 4);

-- USER_ info
INSERT INTO user_ VALUES('kaner@blackhawks.com', '5370-6550-0012-0988', '8472286413', 'Patrick', 'Kane', 'Novice',1);
INSERT INTO user_ VALUES('tazer@blackhawks.com', '6671-7001-0019-2019', '8477139010', 'Jonathan', 'Toews','Gold',2);
INSERT INTO user_ VALUES('joooo@bulls.com', '3100-0054-9321-7721', '8860055721', 'Joakim', 'Noah', 'Silver',3);
INSERT INTO user_ VALUES('derrick_rose@bulls.com', '6501-0124-5550-1912', '8478034111', 'Derrick', 'Rose', 'Silver',4);
INSERT INTO user_ VALUES('interceptme@bears.com', '7700-0404-2012-8432', '8472620192', 'Jay', 'Cutler', 'Novice',5);
INSERT INTO user_ VALUES('homerunkid@cubs.com', '6501-0125-1204-1424', '2246596575', 'Kris', 'Bryant', 'Platinum',6);
INSERT INTO user_ VALUES('goldenglove44@cubs.com', '6671-7201-3422-5431', '2246386013', 'Anthony', 'Rizzo', 'Gold',7);
INSERT INTO user_ VALUES('paulie@sox.com', '7700-1231-2342-1024', '8007597422', 'Paul', 'Konnerko', 'Novice',8);
INSERT INTO user_ VALUES('jjohnston@redstars.com', '3100-9532-1402-2410', '8471789020', 'Julie', 'Johnston', 'Platinum', 9);
INSERT INTO user_ VALUES('mjlegend@hotmail.com', '3100-3210-4350-2432', '8513036006', 'Michael', 'Jordan', 'Platinum', 10);

-- registerinfo 
INSERT INTO REGISTERINFO VALUES('kaner@blackhawks.com', 'pkaner', 'bruh', '999 Thorne Ln.', 10, 10, 1);
INSERT INTO REGISTERINFO VALUES('tazer@blackhawks.com',	'captaintoews', 'hawks4life', '121 S. Adams St.', 120, 120, 2);
INSERT INTO REGISTERINFO VALUES('joooo@bulls.com', 'bbking13', 'basketball', '40 Roman Cir.', 90, 90, 3);
INSERT INTO REGISTERINFO VALUES('derrick_rose@bulls.com', 'adidasrose',	'123abc', '28 Roman Cir.'	,70, 70, 4);
INSERT INTO REGISTERINFO VALUES('interceptme@bears.com','pick6', 'gopackgo', '51 Hudson Dr.',0 ,0, 5);
INSERT INTO REGISTERINFO VALUES('homerunkid@cubs.com','hkbryant', 'gocubsgo','17 Fruitsalad Rd.', 250, 250, 6);
INSERT INTO REGISTERINFO VALUES('goldenglove44@cubs.com', 'flaminflave', 'rizzo', '7711 53rd St.', 150, 150, 7);
INSERT INTO REGISTERINFO VALUES('paulie@sox.com', 'paulk', 'whitesox','2381 Madison St.',30, 30, 8);
INSERT INTO REGISTERINFO VALUES('jjohnston@redstars.com', 'soccerislife19', '12345', '355 Stonehedge Ave.', 225, 225, 9);
INSERT INTO REGISTERINFO VALUES('mjlegend@hotmail.com',	'therealmj', 'lebronjames',	'95 Champions Dr.', 500, 500, 10);

-- TheatreThread
INSERT INTO THEATRETHREAD VALUES(1, 'paulk', '1701 Spygate Dr.','Why is everything so darn expensive?',41,to_date('10-DEC-2015 07.15.15 AM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO THEATRETHREAD VALUES(2, 'pick6', '28 Rush St.', 'WHERE ARE THE BATHROOMS?!??!',20,to_date('09-DEC-2015 04.44.22 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO THEATRETHREAD VALUES(3, 'pkaner', '28 Rush St.', 'Does this place have bathrooms?',3,to_date('07-DEC-2015 11.11.36 AM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO THEATRETHREAD VALUES(4, 'pkaner', '667 Seashell Dr.', 'When is the best time to visit the theatre? It''s always crowded.',80,to_date('10-DEC-2015 03.08.00 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO THEATRETHREAD VALUES(5, 'pkaner', '188 Victory Ln.', 'Concessions? More Concessions?',to_date('12-DEC-2015 09.25.11 AM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO THEATRETHREAD VALUES(6, 'soccerislife19', '1701 Spygate Dr.', 'I deserve a refund! This place ripped me off!',0, to_date('03-DEC-2015 02.15.53 AM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO THEATRETHREAD VALUES(7, 'captaintoews', '667 Seashell Dr.', 'How do I reserve a party room?',3, to_date('11-DEC-2015 07.36.03 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO THEATRETHREAD VALUES(8, 'bbking13',	'28 Rush St.', 'How do I apply for a job at your theatre?',0,to_date('10-DEC-2015 03.12.12 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO THEATRETHREAD VALUES(9, 'captaintoews', '1701 Spygate Dr.', 'Do you offer discounts?',0,to_date('05-DEC-2015 07.27.19 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO THEATRETHREAD VALUES(10, 'hkbryant', '188 Victory Ln.', 'How do I contact the manager?',0,to_date('08-DEC-2015 12.56.29 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO THEATRETHREAD VALUES(11, 'paulk', '188 Victory Ln.', 'What are the hours of operation?',0, to_date('11-DEC-2015 07.16.38 AM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO THEATRETHREAD VALUES(12, 'therealmj', '28 Rush St.', 'Mean employees and mischief: How do I contact the owner?',0, to_date('08-DEC-2015 09.55.58 AM','DD-MM-YYYY HH.MI.SS AM'));

-- TheatreResponses
INSERT INTO TheatreResponses Values (1, 2, 'whitesox', 'They have signs for the bathrooms.. LOOK UP!', to_date('10-DEC-2015 06.15.02 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO TheatreReponses VALUES(2,1, 'whitesox', 'welcome the movie theatre industry', o_date('10-DEC-2015 02.22.10 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO TheatreReponses VALUES(3,1, 'hkbryant', 'you can trying to bring your own snacks', o_date('10-DEC-2015 05.17.10 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO TheatreReponses VALUES(4,1, 'therealmj', 'but bringin your own food is not allowed', o_date('10-DEC-2015 06.22.30 PM','DD-MM-YYYY HH.MI.SS AM'));
INSERT INTO TheatreReponses VALUES(5,1, 'hkbryant', 'they''ll never know', to_date('10-DEC-2015 09.27.10 PM','DD-MM-YYYY HH.MI.SS AM'));

