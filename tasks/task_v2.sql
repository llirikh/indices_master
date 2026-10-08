-- ### Задание-2: Ускорение поиска

CREATE EXTENSION IF NOT EXISTS pg_trgm;

CREATE INDEX users_user_first_name_idx    ON users_user USING GIN(UPPER(first_name::text) gin_trgm_ops);
CREATE INDEX users_user_last_name_idx     ON users_user USING GIN(UPPER(last_name::text) gin_trgm_ops);
CREATE INDEX users_user_phone_number_idx  ON users_user USING GIN(UPPER(phone_number::text) gin_trgm_ops);
CREATE INDEX users_user_email_idx         ON users_user USING GIN(UPPER(email::text) gin_trgm_ops);
--CREATE INDEX users_user_last_name_asc_idx ON users_user(last_name ASC);

--ANALYZE users_user;


--EXPLAIN (ANALYZE)
SELECT 
    "users_user"."id",
    "users_user"."first_name",
    "users_user"."second_name",
    "users_user"."last_name",
    "users_user"."email",
    "users_user"."address",
    "users_user"."phone_number",
    "users_user"."company_id",
    "users_user"."job_id"
FROM 
    "users_user"
WHERE 
    (
        UPPER("users_user"."first_name"::text) LIKE UPPER('%John%') 
        OR UPPER("users_user"."last_name"::text) LIKE UPPER('%John%') 
        OR UPPER("users_user"."phone_number"::text) LIKE UPPER('John%') 
        OR UPPER("users_user"."email"::text) LIKE UPPER('%John%')
    ) 
ORDER BY 
    "users_user"."last_name" ASC;


--DROP INDEX users_user_first_name_idx;
--DROP INDEX users_user_last_name_idx;
--DROP INDEX users_user_phone_number_idx;
--DROP INDEX users_user_email_idx;
--DROP INDEX users_user_last_name_asc_idx;


-- **Подсказки:**

-- - Использование функций, таких как `UPPER()`, в условиях фильтрации может мешать использованию индексов.
-- - Преобразование типов, такое как `::text`, также может негативно сказываться на производительности.
-- - Подумайте о создании функциональных индексов, если использование функций неизбежно.

-- **Дополнительные материалы:**

-- - Документация PostgreSQL по индексам: https://www.postgresql.org/docs/current/indexes.html
