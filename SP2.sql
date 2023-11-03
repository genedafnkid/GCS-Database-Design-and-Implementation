CREATE OR REPLACE PROCEDURE project_cost_by_customer(
    p_customer_id IN NUMBER,
    p_total_cost OUT NUMBER
)
AS
BEGIN
    SELECT SUM(P.PROJ_ACCOST)
    INTO p_total_cost
    FROM PROJECT P
    WHERE P.CUSTOMER_ID = p_customer_id;
END;
/
DECLARE
  l_total_cost NUMBER;
BEGIN
  project_cost_by_customer(p_customer_id => 10001, p_total_cost => l_total_cost);
  DBMS_OUTPUT.PUT_LINE('Total project cost for customer: ' || l_total_cost);
END;
/
