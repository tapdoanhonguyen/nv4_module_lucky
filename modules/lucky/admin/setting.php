<?php

/**
 * @Project NUKEVIET 4.x
 * @Author TMS Holdings <contact@thuongmaiso.vn>
 * @Copyright (C) 2017 TMS Holdings. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate 04/18/2017 09:47
 */

if (!defined('NV_IS_FILE_ADMIN')) {
    die('Stop!!!');
}

if (defined('NV_EDITOR')) {
    require_once NV_ROOTDIR . '/' . NV_EDITORSDIR . '/' . NV_EDITOR . '/nv.php';
}


$data = $db->query('SELECT * FROM ' . NV_LUCKY . '_config')->fetchAll();
$list = array();
foreach ($data as $key => $value) {
    $list[$value['config_name']] = $value['config_value'];
}


$page_title = "Cấu hình";

$savesetting = $nv_Request->get_int('savesetting', 'post', 0);
$error = "";





if ($savesetting == 1) {
    
    $data['title'] = $nv_Request->get_title('title', 'post', '');

    if ($error == '') {
        $sth = $db->prepare("UPDATE " . NV_LUCKY . "_config SET config_value = :config_value WHERE config_name = :config_name");
        foreach ($data as $config_name => $config_value) {
            $sth->bindParam(':config_name', $config_name, PDO::PARAM_STR);
            $sth->bindParam(':config_value', $config_value, PDO::PARAM_STR);
            $sth->execute();
        }

        nv_insert_logs(NV_LANG_DATA, $module_name, $lang_module['setting'], "Setting", $admin_info['userid']);
        $nv_Cache->delMod('settings');
        $nv_Cache->delMod($module_name);

        nv_redirect_location(NV_BASE_ADMINURL . "index.php?" . NV_NAME_VARIABLE . "=" . $module_name . "&" . NV_OP_VARIABLE . '=setting');
    }
}


$xtpl = new XTemplate("setting.tpl", NV_ROOTDIR . "/themes/" . $global_config['module_theme'] . "/modules/" . $module_file);
$xtpl->assign('LANG', $lang_module);

$xtpl->assign('DATA', $list);
$xtpl->assign('MODULE_NAME', $module_name);

// Số sản phẩm hiển thị trên một dòng





if (!empty($error)) {
    $xtpl->assign('error', $error);
    $xtpl->parse('main.error');
}

$array_sortdefault = array(
    0 => $lang_module['setting_sortdefault_0'],
    1 => $lang_module['setting_sortdefault_1'],
    2 => $lang_module['setting_sortdefault_2']
);

$xtpl->parse('main');

$contents .= $xtpl->text('main');
include NV_ROOTDIR . '/includes/header.php';
echo nv_admin_theme($contents);
include NV_ROOTDIR . '/includes/footer.php';