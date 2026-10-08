-- #### Задание-3: Оптимизация индексов в SQL

CREATE INDEX orders_status_idx ON orders (status) WHERE status = 'Pending';

ANALYZE orders;

-- EXPLAIN (ANALYZE)
SELECT
    order_id,
    customer_id,
    order_date,
    total_amount,
    status,
    shipping_address,
    billing_address
FROM
    orders
WHERE
    status = 'Pending'
ORDER BY
    order_date
-- LIMIT
-- 	10;

-- DROP INDEX orders_status_idx;

-- #### Подсказки:
-- - Обратите внимание на использование индексов для условий фильтрации и сортировки.
-- - Составные индексы могут быть полезны, если запрос использует несколько столбцов в условиях фильтрации и сортировки.
-- - Убедитесь, что новые индексы не создадут значительных накладных расходов на вставку и обновление данных в таблице.


-- #### Дополнительные материалы:
-- - Документация PostgreSQL по индексам: https://www.postgresql.org/docs/current/indexes.html
