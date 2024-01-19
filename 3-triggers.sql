--create insert , delete and update trigger for Students

CREATE or ALTER TRIGGER trg_Students_Insert
ON Students
AFTER INSERT
AS
BEGIN
set nocount on;
    INSERT INTO Students_Audit (S_id, first_name, last_name, date_of_birth, email, phone_number, audit_action)
    SELECT S_id, first_name, last_name, date_of_birth, email, phone_number, 'INSERT'
    FROM inserted;
END;

CREATE or ALTER TRIGGER trg_Students_Delete
ON Students
AFTER DELETE
AS
BEGIN
set nocount on;
    INSERT INTO Students_Audit (S_id, first_name, last_name, date_of_birth, email, phone_number, audit_action)
    SELECT S_id, first_name, last_name, date_of_birth, email, phone_number, 'DELETE'
    FROM deleted;
END;

CREATE or ALTER TRIGGER trg_Students_Update
ON Students
AFTER UPDATE
AS
BEGIN
set nocount on;
    INSERT INTO Students_Audit (S_id, first_name, last_name, date_of_birth, email, phone_number, audit_action)
    SELECT S_id, first_name, last_name, date_of_birth, email, phone_number, 'UPDATE'
    FROM inserted;
END;

---------------------------------------------------------------------------------------------------------------------------

--create insert , delete and update trigger for Staff
CREATE or ALTER TRIGGER trg_Staff_Insert
ON Staff
AFTER INSERT
AS
BEGIN
set nocount on;
    INSERT INTO Staff_Audit (Staff_id , first_name , last_name , position , email , phone_number , salary , Audit_action)
    SELECT Staff_id , first_name , last_name , position , email , phone_number , salary , 'INSERT'
    FROM inserted;
END;

CREATE or ALTER TRIGGER trg_Staff_Delete
ON Staff
AFTER DELETE
AS
BEGIN
set nocount on;
    INSERT INTO Staff_Audit (Staff_id , first_name , last_name , position , email , phone_number , salary , Audit_action)
    SELECT Staff_id , first_name , last_name , position , email , phone_number , salary , 'DELETE'
    FROM deleted;
END;

CREATE or ALTER TRIGGER trg_Staff_Update
ON Staff
AFTER UPDATE
AS
BEGIN
set nocount on;
    INSERT INTO Staff_Audit (Staff_id , first_name , last_name , position , email , phone_number , salary , Audit_action)
    SELECT Staff_id , first_name , last_name , position , email , phone_number , salary , 'UPDATE'
    FROM inserted;
END;

----------------------------------------------------------------------------------------------------------------------------

--create insert , delete and update trigger for Courses
CREATE or ALTER TRIGGER trg_Courses_Insert
ON Courses
AFTER INSERT
AS
BEGIN
set nocount on;
    INSERT INTO Courses_Audit (C_id, Name, Level, Price, Start_date, End_date, Capacity, Instructor_id, Audit_action)
    SELECT C_id, Name, Level, Price, Start_date, End_date, Capacity, Instructor_id, 'INSERT'
    FROM inserted;
END;

CREATE or ALTER TRIGGER trg_Courses_Delete
ON Courses
AFTER DELETE
AS
BEGIN
set nocount on;
    INSERT INTO Courses_Audit (C_id, Name, Level, Price, Start_date, End_date, Capacity, Instructor_id, Audit_action)
    SELECT C_id, Name, Level, Price, Start_date, End_date, Capacity, Instructor_id, 'DELETE'
    FROM deleted;
END;

CREATE or ALTER TRIGGER trg_Courses_Update
ON Courses
AFTER UPDATE
AS
BEGIN
set nocount on;
    INSERT INTO Courses_Audit (C_id, Name, Level, Price, Start_date, End_date, Capacity, Instructor_id, Audit_action)
    SELECT C_id, Name, Level, Price, Start_date, End_date, Capacity, Instructor_id, 'UPDATE'
    FROM inserted;
END;

--------------------------------------------------------------------------------------------------------------------------------

--create insert , delete and update trigger for Materials
CREATE or ALTER TRIGGER trg_Materials_Insert
ON Materials
AFTER INSERT
AS
BEGIN
set nocount on;
    INSERT INTO Materials_Audit (M_id, C_id, type , link , audit_action)
    SELECT M_id, C_id,  type , link , 'INSERT'
    FROM inserted;
