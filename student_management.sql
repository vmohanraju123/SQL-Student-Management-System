create table student(
  st_id int primary key,
  st_name varchar(30) not null,
  st_branch varchar(30),
  st_marks int check(st_marks>= 0)
);

create table courses(
  course_id int primary key,
  course_name varchar(30)
);

create table enrollments
(
  st_id int,
  course_id int,
  foreign key(st_id) references student(st_id),
  foreign key(course_id) references courses(course_id)
);

INSERT INTO student VALUES
(101,'Raju','CSE',88),
(102,'Mohan','CSE-DS',92),
(103,'Sai','MECH',83);

select * from student;

INSERT INTO courses VALUES
(1,'Java'),
(2,'Python'),
(3,'SQL');

INSERT INTO enrollments VALUES
(101,1),
(101,3),
(102,2),
(103,3);

/* Add New Student */

insert into student values
(104,'Sam','CIVIL',86);

select * from student;

/* Update Student Marks */

update student
set st_marks = 95
where st_id = 101;

select * from student;

/* Delete Student */

/* Delete Student */

/* First delete from child table */
DELETE FROM enrollments
WHERE st_id = 102;

/* Then delete from parent table */
DELETE FROM student
WHERE st_id = 102;

select * from student;

/* Find Topper */

select *
from student
where st_marks =
(
  select max(st_marks)
  from student
);

/* Find Second Highest Marks */

select max(st_marks) as Second_Highest
from student
where st_marks <
(
  select max(st_marks)
  from student
);

/* Count Students Branch-Wise*/

select st_branch,
    count(*) as Total
from student
group by st_branch;

/*JOIN Query*/

select s.st_name,c.course_name
from student s
inner join enrollments e
on s.st_id=e.st_id
inner join courses c 
on e.course_id=c.course_id;

/*Create View*/

GO
create view toppers as 
select *
from student
where st_marks>85;
GO
select * from toppers;

/*index*/
create index index_student
on student(st_name);
