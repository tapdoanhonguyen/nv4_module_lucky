<?php

/**
 * @Project NUKEVIET 4.x
 * @Author TMS Holdings <contact@thuongmaiso.vn>
 * @Copyright (C) 2017 TMS Holdings. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate 04/18/2017 09:47
 */
if (!defined('NV_ADMIN') or !defined('NV_MAINFILE')) {
    die('Stop!!!');
}

$module_version = array(
    'name' => 'Vòng quay may mắn', // Tieu de module
    'modfuncs' => 'main,lucky',
    'submenu' => 'lucky',
    'is_sysmod' => 0, // 1:0 => Co phai la module he thong hay khong
    'virtual' => 1, // 1:0 => Co cho phep ao hao module hay khong
    'version' => '4.3.00', // Module Shops 4 Release Candidate 1
    'date' => 'Tue, 18 April 2017 00:50:00 GMT', // Ngay phat hanh phien ban
    'author' => 'VINADES <contact@thuongmaiso.vn>', // Tac gia
    'note' => '', // Ghi chu
    'uploads_dir' => array(
        $module_upload,
        $module_upload . '/lucky',
        $module_upload . '/audio'
    )
);