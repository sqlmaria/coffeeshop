DROP MATERIALIZED VIEW top_ten_cust_history_mv;

CREATE MATERIALIZED VIEW top_ten_cust_history_mv 
ENABLE query rewrite
AS SELECT c.c_name,
          c.c_custid  loyaltyCardNo,
       o.order_details.location.city city, 
       o.order_details.location.state state,
       SUM(To_number(o.order_details.salesAmount)) total 
FROM   customers c, 
       orders_history o 
WHERE  c.c_custid = o.order_details.loyaltyCardNo  
GROUP  BY c.c_name,
          c.c_custid,
          o.order_details.location.city, 
          o.order_details.location.state;

-- Check the query automatically rewrites to the MV
SELECT c.c_name,
       c.c_custid  loyaltyCardNo,
       o.order_details.location.city city, 
       o.order_details.location.state state,
       SUM(To_number(o.order_details.salesAmount)) total 
FROM   customers c, 
       orders_history o 
WHERE  c.c_custid = o.order_details.loyaltyCardNo  
GROUP  BY c.c_name,
          c.c_custid,
          o.order_details.location.city, 
          o.order_details.location.state
ORDER BY total Desc
FETCH FIRST 10 ROWS ONLY;




