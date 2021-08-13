-- Artist Table
-- Add 3 new artists to the artist table using INSERT. (It’s already created.)

INSERT INTO artist(name)
VALUES
	('Coldplay'),
    ('Taylor Swift'),
    ('Eminem');

-- Select 5 artists in alphabetical order.

 SELECT *
 FROM artist
 ORDER BY name
 LIMIT 5;

-- Employee Table
-- List all employee first and last names only that live in Calgary.

SELECT first_name, last_name
FROM employee
WHERE city = 'Calgary';

-- Find everyone that reports to Nancy Edwards (Use the ReportsTo column). You will need to query the employee table to find the Id for Nancy Edwards

SELECT first_name || ' ' || last_name "Nancy Edwards's Underlings"
FROM employee
WHERE reports_to IN (
  SELECT employee_id FROM employee WHERE first_name = 'Nancy' AND last_name = 'Edwards'
  );

-- Count how many people live in Lethbridge.

SELECT COUNT(employee_id)
FROM employee
WHERE city = 'Lethbridge';

-- Invoice Table
-- Count how many orders were made from the USA.

SELECT COUNT(invoice_id)
FROM invoice
WHERE billing_country = 'USA';

-- Find the largest order total amount.

SELECT MAX(total)
FROM invoice;

-- Find the smallest order total amount.

SELECT MIN(total)
FROM invoice;

-- Find all orders bigger than $5.

SELECT invoice_id, invoice_date
FROM invoice
WHERE total > 5;

-- Count how many orders were smaller than $5.

SELECT COUNT(invoice_id)
FROM invoice
WHERE total < 5;

-- Get the total sum of the orders.

SELECT SUM(total)
FROM invoice;

-- JOIN Queries (Various tables)
-- Get all invoices where the unit_price on the invoice_line is greater than $0.99.

SELECT inv.invoice_id, inv.invoice_date
FROM invoice inv
JOIN invoice_line invl
ON inv.invoice_id = invl.invoice_id
WHERE invl.unit_price = 0.99
GROUP BY inv.invoice_id, inv.invoice_date
ORDER BY inv.invoice_id;

-- Get the invoice_date, customer first_name and last_name, and total from all invoices.

SELECT inv.invoice_date, c.first_name, c.last_name, inv.total
FROM invoice inv
JOIN customer c
ON inv.customer_id = c.customer_id;

-- Get the customer first_name and last_name and the support rep’s first_name and last_name from all customers. Note that support reps are on the employee table.

SELECT c.first_name || ' ' || c.last_name "Customer", sup.first_name || ' ' || sup.last_name "Support Rep"
FROM customer c
JOIN employee sup
ON c.support_rep_id = sup.employee_id
ORDER BY "Support Rep";

-- Get the album title and the artist name from all albums.

SELECT al.title "Album", art.name "Artist"
FROM album al
JOIN artist art
ON al.artist_id = art.artist_id
ORDER BY "Artist";