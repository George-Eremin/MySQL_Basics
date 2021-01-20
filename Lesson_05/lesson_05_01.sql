UPDATE lesson_05_01_users SET created_at = NOW(), updated_at = NOW()
WHERE id < 10;
SELECT * FROM learn_mysql.lesson_05_01_users;