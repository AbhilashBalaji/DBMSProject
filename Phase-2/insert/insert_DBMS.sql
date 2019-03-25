copy restaurant
from 'RES.csv' DELIMITER ',' CSV HEADER;

--alter table 'name' alter column 'name' type character varying(11);

copy chef
from 'chef.csv' DELIMITER ',' CSV HEADER;

copy managers
from 'managers.csv' DELIMITER ',' CSV;

copy inventory
from 'inventory.csv' DELIMITER ',' CSV HEADER;

copy resorder
from 'order.csv' DELIMITER ',' CSV HEADER;

copy item
from 'item.csv' DELIMITER ',' CSV HEADER;