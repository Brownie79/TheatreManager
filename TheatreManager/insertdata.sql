-- This file is used to insert data into the database, feel free to add on data.
-- I haven't done data for every table, so don't add this stuff in just yet

-- Theatre Data
INSERT INTO Theatre(address,zip,screens,owner_,manager_)
VALUES ('667 Seashell Dr.',90210,10,'Charles Hutchinson','302425250'),
('1001 Golden St.',34421,8,'James Hodge','427314256'),
('35 Harlem Rd.',60610,12,'Andrew Ripka','423842813'),
('455 Honeysuckle Pl.',80002,8,'John Stone','698968321'),
('3241 S Wabash Ave.',60616,8,'Alfred duPont','768723414'),
('77 Clearmount Cir.',60001,4,'Duane Williams','608765243'),
('28 Rush St.',55405,10,'Adrian Peterson','978133765'),
('188 Victory Ln.',80204,12,'Peyton Manning','090343658'),
('1701 Spygate Dr.',02035,6,'Thomas Brady','163732568');

-- Movies Data
-- movietypes: Family, Action, Adventure, Horror, Drama, Comedy, Other
INSERT INTO Movies(title, movietype, description, release)
VALUES ('The Peanuts Movie','Family','Charlie Brown, the world’s most beloved underdog, embarks upon an epic and heroic quest, while his best pal, the lovable beagle Snoopy, takes to the skies to pursue his arch-nemesis, the Red Baron.','06-NOV-15'),
('James Bond: Spectre','Action','A cryptic message from Bond’s past sends him on a trail to uncover a sinister organisation. While M battles political forces to keep the secret service alive, Bond peels back the layers of deceit to reveal the terrible truth behind SPECTRE.','06-NOV-15'),
('Hunger Games: Mockingjay pt 2','Action','After being symbolized as the "Mockingjay", Katniss Everdeen and District 13 engage in an all-out revolution against the autocratic Capitol.','20-NOV-15'),
('The Martian','Adventure','During a manned mission to Mars, Astronaut Mark Watney is presumed dead after a fierce storm and left behind by his crew. But Watney has survived and finds himself stranded and alone on the hostile planet.','02-OCT-15'),
('Creed','Drama','Adonis Johnson never knew his famous father, world heavyweight champion Apollo Creed, who died before he was born.','25-NOV-15'),
('The Good Dinosaur','Adventure','The Good Dinosaur asks the generations-old question: What if the asteroid that forever changed life on Earth missed the planet completely and giant dinosaurs never became extinct?','25-NOV-15'),
('Pan','Adventure','Peter is a mischievous 12-year-old boy with an irrepressible rebellious streak, but in the bleak London orphanage where he has lived his whole life those qualities do not exactly fly.','09-OCT-15'),
('Love the Coopers','Comedy','Love the Coopers follows the Cooper clan as four generations of extended family come together for their annual Christmas Eve celebration. As the evening unfolds, a series of unexpected visitors and unlikely events turn the night upside down.','13-NOV-15'),
('Star Wars: The Force Awakens','Action','Lucasfilm and visionary director J.J. Abrams join forces to take you back again to a galaxy far, far away as Star Wars returns to the big screen with Star Wars: The Force Awakens.','18-DEC-15'),
('Concussion','Drama','Will Smith stars in Concussion, a dramatic thriller based on the incredible true David vs. Goliath story of American immigrant Dr. Bennet Omalu, the brilliant forensic neuropathologist who made the first discovery of CTE.','25-DEC-15'),
('Joy','Drama','JOY is the story of a family across four generations and the woman who rises to become founder and matriarch of a powerful family business dynasty. JOY stars Jennifer Lawrence in a film written and directed by David O. Russell.','25-DEC-15'),
('Hunger Games: Mockingjay pt 1','Action','The worldwide phenomenon of The Hunger Games continues to set the world on fire with The Hunger Games: Mockingjay - Part 1, which finds Katniss Everdeen (Jennifer Lawrence) in District 13 after she literally shatters the games forever.','21-NOV-14'),
('Hunger Games: Catching Fire','Action','As rebellion simmers, a cruel change in the Hunger Games may change Panem forever.','22-NOV-13'),
('Elf','Comedy','A man (Will Ferrell) leaves Santa''s workshop to search for his family.','07-NOV-03'),
('Little Boy','Drama','LITTLE BOY is a powerful and moving film about a little boy who is willing to do whatever it takes to bring his dad home from World War II alive.','24-APR-15'),
('Click','Comedy','An architect obtains a universal remote that allows him to control his world.','23-JUN-06'),
('Lockout','Action','A man is wrongly convicted of conspiracy to commit espionage against the U.S.','13-APR-12'),
('August Rush','Drama','A boy (Freddie Highmore) uses his musical talent to find his parents.','21-NOV-07'),
('Monster House','Horror','Three youths discover that the residence next door is an evil, living creature.','21-JUL-06'),
('Freddy vs Jason','Horror','Razor-clawed Freddy (Robert Englund) battles masked killer Jason (Ken Kirzinger).','15-AUG-03'),
('Scream 4','Horror','Ten years have passed, and Sidney Prescott, who has put herself back together thanks in part to her writing, is visited by the Ghostface Killer.','15-APR-11'),
('The Human Centipede','Horror','Two women fall prey to a mad surgeon who wants to suture people together via their gastric systems.','30-APR-10'),
('Earth','Other','Animal mothers struggle to raise their young in an increasingly harsh environment.','14-JUL-07');

