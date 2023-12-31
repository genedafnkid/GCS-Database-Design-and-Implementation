# Project Management Database

This repository contains SQL scripts for creating a project management database. The database includes tables for managing customers, employees, skills, projects, tasks, task skills, work logs, assignments, and bills. It also includes stored procedures and triggers for various operations.

## Table of Contents
- [Database Schema](#database-schema)
- [Stored Procedures](#stored-procedures)
- [Triggers](#triggers)

## Database Schema

### Tables
- **REGION**: Represents different regions.
- **CUSTOMER**: Stores customer information.
- **SKILL**: Contains different skills and their rates.
- **EMPLOYEE**: Stores employee details.
- **EMP_SKILL**: Represents the skills of employees.
- **PROJECT**: Contains project information.
- **TASK**: Represents tasks within projects.
- **TASK_SKILL**: Links tasks with required skills and quantities.
- **BILL**: Stores billing information for projects.
- **ASSIGN**: Represents task assignments to employees.
- **WORK_LOG**: Logs work hours for assignments.

### Relationships
- Employees are associated with a specific region.
- Employees have multiple skills.
- Projects are associated with customers and employees.
- Tasks are part of projects and have specific skills requirements.
- Task skills represent the skills required for tasks.
- Assignments link employees with tasks and task skills.
- Work logs record hours worked on assignments and bills.

## Stored Procedures

### 1. `total_hours_worked_by_employee`
   - **Parameters**: `p_proj_id (NUMBER)`, `p_emp_id (NUMBER)`, `p_total_hours (OUT NUMBER)`
   - **Description**: Calculates the total hours worked by a specific employee on a project.

### 2. `project_cost_by_customer`
   - **Parameters**: `p_customer_id (NUMBER)`, `p_total_cost (OUT NUMBER)`
   - **Description**: Calculates the total cost of projects for a specific customer.

## Triggers

### 1. `prevent_customer_delete`
   - **Description**: Prevents deletion of a customer if there are associated projects.

## Views

### 1. PROJECT_DETAILS_VIEW:
- **Parameters**: None
- **Description**: Provides a comprehensive overview of all ongoing projects, including project ID, description, start and end dates, along with detailed employee assignments and customer information. This view consolidates data from multiple tables, offering a convenient reference for project managers and stakeholders to gain insights into project progress, task assignments, and customer relationships.

### 2. EMPLOYEE_SKILLS_VIEW:
   - **Parameters**: None
   - **Description**: Presents a consolidated view of employee skills and their proficiency levels within the organization. This view includes employee IDs, names, skills, skill descriptions, and proficiency levels. It offers valuable insights into the skills possessed by each employee, aiding project managers and team leads in making informed decisions regarding task assignments. By matching required skills with employee expertise, this view ensures that projects are staffed appropriately, enhancing project efficiency and success rates

---

