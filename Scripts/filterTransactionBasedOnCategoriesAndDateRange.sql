
/*
    Intro: This SQL query is used to do the filter transaction data with date range and categories
    Assumption: 
        1. This is query only used for the own transaction table but it can be added to the other shared and group transactions
        2. Backend laguage should pass the date range and categories value to script
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
    
    These table details will be represented as JSON/XML or HTML table format using ORM and send it back to frontend
*/

--- Need to work on this for the user table search query



select * 
from transaction
where transaction.categoryId in ('CAT-11111111', 'CAT-11111113') ||
(transaction.date between '2020-10-21 00:00:00' and '2021-11-04 00:00:00')