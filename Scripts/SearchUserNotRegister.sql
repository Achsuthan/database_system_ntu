/*
    Intro: This SQL query is used to get user information with userId, username, and user email.
    Assumption: Users haven't registered on the system yet.
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
			select friend.friend_id,friend.sender_userId, friend.receiver_userid
			from friend
			where (friend.receiver_userId = user.user_id AND friend.is_Friends = false) 
            AND (friend.sender_userId = user.user_id AND friend.is_Friends = false)
);