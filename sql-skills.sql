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

-- Extra Credit
-- SQL
-- Artist Table

-- Select 10 artists in reverse alphabetical order.

SELECT *
FROM artist 
ORDER BY name DESC
OFFSET 40
LIMIT 10;

-- Select all artists that start with the word ‘Black’.

SELECT *
FROM artist 
WHERE name LIKE 'Black%';

-- Select all artists that contain the word ‘Black’.

SELECT *
FROM artist 
WHERE name LIKE '%Black%';

-- Employee Table

-- Find the birthdate for the youngest employee.

SELECT MAX(birth_date)
FROM employee;

-- Find the birthdate for the oldest employee.

SELECT MIN(birth_date)
FROM employee;

-- Invoice Table

-- Count how many orders were in CA, TX, or AZ (use IN).

SELECT COUNT(invoice_id)
FROM invoice
WHERE billing_state IN ('TX', 'CA', 'AZ');

-- Get the average total of the orders.

SELECT AVG(total)
FROM invoice;

-- More Join Queries

-- Get all playlist_track track_ids where the playlist name is Music.

SELECT track_id
FROM playlist_track
JOIN playlist
ON playlist_track.playlist_id = playlist.playlist_id
WHERE playlist.name = 'Music'
GROUP BY playlist_track.track_id
ORDER BY playlist_track.track_id;

-- Get all track names for playlist_id 5.

SELECT t.name
FROM track t
JOIN playlist_track pl
ON t.track_id = pl.track_id
WHERE pl.playlist_id = 5
ORDER BY t.name;

-- Get all track names and the playlist name that they’re on ( 2 joins ).

SELECT t.name "Track", p.name "Playlist"
FROM track t
JOIN playlist_track pl
ON t.track_id = pl.track_id
JOIN playlist p
ON pl.playlist_id = p.playlist_id
ORDER BY p.name;

-- Get all track names and album titles that are the genre Alternative & Punk ( 2 joins ).

SELECT t.name "Track", al.title "Album"
FROM track t
JOIN album al
ON t.album_id = al.album_id
JOIN genre g
ON t.genre_id = g.genre_id
WHERE g.name = 'Alternative & Punk'
ORDER BY al.title;