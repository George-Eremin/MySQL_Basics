/*
Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от
текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с
12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый
вечер", с 00:00 до 6:00 — "Доброй ночи".
*/

DROP function IF EXISTS `hello`;
DELIMITER |

CREATE FUNCTION `hello`() RETURNS text DETERMINISTIC
BEGIN
    DECLARE hour_var INT DEFAULT 0;
    SET hour_var = hour(now());
    
	IF ( hour_var < 6 ) THEN 
		RETURN 'Доброй ночи';
	ELSEIF ( hour_var < 12 ) THEN 
		RETURN 'Доброе утро';
	ELSEIF ( hour_var < 18 ) THEN 
		RETURN 'Добрый день';
	ELSEIF ( hour_var <= 23 ) THEN 
		RETURN 'Добрый вечер';
	ELSE
		RETURN 'Недопустимое значение';
	END IF;
END |

DELIMITER ;
;
