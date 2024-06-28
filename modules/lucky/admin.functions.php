<?php

/**
 * @Project NUKEVIET 4.x
 * @Author TMS Holdings <contact@thuongmaiso.vn>
 * @Copyright (C) 2017 TMS Holdings. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate 04/18/2017 09:47
 */
if (!defined('NV_ADMIN') or !defined('NV_MAINFILE') or !defined('NV_IS_MODADMIN')) {
    die('Stop!!!');
}

$allow_func = array(
    'main',
    'lucky',
    'prize',
    'luckyadd',
    'prizeadd',
    'luckyaddprize',
    'setting',
    'audio',
    'audioadd',
    'special',
    'specialadd'
);

if (defined('NV_IS_SPADMIN')) {
    $allow_func[] = 'setting';
    $allow_func[] = 'fields';
    $allow_func[] = 'tabs';
    $allow_func[] = 'field_tab';
    $allow_func[] = 'template';
    $allow_func[] = 'detemplate';
    $allow_func[] = 'active_pay';
    $allow_func[] = 'docpay';
}

$array_viewcat_full = array(
    'view_home_cat' => $lang_module['view_home_cat'],
    'viewlist' => $lang_module['viewcat_page_list'],
    'viewgrid' => $lang_module['viewcat_page_gird']
);
$array_viewcat_nosub = array(
    'viewlist' => $lang_module['viewcat_page_list'],
    'viewgrid' => $lang_module['viewcat_page_gird']
);


define('NV_IS_FILE_ADMIN', true);

require_once NV_ROOTDIR . '/modules/' . $module_file . '/global.functions.php';
require_once NV_ROOTDIR . '/modules/' . $module_file . '/site.functions.php';
