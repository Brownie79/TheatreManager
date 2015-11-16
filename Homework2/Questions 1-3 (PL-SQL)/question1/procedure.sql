-- Question #1: PROCEDURE
CREATE OR REPLACE PROCEDURE RecentReviews(movieTitle VARCHAR2) IS
  reviewer1 VARCHAR2(32);
  review1 VARCHAR2(2000);
  rlikes INTEGER;
  rdislikes INTEGER;
BEGIN
	-- retrieve data from the most frequent review, (based on the highest id (most recent))
  SELECT LIKES INTO rlikes
	FROM MOVIEREVIEWS
	WHERE MOVIEREVIEWS.ID_ = ( SELECT MAX(ID_) 
               FROM MOVIEREVIEWS
	) AND MOVIEREVIEWS.MOVIE = movieTitle;
	
	SELECT DISLIKES INTO rdislikes
	FROM MOVIEREVIEWS
	WHERE MOVIEREVIEWS.ID_ = ( SELECT MAX(ID_) 
               FROM MOVIEREVIEWS
	) AND MOVIEREVIEWS.MOVIE = movieTitle;
	
	SELECT REVIEW INTO review1
	FROM MOVIEREVIEWS
	WHERE MOVIEREVIEWS.ID_ = ( SELECT MAX(ID_) 
               FROM MOVIEREVIEWS
	) AND MOVIEREVIEWS.MOVIE = movieTitle;
	
	SELECT REVIEWER INTO reviewer1
	FROM MOVIEREVIEWS
	WHERE MOVIEREVIEWS.ID_ = ( SELECT MAX(ID_) 
               FROM MOVIEREVIEWS
	) AND MOVIEREVIEWS.MOVIE = movieTitle;
	
	DBMS_OUTPUT.PUT_LINE('(Most recent) ' || rlikes || ' likes and ' || rdislikes || ' dislikes');
	DBMS_OUTPUT.PUT_LINE('Reviewer: ' || reviewer1);
	DBMS_OUTPUT.PUT_LINE('Review: ' || review1);
	
  -- retrieve data from the second most frequent review
  
	SELECT REVIEWER INTO reviewer1
	FROM MOVIEREVIEWS
	WHERE MOVIEREVIEWS.ID_ = (SELECT MAX(ID_) 
               FROM MOVIEREVIEWS
               WHERE MOVIEREVIEWS.ID_ < ( SELECT MAX(ID_) 
                              FROM MOVIEREVIEWS
                            ) AND (MOVIEREVIEWS.MOVIE = movieTitle)) AND (MOVIEREVIEWS.MOVIE = movieTitle);
  
  SELECT REVIEW INTO review1
	FROM MOVIEREVIEWS
	WHERE MOVIEREVIEWS.ID_ = (SELECT MAX(ID_) 
               FROM MOVIEREVIEWS
               WHERE MOVIEREVIEWS.ID_ < ( SELECT MAX(ID_) 
                              FROM MOVIEREVIEWS
                            ) AND (MOVIEREVIEWS.MOVIE = movieTitle)) AND (MOVIEREVIEWS.MOVIE = movieTitle);
                            
  SELECT LIKES INTO rlikes
	FROM MOVIEREVIEWS
	WHERE MOVIEREVIEWS.ID_ = (SELECT MAX(ID_) 
               FROM MOVIEREVIEWS
               WHERE MOVIEREVIEWS.ID_ < ( SELECT MAX(ID_) 
                              FROM MOVIEREVIEWS
                            ) AND (MOVIEREVIEWS.MOVIE = movieTitle)) AND (MOVIEREVIEWS.MOVIE = movieTitle);
                            
  SELECT DISLIKES INTO rdislikes
	FROM MOVIEREVIEWS
	WHERE MOVIEREVIEWS.ID_ = (SELECT MAX(ID_) 
               FROM MOVIEREVIEWS
               WHERE MOVIEREVIEWS.ID_ < ( SELECT MAX(ID_) 
                              FROM MOVIEREVIEWS
                            ) AND (MOVIEREVIEWS.MOVIE = movieTitle)) AND (MOVIEREVIEWS.MOVIE = movieTitle);
	
	DBMS_OUTPUT.PUT_LINE('(Secondmost recent) ' || rlikes || ' likes and ' || rdislikes || ' dislikes');
	DBMS_OUTPUT.PUT_LINE('Reviewer: ' || reviewer1);
	DBMS_OUTPUT.PUT_LINE('Review: ' || review1);
  
END;
/
