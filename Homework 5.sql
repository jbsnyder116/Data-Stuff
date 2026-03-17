SELECT course_no, 
       cost, 
       SUBSTR(description, 1, 6) AS Description
FROM student.course;

SELECT course_no, 
       COALESCE(cost, 1000) AS COST, 
       SUBSTR(description, 1, 6) AS Description
FROM student.course;

SELECT course_no,
       cost,
       REPLACE(description, 'Java', 'Python') AS description
FROM student.course;

SELECT
    LOWER(description) AS LowerCasedescription,
    UPPER(description) AS UpperCasedescription,
    INITCAP(description) AS MixedCasedescription
FROM student.course;

SELECT student_id
FROM student.student
WHERE MOD(student_id, 13) =0;

SELECT street_address,
        RTRIM(street_address) "Trimmed Address"
FROM student.student
WHERE ROWNUM <= 10;

SELECT MIN(invoice_total) "Lowest Invoice Total",
       MAX(invoice_total) "Hishest Invoice Total"
FROM ap.invoices;

SELECT invoice_date
FROM ap.invoices
WHERE invoice_date = '01-MAY-24';

SELECT TO_CHAR(invoice_total, '$99,999.99') "Formatted"
FROM ap.invoices
WHERE ROWNUM <= 10;

SELECT COUNT(*) "Number of Invoices"
FROM ap.invoices;

SELECT TO_CHAR(SUM(invoice_total), '$999,999.99') AS "Total Amount",
       TO_CHAR(AVG(invoice_total), '$99,999.99') AS "Average Amount"
FROM ap.invoices;

SELECT SQRT(4),
       SQRT(0)
FROM dual;

SELECT course_no, 
      TO_CHAR(course_fee * num_enrolled, '$99,999') AS Revenue,
       num_enrolled 
FROM student.course_revenue
ORDER BY Revenue DESC;

SELECT course_no AS "Course #",
       description AS "Course Description",
       CASE 
        WHEN course_no BETWEEN 1 AND 99 THEN 'Prepartory'
        WHEN course_no BETWEEN 100 AND 199 THEN 'Freshmen'
        WHEN course_no BETWEEN 200 AND 299 THEN 'Sophmore'
        WHEN course_no BETWEEN 300 AND 399 THEN 'Junior'
        WHEN course_no BETWEEN 400 AND 499 THEN 'Senior'
        ELSE 'Other'
       END AS "YEAR"
FROM student.course
ORDER BY course_no;
