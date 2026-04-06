create table employees 
(emp_id int primary key,
name varchar(50),
dept_id int,
salary int,
join_date date );

create table departments( 
dept_id int primary key,
dept_name varchar(50));

----------------------------------------------------

insert into departments values
(1,'IT'),
(2,'HR'),
(3,'FINANCE'); 

insert into employees values 
(1, 'Ravi', 1, 50000, '2022-01-10'),
(2, 'priya', 2, 40000, '2022-03-15'),
(3, 'Amit', 1, 60000, '2021-07-20'),
(4, 'Sneha', 3, 45000, '2023-02-01'),
(5, 'Kiran', 1 , 55000, '2022-11-11') ;

-----------------------------------------------------

-- basic inner joins
-- get employee name + dept name
select e.name, d.dept_name, e.salary
from empoyees e 
join departments d 
on e.dept_id = d.dept_id;



-- count employees per departments

select d.dept_name, count(e.emp_id) AS
total_emp
from departments d 
join employees e 
on d.dept_id = e.dept_id
group by d.dept_name;

-- show all departments (left join)
select d.dept_name, e.name
from departments d 
left join employees e 
on e.dept_d = d.dept_id;

-----------------------------------------------------

-- highest paid employee in each department
select d.dept_name, e.name, e.salary
from employees e 
join departments d 
on e.dept_id = d.dept_id
where e.salary = (
select MAX(e2.salary) from employees e2
where e2.dept_id = e.dept_id );

-- avg salary per department
select d.dept_name, avg(salary) AS avg_salary
from employees e 
join departments d 
on e.dept_id = d.dept_id
group by d.dept_name;