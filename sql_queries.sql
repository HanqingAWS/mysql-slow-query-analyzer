SELECT * FROM mytest.sbtest1 WHERE k IN (10, 20, 30, 40, 50) LIMIT 100;
SELECT * FROM mytest.sbtest2 JOIN mytest.sbtest3 ON mytest.sbtest2.k = mytest.sbtest3.k WHERE mytest.sbtest2.c LIKE '%test%' LIMIT 100;
SELECT COUNT(*) FROM mytest.sbtest4 WHERE k > 1000 OR c LIKE '%data%' LIMIT 100;
SELECT * FROM mytest.sbtest5 WHERE id IN (SELECT id FROM mytest.sbtest6 WHERE k < 500) LIMIT 100;
SELECT * FROM mytest.sbtest7 LEFT JOIN mytest.sbtest8 ON mytest.sbtest7.id = mytest.sbtest8.id WHERE mytest.sbtest7.k BETWEEN 100 AND 200 LIMIT 100;
SELECT * FROM mytest.sbtest9 WHERE pad = 'test' OR k > 5000 LIMIT 100;
SELECT AVG(k) FROM mytest.sbtest10 GROUP BY c HAVING COUNT(*) > 10 LIMIT 100;
SELECT * FROM mytest.sbtest1 WHERE k IN (SELECT k FROM mytest.sbtest2 WHERE c LIKE '%pattern%') LIMIT 100;
SELECT * FROM mytest.sbtest3 WHERE id NOT IN (SELECT id FROM mytest.sbtest4 WHERE k < 1000) LIMIT 100;
SELECT * FROM mytest.sbtest5 JOIN mytest.sbtest6 ON mytest.sbtest5.k = mytest.sbtest6.k JOIN mytest.sbtest7 ON mytest.sbtest6.k = mytest.sbtest7.k WHERE mytest.sbtest5.c LIKE '%join%' LIMIT 100;
SELECT * FROM mytest.sbtest8 WHERE k BETWEEN 2000 AND 3000 AND c LIKE '%test%' LIMIT 100;
SELECT * FROM mytest.sbtest9 WHERE id IN (1, 10, 100, 1000) OR k > 5000 LIMIT 100;
SELECT * FROM mytest.sbtest10 WHERE pad LIKE 'prefix%' AND k < 500 LIMIT 100;
SELECT * FROM mytest.sbtest1 JOIN mytest.sbtest2 ON mytest.sbtest1.id = mytest.sbtest2.id WHERE mytest.sbtest1.k > mytest.sbtest2.k LIMIT 100;
SELECT * FROM mytest.sbtest3 WHERE k IN (SELECT k FROM mytest.sbtest4 WHERE c LIKE '%data%') OR pad LIKE '%suffix' LIMIT 100;
SELECT * FROM mytest.sbtest5 WHERE id BETWEEN 100 AND 200 AND k IN (300, 400, 500) LIMIT 100;
SELECT * FROM mytest.sbtest6 JOIN mytest.sbtest7 ON mytest.sbtest6.k = mytest.sbtest7.k WHERE mytest.sbtest6.c LIKE '%join%' OR mytest.sbtest7.pad LIKE '%test%' LIMIT 100;
SELECT * FROM mytest.sbtest8 WHERE k > 1000 AND c IN (SELECT c FROM mytest.sbtest9 WHERE k < 500) LIMIT 100;
SELECT * FROM mytest.sbtest10 WHERE pad LIKE '%data%' OR k BETWEEN 2000 AND 3000 LIMIT 100;
SELECT * FROM mytest.sbtest1 WHERE id IN (SELECT id FROM mytest.sbtest2 WHERE k > 1000) AND c LIKE '%pattern%' LIMIT 100;
SELECT * FROM mytest.sbtest3 LEFT JOIN mytest.sbtest4 ON mytest.sbtest3.id = mytest.sbtest4.id WHERE mytest.sbtest3.k < 500 OR mytest.sbtest4.pad LIKE '%test%' LIMIT 100;
SELECT * FROM mytest.sbtest5 WHERE k IN (100, 200, 300) AND pad LIKE 'prefix%' LIMIT 100;
SELECT * FROM mytest.sbtest6 JOIN mytest.sbtest7 ON mytest.sbtest6.k = mytest.sbtest7.k WHERE mytest.sbtest6.c LIKE '%data%' AND mytest.sbtest7.id > 1000 LIMIT 100;
SELECT * FROM mytest.sbtest8 WHERE id BETWEEN 500 AND 1000 AND k IN (SELECT k FROM mytest.sbtest9 WHERE c LIKE '%pattern%') LIMIT 100;
SELECT * FROM mytest.sbtest10 WHERE pad LIKE '%suffix' OR k IN (1000, 2000, 3000) LIMIT 100;
SELECT * FROM mytest.sbtest1 JOIN mytest.sbtest2 ON mytest.sbtest1.id = mytest.sbtest2.id JOIN mytest.sbtest3 ON mytest.sbtest2.id = mytest.sbtest3.id WHERE mytest.sbtest1.k > 500 AND mytest.sbtest2.c LIKE '%join%' AND mytest.sbtest3.pad LIKE '%test%' LIMIT 100;
SELECT * FROM mytest.sbtest4 WHERE k BETWEEN 100 AND 200 AND c IN (SELECT c FROM mytest.sbtest5 WHERE k > 1000) LIMIT 100;
SELECT * FROM mytest.sbtest6 WHERE id IN (SELECT id FROM mytest.sbtest7 WHERE k < 500) OR pad LIKE 'prefix%' LIMIT 100;
SELECT * FROM mytest.sbtest8 JOIN mytest.sbtest9 ON mytest.sbtest8.k = mytest.sbtest9.k WHERE mytest.sbtest8.c LIKE '%data%' OR mytest.sbtest9.id > 2000 LIMIT 100;
SELECT * FROM mytest.sbtest10 WHERE k IN (SELECT k FROM mytest.sbtest1 WHERE c LIKE '%pattern%') AND pad LIKE '%suffix' LIMIT 100;
SELECT * FROM mytest.sbtest2 WHERE id BETWEEN 1000 AND 2000 AND k IN (100, 200, 300) LIMIT 100;
SELECT * FROM mytest.sbtest3 JOIN mytest.sbtest4 ON mytest.sbtest3.id = mytest.sbtest4.id WHERE mytest.sbtest3.k > 500 AND mytest.sbtest4.c LIKE '%join%' LIMIT 100;
SELECT * FROM mytest.sbtest5 WHERE pad LIKE '%test%' OR k IN (SELECT k FROM mytest.sbtest6 WHERE c LIKE '%data%') LIMIT 100;
SELECT * FROM mytest.sbtest7 WHERE id IN (1, 10, 100) AND k BETWEEN 500 AND 1000 LIMIT 100;
SELECT * FROM mytest.sbtest8 JOIN mytest.sbtest9 ON mytest.sbtest8.k = mytest.sbtest9.k JOIN mytest.sbtest10 ON mytest.sbtest9.k = mytest.sbtest10.k WHERE mytest.sbtest8.c LIKE '%pattern%' AND mytest.sbtest9.pad LIKE '%test%' AND mytest.sbtest10.k > 1000 LIMIT 100;
SELECT * FROM mytest.sbtest1 WHERE k IN (SELECT k FROM mytest.sbtest2 WHERE pad LIKE '%data%') OR c LIKE 'prefix%' LIMIT 100;
SELECT * FROM mytest.sbtest3 WHERE id BETWEEN 100 AND 500 AND k IN (1000, 2000, 3000) LIMIT 100;
SELECT * FROM mytest.sbtest4 JOIN mytest.sbtest5 ON mytest.sbtest4.id = mytest.sbtest5.id WHERE mytest.sbtest4.k < 1000 OR mytest.sbtest5.c LIKE '%join%' LIMIT 100;
SELECT * FROM mytest.sbtest6 WHERE pad LIKE '%suffix' AND k IN (SELECT k FROM mytest.sbtest7 WHERE c LIKE '%pattern%') LIMIT 100;
SELECT * FROM mytest.sbtest8 WHERE id IN (SELECT id FROM mytest.sbtest9 WHERE k > 500) AND c LIKE '%test%' LIMIT 100;
SELECT * FROM mytest.sbtest10 JOIN mytest.sbtest1 ON mytest.sbtest10.k = mytest.sbtest1.k WHERE mytest.sbtest10.pad LIKE '%data%' OR mytest.sbtest1.id > 2000 LIMIT 100;
SELECT * FROM mytest.sbtest2 WHERE k BETWEEN 1000 AND 2000 AND c IN (SELECT c FROM mytest.sbtest3 WHERE k < 500) LIMIT 100;
SELECT * FROM mytest.sbtest4 WHERE id IN (10, 20, 30) OR pad LIKE 'prefix%' LIMIT 100;
SELECT * FROM mytest.sbtest5 JOIN mytest.sbtest6 ON mytest.sbtest5.id = mytest.sbtest6.id WHERE mytest.sbtest5.k > 1000 AND mytest.sbtest6.c LIKE '%join%' LIMIT 100;
SELECT * FROM mytest.sbtest7 WHERE pad LIKE '%test%' AND k IN (SELECT k FROM mytest.sbtest8 WHERE c LIKE '%data%') LIMIT 100;
SELECT * FROM mytest.sbtest9 WHERE id BETWEEN 500 AND 1000 AND k IN (100, 200, 300) LIMIT 100;
SELECT * FROM mytest.sbtest10 JOIN mytest.sbtest1 ON mytest.sbtest10.k = mytest.sbtest1.k JOIN mytest.sbtest2 ON mytest.sbtest1.k = mytest.sbtest2.k WHERE mytest.sbtest10.c LIKE '%pattern%' AND mytest.sbtest1.pad LIKE '%test%' AND mytest.sbtest2.k < 500 LIMIT 100;
SELECT * FROM mytest.sbtest3 WHERE k IN (SELECT k FROM mytest.sbtest4 WHERE pad LIKE '%data%') OR c LIKE 'prefix%' LIMIT 100;
SELECT * FROM mytest.sbtest5 WHERE id BETWEEN 1000 AND 1500 AND k IN (2000, 3000, 4000) LIMIT 100;
SELECT * FROM mytest.sbtest6 JOIN mytest.sbtest7 ON mytest.sbtest6.id = mytest.sbtest7.id WHERE mytest.sbtest6.k > 500 OR mytest.sbtest7.c LIKE '%join%' LIMIT 100;
SELECT * FROM mytest.sbtest8 WHERE pad LIKE '%suffix' AND k IN (SELECT k FROM mytest.sbtest9 WHERE c LIKE '%pattern%') LIMIT 100;
SELECT * FROM mytest.sbtest10 WHERE id IN (SELECT id FROM mytest.sbtest1 WHERE k < 1000) AND c LIKE '%test%' LIMIT 100;
SELECT * FROM mytest.sbtest2 JOIN mytest.sbtest3 ON mytest.sbtest2.k = mytest.sbtest3.k WHERE mytest.sbtest2.pad LIKE '%data%' OR mytest.sbtest3.id > 1500 LIMIT 100;
SELECT * FROM mytest.sbtest4 WHERE k BETWEEN 500 AND 1000 AND c IN (SELECT c FROM mytest.sbtest5 WHERE k > 2000) LIMIT 100;
SELECT * FROM mytest.sbtest6 WHERE id IN (5, 15, 25) OR pad LIKE 'prefix%' LIMIT 100;
SELECT * FROM mytest.sbtest7 JOIN mytest.sbtest8 ON mytest.sbtest7.id = mytest.sbtest8.id WHERE mytest.sbtest7.k < 2000 AND mytest.sbtest8.c LIKE '%join%' LIMIT 100;
SELECT * FROM mytest.sbtest9 WHERE pad LIKE '%test%' AND k IN (SELECT k FROM mytest.sbtest10 WHERE c LIKE '%data%') LIMIT 100;
SELECT * FROM mytest.sbtest1 WHERE id BETWEEN 200 AND 700 AND k IN (400, 500, 600) LIMIT 100;
SELECT * FROM mytest.sbtest2 JOIN mytest.sbtest3 ON mytest.sbtest2.k = mytest.sbtest3.k JOIN mytest.sbtest4 ON mytest.sbtest3.k = mytest.sbtest4.k WHERE mytest.sbtest2.c LIKE '%pattern%' AND mytest.sbtest3.pad LIKE '%test%' AND mytest.sbtest4.k > 1500 LIMIT 100;
SELECT * FROM mytest.sbtest5 WHERE k IN (SELECT k FROM mytest.sbtest6 WHERE pad LIKE '%data%') OR c LIKE 'prefix%' LIMIT 100;
SELECT * FROM mytest.sbtest7 WHERE id BETWEEN 1500 AND 2000 AND k IN (3000, 4000, 5000) LIMIT 100;
SELECT * FROM mytest.sbtest8 JOIN mytest.sbtest9 ON mytest.sbtest8.id = mytest.sbtest9.id WHERE mytest.sbtest8.k < 1000 OR mytest.sbtest9.c LIKE '%join%' LIMIT 100;
SELECT * FROM mytest.sbtest10 WHERE pad LIKE '%suffix' AND k IN (SELECT k FROM mytest.sbtest1 WHERE c LIKE '%pattern%') LIMIT 100;
SELECT * FROM mytest.sbtest2 WHERE id IN (SELECT id FROM mytest.sbtest3 WHERE k > 500) AND c LIKE '%test%' LIMIT 100;
SELECT * FROM mytest.sbtest4 JOIN mytest.sbtest5 ON mytest.sbtest4.k = mytest.sbtest5.k WHERE mytest.sbtest4.pad LIKE '%data%' OR mytest.sbtest5.id < 1000 LIMIT 100;
SELECT * FROM mytest.sbtest6 WHERE k BETWEEN 1000 AND 1500 AND c IN (SELECT c FROM mytest.sbtest7 WHERE k < 2000) LIMIT 100;
SELECT * FROM mytest.sbtest8 WHERE id IN (50, 100, 150) OR pad LIKE 'prefix%' LIMIT 100;
SELECT * FROM mytest.sbtest9 JOIN mytest.sbtest10 ON mytest.sbtest9.id = mytest.sbtest10.id WHERE mytest.sbtest9.k > 1000 AND mytest.sbtest10.c LIKE '%join%' LIMIT 100;
SELECT * FROM mytest.sbtest1 WHERE pad LIKE '%test%' AND k IN (SELECT k FROM mytest.sbtest2 WHERE c LIKE '%data%') LIMIT 100;
SELECT * FROM mytest.sbtest3 WHERE id BETWEEN 800 AND 1200 AND k IN (1600, 1700, 1800) LIMIT 100;
SELECT * FROM mytest.sbtest4 JOIN mytest.sbtest5 ON mytest.sbtest4.k = mytest.sbtest5.k JOIN mytest.sbtest6 ON mytest.sbtest5.k = mytest.sbtest6.k WHERE mytest.sbtest4.c LIKE '%pattern%' AND mytest.sbtest5.pad LIKE '%test%' AND mytest.sbtest6.k < 1000 LIMIT 100;
SELECT * FROM mytest.sbtest7 WHERE k IN (SELECT k FROM mytest.sbtest8 WHERE pad LIKE '%data%') OR c LIKE 'prefix%' LIMIT 100;
SELECT * FROM mytest.sbtest9 WHERE id BETWEEN 2000 AND 2500 AND k IN (4000, 5000, 6000) LIMIT 100;
SELECT * FROM mytest.sbtest10 JOIN mytest.sbtest1 ON mytest.sbtest10.id = mytest.sbtest1.id WHERE mytest.sbtest10.k > 1500 OR mytest.sbtest1.c LIKE '%join%' LIMIT 100;
SELECT * FROM mytest.sbtest2 WHERE pad LIKE '%suffix' AND k IN (SELECT k FROM mytest.sbtest3 WHERE c LIKE '%pattern%') LIMIT 100;
SELECT * FROM mytest.sbtest4 WHERE id IN (SELECT id FROM mytest.sbtest5 WHERE k < 2000) AND c LIKE '%test%' LIMIT 100;
SELECT * FROM mytest.sbtest6 JOIN mytest.sbtest7 ON mytest.sbtest6.k = mytest.sbtest7.k WHERE mytest.sbtest6.pad LIKE '%data%' OR mytest.sbtest7.id > 500 LIMIT 100;
SELECT * FROM mytest.sbtest8 WHERE k BETWEEN 500 AND 1500 AND c IN (SELECT c FROM mytest.sbtest9 WHERE k > 1000) LIMIT 100;
SELECT * FROM mytest.sbtest10 WHERE id IN (25, 75, 125) OR pad LIKE 'prefix%' LIMIT 100;
SELECT * FROM mytest.sbtest1 JOIN mytest.sbtest2 ON mytest.sbtest1.id = mytest.sbtest2.id WHERE mytest.sbtest1.k < 3000 AND mytest.sbtest2.c LIKE '%join%' LIMIT 100;