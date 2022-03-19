DELIMITER $$  
CREATE FUNCTION getUserEmailById(iuser_id int(11))
       RETURNS varchar(64) DETERMINISTIC
BEGIN
        DECLARE ouser_email VARCHAR(64);
		SELECT email INTO ouser_email FROM user WHERE user_id = iuser_id;
        RETURN(ouser_email);
END;  