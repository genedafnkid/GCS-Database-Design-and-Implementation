--This view can show the schedule of all ongoing projects for a particular region or for the entire company. It can include information such as project name, project start and end dates, customer name, employee names and their respective tasks and task schedules. This view can be useful for managers to keep track of project progress and ensure that projects are on schedule. It can help managers identify if any project is delayed or if any task is not being completed on time. It can also help managers identify if an employee is overloaded with tasks or if an employee has a shortage of work.



CREATE OR REPLACE VIEW ONGOING_PROJECTS AS
SELECT p.PROJ_ID, p.PROJ_DESCRIPTION, p.PROJ_ESDATESTART, p.PROJ_ESDATEEND, c.CUSTOMER_NAME, e.EMP_FNAME || ' ' || e.EMP_LNAME AS EMPLOYEE_NAME, t.TASK_DESCRIPTION, t.TBEGIN_DATE, t.TEND_DATE, p.PROJ_ACDATEEND
FROM PROJECT p
JOIN CUSTOMER c ON p.CUSTOMER_ID = c.CUSTOMER_ID
JOIN EMPLOYEE e ON p.EMPLOYEE_ID = e.EMPLOYEE_ID
JOIN TASK t ON p.PROJ_ID = t.PROJ_ID;

select * from ONGOING_PROJECTS
