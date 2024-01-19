CREATE PROCEDURE Inst_time_table @ins_id INT
AS
BEGIN
    SELECT 
        Staff.first_name + ' ' + Staff.last_name AS Instructor_Name,
        Courses.name + ' ' + CONVERT(CHAR(5), Courses.level) AS course_name,
        Classrooms_Courses.day,
        CONVERT(VARCHAR(5), Classrooms_Courses.time, 108) AS time,
        Classrooms.location
    FROM 
        Staff
    JOIN 
        Courses ON Staff.staff_id = Courses.C_id
    JOIN 
        Classrooms_Courses ON Courses.C_id = Classrooms_Courses.C_id
    JOIN 
        Classrooms ON Classrooms_Courses.CLS_id = Classrooms.CLS_id
    WHERE 
        Staff.staff_id = @ins_id;
END
GO

EXEC Inst_time_table @ins_id = 16;

