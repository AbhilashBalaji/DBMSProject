SELECT DISTINCT name,address FROM restaurant WHERE name='CTR';

SELECT R.name,M.name,M.address FROM Managers as M,Restaurant as R WHERE R.name='Empire' AND R.name=M.res_name;

SELECT I.description,I.price FROM Item as I,Restaurant as R WHERE R.name='Taco Bell' AND R.name=I.res_name;

SELECT C.res_name,C.name,B.bill_no FROM Cashier as C,Bill as B WHERE B.bill_no='5' AND B.bill_no=C.Bill_no;

SELECT name,prepares.order_num FROM chef,prepares WHERE prepares.order_num='6' AND prepares.Id_num=chef.Id_num;

SELECT C.res_name,O.order_num,B.Bill_no,C.name,B.order_details,B.Total_amount FROM resorder as O,customer as C,Bill as B WHERE B.bill_no='4' AND C.cust_id=B.cust_id AND C.order_num=O.order_num;