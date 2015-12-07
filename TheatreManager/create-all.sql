/*
 * CREATE THE TABLES
 */
 
CREATE TABLE MovieTimes(
id int NOT NULL,
theatre varchar(255) NOT NULL, -- fk to theatre.address
screen int NOT NULL,
Movie varchar(255) NOT NULL, -- fk to movie.title
date_ date NOT NULL,
start_ varchar(5) NOT NULL);

CREATE TABLE Movie(
id int NOT NULL,
title varchar(32) PRIMARY KEY NOT NULL,
movietype varchar(32),
description varchar(2000),
release date);

CREATE TABLE Star_(
id int NOT NULL,
movie varchar(32) NOT NULL, -- fk to movie.title
name_ varchar(64) NOT NULL);	

CREATE TABLE Director(
id int NOT NULL,
movie varchar(32) PRIMARY KEY NOT NULL, -- fk to movie.title
name_ varchar(64));

CREATE TABLE Screen(
id int NOT NULL,
theatre varchar(255) NOT NULL, -- FK TO THEATRE.ADDRESS
screen int NOT NULL,
cap int NOT NULL);


CREATE TABLE TheatreReviews(
id int PRIMARY KEY NOT NULL, 
theatre varchar(255) NOT NULL, --fk to theatre.address
Reviewer varchar(32) NOT NULL, --fk to registerinfo.username
likes int,
dislikes int,
review varchar(2000));

CREATE TABLE MovieReviews(
id int PRIMARY KEY NOT NULL,
movie varchar(32) NOT NULL,			--fk to movie.title
Reviewer varchar(32) NOT NULL,	--fk to registerinfo.username
likes int,
dislikes int,
review varchar(2000));

--
-- Membership

CREATE TABLE MemberType(
id int NOT NULL,
type_ varchar(16) PRIMARY KEY NOT NULL,
description varchar(2000) NOT NULL,
pointsRequired int NOT NULL,
ptsperreview int NOT NULL);

CREATE TABLE creditCard(
id int NOT NULL,
ccnum varchar(19) PRIMARY KEY NOT NULL, --fk to user ccnum
expDate date, 
company varchar(16)
);

CREATE TABLE User_(
id int NOT NULL,
email varchar(255) PRIMARY KEY NOT NULL,
ccNum varchar(19) UNIQUE NOT NULL,
phone varchar(10) NOT NULL,
f_name varchar(32) NOT NULL,
l_name varchar(32) NOT NULL,
type_ varchar(16) NOT NULL); --fk to membertype.type

CREATE TABLE GuestInfo (
id int NOT NULL,
email varchar(255) PRIMARY KEY NOT NULL, 	--FK to user.email
theatre varchar(255) NOT NULL);			--fk to theatre.address

CREATE TABLE registerInfo(
id int NOT NULL,
email varchar(255) PRIMARY KEY NOT NULL,	--fk to user.email
username varchar(32) UNIQUE NOT NULL,
pass varchar(32) NOT NULL,
address varchar(255) NOT NULL,
points int NOT NULL,
pointEarned int NOT NULL);

CREATE TABLE MovieHistory(
id int NOT NULL,
username varchar(32) NOT NULL, --	fk to registerinfo.username
movie varchar(32) NOT NULL); --fk to movie.title

--
--Discussion Forum

CREATE TABLE MovieThread(
id int PRIMARY KEY NOT NULL,
user_ varchar(32) NOT NULL, 			--fk to registerinfo.username
movie varchar(32) NOT NULL,			--fk to movie.title
content_ varchar(2000) NOT NULL,
hits int NOT NULL);

CREATE TABLE MovieResponses(
id int PRIMARY KEY NOT NULL,
threadId int NOT NULL,							-- FK TO movieThread.id
user_ varchar(32) NOT NULL,					-- fk to registerInfo.username
content_ varchar(2000));

CREATE TABLE TheatreThread(
id int PRIMARY KEY NOT NULL,
user_ varchar(32) NOT NULL, 			--fk to registerinfo.username
theatre varchar(32) NOT NULL,			--fk to theatre.address
content_ varchar(2000) NOT NULL,
hits int NOT NULL);

CREATE TABLE TheatreResponses(
id int PRIMARY KEY NOT NULL,
threadId int NOT NULL,							-- fk to theatreThread.id
user_ varchar(32) NOT NULL,					-- fk to registerInfo.username
content_ varchar(2000)
);

--
--Theatre Staff and Functions

