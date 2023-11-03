CREATE OR REPLACE TRIGGER prevent_customer_delete
BEFORE DELETE ON CUSTOMER
FOR EACH ROW
DECLARE
  project_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO project_count FROM PROJECT WHERE CUSTOMER_ID = :OLD.CUSTOMER_ID;
  IF project_count > 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Cannot delete customer. There are ' || project_count || ' associated projects.');
  END IF;
END;
/
