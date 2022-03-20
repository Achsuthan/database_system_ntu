/*
    Intro: This SQL query is used to get chat with chat details.
    Assumption: Users are inside the specific transaction page with details(shared and group), they should be able to see the transaction details along with the chats
    If the user want to search for specific chat this script will used to featch the keyword search chat
    DataRepresentation: The backend script will provide the table with chat details, 
        chat Id
        messge 
        sender User Id
        sender name 
        sender email
        transaction Id
        transaction created date
    
    These table details will be represented as JSON/XML or HTML table format using ORM and send it back to frontend
*/


SET @transactionId = 1;
SET @keyword = "%trans%";

select chat.chat_id, chat.message, user.user_id, chat.transaction_id, user.name, user.email, user.user_id, chat.updateddate
 from chat 
 inner join user on (user.user_id = chat.sender_id) 
 where message like @keyword;