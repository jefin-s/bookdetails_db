create database samples;
use sample

create table  book_details(id int,name varchar(50),primary key(id,name));
select *from book_details;
insert into book_details values(1,'jefin');
insert into book_details values(1,'heu');


alter table  book_details add   book_details  varchar(50);
update  book_details set book_details='bhfbvshi';
select *from book_details
