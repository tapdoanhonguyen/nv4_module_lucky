<?php

/**
 * TMS Content Management System
 * @version 4.x
 * @author TMS Holdings <contact@thuongmaiso.vn>
 * @copyright (C) 2009-2021 TMS Holdings. All rights reserved
 * @license GNU/GPL version 2 or any later version
 * @see https://github.com/nukeviet The TMS Holdings GitHub project
 */
$mod = $nv_Request->get_string( 'mod', 'get,post', '' );


if($mod=="send_email"){
    $id_lucky=$nv_Request->get_string('id_lucky', 'get','');
    $id_prize=$nv_Request->get_string('id_prize', 'get','');
    $status=$nv_Request->get_string('status', 'get','');
    $userid = '';
    $type = 1;
    if($user_info['userid']){
        $userid = $user_info['userid'];
        $type = 1;

    }else{
        $userid = $db->query('SELECT id FROM ' . NV_LUCKY . '_register WHERE sdt = "' . $_SESSION['sdt'] . '"')->fetchColumn();
        $type = 2;
    }

    $info_item = $db->query('SELECT * FROM ' . NV_LUCKY . '_item WHERE id_lucky = ' . $id_lucky . ' AND id_prize = ' . $id_prize)->fetch();
    $info_item['number_remaining'] = $info_item['number'] - 1;

    $user_name = '';
    $phone = '';
    $email = '';
    if($user_info['userid']){
        $user_name = $user_info['first_name'] . $user_info['last_name'];
        $phone = $user_info['phone'];
        $email = $user_info['email'];
    }else{
        $user_name = $_SESSION['ho_va_ten'];
        $phone = $_SESSION['sdt'];
        $email = $_SESSION['email'];
    }
    $info_prize = $db->query('SELECT * FROM ' . NV_LUCKY . '_prize WHERE id = ' . $id_prize)->fetch();
    $info_lucky = $db->query('SELECT * FROM ' . NV_LUCKY . ' WHERE id = ' . $id_lucky)->fetch();

    if($info_prize['money'] > 0){
        $email_contents = '<h2 style="text-align: center;color: red;">
        Bạn đã quay trúng " ' . $info_prize['title'] . '"
        </h2>
        <div style="text-align: center;">
        <img src = "' . $_SERVER['HTTP_ORIGIN'] . NV_BASE_SITEURL . $info_prize['image'] . '" alt="' . $info_prize['title'] . '" title="' . $info_prize['title'] . '" style="height: 70px;">
        </div>
        <div>
        Chúng tôi sẽ liên hệ với bạn trong vòng 24 giờ để trao giải thưởng
        <div>
        <div>
        Tên chương trình: <span style="color: #3A36D0;font-size: 16px;">' . $info_lucky['name'] . '</span>
        </div>
        <div>
        Thời gian bắt đầu: ' . date('d-m-Y ',$info_lucky['time_begin']) . '
        </div>
        <div>
        Thời gian kết thúc: ' . date('d-m-Y ',$info_lucky['time_end']) . '
        </div>
        </div>
        </div>';
        $email_title = 'Thông báo trúng thưởng';

        nv_sendmail(array($global_config['site_name'], $global_config['sender_email']), $email, sprintf($email_title), $email_contents);

        // $email_contents1 = '<h2 style="text-align: center;color: red;">
        // Khách hàng ' . $user_name . ' đã quay trúng " ' . $info_prize['title'] . '"
        // </h2>
        // <div style="text-align: center;">
        // <img src = "' . $_SERVER['HTTP_ORIGIN'] . NV_BASE_SITEURL . $info_prize['image'] . '" alt="' . $info_prize['title'] . '" title="' . $info_prize['title'] . '" style="height: 70px;">
        // </div>
        // <div>
        // Thông tin trao thưởng:
        // <div>
        // <div>
        // Họ và tên: <span style="color: #3A36D0;font-size: 14px;">' .$user_name . '</span>
        // </div>
        // <div>
        // Số điện thoại: ' . $phone . '
        // </div>
        // <div>
        // Email: ' . $email . '
        // </div>
        // <div>
        // Tên chương trình: <span style="color: #3A36D0;font-size: 16px;">' . $info_lucky['name'] . '</span>
        // </div>
        // <div>
        // Thời gian bắt đầu: ' . date('d-m-Y ',$info_lucky['time_begin']) . '
        // </div>
        // <div>
        // Thời gian kết thúc: ' . date('d-m-Y ',$info_lucky['time_end']) . '
        // </div>
        // </div>
        // </div>';
        // $email_title1 = 'Thông báo trúng thưởng';

        // nv_sendmail(array($global_config['site_name'], $global_config['sender_email']), $global_config['site_email'], sprintf($email_title1), $email_contents1);
    }


    $json[] = ['status'=>'OK', 'text'=>'Lưu thành công'];
    print_r(json_encode($json[0]));die(); 
}
if($mod=="save_lucky"){
    $id_lucky=$nv_Request->get_string('id_lucky', 'get','');
    $id_prize=$nv_Request->get_string('id_prize', 'get','');
    $status=$nv_Request->get_string('status', 'get','');
    $userid = '';
    $type = 1;
    if($user_info['userid']){
        $userid = $user_info['userid'];
        $type = 1;
        $check_remaining = $db->query('SELECT remaining FROM ' . NV_LUCKY . '_remaining WHERE userid = ' . $user_info['userid'] . ' AND time_end > ' . NV_CURRENTTIME)->fetchColumn();
        $remaining= $check_remaining - 1 ;
        $db->query('UPDATE ' . NV_LUCKY . '_remaining SET remaining = ' . $remaining . ' WHERE userid = ' . $user_info['userid'] . ' AND id_lucky = ' . $id_lucky);
    }else{
        $userid = $db->query('SELECT id FROM ' . NV_LUCKY . '_register WHERE sdt = "' . $_SESSION['sdt'] . '"')->fetchColumn();
        $type = 2;
    }
    $db->query('INSERT INTO ' . NV_LUCKY . '_history (userid,id_prize,id_lucky,status,time_add,type) VALUES (' . $userid . ',' . $id_prize . ',' . $id_lucky . ',' . $status . ',' . NV_CURRENTTIME . ',' . $type . ')');
    $info_item = $db->query('SELECT * FROM ' . NV_LUCKY . '_item WHERE id_lucky = ' . $id_lucky . ' AND id_prize = ' . $id_prize)->fetch();
    $info_item['number_remaining'] = $info_item['number'] - 1;
    $db->query('UPDATE ' . NV_LUCKY . '_item SET number = ' . $info_item['number_remaining'] . ' WHERE id_prize = ' . $id_prize . ' AND id_lucky = ' . $id_lucky);
    if($user_info['userid']){
        $you_are_lucky = $db->query('SELECT * FROM ' . NV_LUCKY . '_special WHERE userid = ' . $user_info['userid'] . ' AND number > 0 AND id_lucky = ' . $id_lucky)->fetch();

        
        if($you_are_lucky){
            $number_ed=$you_are_lucky['number_ed']+1;
            $number= $you_are_lucky['number'] - 1 ;
            $db->query('UPDATE ' . NV_LUCKY . '_special SET number = ' . $number . ', number_ed = ' . $number_ed . ' WHERE userid = ' . $user_info['userid'] . ' AND id_lucky = ' . $id_lucky);
        }
    }
    $user_name = '';
    $phone = '';
    $email = '';
    if($user_info['userid']){
        $user_name = $user_info['first_name'] . $user_info['last_name'];
        $phone = $user_info['phone'];
        $email = $user_info['email'];
    }else{
        $user_name = $_SESSION['ho_va_ten'];
        $phone = $_SESSION['sdt'];
        $email = $_SESSION['email'];
    }
    $info_prize = $db->query('SELECT * FROM ' . NV_LUCKY . '_prize WHERE id = ' . $id_prize)->fetch();
    $info_lucky = $db->query('SELECT * FROM ' . NV_LUCKY . ' WHERE id = ' . $id_lucky)->fetch();

    // if($info_prize['money'] > 0){
    //     $email_contents = '<h2 style="text-align: center;color: red;">
    //     Bạn đã quay trúng " ' . $info_prize['title'] . '"
    //     </h2>
    //     <div style="text-align: center;">
    //     <img src = "' . $_SERVER['HTTP_ORIGIN'] . NV_BASE_SITEURL . $info_prize['image'] . '" alt="' . $info_prize['title'] . '" title="' . $info_prize['title'] . '" style="height: 70px;">
    //     </div>
    //     <div>
    //     Chúng tôi sẽ liên hệ với bạn trong vòng 24 giờ để trao giải thưởng
    //     <div>
    //     <div>
    //     Tên chương trình: <span style="color: #3A36D0;font-size: 16px;">' . $info_lucky['name'] . '</span>
    //     </div>
    //     <div>
    //     Thời gian bắt đầu: ' . date('d-m-Y ',$info_lucky['time_begin']) . '
    //     </div>
    //     <div>
    //     Thời gian kết thúc: ' . date('d-m-Y ',$info_lucky['time_end']) . '
    //     </div>
    //     </div>
    //     </div>';
    //     $email_title = 'Thông báo trúng thưởng';

    //     nv_sendmail(array($global_config['site_name'], $global_config['sender_email']), $email, sprintf($email_title), $email_contents);

    //     $email_contents1 = '<h2 style="text-align: center;color: red;">
    //     Khách hàng ' . $user_name . ' đã quay trúng " ' . $info_prize['title'] . '"
    //     </h2>
    //     <div style="text-align: center;">
    //     <img src = "' . $_SERVER['HTTP_ORIGIN'] . NV_BASE_SITEURL . $info_prize['image'] . '" alt="' . $info_prize['title'] . '" title="' . $info_prize['title'] . '" style="height: 70px;">
    //     </div>
    //     <div>
    //     Thông tin trao thưởng:
    //     <div>
    //     <div>
    //     Họ và tên: <span style="color: #3A36D0;font-size: 14px;">' .$user_name . '</span>
    //     </div>
    //     <div>
    //     Số điện thoại: ' . $phone . '
    //     </div>
    //     <div>
    //     Email: ' . $email . '
    //     </div>
    //     <div>
    //     Tên chương trình: <span style="color: #3A36D0;font-size: 16px;">' . $info_lucky['name'] . '</span>
    //     </div>
    //     <div>
    //     Thời gian bắt đầu: ' . date('d-m-Y ',$info_lucky['time_begin']) . '
    //     </div>
    //     <div>
    //     Thời gian kết thúc: ' . date('d-m-Y ',$info_lucky['time_end']) . '
    //     </div>
    //     </div>
    //     </div>';
    //     $email_title1 = 'Thông báo trúng thưởng';

    //     nv_sendmail(array($global_config['site_name'], $global_config['sender_email']), $global_config['site_email'], sprintf($email_title1), $email_contents1);
    // }


    $json[] = ['status'=>'OK', 'text'=>'Lưu thành công'];
    print_r(json_encode($json[0]));die(); 
}

