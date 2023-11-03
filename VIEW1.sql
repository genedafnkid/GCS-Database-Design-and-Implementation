--This view can show the skills and expertise of all employees working for GCS. It can include information such as employee name, region, skills possessed by the employee, and their respective skill levels. This view can be useful for managers when assigning employees to new projects, ensuring that the right employees with the necessary skills are assigned to the right projects. It can also help managers identify gaps in employee skill sets and plan for necessary training and development programs.


CREATE VIEW EMPLOYEE_SKILL_SET_VIEW AS
SELECT E.EMPLOYEE_ID, E.EMP_FNAME ||' '||E.EMP_MI||'. '||E.EMP_LNAME as EMPLOYEE_NAME, R.REGION_NAME, S.SKILL_DESC, s.SKILL_RATE
FROM EMPLOYEE E
JOIN REGION R ON E.REGION_ID = R.REGION_ID
JOIN EMP_SKILL ES ON E.EMPLOYEE_ID = ES.EMPLOYEE_ID
JOIN SKILL S ON ES.SKILL_ID = S.SKILL_ID;

SELECT * FROM EMPLOYEE_SKILL_SET_VIEW
