create database HR
use HR

create table department(
department_id int not null,
department_name  varchar(50)  not null,
location varchar(50) not null
primary key (department_id,location )
) 

insert into department values(52001,'IT','hyd'),(52001,'IT','chennai'),
(52001,'IT','mumbai'),(52001,'IT','bengaluru')
insert into department values (52002,'hr','hyd'),(52002,'hr','chennai'),
(52002,'hr','mumbai'),(52002,'hr','bengaluru')
INSERT INTO department (department_id, department_name, location) VALUES 
(52003, 'Sales', 'hyd'),
(52003, 'Sales', 'chennai'),
(52003, 'Sales', 'mumbai'),
(52003, 'Sales', 'bengaluru')
INSERT INTO department (department_id, department_name, location) VALUES 
(52004, 'Marketing', 'hyd'),
(52004, 'Marketing', 'chennai'),
(52004, 'Marketing', 'mumbai'),
(52004, 'Marketing', 'bengaluru')
INSERT INTO department (department_id, department_name, location) VALUES 
(52005, 'Analyst', 'hyd'),
(52005, 'Analyst', 'chennai'),
(52005, 'Analyst', 'mumbai'),
(52005, 'Analyst', 'bengaluru')


select * from  department

create table employee(
employee_id int  identity (3321,1) primary key,
employee_name varchar(50) not null,
designation  varchar(50) not null,
department_id int ,
location varchar(50),
salary money,
constraint fk_employee
foreign key (department_id,location) references department(department_id,location)
)

insert into employee values ('nani','devops',52001,'hyd',65000),

('Rahul', 'Software Engineer', 52001, 'chennai', 70000),
('Priya', 'Cloud Architect', 52001, 'mumbai', 95000),
('Sandeep', 'QA Engineer', 52001, 'bengaluru', 55000),
('Anusha', 'DevOps Admin', 52001, 'hyd', 68000),
('Kiran', 'Frontend Developer', 52001, 'chennai', 62000),
('Sneha', 'Backend Developer', 52001, 'mumbai', 78000),
('Vijay', 'Database Administrator', 52001, 'bengaluru', 85000),
('Kavya', 'HR Manager', 52002, 'hyd', 60000),
('Ravi', 'Recruiter', 52002, 'chennai', 45000),
('Divya', 'HR Analyst', 52002, 'mumbai', 50000),
('Arjun', 'Talent Acquisition', 52002, 'bengaluru', 48000),
('Harika', 'HR Specialist', 52002, 'hyd', 52000),
('Manish', 'HR Generalist', 52002, 'chennai', 47000),
('Pranathi', 'Payroll Executive', 52002, 'mumbai', 53000),
('Suresh', 'HR Director', 52002, 'bengaluru', 120000),
('Vamsi', 'Sales Executive', 52003, 'hyd', 40000),
('Jyothi', 'Sales Manager', 52003, 'chennai', 75000),
('Sai', 'Account Executive', 52003, 'mumbai', 42000),
('Ramya', 'Business Development', 52003, 'bengaluru', 48000),
('Teja', 'Sales Lead', 52003, 'hyd', 65000),
('Nikhil', 'Inside Sales Rep', 52003, 'chennai', 35000),
('Pallavi', 'Sales Coordinator', 52003, 'mumbai', 38000),
('Tarun', 'Regional Sales Head', 52003, 'bengaluru', 110000),
('Deepak', 'Marketing Specialist', 52004, 'hyd', 55000),
('Swathi', 'SEO Analyst', 52004, 'chennai', 45000),
('Prasad', 'Content Writer', 52004, 'mumbai', 40000),
('Meghana', 'Digital Marketing Lead', 52004, 'bengaluru', 80000),
('Akhil', 'Social Media Manager', 52004, 'hyd', 48000),
('Sravani', 'Brand Manager', 52004, 'chennai', 85000),
('Ganesh', 'Marketing Coordinator', 52004, 'mumbai', 42000),
('Sireesha', 'Campaign Specialist', 52004, 'bengaluru', 60000),
('Naresh', 'Data Analyst', 52005, 'hyd', 60000),
('Ravali', 'Business Analyst', 52005, 'chennai', 65000),
('Chaitanya', 'Data Scientist', 52005, 'mumbai', 105000),
('Bhavana', 'BI Developer', 52005, 'bengaluru', 72000),
('Kalyan', 'Financial Analyst', 52005, 'hyd', 58000),
('Sirisha', 'Systems Analyst', 52005, 'chennai', 63000),
('Mahesh', 'Sr. Data Analyst', 52005, 'mumbai', 85000),
('Roopa', 'Data Engineer', 52005, 'bengaluru', 90000)

