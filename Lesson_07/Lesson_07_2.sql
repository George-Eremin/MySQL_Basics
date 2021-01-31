SELECT id, name, description, price,
	(SELECT name FROM catalogs WHERE id = catalog_id) as catalog 
FROM shop.products;