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

	 create procedure gellallbook_details
	 as 
	 begin
	 select *from book_details
	 end

	 exec gellallbook_details;
	 create procedure getbookwithid
	 @Authorid int
	 as 
	 begin
	 select b.book_name,a.author_name from  book_details b inner join  author_details a  on b.author_id=b.author_id  where b.author_id=@Authorid;
	 end

	 exec getbookwithid 1;


	 create procedure  totalSalesofBook
	 @bookid int 
	 as 
	 begin

	 select  b.book_name ,sum(s.sales_amount) as totalsales from book_details b inner join  sales s on b.Book_id=s.book_id 
	 where b.Book_id=@bookid
	 group by b.book_name
	 end
	 exec totalSalesofBook 1;

	 create  procedure UpdateBookyear
	    @book_id int,
		@book_year  date
		as 
		begin 
		update sales set sales_date='2023-05-12' where book_id=1;
		end


		alter procedure updateBookYear
		    @book_id int,
		@book_year  date
		as 
		begin 
		update sales set sales_date='2023-05-12' where book_id=@book_id;
		end

		alter procedure updateBookYear
		    @book_id int,
		@book_year  date
		as 
		begin 
		update sales set sales_date=@book_year where book_id=@book_id;
		end

		exec updateBookYear 1,'2023-02-25';

	

	select *from sales;

	create  procedure inertprocedure

	@author_id int,
	@author_name  varchar(50)
	as 
	begin
	insert into author_details (Author_id,Author_name) values(@author_id,@author_name);
	end

	exec inertprocedure 4,'eddy john';
	select *from author_details;


	create procedure updatebookPrice
	@book_id int,
	@book_price decimal(10,2)
	as

	begin
	if exists(select 1 from book_details where Book_id=@book_id)
	 begin
	  update sales
	  set sales_amount=@book_price
	  where book_id=@book_id
	  print 'upated successfully'
	  end 
	  else
	  begin 
	  print 'not found'
	  end
	  end;

	  exec updatebookPrice 1,4000;
	  
	  create procedure showsalestable
	  as 
	  begin 
	  select *from sales
	  end

	  exec showsalestable

	  alter procedure  showsalestable 
	  as 
	  begin
	  select book_id,sales_amount from sales
	  end	
	  
	  exec showsalestable


	alter  procedure updatebookPrice
	@book_id int,
	@book_price decimal(10,2)
	as

	begin
	if exists(select * from book_details where Book_id=@book_id)
	 begin
	  update sales
	  set sales_amount=@book_price
	  where book_id=@book_id
	  print 'upated successfully'
	  end 
	  else
	  begin 
	  print 'not found'
	  end
	  end;

	  exec updatebookPrice 1,4085;


	  create procedure  getBookTitle
	  as
	  begin
	  select book_name from book_details
	  end
	  exec getBookTitle
	  go
	  create procedure getWithauthorid
	  @author_id int
	  as
	  begin
	  select book_name from book_details where author_id = @author_id
	  end
	  go

	  exec getWithauthorid 1


	  create function getnoofbooksbyauthor(@authornmae varchar(50))
	  returns int
	  as 
	  begin 
	  declare  @total int
	  select @total=count(book_id) from book_details  b inner join author_details  a on b.author_id=a.Author_id where a.Author_name=@authornmae
	  return @total;
	  end

	  select dbo.ge tnoofbooksbyauthor('Minku')