select * from employee

create table attendance(
attendance_id  int  identity (1,1) primary key , 
employee_id int ,
punch_intime datetime not null,
punch_outtime datetime default getdate(),
status varchar(50) default 'present',
constraint fk_attendance_status  check(status in ('present','absent','leave')),
foreign key (employee_id)  references employee(employee_id)  on delete set null 
)
insert into attendance(employee_id) values(3321),(3322),(3323)
ALTER TABLE attendance DROP CONSTRAINT IF EXISTS df_attendance_punch_intime
alter  table attendance add constraint df_attendance_punch_intime 
default (cast(getdate() as  date))
for punch_intime 

select * from attendance

insert into attendance(employee_id,punch_intime,punch_outtime,status) values 
(3324,2026-10-2,2026-10-2,'present')

delete  from attendance  where employee_id =3324

insert into attendance(employee_id, punch_intime) values (3324,'2026-10-02')
INSERT INTO attendance (employee_id, punch_intime, punch_outtime, status) VALUES
(3321, '2026-09-28 09:00:00', '2026-09-28 18:00:00', 'present'),
(3322, '2026-09-28 09:15:00', '2026-09-28 17:45:00', 'present'),
(3323, '2026-09-28 00:00:00', '2026-09-28 00:00:00', 'absent'),
(3321, '2026-09-29 08:55:00', '2026-09-29 18:05:00', 'present'),
(3322, '2026-09-29 00:00:00', '2026-09-29 00:00:00', 'leave'),
(3324, '2026-09-29 09:30:00', '2026-09-29 18:30:00', 'present'),
(3321, '2026-09-30 09:00:00', '2026-09-30 18:00:00', 'present'),
(3322, '2026-09-30 09:10:00', '2026-09-30 17:50:00', 'present'),
(3323, '2026-09-30 09:00:00', '2026-09-30 18:15:00', 'present'),
(3324, '2026-09-30 00:00:00', '2026-09-30 00:00:00', 'absent'),
(3321, '2026-10-01 08:45:00', '2026-10-01 17:45:00', 'present'),
(3322, '2026-10-01 09:00:00', '2026-10-01 18:00:00', 'present'),
(3323, '2026-10-01 09:05:00', '2026-10-01 18:00:00', 'present'),
(3324, '2026-10-01 09:00:00', '2026-10-01 18:00:00', 'present'),
(3321, '2026-10-02 09:00:00', '2026-10-02 18:00:00', 'present'),
(3322, '2026-10-02 00:00:00', '2026-10-02 00:00:00', 'absent'),
(3323, '2026-10-02 08:50:00', '2026-10-02 18:10:00', 'present'),
(3321, '2026-10-03 09:15:00', '2026-10-03 18:00:00', 'present'),
(3322, '2026-10-03 09:00:00', '2026-10-03 18:00:00', 'present'),
(3324, '2026-10-03 00:00:00', '2026-10-03 00:00:00', 'leave')

use hr

