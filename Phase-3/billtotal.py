import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
df=pd.read_csv(r"C:\Users\Suhaas\CS\4th Sem\DBMS project\DBMSProject-master\Phase-3\billtotals.csv")
restaurants=df['res_name']
billtotals=df['sum']
plt.bar(restaurants,billtotals,align='center')
plt.ylabel('Bill Total')
plt.title("Total Sales")
plt.xlabel("Restaurants")
plt.xticks(fontsize=6)
plt.show()