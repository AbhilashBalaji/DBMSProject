select sum(salary) as female_total_salary
from managers
where gender='F' and res_name='Burger King';


select res_name,count(*),avg(salary)
from managers
group by res_name;


select bill_no,res_name,total_amount,order_details
from bill
where total_amount>240 and order_details like '%Chicken%';


create view bills_with_chicken 
as select *
from bill
where order_details like '%Chicken%';

create view bills_with_mutton 
as select *
from bill
where order_details like '%Mutton%';

create view non_veg
as 
select * from bills_with_chicken
union 
select * from bills_with_mutton;

create view veg
as
select * from bill 
except 
select * from non_veg;


select res_name,sum(total_amount)
from bill
group by res_name
order by sum;

\Copy (select res_name,sum(total_amount) from bill group by res_name order by sum) To 'C:\Users\Suhaas\CS\4th Sem\DBMS project\DBMSProject-master\Phase-3\billtotals.csv' With CSV HEADER DELIMITER ',';

select res_name,gender,count(gender)
from managers
group by res_name,gender
order by res_name,gender asc;

\Copy (select res_name,gender,count(gender) from managers group by res_name,gender order by res_name,gender asc) To 'C:\Users\Suhaas\CS\4th Sem\DBMS project\DBMSProject-master\Phase-3\managersgendercount.csv' With CSV HEADER DELIMITER ',';


select res_name,gender,count(gender)
from waiter
group by res_name,gender
order by res_name,gender asc;

\Copy (select res_name,gender,count(gender) from waiter group by res_name,gender order by res_name,gender asc) To 'C:\Users\Suhaas\CS\4th Sem\DBMS project\DBMSProject-master\Phase-3\waitersgendercount.csv' With CSV HEADER DELIMITER ',';


select res_name,avg(age) as avg_age
from chef 
group by res_name
order by avg_age asc;

\Copy (select res_name,avg(age) as avg_age from chef group by res_name order by avg_age asc) To 'C:\Users\Suhaas\CS\4th Sem\DBMS project\DBMSProject-master\Phase-3\chefavgage.csv' With CSV HEADER DELIMITER ',';