-- Positions

-- priveleges_: 
-- 0, can add/drop shifts on timetable
-- 1, can modify 0's shifts on timetable and can add/drop personal shifts
-- 2, can access and modify the movie database, but cannot touch the 0's and 1's shifts

INSERT INTO Positions(type_, description, privileges_)
VALUES ('Cashier','Responsible for greeting customers and operating the cash register for ticket sales',0),
('Concessions','Responsible for selling snacks and drinks to the customers',0),
('Janitor','Responsible for maintaining the cleanliness of the movie theater',0),
('Screens Operator','Responsible for playing/operating the movies at the screens',0),
('Party Host','Responsible for coordinating/organizing parties at the theatre',0),
('Manager','Responsible for managing employees and scheduling their shifts',1),
('Web Admin','Responsible for updating/modifying the database and the movies at the theatre',2);

-- staff:
INSERT INTO staff(ssn, name_, type_, hiredBy, location_, address, phone)
VALUES ('102030121','Johnny Manziel','Cashier','302425250','667 Seashell Dr.','8827689834'),
('541090292','Stevan Ridley','Concessions','302425250','667 Seashell Dr.','8994202185'),
('235348701','Julio Jones','Janitor','302425250','667 Seashell Dr.','8338658426'),
('437188797','Andre Johnson','Screens Operator','302425250','667 Seashell Dr.','8445018305'),
('147269562','Tyler Lockett','Party Host','302425250','667 Seashell Dr.','8996415755'),
('543680853','Anthony Barr','Web Admin','302425250','667 Seashell Dr.','8114807566');


-- manager:
INSERT INTO Manager_(ssn,name_,location_,address,phone)
VALUES ('302425250','Tom Wrigglesworth','667 Seashell Dr.','816 Fulton St.','2246730201'),
('427314256','Daniel Thomas','1001 Golden St.','353 East St.','8007593000'),
('423842813','J.J Johnson','35 Harlem Rd.','522 Summit St.','3357579001'),
('698968321','Johnathan Cena','455 Honeysuckle Pl.','665 Lawrence St.','8716980042'),
('768723414','Brandon Wallace','3241 S Wabash Ave.','622 2nd Ave.','7002482045'),
('608765243','Lucas Leighner','77 Clearmount Cir.','76 King St.','8472286701'),
('978133765','Richard Paulsen','28 Rush St.','452 Highland Dr.','5550650054'),
('090343658','Aaron Wroggers','188 Victory Ln.','75 Hillcrest Dr.','2507503005'),
('163732568','Michael Hu','1701 Spygate Dr.','959 Pine St.','8003005283');