select * from attendance
insert into attendance (employee_id) values (3325)
INSERT INTO attendance (employee_id, punch_intime, punch_outtime, status) VALUES 
(3321, '2026-10-08 09:00:00', '2026-10-08 18:00:00', 'present'),
(3322, '2026-10-08 00:00:00', '2026-10-08 00:00:00', 'absent'),
(3323, '2026-10-08 09:10:00', '2026-10-08 18:05:00', 'present'),
(3324, '2026-10-08 08:50:00', '2026-10-08 18:00:00', 'present'),
(3325, '2026-10-08 00:00:00', '2026-10-08 00:00:00', 'leave'),
(3321, '2026-10-09 08:55:00', '2026-10-09 18:10:00', 'present'),
(3322, '2026-10-09 09:00:00', '2026-10-09 18:00:00', 'present'),
(3323, '2026-10-09 09:00:00', '2026-10-09 18:00:00', 'present'),
(3324, '2026-10-09 00:00:00', '2026-10-09 00:00:00', 'leave'),
(3325, '2026-10-09 09:20:00', '2026-10-09 17:50:00', 'present'),
(3321, '2026-10-12 09:00:00', '2026-10-12 18:00:00', 'present'),
(3322, '2026-10-12 09:00:00', '2026-10-12 18:00:00', 'present'),
(3323, '2026-10-12 00:00:00', '2026-10-12 00:00:00', 'absent'),
(3324, '2026-10-12 09:00:00', '2026-10-12 18:00:00', 'present'),
(3325, '2026-10-12 09:00:00', '2026-10-12 18:00:00', 'present'),
(3321, '2026-10-13 09:00:00', '2026-10-13 18:00:00', 'present'),
(3322, '2026-10-13 00:00:00', '2026-10-13 00:00:00', 'absent'),
(3323, '2026-10-13 09:05:00', '2026-10-13 18:10:00', 'present'),
(3324, '2026-10-13 09:00:00', '2026-10-13 18:00:00', 'present'),
(3325, '2026-10-13 08:50:00', '2026-10-13 17:55:00', 'present'),
(3321, '2026-10-14 09:00:00', '2026-10-14 18:00:00', 'present'),
(3322, '2026-10-14 09:10:00', '2026-10-14 18:00:00', 'present'),
(3323, '2026-10-14 09:00:00', '2026-10-14 18:00:00', 'present'),
(3324, '2026-10-14 00:00:00', '2026-10-14 00:00:00', 'leave'),
(3325, '2026-10-14 09:00:00', '2026-10-14 18:15:00', 'present'),
(3321, '2026-10-15 08:55:00', '2026-10-15 18:00:00', 'present'),
(3322, '2026-10-15 09:00:00', '2026-10-15 18:00:00', 'present'),
(3323, '2026-10-15 09:00:00', '2026-10-15 18:00:00', 'present'),
(3324, '2026-10-15 09:00:00', '2026-10-15 18:00:00', 'present'),
(3325, '2026-10-15 00:00:00', '2026-10-15 00:00:00', 'absent'),
(3321, '2026-10-16 09:00:00', '2026-10-16 18:00:00', 'present'),
(3322, '2026-10-16 09:00:00', '2026-10-16 18:00:00', 'present'),
(3323, '2026-10-16 00:00:00', '2026-10-16 00:00:00', 'leave'),
(3324, '2026-10-16 09:05:00', '2026-10-16 18:10:00', 'present'),
(3325, '2026-10-16 09:00:00', '2026-10-16 18:00:00', 'present'),
(3321, '2026-10-19 09:00:00', '2026-10-19 18:00:00', 'present'),
(3322, '2026-10-19 00:00:00', '2026-10-19 00:00:00', 'leave'),
(3323, '2026-10-19 09:00:00', '2026-10-19 18:00:00', 'present'),
(3324, '2026-10-19 09:00:00', '2026-10-19 18:00:00', 'present'),
(3325, '2026-10-19 09:00:00', '2026-10-19 18:00:00', 'present'),
(3321, '2026-10-20 09:00:00', '2026-10-20 18:00:00', 'present'),
(3322, '2026-10-20 09:00:00', '2026-10-20 18:00:00', 'present'),
(3323, '2026-10-20 09:00:00', '2026-10-20 18:00:00', 'present'),
(3324, '2026-10-20 00:00:00', '2026-10-20 00:00:00', 'absent'),
(3325, '2026-10-20 09:00:00', '2026-10-20 18:00:00', 'present')
INSERT INTO attendance (employee_id, punch_intime, punch_outtime, status) VALUES 
(3321, '2026-10-21 09:00:00', '2026-10-21 18:00:00', 'present'),
(3322, '2026-10-21 09:00:00', '2026-10-21 18:00:00', 'present'),
(3323, '2026-10-21 00:00:00', '2026-10-21 00:00:00', 'leave'),
(3324, '2026-10-21 09:05:00', '2026-10-21 18:10:00', 'present'),
(3325, '2026-10-21 09:00:00', '2026-10-21 18:00:00', 'present'),
(3321, '2026-10-22 09:00:00', '2026-10-22 18:00:00', 'present'),
(3322, '2026-10-22 00:00:00', '2026-10-22 00:00:00', 'absent'),
(3323, '2026-10-22 09:00:00', '2026-10-22 18:00:00', 'present'),
(3324, '2026-10-22 08:55:00', '2026-10-22 17:50:00', 'present'),
(3325, '2026-10-22 09:00:00', '2026-10-22 18:00:00', 'present'),
(3321, '2026-10-23 08:50:00', '2026-10-23 18:05:00', 'present'),
(3322, '2026-10-23 09:00:00', '2026-10-23 18:00:00', 'present'),
(3323, '2026-10-23 09:00:00', '2026-10-23 18:00:00', 'present'),
(3324, '2026-10-23 00:00:00', '2026-10-23 00:00:00', 'leave'),
(3325, '2026-10-23 09:10:00', '2026-10-23 18:00:00', 'present'),
(3321, '2026-10-26 09:00:00', '2026-10-26 18:00:00', 'present'),
(3322, '2026-10-26 09:00:00', '2026-10-26 18:00:00', 'present'),
(3323, '2026-10-26 00:00:00', '2026-10-26 00:00:00', 'absent'),
(3324, '2026-10-26 09:00:00', '2026-10-26 18:00:00', 'present'),
(3325, '2026-10-26 09:00:00', '2026-10-26 18:00:00', 'present'),
(3321, '2026-10-27 09:00:00', '2026-10-27 18:00:00', 'present'),
(3322, '2026-10-27 08:45:00', '2026-10-27 17:55:00', 'present'),
(3323, '2026-10-27 09:00:00', '2026-10-27 18:00:00', 'present'),
(3324, '2026-10-27 09:00:00', '2026-10-27 18:15:00', 'present'),
(3325, '2026-10-27 00:00:00', '2026-10-27 00:00:00', 'leave'),
(3321, '2026-10-28 09:00:00', '2026-10-28 18:00:00', 'present'),
(3322, '2026-10-28 00:00:00', '2026-10-28 00:00:00', 'leave'),
(3323, '2026-10-28 09:00:00', '2026-10-28 18:00:00', 'present'),
(3324, '2026-10-28 09:00:00', '2026-10-28 18:00:00', 'present'),
(3325, '2026-10-28 09:05:00', '2026-10-28 18:10:00', 'present'),
(3321, '2026-10-29 09:00:00', '2026-10-29 18:00:00', 'present'),
(3322, '2026-10-29 09:15:00', '2026-10-29 18:00:00', 'present'),
(3323, '2026-10-29 09:00:00', '2026-10-29 18:00:00', 'present'),
(3324, '2026-10-29 00:00:00', '2026-10-29 00:00:00', 'absent'),
(3325, '2026-10-29 09:00:00', '2026-10-29 17:50:00', 'present'),
(3321, '2026-10-30 00:00:00', '2026-10-30 00:00:00', 'leave'),
(3322, '2026-10-30 09:00:00', '2026-10-30 18:00:00', 'present'),
(3323, '2026-10-30 09:00:00', '2026-10-30 18:00:00', 'present'),
(3324, '2026-10-30 09:00:00', '2026-10-30 18:00:00', 'present'),
(3325, '2026-10-30 09:00:00', '2026-10-30 18:20:00', 'present'),
(3321, '2026-11-02 09:00:00', '2026-11-02 18:00:00', 'present'),
(3322, '2026-11-02 09:00:00', '2026-11-02 18:00:00', 'present'),
(3323, '2026-11-02 09:00:00', '2026-11-02 18:00:00', 'present'),
(3324, '2026-11-02 09:00:00', '2026-11-02 18:00:00', 'present'),
(3325, '2026-11-02 00:00:00', '2026-11-02 00:00:00', 'absent'),
(3321, '2026-11-03 09:00:00', '2026-11-03 18:00:00', 'present'),
(3322, '2026-11-03 00:00:00', '2026-11-03 00:00:00', 'leave'),
(3323, '2026-11-03 09:00:00', '2026-11-03 18:00:00', 'present'),
(3324, '2026-11-03 09:00:00', '2026-11-03 18:00:00', 'present'),
(3325, '2026-11-03 09:00:00', '2026-11-03 18:00:00', 'present'),
(3321, '2026-11-04 09:05:00', '2026-11-04 18:00:00', 'present'),
(3322, '2026-11-04 09:00:00', '2026-11-04 18:00:00', 'present'),
(3323, '2026-11-04 09:00:00', '2026-11-04 18:00:00', 'present'),
(3324, '2026-11-04 09:00:00', '2026-11-04 18:00:00', 'present'),
(3325, '2026-11-04 09:00:00', '2026-11-04 18:00:00', 'present'),
(3321, '2026-11-05 09:00:00', '2026-11-05 18:00:00', 'present'),
(3322, '2026-11-05 09:00:00', '2026-11-05 18:00:00', 'present'),
(3323, '2026-11-05 00:00:00', '2026-11-05 00:00:00', 'absent'),
(3324, '2026-11-05 09:00:00', '2026-11-05 18:00:00', 'present'),
(3325, '2026-11-05 09:00:00', '2026-11-05 18:00:00', 'present'),
(3321, '2026-11-06 09:00:00', '2026-11-06 18:00:00', 'present'),
(3322, '2026-11-06 09:00:00', '2026-11-06 18:00:00', 'present'),
(3323, '2026-11-06 09:00:00', '2026-11-06 18:00:00', 'present'),
(3324, '2026-11-06 00:00:00', '2026-11-06 00:00:00', 'leave'),
(3325, '2026-11-06 09:00:00', '2026-11-06 18:00:00', 'present'),
(3321, '2026-11-09 09:00:00', '2026-11-09 18:00:00', 'present'),
(3322, '2026-11-09 00:00:00', '2026-11-09 00:00:00', 'absent'),
(3323, '2026-11-09 09:00:00', '2026-11-09 18:00:00', 'present'),
(3324, '2026-11-09 09:00:00', '2026-11-09 18:00:00', 'present'),
(3325, '2026-11-09 09:00:00', '2026-11-09 18:00:00', 'present'),
(3321, '2026-11-10 09:00:00', '2026-11-10 18:00:00', 'present'),
(3322, '2026-11-10 09:00:00', '2026-11-10 18:00:00', 'present'),
(3323, '2026-11-10 09:00:00', '2026-11-10 18:00:00', 'present'),
(3324, '2026-11-10 09:00:00', '2026-11-10 18:00:00', 'present'),
(3325, '2026-11-10 00:00:00', '2026-11-10 00:00:00', 'leave'),
(3321, '2026-11-11 00:00:00', '2026-11-11 00:00:00', 'absent'),
(3322, '2026-11-11 09:00:00', '2026-11-11 18:00:00', 'present'),
(3323, '2026-11-11 09:00:00', '2026-11-11 18:00:00', 'present'),
(3324, '2026-11-11 09:00:00', '2026-11-11 18:00:00', 'present'),
(3325, '2026-11-11 09:00:00', '2026-11-11 18:00:00', 'present'),
(3321, '2026-11-12 09:00:00', '2026-11-12 18:00:00', 'present'),
(3322, '2026-11-12 09:00:00', '2026-11-12 18:00:00', 'present'),
(3323, '2026-11-12 09:00:00', '2026-11-12 18:00:00', 'present'),
(3324, '2026-11-12 00:00:00', '2026-11-12 00:00:00', 'leave'),
(3325, '2026-11-12 09:00:00', '2026-11-12 18:00:00', 'present'),
(3321, '2026-11-13 09:00:00', '2026-11-13 18:00:00', 'present'),
(3322, '2026-11-13 09:00:00', '2026-11-13 18:00:00', 'present'),
(3323, '2026-11-13 00:00:00', '2026-11-13 00:00:00', 'absent'),
(3324, '2026-11-13 09:00:00', '2026-11-13 18:00:00', 'present'),
(3325, '2026-11-13 09:00:00', '2026-11-13 18:00:00', 'present'),
(3321, '2026-11-16 09:00:00', '2026-11-16 18:00:00', 'present'),
(3322, '2026-11-16 00:00:00', '2026-11-16 00:00:00', 'leave'),
(3323, '2026-11-16 09:00:00', '2026-11-16 18:00:00', 'present'),
(3324, '2026-11-16 09:00:00', '2026-11-16 18:00:00', 'present'),
(3325, '2026-11-16 09:00:00', '2026-11-16 18:00:00', 'present'),
(3321, '2026-11-17 09:00:00', '2026-11-17 18:00:00', 'present'),
(3322, '2026-11-17 09:00:00', '2026-11-17 18:00:00', 'present'),
(3323, '2026-11-17 09:00:00', '2026-11-17 18:00:00', 'present'),
(3324, '2026-11-17 09:00:00', '2026-11-17 18:00:00', 'present'),
(3325, '2026-11-17 00:00:00', '2026-11-17 00:00:00', 'absent'),
(3321, '2026-11-18 09:00:00', '2026-11-18 18:00:00', 'present'),
(3322, '2026-11-18 09:00:00', '2026-11-18 18:00:00', 'present'),
(3323, '2026-11-18 00:00:00', '2026-11-18 00:00:00', 'leave'),
(3324, '2026-11-18 09:00:00', '2026-11-18 18:00:00', 'present'),
(3325, '2026-11-18 09:00:00', '2026-11-18 18:00:00', 'present'),
(3321, '2026-11-19 09:00:00', '2026-11-19 18:00:00', 'present'),
(3322, '2026-11-19 00:00:00', '2026-11-19 00:00:00', 'absent'),
(3323, '2026-11-19 09:00:00', '2026-11-19 18:00:00', 'present'),
(3324, '2026-11-19 09:00:00', '2026-11-19 18:00:00', 'present'),
(3325, '2026-11-19 09:00:00', '2026-11-19 18:00:00', 'present'),
(3321, '2026-11-20 09:00:00', '2026-11-20 18:00:00', 'present'),
(3322, '2026-11-20 09:00:00', '2026-11-20 18:00:00', 'present'),
(3323, '2026-11-20 09:00:00', '2026-11-20 18:00:00', 'present'),
(3324, '2026-11-20 09:00:00', '2026-11-20 18:00:00', 'present'),
(3325, '2026-11-20 00:00:00', '2026-11-20 00:00:00', 'leave'),
(3321, '2026-11-23 09:00:00', '2026-11-23 18:00:00', 'present'),
(3322, '2026-11-23 09:00:00', '2026-11-23 18:00:00', 'present'),
(3323, '2026-11-23 00:00:00', '2026-11-23 00:00:00', 'absent'),
(3324, '2026-11-23 09:00:00', '2026-11-23 18:00:00', 'present'),
(3325, '2026-11-23 09:00:00', '2026-11-23 18:00:00', 'present'),
(3321, '2026-11-24 09:00:00', '2026-11-24 18:00:00', 'present'),
(3322, '2026-11-24 09:00:00', '2026-11-24 18:00:00', 'present'),
(3323, '2026-11-24 09:00:00', '2026-11-24 18:00:00', 'present'),
(3324, '2026-11-24 00:00:00', '2026-11-24 00:00:00', 'leave'),
(3325, '2026-11-24 09:00:00', '2026-11-24 18:00:00', 'present'),
(3321, '2026-11-25 09:00:00', '2026-11-25 18:00:00', 'present'),
(3322, '2026-11-25 00:00:00', '2026-11-25 00:00:00', 'leave'),
(3323, '2026-11-25 09:00:00', '2026-11-25 18:00:00', 'present'),
(3324, '2026-11-25 09:00:00', '2026-11-25 18:00:00', 'present'),
(3325, '2026-11-25 09:00:00', '2026-11-25 18:00:00', 'present')

