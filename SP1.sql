CREATE OR REPLACE PROCEDURE total_hours_worked_by_employee(
    p_proj_id IN NUMBER,
    p_emp_id IN NUMBER,
    p_total_hours OUT NUMBER
)
AS
BEGIN
    SELECT SUM(WL.WL_HOURS)
    INTO p_total_hours
    FROM WORK_LOG WL
    INNER JOIN ASSIGN A ON WL.ASSIGN_ID = A.ASSIGN_ID
    INNER JOIN TASK_SKILL TS ON A.TS_ID = TS.TS_ID
    INNER JOIN TASK T ON TS.TASK_ID = T.TASK_ID
    INNER JOIN PROJECT P ON T.PROJ_ID = P.PROJ_ID
    WHERE P.PROJ_ID = p_proj_id AND P.EMPLOYEE_ID = p_emp_id;
END;
/

DECLARE
  l_total_hours NUMBER;
BEGIN
  total_hours_worked_by_employee(p_proj_id => 504, p_emp_id => 4, p_total_hours => l_total_hours);
  DBMS_OUTPUT.PUT_LINE('Total hours worked by employee: ' || l_total_hours);
END;
/