CREATE TABLE  Positions(
id int NOT NULL,
type_ varchar(16) PRIMARY KEY NOT NULL,
description varchar(2000),
privileges_ int NOT NULL);

CREATE TABLE staff(
id int NOT NULL,
ssn varchar(9) PRIMARY KEY NOT NULL,
name_ varchar(32) NOT NULL,
type_ varchar(16) NOT NULL,
hiredBy varchar(32) NOT NULL,					--fk to manager.ssn
location_ varchar(255) NOT NULL,				-- fk to theatre.address
address varchar(255) NOT NULL,
phone varchar(10) NOT NULL);

CREATE TABLE Manager_(
id int NOT NULL,
ssn varchar(9) PRIMARY KEY NOT NULL,
name_ varchar(32) NOT NULL,
location_ varchar(255) NOT NULL,			--fk to theatre.address
address varchar(255) NOT NULL,
phone varchar(10) NOT NULL);

CREATE TABLE Schedule(
id int NOT NULL,
ssn varchar(9) NOT NULL,	--fk to staff.ssn
date_ date NOT NULL,
start_ varchar(5) NOT NULL,
end_ varchar(5) NOT NULL,
type_ varchar(32) NOT NULL,					--fk to position.type
location_ varchar(255) NOT NULL,				--fk to theatre.address
id_ int NOT NULL);

CREATE TABLE Theatre(
id int NOT NULL,
address varchar(255) Primary key NOT NULL,
zip int NOT NULL,
screens int NOT NULL,
owner_ varchar(32) NOT NULL,
manager_ varchar(32) NOT NULL,		
price int NOT NULL,
sales int NOT NULL );

/* 
 *  CREATE AND PUT IN DATA
 */
 
/* ALL OF THE DATA VALUES FOR THE TABLES, BUT NOT THE TABLES*/

/* MEMBERTYPE values #*/
Insert into MEMBERTYPE values (1,'Platinum','A qualified member who has been an active consumer in our industry who regulary watches movies and reviews them.',200,25);
Insert into MEMBERTYPE values (2,'Gold','A very experienced member who regularly attends movies and posts reviews on the threads.',100,10);
Insert into MEMBERTYPE values (3,'Silver','An experienced member who is attending movies often or a regular on the reviews threads.',50,5);
Insert into MEMBERTYPE values (4,'Novice','The status of a newly acquinted member or member who is not a regular to the theatre',0,5);

/* MANAGER_ values # */
Insert into MANAGER_  values (1,'302425250','Richard Sherman','667 Seashell Dr.','816 Fulton St.','2246730201');
Insert into MANAGER_  values (2,'978133765','Reggie Bush','28 Rush St.','452 Highland Dr.','5550650054');
Insert into MANAGER_  values (3,'090343658','Aaron Wroggers','188 Victory Ln.','75 Hillcrest Dr.','2507503005');
Insert into MANAGER_  values (4,'163732568','Bill Belichick','1701 Spygate Dr.','959 Pine St.','8003005283');

/* GUESTINFO values */
Insert into GUESTINFO values (1,'rangerrick@gmail.com',90210);
Insert into GUESTINFO values (2,'hackerbot@usc.edu',60007);

/* POSITIONS values */
Insert into POSITIONS  values (1,'Cashier','Cash Handling, Operates the Cash Register',0);
Insert into POSITIONS  values (2,'Janitor','Cleans the bathrooms as well as the rest of the Theatre facility',0);
Insert into POSITIONS  values (3,'Manager','Manages employees, can schedule certain employees to work or remove them from work',1);
Insert into POSITIONS  values (4,'Party Host','Hosts birthday parties at the theatres',0);
Insert into POSITIONS  values (5,'Concessions','Handles the concessions stand and is responsible for the snacks of the theatre',0);
Insert into POSITIONS  values (6,'Screens Operator','Responsible for playing/operating the movies at the screens',0);
Insert into POSITIONS  values (7,'Security','Responsible for keeping the theatre safe and secure',0);
Insert into POSITIONS  values (8,'Web Admin','Responsible for updating/modifying the database and the movies at the theatre',2);



