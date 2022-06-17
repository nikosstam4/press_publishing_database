/*A)Procedure*/

DROP PROCEDURE IF EXISTS paper;
DELIMITER $
CREATE PROCEDURE paper(IN pnumber INT, IN pname VARCHAR(255))

BEGIN

        DECLARE kld INT;
	DECLARE not_found INT;
	
	DECLARE PCURS CURSOR FOR
	SELECT Article_id FROM article 
	WHERE Page_num=pnumber AND Page_name=pname;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND
	SET not_found=1;
	
	SET not_found=0;
	OPEN PCURS;
	
	REPEAT

	FETCH PCURS INTO kld;
	IF(not_found=0)
	THEN
			
	    SELECT distinct Title,employ.Last_name AS 'Composer',Approval_date,Cover,Extent  FROM article
            INNER JOIN compose ON compose.Path=article.Path
            INNER JOIN paper ON Name=Page_name
	    INNER JOIN editor ON editor.Email=compose.Email
            INNER JOIN employ ON editor.Email=employ.Email
            WHERE Article_id=kld;
		
	END IF;
	UNTIL(not_found=1)

	END REPEAT;
	
	CLOSE PCURS;
END$
DELIMITER ;

/*B)Procedure*/

DROP PROCEDURE IF EXISTS misthos;
DELIMITER $
CREATE PROCEDURE misthos(IN ejrn VARCHAR(255),OUT newmi int)

BEGIN

    DECLARE teliko INT;
    DECLARE dif INT;
    DECLARE pres DATE;
    DECLARE mon INT;
    DECLARE date2 DATE;
    DECLARE mis INT;
    
    SELECT Recruitment_date INTO date2 FROM employ
    WHERE Email=ejrn;
	
    SELECT Work_experience INTO mon FROM journalist
    WHERE Email=ejrn;
   
    SELECT Salary INTO mis FROM employ
    WHERE Email=ejrn;
    
    SET pres=CURDATE();
    
    SET dif=DATEDIFF(pres, date2);
	
    SET teliko=(dif/30)*5 ;
    
    SET teliko=(teliko*mis)/1000;
   
    SET newmi=teliko + mis ;
	
END$
DELIMITER ;

/*C)Trigger*/
DELIMITER $
CREATE TRIGGER checkmisthos
BEFORE INSERT ON employ
FOR EACH ROW

BEGIN
SET NEW.Salary=650;

END$
DELIMITER ;
