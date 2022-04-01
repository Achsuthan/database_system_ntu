/*
    Intro: This SQL query is used to search the users who are not friends with other users.
    Assumption: 
        <> Frontend having a page to search the users who are not friends
        <> Backend will pass the user's id and keyword to search
    DataRepresentation: The backend script will provide the table with user's details, 
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
	user_id not in (
		select receiver_userId
        from friend
        where (sender_userId = @userId AND is_Friends = true)
	)
    AND
    (
    user_id not in (
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
