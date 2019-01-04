
CREATE OR replace VIEW top_ten_customers AS 
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
