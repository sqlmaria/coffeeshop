DROP TABLE orders;


CREATE TABLE orders 
	(order_details BLOB 
         constraint is_json check(order_details is JSON)
	);
    

    
    
    
