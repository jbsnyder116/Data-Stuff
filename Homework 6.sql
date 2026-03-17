SELECT COUNT(payment_date) AS "Number of Valid Payment Dates"
FROM ap.invoices;

SELECT COUNT(*) AS "Number of Null Payment Dates"
FROM ap.invoices 
WHERE payment_date IS NULL;

SELECT DISTINCT payment_date
FROM ap.invoices    
ORDER BY payment_date;

SELECT terms_id, COUNT(*) AS "Number of Invoices"
FROM ap.invoices
GROUP BY terms_id
ORDER BY terms_id;

SELECT invoice_date, COUNT(invoice_date) AS "Invoices Per Date"
FROM ap.invoices
WHERE invoice_date >= '01-JUN-24' AND invoice_date < '01-JUL-24'
GROUP BY invoice_date
ORDER BY invoice_date;

SELECT invoice_date, COUNT(invoice_date) AS "Invoices Per Date"
FROM ap.invoices
HAVING invoice_date >= '01-JUN-24' AND invoice_date < '01-JUL-24'
GROUP BY invoice_date
ORDER BY invoice_date;

SELECT invoice_total, 
        CASE 
            WHEN invoice_total >= 5000 THEN 'Level 1'
             WHEN invoice_total < 1000 THEN 'Level 3'
             ELSE 'Level 2'
             END AS Vendor_Level
FROM ap.invoices;    

SELECT student_id,
       NTILE(10) OVER (Order BY student_id) AS Tile10
FROM student.enrollment;       

--It looks like each "bucket" is filled equally

SELECT student_id,
       section_id,
       ROW_NUMBER() OVER (
            PARTITION BY section_id
            ORDER BY section_id DESC) AS StudentRank
FROM student.enrollment;            
             
             
