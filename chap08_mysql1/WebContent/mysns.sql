create database if not exists mysns
default character set utf8 collate utf8_general_ci;

use mysns;

create table if not exists user(
	id varchar(128) primary key,
	password varchar(32),
	name varchar(32),
	ts timestamp default CURRENT_TIMESTAMP
)