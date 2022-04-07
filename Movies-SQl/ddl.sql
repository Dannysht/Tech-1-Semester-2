CREATE TABLE IF NOT EXISTS actors
(name varchar(90), id INT AUTO_INCREMENT PRIMARY KEY);
;


DROP table actors;

CREATE TABLE IF NOT EXISTS actor_movie
    (id int auto_increment primary key, actor_id int, movie_id int,
    foreign key (movie_id) references movies(movie_id), foreign key (actor_id) references actors(id));

CREATE TABLE IF NOT EXISTS production_teams(
    id int AUTO_INCREMENT PRIMARY KEY, team_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS movies_production_teams(
    id INT AUTO_INCREMENT PRIMARY KEY, movie_id INT,
    production_team_id INT, FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (production_team_id) REFERENCES production_teams(id) ON DELETE CASCADE
);
