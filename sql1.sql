WITH
    recursive cte(ts_id, ts_sup) AS(
    SELECT
        ts_map.ts_id,
        ts_map.ts_sup
    FROM
        ts_map
    WHERE
        (ts_map.ts_sup IS NULL)
    UNION ALL
SELECT
    p.ts_id,
    p.ts_sup
FROM
    (
        ts_map p
    JOIN cte ON
        ((p.ts_sup = cte.ts_id))
    )
)
SELECT
    cte.ts_id,
    cte.ts_sup
FROM
    cte
           