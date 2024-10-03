# Generating MySQL query statements for the database 'mytest' with tables 'sbtest1' to 'sbtest10' using various query methods.
import random

queries = []
database_name = 'mytest'
table_names = [f'sbtest{i}' for i in range(1, 11)]

# Create a list of base queries with different operations.
for i in range(100):
    table_name = random.choice(table_names)
    id_value = random.randint(1, 1000)
    k_value = random.randint(0, 10)
    c_value = ''.join(random.choices('abcdefghijklmnopqrstuvwxyz', k=5))
    pad_value = ''.join(random.choices('abcdefghijklmnopqrstuvwxyz', k=5))
    if i % 3 == 0:
        query = f'SELECT id, k, c, pad FROM {database_name}.{table_name} WHERE id = {id_value} LIMIT 100;'
    elif i % 3 == 1:
        query = f'SELECT id, k, c, pad FROM {database_name}.{table_name} WHERE k IN ({k_value}, {k_value + 1}, {k_value + 2}) LIMIT 100;'
    else:
        other_table = random.choice([t for t in table_names if t != table_name])
        query = f'SELECT a.id, a.k, b.c, a.pad FROM {database_name}.{table_name} AS a JOIN {database_name}.{other_table} AS b ON a.k = b.k WHERE a.c = "{c_value}" OR b.pad = "{pad_value}" LIMIT 100;'
    queries.append(query)

queries