/* CREDITCARD values */
Insert into CREDITCARD values (1,'9999-9999-9999-9999',to_date('25-DEC-20','DD-MON-RR'),'NONE');
Insert into CREDITCARD values (2,'5370-6550-0012-0988',to_date('08-DEC-17','DD-MON-RR'),'VISA');
Insert into CREDITCARD values (3,'6671-7001-0019-2019',to_date('03-JUN-19','DD-MON-RR'),'DISCOVER');
Insert into CREDITCARD values (4,'3100-0054-9321-7721',to_date('25-MAY-16','DD-MON-RR'),'MASTERCARD');
Insert into CREDITCARD values (5,'6501-0124-5550-1912',to_date('08-APR-17','DD-MON-RR'),'VISA');
Insert into CREDITCARD values (6,'7700-0404-2012-8432',to_date('20-APR-17','DD-MON-RR'),'AMERICAN EXPRESS');
Insert into CREDITCARD values (7,'6501-0125-1204-1424',to_date('21-OCT-20','DD-MON-RR'),'VISA');
Insert into CREDITCARD values (8,'6671-7201-3422-5431',to_date('11-NOV-17','DD-MON-RR'),'DISCOVER');
Insert into CREDITCARD values (9,'7700-1231-2342-1024',to_date('13-SEP-18','DD-MON-RR'),'AMERICAN EXPRESS');
Insert into CREDITCARD values (10,'3100-9532-1402-2410',to_date('24-FEB-16','DD-MON-RR'),'MASTERCARD');
Insert into CREDITCARD values (11,'3100-3210-4350-2432',to_date('11-JUN-20','DD-MON-RR'),'MASTERCARD');

/* DIRECTOR values */
Insert into DIRECTOR values (1,'The Peanuts Movie','Steve Martino');
Insert into DIRECTOR values (2,'James Bond: Spectre','Sam Mendes');
Insert into DIRECTOR values (3,'Hunger Games: Mockingjay pt 2','Francis Lawrence');
Insert into DIRECTOR values (4,'The Martian','Ridley Scott');
Insert into DIRECTOR values (5,'Creed','Ryan Coogler');
Insert into DIRECTOR values (6,'The Good Dinosaur','Peter Sohn');
Insert into DIRECTOR values (7,'Pan','Joe Wright');
Insert into DIRECTOR values (8,'Love the Coopers','Jessie Nelson');
Insert into DIRECTOR values (9,'Star Wars: The Force Awakens','J.J. Abrams');
Insert into DIRECTOR values (10,'Concussion','Peter Landesman');
Insert into DIRECTOR values (11,'Joy','David Russell');
Insert into DIRECTOR values (12,'Hunger Games: Mockingjay pt 1','Francis Lawrence');
Insert into DIRECTOR values (13,'Hunger Games: Catching Fire','Francis Lawrence');
Insert into DIRECTOR values (14,'Elf','Jon Favreau');
Insert into DIRECTOR values (15,'Little Boy','Alejandro Monteverde');
Insert into DIRECTOR values (16,'Click','Frank Coraci');
Insert into DIRECTOR values (17,'Lockout','Stephen Leger');
Insert into DIRECTOR values (18,'August Rush','Kirsten Sheridan');
Insert into DIRECTOR values (19,'Monster House','Gil Kenan');
Insert into DIRECTOR values (20,'Freddy vs Jason','Ronny Yu');
Insert into DIRECTOR values (21,'Scream 4','Wes Craven');
Insert into DIRECTOR values (22,'The Human Centipede','Tom Six');
Insert into DIRECTOR values (23,'Earth','Deepa Mehta');

