		create database demo;
		use demo;
		create table author_details(Author_id int primary key ,Author_name varchar(50));
		create table publishers(pubisher_id int primary key,Publisher_name varchar(50) );
		create table book_details(Book_id int primary key , book_name varchar(50) not null, author_id int,publish_year int ,publish_id int,constraint  fk_book_author foreign key (author_id) references author_details(author_id) on update cascade on delete cascade,constraint fk_book_publisher  foreign  key(publish_year) references publishers(pubisher_id) on update cascade on delete set null)

		insert into author_details values(1,'Call Newport'),(2,'Tinku'),(3,'Minku');
		insert into publishers values(1,'call n'),(2,'tinkan'),(3,'minkan');
		insert into book_details  (Book_id,book_name,author_id,publish_year,publish_id)values(1,'dot net ',1,2000,1),(2,'mern',2,2005,2),(3,'ruby',3,2000,3);

		alter table book_details 
		drop constraint fk_book_publisher; 

		alter table book_details
		add  constraint fk_book_publisher
		foreign key(publish_id)	
		references publishers(pubisher_id)
		on delete set null;
		select *from Book_details

		select  b.book_name ,a.author_name ,p.publisher_name from book_details b inner join  author_details a on b.author_id=a.Author_id
		inner join publishers p on  b.publish_id=p.pubisher_id
		insert into book_details values(4,'operating sysstem ',3,2000,null)

		select b.book_name ,a.author_name,p.publisher_name  from book_details b left join author_details a on b.author_id=a.Author_id 
		left join publishers p on b.publish_id=p.pubisher_id;

		select b.book_name ,p.publisher_name from book_details b  
		right join publishers p on b.publish_id =p.pubisher_id
		insert  into publishers values(4,'gtg')

			select b.book_name ,p.publisher_name from book_details b  
		full outer join publishers p on b.publish_id =p.pubisher_id


		update author_details set Author_name ='jefin ' where Author_id=1;
	delete from author_details  where Author_id=2;

	select Author_name as kalaakaaranmar from author_details union select publisher_name as ezhthkaaran from publishers


	create table sales(book_id int , sales_date date, sales_amount decimal(10,2));

	alter table sales add constraint  fk_sales_table  foreign key(book_id) references book_details(Book_id) on update cascade on delete cascade;

	select *from sales;
	
	insert into sales(book_id,sales_date,sales_amount) values(1,'2025-05-01',100);
		insert into sales(book_id,sales_date,sales_amount) values(4,'2025-05-21',200),(3,'2025-09-23',300);

	select   b.book_id,b.book_name, sum(s.sales_amount) as totalsales from book_details b  inner join sales s on b.book_id=s.book_id group by b.book_id,b.book_name


SELECT 
    b.book_name,
    YEAR(s.sales_date) AS sales_year,
    SUM(s.sales_amount) AS total_sales
FROM book_details b
INNER JOIN sales s  
    ON b.Book_id = s.book_id
GROUP BY  
    b.book_name,
    YEAR(s.sales_date);


	select b.book_name, sum(s.sales_amount) as total_sales from book_details b inner join sales s on b.Book_id=s.book_id group by b.book_name having  sum(s.sales_amount)>200;