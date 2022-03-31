/*
    Intro: This SQL query is used to get the top 5 most categories and used to display in the dashboard page.
    Assumption: 
        <> Backend language will provide the user's ID and these script executed seperatly and get the top most categories
        <> These details will be displayed in the dashbarod page
    DataRepresentation: The backend language will provide the table with category details with count, 
        Category count
        category name
        Category image
        Category clour
    
    These table details will be represented as JSON/XML or HTML table format using ORM and send it back to frontend

    So the user's can see what is most used categories
*/

SET @userID = '1';

select COUNT(transaction.category_id) as categoryCount, transaction.category_id, category.name
from transaction
inner join category on (transaction.category_id = category.category_id)
where transaction.created_by = @userId OR transaction.transaction_id in (select shared_transaction.transaction_id from shared_transaction where shared_transaction.receiver_id = @userId )
group by transaction.category_id
order by count(transaction.category_id) desc
limit 5;


/*
    Same query added with the date range so the user can get the top most categories in the date range in the dashborad.
*/



SET @userID = '1';
SET @startDate = '2022-03-12 00:00:00';
SET @endDate = '2022-03-20 23:59:00';

select COUNT(transaction.category_id) as categoryCount, transaction.category_id, category.name
from transaction
inner join category on (transaction.category_id = category.category_id)
where (transaction.created_by = @userId OR transaction.transaction_id in (select shared_transaction.transaction_id from shared_transaction where shared_transaction.receiver_id = @userId )) and (transaction.date between @startDate and @endDate) 
group by transaction.category_id
order by count(transaction.category_id) desc
limit 5;