select * from employee
select * from attendance


    DROP TABLE payroll

WITH SepAttendanceSummary AS (
    SELECT 
        employee.employee_id,
        employee.salary,
        MONTH(attendance.punch_intime) AS [month_num],
        YEAR(attendance.punch_intime) AS [year_num],
        COUNT(CASE WHEN attendance.status IN ('leave', 'absent') THEN 1 END) AS total_leaves
    FROM employee 
    JOIN attendance ON employee.employee_id = attendance.employee_id
    WHERE MONTH(attendance.punch_intime) = 9 
      AND YEAR(attendance.punch_intime) = YEAR(GETDATE())
    GROUP BY employee.employee_id, employee.salary, MONTH(attendance.punch_intime), YEAR(attendance.punch_intime)
)
SELECT 
    'INF-' + CAST(employee_id AS VARCHAR(10)) + '-' + 
             CAST(year_num AS VARCHAR(4)) + 
             RIGHT('0' + CAST(month_num AS VARCHAR(2)), 2) AS payroll_id,
    employee_id,
    'september' as [month],
      
    year_num AS [year],
    0.00 AS bonus,
    total_leaves * 1200.00 AS deductions,
    salary - (total_leaves * 1200.00) AS net_salary
INTO payroll
FROM SepAttendanceSummary

