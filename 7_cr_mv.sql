
DROP MATERIALIZED VIEW top_ten_cust_mv;

CREATE MATERIALIZED VIEW top_ten_cust_mv 
ENABLE query rewrite 
AS SELECT c.c_name, 
       o.order_details.location.city, 
       SUM(To_number(o.order_details.salesAmount)) total 
FROM   customers c, 
       orders o 
WHERE  c.c_custid = o.order_details.loyaltyCardNo  
GROUP  BY c.c_name, 
          o.order_details.location.city;

-- Check the query automatically rewrites to the MV

SELECT c.c_name, 
       o.order_details.location.city, 
       SUM(To_number(o.order_details.salesAmount)) total 
FROM   customers c, 
       orders o 
WHERE  c.c_custid = o.order_details.loyaltyCardNo  
GROUP  BY c.c_name, 
          o.order_details.location.city
ORDER BY total Desc
FETCH FIRST 10 ROWS ONLY;

SELECT * FROM top_ten_customers;