/* MOVIE VALUES #*/
Insert into MOVIE  values (1,'The Peanuts Movie','Family','Charlie Brown, the world’s most beloved underdog, embarks upon an epic and heroic quest, while his best pal, the lovable beagle Snoopy, takes to the skies to pursue his arch-nemesis, the Red Baron.',to_date('06-NOV-15','DD-MON-RR'));
Insert into MOVIE  values (2,'James Bond: Spectre','Action','A cryptic message from Bond’s past sends him on a trail to uncover a sinister organisation. While M battles political forces to keep the secret service alive, Bond peels back the layers of deceit to reveal the terrible truth behind SPECTRE.',to_date('01-NOV-15','DD-MON-RR'));
Insert into MOVIE  values (3,'Hunger Games: Mockingjay pt 2','Action','After being symbolized as the "Mockingjay", Katniss Everdeen and District 13 engage in an all-out revolution against the autocratic Capitol.',to_date('20-NOV-15','DD-MON-RR'));
Insert into MOVIE  values (4,'The Martian','Adventure','During a manned mission to Mars, Astronaut Mark Watney is presumed dead after a fierce storm and left behind by his crew. But Watney has survived and finds himself stranded and alone on the hostile planet.',to_date('02-OCT-15','DD-MON-RR'));
Insert into MOVIE  values (5,'Creed','Drama','Adonis Johnson never knew his famous father, world heavyweight champion Apollo Creed, who died before he was born.',to_date('25-NOV-15','DD-MON-RR'));
Insert into MOVIE  values (6,'The Good Dinosaur','Adventure','The Good Dinosaur asks the generations-old question: What if the asteroid that forever changed life on Earth missed the planet completely and giant dinosaurs never became extinct?',to_date('25-NOV-15','DD-MON-RR'));
Insert into MOVIE  values (7,'Pan','Adventure','Peter is a mischievous 12-year-old boy with an irrepressible rebellious streak, but in the bleak London orphanage where he has lived his whole life those qualities do not exactly fly.',to_date('09-OCT-15','DD-MON-RR'));
Insert into MOVIE  values (8,'Love the Coopers','Comedy','Love the Coopers follows the Cooper clan as four generations of extended family come together for their annual Christmas Eve celebration. As the evening unfolds, a series of unexpected visitors and unlikely events turn the night upside down.',to_date('13-NOV-15','DD-MON-RR'));
Insert into MOVIE  values (9,'Star Wars: The Force Awakens','Action','Lucasfilm and visionary director J.J. Abrams join forces to take you back again to a galaxy far, far away as Star Wars returns to the big screen with Star Wars: The Force Awakens.',to_date('18-DEC-15','DD-MON-RR'));
Insert into MOVIE  values (10,'Concussion','Drama','Will Smith stars in Concussion, a dramatic thriller based on the incredible true David vs. Goliath story of American immigrant Dr. Bennet Omalu, the brilliant forensic neuropathologist who made the first discovery of CTE.',to_date('25-DEC-15','DD-MON-RR'));
Insert into MOVIE  values (11,'Joy','Drama','JOY is the story of a family across four generations and the woman who rises to become founder and matriarch of a powerful family business dynasty. JOY stars Jennifer Lawrence in a film written and directed by David O. Russell.',to_date('25-DEC-15','DD-MON-RR'));
Insert into MOVIE  values (12,'Hunger Games: Mockingjay pt 1','Action','The worldwide phenomenon of The Hunger Games continues to set the world on fire with The Hunger Games: Mockingjay - Part 1, which finds Katniss Everdeen (Jennifer Lawrence) in District 13 after she literally shatters the games forever.',to_date('21-NOV-14','DD-MON-RR'));
Insert into MOVIE  values (13,'Hunger Games: Catching Fire','Action','As rebellion simmers, a cruel change in the Hunger Games may change Panem forever.',to_date('22-NOV-13','DD-MON-RR'));
Insert into MOVIE  values (14,'Elf','Comedy','A man (Will Ferrell) leaves Santa''s workshop to search for his family.',to_date('07-NOV-03','DD-MON-RR'));
Insert into MOVIE  values (15,'Little Boy','Drama','LITTLE BOY is a powerful and moving film about a little boy who is willing to do whatever it takes to bring his dad home from World War II alive.',to_date('24-APR-15','DD-MON-RR'));
Insert into MOVIE  values (16,'Click','Comedy','An architect obtains a universal remote that allows him to control his world.',to_date('23-JUN-06','DD-MON-RR'));
Insert into MOVIE  values (17,'Lockout','Action','A man is wrongly convicted of conspiracy to commit espionage against the U.S.',to_date('13-APR-12','DD-MON-RR'));
Insert into MOVIE  values (18,'August Rush','Drama','A boy (Freddie Highmore) uses his musical talent to find his parents.',to_date('21-NOV-07','DD-MON-RR'));
Insert into MOVIE  values (19,'Monster House','Horror','Three youths discover that the residence next door is an evil, living creature.',to_date('21-MAY-06','DD-MON-RR'));
Insert into MOVIE  values (20,'Freddy vs Jason','Horror','Razor-clawed Freddy (Robert Englund) battles masked killer Jason (Ken Kirzinger).',to_date('03-AUG-15','DD-MON-RR'));
Insert into MOVIE  values (21,'Scream 4','Horror','Ten years have passed, and Sidney Prescott, who has put herself back together thanks in part to her writing, is visited by the Ghostface Killer.',to_date('11-APR-15','DD-MON-RR'));
Insert into MOVIE  values (22,'The Human Centipede','Horror','Two women fall prey to a mad surgeon who wants to suture people together via their gastric systems.',to_date('30-APR-10','DD-MON-RR'));
Insert into MOVIE  values (23,'Earth','Other','Animal mothers struggle to raise their young in an increasingly harsh environment.',to_date('07-JUL-14','DD-MON-RR'));

