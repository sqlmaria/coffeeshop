ALTER TABLE customers NO INMEMORY;

ALTER TABLE orders_history NO INMEMORY;

BEGIN 
  dbms_redact.drop_policy(object_schema => 'coffeeshop', 
                         object_name => 'customers', 
                         policy_name => 'redact_Loyalty_card');
END;
/

DROP MATERIALIZED VIEW top_ten_cust_mv;

DROP MATERIALIZED VIEW top_ten_cust_history_mv;

drop table orders purge;

ALTER TABLE ORDERS_HISTORY drop (city);
ALTER TABLE ORDERS_HISTORY drop (state);
ALTER TABLE ORDERS_HISTORY drop (salesamount);
ALTER TABLE ORDERS_HISTORY drop (loyaltycardno);

desc ORDERS_HISTORY