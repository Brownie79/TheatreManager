--
-- THEATRES AND MOVIES

CREATE TABLE Theatre(
address varchar(255) Primary key NOT NULL,
zip int NOT NULL,
screens int NOT NULL,
owner_ varchar(32) NOT NULL,
manager_ varchar(32) NOT NULL ); -- FK to manager.ssn

CREATE TABLE MovieTimes(
theatre varchar(255) PRIMARY KEY NOT NULL, -- fk to theatre.address
screen int NOT NULL, --fk to screen.num
Movie varchar(255) NOT NULL, -- fk to movie.title
start_ timestamp NOT NULL,
end_ timestamp NOT NULL);

CREATE TABLE Movie(
title varchar(32) PRIMARY KEY NOT NULL,
movietype varchar(32),
description varchar(2000));

CREATE TABLE Star(
movie varchar(43) PRIMARY KEY NOT NULL, -- fk to movie.title
name_ varchar(64) NOT NULL);	

CREATE TABLE Director(
movie varchar(32) PRIMARY KEY NOT NULL, -- fk to movie.title
name_ varchar(64));

CREATE TABLE Screen(
theatre varchar(255) PRIMARY KEY NOT NULL, -- FK TO THEATRE.ADDRESS
num_ int);

CREATE TABLE ScreenCap (
screen int PRIMARY KEY , -- fk to screen.num
cap int);

CREATE TABLE TheatreReviews(
id int PRIMARY KEY NOT NULL, 
theatre varchar(255) NOT NULL, --fk to theatre.address
Reviewer varchar(64) NOT NULL, --fk to registerinfo.username
likes int,
dislikes int,
review varchar(2000));

CREATE TABLE MovieReviews(
id_ int PRIMARY KEY NOT NULL,
movie varchar(32) NOT NULL,			--fk to movie.title
Reviewer varchar(64) NOT NULL,	--fk to registerinfo.username
likes int,
dislikes int,
review varchar(2000));

--
-- Membership

CREATE TABLE MemberType(
type_ varchar(16) PRIMARY KEY NOT NULL,
description varchar(2000) NOT NULL,
pointsRequired int NOT NULL);

CREATE TABLE creditCard(
ccnum varchar(19) PRIMARY KEY NOT NULL, --fk to user ccnum
expDate date, 
company varchar(16)
);

CREATE TABLE User_(
email varchar(255) PRIMARY KEY NOT NULL,
ccNum varchar(19) NOT NULL,
phone varchar(10) NOT NULL,
f_name varchar(32) NOT NULL,
l_name varchar(32) NOT NULL,
type_ varchar(16) NOT NULL --fk to membertype.type
);

CREATE TABLE GuestInfo (
email varchar(255) PRIMARY KEY NOT NULL, 	--FK to user.email
movie varchar(64) NOT NULL			--fk to movie.title
);

CREATE TABLE registerInfo(
email varchar(255) PRIMARY KEY NOT NULL,	--fk to user.email
username varchar(32) UNIQUE NOT NULL,
pass varchar(32) NOT NULL,
address varchar(255) NOT NULL,
points int NOT NULL,
pointEarned int NOT NULL);

CREATE TABLE MovieHistory(
username varchar(32) PRIMARY KEY NOT NULL, --	fk to registerinfo.username
movie varchar(32) NOT NULL --fk to movie.title
);


--
--Discussion Forum

CREATE TABLE MovieThread(
id_ int PRIMARY KEY NOT NULL,
user_ varchar(32) NOT NULL, 					--fk to registerinfo.username
movie varchar(32) NOT NULL,					--fk to movie.title
content_ varchar(2000) NOT NULL,
time_ timestamp NOT NULL);

CREATE TABLE MovieThreadResponses(
id_ int PRIMARY KEY NOT NULL,
threadId int NOT NULL,							-- FK TO movieThread.id
user_ varchar(32) NOT NULL,					-- fk to registerInfo.username
content_ varchar(2000),
time_ timestamp NOT NULL
);

CREATE TABLE TheatreThread(
id_ int PRIMARY KEY NOT NULL,
user_ varchar(32) NOT NULL, 					--fk to registerinfo.username
theatre varchar(32) NOT NULL,					--fk to movie.title
content_ varchar(2000) NOT NULL,
time_ timestamp NOT NULL);

CREATE TABLE TheatreResponses(
id_ int PRIMARY KEY NOT NULL,
threadId int NOT NULL,							-- fk to theatreThread.id
user_ varchar(32) NOT NULL,					-- fk to registerInfo.username
content_ varchar(2000),
time_ timestamp NOT NULL
);

--
--Theatre Staff and Functions

CREATE TABLE  Positions(
type_ varchar(16) PRIMARY KEY NOT NULL,
description varchar(2000),
privileges_ int NOT NULL
);

CREATE TABLE staff(
ssn varchar(9) PRIMARY KEY NOT NULL,
name_ varchar(32) NOT NULL,
type_ varchar(16) NOT NULL,
hiredBy varchar(32) NOT NULL,					--fk to manager.ssn
location_ varchar(255) NOT NULL,				-- fk to theatre.address
address varchar(255) NOT NULL,
phone varchar(10) NOT NULL
);

CREATE TABLE Manager(
ssn varchar(9) PRIMARY KEY NOT NULL,
name_ varchar(32) NOT NULL,
location_ varchar(255) NOT NULL,				--fk to theatre.address
address varchar(255) NOT NULL,
phone varchar(10) NOT NULL
);

CREATE TABLE Schedule(
staff varchar(9) PRIMARY KEY NOT NULL,	--fk to staff.ssn
start_ date NOT NULL,
end_ date NOT NULL,
type_ varchar(32) NOT NULL,							--fk to position.type
location_ varchar(255) NOT NULL					--fk to theatre.address
);