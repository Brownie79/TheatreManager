-- Question #1
create or replace PROCEDURE RecentReviews(
Title in out VARCHAR2(32),
ReviewUser1 out VARCHAR2(32),
MovieReview1 out VARCHAR2(2000),
ReviewUser2 out VARCHAR2(32),
MovieReview2 out VARCHAR2(2000)
)
AS 
BEGIN
	-- Selecting the most recent review
	DBMS_OUTPUT.PUT_LINE(' **** MOST RECENT REVIEW ****');
	SELECT REVIEW INTO MovieReview1
	FROM MOVIEREVIEWS
	WHERE MOVIEREVIEWS.ID_ = ( SELECT MAX(ID_) 
               FROM MOVIEREVIEWS
	) AND MOVIEREVIEWS.MOVIE = Title
	
	SELECT REVIEWER INTO MovieReviewer1
	FROM MOVIEREVIEWS
	WHERE MOVIEREVIEWS.ID_ = ( SELECT MAX(ID_) 
               FROM MOVIEREVIEWS
	) AND MOVIEREVIEWS.MOVIE = Title
	
	DBMS_OUTPUT.PUT_LINE('Movie: ' || Title);
	DBMS_OUTPUT.PUT_LINE('Most Recent Reviewer: ' || MovieReviewer1);
	DBMS_OUTPUT.PUT_LINE('Most Recent Review: ' || MovieReview1);
	
	-- Selecting the second most recent review
	DBMS_OUTPUT.PUT_LINE(' **** SECOND MOST RECENT REVIEW ****');
	
	SELECT REVIEW INTO MovieReview2
	FROM MOVIEREVIEWS
	WHERE MOVIEREVIEWS.ID = ( SELECT MAX(ID_) 
               FROM MOVIEREVIEWS
               WHERE MOVIEREVIEWS.ID_ < ( SELECT MAX(ID_) 
                              FROM MOVIEREVIEWS
                            ) AND MOVIEREVIEW.MOVIE = Title
				) AND MOVIEREVIEW.MOVIE = Title
				
	SELECT REVIEWER INTO MovieReviewer2
	FROM MOVIEREVIEWS
	WHERE MOVIEREVIEWS.ID = ( SELECT MAX(ID_) 
               FROM MOVIEREVIEWS
               WHERE MOVIEREVIEWS.ID_ < ( SELECT MAX(ID_) 
                              FROM MOVIEREVIEWS
                            ) AND MOVIEREVIEW.MOVIE = Title
				) AND MOVIEREVIEW.MOVIE = Title
	
	DBMS_OUTPUT.PUT_LINE('Movie: ' || Title);
	DBMS_OUTPUT.PUT_LINE('Second Most Recent Reviewer: ' || MovieReviewer2);
	DBMS_OUTPUT.PUT_LINE('Second Most Recent Review: ' || MovieReview2);
	
END;
