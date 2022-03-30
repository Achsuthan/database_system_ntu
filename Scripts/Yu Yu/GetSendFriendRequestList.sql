/*
    Intro: This SQL query is used to get the send friends request list for specific user.
    Assumption: The backend language will give the user Id and then that ID is used to fetch the friends list
    DataRepresentation: The backend script will provide the table with user and friend details, 
        friend_Id from friend table
        user_id from user table
        user's name from user table
        user's email from user table
        
    These table details will be represented as JSON/XML or HTML table format using ORM and send it back to frontend
*/

select friend.friend_id,user.user_id, user.name, user.email
from user
inner join friend on (friend.sender_userId = user.user_id)
where is_Friends = false;