## Employee Payroll System

# creating database
 create  database payroll;
use payroll;
# createing tables for the database
create table employees
(employee_id int primary key,
 employee_name varchar(255),
 deparment varchar(100),
 position varchar(100),
 hire_date date,
 base_salary decimal(10,2));
desc employees;
alter table employees modify column position varchar(150);

 create table attendence
(
 attendence_id int primary key,
 employee_id int,
 attendence_date date,
 Status enum('present','absent','leave'));
 desc attendence;

 create table Salaries
 (
 salary_id  int primary key,
 employee_id int,
 base_salary decimal(10,2),
 bonus decimal(10,2),
 deductions decimal(10,2),
 Month varchar(20),
 Year  int);
 desc Salaries;

create table payroll
(
 payroll_id int primary key,
 employee_id int,
 total_salary decimal(10,2),
 payment_date date);
 desc payroll;
# showing the tables.
 show tables;
# inserting values into tables
 insert into employees values
(101,'james','software devolper','devolper','2023-01-01',30000),
(102,'varun','data scientist','scientist','2023-08-09',35000),
(103,'jacob','data analysist','analysist','2023-09-07',35000),
(104,'vibin','python devolper','devolper','2023-05-05',30000);
select* from employees;
desc employees;
insert into attendence values
(1,101,'2023-01-10','present'),
(2,102,'2023-08-10','present'),
(3,103,'2023-09-10','absent'),
(4,104,'2023-05-10','leave');
desc attendence;
select*from attendence;

insert into payroll values
(201,101,35000,'2023-02-01'),
(202,102,35000,'2023-09-01'),
(203,103,30000,'2023-10-01'),
(204,104,30000,'2023-09-01');
desc payroll;
select* from payroll;

insert into salaries values
(1001,101,30000,1000,500,'may',2023),
(1002,102,35000,1000,300,'march',2023),
(1003,103,35000,1500,500,'july',2023),
(1004,104,30000,2000,1000,'june',2023);
desc salaries;
select* from salaries;

# Update Employee Information: Provide functionality to update existing employee details (e.g., position, salary, department).
update employees set position='scientist',deparment='data scientist',base_salary=35000 where employee_id=101;

# Delete Employee Records:Enable users to remove employee records when no longer needed or relevant.
delete from employees where employee_id=101;

# Track Employee Attendance: Record daily attendance for employees, marking them as present, absent, or on leave.
select employee_id,count(attendence_id)from attendence group by employee_id;

# Calculate Salary:Automatically calculate employee salaries based on base salary, attendance, bonuses, and deductions.
select sum(bonus),sum(deductions),sum(base_salary) from salaries group by salary_id;

#  Manage Deductions and Bonuses: Allow users to add or update bonuses and deductions for each employee.
update salaries set bonus=1100,deductions=400 where employee_id=101;
update salaries set bonus=1200,deductions=500 where employee_id=102;
update salaries set bonus=1000,deductions=600 where employee_id=103;
update salaries set bonus=1000,deductions=100 where employee_id=104;
select* from salaries;

# Update Payroll Records: Calculate and store payroll data for each employee, including total salary and payment date.
select sum(total_salary),payment_date from payroll group by payment_date;

# Generate Pay Slips: Provide functionality to generate detailed pay slips for employees, showing salary breakdowns.
select payroll.total_salary,salaries.base_salary,salaries.bonus,salaries.deductions from payroll inner join
salaries on payroll.employee_id=salaries.employee_id;

# Update Stock Quantities: Allow manual updates to stock levels after receiving new inventory or making sales.
update payroll set payment_date='2023-08-01' where employee_id=104;
select* from payroll;

# Generate Payroll Reports: Create payroll summaries and reports, such as overall salary expenses, employee attendance, or monthly payroll distributions.
select sum(total_salary) from payroll;

select count(Status) from attendence where Status='present';
select count(Status) from attendence where Status='absent';
select count(Status) from attendence where Status='leave';

select count(Month) from salaries where Month='may';
select count(Month) from salaries where Month='march';
select count(Month) from salaries where Month='july';
select count(Month) from salaries where Month='june';
