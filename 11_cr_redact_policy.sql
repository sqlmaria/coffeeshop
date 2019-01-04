BEGIN 
  dbms_redact.add_policy(object_schema => 'coffeeshop', 
                         object_name => 'customers', 
                         column_name => 'c_custid', 
                         policy_name => 'redact_Loyalty_card', 
                         function_type => DBMS_REDACT.FULL, 
                         expression => '1=1'
                         ); 
END;
/
