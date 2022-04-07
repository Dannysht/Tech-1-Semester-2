SELECT title, year, name
FROM movies
LEFT JOIN movies.actor_movie ma on movies.movies.movie_id = ma.movie_id
LEFT JOIN actors a on a.id = ma.actor_id;