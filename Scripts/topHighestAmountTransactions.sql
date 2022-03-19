/*
    Intro: This SQL query is used to get the highest amount spent transactions details.
    Assumption: Backend language will provide the user's ID and these script executed seperatly and get the top most spent transaction
    DataRepresentation: The backend script will provide the table with user and transaction details, 
        Transaction Id
        Transaction Name
        Transaction Amount
        Transaction Spent for
        Transaction type
    
    These table details will be represented as JSON/XML or HTML table format using ORM and send it back to frontend
*/


--- need to work bit more for the group and shared transaction



SELECT *
FROM transaction
where transaction.userId = 'USR-11111111'

ORDER BY transaction.amount DESC LIMIT 5