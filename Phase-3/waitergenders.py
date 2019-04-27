import pandas as pd 
import matplotlib.pyplot as plt
import numpy as np
df=pd.read_csv(r"C:\Users\Suhaas\CS\4th Sem\DBMS project\DBMSProject-master\Phase-3\waitersgendercount.csv")
restaurants=df['res_name']
n=len(restaurants)
counts=df['count']
genders=df['gender']
f=[]
m=[]
for i in range(n):
	if genders[i]=='F':
		f.append(counts[i])
	else:
		m.append(counts[i])
n=n/2
index=np.arange(n)
bar_width=0.4
rects1=plt.bar(index,f,bar_width,align='center',color='r',label="Female")
rects2=plt.bar(index+bar_width,m,bar_width,align='center',color='b',label="Male")
plt.xlabel('Restaurants')
plt.ylabel('Count')
plt.title('Number of Waiters by Gender')
plt.xticks(index+0.2,list(set(restaurants)),fontsize=6)
plt.legend()
plt.tight_layout()
plt.show()