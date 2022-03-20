/*
    Intro: This SQL query is used to get the top 5 highest amount spent transactions details.
    Assumption: 
        <> Backend language will provide the user's ID and these script executed seperatly and get the top most spent transactions
        <> These details will be displyed in the dashboard page
    DataRepresentation: The backend script will provide the table with user and transaction details, 
        Transaction Id
        Transaction Name
        Transaction Amount
        Transaction Spent for
        Transaction type
    
    These table details will be represented as JSON/XML or HTML table format using ORM and send it back to frontend
*/


SET @userID = '1';

SELECT transaction.transaction_id, transaction.name, transaction.amount
FROM transaction
where transaction.created_by = @userID OR transaction.transaction_id in (select shared_transaction.transaction_id from shared_transaction where shared_transaction.receiver_id = @userId )
ORDER BY transaction.amount DESC LIMIT 5;