create table leaves (
leave_id int  identity(100,1) primary key,
employee_id int ,
leave_date date not null,
leave_type varchar(100) not null,
status varchar(50), 
constraint fk_leaves_status  check(status in ('approved','pending','rejected ')),
foreign key (employee_id)  references employee(employee_id)  on delete set default)

insert into leaves (employee_id,leave_date,leave_type ,status) values (3321,'11.10.2026','sickleave' ,
'approved')
INSERT INTO leaves(employee_id,leave_date,leave_type,status)VALUES(3321,'2026-11-02','casual leave','approved'),
(3322,'2026-11-04','sick leave','approved'),(3323,'2026-11-06','marriage leave','approved')
,(3324,'2026-11-09','paid leave','approved'),(3325,'2026-11-11','casual leave','approved'),(3326,'2026-11-13','sick leave','approved'),
(3327,'2026-11-16','marriage leave','approved'),(3328,'2026-11-18','paid leave','pending'),(3329,'2026-11-20','casual leave','approved'),
(3330,'2026-11-23','sick leave','pending'),(3331,'2026-11-25','marriage leave','approved'),(3332,'2026-11-27','paid leave','approved'),
(3333,'2026-11-30','casual leave','rejected'),(3334,'2026-11-03','sick leave','approved'),(3335,'2026-11-05','marriage leave','approved'),
(3336,'2026-11-10','paid leave','pending'),(3337,'2026-11-12','casual leave','pending'),(3338,'2026-11-17','sick leave','approved'),
(3339,'2026-11-19','marriage leave','rejected'),(3340,'2026-11-24','paid leave','approved'),(3341,'2026-12-01','casual leave','approved'),
(3342,'2026-12-03','sick leave','approved'),(3343,'2026-12-04','marriage leave','rejected'),(3344,'2026-12-07','paid leave','approved'),
(3345,'2026-12-09','casual leave','approved'),(3346,'2026-12-11','sick leave','approved'),(3347,'2026-12-14','marriage leave','approved')
,(3348,'2026-12-16','paid leave','approved'),(3349,'2026-12-18','casual leave','pending'),(3350,'2026-12-21','sick leave','approved'),
(3351,'2026-12-23','marriage leave','approved'),(3352,'2026-12-24','paid leave','approved'),(3353,'2026-12-28','casual leave','approved'),
(3354,'2026-12-02','sick leave','rejected'),(3355,'2026-12-08','marriage leave','approved'),(3356,'2026-12-10','paid leave','approved'),
(3357,'2026-12-15','casual leave','approved'),(3358,'2026-12-17','sick leave','pending'),(3359,'2026-12-22','marriage leave','approved'),
(3360,'2026-12-29','paid leave','rejected')

