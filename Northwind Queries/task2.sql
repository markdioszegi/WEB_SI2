/*
List Suppliers and the number of products they supply. 
Display the CompanyName of the Supplier and the number of products the supplier has. 
Name result columns as Company and NumberOfProducts respectively. 
Order the results so that the Supplier with the most products is displayed first. 
Order Suppliers with identical number of products alphabetically.
*/
select suppliers.company_name as "Company", count(*) as "NumberOfProducts"
from suppliers, products
where suppliers.supplier_id = products.supplier_id
group by suppliers.company_name
order by count(*) desc, suppliers.company_name asc