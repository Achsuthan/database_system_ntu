/*
    Intro: This SQL query is used to get all group transactions by decending order latest transaction.
    Assumption: Frontend will have the seperate page to get all the group transaction and display it to user
    DataRepresentation: The backend script will provide the table with transaction details, 
        transaction Id
        transaction name 
        total transaction amount
        percentage
        shared amount
        transaction created date
        is bank transaciton
        category Id 
        category name
        category image
        category colour
        transaction type (Expenses/Income)
        sender name
        sender email
		receiver name
        receiver email        
    <> These table details will be represented as JSON/XML or HTML table format using ORM and send it back to frontend, 
    <> For the amount plus/minus values, the backend logic changed the amount value to plus/minus based on the transaction for and receiverId;
        if the transaction for is group and receiverId users get the plus amount and senderId(current user) will get the amount as minus
*/


SET @transactionspendfor = 3; -- 3(group)
SET @transactionType = 3; -- transfer

SELECT transaction.transaction_id as transaction_id, transaction.name as transaction_name, transaction.amount as total_transaction_amount,
shared_transaction.percentage,(shared_transaction.percentage/100) * transaction.amount as shared_amount,
transaction.description as transaction_description, transaction.updateddate as transaction_created_date, transaction.is_bank_transaction as is_bank_transaction,
 category.category_id as cateogory_id, category.name as category_name, category.image as category_image, category.colour as category_clour,
 transaction_type.type as transaction_type, getUserNameById(shared_transaction.sender_id) as sender_name, getUserNameById(shared_transaction.receiver_id) as receiver_name, 
 getUserEmailById(shared_transaction.sender_id) as sender_email, getUserEmailById(shared_transaction.receiver_id) as receiver_email
FROM transaction
inner join shared_transaction on transaction.transaction_id = shared_transaction.transaction_id
inner join group_transaction on shared_transaction.shared_transaction_id = group_transaction.shared_transaction_id && transaction.transaction_id = group_transaction.transaction_id
inner join category on (transaction.category_id = category.category_id)
inner join transaction_type on (transaction.transaction_type_id = transaction_type.transaction_type_id)
where ((shared_transaction.sender_id <> shared_transaction.receiver_id)) &&
        transaction.transaction_spent_for_id = @transactionType && -- group transaction
        transaction_type.transaction_type_id = @transactionspendfor -- transfer type
order by transaction.updateddate desc;