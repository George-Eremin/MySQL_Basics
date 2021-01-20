UPDATE lesson_05_02_users SET 
	created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'),
	updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i')
WHERE id < 999; -- Для обхода safe mode

SELECT * FROM learn_mysql.lesson_05_02_users;