
/*
    Intro: This SQL query is used to do the pagination for all the queries, but the query added for only the user search
    Assumption: 
        1. For this query used only for the user search pagination, but same implementation can be added to all other Queries if requires
        2. Backend langugue should pass the how many row they wanted for specific row count (value for limit) and the current page number(offset)
        3. Backend need to pass the user who are searching the other users
    DataRepresentation: The backend language will provide the table with user details, 
        User Id
        User name
        User email
    
    These table details will be represented as JSON/XML or HTML table format using ORM and send it back to frontend
*/


SET @keyword = "%gmail%";
SET @userId = "1";

select user_id, name, email 
from user 
where (name LIKE @keyword OR email LIKE @keyword) AND user_id != @userId
limit 3 OFFSET 3