if($mod=="check_user"){
    if($user_info['userid']){
       $json[] = ['status'=>'OK', 'text'=>'Đã đăng nhập'];
   }else{
    if($_SESSION['ho_va_ten']){
        $json[] = ['status'=>'OK', 'text'=>'Đã lưu thông tin'];
    }else{
        $json[] = ['status'=>'KO', 'text'=>'Chưa có thông tin'];
    }
}


print_r(json_encode($json[0]));die(); 
}
if($mod=="save_session"){

    $ho_va_ten=$nv_Request->get_string('ho_va_ten', 'get','');
    $sdt=$nv_Request->get_string('sdt', 'get','');
    $email=$nv_Request->get_string('email', 'get','');

    $_SESSION['ho_va_ten'] = $ho_va_ten;
    $_SESSION['sdt'] = $sdt;
    $_SESSION['email'] = $email;

    $db->query('INSERT INTO ' . NV_LUCKY . '_register (sdt,ho_va_ten,email,time_add) VALUES ("' . $sdt . '","' . $ho_va_ten . '","' . $email . '",' . NV_CURRENTTIME . ')');
    $json[] = ['status'=>'OK', 'text'=>'Đăng ký thông tin thành công!'];
    print_r(json_encode($json[0]));die(); 
}
$xtpl = new XTemplate('main.tpl', NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/modules/' . $module_file);
$xtpl->assign('LANG', $lang_module);
$xtpl->assign('NV_LANG_VARIABLE', NV_LANG_VARIABLE);
$xtpl->assign('NV_LANG_DATA', NV_LANG_DATA);
$xtpl->assign('NV_BASE_SITENURL', NV_BASE_SITEURL);
$xtpl->assign('NV_NAME_VARIABLE', NV_NAME_VARIABLE);
$xtpl->assign('NV_OP_VARIABLE', NV_OP_VARIABLE);
$xtpl->assign('MODULE_NAME', $module_name);
$xtpl->assign('MODULE_UPLOAD', $module_upload);
$xtpl->assign('NV_ASSETS_DIR', NV_ASSETS_DIR);
$xtpl->assign('OP', $op);

$xtpl->assign('audio', $db->query('SELECT file FROM ' . NV_LUCKY . '_audio WHERE status = 2')->fetchColumn());
$xtpl->assign('audio1', NV_BASE_SITEURL . 'themes/default/audio/stop.mp3');
$list_lucky_history = $db->query('SELECT t1.*,t2.money FROM ' . NV_LUCKY . '_history t1 INNER JOIN ' . NV_LUCKY . '_prize t2 ON t1.id_prize = t2.id ORDER BY t2.money DESC limit 10')->fetchAll();

$list_lucky_auto = $db->query('SELECT t1.*,t2.money FROM ' . NV_LUCKY . '_history t1 INNER JOIN ' . NV_LUCKY . '_prize t2 ON t1.id_prize = t2.id ORDER BY t1.time_add DESC limit 10')->fetchAll();

usort($list_lucky_history, function($a, $b) {
    return $b['money'] <=> $a['money'];
});


foreach ($list_lucky_auto as $key_hs1 => $history1) {
    $history1['time_add'] = date('d-m-Y',$history1['time_add']);
    if($history1['type'] == 1){
        $history1['info_user'] = $db->query('SELECT * FROM ' . $db_config['dbsystem'] . '.' . $db_config['prefix'] . '_users WHERE userid = ' . $history1['userid'] . ' AND idsite = ' . $global_config['idsite'])->fetch(); 
    }else{
        $history1['info_user'] = $db->query('SELECT * FROM ' . NV_LUCKY . '_register WHERE id = ' . $history1['userid'])->fetch(); 
        $history1['info_user']['phone'] = $history1['info_user']['sdt'];
        $history1['info_user']['first_name'] = $history1['info_user']['ho_va_ten'];
    }

    $history1['info_prize'] = $db->query('SELECT * FROM ' . NV_LUCKY . '_prize WHERE id = ' . $history1['id_prize'])->fetch();
    $history1['info_lucky'] = $db->query('SELECT * FROM ' . NV_LUCKY . ' WHERE id = ' . $history1['id_lucky'])->fetch();
    $history1['info_prize']['money'] = number_format($history1['info_prize']['money']);
    if($history1['info_user']['phone']){
       $history1['info_user']['phone'] = substr($history1['info_user']['phone'], -10, 7) . '***';
   }else{
    $history1['info_user']['phone'] = '***';
}

$xtpl->assign('HISTORY1', $history1);
$xtpl->parse('main.history1');
}



foreach ($list_lucky_history as $key_hs => $history) {

    $history['time_add'] = date('d-m-Y',$history['time_add']);
    if($history['type'] == 1){
        $history['info_user'] = $db->query('SELECT * FROM ' . $db_config['dbsystem'] . '.' . $db_config['prefix'] . '_users WHERE userid = ' . $history['userid'] . ' AND idsite = ' . $global_config['idsite'])->fetch();
    }else{

        $history['info_user'] = $db->query('SELECT * FROM ' . NV_LUCKY . '_register WHERE id = ' . $history['userid'])->fetch();

        $history['info_user']['phone'] = $history['info_user']['sdt'];
        $history['info_user']['first_name'] = $history['info_user']['ho_va_ten'];
    }
    $history['info_prize'] = $db->query('SELECT * FROM ' . NV_LUCKY . '_prize WHERE id = ' . $history['id_prize'])->fetch();
    $history['info_lucky'] = $db->query('SELECT * FROM ' . NV_LUCKY . ' WHERE id = ' . $history['id_lucky'])->fetch();
    $history['info_prize']['money'] = number_format($history['info_prize']['money']);
    if($history['info_user']['phone']){
       $history['info_user']['phone'] = substr($history['info_user']['phone'], -10, 7) . '***';
   }else{
    $history['info_user']['phone'] = '***';
}

$xtpl->assign('HISTORY', $history);
$xtpl->parse('main.history');
}

$info_lucky = $db->query('SELECT * FROM ' . NV_LUCKY . ' WHERE status = 3')->fetch();

$list_prize = $db->query('SELECT t2.*,t1.number FROM ' . NV_LUCKY . '_item t1 INNER JOIN ' . NV_LUCKY . '_prize t2 ON t1.id_prize = t2.id WHERE t1.id_lucky = ' . $info_lucky['id'] . ' ORDER BY percent DESC')->fetchAll();
if($list_prize){
    if($user_info['userid']){
        $check_number = 0;
        $you_are_lucky = $db->query('SELECT * FROM ' . NV_LUCKY . '_special WHERE userid = ' . $user_info['userid'] . ' AND number > 0 AND id_lucky = ' . $info_lucky['id'])->fetch();
        if($you_are_lucky){
            $check_number = $db->query('SELECT number FROM ' . NV_LUCKY . '_item WHERE id_lucky = ' . $info_lucky['id'] . ' AND id_prize = ' . $you_are_lucky['id_prize'])->fetchColumn();
        }



    }
    $special = 0;
    $stt = 0;


    $stt1 = 0;
    foreach ($list_prize as $key => $value) {
        $value['percent'] = $value['percent']/100;

        $index = 0;
        for ($i=$stt1; $i >= 0 ; $i--) { 
            if($you_are_lucky){
                if($value['id'] == $you_are_lucky['id_prize']){
                    $special = $index;

                } 
            }

            if($i==$stt1){
                $xtpl->assign('i', $i);
                $xtpl->parse('main.prize.loop1.loop11');
            }else{
                $xtpl->assign('i', $i);
                $xtpl->parse('main.prize.loop1.loop12');
            }

            $xtpl->assign('i', $i);
            $xtpl->assign('INDEX', $index);
            $index++;
        }
        $xtpl->assign('PRIZE', $value);
        $xtpl->assign('COUNT', count($list_prize));
        $xtpl->assign('info_lucky', $info_lucky);
        $xtpl->parse('main.prize.loop');
        $xtpl->parse('main.prize.loop1');
        $stt++;
        $stt1++;

    }


    if($you_are_lucky && $check_number > 0){

        $xtpl->assign('you_are_lucky', $special);
        $xtpl->parse('main.prize.you_are_lucky');
    }else{
        $xtpl->assign('you_are_lucky', $you_are_lucky);
        $xtpl->parse('main.prize.you_not_lucky');
    }

    $xtpl->parse('main.prize');
}

$xtpl->assign('info_lucky', $info_lucky);
// if($user_info['userid']){

//     $check_remaining = $db->query('SELECT remaining FROM ' . NV_LUCKY . '_remaining WHERE userid = ' . $user_info['userid'] . ' AND time_end > ' . NV_CURRENTTIME . ' AND id_lucky = ' . $info_lucky['id'])->fetchColumn();

//     if($check_remaining > 0){
//         $xtpl->parse('main.da_dang_nhap');
//     }else{
//         $xtpl->parse('main.het_luot_quay');
//     }
// }else{
//     if($_SESSION['ho_va_ten']){
//         $xtpl->parse('main.da_dang_nhap');
//     }else{
//         $xtpl->parse('main.chua_dang_nhap');
//     }

// }


if($_SESSION['ho_va_ten']){
    $xtpl->parse('main.da_dang_nhap');
    $xtpl->parse('main.da_dang_nhap1');
}else{
    $xtpl->parse('main.chua_dang_nhap');
    $xtpl->parse('main.chua_dang_nhap1');
}




$xtpl->assign('user_info', $user_info);

$xtpl->assign('remaining', $check_remaining);

$xtpl->parse('main');
$contents = $xtpl->text('main');

$page_title = 'Vòng quay may mắn';

include NV_ROOTDIR . '/includes/header.php';
echo nv_site_theme($contents);
include NV_ROOTDIR . '/includes/footer.php';
