create  database Book_details;

use Book_details;

create table book_info(book_id int,name varchar(100),Author_name varchar(50));

insert into book_info(book_id,name,Author_name) values(1,'deepwork','callnew port');


insert into book_info(book_id,name,Author_name) values(2,'shallowork','callnew port'),(3,'advanced DBMS','Eddy john'),(4,'Operating System','john doe');


alter table book_info  add Year int;

update book_info set Year=2000 where name='deepwork';

update book_info set Year=1990  where name='shallowork';
 

 select distinct Author_name  from book_info;


