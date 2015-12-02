-- This file is used to insert data into the database, feel free to add on data.
-- I haven't done data for every table, so don't add this stuff in just yet

-- Theatre Data
INSERT INTO Theatre VALUES ('667 Seashell Dr.',90210,10,'Russell Wilson','302425250', 5.99);
INSERT INTO Theatre VALUES ('28 Rush St.',55405,10,'Adrian Peterson','978133765', 7.99);
INSERT INTO Theatre VALUES ('188 Victory Ln.',80204,12,'Peyton Manning','090343658', 6.99);
INSERT INTO Theatre VALUES ('1701 Spygate Dr.',12035,6,'Thomas Brady','163732568', 12.99);

-- Movies Data
-- movietypes: Family, Action, Adventure, Horror, Drama, Comedy, Other
INSERT INTO Movies VALUES ('The Peanuts Movie','Family','Charlie Brown, the world’s most beloved underdog, embarks upon an epic and heroic quest, while his best pal, the lovable beagle Snoopy, takes to the skies to pursue his arch-nemesis, the Red Baron.',to_date('2015/11/06','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('James Bond: Spectre','Action','A cryptic message from Bond’s past sends him on a trail to uncover a sinister organisation. While M battles political forces to keep the secret service alive, Bond peels back the layers of deceit to reveal the terrible truth behind SPECTRE.', to_date('2015/11/0','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('Hunger Games: Mockingjay pt 2','Action','After being symbolized as the "Mockingjay", Katniss Everdeen and District 13 engage in an all-out revolution against the autocratic Capitol.', to_date('2015/11/20','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('The Martian','Adventure','During a manned mission to Mars, Astronaut Mark Watney is presumed dead after a fierce storm and left behind by his crew. But Watney has survived and finds himself stranded and alone on the hostile planet.', to_date('2015/10/02','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('Creed','Drama','Adonis Johnson never knew his famous father, world heavyweight champion Apollo Creed, who died before he was born.', to_date('2015/11/25','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('The Good Dinosaur','Adventure','The Good Dinosaur asks the generations-old question: What if the asteroid that forever changed life on Earth missed the planet completely and giant dinosaurs never became extinct?', to_date('2015/11/25','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('Pan','Adventure','Peter is a mischievous 12-year-old boy with an irrepressible rebellious streak, but in the bleak London orphanage where he has lived his whole life those qualities do not exactly fly.', to_date('2015/10/09','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('Love the Coopers','Comedy','Love the Coopers follows the Cooper clan as four generations of extended family come together for their annual Christmas Eve celebration. As the evening unfolds, a series of unexpected visitors and unlikely events turn the night upside down.', to_date('2015/11/13','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('Star Wars: The Force Awakens','Action','Lucasfilm and visionary director J.J. Abrams join forces to take you back again to a galaxy far, far away as Star Wars returns to the big screen with Star Wars: The Force Awakens.',to_date('2015/12/18','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('Concussion','Drama','Will Smith stars in Concussion, a dramatic thriller based on the incredible true David vs. Goliath story of American immigrant Dr. Bennet Omalu, the brilliant forensic neuropathologist who made the first discovery of CTE.', to_date('2015/12/25','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('Joy','Drama','JOY is the story of a family across four generations and the woman who rises to become founder and matriarch of a powerful family business dynasty. JOY stars Jennifer Lawrence in a film written and directed by David O. Russell.', to_date('2015/12/25','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('Hunger Games: Mockingjay pt 1','Action','The worldwide phenomenon of The Hunger Games continues to set the world on fire with The Hunger Games: Mockingjay - Part 1, which finds Katniss Everdeen (Jennifer Lawrence) in District 13 after she literally shatters the games forever.', to_date('2014/11/21','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('Hunger Games: Catching Fire','Action','As rebellion simmers, a cruel change in the Hunger Games may change Panem forever.', to_date('2013/11/22','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('Elf','Comedy','A man (Will Ferrell) leaves Santa''s workshop to search for his family.', to_date('2003/11/07','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('Little Boy','Drama','LITTLE BOY is a powerful and moving film about a little boy who is willing to do whatever it takes to bring his dad home from World War II alive.', to_date('2015/04/24','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('Click','Comedy','An architect obtains a universal remote that allows him to control his world.', to_date('2006/06/23','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('Lockout','Action','A man is wrongly convicted of conspiracy to commit espionage against the U.S.', to_date('2012/04/13','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('August Rush','Drama','A boy (Freddie Highmore) uses his musical talent to find his parents.', to_date('2007/11/21','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('Monster House','Horror','Three youths discover that the residence next door is an evil, living creature.', to_date('2006/05/21','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('Freddy vs Jason','Horror','Razor-clawed Freddy (Robert Englund) battles masked killer Jason (Ken Kirzinger).', to_date('2015/08/03','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('Scream 4','Horror','Ten years have passed, and Sidney Prescott, who has put herself back together thanks in part to her writing, is visited by the Ghostface Killer.', to_date('2015/04/11','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('The Human Centipede','Horror','Two women fall prey to a mad surgeon who wants to suture people together via their gastric systems.', to_date('2010/04/30','yyyy/mm/dd'));
INSERT INTO Movies VALUES ('Earth','Other','Animal mothers struggle to raise their young in an increasingly harsh environment.', to_date('2014/07/07','yyyy/mm/dd'));

-- Positions

-- priveleges_: 
-- 0, can add/drop shifts on timetable
-- 1, can modify 0's shifts on timetable and can add/drop personal shifts
-- 2, can access and modify the movie database, but cannot touch the 0's and 1's shifts

INSERT INTO Positions VALUES ('Cashier','Responsible for greeting customers and operating the cash register for ticket sales',0);
INSERT INTO Positions VALUES ('Concessions','Responsible for selling snacks and drinks to the customers',0);
INSERT INTO Positions VALUES ('Janitor','Responsible for maintaining the cleanliness of the movie theater',0);
INSERT INTO Positions VALUES ('Screens Operator','Responsible for playing/operating the movies at the screens',0);
INSERT INTO Positions VALUES ('Party Host','Responsible for coordinating/organizing parties at the theatre',0);
INSERT INTO Positions VALUES ('Security','Responsible for keeping the theatre safe and secure',0);
INSERT INTO Positions VALUES ('Manager','Responsible for managing employees and scheduling their shifts',1);
INSERT INTO Positions VALUES ('Web Admin','Responsible for updating/modifying the database and the movies at the theatre',2);

-- staff:
-- Russell Wilson's Theatre (i.e my fantasy team)
INSERT INTO staff VALUES ('102030121','Johnny Manziel','Cashier','302425250','667 Seashell Dr.','8827689834');
INSERT INTO staff VALUES ('541090292','Stevan Ridley','Concessions','302425250','667 Seashell Dr.','8994202185');
INSERT INTO staff VALUES ('235348701','Julio Jones','Janitor','302425250','667 Seashell Dr.','8338658426');
INSERT INTO staff VALUES ('437188797','Andre Johnson','Screens Operator','302425250','667 Seashell Dr.','8445018305');
INSERT INTO staff VALUES ('147269562','Tyler Lockett','Party Host','302425250','667 Seashell Dr.','8996415755');
INSERT INTO staff VALUES ('543680853','Anthony Barr','Web Admin','302425250','667 Seashell Dr.','8114807566');
INSERT INTO staff VALUES ('939016016','Ndamukong Suh','Security','302425250','667 Seashell Dr.','8009757193');
-- All Day's Theatre
INSERT INTO staff VALUES ('492648375','Andrew Luck','Cashier','978133765','28 Rush St.','4224537586');
INSERT INTO staff VALUES ('227598761','LeVeon Bell','Concessions','978133765','28 Rush St.','2285560965');
INSERT INTO staff VALUES ('000532123','Dez Bryant','Janitor','978133765','28 Rush St.','2281006710');
INSERT INTO staff VALUES ('603434567','AJ Green','Screens Operator','978133765','28 Rush St.','2257779091');
INSERT INTO staff VALUES ('552506071','Jeremy Hill','Party Host','978133765','28 Rush St.','2267815111');
INSERT INTO staff VALUES ('323216456','Kellen Davis','Web Admin','978133765','28 Rush St.','2267053090');
INSERT INTO staff VALUES ('145468792','Patrick Willis','Security','978133765','28 Rush St.','8005053111');

-- manager:
INSERT INTO Manager_ VALUES ('302425250','Richard Sherman','667 Seashell Dr.','816 Fulton St.','2246730201');
INSERT INTO Manager_ VALUES ('978133765','Reggie Bush','28 Rush St.','452 Highland Dr.','5550650054');
INSERT INTO Manager_ VALUES ('090343658','Aaron Wroggers','188 Victory Ln.','75 Hillcrest Dr.','2507503005');
INSERT INTO Manager_ VALUES ('163732568','Bill Belichick','1701 Spygate Dr.','959 Pine St.','8003005283');
