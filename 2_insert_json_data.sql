    
INSERT INTO ORDERS (order_details) VALUES (utl_raw.cast_to_raw('{
 "date": "2016-05-03 10:40:36",
"loyaltyCardNo": 1230,
  "location": {
     "city": "Dallas",
     "state": "TX"
  },
  "salesAmount": 7.55,
  "order": [  {
    "item": "Espresso",
    "size": "small",
    "sales_amount": 2.10,
    "coffee_used_gram": 10
  },  {
    "item": "Espresso",
    "size": "large",
    "salesAmount": 2.50,
    "coffeeUsedGram": 25
  },  {
    "item": "Americano",
    "size": "medium",
    "salesAmount": 2.95,
    "coffeeUsedGram": 15
  }]
}'));

COMMIT; 

DESC orders

SELECT count(*) FROM orders;



SELECT o.order_details.location.city 
FROM   orders o; 



