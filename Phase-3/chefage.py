import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
df=pd.read_csv(r"C:\Users\Suhaas\CS\4th Sem\DBMS project\DBMSProject-master\Phase-3\chefavgage.csv")
restaurants=df['res_name']
avgages=df['avg_age']
plt.bar(restaurants,avgages,align='center')
plt.ylabel('Age')
plt.title("Average ages of Chefs in each Restaurant")
plt.xlabel("Restaurants")
plt.xticks(fontsize=6)
plt.show()