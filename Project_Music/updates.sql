-- Заполнение поля last_time_logged_at случайным временем в заданном диапазоне
SET @MIN = '2015-04-30 14:53:27';
SET @MAX = '2021-03-22 14:53:27';
UPDATE profiles SET last_time_logged_at = (SELECT TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, @MIN, @MAX)), @MIN))  WHERE user_id < 105;
SELECT * FROM music.profiles;