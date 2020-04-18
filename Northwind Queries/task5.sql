/*
List Suppliers and their single most expensive Product. 
Display the CompanyName of the Supplier and the ProductName and UnitPrice of the Product. 
Name result columns as Company, Product and Price respectively. 
Order the results so the most expensive Product is on top. 
Order the results of the same price by ProductName, then by CompanyName alphabetically.
*/
select suppliers.company_name as "Company", products.product_name as "Product"--, x.unit_price as "Price"
from suppliers
join (
	select max (products.unit_price) as unit_price, products.supplier_id
	from products
	group by products.supplier_id
)
as x on x.supplier_id = suppliers.supplier_id
join products on x.supplier_id = products.supplier_id
where x.unit_price = products.unit_price
order by x.unit_price desc, suppliers.company_name asc, products.product_name asc