create table actors (
id int not null,
full_name varchar(50)not null,
primary key (id));

create table titles (
show_id int not null,
title varchar(50)not null,
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