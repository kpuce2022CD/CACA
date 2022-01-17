
CREATE DATABASE clonet_database default CHARACTER SET UTF8;

show databases;
use clonet_database;

create table user(
	user_id char(10) primary key not null,
    user_pw char(20) not null,
    user_name char(10) not null,
    user_email char(30) not null,
    profilePic char(50),
    about varchar(1000),
    contact varchar(1000)
);

create table repository(
	repo_name char(15) primary key not null,
    repo_ec2_ip char(15) not null,
    directory_path char(50) not null,
    read_me varchar(100)
);

create table repo_group(
	group_id char(15) primary key not null,
    group_host char(15) not null
);

create table mapping_repo_group(
	repo_name char(15) not null,
    group_id char(15) not null,
    
    primary key(repo_name, group_id),
    foreign key (repo_name) references repository (repo_name),
    foreign key (group_id) references repo_group (group_id)
);

create table mapping_user_group(
	user_id char(15) not null,
    group_id char(15) not null,
    
    primary key(user_id, group_id),
    foreign key (user_id) references user (user_id),
    foreign key (group_id) references repo_group (group_id)
);


insert into user values('user1', 'passwd', '유저원', 'user1@gmail.com', "", "", "");
insert into user values('user2', 'passwd', '유저투', 'user1@gmail.com', "", "", "");
insert into user values('user3', 'passwd', '유저삼', 'user1@gmail.com', "", "", "");
select * FROM user where user_id="user3";
select * From user;

use mysql;

-- INSERT INTO user (user_id, user_pw, user_name, user_email) VALUES ('jimmy', 'qwer1234', 'jimin', 'saidakin7@gmail.com');
-- flush privileges; 

-- FLUSH PRIVILEGES;

-- drop table if exists repository;	
