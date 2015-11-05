
-- THEATRES AND MOVIES
CREATE TABLE Theatre(
address varchar(255) Primary key NOT NULL,
zip int NOT NULL,
screens int NOT NULL,
owner varchar(32) NOT NULL,
manager varchar(32) NOT NULL ); -- FK to manager.ssn

CREATE TABLE MovieTimes(
theatre varchar(255) PRIMARY KEY NOT NULL, -- fk to theatre.address
screen int PRIMARY KEY NOT NULL, --fk to screen.num
Movie varchar(255) NOT NULL, -- fk to movie.title
start timestamp NOT NULL,
end timestamp NOT NULL);

CREATE TABLE Movie(
title varchar(32) PRIMARY KEY NOT NULL,
movietype varchar(32),
description varchar(MAX));

CREATE TABLE Star(
movie varchar(43) PRIMARY KEY NOT NULL, -- fk to movie.title
name varchar(64) NOT NULL);	

CREATE TABLE Director(
movie varchar(32) PRIMARY KEY NOT NULL, -- fk to movie.title
name varchar(64));

CREATE TABLE Screen(
theatre varchar(255) PRIMARY KEY NOT NULL, -- FK TO THEATRE.ADDRESS
num int);

CREATE TABLE ScreenCap (
screen int, -- fk to screen.num
capacity int);

CREATE TABLE TheatreReviews(
id int PRIMARY KEY NOT NULL, 
theatre varchar(255) NOT NULL, --fk to theatre.address
Reviewer varchar(64) NOT NULL, --fk to registerinfo.username
likes int,
dislikes int
review varchar(max));

CREATE TABLE MovieReviews(
id int PRIMARY KEY NOT NULL,
movie varchar(32) NOT NULL,			--fk to movie.title
Reviewer varchar(64) NOT NULL,	--fk to registerinfo.username
likes int,
dislikes int
review varchar(max));

-- Membership
CREATE TABLE MemberType(
type varchar(16) PRIMARY KEY NOT NULL,
description varchar(max) NOT NULL,
pointsRequired int NOT NULL);

CREATE TABLE creditCard(
ccnum varchar(19) PRIMARY KEY NOT NULL, --fk to user ccnum
expDate date, 
company varchar(16)
);

CREATE TABLE User(
email varchar(255) PRIMARY KEY NOT NULL,
ccNum varchar(19),
phone varchar(10),
f_name varchar(32),
l_name varchar(32),
type varchar(16) --fk to membertype.type
);

CREATE TABLE GuestInfo (
email varchar(255) PRIMARY KEY NOT NULL, 	--FK to user.email
movie varchar(64) NOT NULL								--fk to movie.title
);

CREATE TABLE registerInfo(
email varchar(255) PRIMARY KEY NOT NULL,	--fk to user.email
username varchar(32) UNIQUE NOT NULL,
password varchar(32) NOT NULL,
address varchar(255) NOT NULL,
points int NOT NULL,
pointEarned int NOT NULL);

CREATE TABLE MovieHistory(
username varchar(32) PRIMARY KEY NOT NULL, --	fk to registerinfo.username
movie varchar(32) NOT NULL, --fk to movie.title
);