END;

CREATE or ALTER TRIGGER trg_Materials_Delete
ON Materials
AFTER DELETE
AS
BEGIN
set nocount on;
    INSERT INTO Materials_Audit (M_id, C_id,  type , link , audit_action)
    SELECT M_id, C_id,  type , link , 'DELETE'
    FROM deleted;
END;

CREATE or ALTER TRIGGER trg_Materials_Update
ON Materials
AFTER UPDATE
AS
BEGIN
set nocount on;
    INSERT INTO Materials_Audit (M_id, C_id, type , link , audit_action)
    SELECT M_id, C_id,  type , link , 'UPDATE'
    FROM inserted;
END;

--------------------------------------------------------------------------------------------------

--create insert , delete and update trigger for Payments
CREATE or ALTER TRIGGER trg_Payments_Insert
ON Payments
AFTER INSERT
AS
BEGIN
set nocount on;
    INSERT INTO Payments_Audit (P_id, S_id, C_id, cost , date , audit_action)
    SELECT P_id, S_id, C_id, cost , date , 'INSERT'
    FROM inserted;
END;

CREATE or ALTER TRIGGER trg_Payments_Delete
ON Payments
AFTER DELETE
AS
BEGIN
set nocount on;
    INSERT INTO Payments_Audit (P_id, S_id, C_id, cost , date , audit_action)
    SELECT P_id, S_id, C_id, cost , date , 'DELETE'
    FROM deleted;
END;

CREATE or ALTER TRIGGER trg_Payments_Update
ON Payments
AFTER UPDATE
AS
BEGIN
set nocount on;
    INSERT INTO Payments_Audit (P_id, S_id, C_id, cost , date , audit_action)
    SELECT P_id, S_id, C_id, cost , date , 'UPDATE'
    FROM inserted;
END;

------------------------------------------------------------------------------------------------------------------

--create insert , delete and update trigger for Classrooms
CREATE or ALTER TRIGGER trg_Classrooms_Insert
ON Classrooms
AFTER INSERT
AS
BEGIN
set nocount on;
    INSERT INTO Classrooms_Audit (CLS_id, location , capacity , audit_action)
    SELECT CLS_id, location , capacity , 'INSERT'
    FROM inserted;
END;

CREATE or ALTER TRIGGER trg_Classrooms_Delete
ON Classrooms
AFTER DELETE
AS
BEGIN
set nocount on;
    INSERT INTO Classrooms_Audit (CLS_id, location , capacity , audit_action)
    SELECT CLS_id, location , capacity , 'DELETE'
    FROM deleted;
END;

CREATE or ALTER TRIGGER trg_Classrooms_Update
ON Classrooms
AFTER UPDATE
AS
BEGIN
set nocount on;
    INSERT INTO Classrooms_Audit (CLS_id, location , capacity , audit_action)
    SELECT CLS_id, location , capacity , 'UPDATE'
    FROM inserted;
END;

---------------------------------------------------------------------------------------------------------------------------

--create insert , delete and update trigger for Certifications
CREATE or ALTER TRIGGER trg_Certifications_Insert
ON Certifications
AFTER INSERT
AS
BEGIN
set nocount on;
    INSERT INTO Certifications_Audit (CRTFCT_id, name , grade , date_earned , issuing_organization , S_id, C_id, audit_action)
    SELECT CRTFCT_id, name, grade , date_earned , issuing_organization , S_id, C_id, 'INSERT'
    FROM inserted;
END;

CREATE or ALTER TRIGGER trg_Certifications_Delete
ON Certifications
AFTER DELETE
AS
BEGIN
set nocount on;
    INSERT INTO Certifications_Audit (CRTFCT_id, name , grade , date_earned , issuing_organization , S_id, C_id, audit_action)
    SELECT CRTFCT_id, name , grade , date_earned , issuing_organization , S_id, C_id, 'DELETE'
    FROM deleted;
END;

CREATE or ALTER TRIGGER trg_Certifications_Update
ON Certifications
AFTER UPDATE
AS
BEGIN
set nocount on;
    INSERT INTO Certifications_Audit (CRTFCT_id, name , grade , date_earned , issuing_organization , S_id, C_id, audit_action)
    SELECT CRTFCT_id, name, grade , date_earned , issuing_organization , S_id, C_id, 'UPDATE'
    FROM inserted;
