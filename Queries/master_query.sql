-- creating my tables & junction tables

create table actors (
id int not null,
full_name varchar(50)not null,
primary key (id));

create table titles (
show_id int not null,
title varchar(50)not null,
type varchar(50)not null,
release_year int not null,
description text not null,
primary key (show_id));

create table act_ttl (
id int not null,
show_id int not null,
primary key (id,show_id));

create table directors (
director_id int not null,
directors_names varchar(100)not null,
primary key (director_id));

create table dir_ttl (
show_id int not null,
director_id int not null,
primary key (show_id,director_id));

create table awards (
award_id int not null,
category varchar(50)not null,
won boolean not null,
primary key (award_id));

create table act_award (
id int not null,
award_id int not null,
primary key (id,award_id));

create table dir_award (
director_id int not null,
award_id int not null,
primary key (director_id,award_id));

-- queries to verify data loaded correctly

select * from actors

select * from titles

select * from act_ttl

select * from directors

select * from dir_ttl

select * from awards

select * from act_award

select * from dir_award

-- query 1
-- this is a query that gives you a list of actors/actresses that have had their movies/shows on netflix
-- and have been nominated for an SAG award along with the name of the movie/tv show, the release year,
-- the award category, and whether or not they won.

select actors.full_name, titles.title, titles.release_year, awards.category, awards.won
from actors
join act_ttl
on actors.id = act_ttl.id
join titles
on act_ttl.show_id = titles.show_id
join act_award
on actors.id = act_award.id
join awards
on act_award.award_id = awards.award_id

-- query 2
-- this is a query that gives you a list of directors that have had their movies/shows on netflix
-- and had association with a movie/tv show that was nominated for an SAG award 
-- along with the name of the movie/tv show, the release year, the award category, 
-- and whether or not they won.

select directors.directors_names, titles.title, titles.release_year, awards.category, awards.won
from directors
join dir_ttl
on directors.director_id = dir_ttl.director_id
join titles
on dir_ttl.show_id = titles.show_id
join dir_award
on directors.director_id = dir_award.director_id
join awards
on dir_award.award_id = awards.award_id

-- query 3
-- this query shows the actors who won their respective awards

select actors.full_name, titles.title, titles.release_year, awards.category, awards.won
from actors
join act_ttl
on actors.id = act_ttl.id
join titles
on act_ttl.show_id = titles.show_id
join act_award
on actors.id = act_award.id
join awards
on act_award.award_id = awards.award_id
where won = true

-- query 4
-- this query shows the directors who were associated with a movie/tv show who
-- won their respective awards

select directors.directors_names, titles.title, titles.release_year, awards.category, awards.won
from directors
join dir_ttl
on directors.director_id = dir_ttl.director_id
join titles
on dir_ttl.show_id = titles.show_id
join dir_award
on directors.director_id = dir_award.director_id
join awards
on dir_award.award_id = awards.award_id
where won = true

-- query 5
-- query that displays how many nominations a given actor - who had their
-- content on netflix - received at the SAG awards

select actors.full_name, count(titles.title)
from actors
join act_ttl
on actors.id = act_ttl.id
join titles
on act_ttl.show_id = titles.show_id
join act_award
on actors.id = act_award.id
join awards
on act_award.award_id = awards.award_id
group by full_name
order by count(titles.title) desc

-- query 6
-- query that displays how many nominations were associated with work that a given director
--  - who had their content on netflix - received at the SAG awards

select directors.directors_names, count(titles.title)
from directors
join dir_ttl
on directors.director_id = dir_ttl.director_id
join titles
on dir_ttl.show_id = titles.show_id
join dir_award
on directors.director_id = dir_award.director_id
join awards
on dir_award.award_id = awards.award_id
group by directors_names
order by count(titles.title) desc

-- query 7
-- this query shows the number of specific SAG awards categories
-- were won by movies / tv shows that have been on netflix

select awards.category, awards.won, count(awards.won)
from awards
where awards.won = true
group by awards.category, awards.won

-- query 8
-- this query shows the number of specific SAG awards categories
-- were lost by movies / tv shows that have been on netflix

select awards.category, awards.won, count(awards.won)
from awards
where awards.won = false
group by awards.category, awards.won

-- query 9
-- this query shows how many nominations a given title - which has
-- appeared on netflix - received at the SAG awards

-- use the below query if you need to drop all tables

drop table actors

drop table titles

drop table act_ttl

drop table directors

drop table dir_ttl

drop table awards

drop table act_award

drop table dir_award
