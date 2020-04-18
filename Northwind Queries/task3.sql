/*
List Suppliers and the number of products they supply (similarly to Task 2), but only those who supply 5 different products.
Display the CompanyName of the Suppliers. 
Order the results alphabetically.
*/
select suppliers.company_name as "Company", count(*) as NumberOfProducts
from suppliers
join products on (suppliers.supplier_id = products.supplier_id)
group by suppliers.company_name
having count(*) = 5
order by count(*) desc, suppliers.company_name asc;
