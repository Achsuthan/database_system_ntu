/*
    Intro: This SQL query is used for searching the user who are friends with other registered users.
    Assumption: 
        <> Frontend having a page to search the friends from our system.
        <> Backend will pass the user's id and keyword to search.
    DataRepresentation: The backend language will provide the table with user's details, 
        user Id
        user's name
        email
    
    These table details will be represented as JSON/XML or HTML table format using ORM and send it back to frontend
*/


SET @userId = '1';
SET @keyword = "%gmail%";


select user_id, name, email
from user
WHERE (
	    user_id in (
		    select receiver_userId
            from friend
            where (sender_userId = @userId AND is_Friends = true)
	    )
        OR
        (
            user_id in (
		        select sender_userId
                from friend
                where receiver_userId = @userId AND is_Friends = true
                )
	    )
    )
    AND
    (
		name LIKE @keyword OR email LIKE @keyword
	)
    AND user_id != @userId

