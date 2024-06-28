<?php

/**
 * @Project NUKEVIET 4.x
 * @Author TMS Holdings <contact@thuongmaiso.vn>
 * @Copyright (C) 2017 TMS Holdings. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate 04/18/2017 09:47
 */

if (!defined('NV_MAINFILE')) {
    die('Stop!!!');
}
define('NV_LUCKY', $db_config['prefix'] . '_' . $module_data);

// Ket noi file ngon ngu tuy chinh du lieu
if (file_exists(NV_ROOTDIR . '/modules/' . $module_file . '/language/custom_' . NV_LANG_INTERFACE . '.php')) {
    $lang_temp = $lang_module;
    require NV_ROOTDIR . '/modules/' . $module_file . '/language/custom_' . NV_LANG_INTERFACE . '.php';
    $lang_module = $lang_module + $lang_temp;
    unset($lang_temp);
}

// Cau hinh mac dinh


function nv_get_week_from_time($time)
{
    $week = 1;
    $year = date('Y', $time);
    $real_week = array($week, $year);
    $time_per_week = 86400 * 7;
    $time_start_year = mktime(0, 0, 0, 1, 1, $year);
    $time_first_week = $time_start_year - (86400 * (date('N', $time_start_year) - 1));
    
    $addYear = true;
    $num_week_loop = nv_get_max_week_of_year($year) - 1;
    
    for ($i = 0; $i <= $num_week_loop; $i++) {
        $week_begin = $time_first_week + $i * $time_per_week;
        $week_next = $week_begin + $time_per_week;
        
        if ($week_begin <= $time and $week_next > $time) {
            $real_week[0] = $i + 1;
            $addYear = false;
            break;
        }
    }
    if ($addYear) {
        $real_week[1] = $real_week[1] + 1;
    }
    
    return $real_week;
}

/**
 * nv_get_max_week_of_year()
 * 
 * @param mixed $year
 * @return
 */
function nv_get_max_week_of_year($year)
{
    $time_per_week = 86400 * 7;
    $time_start_year = mktime(0, 0, 0, 1, 1, $year);
    $time_first_week = $time_start_year - (86400 * (date('N', $time_start_year) - 1));
    
    if (date('Y', $time_first_week + ($time_per_week * 53) - 1) == $year) {
        return 53;
    } else {
        return 52;
    }
}

