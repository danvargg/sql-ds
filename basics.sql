-- select -> from -> where -> group by -> having -> order by

pragma table_info(Employees)

select *
from Employees;

--Retrieve the FirstName, LastName, Birthdate, Address, City, and State from the Employees table.

select
FirstName, LastName, Birthdate, Address, City, State
from Employees;

-- Retrieve all the columns from the Tracks table, but only return 20 rows.
select *
from Tracks
limit 20;

-- What is the runtime in milliseconds for the 5th track, entitled "Princess of the Dawn"?
select Milliseconds
from Tracks
where Name = "Princess of the Dawn";

-- more filters
select Name
from tracks
where "GenreId" <> 3;

select Name
, Milliseconds
from tracks
where "GenreId" between 2
and 3;

-- in / or / not operators
select Name
, Milliseconds
from tracks
where "AlbumId" in (2, 4, 5);

select Name
, Milliseconds
from tracks
where "AlbumId" in (2 or 5);

select Name
, Milliseconds
from tracks
where "AlbumId" in (1, 2)
and "GenreId" < 2;

-- wildcards, like operator and order
select Name
, Milliseconds
from Tracks
where Name like "%of%" and Name like "the%"
order by Name, Milliseconds
asc;

-- math
select CustomerId
, total * 100 as Total_x10
from invoices
order by Total_x10
desc;

-- aggregate functions
select count(CustomerId)
as CustomerCount
from customers;

select sum(Total * 10)
as TotalSum
from invoices;

select count(*)
as CustomerCount
from (select distinct CustomerId from customers);

-- grouping
select CustomerId
, sum(Total) as TotalSum
from invoices
group by CustomerId
having TotalSum > 40
desc;