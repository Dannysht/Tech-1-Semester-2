CREATE INDEX movie_index ON movies (movie_id);
CREATE INDEX movie_title_index ON movies (title);

SELECT * FROM movies WHERE title = 'King kong'