select * from employee
select employee_name,employee_id,salary  from employee where salary>60000

select  DISTINCT employee_name,employee_id,department_name from employee  join  department  on department.department_id= employee.department_id
where department_name ='IT'

select employee_name,employee_id from employee 
where department_id in ( select department_id from department where department_name ='IT'
)     

alter table  employee add join_date date 
select * from employee
update employee set  join_date ='2022.10.8' where employee_id =3321
SET DATEFORMAT ymd;UPDATE employee SET join_date = CASE 
WHEN employee_id=3322 THEN '2022.02.10'
WHEN employee_id=3323 THEN '2022.03.05'
WHEN employee_id=3324 THEN '2022.04.12'
WHEN employee_id=3325 THEN '2022.05.20'
WHEN employee_id=3326 THEN '2022.06.18'
WHEN employee_id=3327 THEN '2022.07.25'
WHEN employee_id=3328 THEN '2022.08.14'
WHEN employee_id=3329 THEN '2022.09.09'
WHEN employee_id=3330 THEN '2022.10.01'
WHEN employee_id=3331 THEN '2022.11.15'
WHEN employee_id=3332 THEN '2022.12.05'
WHEN employee_id=3333 THEN '2023.01.20'
WHEN employee_id=3334 THEN '2023.02.11'
WHEN employee_id=3335 THEN '2023.03.14'
WHEN employee_id=3336 THEN '2023.04.22'
WHEN employee_id=3337 THEN '2023.05.19'
WHEN employee_id=3338 THEN '2023.06.30'
WHEN employee_id=3339 THEN '2023.07.04'
WHEN employee_id=3340 THEN '2023.08.12'
WHEN employee_id=3341 THEN '2023.09.21'
WHEN employee_id=3342 THEN '2023.10.10'
WHEN employee_id=3343 THEN '2023.11.05'
WHEN employee_id=3344 THEN '2023.12.25'
WHEN employee_id=3345 THEN '2024.01.11'
WHEN employee_id=3346 THEN '2024.02.17'
WHEN employee_id=3347 THEN '2024.03.29'
WHEN employee_id=3348 THEN '2024.04.05'
WHEN employee_id=3349 THEN '2024.05.14'
WHEN employee_id=3350 THEN '2024.06.23'
WHEN employee_id=3351 THEN '2024.07.19'
WHEN employee_id=3352 THEN '2024.08.30'
WHEN employee_id=3353 THEN '2024.09.12'
WHEN employee_id=3354 THEN '2024.10.05'
WHEN employee_id=3355 THEN '2024.11.22'
WHEN employee_id=3356 THEN '2024.12.15'
WHEN employee_id=3357 THEN '2025.01.10'
WHEN employee_id=3358 THEN '2025.02.18'
WHEN employee_id=3359 THEN '2025.03.05'
WHEN employee_id=3360 THEN '2025.04.12'
END WHERE employee_id IN (3322,3323,3324,3325,3326,3327,3328,3329,3330,3331,3332,3333,3334,3335,3336,3337,3338,3339,3340,3341,3342,3343,3344,3345,3346,3347,3348,3349,3350,3351,3352,3353,3354,3355,3356,3357,3358,3359,3360);

