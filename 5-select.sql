SELECT * FROM Staff

SELECT name, [level] ,capacity FROM Courses

SELECT * FROM Staff ORDER BY Salary DESC

SELECT DISTINCT position FROM Staff

SELECT type , link FROM Materials
WHERE C_id IN (7,8,9)

SELECT name , level , price ,start_date , end_date , capacity FROM Courses
WHERE start_date BETWEEN '2024-1-1' AND '2024-7-1'

SELECT * FROM Students
WHERE email LIKE '%@hotmail.com'

SELECT * FROM Certifications
WHERE grade = 'Excellent' OR grade = 'Very Good'

SELECT * FROM Courses
WHERE level = 1 AND price BETWEEN 200 AND 250

SELECT TOP 30 PERCENT * FROM Payments
ORDER BY cost DESC

SELECT  position ,MAX(salary)AS Max_Salary FROM Staff
GROUP BY position 

SELECT  position ,AVG(salary)AS The_Average_Salary FROM Staff
GROUP BY position
HAVING AVG(salary)> 4000

SELECT COUNT(*) AS Num_Of_Payments FROM Payments

SELECT SUM(cost) AS Total_Money FROM Payments

SELECT C.location ,CO.day,CO.time
FROM Classrooms C JOIN Classrooms_Courses CO
ON C.CLS_id = CO.CLS_id 
WHERE day IN ('thursday' , 'tuesday')

select first_name + ' ' + last_name as Student_Name , 
       DATEDIFF(year , date_of_birth , getdate()) as age
from Students order by age;
 
 
select s.S_id ,s.first_name ,count(e.C_id) as 'student`s courses' 
from Students s join SC_enrollment e on s.S_id = e.S_id
group by s.S_id,s.first_name order by 'student`s courses';
 
 
select first_name + ' ' + last_name as Instructor_Name , salary ,
       c.name + ' ' + CONVERT(char(5) ,c.level) as 'course_name' , 
	   abs(DATEDIFF(DAY , c.start_date , c.end_date)) as 'Duration of the course by days'
from Staff s join Courses c on s.staff_id = c.instructor_id;
 
 
select s.first_name + ' ' + s.last_name as Student_Name , 
       crt.name + ' From ' + crt.issuing_organization as Certifications_name, 
	   co.name , co.level
from Students s join Certifications crt on s.S_id = crt.C_id 
                join Courses co on crt.C_id = co.C_id;
 
 
select s.first_name + ' ' + s.last_name as Student_Name , 
       count(*) as No_of_their_courses , sum(cost) as Total_cost 
from Students s join Payments p on s.S_id = p.S_id
group by s.S_id, s.first_name,s.last_name;
 
 
select position , count(*) as 'No of its staff'  from Staff group by position;
 
 
select Students.first_name + ' ' + Students.last_name as Student_Name ,  
       Courses.name + ' ' + CONVERT(char(5) ,Courses.level) as 'course_name', 
	   day , CONVERT(varchar(5), time, 108) as time , location
from Students join SC_enrollment on Students.S_id = SC_enrollment.S_id 
                       join Courses on SC_enrollment.C_id = Courses.C_id
					   join Classrooms_Courses on Courses.C_id = Classrooms_Courses.C_id
					   join Classrooms on Classrooms_Courses.CLS_id = Classrooms.CLS_id;
 
 
select first_name + ' ' + last_name as Instructor_Name ,  
       Courses.name + ' ' + CONVERT(char(5) ,Courses.level) as 'course_name', 
	   day ,CONVERT(varchar(5), time, 108) as time ,location
from Staff join Courses on Staff.staff_id = Courses.C_id
		   join Classrooms_Courses on Courses.C_id = Classrooms_Courses.C_id
		   join Classrooms on Classrooms_Courses.CLS_id = Classrooms.CLS_id;
 
 
select day , count(C_id) from Classrooms_Courses group by day;
 
 
select Courses.name + ' ' + CONVERT(char(5) ,Courses.level) as 'course_name' , type , link 
from Courses join Materials on Courses.C_id = Materials.C_id
where type like '%exam%';
 
 
select * from Staff where salary > (select avg(salary) from Staff);
 
 
select top 5 * from Courses order by price desc;
 
 
select Students.first_name + ' ' + Students.last_name as Student_Name,
       Courses.name + ' ' + CONVERT(char(5) ,Courses.level) as 'course_name', 
	   sum(CONVERT(int ,status)) as 'Attendence count' 
from Students join SC_attendance on Students.S_id = SC_attendance.S_id
              join Courses on SC_attendance.C_id = Courses.C_id
group by Students.S_id , Students.first_name , last_name , Courses.C_id , Courses.name , Courses.level;