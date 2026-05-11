create database library_management;
use library_management;
create table  authors(
author_id int primary key auto_increment,
author_name varchar(100) not null,
country varchar(50)
);
create table books (
book_id int primary key auto_increment,
title varchar(150) not null,
author_id int,
category varchar(50),
price decimal(10,2),
stock int,
foreign key (author_id) references authors(author_id)
);
create table students (
student_id int primary key auto_increment,
student_name varchar(100),
email varchar(100) unique,
phone varchar(15)
);
create table issue_books (
issue_id int primary key auto_increment,
student_id int,
book_id int,
issue_date date,
return_date date,
foreign key (student_id) references students(student_id),
foreign key (book_id) references books(book_id)
);
insert into authors (author_name, country) values
('Chetan Bhagat', 'India'),
('J.K. Rowling', 'UK'),
('A.P.J. Kalam', 'India');

insert into books(title,author_id, category, price, stock) values
('Half Girlfriend',1,'Novel',299,10),
('Harry Potter', 2, 'Fantasy', 599, 15),
('Wings of Fire', 3, 'Biography', 350,8);

select*from books;
select * from books
where price>300;
update books 
set stock = 20
where book_id=1;

insert into students(student_name, email, phone) values
('Rohit Sharma', 'rohit@gmail.com', '9845678990'),
('Priya Verma', 'priya@gamil.com', '9876543090');

select*from students;
delete from students
where student_id=2;
insert into students(student_name,email,phone) values
('priya verma', 'priya@gmail.com','9876543090');

insert into issue_books(student_id, book_id, issue_date, return_date) values
(1,2, '2026-05-01', '2026-05-10'),
(2,1, '2026-05-03', null);

select*from issue_books;

select students.student_name,
books.title,
issue_books.issue_date
from issue_books
join students
on issue_books.student_id=students.student_id
join books
on issue_books.book_id=books.book_id;
 
 select count(*) as total_books
 from books;
  select avg(price) as average_price
  from books;
  select max(price) as highest_price
  from books;
   select category,
   count(*) as total_books
   from books
   group by category; 
    create view book_details as 
    select books.title,
    authors.author_name,
    books.price
    from books
    join authors 
    on books.author_id=authors.author_id;
    select*from book_details;
    create index idx_title
    on books(title);
  
    DELIMITER // 
    create procedure Getbooks()
	begin
    select*from books;
    END //
    DELIMITER ;
    call Getbooks();
    DELIMITER //
    create trigger reduce_stock 
    after insert on issue_books
    for each row
    begin 
    update books 
    set stock=stock-1
    where book_id=new.book_id;
    end //
    DELIMITER ;
    create table books_backup as 
    select*from books;
    
    
    
    
   



 

