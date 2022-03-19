
/*
    Intro: This SQL query is used to do the pagination for all the queries
    Assumption: 
        1. For this query used only for the user search pagination, but same implementation can be added to all other Queries if requires
        2. Backend langugue should pass the how many page they wanted for specific page (value for limit) and the current page number(offset)
    DataRepresentation: The backend script will provide the table with user details, 
        User Id
        User name
        User email
    
    These table details will be represented as JSON/XML or HTML table format using ORM and send it back to frontend
*/

--- Need to work on this for the user table search query

SELECT * 
FROM transaction
order by transaction.updatedDate desc
LIMIT 3 OFFSET 12;