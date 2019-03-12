import psycopg2
import sys
from itertools import permutations,product
from random import sample,choice
import  string
import random

def gen_desc(a,n):
    out=[]
    for _ in range(n):
        random = ''.join([random.choice(string.ascii_letters + string.digits) for n in xrange(a)])
        out.append(random)
    return out    

def gen_id(n):
    out=[]
    out=sample(range(100000),n)
    return out

def gen_bin(l,n):
    lst = [list(i) for i in product(l, repeat=n)]
    return sample(lst,1)
#param number
def gen_names(n):
    out = []
    fname = ['John',
             'William',
             'James',
             'Thomas',
             'George',
             'Joseph',
             'Samuel',
             'Henry',
             'David',
             'Daniel', 'Alice', 'Hannah', 'Priya', 'Jody', 'Jane']
    lname = ['Smith', 'Williams', 'Doe', 'Khalifa', 'Johnson']
    out = [list(zip(fname, p)) for p in permutations(lname)][:n]
    out = [i[0]+" "+i[1] for i in out[0]]
    return sample(out, n)

def gen_addr(n):
    addrs=['AGOURA HILLS','ALHAMBRA','ARCADIA','AZUSA','BALDWIN PARK','BELL GARDENS','BEVERLY HILLS','BURBANK','CANOGA PARK','CANYON COUNTRY']
    out=sample(addrs,n)
    return out
try:
    conn = psycopg2.connect(
        "dbname='rms' user='postgres' host='localhost' password='root'")
    print('connected')
    cur = conn.cursor()
    CHEF = {}
    CHEF['ID_number'] = gen_id(10)
    CHEF['Name'] = gen_names(10)
    CHEF['Contact_number'] = sample(range(80000000000,9999999999),10)
    CHEF['Age'] = sample(range(22,40),10)
    CHEF['Gender'] = gen_bin(['M','F'],10)
    CHEF['Address'] = gen_addr(10)
    CHEF['Salary'] = sample(range(1000,10000),10)
    CHEF['Num_days_off'] = sample(range(0,10),10)
    CHEF['Working_time'] = sample(range(6,18),10)

    MANAGERS = {}
    MANAGERS['ID_number'] = gen_id(3)
    MANAGERS['Name'] = gen_names(3)
    MANAGERS['Contact_number'] = sample(range(80000000000,9999999999),3)
    MANAGERS['Age'] = sample(range(22,40),3)
    MANAGERS['Gender'] = gen_bin(['M','F'],3)
    MANAGERS['Address'] = gen_addr(3)
    MANAGERS['Salary'] = sample(range(1000,10000),3)
    MANAGERS['Num_days_off'] = sample(range(0,10),3)
    MANAGERS['Working_time'] = sample(range(6,18),3)
    MANAGERS['Chef_ID_number']=sample(CHEF['ID_number'],3)
    
    INVENTORY ={}
    INVENTORY['Item_code']=sample(range(100),5)
    INVENTORY['ITEM']=sample(['Tomatoes','Onions','Garlic','Potatoes','Tuna','Coriander','Vegetable Oil'],5)
    INVENTORY['Quantity']=sample(range(1,50),5)
    INVENTORY['ID_number']=sample(CHEF['ID_number'],3)

    RESORDER={}
    RESORDER['Order_num']=sample(range(100),5)
    RESORDER['No_of_items']=sample(range(1,10),5)
    
    ITEM={}
    ITEM['Item_Number']=gen_id(5)
    ITEM['Description']=gen_desc(40,5)
    ITEM['QUANTITY']=sample(range(1,50),5)
    ITEM['PRICE']=sample(range(1,100000),5)

    #cur.executemany("""INSERT INTO bar(first_name,last_name) VALUES (%(first_name)s, %(last_name)s)""", namedict)

except:
    print("I am unable to connect to the database")
    sys.exit('')