END;

--------------------------------------------------------------------------------------------------------

--create insert , delete and update trigger for SC_enrollment

CREATE OR ALTER TRIGGER trg_SC_enrollment_Insert
ON SC_enrollment
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT * FROM inserted INNER JOIN Courses ON Courses.C_id = inserted.C_id WHERE Courses.capacity >= 1)
    BEGIN
        INSERT INTO SC_enrollment_Audit (S_id, C_id, date , audit_action)
        SELECT S_id, C_id, date , 'INSERT'
        FROM inserted;

        UPDATE Courses
        SET capacity = capacity - 1
        WHERE Courses.C_id IN (SELECT C_id FROM inserted);

        INSERT INTO SC_enrollment (S_id, C_id, date)
        SELECT S_id, C_id, date
        FROM inserted;
    END
    ELSE
    BEGIN
        RAISERROR('No available seats', 16, 1);
    END;
END;

CREATE or ALTER TRIGGER trg_SC_enrollment_Delete
ON SC_enrollment
AFTER DELETE
AS
BEGIN
set nocount on;
    INSERT INTO SC_enrollment_Audit (S_id, C_id, date , audit_action)
    SELECT S_id, C_id, date , 'DELETE'
    FROM deleted;
    UPDATE Courses
    SET capacity = capacity + 1
    WHERE Courses.C_id IN (SELECT C_id FROM inserted);

END;

CREATE or ALTER TRIGGER trg_SC_enrollment_update
ON SC_enrollment
AFTER UPDATE
AS
BEGIN
set nocount on;
    INSERT INTO SC_enrollment_Audit (S_id, C_id, date , audit_action)
    SELECT S_id, C_id, date , 'UPDATE'
    FROM inserted;
END;

------------------------------------------------------------------------------------------------------

--create insert , delete and update trigger for SC_attendance
CREATE or ALTER TRIGGER trg_SC_attendance_Insert
ON SC_attendance
AFTER INSERT
AS
BEGIN
set nocount on;
    INSERT INTO SC_attendance_Audit (S_id, C_id, date , status , audit_action)
    SELECT S_id, C_id, date , status , 'INSERT'
    FROM inserted;
END;

CREATE or ALTER TRIGGER trg_SC_attendance_Delete
ON SC_attendance
AFTER DELETE
AS
BEGIN
set nocount on;
    INSERT INTO SC_attendance_Audit (S_id, C_id, date , status , audit_action)
    SELECT S_id, C_id, date , status , 'DELETE'
    FROM deleted;
END;

CREATE or ALTER TRIGGER trg_SC_attendance_Update
ON SC_attendance
AFTER UPDATE
AS
BEGIN
set nocount on;
    INSERT INTO SC_attendance_Audit (S_id, C_id, date , status , audit_action)
    SELECT S_id, C_id, date , status , 'UPDATE'
    FROM inserted;
END;

-------------------------------------------------------------------------------------------------------------

--create insert , delete and update trigger for Classrooms_Courses
CREATE or ALTER TRIGGER trg_Classrooms_Courses_Insert
ON Classrooms_Courses
AFTER INSERT
AS
BEGIN
set nocount on;
    INSERT INTO Classrooms_Courses_Audit (CLS_id, C_id, day , time , audit_action)
    SELECT CLS_id, C_id, day ,  time , 'INSERT'
    FROM inserted;
END;

CREATE or ALTER TRIGGER trg_Classrooms_Courses_Delete
ON Classrooms_Courses
AFTER DELETE
AS
BEGIN
set nocount on;
    INSERT INTO Classrooms_Courses_Audit (CLS_id, C_id, day , time , audit_action)
    SELECT CLS_id, C_id, day ,  time , 'DELETE'
    FROM deleted;
END;

CREATE or ALTER TRIGGER trg_Classrooms_Courses_Update
ON Classrooms_Courses
AFTER UPDATE
AS
BEGIN
set nocount on;
    INSERT INTO Classrooms_Courses_Audit (CLS_id, C_id, day , time , audit_action)
    SELECT CLS_id, C_id, day ,  time , 'UPDATE'
    FROM inserted
END;