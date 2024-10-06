# MySQL Slow Query Analyzer

这是一个利用 MySQL Performance Schema 分析慢查询的工具。它可以帮助你识别和优化数据库中的慢查询,提高系统性能。

## 分析TopSQL
```shell
python3 slow-query-digest.py 
    --host localhost 
    --user your_username 
    --password your_password 
    --database mytest  
    --days 3 
    --limit 10
```

## 背景

MySQL Performance Schema 是一个用于监控数据库运行时性能的功能。通过启用 Performance Schema,你可以收集有关数据库服务器操作的详细信息,比如查询执行时间、索引使用情况、表锁定信息等。这些数据对于理解数据库的性能特性和瓶颈非常有帮助。

与传统的慢查询日志和 `SHOW PROFILE` 等工具相比,Performance Schema 提供了更全面、更细粒度的性能数据,同时对系统性能的影响也更小。你可以通过简单的程序处理来统计 SQL 的执行频率和延迟。

## 优势

1. 提供全面的性能数据,涵盖事件、对象、会话、内存等多个维度。
2. 对系统性能影响小,开销低。
3. 支持实时监控,可及时发现问题。
4. 提供细粒度的性能数据,便于深入分析。

## 局限性

1. 需要额外的内存来存储性能数据,所以建议定期清空老信息。
2. 部分统计信息可能会对系统性能产生轻微影响。
3. 对于某些特定类型的问题(如死锁),可能需要结合其他工具进行分析。

## 功能

本工具可以统计出 Top 慢查询 SQL,以及每个查询的详细分析,包括:

- 执行次数
- 总执行时间
- 平均执行时间
- 发送的行数
- 检查的行数

这些指标是优化查询性能的重要参考依据,可以帮助数据库管理员和开发人员识别需要优化的查询,并了解查询的整体性能特征。

## 使用方法

1. 确保你的 MySQL 版本支持 Performance Schema 并已启用。
2. 克隆本仓库到本地。
3. 根据你的需求修改配置文件。
4. 通过sysbench工具生成测试数据库及10张数据表，每个数据表装填100w条测试数据。
5. slow-query-generator.py脚本可以随机生成测试SQL，涵盖不同的查询方式in，or，join等操作组成，模拟不同场景下的SQL，你也可以直接利用项目中提供的sql_queries.sql。
6. slow-query-execute-query.py脚本对MySQL数据库进行随机查询。
7. 运行slow-query-digest.py脚本,查看和统计慢SQL语句，该脚本可以统计出top SQL，以及每个查询的详细分析，包括执行次数、总执行时间、平均执行时间、发送的行数和检查的行数；这些指标是优化查询性能的重要参考依据，可以帮助数据库管理员和开发人员识别需要优化的查询，并了解查询的整体性能特征。

## 贡献

如果你有任何改进建议或发现了 Bug,欢迎提交 Issue 或 Pull Request。