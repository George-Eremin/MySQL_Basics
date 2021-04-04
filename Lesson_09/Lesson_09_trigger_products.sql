/*
В таблице products есть два текстовых поля: name с названием товара и description с его
описанием. Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля
принимают неопределенное значение NULL неприемлема. Используя триггеры, добейтесь
того, чтобы одно из этих полей или оба поля были заполнены. При попытке присвоить полям
NULL-значение необходимо отменить операцию.
*/

DROP TRIGGER IF EXISTS prod_insert;
DELIMITER |

CREATE TRIGGER prod_insert BEFORE INSERT ON lesson_09_products FOR EACH ROW
BEGIN
	IF (NEW.name IS NULL AND NEW.description IS NULL) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Хотя бы одно из полей name и description должно быть заполнено';
	END IF;
END |

DELIMITER ;
;