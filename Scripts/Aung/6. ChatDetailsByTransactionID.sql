/*
    Intro: This SQL query is used to get chat messages for group transaction by acending order of message sent.
    Assumption: Frontend will have the seperate page to get all the messages for each group transaction and display it to user
    DataRepresentation: The backend script will provide the table with transaction details, 
        chat Id
        sender name
        smessage
        sent out date time
    <> These table details will be represented as JSON/XML or HTML table format using ORM and send it back to frontend
*/



SET @TransactionId = 43; 

SELECT chat.chat_id, getUserNameById(chat.sender_id) as sender_name, chat.message, chat.createddate as sent_time
FROM chat
where 	chat.transaction_id = @TransactionId
order by chat.createddate asc;