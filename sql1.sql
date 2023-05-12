/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  toby
 * Created: 12 May 2023
 */

SELECT
    `webgame`.`ts_info`.`ts_id` AS `ts_id`,
    `webgame`.`ts_info`.`res_id` AS `res_id`,
    `webgame`.`ts_info`.`ts_name` AS `ts_name`,
    `webgame`.`ts_info`.`ts_base` AS `ts_base`,
    `webgame`.`ts_info`.`ts_trend` AS `ts_trend`,
    `webgame`.`ts_info`.`ts_osc` AS `ts_osc`,
    `webgame`.`ts_info`.`ts_freq` AS `ts_freq`,
    `webgame`.`ts_info`.`ts_phase` AS `ts_phase`,
    `webgame`.`ts_info`.`ts_stdev` AS `ts_stdev`,
    `webgame`.`ts_info`.`ts_lo` AS `ts_lo`,
    `webgame`.`ts_info`.`ts_hi` AS `ts_hi`,
    `webgame`.`vw_nn3`.`n` AS `t`,
    `webgame`.`vw_nn3`.`y` AS `y`,
    (
        (
            `CLAMP`(
                (
                    (
                        (
                            `webgame`.`ts_info`.`ts_base` +(
                                `webgame`.`ts_info`.`ts_trend` * `webgame`.`vw_nn3`.`y`
                            )
                        ) +(
                            `webgame`.`ts_info`.`ts_osc` * COS(
                                (
                                    (
                                        (2 * PI()) * `webgame`.`ts_info`.`ts_freq`) *(
                                            `webgame`.`vw_nn3`.`y` + `webgame`.`ts_info`.`ts_phase`
                                        )
                                    )
                                )
                            )
                        ) +(
                            `webgame`.`ts_info`.`ts_stdev` * `RANDN`())
                        ),
                        `webgame`.`ts_info`.`ts_lo`,
                        `webgame`.`ts_info`.`ts_hi`
                    ) - `webgame`.`ts_info`.`ts_lo`
                ) /(
                    `webgame`.`ts_info`.`ts_hi` - `webgame`.`ts_info`.`ts_lo`
                )
            ) AS `v1`
        FROM
            (
                `webgame`.`ts_info`
            JOIN `webgame`.`vw_nn3`
            )