
/*
    Intro: This SQL query is used to get the top 5 intracted frinends for send and receive amount.
    Assumption: 
        <> Backend language will provide the user's ID
        <> These details will be displayed in the dashbarod page
    DataRepresentation: 
        <> The data will have two set of values one is for most 5 intracted friends for send and other one is received
        <> The backend script will provide the table with user and category details, 
                Username
                user email
    
    These table details will be represented as JSON/XML or HTML table format using ORM and send it back to frontend
*/






-- Most 5 friends who received money from a user

SET @userId = '1';

select intracted_friends.receiver_id, count(intracted_friends.receiver_id) as receiverCount, user.name, user.email
from intracted_friends 
inner join user on (user.user_id = intracted_friends.receiver_id)
where intracted_friends.sender_id= @userId
group by intracted_friends.receiver_id
order by  receiverCount desc limit 5;


-- Most 5 friends who send money from a user

SET @userId = '1';

select intracted_friends.sender_id, count(intracted_friends.sender_id) as senderCount, user.name, user.email
from intracted_friends 
inner join user on (user.user_id = intracted_friends.sender_id)
where intracted_friends.receiver_id= @userId
group by intracted_friends.sender_id
order by  senderCount desc;