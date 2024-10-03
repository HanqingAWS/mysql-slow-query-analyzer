import mysql.connector
from datetime import datetime, timedelta
from tabulate import tabulate
import argparse

def connect_to_mysql(host, user, password, database):
    config = {
        'host': host,
        'user': user,
        'password': password,
        'database': database
    }
    try:
        conn = mysql.connector.connect(**config)
        return conn
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return None

def get_query_stats(connection, days, limit):
    query = f"""
    SELECT 
        DIGEST_TEXT AS query,
        COUNT_STAR AS exec_count,
        SUM_TIMER_WAIT / 1000000000000 AS total_latency_sec,
        AVG_TIMER_WAIT / 1000000000000 AS avg_latency_sec,
        SUM_ROWS_SENT AS rows_sent,
        SUM_ROWS_EXAMINED AS rows_examined,
        FIRST_SEEN AS first_seen,
        LAST_SEEN AS last_seen
    FROM 
        performance_schema.events_statements_summary_by_digest
    WHERE 
        SCHEMA_NAME = %s AND
        LAST_SEEN >= NOW() - INTERVAL %s DAY AND
        DIGEST_TEXT LIKE 'SELECT%%'
    ORDER BY 
        total_latency_sec DESC 
    LIMIT %s;
    """

    cursor = connection.cursor(dictionary=True)
    cursor.execute(query, (connection.database, days, limit))
    results = cursor.fetchall()
    cursor.close()
    return results

def format_query(query):
    return query[:60] + '...' if len(query) > 60 else query

def print_summary(stats):
    summary_data = []
    for i, row in enumerate(stats, 1):
        summary_data.append([
            i,
            format_query(row['query']),
            f"{row['total_latency_sec']:.4f}",
            row['exec_count'],
            f"{row['avg_latency_sec']:.4f}",
            f"{row['total_latency_sec'] / sum(s['total_latency_sec'] for s in stats) * 100:.1f}%"
        ])

    print(tabulate(summary_data, headers=[
        "Rank", "Query", "Total Latency (s)", "Calls", "Avg Latency (s)", "% of Total"
    ], tablefmt="grid"))

def print_detailed_stats(stats):
    for i, row in enumerate(stats, 1):
        time_diff = (row['last_seen'] - row['first_seen']).total_seconds()
        if time_diff > 0:
            qps = row['exec_count'] / time_diff
        else:
            qps = row['exec_count']  # 如果时间差为0，就直接使用执行次数作为QPS
        
        print(f"\n# Query {i}: {qps:.2f} QPS")
        print(f"# Time range: {row['first_seen']} to {row['last_seen']}")
        
        detail_data = [
            ["Count", row['exec_count']],
            ["Exec time", f"{row['total_latency_sec']:.4f}s"],
            ["Avg Latency", f"{row['avg_latency_sec']:.4f}s"],
            ["Rows sent", row['rows_sent']],
            ["Rows examine", row['rows_examined']]
        ]
        
        print(tabulate(detail_data, headers=["Attribute", "Value"], tablefmt="grid"))
        print("\n# Query:")
        print(row['query'])

def main():
    parser = argparse.ArgumentParser(description="Analyze MySQL slow queries")
    parser.add_argument("--host", required=True, help="MySQL host")
    parser.add_argument("--user", required=True, help="MySQL user")
    parser.add_argument("--password", required=True, help="MySQL password")
    parser.add_argument("--database", required=True, help="MySQL database")
    parser.add_argument("--days", type=int, default=3, help="Number of days to analyze")
    parser.add_argument("--limit", type=int, default=10, help="Number of top queries to show")
    args = parser.parse_args()

    connection = connect_to_mysql(args.host, args.user, args.password, args.database)
    if connection:
        query_stats = get_query_stats(connection, args.days, args.limit)
        connection.close()

        if query_stats:
            print(f"Summary of Top {args.limit} SELECT Queries in {args.database} schema (Last {args.days} Days)")
            print("=" * 80)
            print_summary(query_stats)
            
            print("\nDetailed Query Analysis")
            print("=" * 80)
            print_detailed_stats(query_stats)
        else:
            print(f"No SELECT queries found in the last {args.days} days.")
    else:
        print("Failed to connect to the database.")

if __name__ == "__main__":
    main()