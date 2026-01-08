create  database Book_details;

use Book_details;

create table book_info(book_id int,name varchar(100),Author_name varchar(50));

insert into book_info(book_id,name,Author_name) values(1,'deepwork','callnew port');


insert into book_info(book_id,name,Author_name) values(2,'shallowork','callnew port'),(3,'advanced DBMS','Eddy john'),(4,'Operating System','john doe');


alter table book_info  add Year int;

update book_info set Year=2000 where name='deepwork';

update book_info set Year=1990  where name='shallowork';
 



 create table author_table(id int primary key ,name varchar(50));

 insert into author_table(id,name) values(1, 'callnew port'),
(2, 'Eddy john'),
(3, 'john doe');

alter  table book_info add  author_id int ;
select *from author_table;

ALTER TABLE BOOK_INFO DROP column Author_name;

alter table  book_info add  constraint fk_book_author foreign key(author_id) references author_table(id);


 
select *from book_info;



create table publisher (id int primary key ,name varchar(50));
insert into publisher(id,name) values(1, 'Penguin'),
(2, 'Oxford Press'),
(3, 'McGraw Hill');
select * from publisher;

alter table book_info add pub_id int ;

update book_info set pub_id=1 where  book_id in(1,2);
update book_info set pub_id=3 where  book_id=3;
update book_info set pub_id=3 where  book_id=4;

update book_info set author_id=1 where  book_id in(1,2);
update book_info set author_id=2 where  book_id =3
update book_info set author_id=3 where  book_id =4


alter  table book_info add constraint pk_f foreign  key (pub_id) references	 publisher(id);

  

select b.book_id,
b.name,
a.name,
p.name
From book_info b  inner join  author_table a on b.author_id=a.id inner join  publisher p on b.pub_id=p.id;
 delete from book_info where book_id is null

 
 select  name ,book_id  from book_info union  select name,id from publisher