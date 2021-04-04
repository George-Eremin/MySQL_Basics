SELECT id,
	(SELECT name FROM lesson_07_cities WHERE label = `from`) as 'Вылет',
	(SELECT name FROM lesson_07_cities WHERE label = `to`) as 'Прилет'
FROM lesson_07_flights;
