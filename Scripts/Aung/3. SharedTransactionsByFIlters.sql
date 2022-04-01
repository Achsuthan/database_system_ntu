/*
    Intro: This SQL query is used to get shared transactions by category and start date and end date filters sorted by latest transaction date.
    Assumption: Frontend will have the seperate page to getall the shared transaction and display it to user
    DataRepresentation: The backend script will provide the table with transaction details, 
        transaction Id
        transaction name 
        transaction amount
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
        percentage
    <> These table details will be represented as JSON/XML or HTML table format using ORM and send it back to frontend, 
    <> For the amount plus/minus values, the backend logic changed the amount value to plus/minus based on the transaction for and receiver Id;
        For the reciever ID the amount will be plus and SenderUser it will be minues amount
*/

SET @userId = 2;
SET @categoryIds = '2,3,4'; -- Food, Loan or Gift
SET @transactionspendfor = 2; -- 2(friends)
SET @transactionType = 3; -- transfer
SET @trans_startdate = '2022-03-01 00:00:00';
SET @trans_enddate = '2022-03-30 23:59:59';

SELECT transaction.transaction_id as transaction_id, transaction.name as transaction_name, transaction.amount as total_transaction_amount,
shared_transaction.percentage,(shared_transaction.percentage/100) * transaction.amount as shared_amount,
transaction.description as transaction_description, transaction.updateddate as transaction_created_date, transaction.is_bank_transaction as is_bank_transaction,
 category.category_id as cateogory_id, category.name as category_name, category.image as category_image, category.colour as category_clour,
 transaction_type.type as transaction_type, getUserNameById(shared_transaction.sender_id) as sender_name, getUserNameById(shared_transaction.receiver_id) as receiver_name, 
 getUserEmailById(shared_transaction.sender_id) as sender_email, getUserEmailById(shared_transaction.receiver_id) as receiver_email
FROM transaction
inner join shared_transaction on transaction.transaction_id = shared_transaction.transaction_id
inner join category on (transaction.category_id = category.category_id)
inner join transaction_type on (transaction.transaction_type_id = transaction_type.transaction_type_id)
where 	((shared_transaction.sender_id = @userId || shared_transaction.receiver_id = @userId) &&
        (shared_transaction.sender_id <> shared_transaction.receiver_id)) &&
		FIND_IN_SET (category.category_id ,@categoryIds) &&
        (transaction.createddate BETWEEN @trans_startdate AND @trans_enddate) && 
		transaction.transaction_spent_for_id = @transactionspendfor && -- spend for friend transaction
        transaction_type.transaction_type_id = @transactionType -- transfer type 
order by transaction.transaction_id,transaction.createddate desc;
