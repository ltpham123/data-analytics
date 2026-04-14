/*
a) Included in the actor table are the columns containing individual actor ids, their first and last name, and last time it was updated.
b) In the film table, it describes the film id, film metadata (name, description, year, etc.), rental duration and rate, rating, and its last updated status.
c) film_actor is the only table that contains columns for both actor_id and film_id.
d) When opening the rental table through Select Rows, it opens the information in the rental table, but it is hard to read because the data is all organized by id, no names, making it hard for me to decipher which data belongs to who (and others who look into this data too).
e) The inventory table is much easier to read but still not as easy to interpret as it is sorted by inventory_id and film_id, but it is still read as numbers: easy for computers and machines, but harder for us unless we put meaning to it.
f) To understand the names of all films that were rented on a specific date, you would use the rental table to find the transaction history for all rentals done, which will use the inventory table to keep track of supply, which also works with the film table that has the film names and their associated ids and related data.
*/

SELECT * FROM rental; -- Access rental log, including date rented
SELECT * FROM inventory; -- Access rental inventory
SELECT * FROM film; -- Access film information, including name and corresponding id