/* USER_ values */
Insert into USER_ values (1,'admin@theatremgr.com','9999-9999-9999-9999','7777777777','Admin','Admin','Platinum');
Insert into USER_ values (2,'kaner@blackhawks.com','5370-6550-0012-0988','8472286413','Patrick','Kane','Novice');
Insert into USER_ values (3,'tazer@blackhawks.com','6671-7001-0019-2019','8477139010','Jonathan','Toews','Gold');
Insert into USER_ values (4,'joooo@bulls.com','3100-0054-9321-7721','8860055721','Joakim','Noah','Silver');
Insert into USER_ values (5,'derrick_rose@bulls.com','6501-0124-5550-1912','8478034111','Derrick','Rose','Silver');
Insert into USER_ values (6,'interceptme@bears.com','7700-0404-2012-8432','8472620192','Jay','Cutler','Novice');
Insert into USER_ values (7,'homerunkid@cubs.com','6501-0125-1204-1424','2246596575','Kris','Bryant','Platinum');
Insert into USER_ values (8,'goldenglove44@cubs.com','6671-7201-3422-5431','2246386013','Anthony','Rizzo','Gold');
Insert into USER_ values (9,'paulie@sox.com','7700-1231-2342-1024','8007597422','Paul','Konnerko','Novice');
Insert into USER_ values (10,'jjohnston@redstars.com','3100-9532-1402-2410','8471789020','Julie','Johnston','Platinum');
Insert into USER_ values (11,'mjlegend@hotmail.com','3100-3210-4350-2432','8513036006','Michael','Jordan','Platinum');

/* REGISTERINFO values */
Insert into REGISTERINFO  values (1,'admin@theatremgr.com','admin','admin','watching you',777,777);
Insert into REGISTERINFO  values (2,'kaner@blackhawks.com','pkaner','bruh','999 Thorne Ln.',10,10);
Insert into REGISTERINFO  values (3,'tazer@blackhawks.com','captaintoews','hawks4life','121 S. Adams St.',120,120);
Insert into REGISTERINFO  values (4,'joooo@bulls.com','bbking13','basketball','40 Roman Cir.',90,90);
Insert into REGISTERINFO  values (5,'derrick_rose@bulls.com','adidasrose','123abc','28 Roman Cir.',70,70);
Insert into REGISTERINFO  values (6,'interceptme@bears.com','pick6','gopackgo','51 Hudson Dr.',0,0);
Insert into REGISTERINFO  values (7,'homerunkid@cubs.com','hkbryant','gocubsgo','17 Fruitsalad Rd.',250,250);
Insert into REGISTERINFO  values (8,'goldenglove44@cubs.com','flaminflave','rizzo','7711 53rd St.',150,150);
Insert into REGISTERINFO  values (9,'paulie@sox.com','paulk','whitesox','2381 Madison St.',30,30);
Insert into REGISTERINFO  values (10,'jjohnston@redstars.com','soccerislife19','12345','355 Stonehedge Ave.',225,225);
Insert into REGISTERINFO  values (11,'mjlegend@hotmail.com','therealmj','lebronjames','95 Champions Dr.',500,500);