select *  from employee where  join_date <='2023-01-20'
select * from employee where join_date >='2023-01-20'

select * from employee order by salary desc

select    max(salary) as highest_salary, min(salary) as maxium_salary,avg(salary) as avarhage_salary  from employee 

select department_name ,count (DISTINCT employee.employee_id) as dept_wise_total
from employee  join department on  employee.department_id=department.department_id group by department.department_name 

select department_name ,avg ( employee.salary) as dept_avg_salary 
from employee  join department on  employee.department_id=department.department_id group by department.department_name 

select   department.department_name, COUNT(DISTINCT employee.employee_id) as dept_total from employee join department on
employee.department_id=department.department_id 
group by department.department_name  having count(distinct employee.employee_id)>5

select * from payroll

select sum(net_salary) as total_salary from payroll  where month ='september'


SELECT TOP 1 
    department.department_name, 
    SUM(employee.salary) AS total_department_payroll
FROM 
    employee 
JOIN 
    department ON employee.department_id = department.department_id
GROUP BY 
    department.department_name
ORDER BY 
    total_department_payroll DESC

select employee_name,department_name from employee join department on employee.department_id=department.department_id 

select employee_name,department_name ,department.location from employee join department on employee.department_id=department.department_id 
and employee.location=department.location

select department_name from department

