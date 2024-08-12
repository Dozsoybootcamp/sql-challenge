# Employee Database: SQL Challenge

## Project Overview

This project involves building a relational database to store and analyze employee information. The database schema includes tables for employees, their salaries, departments, and titles. The project required designing an Entity Relationship Diagram (ERD) and writing SQL queries to explore the data.

## Database Design

### Entity Relationship Diagram (ERD)

The ERD for this project was created using QuickDBD. The diagram represents the following relationships:

- **Employees**: Stores employee information, with `emp_no` as the primary key. The `emp_title_id` column is a foreign key referencing the `Titles` table.
- **Titles**: Contains job titles with `title_id` as the primary key.
- **Departments**: Stores department information with `dept_no` as the primary key.
- **Salaries**: Links employee salaries to employees with `emp_no` as the primary key and foreign key.
- **Dept_Emp**: Connects employees to departments using a composite primary key consisting of `emp_no` and `dept_no`.
- **Dept_Manager**: Tracks department managers, also using a composite primary key of `emp_no` and `dept_no`.

### Database Schema

The database schema was designed to ensure data integrity and enforce relationships between tables. The primary keys, foreign keys, and data types were carefully chosen to match the requirements of the project.

## SQL Queries

### Data Analysis

Several SQL queries were developed to analyze the employee data:

- **Employee Information**: Lists employee number, last name, first name, sex, and salary.
- **Hires in 1986**: Retrieves first name, last name, and hire date for employees hired in 1986.
- **Department Managers**: Lists department managers along with department number, department name, employee number, last name, and first name.
- **Employee Departments**: Lists department number for each employee along with their employee number, last name, first name, and department name.
- **Hercules B Employees**: Retrieves first name, last name, and sex for employees whose first name is Hercules and whose last name begins with B.
- **Sales and Development Employees**: Lists employees in the Sales and Development departments.
- **Last Name Frequency**: Counts and lists the frequency of last names among employees.

## Challenges and Solutions

During the project, there were initial challenges with establishing relationships between tables in QuickDBD. Specifically, the tool did not automatically generate connections. This issue was resolved by correctly defining primary keys and foreign keys in the input and simplifying the relationships.

## Conclusion

This project successfully demonstrates the use of SQL for managing and analyzing relational data. The database design and queries provide a robust framework for exploring employee information and relationships.

## Tools Used

- **QuickDBD**: Used for creating the ERD.
- **PostgreSQL**: The database management system used for this project.
- **SQL**: The query language used to interact with the database.
- ** AI