/* STAFF values */
Insert into STAFF  values (1,'102030121','Johnny Manziel','Cashier','302425250','667 Seashell Dr.','123 Round Ln.','8827689834');
Insert into STAFF  values (2,'541090292','Stevan Ridley','Concessions','302425250','667 Seashell Dr.','244 Peach Tree Ln.','8994202185');
Insert into STAFF  values (3,'235348701','Julio Jones','Janitor','302425250','667 Seashell Dr.','105 Apple Rd.','8338658426');
Insert into STAFF  values (4,'437188797','Andre Johnson','Screens Operator','302425250','667 Seashell Dr.','65 Shaw Blvd.','8445018305');
Insert into STAFF  values (5,'147269562','Tyler Lockett','Party Host','302425250','667 Seashell Dr.','34 Payton Ave.','8996415755');
Insert into STAFF  values (6,'543680853','Anthony Barr','Web Admin','302425250','667 Seashell Dr.','555 South St.','8114807566');
Insert into STAFF  values (7,'939016016','Ndamukong Suh','Security','302425250','667 Seashell Dr.','329 Kangaroo Rd.','8009757193');
Insert into STAFF  values (8,'492648375','Andrew Luck','Cashier','978133765','28 Rush St.','29 Jump St.','4224537586');
Insert into STAFF  values (9,'227598761','LeVeon Bell','Concessions','978133765','28 Rush St.','201 Blue Dr.','2285560965');
Insert into STAFF  values (10,'400532123','Dez Bryant','Janitor','978133765','28 Rush St.','412 Wabash Ave.','2281006710');
Insert into STAFF  values (11,'603434567','AJ Green','Screens Operator','978133765','28 Rush St.','77 Wallace Cir.','2257779091');
Insert into STAFF  values (12,'552506071','Jeremy Hill','Party Host','978133765','28 Rush St.','541 Vegas Ln.','2267815111');
Insert into STAFF  values (13,'323216456','Kellen Davis','Web Admin','978133765','28 Rush St.','80 Maple Rd.','2267053090');
Insert into STAFF  values (14,'145468792','Patrick Willis','Security','978133765','28 Rush St.','11 Banana Rd.','9432949219');
Insert into STAFF  values (15,'153647453','Seb Vollmer','Cashier','163732568','1701 Spygate Dr.','522 Ghost Dr.','8235214924');
Insert into STAFF  values (16,'765435434','Ryan Clark','Concessions','163732568','1701 Spygate Dr.','81 London Dr.','3294932933');
Insert into STAFF  values (17,'554647807','Brandon Lafell','Janitor','163732568','1701 Spygate Dr.','50 Peach Tree Ln.','1929414246');
Insert into STAFF  values (18,'235264574','Danny Amendola','Screens Operator','163732568','1701 Spygate Dr.','12 Flavor Ln.','6208530253');
Insert into STAFF  values (19,'657534521','Julian Edelman','Party Host','163732568','1701 Spygate Dr.','109 Weaving Ave.','2935929432');
Insert into STAFF  values (20,'325262626','Chandler Jones','Web Admin','163732568','1701 Spygate Dr.','44 Timmon Ave.','1994392354');
Insert into STAFF  values (21,'174241235','Rob Ninkovich','Security','163732568','1701 Spygate Dr.','35 Wright Pkwy.','7149325934');
Insert into STAFF  values (22,'432504393','Corey Fuller','Cashier','090343658','188 Victory Ln.','18 Manning Wy.','2341041024');
Insert into STAFF  values (23,'834772374','Wes Welker','Concessions','090343658','188 Victory Ln.','9 School Blvd.','9494329424');
Insert into STAFF  values (24,'238483884','Clay Matthews','Janitor','090343658','188 Victory Ln.','66 Triangle Pkwy.','1301239234');
Insert into STAFF  values (25,'586325156','Omar Bolden','Screens Operator','090343658','188 Victory Ln.','2010 1st St.','1392494239');
Insert into STAFF  values (26,'235356969','Jason Witten','Party Host','090343658','188 Victory Ln.','598 Jameson Dr.','2292041042');
Insert into STAFF  values (27,'253745355','DeMaryius Thomas','Web Admin','090343658','188 Victory Ln.','600 Sigma St.','3214942142');
Insert into STAFF  values (28,'844525234','DeMarcus Ware','Security','090343658','188 Victory Ln.','31 Granola Dr.','8412892149');

/* STAR_ values */
Insert into STAR_  values (1,'James Bond: Spectre','Daniel Craig');
Insert into STAR_  values (2,'Hunger Games: Mockingjay pt 2','Jennifer Lawrence');
Insert into STAR_  values (3,'The Martian','Matt Damon');
Insert into STAR_  values (4,'Creed','Sylvester Stallone');
Insert into STAR_  values (5,'The Peanuts Movie','Charlie Brown');
Insert into STAR_  values (6,'The Good Dinosaur','Raymond Ochoa');
Insert into STAR_  values (7,'Pan','Levi Miller');
Insert into STAR_  values (8,'Love the Coopers','John Goodman');
Insert into STAR_  values (9,'Star Wars: The Force Awakens','Harrison Ford');
Insert into STAR_  values (10,'Concussion','David Morse');
Insert into STAR_  values (11,'Joy','Jennifer Lawrence');
Insert into STAR_  values (12,'Hunger Games: Mockingjay pt 1','Jennifer Lawrence');
Insert into STAR_  values (13,'Hunger Games: Catching Fire','Jennifer Lawrence');
Insert into STAR_  values (14,'Elf','Will Ferrell');
Insert into STAR_  values (15,'Little Boy','Jakob Salvati');
Insert into STAR_  values (16,'Click','Adam Sandler');
Insert into STAR_  values (17,'Lockout','Guy Pearce');
Insert into STAR_  values (18,'August Rush','Freddie Highmore');
Insert into STAR_  values (19,'Monster House','Mitchel Musso');
Insert into STAR_  values (20,'Freddy vs Jason','Robert Englund');
Insert into STAR_  values (21,'Scream 4','Neve Campbell');
Insert into STAR_  values (22,'The Human Centipede','Laurence Harvey');
Insert into STAR_  values (23,'Earth','Animals');


