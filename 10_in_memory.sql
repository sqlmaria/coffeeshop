
ALTER TABLE customers INMEMORY;

ALTER TABLE orders_history INMEMORY MEMCOMPRESS FOR CAPACITY HIGH;

SELECT /*+ FULL(c) */ count(*) FROM customers c;
SELECT /*+ FULL(o) */ count(*) FROM orders_history o;

SELECT segment_name, populate_status, bytes_not_populated FROM v$im_segments;

SELECT count(*) from v$IMEU_Header;

SELECT /*+ MONITOR */ c.c_name, c.c_email,
       c.c_custid  loyaltyCardNo,
       o.city, 
       o.state,
       SUM(To_number(o.salesAmount)) total 
FROM   customers c, 
       orders_history o 
WHERE  c.c_custid = o.loyaltyCardNo  
GROUP  BY c.c_name, c.c_email,
          c.c_custid,
          o.city, 
          o.state
ORDER BY total Desc
FETCH FIRST 10 ROWS ONLY;
