SET @result = 1;

SET @cnt = 1;
SET @result = @result * (SELECT `value` FROM lesson_05_multiply where `value` = @cnt);

SET @cnt = @cnt + 1;
SET @result = @result * (SELECT `value` FROM lesson_05_multiply where `value` = @cnt);

SET @cnt = @cnt + 1;
SET @result = @result * (SELECT `value` FROM lesson_05_multiply where `value` = @cnt);

SET @cnt = @cnt + 1;
SET @result = @result * (SELECT `value` FROM lesson_05_multiply where `value` = @cnt);

SET @cnt = @cnt + 1;
SET @result = @result * (SELECT `value` FROM lesson_05_multiply where `value` = @cnt);

SELECT @result;

