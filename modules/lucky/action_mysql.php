<?php

/**
 * @Project TMS HOLDINGS
 * @Author TMS HOLDINGS <contact@tms.vn>
 * @Copyright (C) 2022 TMS HOLDINGS. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate Mon, 19 Sep 2022 02:07:56 GMT
 */

if (!defined('NV_IS_FILE_MODULES'))
    die('Stop!!!');

$sql_drop_module = array();
$sql_drop_module[] = "DROP TABLE IF EXISTS " . $db_config['prefix'] . "_" . $module_data . "";
$sql_drop_module[] = "DROP TABLE IF EXISTS " . $db_config['prefix'] . "_" . $module_data . "_audio";
$sql_drop_module[] = "DROP TABLE IF EXISTS " . $db_config['prefix'] . "_" . $module_data . "_config";
$sql_drop_module[] = "DROP TABLE IF EXISTS " . $db_config['prefix'] . "_" . $module_data . "_history";
$sql_drop_module[] = "DROP TABLE IF EXISTS " . $db_config['prefix'] . "_" . $module_data . "_item";
$sql_drop_module[] = "DROP TABLE IF EXISTS " . $db_config['prefix'] . "_" . $module_data . "_prize";
$sql_drop_module[] = "DROP TABLE IF EXISTS " . $db_config['prefix'] . "_" . $module_data . "_register";
$sql_drop_module[] = "DROP TABLE IF EXISTS " . $db_config['prefix'] . "_" . $module_data . "_remaining";
$sql_drop_module[] = "DROP TABLE IF EXISTS " . $db_config['prefix'] . "_" . $module_data . "_special";

$sql_create_module = $sql_drop_module;
$sql_create_module[] = "CREATE TABLE " . $db_config['prefix'] . "_" . $module_data . "(
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255) CHARACTER SET utf8mb3 NOT NULL,
  time_begin int NOT NULL,
  time_end int NOT NULL,
  status int NOT NULL,
  time_add int NOT NULL,
  user_add int NOT NULL,
  image text CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM";

$sql_create_module[] = "CREATE TABLE " . $db_config['prefix'] . "_" . $module_data . "_audio(
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  file text CHARACTER SET utf8mb4 NOT NULL,
  time_add int NOT NULL,
  user_add int NOT NULL,
  status int NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM";

$sql_create_module[] = "CREATE TABLE " . $db_config['prefix'] . "_" . $module_data . "_config(
  id int NOT NULL AUTO_INCREMENT,
  config_name text CHARACTER SET utf8mb4 NOT NULL,
  config_value text CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM";

$sql_create_module[] = "CREATE TABLE " . $db_config['prefix'] . "_" . $module_data . "_history(
  id int NOT NULL AUTO_INCREMENT,
  userid int NOT NULL,
  id_prize int NOT NULL,
  id_lucky int NOT NULL,
  status int NOT NULL,
  time_add int NOT NULL,
  type int NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM";

$sql_create_module[] = "CREATE TABLE " . $db_config['prefix'] . "_" . $module_data . "_item(
  id int NOT NULL AUTO_INCREMENT,
  id_lucky int NOT NULL,
  number float NOT NULL,
  id_prize int NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM";

$sql_create_module[] = "CREATE TABLE " . $db_config['prefix'] . "_" . $module_data . "_prize(
  id int NOT NULL AUTO_INCREMENT,
  image text CHARACTER SET utf8mb3 NOT NULL,
  percent int NOT NULL,
  weight int DEFAULT NULL,
  title varchar(255) CHARACTER SET utf8mb3 NOT NULL,
  status int NOT NULL,
  money text CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM";

$sql_create_module[] = "CREATE TABLE " . $db_config['prefix'] . "_" . $module_data . "_register(
  id int NOT NULL AUTO_INCREMENT,
  sdt text CHARACTER SET utf8mb4 NOT NULL,
  ho_va_ten varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  email text CHARACTER SET utf8mb4 NOT NULL,
  time_add int NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM";

$sql_create_module[] = "CREATE TABLE " . $db_config['prefix'] . "_" . $module_data . "_remaining(
  id int NOT NULL AUTO_INCREMENT,
  remaining int NOT NULL,
  userid int NOT NULL,
  id_lucky int NOT NULL,
  time_end int NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM";

$sql_create_module[] = "CREATE TABLE " . $db_config['prefix'] . "_" . $module_data . "_special(
  id int NOT NULL AUTO_INCREMENT,
  userid int NOT NULL,
  id_prize int NOT NULL,
  id_lucky int NOT NULL,
  number int NOT NULL,
  user_add int NOT NULL,
  time_add int NOT NULL,
  number_ed int DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=MyISAM";

$sql_create_module[] = "INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_config (id, config_name, config_value) VALUES('1', 'title', 'tiêu đề')";
$sql_create_module[] = "INSERT INTO " . $db_config['prefix'] . "_" . $module_data . "_config (id, config_name, config_value) VALUES('2', 'file_music', 'file_music')";
