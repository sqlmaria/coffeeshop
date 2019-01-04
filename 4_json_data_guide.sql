set long 9999
set longchunks 9999
set pages 9999
column data_guide format a70

SELECT JSON_DATAGUIDE(o.order_details) data_guide FROM orders o;
