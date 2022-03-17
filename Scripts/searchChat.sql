/*
    Intro: This SQL query is used to get chat with message details.
    Assumption: Frontend already displyed the transacation list and when user try to get the chat details of a specific transaction, this script will be used
    DataRepresentation: The backend script will provide the table with message details, 
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