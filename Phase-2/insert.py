import psycopg2
import sys

try:
    conn = psycopg2.connect("dbname='rms' user='postgres' host='localhost' password='root'")
    print('connected')
    cur = conn.cursor()
    #cur.executemany("""INSERT INTO bar(first_name,last_name) VALUES (%(first_name)s, %(last_name)s)""", namedict)
    
except:
    print ("I am unable to connect to the database")
    sys.exit('')