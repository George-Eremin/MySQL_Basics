SELECT 
COUNT(*) cnt,
DAYNAME(   
	CONCAT( YEAR(NOW()),'-', MONTH (birthday_at), '-', DAY(birthday_at) ) 
)	dname
FROM l5_shop.users
GROUP BY dname
ORDER BY cnt DESC
;