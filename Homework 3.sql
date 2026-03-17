SELECT vendor_name, vendor_city
FROM ap.vendors
WHERE vendor_city BETWEEN 'B' AND 'D';

SELECT invoice_id AS ID, invoice_number AS Invoice#
FROM ap.invoices
WHERE invoice_number LIKE '%9-4%';

SELECT DISTINCT vendor_state AS State, vendor_zip_code as ZIP 
FROM ap.vendors;

SELECT invoice_number, invoice_date, invoice_total
FROM ap.invoices
WHERE invoice_total > 50000;
//Zero Rows returned.
//In the table there are no rows over 50000

/* SELECT *
FROM ap.invoices; */

SELECT course_no, description 
FROM student.course
WHERE course_no IN (10, 100, 130);

SELECT course_no, description, cost
FROM student.course
WHERE (Prerequisite = 20 OR Prerequisite = 204)
       AND Cost != 1195;
       



