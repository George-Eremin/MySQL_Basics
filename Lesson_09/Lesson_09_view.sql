/*
Создайте представление, которое выводит название name товарной позиции из таблицы
products и соответствующее название каталога name из таблицы catalogs.
*/

CREATE VIEW prod_cat AS 
	SELECT p.name AS product, c.name AS catalog
		FROM shop.products as p
		JOIN catalogs as c
		ON p.catalog_id = c.id;