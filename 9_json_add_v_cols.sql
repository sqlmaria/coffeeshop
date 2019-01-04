ALTER TABLE ORDERS_HISTORY ADD city as
(JSON_VALUE(order_details, '$.location.city'));

ALTER TABLE ORDERS_HISTORY ADD state as 
(JSON_VALUE(order_details, '$.location.state'));

ALTER TABLE ORDERS_HISTORY ADD salesamount as 
(JSON_VALUE(order_details, '$.salesAmount'));

ALTER TABLE ORDERS_HISTORY ADD loyaltycardno as 
(JSON_VALUE(order_details, '$.loyaltyCardNo'));


desc orders_history;


SELECT /*+ MONITOR */ c.c_name,
       c.c_custid  loyaltyCardNo,
       o.city, 
       o.state,
       SUM(salesamount) total 
FROM   customers c, 
       orders_history o 
WHERE  c.c_custid = o.loyaltycardno  
GROUP  BY c.c_name,
          c.c_custid,
          o.city, 
          o.state
ORDER BY total Desc
FETCH FIRST 10 ROWS ONLY;
