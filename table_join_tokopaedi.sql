-- 1. Seller
select o.invoice, s.sellername 
from orders o 
join seller s on o.seller_id = s.id;

-- 2. User
select o.invoice, u.username, o.created_at, u.phonenumber, u.address
from orders o 
join users u on o.user_id = u.id;

-- 3. Product
select o.invoice, p.productname, oi.quantity, p.price 
from order_items oi 
join orders o on oi.order_id = o.order_id
join products p on oi.product_id = p.id;

-- 4. Orders
select 
	o.invoice, p.price, (sa.defshippingfee * p.weight) as shipping_fee, o.deliveryinsurancefee, oi.quantity,
	((p.price + (sa.defshippingfee * p.weight) + o.deliveryinsurancefee) * oi.quantity) as total_shop,
	pm.servicefee, o.applicationfee,
	((p.price + (sa.defshippingfee * p.weight) + o.deliveryinsurancefee) * oi.quantity + (pm.servicefee + o.applicationfee) ) as total_pay,
	o.created_at 
from order_items oi
join orders o on oi.order_id = o.order_id 
join products p on oi.product_id = p.id 
join shipping_agent sa on o.shipping_agent_id = sa.idshipping
join payment_method pm on o.payment_method_id = pm.idpayment;

-- 5. Promos
select o.invoice, p.promoname, p.promodiscount
from promo_list pl 
join promos p on pl.promoid = p.promoid 
join orders o on pl.orderid = o.order_id;

-- 6. Kurir
-- just total shipping per-item
select o.invoice, sa.shippingname, ((sa.defshippingfee * p.weight )) as total_shipping
from order_items oi 
join orders o ON oi.order_id = o.order_id 
join products p ON oi.product_id = p.id 
join shipping_agent sa on o.shipping_agent_id = sa.idshipping
group by o.invoice, sa.shippingname , sa.defshippingfee , p.weight  ;

-- with total shipping for all items using sub-query
WITH ShippingTotals AS (
    SELECT
        o.order_id,
        SUM(sa.defshippingfee * p.weight) AS total_shipping_all_items
    FROM
        order_items oi
    JOIN 
        orders o ON oi.order_id = o.order_id
    JOIN 
        products p ON oi.product_id = p.id 
    JOIN 
        shipping_agent sa ON o.shipping_agent_id = sa.idshipping
    GROUP BY
        o.order_id
)
SELECT 
    o.invoice, 
    sa.shippingname, 
    (sa.defshippingfee * p.weight) AS total_shipping, 
    st.total_shipping_all_items
FROM 
    order_items oi 
JOIN 
    orders o ON oi.order_id = o.order_id 
JOIN 
    products p ON oi.product_id = p.id 
JOIN 
    shipping_agent sa ON o.shipping_agent_id = sa.idshipping
JOIN 
    ShippingTotals st ON o.order_id = st.order_id
GROUP BY 
    o.invoice, 
    sa.shippingname, 
    sa.defshippingfee, 
    p.weight, 
    st.total_shipping_all_items;
   
-- 7. Payment Method
select o.invoice, pm.payment, pm.servicefee 
from payment_list pl 
join orders o on pl.orderid = o.order_id
join payment_method pm on pl.idpayment = pm.idpayment;
