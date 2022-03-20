/*
    Intro: This SQL query is used to get the top 5 most categories and used to display in the dashboard page.
    Assumption: 
        <> Backend language will provide the user's ID and these script executed seperatly and get the top most categories
        <> These details will be displayed in the dashbarod page
    DataRepresentation: The backend script will provide the table with user and category details, 
        Category count
        category name
        Category image
        Category clour
    
    These table details will be represented as JSON/XML or HTML table format using ORM and send it back to frontend
*/

SET @userID = '1';

select COUNT(transaction.category_id) as categoryCount, transaction.category_id, category.name
from transaction
inner join category on (transaction.category_id = category.category_id)
where transaction.created_by = @userId OR transaction.transaction_id in (select shared_transaction.transaction_id from shared_transaction where shared_transaction.receiver_id = @userId )
group by transaction.category_id
order by count(transaction.category_id) desc
limit 5;