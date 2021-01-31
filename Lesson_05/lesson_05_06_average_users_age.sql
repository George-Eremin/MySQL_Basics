SELECT 
	ROUND (AVG (timestampdiff(YEAR, birthday_at, NOW() )), 2) as average_age
FROM l5_shop.users;