/* THEATRE values # */
Insert into THEATRE  values (1,'667 Seashell Dr.',60610,10,'Russell Wilson','302425250',8,550);
Insert into THEATRE  values (2,'28 Rush St.',60616,10,'Adrian Peterson','978133765',8,238);
Insert into THEATRE  values (3,'188 Victory Ln.',60651,12,'Peyton Manning','090343658',10,380);
Insert into THEATRE  values (4,'1701 Spygate Dr.',60660,6,'Thomas Brady','163732568',14,109);

/* MOVIEREVIEWS values */
Insert into MOVIEREVIEWS values (1,'Scream 4','pkaner',0,0,'This movie scared the crap outta me. :OOOO');

/* THEATREREVIEWS */
Insert into THEATREREVIEWS values (1,'1701 Spygate Dr.','pkaner',3,1,'Really overpriced and expensive, but you get what you pay for: luxury');
Insert into THEATREREVIEWS values (2,'28 Rush St.','soccerislife19',2,2,'Poorly managed, really bad experience, would not recommend to a friend.');
Insert into THEATREREVIEWS values (3,'28 Rush St.','pkaner',1,8,'Don''t listen to the other reviews, this place is awesome!!!');
Insert into THEATREREVIEWS values (4,'667 Seashell Dr.','pick6',7,4,'Probably the best theatre in the area.');
Insert into THEATREREVIEWS values (5,'188 Victory Ln.','therealmj',25,0,'Love coming here for movies. I am a regular attendee.');
Insert into THEATREREVIEWS values (6,'188 Victory Ln.','captaintoews',10,2,'Excellent theatre and group of staff here!');
Insert into THEATREREVIEWS values (7,'1701 Spygate Dr.','pick6',4,5,'They nickeled and dimed me just for one movie. Ehhhh...');
Insert into THEATREREVIEWS values (8,'1701 Spygate Dr.','hkbryant',2,0,'Good. 8/10');
Insert into THEATREREVIEWS values (9,'28 Rush St.','bbking13',6,1,'A food fight during the middle of my movie ruined my experience here. Not coming back.');
Insert into THEATREREVIEWS values (10,'667 Seashell Dr.','pkaner',3,0,'Decent movie theatre. Has a good variety of movies.');

/* THEATRETHREAD values */
Insert into THEATRETHREAD  values (1,'paulk','1701 Spygate Dr.','Why is everything so darn expensive?',5);
Insert into THEATRETHREAD  values (2,'pick6','28 Rush St.','WHERE ARE THE BATHROOMS?!??!',12);
Insert into THEATRETHREAD  values (3,'pkaner','28 Rush St.','Does this place have bathrooms?',6);
Insert into THEATRETHREAD  values (4,'pkaner','667 Seashell Dr.','When is the best time to visit the theatre? It''s always crowded.',3);
Insert into THEATRETHREAD  values (5,'pkaner','188 Victory Ln.','Concessions? More Concessions?',5);
Insert into THEATRETHREAD  values (6,'soccerislife19','1701 Spygate Dr.','I deserve a refund! This place ripped me off!',9);
Insert into THEATRETHREAD  values (7,'captaintoews','667 Seashell Dr.','How do I reserve a party room?',21);
Insert into THEATRETHREAD  values (8,'bbking13','28 Rush St.','How do I apply for a job at your theatre?',16);
Insert into THEATRETHREAD  values (9,'captaintoews','1701 Spygate Dr.','Do you offer discounts?',13);
Insert into THEATRETHREAD  values (10,'hkbryant','188 Victory Ln.','How do I contact the manager?',12);
Insert into THEATRETHREAD  values (11,'paulk','188 Victory Ln.','What are the hours of operation?',17);
Insert into THEATRETHREAD  values (12,'therealmj','28 Rush St.','Mean employees and mischief: How do I contact the owner?',5);

