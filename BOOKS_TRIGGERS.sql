DELIMITER $$
CREATE TRIGGER BOOKS_INSERT AFTER INSERT ON BOOKS
FOR EACH ROW 
BEGIN
	INSERT INTO BOOKS_AUD (EVENT_DATE, EVENT_TYPE, BOOK_ID, NEW_TITLE, NEW_PUBYEAR, NEW_BESTSELLER)
			VALUES (CURTIME(), "INSERT", NEW.BOOK_ID, NEW.TITLE, NEW.PUBYEAR, NEW.BESTSELLER);
END $$

DELIMITER ;

DELIMITER $$
CREATE TRIGGER BOOKS_DELETE AFTER DELETE ON BOOKS
FOR EACH ROW 
BEGIN
	INSERT INTO BOOKS_AUD (EVENT_DATE, EVENT_TYPE, BOOK_ID)
			VALUES (CURTIME(), "DELETE", OLD.BOOK_ID);
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER BOOKS_UPDATE AFTER UPDATE ON BOOKS
FOR EACH ROW 
BEGIN
	INSERT INTO BOOKS_AUD (EVENT_DATE, EVENT_TYPE, BOOK_ID, NEW_TITLE, NEW_PUBYEAR, NEW_BESTSELLER,
															OLD_TITLE, OLD_PUBYEAR, OLD_BESTSELLER)
			VALUES (CURTIME(), "UPDATE", OLD.BOOK_ID, NEW.TITLE, NEW.PUBYEAR, NEW.BESTSELLER,
														OLD.TITLE, OLD.PUBYEAR, OLD.BESTSELLER);
END $$

DELIMITER ;