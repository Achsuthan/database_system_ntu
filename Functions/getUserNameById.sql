DELIMITER $$  
CREATE FUNCTION getUserNameById(iuser_id int(11))
       RETURNS varchar(64) DETERMINISTIC
BEGIN
        DECLARE ouser_name VARCHAR(64);
		SELECT name INTO ouser_name FROM user WHERE user_id = iuser_id;
        RETURN(ouser_name);
END;  