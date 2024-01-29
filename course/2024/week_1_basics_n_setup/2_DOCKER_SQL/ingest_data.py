#!/usr/bin/env python
# coding: utf-8

# In[1]:

import argparse
import pandas as pd
from sqlalchemy import create_engine
from time import time
import os


#username 
#password
#hostname 
#port
#database name 
#table name 
#url of the csv




def main(params):

    username = params.username
    password = params.password
    hostname = params.hostname
    port = params.port
    databasename = params.databasename
    tablename = params.tablename
    data_url = params.data_url
    color = params.color
    file_type = params.file_type
    
    engine = create_engine(f'postgresql://{username}:{password}@{hostname}:{port}/{databasename}')

    

    if file_type == "taxi":
        output_file_name = "output.parquet"
        #gets data from url and writes it to the location
        os.system(f"wget {data_url} -O {output_file_name}")

        df = pd.read_parquet(output_file_name)
            # df = next(df_iter)
        if color == "yellow":
            df.tpep_pickup_datetime = pd.to_datetime(df.tpep_pickup_datetime)
            df.tpep_dropoff_datetime = pd.to_datetime(df.tpep_dropoff_datetime)
        else:
            df.lpep_pickup_datetime = pd.to_datetime(df.lpep_pickup_datetime)
            df.lpep_dropoff_datetime = pd.to_datetime(df.lpep_dropoff_datetime)
    
    else:
        #do nothing
        output_file_name = "output.csv"
        os.system(f"wget {data_url} -O {output_file_name}")
        df = pd.read_csv(output_file_name)
        print("zones data")
    
    df.to_sql(name = tablename , con=engine, if_exists='replace')
    print("done")



    # while True: 
    #     t_start = time()

    #     df = next(df_iter)

    #     df.tpep_pickup_datetime = pd.to_datetime(df.tpep_pickup_datetime)
    #     df.tpep_dropoff_datetime = pd.to_datetime(df.tpep_dropoff_datetime)
        
    #     df.to_sql(name=tablename, con=engine, if_exists='append')

    #     t_end = time()

    #     print('inserted another chunk, took %.3f second' % (t_end - t_start))

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Ingest parquet data to postgress')
    parser.add_argument('--username',help='username for postgress')
    parser.add_argument('--password',help='password for postgress')
    parser.add_argument('--hostname',help='hostname for postgress')
    parser.add_argument('--port',help='port')
    parser.add_argument('--databasename',help='database name for postgress')
    parser.add_argument('--tablename',help='table name for postgress')
    parser.add_argument('--data_url',help='database name for postgress')
    parser.add_argument('--file_type',help='zone or taxi')
    parser.add_argument('--color',help='colour')

    args = parser.parse_args()
    main(args)