/* MOVIETHREAD values */
INSERT INTO MOVIETHREAD VALUES(1,'bbking13','Creed','This movie was so inspirational. Was it for you?',24);
INSERT INTO MOVIETHREAD VALUES(2,'soccerislife19','Freddy vs Jason','Where did the lake scene get filmed, it looks really familiar?',14);
INSERT INTO MOVIETHREAD VALUES(3,'adidasrose','Concussion','Putting the movie into a real perspective.',8);
INSERT INTO MOVIETHREAD VALUES(4,'pkaner','August Rush','Is there going to be a sequel?',12);
INSERT INTO MOVIETHREAD VALUES(5,'captaintoews','Click','What was your favorite scene from Click?',10);
INSERT INTO MOVIETHREAD VALUES(6,'therealmj','Scream 4','What was your opinion on Scream 4?',6);

/* 
 * CREATE AND ADD CONSTRAINTS
 */

ALTER TABLE MovieTimes
ADD PRIMARY KEY (theatre, screen);

ALTER TABLE screen
ADD PRIMARY KEY (theatre,screen);

ALTER TABLE schedule
ADD PRIMARY KEY (ssn, date_);

ALTER TABLE moviehistory
ADD PRIMARY KEY(username, movie);

ALTER TABLE MovieTimes
ADD FOREIGN KEY (theatre) REFERENCES theatre(address);
ALTER TABLE MovieTimes
ADD FOREIGN KEY (movie) REFERENCES movie(title);

ALTER TABLE star_
ADD FOREIGN KEY (movie) REFERENCES movie(title);

ALTER TABLE director
ADD FOREIGN KEY (movie) REFERENCES movie(title);

ALTER TABLE screen 
ADD FOREIGN KEY (theatre) REFERENCES theatre(address);


ALTER TABLE TheatreReviews
ADD FOREIGN KEY (theatre) REFERENCES theatre(address);
ALTER TABLE TheatreReviews
ADD FOREIGN KEY (reviewer) REFERENCES registerInfo(username);

ALTER TABLE moviereviews
ADD FOREIGN KEY (movie) REFERENCES movie(title);
ALTER TABLE moviereviews
ADD FOREIGN KEY (reviewer) REFERENCES registerInfo(username);

ALTER TABLE creditcard
ADD FOREIGN KEY (ccnum) REFERENCES user_(ccnum);

ALTER TABLE user_ 
ADD FOREIGN KEY (type_) REFERENCES membertype(type_);

ALTER TABLE registerinfo 
ADD FOREIGN KEY (email) REFERENCES user_(email);

ALTER TABLE moviehistory 
ADD FOREIGN KEY (username) REFERENCES registerinfo(username);
ALTER TABLE moviehistory 
ADD FOREIGN KEY (movie) REFERENCES movie(title);

ALTER TABLE moviethread
ADD FOREIGN KEY (user_) REFERENCES registerinfo(username);
ALTER TABLE moviethread
ADD FOREIGN KEY (movie) REFERENCES movie(title);

ALTER TABLE movieresponses
ADD FOREIGN KEY (threadid) REFERENCES moviethread(id);
ALTER TABLE movieresponses
ADD FOREIGN KEY (user_) REFERENCES registerinfo(username);

ALTER TABLE theatrethread
ADD FOREIGN KEY (user_) REFERENCES registerinfo(username);
ALTER TABLE theatrethread
ADD FOREIGN KEY (theatre) REFERENCES theatre(address);

ALTER TABLE theatreresponses
ADD FOREIGN KEY (threadid) REFERENCES moviethread(id);
ALTER TABLE theatreresponses
ADD FOREIGN KEY (user_) REFERENCES registerinfo(username);

ALTER TABLE staff
ADD FOREIGN KEY (hiredby) REFERENCES manager_(ssn);
ALTER TABLE staff
ADD FOREIGN KEY (location_) REFERENCES theatre(address);

ALTER TABLE manager_
ADD FOREIGN KEY (location_) REFERENCES theatre(address);

ALTER TABLE schedule
ADD FOREIGN KEY (ssn) REFERENCES staff(ssn);
ALTER TABLE schedule
ADD FOREIGN KEY (type_) REFERENCES positions(type_);
ALTER TABLE schedule
ADD FOREIGN KEY (location_) REFERENCES theatre(address);
