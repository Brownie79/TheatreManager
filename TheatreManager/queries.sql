/* When a user purchases a ticket for a certain theatre, ADD the ticket value of the theatre
   to the total sales of the theatre. Just makes life a lot easier. */
   
   /* Also, keep track of the current date and time on the java end */
   
-- AUTHORIZATION AND PRIVILEGES
-- STILL UPDATING

-- GENERAL PROCESSES
-- STILL UPDATING

-- QUERIES:
=================================
Query #1:
=================================

	// Have 2 Drop down boxes specifying entering the 'movie' or 'theatre' threads to see the 3 most recent comments
	// The second drop down box showing all the threads
	
	String newThreadtype; // set to movie when the drop down for movie is selected, set to theatre when the drop down for theatre is selected
	int threadNum;
	
	/* *** SHOWING THREAD INFORMATION IN DROP DOWN *** */
	FOR MOVIETHREAD: This displays the movie and the content in each row of the drop down menu
		--------------------
		
		SELECT MOVIE, CONTENT_
		FROM MOVIETHREAD;
		
		--------------------
	FOR THEATRETHREAD: This displays the theatre and the content in each row of the drop down menu
		--------------------
		
		SELECT THEATRE, CONTENT_
		FROM THEATRETHREAD;
		
		--------------------
	
	/* *** RETURNING RECENT COMMENTS QUERIES *** */
	if(newThreadtype.equals("movie")){
		--------------------
		
		SELECT THREADID, USER_, CONTENT_
		FROM (SELECT * FROM MOVIERESPONSES WHERE ? IN THREADID ORDER BY ID ASC)
		WHERE ROWNUM <= 3; 
		
		-- ? indicates thread number
		--------------------
		// if the return is NULL, say: either there are no responses or this thread does not exist
	} else if(newThreadtype.equals("theatre")) {
		--------------------
		
		SELECT THREADID, USER_, CONTENT_
		FROM (SELECT * FROM THEATRERESPONSES WHERE ? IN THREADID ORDER BY ID ASC)
		WHERE ROWNUM <= 3;
		
		-- ? indicates thread number
		--------------------
		// if the return is NULL, say: either there are no responses or this thread does not exist
	} else {
		// exit dialog box, throw an error, user has to enter a valid thread topic (either movie or theatre)
	}

/* #2. Display the 3 most recent discussions/comments from all specific discussion threads
	   NOTE: Also print out 'as a response to: '+content of the thread substring of 100 chars
	   NOTE2: Most recent thread responses will come first.
*/

SELECT THREADID, USER_, CONTENT_
FROM (SELECT * FROM THEATRERESPONSES ORDER BY ID DESC)
WHERE ROWNUM <= 3;

/*
 *#3. Display the least popular discussion thread in terms of visits and comments.
 */
SELECT content_, hits
FROM(
    Select content_, hits 
    FROM moviethread 
    union 
    select content_, hits 
    FROM theatrethread) 
where hits = (SELECT MAX(Hits)
              FROM(
                  Select content_, hits 
                  FROM moviethread 
                  union 
                  select content_, hits 
                  FROM theatrethread));

/*
 *#5. Display the registered guest who has contributed most comments.
 *
 */
SELECT user_, counter
FROM
	(SELECT user_, count(*) as counter
	FROM(
		SELECT user_, content_ 
		FROM theatreresponses
		union
		select user_, content_
		From movieresponses)
		GROUP BY user_)
where counter = (SELECT MAX(COUNT(*))
                  FROM (SELECT user_, content_ 
                  FROM theatreresponses
                  union
                  select user_, content_
                  From movieresponses)
                  GROUP BY user_
                  );

/* 
 * #6. Display the theatre(s) that are showing most number of movies. (WORKS) 
 *  
 */
 -- This returns the theatre name as well as the total number of movie showings
SELECT Theatre, counter
FROM (SELECT Theatre, COUNT(*) AS counter
      FROM MOVIETIMES
      GROUP BY Theatre)
WHERE counter = (SELECT MAX(COUNT(*))
                 FROM MOVIETIMES
                 GROUP BY Theatre);
				 
-- This returns the theatre name as well as the total number of movies, not showings (Unique, and no repeats) 
SELECT Theatre, counter
FROM (SELECT Theatre, COUNT(UNIQUE MOVIE) AS counter
      FROM MOVIETIMES
      GROUP BY Theatre)
WHERE counter = (SELECT MAX(COUNT(UNIQUE MOVIE))
                 FROM MOVIETIMES
                 GROUP BY Theatre);
				 
-- Displays all the movies playing at 1701 Spygate Dr.
SELECT DISTINCT Movie
FROM Movietimes
WHERE theatre = '1701 Spygate Dr.'
ORDER BY Theatre ASC;

/* #7. Display the theatre that has the most ticket sales.*/
SELECT ADDRESS, ZIP, OWNER_
FROM (SELECT * FROM THEATRE ORDER BY SALES DESC)
WHERE ROWNUM = 1;

/* #8. Display the list of all employees who are on duty on Monday on a specific theatre. Display also their jobs and time table. */
-- Use Java code to obtain the next monday date. If it's monday, use the current date. Set the DATE_ = the date for next monday or current date
-- Also, have the user specify the theatre location (drop down menu?)

SELECT NAME_, newType, START_, END_
FROM (SELECT NAME_, newType, newLocation, START_, END_, DATE_
      FROM (SELECT TYPE_ as newType, location_ as newLocation, DATE_, START_, END_, SSN
            FROM SCHEDULE) S1
      INNER JOIN STAFF
      ON S1.SSN = STAFF.SSN)
WHERE newLocation = '28 Rush St.' -- The location is specified by the user
      AND DATE_ = '14-DEC-15' -- next monday date or current date (in which case the current day is Monday)
ORDER BY START_ ASC;

/* #9.	Send an alert to the owner and manager if no employee with the job of security is scheduled to work tomorrow. */
-- Returns date in the form of: 2014-11-11 12:45:34.243
SELECT GETDATE() AS CurrentDateTime;
-- Returns 0 when there are no Janitors for (Alert is java side)
SELECT COUNT(*)
FROM SCHEDULE
WHERE TYPE_ = 'Janitor'
      AND DATE_ = '10-DEC-15'; -- tomorrow
