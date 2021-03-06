create database ciberman;
use ciberman;

create table user(
	id int not null auto_increment primary key,
	name varchar(50),
	lastname varchar(50),
	username varchar(50),
	email varchar(255),
	password varchar(60),
	image varchar(255),
	status int default 1,
	kind int default 1,
	created_at datetime
);

/**
* password: encrypted using sha1(md5("mypassword"))
* status: 1. active, 2. inactive, 3. other, ...
* kind: 1. root, 2. other, ...
**/

/* insert user example */
insert into user (name,username,password,created_at) value ("Administrator","admin",sha1(md5("admin")),NOW());



create table equipment(
	id int not null auto_increment primary key,
	code varchar(50),
	name varchar(50),
	description varchar(50),
	price_hour double,
	price_half double,
	created_at datetime
);

create table rent( 
	id int not null auto_increment primary key,
	price double,
	start_date date,
	finish_date date,
	bonus_mins int,
	start_time time,
	finish_time time,
	person_name varchar(255),
	equipment_id int not null,
	user_id int not null,
	created_at datetime,
	foreign key (user_id) references user(id),
	foreign key (equipment_id) references equipment(id)
);
