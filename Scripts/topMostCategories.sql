/*
    Intro: This SQL query is used to get the top most categories and used to display in the dashboard page.
    Assumption: Backend language will provide the user's ID and these script executed seperatly and get the top most categories
    DataRepresentation: The backend script will provide the table with user and category details, 
        Category count
        category name
        Category image
        Category clour
    
    These table details will be represented as JSON/XML or HTML table format using ORM and send it back to frontend
*/


--- need to work bit more for the group and shared transaction


select COUNT(transaction.categoryId) as categoryCount, transaction.categoryId, category.categoryName
from transaction
inner join category on (transaction.categoryId = category.categoryId)
where userId = 'USR-11111111'
group by categoryId
order by count(transaction.categoryId) desc
limit 5;