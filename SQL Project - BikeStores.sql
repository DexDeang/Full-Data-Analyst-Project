select ord.order_id,
	concat(cus.first_name, ' ', cus.last_name) as Customers,
	cus.city,
	cus.state,
	ord.order_date,
	sum(ite.quantity) as TotalUnits,
	sum(ite.quantity * ite.list_price) as Revenue,
	pro.product_name,
	cat.category_name,
	sto.store_name,
	concat(sta.first_name, ' ', sta.last_name) as SalesRep,
	bra.brand_name

from sales.orders as ord

join sales.customers as cus
on ord.customer_id = cus.customer_id

join sales.order_items as ite
on ord.order_id = ite.order_id

join production.products as pro
on pro.product_id = ite.product_id

join production.categories as cat
on pro.category_id = cat.category_id

join sales.stores as sto
on ord.store_id = sto.store_id

join sales.staffs as sta
on ord.staff_id = sta.staff_id

join production.brands as bra
on bra.brand_id = pro.brand_id

group by ord.order_id, 
	concat(cus.first_name, ' ', cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	sto.store_name,
	concat(sta.first_name, ' ', sta.last_name),
	bra.brand_name