select * from employee where salary >(select avg(salary) from employee)

select distinct 
employee_name,department_name, salary ,employee.location from employee  join  department on employee.department_id=department.department_id 
and  employee.location =department.location 
where salary >(select avg(salary) from employee where  employee.department_id=department.department_id )

SELECT employee_name, salary 
FROM employee 
ORDER BY salary DESC
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY 

SELECT 
    employee_name,
    designation,
    salary,
    CASE 
        WHEN salary = (select max(salary) from employee )  THEN 'High'
        WHEN salary >=(select avg(salary) from employee )  THEN 'Medium'
        else 'low '
    END AS salary_category
FROM 
    employee

SELECT 
    employee_name,
    designation,
    salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM 
    employee

SELECT 
    department_name, 
    employee_name, 
    designation, 
    salary,
    DENSE_RANK() OVER (PARTITION BY employee.department_id ORDER BY employee.salary DESC) AS dept_salary_rank
FROM 
    employee 
JOIN 
    department  ON employee.department_id = department.department_id AND employee.location = department .location

with top3 as (
select 
department_name,employee_name,salary,
dense_rank() over (partition by employee.department_id order by salary desc ) as top3_salary
from employee
join department on employee.department_id =department.department_id  and employee.location = department .location)

select department_name,employee_name,salary from top3
where top3_salary <=3



SELECT 
    department_name,
    employee_name,
    salary AS employee_salary,
    AVG(employee.salary) OVER(PARTITION BY employee.department_id) AS department_average_salary
FROM 
    employee 
JOIN
    department ON employee.department_id = department.department_id AND employee.location = department.location



select employee_name,count(attendance.attendance_id)  AS TOTAL_ABSENT from employee join attendance on employee.employee_id =attendance.employee_id 
where attendance.status='absent'
group by employee_name having count(attendance.attendance_id )>3

select employee_name,count(attendance.attendance_id)  AS TOTAL_ABSENT from employee join attendance on employee.employee_id =attendance.employee_id 
where attendance.status='absent'
group by employee_name 

SELECT 
    employee.employee_id, 
    employee.employee_name,
    employee.designation,
    SUM(CASE WHEN attendance.status = 'Absent' THEN 1 ELSE 0 END) AS total_absences,
    SUM(CASE WHEN attendance.status = 'Leave' THEN 1 ELSE 0 END) AS total_leaves
FROM 
    employee
LEFT JOIN 
    attendance ON employee.employee_id = attendance.employee_id
GROUP BY 
    employee.employee_id,
    employee.employee_name,
    employee.designation

    
SELECT TOP 1
    e.employee_id,
    e.employee_name,
    e.designation,
    SUM(CASE WHEN a.status = 'Absent' THEN 1 ELSE 0 END) AS total_absences
FROM 
    employee e
JOIN 
    attendance a ON e.employee_id = a.employee_id
GROUP BY 
    e.employee_id, 
    e.employee_name, 
    e.designation
ORDER BY 
    total_absences DESC

SELECT 
    e.employee_id,
    e.employee_name,
    e.designation,
    p.month,
    p.year,
    p.bonus
FROM 
    employee e
JOIN 
    payroll p ON e.employee_id = p.employee_id
JOIN 
    department d ON e.department_id = d.department_id AND e.location = d.location
WHERE 
    p.bonus > 0;

    select * from payroll

SELECT 
    e.employee_id,
    e.employee_name,
    e.designation,
    p.month,
    p.year,
    p.deductions
FROM 
    employee e
JOIN 
    payroll p ON e.employee_id = p.employee_id
JOIN 
    department d ON e.department_id = d.department_id AND e.location = d.location
WHERE 
    p.deductions > 1000











































