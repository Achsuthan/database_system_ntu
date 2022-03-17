/*
    Intro: This SQL query is used to get own transactions by decending order of created order.
    Assumption: Frontend will have the seperate page to getall the own transaction and display it to user
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
    
    <> These table details will be represented as JSON/XML or HTML table format using ORM and send it back to frontend, 
    <> For the amount plus/minus values, the backend logic changed the amount value to plus/minus based on the transaction type;
        Income -> plus, Expenses -> minus

*/


SET @userId = 1;
SET @transactionSpentFor = 1;


SELECT transaction.transaction_id as transaction_id, transaction.name as transaction_name, transaction.amount ,transaction.description as transaction_description,
 transaction.amount as transaction_amount, transaction.updateddate as transaction_created_date, transaction.is_bank_transaction as is_bank_transaction,
 category.category_id as cateogory_id, category.name as category_name, category.image as category_image, category.colour as category_clour,
 transaction_type.type as transaction_type
FROM transaction
inner join category on (transaction.category_id = category.category_id)
inner join transaction_type on (transaction.transaction_type_id = transaction_type.transaction_type_id)
where (transaction.created_by = @userId && transaction.transaction_spent_for_id = @transactionSpentFor)
order by transaction.updateddate desc;