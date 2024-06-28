<?php

/**
 * NukeViet Content Management System
 * @version 4.x
 * @author VINADES.,JSC <contact@vinades.vn>
 * @copyright (C) 2009-2021 VINADES.,JSC. All rights reserved
 * @license GNU/GPL version 2 or any later version
 * @see https://github.com/nukeviet The NukeViet CMS GitHub project
 */

if (!defined('NV_IS_FILE_ADMIN'))
    die('Stop!!!');

$row = array();
$error = array();
$row['id'] = $nv_Request->get_int('id', 'post,get', 0);
if ($nv_Request->isset_request('submit', 'post')) {
    $row['title'] = $nv_Request->get_string('title', 'post', '');
    $row['time_begin'] = strtotime($nv_Request->get_string('time_begin', 'post', ''));
    $row['time_end'] = strtotime($nv_Request->get_string('time_end', 'post', ''));
    $row['image'] =$nv_Request->get_string('image', 'post', '');
    if (empty($error)) {
        try {
            if (empty($row['id'])) {
                $row['status'] = 1;
                $row['time_add'] = NV_CURRENTTIME;
                $row['user_add'] = $admin_info['userid'];

                $stmt = $db->prepare('INSERT INTO ' . $db_config['prefix'] . '_' . $module_data . ' (image,name, time_begin,time_end,status,time_add,user_add) VALUES (:image,:name, :time_begin,:time_end,:status,:time_add,:user_add)');
                $stmt->bindParam(':time_add', $row['time_add'], PDO::PARAM_INT);
                $stmt->bindParam(':user_add', $row['user_add'], PDO::PARAM_INT);
                $stmt->bindParam(':status', $row['status'], PDO::PARAM_INT);
            } else {
                $stmt = $db->prepare('UPDATE ' . $db_config['prefix'] . '_' . $module_data . ' SET image = :image,name = :name, time_begin = :time_begin, time_end = :time_end WHERE id=' . $row['id']);
            }
            $stmt->bindParam(':name', $row['title'], PDO::PARAM_STR);
            $stmt->bindParam(':time_begin', $row['time_begin'], PDO::PARAM_INT);
            $stmt->bindParam(':time_end', $row['time_end'], PDO::PARAM_INT);
            $stmt->bindParam(':image', $row['image'], PDO::PARAM_STR);
            

            $exc = $stmt->execute();
            
            if ($exc) {
                $nv_Cache->delMod($module_name);
                nv_redirect_location(NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&' . NV_NAME_VARIABLE . '=' . $module_name . '&' . NV_OP_VARIABLE . '=lucky');
            }
        } catch(PDOException $e) {
            trigger_error($e->getMessage());
            die($e->getMessage()); //Remove this line after checks finished
        }
    }
} elseif ($row['id'] > 0) {
    $row = $db->query('SELECT * FROM ' . $db_config['prefix'] . '_' . $module_data . ' WHERE id=' . $row['id'])->fetch();

    if (empty($row)) {
        nv_redirect_location(NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&' . NV_NAME_VARIABLE . '=' . $module_name . '&' . NV_OP_VARIABLE . '=' . $op);
    }
} else {
    $row['id'] = 0;
    $row['name_exam'] = '';
    $row['type_exam'] = 0;
    $row['score_method'] = 10;
    $row['type_organizational'] = 0;
    $row['grade_id'] = '';
    $row['subjects_id'] = '';
    $row['time'] = 15;
    $row['time_minimum']='';
    $row['type']=0;
    $row['time_end']='';
    $row['time_begin']='';
}

$xtpl = new XTemplate('luckyadd.tpl', NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/modules/' . $module_file);
$xtpl->assign('LANG', $lang_module);
$xtpl->assign('NV_LANG_VARIABLE', NV_LANG_VARIABLE);
$xtpl->assign('NV_LANG_DATA', NV_LANG_DATA);
$xtpl->assign('NV_BASE_ADMINURL', NV_BASE_ADMINURL);
$xtpl->assign('NV_NAME_VARIABLE', NV_NAME_VARIABLE);
$xtpl->assign('NV_OP_VARIABLE', NV_OP_VARIABLE);
$xtpl->assign('MODULE_NAME', $module_name);
$xtpl->assign('MODULE_UPLOAD', $module_upload);
$xtpl->assign('NV_ASSETS_DIR', NV_ASSETS_DIR);
$xtpl->assign('UPLOADS_DIR_USER', NV_UPLOADS_DIR . '/' . $module_upload);
$xtpl->assign('OP', $op);
if($row['time_begin']){
    $row['time_begin'] = date('d-m-Y',$row['time_begin']);
}
if($row['time_end']){
    $row['time_end'] = date('d-m-Y',$row['time_end']);
}
$xtpl->assign('ROW', $row);






if (!empty($error)) {
    $xtpl->assign('ERROR', implode('<br />', $error));
    $xtpl->parse('main.error');
}

$xtpl->parse('main');
$contents = $xtpl->text('main');

$page_title = 'Thêm giải thưởng';

include NV_ROOTDIR . '/includes/header.php';
echo nv_admin_theme($contents);
include NV_ROOTDIR . '/includes/footer.php';
