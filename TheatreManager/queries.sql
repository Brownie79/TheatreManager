/* When a user purchases a ticket for a certain theatre, ADD the ticket value of the theatre
   to the total sales of the theatre. Just makes life a lot easier. */
   
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

/* *** #7. Display the theatre that has the most ticket sales *** */
SELECT ADDRESS, ZIP, OWNER_
FROM (SELECT * FROM THEATRE ORDER BY SALES DESC)
WHERE ROWNUM = 1;
