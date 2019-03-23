copy restaurant
from '/Users/munna/Desktop/RES.csv' DELIMITER ',' CSV HEADER;

--alter table 'name' alter column 'name' type character varying(11);

copy chef
from '/Users/munna/Desktop/chef.csv' DELIMITER ',' CSV HEADER;

copy managers
from '/Users/munna/Desktop/managers.csv' DELIMITER ',' CSV;

copy inventory
from '/Users/munna/Desktop/inventory.csv' DELIMITER ',' CSV HEADER;

copy resorder
from '/Users/munna/Desktop/order.csv' DELIMITER ',' CSV HEADER;

copy item
from '/Users/munna/Desktop/item.csv' DELIMITER ',' CSV HEADER;

copy contains
from '/Users/munna/Desktop/contains.csv' DELIMITER ',' CSV HEADER;

copy prepares
from '/Users/munna/Desktop/prepares.csv' DELIMITER ',' CSV HEADER;

copy waiter
from '/Users/munna/Desktop/waiter.csv' DELIMITER ',' CSV;

copy takenby
from '/Users/munna/Desktop/TAKEN.csv' DELIMITER ',' CSV HEADER;

copy customer
from '/Users/munna/Desktop/customer.csv' DELIMITER ',' CSV HEADER;

copy bill
from '/Users/munna/Desktop/bill.csv' DELIMITER ',' CSV HEADER;

copy cashier
from '/Users/munna/Desktop/cashier.csv' DELIMITER ',' CSV;