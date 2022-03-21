/*
    Intro: This SQL query is used to get chat messages for group transaction by acending order of message sent.
    Assumption: Frontend will have the seperate page to get all the messages for each group transaction and display it to user
    DataRepresentation: The backend script will provide the table with transaction details, 
        transaction Id
        transaction name 
        transaction amount
		Group transaction Id
        Group transaction name 
        transaction type (Expenses/Income)
        sender name
        sender email
    <> These table details will be represented as JSON/XML or HTML table format using ORM and send it back to frontend
*/



SET @groupTransactionId = 43;
SET @transactionSpentFor = 3;
SET @transactionTypeId = 3;

SELECT transaction.transaction_id as transaction_id, transaction.name as transaction_name, transaction.amount,
transaction.description as transaction_description,
transaction_type.type as transactiontype,
transaction.amount as transaction_amount, 
spending_group.name as spendinggroupname,
getUserNameById(chat.sender_id) as sender_name,
getUserEmailById(chat.sender_id) as sender_email,
chat.message
FROM transaction
inner join (SELECT DISTINCT transaction_id, group_id FROM group_transaction) AS T on transaction.transaction_id = T.transaction_id
inner join spending_group on T.group_id = spending_group.spending_group_id
inner join category on (transaction.category_id = category.category_id)
inner join transaction_type on (transaction.transaction_type_id = transaction_type.transaction_type_id)
inner join chat on transaction.transaction_id = chat.transaction_id
inner join user on chat.sender_id = user.user_id
where 	transaction.transaction_spent_for_id = @transactionSpentFor &&  -- Spend for Group only
        transaction_type.transaction_type_id = @transactionTypeId && -- transfer type
        transaction.transaction_id = @groupTransactionId
order by chat.createddate asc;