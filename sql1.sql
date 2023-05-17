SELECT
    `webgame`.`vw_dem_ts`.`prd_id` AS `prd_id`,
    `webgame`.`vw_dem_ts`.`t` AS `t`,
    SUM(`webgame`.`vw_dem_ts`.`v1`) AS `v1`
FROM
    `webgame`.`vw_dem_ts`
GROUP BY
    `webgame`.`vw_dem_ts`.`prd_id`,
    `webgame`.`vw_dem_ts`.`t`
ORDER BY
    `webgame`.`vw_dem_ts`.`prd_id`,
    `webgame`.`vw_dem_ts`.`t`