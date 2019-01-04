alter user coffeeshop default tablespace USERS;

alter user coffeeshop quota unlimited on USERS;

grant create any view to coffeeshop;

grant create any materialized view to coffeeshop;

grant select_catalog_role to coffeeshop;

grant execute_catalog_role to coffeeshop;

grant select on v_$im_segments to coffeeshop;
grant select on v_$IMEU_Header to coffeeshop;

