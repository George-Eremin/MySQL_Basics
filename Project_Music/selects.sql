-- Вывести название трека, исполнителя, альбома
SELECT 
		t.track_id, t.title as title, 
        (SELECT `name` FROM artists art WHERE art.artist_id IN
			(SELECT ta.artist_id FROM tracks_artists ta WHERE ta.track_id = t.track_id) )
            as artist,
        a.title as album 
	FROM tracks as t JOIN albums as a ON t.album_id = a.album_id 
    ORDER BY t.track_id;


-- Выбрать треки по имени исполнителя
SELECT track_id, title FROM tracks WHERE track_id IN (
	SELECT track_id FROM music.tracks_artists WHERE artist_id IN (
		SELECT artist_id FROM music.artists WHERE `name` = "Камиль Сен-Санс"))
ORDER BY title;
        
-- Выбрать имена треков, в которых первое слово - blues
SELECT title FROM tracks WHERE title LIKE 'blues%';
        
-- Выбрать 3 альбома с наибольшей средней продолжительностью композиции
SELECT round(avg(t.duration)) as average_track_duration, alb.title as album_title 
	FROM tracks as t JOIN albums as alb ON t.album_id = alb.album_id 
    GROUP BY t.album_id 
    ORDER BY t.duration DESC 
    LIMIT 3;


-- ТОП-10 популярности треков (по частоте включения в плейлисты): показать наименование трека, исполнителя и жанр
SELECT 
		t.track_id, 
        t.title, 
        (SELECT art.`name` FROM artists art WHERE art.artist_id IN
			(SELECT ta.artist_id FROM tracks_artists ta WHERE ta.track_id = t.track_id) )
            as artist,
		(SELECT g.title FROM genres g WHERE g.genre_id IN
			(SELECT tg.genre_id FROM tracks_genres tg WHERE tg.track_id = t.track_id) ) 
        as genre,
        count(p_t.playlist_id) AS popularity 
	FROM tracks AS t JOIN playlists_tracks AS p_t ON t.track_id = p_t.track_id  
    GROUP BY p_t.track_id 
    ORDER BY popularity DESC, t.title ASC
    LIMIT 10;


-- Показать динамику прослушиваний исполнителя с id = 1 за 2020 г. помесячно 
SELECT monthname(h.heared_at) as `month`, count(*) as amount
	FROM `history` h 
    WHERE 
		YEAR(h.heared_at) = 2020 AND
		h.track_id IN (
			SELECT track_id FROM music.tracks_artists WHERE artist_id = 1)
    GROUP BY `month`
    ORDER BY heared_at;



/* выбрать 5 случайных треков из всех плейлистов пользователя и треков, прослушанных пользователем 5, убрать дубликаты. */
SELECT track_id
	FROM playlists_tracks
	WHERE playlist_id IN 
		(SELECT playlist_id
			FROM playlists
			WHERE users_id = 5)
UNION
SELECT track_id
	FROM history
    WHERE user_id = 5
ORDER BY rand()
LIMIT 5;

