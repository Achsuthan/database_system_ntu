




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