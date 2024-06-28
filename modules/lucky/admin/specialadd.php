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


$mod = $nv_Request->get_string( 'mod', 'get,post', '' );
if($mod=="user_lucky"){
    $q=$nv_Request->get_string('q', 'get','');

    $list = $db->query("SELECT * FROM " . $db_config['dbsystem'] . '.' . $db_config['prefix'] . "_users WHERE (username like '%".str_replace(' ','%',$q)."%' OR CONCAT(first_name,last_name) like '%".str_replace(' ','%',$q)."%') AND idsite = " . $global_config['idsite'] . " ORDER BY CONCAT(first_name,last_name)")->fetchAll();
    foreach($list as $result){
        $json[] = ['id'=>$result['userid'], 'text'=>$result['first_name'] . $result['last_name']];
    }
    print_r(json_encode($json));die(); 
}
if($mod=="prize"){
    $q=$nv_Request->get_string('q', 'get','');

    $list = $db->query("SELECT * FROM " . NV_LUCKY . "_prize WHERE title like '%".str_replace(' ','%',$q)."%' ORDER BY title")->fetchAll();
    foreach($list as $result){
        $json[] = ['id'=>$result['id'], 'text'=>$result['title']];
    }
    print_r(json_encode($json));die(); 
}
if($mod=="lucky"){
    $q=$nv_Request->get_string('q', 'get','');

    $list = $db->query("SELECT * FROM " . NV_LUCKY . " WHERE name like '%".str_replace(' ','%',$q)."%' ORDER BY name")->fetchAll();

    
    foreach($list as $result){
        $json[] = ['id'=>$result['id'], 'text'=>$result['name']];
    }
    print_r(json_encode($json));die(); 
}


$row = array();
$error = array();
$row['id'] = $nv_Request->get_int('id', 'post,get', 0);
if ($nv_Request->isset_request('submit', 'post')) {
    $row['user_lucky'] = $nv_Request->get_string('user_lucky', 'post', '');
    $row['prize'] = $nv_Request->get_string('prize', 'post', '');
    $row['number'] = $nv_Request->get_string('number', 'post', '');
    $row['lucky'] = $nv_Request->get_string('lucky', 'post', '');

    if (empty($error)) {
        try {
            if (empty($row['id'])) {
                $row['status'] = 1;
                $row['time_add'] = NV_CURRENTTIME;
                $row['user_add'] = $admin_info['userid'];
                $stmt = $db->prepare('INSERT INTO ' . $db_config['prefix'] . '_' . $module_data . '_special (userid,id_prize,id_lucky,number,time_add,user_add) VALUES (:userid,:id_prize,:id_lucky,:number,:time_add,:user_add)');
                $stmt->bindParam(':userid', $row['user_lucky'], PDO::PARAM_INT);
                $stmt->bindParam(':time_add', $row['time_add'], PDO::PARAM_INT);
                $stmt->bindParam(':user_add', $row['user_add'], PDO::PARAM_INT);
            } else {
                $stmt = $db->prepare('UPDATE ' . $db_config['prefix'] . '_' . $module_data . '_special SET id_prize = :id_prize,id_lucky = :id_lucky,number = :number WHERE id=' . $row['id']);
            }
            
            $stmt->bindParam(':id_prize', $row['prize'], PDO::PARAM_INT);
            $stmt->bindParam(':id_lucky', $row['lucky'], PDO::PARAM_INT);
            $stmt->bindParam(':number', $row['number'], PDO::PARAM_INT);
            $exc = $stmt->execute();
            
            if ($exc) {
                $nv_Cache->delMod($module_name);
                nv_redirect_location(NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&' . NV_NAME_VARIABLE . '=' . $module_name . '&' . NV_OP_VARIABLE . '=special');
            }
        } catch(PDOException $e) {
            trigger_error($e->getMessage());
            die($e->getMessage()); //Remove this line after checks finished
        }
    }
} elseif ($row['id'] > 0) {
    $row = $db->query('SELECT * FROM ' . $db_config['prefix'] . '_' . $module_data . '_special WHERE id=' . $row['id'])->fetch();

    if (empty($row)) {
        nv_redirect_location(NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&' . NV_NAME_VARIABLE . '=' . $module_name . '&' . NV_OP_VARIABLE . '=' . $op);
    }
} else {
    $row['id'] = 0;
    $row['id_prize'] = '';
    $row['userid'] = '';
    $row['id_lucky'] = '';

}

$xtpl = new XTemplate('specialadd.tpl', NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/modules/' . $module_file);
$xtpl->assign('LANG', $lang_module);
$xtpl->assign('NV_LANG_VARIABLE', NV_LANG_VARIABLE);
$xtpl->assign('NV_LANG_DATA', NV_LANG_DATA);
$xtpl->assign('NV_BASE_ADMINURL', NV_BASE_ADMINURL);
$xtpl->assign('NV_NAME_VARIABLE', NV_NAME_VARIABLE);
$xtpl->assign('NV_OP_VARIABLE', NV_OP_VARIABLE);
$xtpl->assign('MODULE_NAME', $module_name);
$xtpl->assign('MODULE_UPLOAD', $module_upload);
$xtpl->assign('NV_ASSETS_DIR', NV_ASSETS_DIR);
$xtpl->assign('OP', $op);
$xtpl->assign('ROW', $row);
$disable = '';

if($row['id_prize']){
    $info_prize = $db->query('SELECT * FROM ' . NV_LUCKY . '_prize WHERE id = ' . $row['id_prize'])->fetch();
    $xtpl->assign('prize', $info_prize);
    $xtpl->parse('main.prize');
}

if($row['userid']){
    $disable = 'disabled';
    $info_user_lucky = $db->query('SELECT * FROM ' . $db_config['dbsystem'] . '.' . $db_config['prefix'] . '_users WHERE userid = ' . $row['userid'] . ' AND idsite = ' . $global_config['idsite'])->fetch();
    $xtpl->assign('user_lucky', $info_user_lucky);
    $xtpl->parse('main.user_lucky');
}
if($row['id_lucky']){
    $info_lucky = $db->query('SELECT * FROM ' . NV_LUCKY . ' WHERE id = ' . $row['id_lucky'])->fetch();
    $xtpl->assign('lucky', $info_lucky);
    $xtpl->parse('main.lucky');
}

$xtpl->assign('disabled', $disable);


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
