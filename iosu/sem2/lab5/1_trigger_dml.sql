-- 1. Trigger DML: For PRODUCTION table trigger that will log changes in the table.


-- Create table LOG1 for logging changes in tables

CREATE TABLE LOG1 (
    TABLE_NAME VARCHAR2(30),
    USERNAME VARCHAR2(30),
    OPERATION_TYPE VARCHAR2(10), -- INSERT, UPDATE, DELETE
    OPERATION_DATE TIMESTAMP,
    OLD_VALUE VARCHAR2(200),  -- Only for UPDATE and DELETE
    NEW_VALUE VARCHAR2(200),
    RECORD_ID NUMBER
);


-- Create trigger TRG_PRODUCTION_CHANGES for logging changes in table PRODUCTION

CREATE OR REPLACE TRIGGER TRG_PRODUCTION_CHANGES_END_DATE
AFTER INSERT OR UPDATE OR DELETE
ON PRODUCTION
FOR EACH ROW
DECLARE
    v_username VARCHAR2(30);
BEGIN
    SELECT USER INTO v_username FROM DUAL;

    IF INSERTING THEN
        INSERT INTO LOG1 (
            TABLE_NAME, USERNAME, OPERATION_TYPE, OPERATION_DATE, OLD_VALUE, NEW_VALUE, RECORD_ID
        ) VALUES (
            'PRODUCTION', v_username, 'INSERT', SYSTIMESTAMP, NULL, TO_CHAR(:NEW.END_DATE), NULL
        );

    ELSIF UPDATING THEN
        INSERT INTO LOG1 (
            TABLE_NAME, USERNAME, OPERATION_TYPE, OPERATION_DATE, OLD_VALUE, NEW_VALUE, RECORD_ID
        ) VALUES (
            'PRODUCTION', v_username, 'UPDATE', SYSTIMESTAMP, TO_CHAR(:OLD.END_DATE), TO_CHAR(:NEW.END_DATE), NULL
        );

    ELSIF DELETING THEN
        INSERT INTO LOG1 (
            TABLE_NAME, USERNAME, OPERATION_TYPE, OPERATION_DATE, OLD_VALUE, NEW_VALUE, RECORD_ID
        ) VALUES (
            'PRODUCTION', v_username, 'DELETE', SYSTIMESTAMP, TO_CHAR(:OLD.END_DATE), NULL, NULL
        );
    END IF;
END;
/


-- Test the trigger
INSERT INTO PRODUCTION (TECHNOLOGICAL_MAP_ID, START_DATE, END_DATE, NUMBER_OF_REQUIRED_PRODUCTS, NUMBER_OF_DEFECTS) VALUES (20, TO_DATE('2024-05-10', 'YYYY-MM-DD'), TO_DATE('2024-05-15', 'YYYY-MM-DD'), 950, 95);
UPDATE PRODUCTION SET END_DATE = TO_DATE('2024-06-21', 'YYYY-MM-DD') WHERE TECHNOLOGICAL_MAP_ID = 20;
DELETE FROM PRODUCTION WHERE TECHNOLOGICAL_MAP_ID = 20;
