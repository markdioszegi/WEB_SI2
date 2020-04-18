/*
List all Customers and their orders (if any). 
Display the CompanyName of Customers and all of their orders as a comma separated list (e.g "CompanyA | 1234, 2345, 4567"). 
Order the results alphabetically by CompanyName.
*/

select distinct customers.company_name as "CompanyName", ( select 
	string_agg (orders.order_id::varchar, ', ')
	from orders
	where customers.customer_id = orders.customer_id
) as "JoinedLofasz"
from customers, orders
where customers.customer_id = orders.customer_id
order by customers.company_name asc