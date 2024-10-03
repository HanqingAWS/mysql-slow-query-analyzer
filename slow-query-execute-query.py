import mysql.connector
import random
import time
import argparse
import sys
from concurrent.futures import ThreadPoolExecutor
import threading

def read_queries(file_path):
    with open(file_path, 'r') as file:
        return [query.strip() for query in file.readlines() if query.strip()]

def execute_query(connection, query):
    cursor = connection.cursor()
    try:
        query_start_time = time.time()
        cursor.execute(query)
        cursor.fetchall()
        query_end_time = time.time()
        query_duration = query_end_time - query_start_time
        print(f"Executed query: {query[:50]}... | Execution time: {query_duration:.4f} seconds")
    except mysql.connector.Error as err:
        print(f"Error executing query: {err}")
    finally:
        cursor.close()

def execute_random_queries(connection_pool, queries, duration, max_workers):
    start_time = time.time()
    query_count = 0
    lock = threading.Lock()

    def execute_and_count():
        nonlocal query_count
        query = random.choice(queries)
        connection = connection_pool.get_connection()
        execute_query(connection, query)
        connection.close()
        with lock:
            query_count += 1

    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        while time.time() - start_time < duration:
            executor.submit(execute_and_count)
            time.sleep(0.01)  # Small delay to prevent overwhelming the thread pool

    print(f"\nTotal queries executed: {query_count}")

def main():
    parser = argparse.ArgumentParser(description="Execute random MySQL queries.")
    parser.add_argument("--duration", type=int, default=300, help="Duration in seconds to run queries (default: 300)")
    parser.add_argument("--host", default="localhost", help="MySQL host (default: localhost)")
    parser.add_argument("--user", required=True, help="MySQL user")
    parser.add_argument("--password", required=True, help="MySQL password")
    parser.add_argument("--database", required=True, help="MySQL database name")
    parser.add_argument("--max_workers", type=int, default=10, help="Maximum number of worker threads (default: 10)")
    args = parser.parse_args()

    try:
        queries = read_queries("sql_queries.sql")
    except FileNotFoundError:
        print("Error: sql_queries.sql file not found.")
        sys.exit(1)

    if not queries:
        print("Error: No queries found in sql_queries.txt")
        sys.exit(1)

    try:
        connection_pool = mysql.connector.pooling.MySQLConnectionPool(
            pool_name="mypool",
            pool_size=args.max_workers,
            host=args.host,
            user=args.user,
            password=args.password,
            database=args.database
        )
        print(f"Connected to MySQL database: {args.database}")
        
        execute_random_queries(connection_pool, queries, args.duration, args.max_workers)

    except mysql.connector.Error as err:
        print(f"Error connecting to MySQL: {err}")
        sys.exit(1)

if __name__ == "__main__":
    main()