/*
    Intro: This SQL query is used to get the friends list for specific user.
    Assumption: The backend language will provide user Id and then that ID is used to get the friends list data
    DataRepresentation: The backend language will provide the table with friends details, 
        friend table Id
        User Id
        Receiver/Sender name
        Receiver/Sender email
        Friend status
        date and time of friend request sent
        date and time of friend request accepted
    
    These table details will be represented as JSON/XML or HTML table format using ORM and send it back to frontend
*/

SET @userId = '1'; -- Value comes from the execute query from backend language
SET @friendStatus = true; -- Value comes from the execute query from backend language


select friend.friend_id, user.email, user.user_id, user.name, friend.is_Friends, friend.updated_date
from friend 
inner join user on(user.user_id = if (friend.sender_userId = @userId, friend.receiver_userId, friend.sender_userId)) 
where is_Friends = @friendStatus;
