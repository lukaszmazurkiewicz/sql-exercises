CREATE VIEW BESTSELLERS_COUNT AS
	SELECT COUNT(*) FROM BOOKS WHERE BESTSELLER = TRUE;