/*Write one SQL to display Course No, Section No, Description, Location, Instructor Id and
instructor name from Course, instructor and Section tables.*/
SELECT
    c.course_no,
    s.section_no,
    c.description,
    s.location,
    s.instructor_id,
    i.last_name AS "Instructor Name"
FROM student.course c, student.section s, student.instructor i 
WHERE c.course_no = s.course_no AND s.instructor_id = i.instructor_id;

//2. Modify above SQL to display only those records whose Course Description starts with ‘Intro’.
SELECT
    c.course_no,
    s.section_no,
    c.description,
    s.location,
    s.instructor_id,
    i.last_name AS "Instructor Name"
FROM student.course c, student.section s, student.instructor i 
WHERE c.course_no = s.course_no 
    AND s.instructor_id = i.instructor_id
    AND c.description LIKE 'Intro%';
    
 /*3. Write one SQL to display Course No, Section No, Description by doing LEFT OUTER JOIN of
Course and Section tables. */  
SELECT c.course_no,
       s.section_no,
       c.description
FROM student.course c
LEFT OUTER JOIN student.section s
            ON c.course_no = s.course_no;
            
/*4. Write one SQL to display Course No, Section No, Description, Revenue by doing RIGHT
OUTER JOIN of Course, Section and Course Revenue tables.*/

SELECT c.course_no,
       s.section_no,
       c.description,
       cr.revenue
FROM student.course c, student.section s, student.course_revenue cr
WHERE c.course_no (+) = s.course_no 
    AND c.course_no = cr.course_no;
    
 /*5. Write one SQL to display Course No, Section No, Description, Revenue by doing RIGHT
OUTER JOIN of Course and Section tables and INNER JOIN of Course and Course Revenue tables.*/   
SELECT c.course_no,
       s.section_no,
       c.description,
       cr.revenue
FROM student.course c
RIGHT OUTER JOIN student.section s 
            ON c.course_no = s.course_no
JOIN student.course_revenue cr
    ON c.course_no = cr.course_no;
    
/*6. Write SQL to display Course description and Revenue, only show revenues that are at least
$8,000 and divisible by 5, use Course and Course Revenue tables.*/
SELECT c.description,
       cr.revenue
FROM student.course c, student.course_revenue cr
WHERE c.course_no = cr.course_no 
    AND cr.revenue >= 8000 
    AND MOD (cr.revenue, 5) = 0;
    
//Write SQL to display Course No, Description and Cost from Course table for the cheapest course, use SubQuery for your answer. 
SELECT course_no,
        description,
        cost
FROM student.course
WHERE cost =(SELECT MIN(cost) FROM student.course);

//Write SQL to display Course No, Description and Cost from Course table to display courses with prerequisite of 20, use SubQuery for your answer. 
SELECT course_no,
       description,
       cost
FROM student.course
WHERE course_no IN (SELECT DISTINCT course_No FROM student.course
        WHERE prerequisite = 20);
        
//9.  Write SQL to display Course No, Description and Cost from Course table to display courses with cost greater than any of the values 995, 1050, 1595, use SubQuery for your answer.         
SELECT course_no,
       description,
       cost
FROM student.course
WHERE cost > ALL (SELECT cost FROM student.course
                    WHERE cost < 1595
                    AND cost < 1050);
// Write SQL to display Course No, Description and Cost from Course table to display courses with cost less than all of the values 2995, 3050, 4595, use SubQuery for your answer.        
SELECT course_no, 
       description, 
       cost
FROM student.course
WHERE cost < ALL (
    SELECT 2995 FROM student.course
    UNION
    SELECT 3050 FROM student.course
    UNION
    SELECT 4595 FROM student.course);

  
    
