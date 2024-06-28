<?php

/**
 * @Project TMS HOLDINGS
 * @Author TMS HOLDINGS <contact@tms.vn>
 * @Copyright (C) 2022 TMS HOLDINGS. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate Mon, 19 Sep 2022 02:07:56 GMT
 */

if (!defined('NV_ADMIN'))
    die('Stop!!!');

try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . " (id, name, time_begin, time_end, status, time_add, user_add, image) VALUES('1', 'Chương trình quay thưởng xuyên quốc gia', '1619024400', '1669741200', '3', '1637743204', '2', '/uploads/lucky/xuan-yeu-thuong-02.jpg')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}
try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . " (id, name, time_begin, time_end, status, time_add, user_add, image) VALUES('2', 'Mừng xuân đón tết', '1637859600', '1669741200', '1', '1637911887', '2', '/uploads/lucky/xuan-yeu-thuong-02.jpg')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}
try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . " (id, name, time_begin, time_end, status, time_add, user_add, image) VALUES('3', 'Sofa', '1650646800', '1650733200', '1', '1650601926', '1162', '/uploads/lucky/banknotes-159085_640.png')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}

try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_audio (id, name, file, time_add, user_add, status) VALUES('1', 'tiếng banshee khóc', '/uploads/lucky/audio/i-like-you-very-much-sound-effect-846041259.mp3', '1637897610', '2', '2')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}
try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_audio (id, name, file, time_add, user_add, status) VALUES('2', 'tôi thích hiệu ứng âm thanh của bạn', '/uploads/lucky/audio/banshee-crying-sound-effect-852011028.mp3', '1637909866', '2', '1')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}

try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_history (id, userid, id_prize, id_lucky, status, time_add, type) VALUES('1', '1', '2', '1', '1', '1663468791', '1')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}
try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_history (id, userid, id_prize, id_lucky, status, time_add, type) VALUES('2', '1', '2', '1', '1', '1663468853', '1')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}

try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_item (id, id_lucky, number, id_prize) VALUES('44', '1', '9917', '2')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}
try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_item (id, id_lucky, number, id_prize) VALUES('33', '1', '5', '1')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}
try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_item (id, id_lucky, number, id_prize) VALUES('35', '1', '0', '3')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}
try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_item (id, id_lucky, number, id_prize) VALUES('32', '1', '1', '6')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}
try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_item (id, id_lucky, number, id_prize) VALUES('38', '1', '0', '5')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}
try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_item (id, id_lucky, number, id_prize) VALUES('36', '1', '9994', '7')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}
try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_item (id, id_lucky, number, id_prize) VALUES('37', '1', '3', '4')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}
try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_item (id, id_lucky, number, id_prize) VALUES('45', '1', '0', '8')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}

try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_prize (id, image, percent, weight, title, status, money) VALUES('1', '/uploads/lucky/20200919145403-ao-mua-tolsen-45097.png', '5', '', 'Áo mưa', '1', '50000')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}
try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_prize (id, image, percent, weight, title, status, money) VALUES('2', '/uploads/lucky/t-shirt-153370_960_720.png', '90', '', 'Áo thun', '1', '30000')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}
try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_prize (id, image, percent, weight, title, status, money) VALUES('3', '/uploads/lucky/pro-x-keyboard-gallery-1.png', '5', '', 'Bàn phím gaming', '1', '1100000')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}
try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_prize (id, image, percent, weight, title, status, money) VALUES('4', '/uploads/lucky/unnamed.png', '5', '', 'Chuột gaming', '1', '300000')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}
try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_prize (id, image, percent, weight, title, status, money) VALUES('5', '/uploads/lucky/b997b349f3e3bb8ec05397dfb22d1c99.png', '20', '', 'Lốc nước ngọt', '1', '30000')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}
try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_prize (id, image, percent, weight, title, status, money) VALUES('6', '/uploads/lucky/banknotes-159085_640.png', '5', '', '200,000 tiền mặt', '1', '200000')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}
try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_prize (id, image, percent, weight, title, status, money) VALUES('7', '/uploads/lucky/miss.png', '10', '', 'Chúc bạn may mắn lần sau', '1', '0')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}
try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_prize (id, image, percent, weight, title, status, money) VALUES('8', '/uploads/lucky/banknotes-159085_640.png', '1', '', '1 tỉ đồng', '1', '1000000000')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}

try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_special (id, userid, id_prize, id_lucky, number, user_add, time_add, number_ed) VALUES('5', '1', '3', '1', '3', '1', '1663468694', '4')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}
try {
    $db->query("INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_special (id, userid, id_prize, id_lucky, number, user_add, time_add, number_ed) VALUES('4', '1', '8', '1', '3', '1', '1663468675', '4')");
} catch (PDOException $e) {
    trigger_error($e->getMessage());
}
