<?php

/**
 * @Project NUKEVIET 4.x
 * @Author TMS Holdings <contact@thuongmaiso.vn>
 * @Copyright (C) 2017 TMS Holdings. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate 04/18/2017 09:47
 */

if (! defined('NV_ADMIN')) {
    die('Stop!!!');
}

// Menu dọc
global $nv_Cache;
$shop_module_config = array();
$sql = "SELECT module, config_name, config_value FROM " . NV_CONFIG_GLOBALTABLE . " WHERE lang='" . NV_LANG_DATA . "' and module='" . $module_name . "'";
$list = $nv_Cache->db($sql, '', $module_name);
foreach ($list as $row) {
    $shop_module_config[$row['config_name']] = $row['config_value'];
}



$submenu['lucky'] = 'Vòng quay may mắn';
$submenu['prize'] = 'Giải thưởng';
$submenu['audio'] = 'Âm thanh quay thưởng';
$submenu['special'] = 'Người may mắn';
$submenu['setting'] = 'Cấu hình';

