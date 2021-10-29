import os

import functions as fx
import pandas as pd

server_login = dict(auth=r'windows',
                    server=r'DWProd',
                    database=r'DP_ODS',
                    username=None,
                    password=None)

schema = r'ultipro'
table = r'ipdedhist'
out_file = r'c:\temp\columns_ordinal_sort.txt'

with fx.connect_sql_server(login_dict=server_login) as connection_sql_server:
    sql = (
        r"SELECT COLUMN_NAME "
        r"FROM INFORMATION_SCHEMA.COLUMNS "
        f"WHERE TABLE_SCHEMA = '{schema}' "
        f"	AND TABLE_NAME = '{table}' "
        r"ORDER BY ORDINAL_POSITION"
    )

    data = pd.read_sql(sql, connection_sql_server)
    df = pd.DataFrame(data)
    data = df['COLUMN_NAME'].values.tolist()

with open(out_file, 'w') as f:
    for count, value in enumerate(data):
        if count == 0:
            f.write(value + '\n')
        else:
            f.write(',' + value + '\n')

os.startfile(out_file)
