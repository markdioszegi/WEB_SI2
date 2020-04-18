/*
1. Task: Lists Products and their Suppliers. 
Display the ProductName and the CompanyName of the Supplier. 
Name result columns as Product and Company respectively. 
Order the results alphabetically by ProductName and by CompanyName.
*/
select products.product_name as "ProductName", suppliers.company_name as "CompanyName"
from suppliers, products
where suppliers.supplier_id = products.supplier_id
order by products.product_name, suppliers.company_name asc

--with join
select products.product_name as "ProductName", suppliers.company_name as "CompanyName"
from suppliers
join products on (suppliers.supplier_id = products.supplier_id)
order by products.product_name, suppliers.company_name asc