/*
    Intro: This SQL query is used to get user information with userId, username, and user email.
    Assumption: Users already registered on the money manager system and are not friends with other users.
    Frontend already displyed the friend list and when user try to search the friend, this script will be used
    DataRepresentation: The backend script will provide the table with chat details, 
        user Id
        user's name
        email
    
    These table details will be represented as JSON/XML or HTML table format using ORM and send it back to frontend
*/

select user.user_id,user.name, user.email 
from user
where exists(
	select friend.sender_userId, friend.receiver_userid
	from friend
	where (friend.receiver_userId = user.user_id AND friend.is_Friends = false) 
    OR (friend.sender_userId = user.user_id AND friend.is_Friends = false)
);