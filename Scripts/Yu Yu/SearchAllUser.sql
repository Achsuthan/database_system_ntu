/*
    Intro: This SQL query is used for searching the registered user by name and email.
    Assumption: 
        <> User already registered on the money manager system.
        <> Frontend wanted to have a page to search the users in the system
    
    DataRepresentation: The backend script will provide the table with chat details, 
        user Id
        user's name
        email
    
    These table details will be represented as JSON/XML or HTML table format using ORM and send it back to frontend
*/

SET @keyword = "%gmail%";
SET @userId = "1";

select user_id, name, email 
from user 
where (name LIKE @keyword OR email LIKE @keyword) AND user_id != @userId
